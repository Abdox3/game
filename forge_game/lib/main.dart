import 'dart:async';
import 'dart:math';
import 'package:flutter/material.dart';

void main() {
  runApp(const ForgeApp());
}

class ForgeApp extends StatelessWidget {
  const ForgeApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FORGE - Gameplay Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color(0xFF0A0E1A),
        colorScheme: const ColorScheme.dark(
          primary: Color(0xFFD4A853), // Gold accent
          secondary: Color(0xFF5B8DEF), // Ironclad blue
          surface: Color(0xFF141929),
        ),
      ),
      home: const GameScreen(),
    );
  }
}

enum Faction { Ironclad, Verdant, Ember, Phantom, AlNoor, Neutral }

class CardModel {
  final String name;
  final Faction faction;
  final int baseATK;
  final int baseHP;
  late int currentATK;
  late int currentHP;
  final int initialSpawnDelay;
  late int currentSpawnDelay;
  final int level;
  final bool isSpell;
  final String stringIcon;
  final String skillDescription;
  final bool hasShield;
  final bool hasTaunt;
  final bool hasHaste;

  CardModel({
    required this.name,
    required this.faction,
    required this.baseATK,
    required this.baseHP,
    required this.initialSpawnDelay,
    required this.level,
    this.isSpell = false,
    this.stringIcon = '',
    this.skillDescription = '',
    this.hasShield = false,
    this.hasTaunt = false,
    this.hasHaste = false,
  }) {
    currentATK = baseATK;
    currentHP = baseHP;
    currentSpawnDelay = initialSpawnDelay;
  }

  CardModel clone() {
    return CardModel(
      name: name,
      faction: faction,
      baseATK: baseATK,
      baseHP: baseHP,
      initialSpawnDelay: initialSpawnDelay,
      level: level,
      isSpell: isSpell,
      stringIcon: stringIcon,
      skillDescription: skillDescription,
      hasShield: hasShield,
      hasTaunt: hasTaunt,
      hasHaste: hasHaste,
    )
      ..currentATK = currentATK
      ..currentHP = currentHP
      ..currentSpawnDelay = currentSpawnDelay;
  }

  void takeDamage(int amount) {
    int finalDamage = amount;
    if (hasShield) {
      finalDamage = (amount * 0.85).round();
      if (finalDamage < 1) finalDamage = 1;
    }
    currentHP -= finalDamage;
    if (currentHP < 0) currentHP = 0;
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({super.key});

  @override
  State<GameScreen> createState() => _GameScreenState();
}

class _GameScreenState extends State<GameScreen> {
  // Hero values
  int playerHeroHP = 100;
  int opponentHeroHP = 100;

  // Decks & Hands
  List<CardModel> playerDeck = [];
  List<CardModel> opponentDeck = [];
  List<CardModel> playerHand = [];
  List<CardModel> opponentHand = [];

  // 5 Slots per player
  List<CardModel?> playerSlots = List.filled(5, null);
  List<CardModel?> opponentSlots = List.filled(5, null);

  // States
  String currentPhase = 'Setup'; // Setup, RoundStart, Placement, Combat, GameOver
  int round = 1;
  List<String> logs = [];
  final ScrollController _logScrollController = ScrollController();

  // Animation active states (which column is currently attacking)
  int? activeCombatColumn;
  bool isPlayerAttacking = true; // true = player, false = opponent

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
      playerHeroHP = 100;
      opponentHeroHP = 100;
      round = 1;
      logs.clear();
      playerSlots = List.filled(5, null);
      opponentSlots = List.filled(5, null);
      playerHand.clear();
      opponentHand.clear();

      // Decks generation
      generateDecks();

      // Initial Draw
      for (int i = 0; i < 5; i++) {
        if (playerDeck.isNotEmpty) {
          playerHand.add(playerDeck.removeAt(0));
        }
        if (opponentDeck.isNotEmpty) {
          opponentHand.add(opponentDeck.removeAt(0));
        }
      }

      log('Game started! Round 1 begins.');
      startRound();
    });
  }

  void log(String message) {
    setState(() {
      logs.add(message);
    });
    // Auto-scroll logs
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_logScrollController.hasClients) {
        _logScrollController.animateTo(
          _logScrollController.position.maxScrollExtent,
          duration: const Duration(milliseconds: 300),
          curve: Curves.easeOut,
        );
      }
    });
  }

  void generateDecks() {
    // Player Deck (12 cards)
    playerDeck = [
      CardModel(name: 'Chrono-Sentinel', faction: Faction.Ironclad, baseATK: 15, baseHP: 60, initialSpawnDelay: 3, level: 30, stringIcon: '🤖', hasShield: true),
      CardModel(name: 'Tower Knight', faction: Faction.Ironclad, baseATK: 10, baseHP: 80, initialSpawnDelay: 2, level: 10, stringIcon: '🛡', hasTaunt: true),
      CardModel(name: 'Alloy Golem', faction: Faction.Ironclad, baseATK: 20, baseHP: 100, initialSpawnDelay: 4, level: 60, stringIcon: '⛓'),
      CardModel(name: 'Thornwall', faction: Faction.Verdant, baseATK: 5, baseHP: 90, initialSpawnDelay: 1, level: 10, stringIcon: '🌿', hasTaunt: true),
      CardModel(name: 'Grove Warden', faction: Faction.Verdant, baseATK: 18, baseHP: 70, initialSpawnDelay: 2, level: 40, stringIcon: '🌲'),
      CardModel(name: 'Mamluk Vanguard', faction: Faction.AlNoor, baseATK: 25, baseHP: 50, initialSpawnDelay: 0, level: 1, stringIcon: '🐎', hasHaste: true),
      CardModel(name: 'Sandstorm Caller', faction: Faction.AlNoor, baseATK: 12, baseHP: 55, initialSpawnDelay: 3, level: 30, stringIcon: '🌪'),
      CardModel(name: 'Cinder Drake', faction: Faction.Ember, baseATK: 30, baseHP: 40, initialSpawnDelay: 3, level: 10, stringIcon: '🐉'),
      CardModel(name: 'Phoenix Automaton', faction: Faction.Ember, baseATK: 22, baseHP: 60, initialSpawnDelay: 2, level: 30, stringIcon: '🔥'),
      CardModel(name: 'Eclipse Shade', faction: Faction.Phantom, baseATK: 16, baseHP: 45, initialSpawnDelay: 1, level: 10, stringIcon: '👁'),
      CardModel(name: 'Void Sentinel', faction: Faction.Phantom, baseATK: 20, baseHP: 75, initialSpawnDelay: 3, level: 60, stringIcon: '🌀'),
      CardModel(name: 'Rust Automaton', faction: Faction.Neutral, baseATK: 14, baseHP: 50, initialSpawnDelay: 1, level: 1, stringIcon: '⚙'),
    ];

    // Opponent Deck
    opponentDeck = [
      CardModel(name: 'Steel Defender', faction: Faction.Ironclad, baseATK: 10, baseHP: 75, initialSpawnDelay: 2, level: 10, stringIcon: '🛡', hasTaunt: true),
      CardModel(name: 'Kinetic Sentinel', faction: Faction.Ironclad, baseATK: 18, baseHP: 55, initialSpawnDelay: 3, level: 30, stringIcon: '🤖'),
      CardModel(name: 'Bramble Beast', faction: Faction.Verdant, baseATK: 15, baseHP: 65, initialSpawnDelay: 2, level: 10, stringIcon: '🐺'),
      CardModel(name: 'Sylvan Oak', faction: Faction.Verdant, baseATK: 8, baseHP: 100, initialSpawnDelay: 4, level: 60, stringIcon: '🌳'),
      CardModel(name: 'Bedouin Scout', faction: Faction.AlNoor, baseATK: 14, baseHP: 40, initialSpawnDelay: 0, level: 1, stringIcon: '🐫', hasHaste: true),
      CardModel(name: 'Solar Construct', faction: Faction.AlNoor, baseATK: 22, baseHP: 50, initialSpawnDelay: 2, level: 30, stringIcon: '☀'),
      CardModel(name: 'Flame Spinner', faction: Faction.Ember, baseATK: 25, baseHP: 45, initialSpawnDelay: 3, level: 10, stringIcon: '🕸'),
      CardModel(name: 'Magma Giant', faction: Faction.Ember, baseATK: 35, baseHP: 90, initialSpawnDelay: 5, level: 60, stringIcon: '🌋'),
      CardModel(name: 'Phantasm Anchor', faction: Faction.Phantom, baseATK: 12, baseHP: 85, initialSpawnDelay: 3, level: 30, stringIcon: '⚓', hasShield: true),
      CardModel(name: 'Specter Shade', faction: Faction.Phantom, baseATK: 20, baseHP: 40, initialSpawnDelay: 1, level: 10, stringIcon: '👻'),
      CardModel(name: 'Stone Automaton', faction: Faction.Neutral, baseATK: 15, baseHP: 60, initialSpawnDelay: 2, level: 1, stringIcon: '🗿'),
      CardModel(name: 'Bronze Defender', faction: Faction.Neutral, baseATK: 11, baseHP: 70, initialSpawnDelay: 1, level: 10, stringIcon: '🪙'),
    ];

    playerDeck.shuffle();
    opponentDeck.shuffle();
  }

  void startRound() {
    setState(() {
      currentPhase = 'RoundStart';
    });

    log('--- Round $round ---');

    // Tick down delays
    for (var card in playerHand) {
      if (card.currentSpawnDelay > 0) {
        card.currentSpawnDelay--;
      }
    }
    for (var card in opponentHand) {
      if (card.currentSpawnDelay > 0) {
        card.currentSpawnDelay--;
      }
    }

    // Draw to fill hands
    fillHands();

    Future.delayed(const Duration(seconds: 1), () {
      setState(() {
        currentPhase = 'Placement';
      });
      log('Placement Phase: Drag and drop cards with "Ready!" to empty slots.');
    });
  }

  void fillHands() {
    while (playerHand.length < 5 && playerDeck.isNotEmpty) {
      CardModel drawn = playerDeck.removeAt(0);
      playerHand.add(drawn);
      log('Player draws ${drawn.name} (Delay: ${drawn.currentSpawnDelay} rounds).');
    }
    while (opponentHand.length < 5 && opponentDeck.isNotEmpty) {
      CardModel drawn = opponentDeck.removeAt(0);
      opponentHand.add(drawn);
      log('Opponent draws ${drawn.name}.');
    }
  }

  void deployPlayerCard(CardModel card, int slotIndex) {
    if (currentPhase != 'Placement') return;
    if (card.currentSpawnDelay > 0) return;
    if (playerSlots[slotIndex] != null) return;

    setState(() {
      playerSlots[slotIndex] = card;
      playerHand.remove(card);
    });
    log('Player deployed ${card.name} to Slot ${slotIndex + 1}.');
  }

  void endPlacement() {
    if (currentPhase != 'Placement') return;

    // Run Bot AI deployment
    runBotAI();

    // Start combat
    resolveCombat();
  }

  void runBotAI() {
    List<CardModel> deployable = opponentHand.where((c) => c.currentSpawnDelay == 0).toList();

    for (var card in deployable) {
      // Find an empty slot
      for (int i = 0; i < 5; i++) {
        if (opponentSlots[i] == null) {
          setState(() {
            opponentSlots[i] = card;
            opponentHand.remove(card);
          });
          log('Opponent deployed ${card.name} to Slot ${i + 1}.');
          break;
        }
      }
    }
  }

  Future<void> resolveCombat() async {
    setState(() {
      currentPhase = 'Combat';
    });

    log('Combat begins!');
    await Future.delayed(const Duration(milliseconds: 800));

    // Columns 1 to 5
    for (int i = 0; i < 5; i++) {
      CardModel? pCard = playerSlots[i];
      CardModel? oCard = opponentSlots[i];

      if (pCard == null && oCard == null) continue;

      setState(() {
        activeCombatColumn = i;
      });

      if (pCard != null && oCard != null) {
        // Clash
        log('Slot ${i + 1}: ${pCard.name} (ATK ${pCard.currentATK}) clashing with Opponent ${oCard.name} (ATK ${oCard.currentATK})');
        
        setState(() { isPlayerAttacking = true; });
        await Future.delayed(const Duration(milliseconds: 500));
        oCard.takeDamage(pCard.currentATK);

        setState(() { isPlayerAttacking = false; });
        await Future.delayed(const Duration(milliseconds: 500));
        pCard.takeDamage(oCard.currentATK);

        if (pCard.currentHP <= 0) {
          log('Player\'s ${pCard.name} was destroyed!');
          setState(() {
            playerSlots[i] = null;
          });
        }
        if (oCard.currentHP <= 0) {
          log('Opponent\'s ${oCard.name} was destroyed!');
          setState(() {
            opponentSlots[i] = null;
          });
        }
      } else if (pCard != null && oCard == null) {
        // Direct attack on Hero
        log('Slot ${i + 1}: ${pCard.name} attacks Opponent Hero directly for ${pCard.currentATK} damage!');
        setState(() { isPlayerAttacking = true; });
        await Future.delayed(const Duration(milliseconds: 600));

        setState(() {
          opponentHeroHP -= pCard.currentATK;
          if (opponentHeroHP < 0) opponentHeroHP = 0;
        });
      } else if (oCard != null && pCard == null) {
        // Direct attack on Hero
        log('Slot ${i + 1}: ${oCard.name} attacks Player Hero directly for ${oCard.currentATK} damage!');
        setState(() { isPlayerAttacking = false; });
        await Future.delayed(const Duration(milliseconds: 600));

        setState(() {
          playerHeroHP -= oCard.currentATK;
          if (playerHeroHP < 0) playerHeroHP = 0;
        });
      }

      setState(() {
        activeCombatColumn = null;
      });

      await Future.delayed(const Duration(milliseconds: 400));

      if (checkGameOver()) {
        setState(() {
          currentPhase = 'GameOver';
        });
        return;
      }
    }

    // Go to next round
    setState(() {
      round++;
    });
    startRound();
  }

  bool checkGameOver() {
    if (playerHeroHP <= 0) {
      log('Game Over! Opponent wins.');
      return true;
    }
    if (opponentHeroHP <= 0) {
      log('Victory! Player wins.');
      return true;
    }

    bool playerHasCards = hasCardsLeft(playerSlots, playerHand, playerDeck);
    bool opponentHasCards = hasCardsLeft(opponentSlots, opponentHand, opponentDeck);

    if (!playerHasCards && !opponentHasCards) {
      log('Game Over! Draw (both sides ran out of cards).');
      return true;
    }
    if (!playerHasCards) {
      log('Game Over! Player has no remaining cards. Opponent wins.');
      return true;
    }
    if (!opponentHasCards) {
      log('Victory! Opponent has no remaining cards. Player wins.');
      return true;
    }

    return false;
  }

  bool hasCardsLeft(List<CardModel?> slots, List<CardModel> hand, List<CardModel> deck) {
    for (var c in slots) {
      if (c != null) return true;
    }
    return hand.isNotEmpty || deck.isNotEmpty;
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final isTablet = width > 600;

    return Scaffold(
      body: Stack(
        children: [
          // Geometric Background
          Positioned.fill(
            child: CustomPaint(
              painter: GirihPainter(),
            ),
          ),

          // Main game container
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 8.0),
              child: Column(
                children: [
                  // Top HUD: Opponent Status
                  _buildHeader(
                    title: 'OPPONENT HERO',
                    hp: opponentHeroHP,
                    color: Colors.redAccent,
                    avatar: '😈',
                  ),

                  const SizedBox(height: 12),

                  // Battlefield (Opponent and Player slots)
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.03),
                        borderRadius: BorderRadius.circular(16),
                        border: Border.all(color: Colors.white.withOpacity(0.08)),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Opponent slots row
                          _buildSlotsRow(opponentSlots, false),

                          // Center divider / river
                          Container(
                            height: 2,
                            width: double.infinity,
                            color: const Color(0xFFD4A853).withOpacity(0.2),
                          ),

                          // Player slots row
                          _buildSlotsRow(playerSlots, true),
                        ],
                      ),
                    ),
                  ),

                  const SizedBox(height: 12),

                  // Bottom panel (Logs on tablet, Hand + Controls on bottom)
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        // Hand cards list
                        Expanded(
                          flex: 3,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'YOUR HAND (${playerHand.length})',
                                    style: TextStyle(
                                      color: const Color(0xFFD4A853),
                                      fontWeight: FontWeight.bold,
                                      fontSize: isTablet ? 16 : 13,
                                    ),
                                  ),
                                  Text(
                                    currentPhase == 'Placement' ? 'Drag to Slot' : 'Waiting...',
                                    style: TextStyle(
                                      color: Colors.white60,
                                      fontSize: isTablet ? 14 : 11,
                                    ),
                                  ),
                                ],
                              ),
                              const SizedBox(height: 6),
                              Expanded(
                                child: _buildHandList(),
                              ),
                            ],
                          ),
                        ),

                        const SizedBox(width: 12),

                        // Logs and Control panel
                        Expanded(
                          flex: 2,
                          child: Column(
                            children: [
                              // Combat Logs
                              Expanded(
                                child: Container(
                                  padding: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    color: Colors.black.withOpacity(0.5),
                                    borderRadius: BorderRadius.circular(12),
                                    border: Border.all(color: Colors.white.withOpacity(0.05)),
                                  ),
                                  child: ListView.builder(
                                    controller: _logScrollController,
                                    itemCount: logs.length,
                                    itemBuilder: (context, index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(vertical: 2.0),
                                        child: Text(
                                          logs[index],
                                          style: const TextStyle(
                                            fontFamily: 'Courier',
                                            fontSize: 11,
                                            color: Colors.white70,
                                          ),
                                        ),
                                      );
                                    },
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),

                              // End Turn / Action button
                              SizedBox(
                                width: double.infinity,
                                height: 48,
                                child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                    backgroundColor: currentPhase == 'Placement'
                                        ? const Color(0xFFD4A853)
                                        : Colors.grey[800],
                                    foregroundColor: Colors.black,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                    ),
                                  ),
                                  onPressed: currentPhase == 'Placement' ? endPlacement : null,
                                  child: Text(
                                    currentPhase == 'Placement' ? 'FIGHT!' : 'RESOLVING...',
                                    style: const TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 15,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),

                  const SizedBox(height: 8),

                  // Player HUD
                  _buildHeader(
                    title: 'YOUR HERO',
                    hp: playerHeroHP,
                    color: Colors.greenAccent,
                    avatar: '🛡',
                  ),
                ],
              ),
            ),
          ),

          // Game Over overlay
          if (currentPhase == 'GameOver')
            Container(
              color: Colors.black.withOpacity(0.85),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      playerHeroHP <= 0 ? 'DEFEAT' : 'VICTORY!',
                      style: TextStyle(
                        color: playerHeroHP <= 0 ? Colors.red : const Color(0xFFD4A853),
                        fontSize: 48,
                        fontWeight: FontWeight.bold,
                        letterSpacing: 4,
                      ),
                    ),
                    const SizedBox(height: 12),
                    Text(
                      playerHeroHP <= 0 ? 'Your Hero was crushed...' : 'The opponent was defeated!',
                      style: const TextStyle(color: Colors.white70, fontSize: 18),
                    ),
                    const SizedBox(height: 24),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFFD4A853),
                        foregroundColor: Colors.black,
                        padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 16),
                      ),
                      onPressed: startGame,
                      child: const Text(
                        'PLAY AGAIN',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildHeader({required String title, required int hp, required Color color, required String avatar}) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.white.withOpacity(0.03),
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.white.withOpacity(0.05)),
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: Colors.white10,
            child: Text(avatar, style: const TextStyle(fontSize: 20)),
          ),
          const SizedBox(width: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(fontSize: 12, fontWeight: FontWeight.w600, color: Colors.white38),
              ),
              Text(
                'Round $round • HP: $hp/100',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color),
              ),
            ],
          ),
          const Spacer(),
          // Health Bar
          Container(
            width: 100,
            height: 8,
            decoration: BoxDecoration(
              color: Colors.white10,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Container(
                width: hp.toDouble(),
                decoration: BoxDecoration(
                  color: color,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildSlotsRow(List<CardModel?> slots, bool isPlayer) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0),
      child: Row(
        children: List.generate(5, (index) {
          final card = slots[index];
          final isActiveColumn = activeCombatColumn == index;
          final showAttackBorder = isActiveColumn && (isPlayer == isPlayerAttacking);

          return Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 3.0),
              child: AnimatedScale(
                scale: showAttackBorder ? 1.12 : 1.0,
                duration: const Duration(milliseconds: 200),
                child: _buildBattleCard(card, isPlayer, index, showAttackBorder),
              ),
            ),
          );
        }),
      ),
    );
  }

  Widget _buildBattleCard(CardModel? card, bool isPlayer, int index, bool showAttackBorder) {
    if (card == null) {
      return DragTarget<CardModel>(
        builder: (context, candidateData, rejectedData) {
          return Container(
            height: 125,
            decoration: BoxDecoration(
              color: Colors.white.withOpacity(0.015),
              borderRadius: BorderRadius.circular(10),
              border: Border.all(
                color: candidateData.isNotEmpty
                    ? const Color(0xFFD4A853)
                    : Colors.white10,
                width: candidateData.isNotEmpty ? 2.0 : 1.0,
              ),
            ),
            child: const Center(
              child: Icon(Icons.add_circle_outline, size: 18, color: Colors.white24),
            ),
          );
        },
        onWillAccept: (data) => isPlayer && currentPhase == 'Placement' && data?.currentSpawnDelay == 0,
        onAcceptWithDetails: (details) {
          deployPlayerCard(details.data, index);
        },
      );
    }

    return Container(
      height: 125,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: isPlayer
              ? [const Color(0xFF1B2E1E), const Color(0xFF0F1B11)]
              : [const Color(0xFF2E1B1B), const Color(0xFF1B1010)],
        ),
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: showAttackBorder
              ? const Color(0xFFD4A853)
              : (isPlayer ? Colors.green : Colors.red).withOpacity(0.4),
          width: showAttackBorder ? 2.5 : 1.2,
        ),
        boxShadow: showAttackBorder
            ? [
                BoxShadow(
                  color: const Color(0xFFD4A853).withOpacity(0.3),
                  blurRadius: 8,
                  spreadRadius: 2,
                )
              ]
            : null,
      ),
      child: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // Top: Level and Faction
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Lv.${card.level}',
                      style: const TextStyle(fontSize: 8, color: Colors.white54, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      card.stringIcon,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
                // Card name
                Expanded(
                  child: Center(
                    child: Text(
                      card.name,
                      style: const TextStyle(fontSize: 9, fontWeight: FontWeight.bold, letterSpacing: 0.2),
                      textAlign: TextAlign.center,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ),
                // Stats Row
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '⚔${card.currentATK}',
                      style: const TextStyle(fontSize: 9, color: Colors.amber, fontWeight: FontWeight.bold),
                    ),
                    Text(
                      '❤${card.currentHP}',
                      style: const TextStyle(fontSize: 9, color: Colors.greenAccent, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (card.hasShield)
            const Positioned(
              top: 2,
              right: 2,
              child: Icon(Icons.shield, size: 10, color: Colors.blueAccent),
            ),
        ],
      ),
    );
  }

  Widget _buildHandList() {
    return ListView.builder(
      scrollDirection: Axis.horizontal,
      itemCount: playerHand.length,
      itemBuilder: (context, index) {
        final card = playerHand[index];
        final isReady = card.currentSpawnDelay == 0;

        Widget cardWidget = Container(
          width: 96,
          margin: const EdgeInsets.only(right: 8.0, bottom: 4.0),
          decoration: BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: isReady
                  ? [const Color(0xFF1E2640), const Color(0xFF101422)]
                  : [Colors.grey[850]!, Colors.grey[900]!],
            ),
            borderRadius: BorderRadius.circular(12),
            border: Border.all(
              color: isReady
                  ? const Color(0xFFD4A853).withOpacity(0.6)
                  : Colors.white10,
              width: isReady ? 1.5 : 1.0,
            ),
            boxShadow: isReady
                ? [
                    BoxShadow(
                      color: const Color(0xFFD4A853).withOpacity(0.15),
                      blurRadius: 6,
                      spreadRadius: 1,
                    )
                  ]
                : null,
          ),
          child: Stack(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    // Top row: Level and Faction
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Lv.${card.level}',
                          style: const TextStyle(fontSize: 8, color: Colors.white60, fontWeight: FontWeight.bold),
                        ),
                        Text(card.stringIcon, style: const TextStyle(fontSize: 14)),
                      ],
                    ),
                    // Center name
                    Expanded(
                      child: Center(
                        child: Text(
                          card.name,
                          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold, letterSpacing: 0.2),
                          textAlign: TextAlign.center,
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ),
                    // Bottom stats
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            const Text('⚔', style: TextStyle(fontSize: 10, color: Colors.amber)),
                            Text('${card.currentATK}', style: const TextStyle(fontSize: 10, color: Colors.amber, fontWeight: FontWeight.bold)),
                          ],
                        ),
                        Row(
                          children: [
                            const Text('❤', style: TextStyle(fontSize: 10, color: Colors.greenAccent)),
                            Text('${card.currentHP}', style: const TextStyle(fontSize: 10, color: Colors.greenAccent, fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              // Round Delay counter
              if (!isReady)
                Container(
                  decoration: BoxDecoration(
                    color: Colors.black.withOpacity(0.7),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(Icons.hourglass_empty, size: 18, color: Colors.amber),
                        const SizedBox(height: 6),
                        Text(
                          '${card.currentSpawnDelay} Rounds',
                          style: const TextStyle(fontSize: 9, color: Colors.amber, fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
            ],
          ),
        );

        if (isReady && currentPhase == 'Placement') {
          return Draggable<CardModel>(
            data: card,
            feedback: Material(
              color: Colors.transparent,
              child: Opacity(
                opacity: 0.8,
                child: cardWidget,
              ),
            ),
            childWhenDragging: Opacity(
              opacity: 0.3,
              child: cardWidget,
            ),
            child: cardWidget,
          );
        } else {
          return cardWidget;
        }
      },
    );
  }
}

class GirihPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = const Color(0xFFD4A853).withOpacity(0.04)
      ..style = PaintingStyle.stroke
      ..strokeWidth = 1.0;

    final center = Offset(size.width / 2, size.height / 2);
    final maxRadius = max(size.width, size.height);

    // Draw concentric 8-pointed star patterns
    for (double r = 40; r < maxRadius; r += 60) {
      final Path path = Path();
      for (int i = 0; i < 8; i++) {
        final angle1 = i * pi / 4;
        final angle2 = (i + 3) * pi / 4; // Interlacing star lines

        final p1 = center + Offset(cos(angle1) * r, sin(angle1) * r);
        final p2 = center + Offset(cos(angle2) * r, sin(angle2) * r);

        if (i == 0) {
          path.moveTo(p1.dx, p1.dy);
        } else {
          path.lineTo(p1.dx, p1.dy);
        }
        path.lineTo(p2.dx, p2.dy);
      }
      path.close();
      canvas.drawPath(path, paint);
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}
