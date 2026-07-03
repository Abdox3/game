using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.Events;

public enum GameState
{
    Setup,
    RoundStart,
    Placement,
    Combat,
    GameOver
}

public class GameManager : MonoBehaviour
{
    public static GameManager Instance { get; private set; }

    [Header("Hero Settings")]
    public int startHeroHP = 100;
    public int playerHeroHP;
    public int opponentHeroHP;

    [Header("Decks and Hands")]
    public List<Card> playerDeck = new List<Card>();
    public List<Card> opponentDeck = new List<Card>();
    public List<Card> playerHand = new List<Card>();
    public List<Card> opponentHand = new List<Card>();

    [Header("Playground Slots (0 to 4)")]
    public Card[] playerSlots = new Card[5];
    public Card[] opponentSlots = new Card[5];

    [Header("Game State")]
    public GameState currentState;
    public int currentRound = 1;

    [Header("Events")]
    public UnityEvent onStateChanged;
    public UnityEvent onLogUpdated;

    public List<string> combatLog = new List<string>();

    private void Awake()
    {
        if (Instance == null) Instance = this;
        else Destroy(gameObject);
    }

    private void Start()
    {
        StartGame();
    }

    public void StartGame()
    {
        playerHeroHP = startHeroHP;
        opponentHeroHP = startHeroHP;
        currentRound = 1;
        combatLog.Clear();

        // 1. Generate sample decks
        GenerateSampleDecks();

        // 2. Initial draw (5 cards)
        DrawInitialHands();

        Log("Game Started! Round 1 begins.");
        SetState(GameState.RoundStart);
    }

    private void SetState(GameState newState)
    {
        currentState = newState;
        onStateChanged?.Invoke();

        if (currentState == GameState.RoundStart)
        {
            StartCoroutine(RoundStartSequence());
        }
        else if (currentState == GameState.Combat)
        {
            StartCoroutine(CombatSequence());
        }
    }

    private void Log(string message)
    {
        combatLog.Add(message);
        onLogUpdated?.Invoke();
        Debug.Log(message);
    }

    private IEnumerator RoundStartSequence()
    {
        Log($"--- Round {currentRound} Start ---");

        // 1. Tick down spawn delay for cards in hands
        foreach (var card in playerHand)
        {
            if (card.currentSpawnDelay > 0)
            {
                card.currentSpawnDelay--;
                Log($"Player's {card.cardName} delay reduced to {card.currentSpawnDelay}.");
            }
        }
        foreach (var card in opponentHand)
        {
            if (card.currentSpawnDelay > 0)
            {
                card.currentSpawnDelay--;
            }
        }

        // 2. Draw up to 5 cards if possible
        DrawCardsToFillHand(playerDeck, playerHand, "Player");
        DrawCardsToFillHand(opponentDeck, opponentHand, "Opponent");

        yield return new WaitForSeconds(1.5f);
        SetState(GameState.Placement);
    }

    private void DrawInitialHands()
    {
        for (int i = 0; i < 5; i++)
        {
            if (playerDeck.Count > 0)
            {
                playerHand.Add(playerDeck[0]);
                playerDeck.RemoveAt(0);
            }
            if (opponentDeck.Count > 0)
            {
                opponentHand.Add(opponentDeck[0]);
                opponentDeck.RemoveAt(0);
            }
        }
    }

    private void DrawCardsToFillHand(List<Card> deck, List<Card> hand, string ownerName)
    {
        while (hand.Count < 5 && deck.Count > 0)
        {
            Card drawn = deck[0];
            deck.RemoveAt(0);
            hand.Add(drawn);
            Log($"{ownerName} draws {drawn.cardName} (Delay: {drawn.currentSpawnDelay} rounds).");
        }
    }

    public bool DeployCard(Card card, int slotIndex, bool isPlayer)
    {
        if (currentState != GameState.Placement) return false;
        if (slotIndex < 0 || slotIndex >= 5) return false;

        if (isPlayer)
        {
            if (playerSlots[slotIndex] != null) return false;
            if (card.currentSpawnDelay > 0) return false;

            playerSlots[slotIndex] = card;
            playerHand.Remove(card);
            Log($"Player deployed {card.cardName} to Slot {slotIndex + 1}.");
            onStateChanged?.Invoke();
            return true;
        }
        else
        {
            if (opponentSlots[slotIndex] != null) return false;
            if (card.currentSpawnDelay > 0) return false;

            opponentSlots[slotIndex] = card;
            opponentHand.Remove(card);
            Log($"Opponent deployed {card.cardName} to Slot {slotIndex + 1}.");
            onStateChanged?.Invoke();
            return true;
        }
    }

    public void EndPlacementPhase()
    {
        if (currentState != GameState.Placement) return;

        // Run bot AI deployment
        RunBotAI();

        SetState(GameState.Combat);
    }

    private void RunBotAI()
    {
        Log("Opponent (Bot) is placing cards...");
        List<Card> deployable = new List<Card>();
        foreach (var c in opponentHand)
        {
            if (c.currentSpawnDelay == 0) deployable.Add(c);
        }

        // Try to deploy each deployable card to an empty slot
        foreach (var card in deployable)
        {
            // Find empty slot
            for (int i = 0; i < 5; i++)
            {
                if (opponentSlots[i] == null)
                {
                    DeployCard(card, i, false);
                    break;
                }
            }
        }
    }

    private IEnumerator CombatSequence()
    {
        Log("--- Combat Phase ---");
        yield return new WaitForSeconds(1.0f);

        for (int i = 0; i < 5; i++)
        {
            Card pCard = playerSlots[i];
            Card oCard = opponentSlots[i];

            if (pCard != null && oCard != null)
            {
                // Clash
                Log($"Slot {i + 1}: Player's {pCard.cardName} (ATK: {pCard.currentATK}) attacks Opponent's {oCard.cardName} (ATK: {oCard.currentATK}).");
                pCard.TakeDamage(oCard.currentATK);
                oCard.TakeDamage(pCard.currentATK);

                yield return new WaitForSeconds(1.0f);

                if (pCard.currentHP <= 0)
                {
                    Log($"Player's {pCard.cardName} was destroyed!");
                    playerSlots[i] = null;
                }
                if (oCard.currentHP <= 0)
                {
                    Log($"Opponent's {oCard.cardName} was destroyed!");
                    opponentSlots[i] = null;
                }
            }
            else if (pCard != null && oCard == null)
            {
                // Attack Hero directly
                Log($"Slot {i + 1}: Player's {pCard.cardName} attacks Opponent Hero directly for {pCard.currentATK} damage!");
                opponentHeroHP -= pCard.currentATK;
                if (opponentHeroHP < 0) opponentHeroHP = 0;
                yield return new WaitForSeconds(1.0f);
            }
            else if (oCard != null && pCard == null)
            {
                // Attack Hero directly
                Log($"Slot {i + 1}: Opponent's {oCard.cardName} attacks Player Hero directly for {oCard.currentATK} damage!");
                playerHeroHP -= oCard.currentATK;
                if (playerHeroHP < 0) playerHeroHP = 0;
                yield return new WaitForSeconds(1.0f);
            }

            onStateChanged?.Invoke();

            if (CheckGameOver())
            {
                SetState(GameState.GameOver);
                yield break;
            }
        }

        currentRound++;
        SetState(GameState.RoundStart);
    }

    private bool CheckGameOver()
    {
        if (playerHeroHP <= 0)
        {
            Log("Game Over! Opponent wins.");
            return true;
        }
        if (opponentHeroHP <= 0)
        {
            Log("Victory! Player wins.");
            return true;
        }

        // Check if all cards are destroyed (Win condition 2)
        bool playerHasCards = HasRemainingCards(playerSlots, playerHand, playerDeck);
        bool opponentHasCards = HasRemainingCards(opponentSlots, opponentHand, opponentDeck);

        if (!playerHasCards && !opponentHasCards)
        {
            Log("Game Over! It's a draw (no cards left on both sides).");
            return true;
        }
        if (!playerHasCards)
        {
            Log("Game Over! Player has no cards left. Opponent wins.");
            return true;
        }
        if (!opponentHasCards)
        {
            Log("Victory! Opponent has no cards left. Player wins.");
            return true;
        }

        return false;
    }

    private bool HasRemainingCards(Card[] slots, List<Card> hand, List<Card> deck)
    {
        foreach (var c in slots)
        {
            if (c != null) return true;
        }
        if (hand.Count > 0) return true;
        if (deck.Count > 0) return true;
        return false;
    }

    private void GenerateSampleDecks()
    {
        playerDeck.Clear();
        opponentDeck.Clear();

        // Add 12 cards to player deck
        playerDeck.Add(new Card("Chrono-Sentinel", Faction.Ironclad, 15, 60, 3, 30) { hasShield = true });
        playerDeck.Add(new Card("Tower Knight", Faction.Ironclad, 10, 80, 2, 10) { hasTaunt = true });
        playerDeck.Add(new Card("Alloy Golem", Faction.Ironclad, 20, 100, 4, 60));
        playerDeck.Add(new Card("Thornwall", Faction.Verdant, 5, 90, 1, 10) { hasTaunt = true });
        playerDeck.Add(new Card("Grove Warden", Faction.Verdant, 18, 70, 2, 40));
        playerDeck.Add(new Card("Mamluk Vanguard", Faction.AlNoor, 25, 50, 0, 1) { hasHaste = true });
        playerDeck.Add(new Card("Sandstorm Caller", Faction.AlNoor, 12, 55, 3, 30));
        playerDeck.Add(new Card("Cinder Drake", Faction.Ember, 30, 40, 3, 10));
        playerDeck.Add(new Card("Phoenix Automaton", Faction.Ember, 22, 60, 2, 30));
        playerDeck.Add(new Card("Eclipse Shade", Faction.Phantom, 16, 45, 1, 10));
        playerDeck.Add(new Card("Void Sentinel", Faction.Phantom, 20, 75, 3, 60));
        playerDeck.Add(new Card("Rust Automaton", Faction.Neutral, 14, 50, 1, 1));

        // Add 12 cards to opponent deck
        opponentDeck.Add(new Card("Steel Defender", Faction.Ironclad, 10, 75, 2, 10) { hasTaunt = true });
        opponentDeck.Add(new Card("Kinetic Sentinel", Faction.Ironclad, 18, 55, 3, 30));
        opponentDeck.Add(new Card("Bramble Beast", Faction.Verdant, 15, 65, 2, 10));
        opponentDeck.Add(new Card("Sylvan Oak", Faction.Verdant, 8, 100, 4, 60));
        opponentDeck.Add(new Card("Bedouin Scout", Faction.AlNoor, 14, 40, 0, 1) { hasHaste = true });
        opponentDeck.Add(new Card("Solar Construct", Faction.AlNoor, 22, 50, 2, 30));
        opponentDeck.Add(new Card("Flame Spinner", Faction.Ember, 25, 45, 3, 10));
        opponentDeck.Add(new Card("Magma Giant", Faction.Ember, 35, 90, 5, 60));
        opponentDeck.Add(new Card("Phantasm Anchor", Faction.Phantom, 12, 85, 3, 30) { hasShield = true });
        opponentDeck.Add(new Card("Specter Shade", Faction.Phantom, 20, 40, 1, 10));
        opponentDeck.Add(new Card("Stone Automaton", Faction.Neutral, 15, 60, 2, 1));
        opponentDeck.Add(new Card("Bronze Defender", Faction.Neutral, 11, 70, 1, 10));

        // Shuffle decks
        Shuffle(playerDeck);
        Shuffle(opponentDeck);
    }

    private void Shuffle<T>(List<T> list)
    {
        int n = list.Count;
        while (n > 1)
        {
            n--;
            int k = Random.Range(0, n + 1);
            T value = list[k];
            list[k] = list[n];
            list[n] = value;
        }
    }
}
