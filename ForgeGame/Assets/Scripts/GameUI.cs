using System.Collections;
using System.Collections.Generic;
using UnityEngine;
using UnityEngine.UI;

public class GameUI : MonoBehaviour
{
    [Header("Hero UI")]
    public Text playerHeroHPText;
    public Text opponentHeroHPText;

    [Header("Round & Status UI")]
    public Text roundText;
    public Text stateText;

    [Header("Hand Cards UI")]
    public Transform handPanel;
    public GameObject cardPrefab;

    [Header("Slots UI")]
    public Button[] playerSlotButtons = new Button[5];
    public Text[] playerSlotTexts = new Text[5];
    public Text[] opponentSlotTexts = new Text[5];

    [Header("Log UI")]
    public Text logText;
    public ScrollRect logScrollRect;

    [Header("Control Buttons")]
    public Button endTurnButton;
    public Button restartButton;
    public GameObject gameOverPanel;
    public Text winnerText;

    private Card selectedHandCard = null;

    private void Start()
    {
        // Add listeners
        endTurnButton.onClick.AddListener(OnEndTurnClicked);
        restartButton.onClick.AddListener(OnRestartClicked);

        for (int i = 0; i < 5; i++)
        {
            int index = i;
            playerSlotButtons[i].onClick.AddListener(() => OnSlotClicked(index));
        }

        GameManager.Instance.onStateChanged.AddListener(UpdateUI);
        GameManager.Instance.onLogUpdated.AddListener(UpdateLogs);

        UpdateUI();
        UpdateLogs();
    }

    private void UpdateUI()
    {
        var gm = GameManager.Instance;

        // Update HP
        playerHeroHPText.text = $"Player Hero HP: {gm.playerHeroHP}";
        opponentHeroHPText.text = $"Opponent Hero HP: {gm.opponentHeroHP}";

        // Update Round & State
        roundText.text = $"ROUND {gm.currentRound}";
        stateText.text = $"Phase: {gm.currentState}";

        // Update Slots
        for (int i = 0; i < 5; i++)
        {
            Card pCard = gm.playerSlots[i];
            if (pCard != null)
            {
                playerSlotTexts[i].text = $"{pCard.cardName}\nHP: {pCard.currentHP}\nATK: {pCard.currentATK}";
            }
            else
            {
                playerSlotTexts[i].text = "[ Empty ]";
            }

            Card oCard = gm.opponentSlots[i];
            if (oCard != null)
            {
                opponentSlotTexts[i].text = $"{oCard.cardName}\nHP: {oCard.currentHP}\nATK: {oCard.currentATK}";
            }
            else
            {
                opponentSlotTexts[i].text = "[ Empty ]";
            }
        }

        // Render Hand Cards
        foreach (Transform child in handPanel)
        {
            Destroy(child.gameObject);
        }

        foreach (var card in gm.playerHand)
        {
            GameObject cardObj = Instantiate(cardPrefab, handPanel);
            
            // Set details
            Text nameTxt = cardObj.transform.Find("NameText")?.GetComponent<Text>();
            Text statsTxt = cardObj.transform.Find("StatsText")?.GetComponent<Text>();
            Text delayTxt = cardObj.transform.Find("DelayText")?.GetComponent<Text>();
            Image bgImage = cardObj.GetComponent<Image>();

            if (nameTxt != null) nameTxt.text = card.cardName;
            if (statsTxt != null) statsTxt.text = $"ATK: {card.currentATK} HP: {card.currentHP}";
            if (delayTxt != null) delayTxt.text = card.currentSpawnDelay > 0 ? $"Delay: {card.currentSpawnDelay}" : "Ready!";

            // Highlight selected card
            if (card == selectedHandCard)
            {
                if (bgImage != null) bgImage.color = Color.yellow;
            }
            else
            {
                if (bgImage != null) bgImage.color = card.currentSpawnDelay > 0 ? Color.gray : Color.white;
            }

            // Click listener
            Button btn = cardObj.GetComponent<Button>();
            if (btn != null)
            {
                Card capturedCard = card;
                btn.onClick.AddListener(() => OnHandCardClicked(capturedCard));
            }
        }

        // Show/Hide GameOver Panel
        gameOverPanel.SetActive(gm.currentState == GameState.GameOver);
        if (gm.currentState == GameState.GameOver)
        {
            winnerText.text = gm.playerHeroHP <= 0 ? "Opponent Wins!" : "Player Wins!";
        }

        // Enable/Disable buttons based on state
        endTurnButton.gameObject.SetActive(gm.currentState == GameState.Placement);
    }

    private void UpdateLogs()
    {
        logText.text = string.Join("\n", GameManager.Instance.combatLog);
        // Scroll to bottom
        Canvas.ForceUpdateCanvases();
        logScrollRect.verticalNormalizedPosition = 0f;
    }

    private void OnHandCardClicked(Card card)
    {
        if (GameManager.Instance.currentState != GameState.Placement) return;

        if (card.currentSpawnDelay > 0)
        {
            selectedHandCard = null;
            return;
        }

        selectedHandCard = card;
        UpdateUI();
    }

    private void OnSlotClicked(int slotIndex)
    {
        if (selectedHandCard == null) return;

        bool success = GameManager.Instance.DeployCard(selectedHandCard, slotIndex, true);
        if (success)
        {
            selectedHandCard = null;
            UpdateUI();
        }
    }

    private void OnEndTurnClicked()
    {
        selectedHandCard = null;
        GameManager.Instance.EndPlacementPhase();
    }

    private void OnRestartClicked()
    {
        GameManager.Instance.StartGame();
    }
}
