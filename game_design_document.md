# 🃏 Game Design Document — Working Title: **FORGE**
### A Deck-Building Strategy Card Game for iOS & Android
**Prepared for:** Abdo | Digital Code  
**Version:** 2.0 — June 2026

---

## 1. Game Summary

**FORGE** is a 2D **round-based** auto-battle card game where players collect, upgrade, and strategically deploy warrior cards onto a 5-slot battlefield. Cards represent armored soldiers, magical constructs, elemental beings, and mythical creatures — all designed without visible human faces (helmets, masks, silhouettes, plants, golems, spirits, etc.) to respect Islamic guidelines.

The core loop: **collect cards → build a deck → fight PvP/PvE → earn rewards → get stronger → build a better deck**. Matches last 2–4 minutes. Strategy happens before the match (deck building), and during it (card placement timing, merge decisions, spell usage, and lane reading).

**Inspired by:**
- **Ludus (Merge Arena)** → merge mechanic + auto-battle placement
- **Black Deck** → turn-based card attack order + faction system
- **Deck Heroes** → lane-based creature deployment + hero anchor card
- **Battle for the Throne (BFTT)** → kingdom upgrades + resource-based progression
- **Marvel Snap** → dynamic battlefield locations + short match pacing
- **Slay the Spire** → roguelike PvE run structure + relics

---

## 2. Core Design Goals

| Goal | What It Means in Practice |
|---|---|
| Easy to learn | First 3 battles completable without reading any tutorial text |
| Hard to master | Deck synergies, counter-decks, merge timing, spell usage create deep meta |
| No faces (Halal design) | All card art uses helmets, masks, golems, plants, spirits, animals |
| Islamic compliance | No gambling mechanics, no haram imagery, no trivialization of religious elements |
| Fair F2P | Skill + strategy wins over raw card level, especially in lower arenas |
| Engaging long-term | Multiple systems unlock gradually — not all at once on Day 1 |
| Small team buildable | No 3D, no open world, no voice acting — tight scope |

---

## 3. Theme & Visual Style (Modern Neo-Islamic Futurism)

### 3.1 World Setting & Aesthetic Style
The world of **FORGE** is a high-concept **Neo-Islamic Futurist / Tech-Magic** universe. Rather than a gritty, dark medieval fantasy, it features a clean, bright, and highly advanced realm where sacred geometry, cosmic energy, and physical elements are harnessed by legendary Forgemasters. 

Characters are strictly **Constructs, Golems, and Automata** (which avoids human faces naturally). The architectural backdrops combine floating white-marble structures, glowing geometric ribbons of energy, and elegant modern arches, giving the game a sleek, contemporary feel.

### 3.2 Factions (Modernized Visuals)
| Faction | Modern Identity | Visual Style | Example Cards |
|---|---|---|---|
| **Ironclad** | Sleek Cyber-Clockwork Constructs | Steel blue-gray contours, brass gears, geometric shield plates, teal energy cores — reads cleanly on both light and dark backgrounds with minimal adjustment | Chrono-Sentinel, Alloy Tower, Kinetic Golem |
| **Verdant** | Bio-Luminescent Botanical Entities | Grounded leaf green as the primary read; neon lime reserved for small highlight accents only (glowing spore nodes, crystalline bark edge-lighting). Desaturated from the original bio-neon to avoid garish contrast on cream backgrounds | Synth-Thornwall, Neo-Colossus, Bio-Mystic |
| **Ember** | Plasma-Molten Glass Reactors | **Warm coral-orange as the primary read** (the plasma glow, foregrounded). Matte obsidian black repositioned as a small accent detail rather than the chassis base tone — makes the faction readable on a light background without losing its heat identity | Plasma Drake, Obsidian Brute, Ignis Warden |
| **Phantom** | Holographic Neon Specters | **Jewel-toned plum/violet as the primary read** — mystery communicated through saturation and geometric void shapes rather than through darkness itself. Floating fragments and geometric hollow eyes remain; void-black mist is a subtle accent, not the dominant tone | Void Sentinel, Phantasm Anchor, Eclipse Shade |
| **Al-Noor** | Sacred Geometric Celestial Light | White marble with inlaid gold traces, turquoise ribbons, geometric light beams — **already the light-theme palette.** This faction is the natural UI chrome anchor: its colors form the base for menus, buttons, and card frames across the whole game | Solar Vanguard, Dome Sentinel, Prism Archon |

### 3.3 UI Design: Warm Minimalism (Light Theme)

FORGE uses a **warm minimalist UI** — think Duolingo or Headspace in aesthetic register, not a moody fantasy card game. This is a deliberate choice: a light-background game is rarer in the CCG space, it naturally reinforces the Al-Noor-led identity, and it photographs and screenshots better in daylight environments (the primary context for mobile play in MENA markets).

- **UI Chrome:** Warm cream/off-white base (#F9F5EE or similar), thin **gold hairline borders** (1–2px), and soft drop shadows (no glowing halos). Flat card panels with generous whitespace. Al-Noor's marble-and-gold palette functions as the default chrome — it's already the game's aesthetic north star.
- **Typography:** Sleek, modern sans-serif fonts (*Outfit* or *Inter*) for clean mobile legibility. Arabic UI uses a high-quality Arabic sans with RTL mirror layouts.
- **Visual Feedback:** Tactile micro-animations, warm-gold hover states, and smooth card scale-up transitions. Feedback states use warmth (gold glow on select, soft green pulse on heal) rather than neon.
- **Color Separation — Two Palettes, Never One:**
  - **Faction color** (card background wash, faction icon) = muted/desaturated per faction (see §3.2). Keeps faction identity legible without fighting the light background.
  - **Rarity color** (card frame/border treatment) = clean, saturated gray→gold ramp: Common = mid-gray / Uncommon = soft teal / Rare = sky blue / Epic = rich violet / Legendary = warm gold. Kept on a separate palette from faction colors so an Epic Ember card and a Rare Phantom card never visually blur together — which matters more on a light background where inherent contrast is lower.
- **VFX & Particles:** Smooth particle emitters, floating light ribbons, and clean dust paths. Card star-tier evolution triggers a **girih-pattern geometric ring wave** expanding from the card center — gold particle bursts on cream read as **celebratory** rather than mystical, which is arguably a better tonal fit for a reward moment.
- **Menu & Background Art:** Sunlit courtyard aesthetic — daylight filtering through **mashrabiya lattice**, blue sky glimpses through pointed arches, warm stone textures and muqarnas shadow patterns. Same Islamic architectural motifs as §3.1, just lit in day rather than night. Battlefield backgrounds are slightly moodier (time-of-day gradient toward dusk) to provide contrast with the bright menus without abandoning the overall light theme.

### 3.4 Animation Style
- **Fluid & Tactile:** Sprites use modern skeletal bone animations (via Spine or Rive) for smooth, subtle breathing, attack swings, and drift animations.
- **Card Merging:** The cards dissolve into pure geometric energy particles that feed into the higher-tier card.
- **Minimalist 3D Effects:** Use parallax background scrolling and 2.5D rotating card fronts in the menu to create depth while maintaining a lightweight 2D engine.

---

## 4. Core Gameplay Loop

### 4.1 Playground Layout
The playground consists of 5 slot columns per player, aligned vertically, and a central Hero card anchor for each side (similar to Black Deck):
```
[ Opponent Hero (HP Bar) ]
[ Opponent Slot 1 ] [ Opponent Slot 2 ] [ Opponent Slot 3 ] [ Opponent Slot 4 ] [ Opponent Slot 5 ]
=================================== THE BATTLEFIELD ===================================
[ Player Slot 1   ] [ Player Slot 2   ] [ Player Slot 3   ] [ Player Slot 4   ] [ Player Slot 5   ]
[ Player Hero (HP Bar)   ]
```
- Each slot on the playground can contain exactly one creature card.
- **There are no merges during battle.** Star-tier evolution (merging duplicate cards) is a collection-screen action performed outside of matches. Any ability text referencing "merge" refers to this pre-battle collection action, not an in-battle mechanic.

### 4.2 Playing from Hand
- Cards in a player's hand are ready to deploy immediately — there is **no deployment delay or spawn cost**.
- On their Placement Phase, a player can deploy any card from their hand to any empty slot on their side of the field.
- There is no mana gate or timer preventing deployment — strategic choice is *which card* to deploy and *where*, not *when* a cost timer runs down.

### 4.3 Combat Clock & Round Structure

FORGE uses a **round-based system driven by a shared wall clock** — the most important design decision in the document. Rounds are not player-triggered; they fire automatically on a timer. This makes the system event-relay friendly (suits Reverb/WebSocket architecture), gives the game a clear battle clock for the HUD, and eliminates any ambiguity about "real-time vs. turn-based" in the UI.

**One round = 2 seconds of wall-clock time (tunable during playtesting).**

Each round resolves in this fixed sequence:
1. **Draw Phase:** If a player's hand has empty slots, they draw up to their hand size limit.
2. **Placement Phase:** Both players simultaneously choose one card from hand to deploy to an empty slot. Placement is simultaneous — no waiting on opponent.
3. **Combat Phase:** All deployed creatures auto-attack their targets (see §4.4). Damage resolves instantly. Dead cards are removed.
4. **Round ticks:** Wall clock advances. Timed effects (Burn, Stealth, Freeze) tick down their durations in seconds, not in rounds.

> **Note on timed effects and events:** Durations expressed in seconds (e.g., "Stealth for 5 seconds," "Freeze for 3 seconds") are real wall-clock seconds, not round counts. Arena Modifiers (§4.6) that reference HP/s also run on the wall clock between rounds. This gives continuous-feeling combat feedback while keeping resolution deterministic and server-authoritative.

### 4.4 Combat & Targeting Rules
- Deployed creatures attack in a direct line-of-sight manner.
- A creature in Slot X always attacks the opposing creature in Slot X.
- **Hero Shielding Rule:** The Hero is protected by their deployed creatures (acting as a shield). The Hero can only be attacked directly if the opposing player's board is completely empty (no creatures deployed in any of the 5 slots).
- If the opposing Slot X is empty:
  - If the opposing board has other creatures deployed elsewhere, the attacking creature redirects its attack to the nearest occupied opposing slot (prioritizing the closest lane, e.g., Slot X-1 or Slot X+1).
  - If the opposing board is completely empty, the attacking creature directly attacks the enemy **Hero**.
- Attacks resolve automatically each round during the Combat Phase.

### 4.5 Win Condition
There is **one win condition**: **Reduce the Enemy Hero's HP to 0** (Hero starts at 100 HP).

Because of the Hero Shielding Rule (§4.4), a player must first clear all creatures from the opponent's board before their own creatures can reach and damage the Hero directly. This creates a single, legible countdown that both players can read at a glance during an auto-resolving battle.

### 4.6 Forge Spells (Action Cards)

Not every card is a creature. **Forge Spells** are instant-effect cards that occupy no slot and deploy from hand like any other card during the Placement Phase — no delay, no separate cost. They add **reactive gameplay** — the ability to respond to what your opponent does — and create dramatic swings.

#### Spell Card List (Core Set)
| Spell | Faction | Effect |
|---|---|---|
| **Iron Tempering** | Ironclad | Give one friendly card +30% HP |
| **Vine Snare** | Verdant | Freeze an enemy card for 3 seconds (cannot attack) |
| **Flame Wave** | Ember | Deal 15 damage to all cards on the enemy field |
| **Shadow Swap** | Phantom | Swap the positions of two of your deployed cards |
| **Radiant Burst** | Al-Noor | Heal all your cards for 10 HP and reveal enemy hand |
| **Forge Strike** | Neutral | Deal 20 damage directly to enemy Hero |
| **Ironhide** | Ironclad | One friendly card becomes immune to spells for 6 seconds |
| **Overgrowth** | Verdant | Summon a Thornwall in an empty slot |
| **Ember Trail** | Ember | All your Ember cards gain Burn 3 for 6 seconds |
| **Veil of Shadows** | Phantom | All your cards gain Stealth for 4 seconds |

#### Spell Rules
- Spells are drawn into hand like any card and deployed freely during the Placement Phase.
- A deck can contain **2–4 spells** out of the 12 total cards.
- Max 2 copies of any single spell.
- When played, spells show a brief visual effect on the battlefield (vine tendrils wrapping, flames erupting, etc.).

#### Why Spells Matter
Spells create **interactive gameplay**. When your opponent plays Flame Wave, you need to think about card placement. When they hold a card and haven't played it, you wonder "is that a spell?" This creates **psychological tension** that pure creature deployment can't achieve.

### 4.7 Battlefield Environments (Forge Arenas)

Every match isn't the same. Each match randomly assigns **1 lane modifier** from a pool (2 in Grand Forge arena). Modifiers are visible to both players at match start and change how those specific lanes behave.

#### Arena Modifier Pool
| Arena Modifier | Effect | Strategic Impact |
|---|---|---|
| **Burning Ground** | All cards in this lane lose 2 HP/s | Favors high-HP Ironclad/Al-Noor; punishes swarm |
| **Shadow Veil** | Cards in this lane are invisible to opponent until they attack | Phantom faction dream lane |
| **Overgrowth** | Cards in this lane heal 3 HP/s | Makes this lane very hard to clear; Verdant paradise |
| **Void Rift** | Cards here can attack ANY enemy slot, not just the directly opposite one | Disrupts lane-matching strategy |
| **Sandstorm** | All cards in this lane have -20% attack speed | Punishes aggro builds, favors tanks |
| **Sacred Ground** | Cards in this lane cannot be targeted by spells | Safe haven; forces direct combat |
| **Crumbling Ruins** | At the 90-second mark, this slot collapses — the card in it is destroyed | Timed risk; deploy late |

#### Implementation Rules
- **PvP Arena**: 1 random modifier per match (2 modifiers in Grand Forge arena)
- **PvE Campaign**: Story missions have fixed, thematic modifiers (e.g., a volcano level = Burning Ground on all slots)
- **Draft Mode**: 2 random modifiers to increase variance and skill expression
- Modifiers are shown during a **10-second "Arena Reveal" phase** before the match starts
- Both players always see the same modifiers simultaneously — no information asymmetry

### 4.8 Mid-Match Forge Events (Post-MVP — Phase 2+)

> **Scope Decision:** Mid-Match Forge Events are **deferred to Phase 2**. Arena Modifiers (§4.7) already solve the problem of preventing match predictability, and shipping both in MVP would duplicate the same design goal while adding substantial server-side event-scheduling complexity. Events will be added in Phase 2 once playtesting confirms whether Modifiers alone provide sufficient match variance.

At the **90-second mark**, a random event triggers with a 5-second warning animation. These create **"moment of drama"** that prevent matches from feeling predictable.

| Event | Effect | Duration |
|---|---|---|
| **Quake** | All cards lose 20% current HP | One-time |
| **The Forge Awakens** | A neutral 3★ card spawns in a random empty slot — first to defeat it claims it | Until defeated |
| **Eclipse** | All card abilities are disabled for 10 seconds | 10 seconds |
| **Double Time** | All attack speeds doubled for 15 seconds | 15 seconds |
| **Reinforcements** | Both players draw 2 extra cards | One-time |
| **Healing Winds** | All cards heal 20% of their max HP | One-time |

#### Event Rules
- Only **1 event per match** — never stacks
- Events are **disabled** in Grand Tournament and Draft Clash to preserve pure competitive integrity
- Both players see the event simultaneously with a dramatic screen-wide animation
- Events are selected from a curated pool weighted by current match state (e.g., if both sides have low HP, Healing Winds is more likely)

### 4.8 Comeback Mechanics ✨ NEW

Matches should feel like they always have a chance to swing. These three systems prevent "snowball wins" where the outcome is decided in the first 30 seconds.

#### A. Desperate Forge (Mana Acceleration)
When your Forge Core drops below **40 HP** (out of 100), you gain **+0.5 mana/second** (1.5 total instead of 1.0). This lets the losing player deploy faster and make more aggressive plays. The best games are the ones where you almost lost but clawed back.

#### B. Last Stand (Card Keyword)
Cards with the **Last Stand** keyword trigger a powerful ability when they drop below 25% HP:

| Card | Last Stand Ability |
|---|---|
| Iron Sentinel | Gains +100% ATK for its final 3 attacks |
| Root Colossus | Splits into two 1★ Thornwall cards when destroyed |
| Cinder Drake | Explodes on death, dealing 20 damage to entire enemy lane |
| Void Shade | Becomes untargetable for 5 seconds and heals 50% HP |
| Shield Bearer | Taunts all enemies in all lanes for 3 seconds |

#### C. Forge Commander Surge (Once-Per-Match Ultimate)
Each Forge Commander has a **Surge** ability — a powerful once-per-match active ability that charges over time (fully charged at **2:00 mark**). The player must **tap to activate** it, adding a critical moment of skill expression.

| Commander | Surge Ability |
|---|---|
| **Ironmaster** | **Iron Curtain** — All your cards become invulnerable for 4 seconds |
| **Grove Shaper** | **Overgrowth** — Heal all your cards to full HP |
| **Emberlord** | **Inferno** — Deal 30 damage to all enemy cards |
| **Voidkeeper** | **Void Collapse** — Remove the strongest enemy card from the field for 6 seconds |
| **Al-Hakim** | **Illumination** — All your cards attack twice for the next 8 seconds |

> **Why Comeback Mechanics Matter:** Instead of "I'm losing, might as well quit," players think "If I can survive until my Surge charges, I can flip this." This dramatically improves match completion rates and makes every game feel like it has a climax.

---

## 5. Card System

### 5.1 Card Types
FORGE has two card types:

| Type | Description | Lane Slot | Mergeable |
|---|---|---|---|
| **Creature Card** | Units that deploy to a lane and auto-battle | Yes (occupies 1 slot) | Yes |
| **Forge Spell** | Instant effect, played from hand | No (instant use) | No |

### 5.2 Card Anatomy (Creature Cards)
Each creature card has:
- **Name** (e.g., "Iron Sentinel")
- **Faction** (Ironclad / Verdant / Ember / Phantom / Al-Noor)
- **Rarity** (Common, Uncommon, Rare, Epic, Legendary)
- **ATK** — damage per attack cycle
- **HP** — health before card dies
- **Speed** — how fast the card attacks (Slow / Normal / Fast)
- **Keywords** — standardized ability tags (see 5.5)
- **Skills** — special abilities that unlock at specific card levels (see 5.6)

### 5.3 Card Rarities & Star Progression
Cards in FORGE are classified by rarity, which determines their starting star rating (Base Stars), their maximum growth limit (Max Stars), and the number of permanent Skills they possess.

| Rarity | Color | Base Stars | Max Stars | Skill Slots Gated | Role & Identity |
|---|---|---|---|---|---|
| **Common** | Gray | 1★ | 3★ | 1 (Passive) | Starter constructs, inexpensive to upgrade. |
| **Uncommon** | Green | 2★ | 3★ | 2 (Passive + Active) | Standard utility units with specialized lane duties. |
| **Rare** | Blue | 3★ | 6★ | 2 (Passive + Active) | High-potential core units that scale heavily. |
| **Epic** | Purple | 4★ | 6★ | 3 (Passive + Active + Ultimate) | Powerful constructs with game-changing impact. |
| **Legendary** | Gold | 5★ | 6★ | 3 (Passive + Active + Ultimate) | Ultimate cards defining faction synergy and archetypes. |

#### Star Evolution Rules:
- **Common & Uncommon cards** are capped at **3★ max**, meaning they are highly effective early-to-mid game but have stat ceilings.
- **Rare, Epic, and Legendary cards** can evolve all the way to **6★**, making them the premier choices for end-game optimization.

---

### 5.4 Sample Card Abilities (no faces, themed)
| Card | Faction | Keywords | Ability |
|---|---|---|---|
| Tower Knight | Ironclad | Shield, Taunt | **Shield Wall** — all Ironclad cards gain +20% HP when this is on the field |
| Thornwall | Verdant | Thorns | **Thorn Barrier** — reflects 15% damage back to attacker |
| Cinder Drake | Ember | Burn | **Searing Breath** — deals 5 damage per second to all enemy lane cards |
| Void Shade | Phantom | Stealth | **Phased** — untargetable for first 5 seconds after deployment |
| Root Colossus | Verdant | Freeze, Last Stand | **Entangle** — freezes the enemy card in front for 3 seconds on deploy |
| Siege Golem | Ironclad | Pierce | **Armor Pierce** — ignores 30% of enemy HP when attacking base |
| Shield Bearer | Al-Noor | Shield, Taunt, Last Stand | **Fortify** — takes 20% less damage when adjacent to another Al-Noor card |
| Desert Scout | Al-Noor | Haste | **Swift Strike** — attacks twice before opponent responds on first deploy |

### 5.5 Card Keyword System ✨ NEW

All card abilities use a **standardized keyword system** for instant readability. When a player sees keywords, they immediately understand the card's role without reading paragraphs of text.

| Keyword | Definition | Visual Indicator |
|---|---|---|
| **Shield** | Takes X% less damage from all sources | Blue glow border |
| **Thorns** | Reflects X% damage back to attacker | Green spike particles |
| **Burn** | Deals X damage per second to enemies in the same lane | Orange ember trail |
| **Stealth** | Cannot be targeted for X seconds after deploy | Transparency/shadow effect |
| **Freeze** | Target cannot attack for X seconds | Ice crystal overlay |
| **Pierce** | Ignores X% of enemy HP when attacking Forge Core | Red slash marks |
| **Haste** | Attacks immediately on deploy (no windup delay) | Speed lines animation |
| **Taunt** | Must be attacked first in its lane (absorbs all lane damage) | Golden shield icon |
| **Heal** | Restores X HP per second to adjacent allied cards | Green pulse waves |
| **Last Stand** | Triggers a powerful effect when card drops below 25% HP | Flashing red aura |
| **Surge** | Once-per-match active ability (Commander cards only) | Charging energy bar |

> **Design Note:** Keywords are displayed as **icons with tooltips** on the card. In-game, a player can long-press any keyword icon to see a brief explanation. This keeps the UI clean while remaining accessible to new players.

### 5.6 Card Skill Unlock System (Fixed Identity)

Skills represent a card’s **fixed, printed identity**. They define exactly what a creature is and the fundamental role it plays (e.g., a tank, a burst damage dealer, or a support construct). They cannot be changed or swapped, though they are unlocked and strengthened as the card grows.

#### Skill Gating by Rarity
- **Common:** 1 Skill Slot (1 Passive).
- **Uncommon & Rare:** 2 Skill Slots (1 Passive + 1 Active).
- **Epic & Legendary (and Heroes):** 3 Skill Slots (1 Passive + 1 Active + 1 Ultimate/Signature).

#### How Skills Unlock
Skills unlock progressively as a card increases its **Star level** and **Milestone Levels**:
- **Skill 1 (Passive):** Available at base Star level (Level 1).
- **Skill 2 (Active):** Unlocks when the card reaches **3★** (and Level 30).
- **Skill 3 (Ultimate/Signature):** Unlocks when the card reaches **5★** (and Level 60).

#### Skill Types
| Skill Type | Description |
|---|---|
| **Passive** | Always active while the card is on the field (e.g., "All adjacent allies gain +15% Shield"). |
| **Active** | Triggers under a specific combat condition (e.g., On Deploy, On Attack, or On Death). |
| **Ultimate** | A high-impact signature move representing faction mastery, triggering once or on a cool down. |

#### Design Philosophy
> **Skills vs. Perks:** Skills answer the question: *"What is this creature?"* They are fixed, printed on the card, and define its core identity. Perks (Section 7.6) answer: *"How am I playing this creature in this build?"* and are flexible, slot-in modifiers that players can borrow and customize. This two-layer strategy system gives high depth without overloading UI complexity.

### 5.7 Faction Synergy Bonus
Running 3+ cards of the same faction in your deck activates a **passive bonus**:
- **Ironclad** (3+): All your cards gain +15% HP
- **Verdant** (3+): Regenerate 3 HP per round per card on field
- **Ember** (3+): All attacks deal +10% damage
- **Phantom** (3+): Cards enter with a 1-round stealth phase on deploy
- **Al-Noor** (3+): Each card you deploy heals your Hero for 5 HP on arrival (**Deploy Light**)

Running a **mixed deck** (2 from each faction) activates **Harmony Bonus**: slight bonus to all stats — rewards smart hybrid builders.

---

## 6. Deck Building System

### 6.1 Deck Composition
- Deck size: **12 cards** (draw 4 at start, cycle through the rest)
- **8–10 creature cards + 2–4 spell cards** (at least 2 spells required)
- Max 2 copies of any single card (creature or spell)
- Must include exactly **1 Forge Commander** (your anchor/hero card, passive aura + Surge ability)
- Free to build any combination across factions

### 6.2 Forge Commander (Hero Card, No Face)
The Forge Commander is your anchor — a large card that sits behind your lanes and provides a **passive aura** (always active) and a **Surge ability** (once-per-match active, charges at 2:00). Not a fighter. Examples:

| Commander | Faction | Passive Aura | Surge Ability |
|---|---|---|---|
| **Ironmaster** | Ironclad | All deployed cards gain +10 armor for first 10 seconds | **Iron Curtain** — All cards become invulnerable for 4 seconds |
| **Grove Shaper** | Verdant | All friendly Verdant cards regen 1 HP/s passively | **Full Bloom** — Heal all your cards to full HP |
| **Emberlord** | Ember | Every 30 seconds, deals 10 damage to all enemy cards | **Inferno** — Deal 30 damage to all enemy cards |
| **Voidkeeper** | Phantom | Reduces enemy attack speed by 10% passively | **Void Collapse** — Remove the strongest enemy card for 6 seconds |
| **Al-Hakim** | Al-Noor | Every 45s, reveals the 3 rarest cards in opponent's deck | **Illumination** — All your cards attack twice for 8 seconds |

---

## 7. Progression System (How Players Get Stronger)

This is where you can fix what's broken in all 4 reference games. **The goal: skill matters first, power level matters second.**

### 7.1 Card Leveling & Milestone Breakthroughs
- **Leveling Up (Normal Levels):**
  - Cards level up from 1 to 100.
  - Normal levels (1-29, 31-59, 61-99) require consuming other low-tier/unwanted cards as XP fodder.
  - Each level increases a card's ATK and HP by a small percentage (e.g., +2%).
  - Leveling up also requires a small amount of **Gold** (soft currency, earned through gameplay).
- **Milestone Breakthrough Levels (30, 60, 100):**
  - Level 30, 60, and 100 act as milestone breakthroughs where powerful passive, active, and ultimate skills are unlocked.
  - To pass level 29 → 30, level 59 → 60, and level 99 → 100, the user must obtain and sacrifice **3 duplicate cards** of the exact same type.
  - Breaking through a milestone also unlocks that level's respective skill (Skill 1 at 30, Skill 2 at 60, Skill 3 at 100).
- Level cap is **arena-gated**: you can't break through milestone levels beyond your current arena's unlocked capabilities → this keeps matchmaking and progression balanced.

### 7.2 Forge Core Upgrades (Base Progression)
Players upgrade their **Forge** (base HQ) which unlocks:
- New card slots in deck (starts at 8, unlocks to 12 gradually)
- New arena access
- Passive income speed (resource generation)
- Clan participation

Forge upgrades use **Gold** (free currency) + **Crystals** (premium), but Gold is enough for all core upgrades.

### 7.3 Runes (Artifact Equivalent)
Equip **Runes** to your Forge Commander to add passive bonuses:
- Max 3 Rune slots (unlock at Forge levels 3, 6, 10)
- Runes: Common (ATK+, HP+), Rare (Speed, Regen), Epic (Faction bonus amplifiers)
- Runes drop from dungeons and event chests, NOT behind heavy paywalls

### 7.4 Arena Ladder (PvP Rank System)

> **Vocabulary Note:** Two separate progression axes exist and must never be confused in UI copy or code:
> - **Star Tier** (1★–6★): How far a card has been evolved via duplicate sacrifice. Determines which skills are unlocked.
> - **Power Level** (1–100): The card's XP-based stat multiplier (ATK, HP). Increases incrementally via fodder cards.

| Arena | Name | Cup Range | Max Star Tier Allowed | Skills Available |
|---|---|---|---|---|
| 1 | Copper Forge | 0–400 | 2★ max | Skill 1 (Passive) only |
| 2 | Iron Forge | 400–900 | 3★ max | Skill 1 + Skill 2 |
| 3 | Steel Forge | 900–1600 | 4★ max | All skills |
| 4 | Crystal Forge | 1600–2500 | 5★ max | All skills |
| 5 | Shadow Forge | 2500–4000 | 6★ (Rare/Epic/Legendary) | All skills |
| 6 | Grand Forge | 4000+ | Uncapped, tournament tier | All skills |

Win PvP → earn **Cups** → rise in arena. Lose → lose cups. This creates fair bracket play — you always face players at your same strength tier.

### 7.5 How Players Compete with Others
1. **PvP Arena** — real-time matchmaking against players in the same cup range
2. **Ranked Season** — monthly reset, top players earn exclusive cosmetic rewards (no stat advantage)
3. **Clan Wars** — weekly clan vs clan tournament, 10 members each, contributes to clan score
4. **Draft Mode** — each player picks from random card pool (levels disabled) — pure skill, no pay-to-win
5. **Challenge Events** — limited-time modes with fixed decks, everyone on equal footing

### 7.6 Perk System (Post-MVP — Phase 4+) ✨ REVISED

> **Note:** Perks are a major depth layer designed for **post-launch**. They should NOT be included in the MVP. This section documents the design so it's ready when the time comes.

#### What Are Perks?
Perks are **flexible, equippable modifiers** that players slot into their creature cards. While **Skills** represent a card's fixed identity (*"What is this creature?"*), **Perks** define the build and playstyle (*"How am I playing this creature in this specific deck/match?"*). Perks let players bend a creature's default role without rewriting it.

#### Perk Slots & Customization
- Each creature card has **1–2 Perk slots** (unlocked via card progression or Forge level milestones).
- Perks are drafted, borrowed, or slotted from a player's collection.
- Perks can be leveled up to increase their potency.

#### The Faction Guardrail: Borrowing Rules
To reinforce faction identity and prevent overpowered combinations, the following borrowing rules apply:
1. **Faction-Locked Perks:** A creature can equip perks belonging specifically to its own faction.
2. **Universal Perks:** A small, curated pool of neutral/general perks is accessible by all factions (e.g., generic speed/health boosts).
3. **No Cross-Faction Borrowing:** An Ironclad unit cannot equip Ember-specific or Phantom-specific perks. This preserves faction strategy and makes balancing new cards much safer.

#### Bending Roles: How Skills and Perks Interact
Because perks are slot-in modifiers, they allow players to customize creatures for specific roles:
- **Default Role:** An Al-Noor unit might naturally be a high-defense tank (via its fixed Skills).
- **The "Mana Battery" Build:** Equip a *"Damage taken generates Mana"* perk. The tank now snowballs the player's spell output.
- **The "Healer-Guardian" Build:** Equip a *"Heal adjacent allies on basic attacks"* perk. The tank now sustains the frontline.

#### Perk Leveling & Progression
Each perk can be leveled from **Level 1 → Level 5** using **Perk Shards** (earned from Forge Depths runs and Clan Raids).

| Perk Level | Cost | Improvement |
|---|---|---|
| Level 1 | Free (on acquire) | Base effect |
| Level 2 | 50 Perk Shards | +25% effect strength |
| Level 3 | 150 Perk Shards | +50% effect strength |
| Level 4 | 400 Perk Shards | +75% effect strength + visual upgrade |
| Level 5 | 1000 Perk Shards | +100% effect strength + unique particle effect |

#### Sample Perks (Bending Faction Roles)

| Perk Name | Faction | Base Effect (Lv 1) | Max Effect (Lv 5) | Strategic Playstyle |
|---|---|---|---|---|
| **Alloy Shielding** | Ironclad | Converts 5% of damage dealt into a personal shield | Converts 10% into a shield | Bends a damage-dealer into a self-sustaining tank. |
| **Spore Burst** | Verdant | On taking a critical hit, releases spores that heal adjacent allies for 5 HP | Spores heal for 10 HP | Bends a frontliner into a passive area-of-effect healer. |
| **Overheat** | Ember | Attacks deal splash damage but cost 2 HP per swing | Splash damage, costs 4 HP | Bends a single-target attacker into a high-risk area sweeper. |
| **Spectral Anchor** | Phantom | Increases own aggro/Taunt when in Stealth | Max aggro/Taunt in Stealth | Bends a stealthy assassin into a distraction/disruption unit. |
| **Radiant Surge** | Al-Noor | Generating light/healing gains +1 Mana | Healing gains +2 Mana | Bends a healer into an economy accelerator. |
| **Kinetic Flow** | Universal | Increases attack speed by 5% after every second attack (stacks up to 3 times) | 10% attack speed | Basic combat utility for any unit. |

#### Perk Acquisition
- **Common Perks**: Guaranteed drop from completing Forge Depths Floor 1.
- **Rare Perks**: Random drop from Forge Depths Floor 2+, or purchasable in Shard Shop.
- **Epic/Legendary Perks**: Rare drop from bosses or Season Pass milestones.
- **Perk Shards**: Earned from daily play, dungeons, and event chests.

---

## 8. Economy & Monetization (Fair Design)

The biggest failure of Ludus, Black Deck, and Deck Heroes is **punishing free players**. Here's a balanced model built on four distinct currencies, each with a clear identity and no overlap.

### 8.1 Currency Map

| Currency | Type | How Acquired | Spent On | Convertible? |
|---|---|---|---|---|
| **Gold** | Soft (free) | Battles, daily quests, earned chests, or purchased with Crystals | Card leveling, Forge upgrades, Milestone Breakthrough costs | Crystals → Gold ✅ / Gold → anything else ❌ |
| **Shards** | Collection | Duplicate card pulls (auto-convert), Shard Shop, dungeon/event drops, Tower floor clears | 100 Shards of the same card → obtain that card directly | Not exchangeable for other currencies |
| **Gems** | Earnable (gameplay only) | Battle wins, daily quests, event milestones, PvE clears | Packages (card draws), Wildcard Tickets, Milestone Breakthrough Skips | ❌ Cannot be purchased or converted — earned exclusively by playing |
| **Crystals** | Hard (real money) | Real-money purchase, Season Pass, achievements | Direct Shop (specific cards/heroes), Gold conversion, Energy/Tickets, cosmetics, speed-ups | Crystals → Gold ✅ / Crystals → Gems ❌ never |

> **Design rationale:** Gems being completely non-purchasable is the key ethical unlock in this system. It means Packages (random draws) are funded entirely by playtime — never by a credit card — which eliminates the *gharar*/gambling concern around random draws entirely. A player who wants a specific card still has a deterministic path: grind 100 Shards of that card and obtain it directly. Every card in the game therefore has two routes to ownership: a randomised one (Gems → Packages) and a fully transparent one (Shards → direct). This gives F2P players a "I know exactly how far away I am" feeling even when their pulls run cold.

### 8.2 What Crystals Can & Cannot Buy
✅ Cosmetic card skins (visual only)
✅ Speed-ups (convenience, never power)
✅ Season Pass (bonus Gold income, cosmetics — NOT exclusive cards)
✅ Direct Purchase Shop: specific, pre-revealed cards/heroes with price shown before payment
✅ Event-Specific Shop: specific new Heroes/Commanders during events (fully revealed before purchase)
✅ Gold (soft currency conversion)
✅ Energy Cells / Battle Tickets (consumable top-up)
❌ **Gems — never.** Packages are a Gems-only mechanic; Crystals cannot access the draw pool
❌ **Direct power** — no card level boosts, no Legendary bundles, no Star Tier skips
❌ **Tournament access** — winning is gated by skill, never payment

### 8.3 Battle Pass (Season Pass)
- Free track: 30 days of daily Gold rewards, Shards, Common/Uncommon cards
- Paid track (~$4.99/month): 2× Gold rate + cosmetic skins + 1 guaranteed Epic card per season + bonus Gems on milestone completions
- The paid pass gives speed, not power — F2P can reach the same card levels ~2 weeks slower

### 8.4 Reward Loop
```
Win Battle → Earn Gold + Gems + Chest Slot fills
Open Chest (1–4 hours) → Get Cards + Shards
Duplicate Card → Auto-converts to Shards
Shards (100 of same card) → Directly claim that card
Shards / Gold → Level Up Card → Unlock New Skills
Gems → Packages → New Cards + pity counter progress
Stronger Cards → Win More → Better Chests → More Gold/Gems
```
Free players always know where they stand: Gold for leveling, Gems for draws, Shards for guaranteed targeting.

### 8.5 Thekr Wellbeing System (Ethical Energy Gate)

FORGE's energy gate is designed not as a paywall but as a **genuine wellbeing pause** — a moment of calm that respects the player's time and aligns with Islamic values of balance (mizan) in all things. The system is built to never feel preachy, automated, or manipulative.

---

#### 8.5.1 The Depletion Dialog — Warm, Not Clinical

When a player's **Energy** (AI auto-battle fuel) or **Battle Tickets** (manual PvE entry) runs empty, a dialog appears. Its tone is designed to feel like a caring friend, not a warning label or a guilt trip.

**Message Behaviour:**
- **First depletion of the day:** Shows the full wellbeing message (pulled from the Depletion Message Pool — see 8.5.4).
- **Subsequent depletions same day:** Shows only a short one-liner (e.g., *"Still resting? Energy refills at 6:42 PM"*), also from the pool. This prevents the message from feeling robotic on repeat.
- The admin can mark any message as **"1st-time only"** or **"repeat-use"** — so sincere, longer messages are never over-exposed.

**Example Messages (Full, 1st-time):**
> *"You're out of energy for now. Games are meant to bring joy — not take over your time. Take a breath, maybe pray, check in on someone you love. Forge will be here when you're back. 🌙"*

> *"Energy's empty — and that's okay. A game should add to your life, not replace it. Step away for a bit; come back refreshed."*

> *(Ramadan / Friday only):* *"Time for a small break. The Prophet ﷺ taught us balance in all things — even in play. Rest, remember Allah, and return when you're ready."*

**Example Messages (Short, repeat-use):**
> *"Still resting? Energy refills at 6:42 PM."*
> *"Come back refreshed — Forge will be waiting."*
> *"No rush. Real life first. 🌿"*

---

#### 8.5.2 Three-CTA Dialog Structure

The depletion screen offers **three exits** — never two. Making "Close" clearly visible is part of the anti-addiction design intent.

| CTA | Action | Limit |
|---|---|---|
| **Buy Energy / Tickets** | IAP or soft-currency top-up | Unlimited |
| **Read Thekr** | View a dhikr/dua card for 5–10 seconds to earn a partial refill | **3× per day** (Energy) / **3× per day** (Tickets) — separate counters |
| **Not Now / Close** | Dismiss dialog, energy/tickets refill on their natural timer | Always available, clearly visible — never buried |

> **Design Note:** "Close" must be a prominent button — not a tiny `✕`. A dialog that makes leaving harder than paying violates the wellbeing intent and recreates the exact dark pattern this system is designed to avoid.

---

#### 8.5.3 The Thekr Dialog — A Genuine Micro-Pause

To prevent players from mindlessly tapping through Thekr like a reward-ad button, the experience is designed as a **genuine moment of stillness**.

**How it works:**
1. A beautifully rendered **dhikr / dua card** appears — calligraphic Arabic text, soft geometric gold-on-dark background, subtle ambient animation (floating particles, soft glow).
2. The Arabic text is shown with transliteration and a translation in the player's locale (e.g., *"SubhanAllahi wa bihamdihi — Glory and praise be to Allah"*).
3. A **soft countdown timer of 5–10 seconds** runs — server-verified. The player may optionally tap a **tasbeeh counter** on screen to follow along (purely optional, not required to claim).
4. After the timer completes, the reward is granted automatically — **no "Claim" button tap required**. The reward amount decreases with each use per day (see below).

**Reward Scaling (per resource, per day):**
| Use | Energy Reward | Tickets Reward |
|---|---|---|
| 1st Thekr of the day | +2 Energy Cells | +2 Battle Tickets |
| 2nd Thekr of the day | +1 Energy Cell | +1 Battle Ticket |
| 3rd Thekr of the day | +1 Energy Cell | +1 Battle Ticket |
| 4th+ | ❌ Not available until next reset | ❌ Not available until next reset |

> **Design Note:** Diminishing reward quantities are acceptable; diminishing sincerity is not. The dhikr content itself stays short, authentic, and never feels like a chore — no matter which use it is that day.

**Anti-Cheat Verification:**
- The server logs a timestamp when the Thekr card is requested.
- The reward endpoint validates that at least the minimum view duration (5 seconds, up to 10) has elapsed before crediting the reward.
- The client cannot manually trigger the reward — it is server-pushed after timer completion.

---

#### 8.5.4 Admin-Managed Content Pools (CMS)

All human-facing strings in this system are managed through an **admin CMS** — not hardcoded. This allows the team to update, expand, or contextualise content without shipping an app update.

**Thekr (Dhikr/Dua) Pool:**
- Each entry contains:
  - Arabic text (required)
  - Transliteration (required)
  - Translation per supported locale (English, Arabic; extensible to others)
  - Category tag (e.g., *Morning Adhkar*, *Gratitude*, *Protection*, *General Remembrance*)
  - Optional seasonal tag (e.g., `ramadan`, `friday`, `general`) — used to filter contextually relevant entries
- The server tracks which entries a player has already seen. An entry cannot repeat until the full pool for that player has been exhausted, then the cycle resets.
- Admins can add, edit, deactivate, or reorder entries at any time.

**Depletion Message Pool:**
- Each entry contains:
  - Message text per supported locale
  - Resource type it applies to: `energy`, `tickets`, or `both`
  - Display mode: `first_time` (shown only on first depletion of the day) or `repeat` (shown on 2nd+ depletions)
  - Optional seasonal/contextual tag (e.g., `ramadan`, `friday`, `general`)
- Admins control the entire message pool — no messages are hardcoded in the client.
- The client fetches the appropriate message from the server at the moment of depletion, ensuring real-time updates without app releases.

---

## 9. AI Automation System

### 9.1 Purpose
To reduce grind, players can use AI to automatically complete routine battles (campaign farming, daily dungeons, event grinding) while offline.

### 9.2 AI Fuel — Energy Cells
The AI requires **Energy Cells** (a consumable resource) to run. Each auto-battle consumes 1 Energy Cell.
- **Free cap:** Players regenerate 5 Energy Cells per day for free (capped at 10 stored)
- **Subscription:** Monthly pass ($4.99) grants +15 Energy Cells per day and raises the cap to 50
- **Direct purchase:** 20 Energy Cells = 100 Crystals (available as a top-up; not the intended daily method)

### 9.3 AI Tokens (Subscription Perk)
Subscribing to the **Forge Pass** gives you **AI Tokens** each month:
- Free track: 0 AI Tokens
- Paid track: 20 AI Tokens per season
- AI Tokens are consumed **only** when AI fails a task and retries — a safety net to prevent infinite auto-farming
- 1 AI Token = 1 retry attempt on a failed auto-battle

### 9.4 AI Bot System (Scripted Heuristics — MVP Scope)

> **Scope Decision:** True per-player behavioral cloning ("the AI reaches 80% of your skill after ~20 matches") is a genuine ML research problem, not a feature toggle — it is **out of scope for MVP and Phase 1**. For MVP, the AI runs a scripted heuristic bot with tiered difficulty.

**Heuristic Bot Tiers:**
| Tier | Behaviour | Unlocked By |
|---|---|---|
| **Cautious** | Fills slots from left to right, no spell usage | Default |
| **Balanced** | Prioritizes matching factions, uses spells when available | Forge Level 3+ |
| **Aggressive** | Targets weakest enemy slot first, holds spells for high-value moments | Forge Level 5+ |

- Players select a bot tier in the AI settings screen.
- The bot operates only on PvE content; it **cannot** play in PvP Arena, ranked, or clan wars.
- Bot tier selection is free — no paywall on difficulty.

**Post-MVP Roadmap (Phase 3+):** True behavioral personalization (recording player decisions, deck-specific profiles) is documented as a future R&D track but will be designed and estimated separately before committing.

### 9.5 AI Limitations
- AI cannot play in **PvP Arena** (ranked) — only in PvE modes (Campaign, Dungeon Crawl, Event battles)
- AI cannot make meta-level decisions like choosing which chest to open or when to upgrade — these remain player-only
- If the bot's pre-match win probability estimate is below 40%, it will decline to auto-battle and notify the player

### 9.6 Why This Design?
| Problem | Solution |
|---|---|
| Players burn out repeating easy campaign battles | Heuristic bot farms them while offline |
| P2W concerns about auto-play | Bot is limited to PvE only, no rank advantage |
| Bot abuse risk | AI Tokens cap keeps retry farming in check |
| Behavioral cloning is too complex for MVP | Scripted tiers ship on time; personalization is a Phase 3 track |
| Subscription must feel worth it | +Energy Cells + AI Tokens = quality-of-life upgrade, not power |

---

## 10. Localization & Language Support

### 10.1 Supported Languages
| Language | Status | Notes |
|---|---|---|
| **English** | Primary (en) | All UI, cards, lore, store text |
| **Arabic** | Full localization (ar) | RTL layout, Arabic card text, Arabic UI |

Arabic is not an afterthought — it is a **first-class language** from Day 1. All text content (card names, abilities, lore, menus, notifications) is authored in both English and Arabic simultaneously.

### 10.2 RTL (Right-to-Left) UI
- The entire UI layout is designed with **RTL-first** support
- Main navigation: right-aligned (Arabic convention)
- Card text: Arabic calligraphy-style rendered with Unicode-compliant fonts
- Battle HUD: mirrored for Arabic layout (resources on left vs right depending on locale)
- Server-side messages (push notifications, emails) are sent in the player's chosen language

### 10.3 Technical Implementation
- **i18n system:** Unity Localization package (built-in) with String Table Collections
- **Arabic font:** A custom Arabic font (e.g., Noto Naskh Arabic or Cairo) bundled with the app — no reliance on system fonts
- **Fallback:** If Arabic is selected but a string is missing, gracefully fall back to English with a visual indicator
- **Server storage:** Player's `locale` field stored on the Laravel user record — all API responses include localized strings

### 10.4 Arabic Content Strategy
| Content Type | Approach |
|---|---|
| Card names | Translated with cultural resonance (e.g., "Iron Sentinel" → "الحارس الحديدي") |
| Ability descriptions | Precise game-mechanics translation, not literal |
| Lore / Story | Authored natively in Arabic for the Arabic version, not machine-translated |
| UI labels | Standardized glossary (e.g., "Battle" → "معركة", "Deck" → "أوراقك") |
| Store / Shop | Full Arabic e-commerce strings including currency formatting (SAR, AED, EGP) |

### 10.5 Why Arabic First
FORGE's primary market is the MENA region (Saudi Arabia, UAE, Egypt). Arabic support is not just translation — it's a **trust signal** that the game respects its core audience. Competitors (Ludus, Black Deck) offer Arabic only as a low-quality machine translation. FORGE will differentiate by offering a premium Arabic experience from launch.

---

## 11. Game Modes

| Mode | Description | Unlock |
|---|---|---|
| **Story Campaign** | 50 levels of PvE battles, introduces lore and mechanics via interactive onboarding | Day 1 |
| **PvP Arena** | Round-based 1v1 matchmaking with Battlefield Environments | Forge Level 2 |
| **Forge Tower** | 5 faction-specific 50-floor PvE ladders. Permanent progress — cleared floors stay cleared. Farm Shards at any unlocked floor. Uses Battle Tickets. | Forge Level 2 |
| **Dungeon Crawl** | Daily 5-room PvE gauntlet, unique rewards | Forge Level 3 |
| **Forge Depths** ✨ | Roguelike PvE dungeon runs with branching paths, temporary relics, and bosses | Forge Level 4 |
| **Draft Clash** | Limited-time equal-level draft format | Forge Level 5 |
| **Clan War** | Weekly clan-vs-clan tournament | Forge Level 5 |
| **Clan Raid** ✨ | Weekly co-op PvE mega-boss with clan-wide rewards | Forge Level 5 |
| **Grand Tournament** | Monthly top-100 bracket, pure skill, no mid-match events | Grand Forge arena |

---

## 12. The Forge Depths — Roguelike PvE Mode ✨ NEW

A dedicated PvE mode where players take their deck into a **procedurally-generated dungeon** with branching paths. Each run is unique — no two experiences are the same.

### 12.1 Run Structure
```
[START] → Choose path →
    🗡️ Battle Node — Fight enemy with an AI deck
    ❓ Mystery Event — Risk/reward narrative choice
    🏪 Merchant — Buy a temporary card with run-only currency
    🔥 Forge Rest — Heal your cards OR temporarily upgrade one card's skill
    💀 Elite — Hard fight, guaranteed Relic drop
    👑 Boss — End of floor, major reward

3 Floors per run → Final Boss → Run Complete
```

### 12.2 Temporary Relics (Run-Only Modifiers)
Each run you collect 3–5 relics that modify your deck *for that run only*. They're powerful and fun — designed to let players experience "broken" power fantasies they'd never see in balanced PvP.

| Relic | Effect |
|---|---|
| 🔮 **Glass Cannon** | All your cards deal +50% damage but have -30% HP |
| 🌿 **Lifebloom** | All your cards regen 3 HP/s passively for the entire run |
| ⚔️ **Berserker's Edge** | Cards below 30% HP deal double damage |
| 🛡️ **Fortress Protocol** | Your Forge Core starts with 150 HP instead of 100 |
| 🌀 **Spell Echo** | Every spell you cast triggers twice |
| 🔥 **Ember's Fury** | All your cards gain Burn 2 passively |
| ⭐ **Star Forge** | All 1★ cards deploy as 2★ |
| 🎯 **Precision** | All your cards gain Pierce 15% |

### 12.3 Mystery Events (Narrative Choices)
These are short story moments with mechanical consequences:
- *"A mysterious forge offers to upgrade your strongest card to 3★ — but removes your weakest card from the run. Accept?"*
- *"You find an ancient rune. It gives all Ember cards +20% damage, but all Verdant cards lose their abilities for this run. Take it?"*
- *"A wandering merchant will fully heal all your cards — but your next battle has the Burning Ground modifier on all lanes."*
- *"You discover a hidden forge. Sacrifice 20% of your Forge Core HP to add a random Epic card to your hand for this run."*

### 12.4 Boss Mechanics
Bosses have unique rules that break normal gameplay and force creative solutions:

| Boss | Unique Rule |
|---|---|
| **The Amalgam** | Copies your last-played card and deploys it against you |
| **The Nullifier** | Disables all faction synergy bonuses |
| **The Chronarch** | Reverses mana flow — you start with 10 mana and lose 1/second |
| **The Mirror** | Every card you play, the boss plays a mirrored version with +20% stats |
| **The Swarm King** | Every 10 seconds, spawns a 1★ creature in a random lane |

### 12.5 Rewards
- Run currency (can't be hoarded — use it or lose it within the run)
- Completing a full run gives: **Gold + Shards + chance at Rune drops + Perk Shards (post-MVP)**
- **Weekly Leaderboard**: "Deepest run" + "Fastest clear" + "Fewest cards lost"

### 12.6 Why This Matters
Roguelike runs are the #1 proven format for PvE retention in card games (Slay the Spire, Monster Train, Inscryption). The temporary relics let players experience wild, overpowered combos they'd never see in PvP — which is *incredibly fun* and gives PvE its own identity beyond "easier PvP."

---

## 13. Card Acquisition — Dual-Path System

Every card in FORGE has **two routes to ownership**: a randomised draw path (Gems → Packages) and a fully deterministic grind path (Shards). A patient player always knows exactly how far away they are from any specific card. No RNG hell, no credit-card dependency for pulls.

---

### 13.1 Acquisition Paths

**Path A — Packages (Gem-Funded Random Draws)**
Packages are the primary way to discover new cards. They are funded exclusively by **Gems** (the gameplay-earned, non-purchasable currency), making them a playtime reward rather than a payment gateway. This fully resolves the *gharar* (uncertainty/gambling) concern: no real money ever buys a Package.

**Path B — Shard Targeting (Deterministic)**
- Every card pull that produces a card you already fully own auto-converts to **Shards** of that card.
- Shards also drop from dungeons, event completions, and the Shard Shop.
- Collect **100 Shards** of any specific creature or hero → claim that card directly, no draw required.
- The Shard Shop lets players spend Shards on specific cards at known, fixed costs.

**Path C — Direct Shop & Events (Crystal-Funded, Fully Transparent)**
- **Rotating Daily Shop:** Buy specific, pre-revealed cards/heroes with Crystals or Gold.
- **Event-Specific Purchases:** During limited events, specific new Heroes/Commanders are available at a clearly shown price. No mystery. No blind boxes.
- Clan Donation: request specific cards from clanmates once per day; donate to earn Gold.

---

### 13.2 Package Types & Drop Rates

Two separate draw pools exist. Neither can be accessed with real money — only Gems.

#### Standard Card Package (Creatures)
This pool contains Common, Uncommon, Rare, Epic, and Legendary creature cards.

| Rarity | Drop Rate | Notes |
|---|---|---|
| **Common** (1★) | 55.0% | Starter fodder; high volume |
| **Uncommon** (2★) | 28.0% | Solid utility units |
| **Rare** (3★) | 12.0% | Core competitive units |
| **Epic** (4★) | 4.0% | Strong faction anchors |
| **Legendary** (5★) | 1.0% | Faction-defining powerhouses |

> **Calibration note:** 1% Legendary / 4% Epic / 12% Rare is a standard mobile CCG competitive baseline. The guaranteed pity counters below make these feel fair rather than punishing — most players will see a Legendary within their pity window even on a cold streak.

#### Hero Package (Commanders/Heroes only)
This pool contains **Rare, Epic, and Legendary Heroes only** — no Common/Uncommon cards dilute the pool. Because the floor rarity is higher, the pool size is smaller and pulls feel more impactful.

| Rarity | Drop Rate | Notes |
|---|---|---|
| **Rare Hero** | 70.0% | Solid faction commanders |
| **Epic Hero** | 24.0% | Strong signature abilities |
| **Legendary Hero** | 6.0% | Top-tier Surge + Passive combo |

> **Calibration note:** 6% Legendary on a hero-only pool (no Common/Uncommon dilution) is proportionally equivalent in "grind weight" to the 1% Legendary in the Standard pool. The 30-pull pity below keeps the worst-case streak bounded.

---

### 13.3 Pity Counter System

The pity counters are **visible in the Package UI at all times** — e.g., "6 / 10 to next Epic guarantee." This visible countdown is itself a fair retention hook: it shows players true information instead of manufacturing artificial urgency. Both counters are stored server-side and persist across sessions.

#### Standard Package Pity
| Pull Count | Guarantee |
|---|---|
| Every **10 pulls** | Guaranteed Epic or higher (resets counter on hit) |
| Every **50 pulls** | Guaranteed Legendary (resets on hit; an Epic-pity hit at pull 10/20/30/40 does **not** reset this counter) |

#### Hero Package Pity
| Pull Count | Guarantee |
|---|---|
| Every **30 pulls** | Guaranteed Legendary Hero (resets on hit) |

---

### 13.4 Gems as a Strategic Sink (MVP: 2 Sinks)

Gems need a clear spending identity beyond Packages — otherwise early collectors run out of things to spend them on. The two MVP sinks are chosen because they are **deterministic** (no *gharar* question), create genuine "spend now vs. save later" decisions, and stay relevant from early game to end-game.

#### Sink 1 — Wildcard Ticket
- Spend a set amount of Gems to obtain a **Wildcard Ticket** of a chosen rarity (Common, Rare, Epic, or Legendary).
- A Wildcard Ticket redeems for **any specific card of that rarity** — completely bypasses RNG.
- **Strategic tension:** "Do I keep pulling Packages for a chance at my target, or save Gems to guarantee it?"
- Wildcard Tickets can be stored; players can save across multiple sessions.

#### Sink 2 — Milestone Breakthrough Skip
- Spend Gems to skip the **3-duplicate-sacrifice requirement** for a Level 30, 60, or 100 Milestone Breakthrough on any card.
- The card advances to the next milestone and unlocks the corresponding Skill without needing duplicate copies.
- **Strategic tension:** "Do I spend my Gems to fast-track my main card's Skill 3, or save them for Packages?"
- This is a one-time spend per milestone per card — not infinitely repeatable.

#### Post-MVP Sinks (Phase 4+)
Once Perks ship, a **Perk Reroll** sink (spend Gems to reroll an unwanted perk on a creature) will be added to keep Gems relevant for end-game min-maxers.

> **Explicitly avoided:** "Package Pity Reduction" (spend Gems to shave pulls off your pity counter) is **not implemented** — it muddies the clean pity-counter promise and risks feeling like "paying to reduce bad luck," which recreates the psychological pressure this system is designed to avoid.

---

### 13.5 The Forge Tower — Faction Shard Progression

The Forge Tower is the **permanent, grindable Shard farm** — the third leg of the acquisition system alongside Packages (random draws) and Shard targeting (deterministic). Unlike Forge Depths (roguelike, run resets, temporary relics), the Tower tracks persistent progress: once you clear a floor, it stays cleared and can be freely replayed for Shard drops.

#### Structure
Five permanent towers — one per faction (Ironclad, Verdant, Ember, Phantom, Al-Noor) — each with **50 fixed PvE floors** of increasing difficulty. Each tower's card pool is restricted to its faction, making Tower progression a targeted tool for building out a specific faction collection.

#### Entry Cost — Battle Tickets
Tower attempts consume **Battle Tickets** (the same resource used for manual PvE). This means the Tower automatically inherits the **Thekr Wellbeing Gate** (§8.5) at no additional system cost — no new depletion dialog, no new CMS content required. One gate, two use-cases.

#### Drop Rate & Rarity Unlock by Floor Bracket

| Floor Range | Drop Chance / Win | Shards per Drop | Rarity Pool Unlocked |
|---|---|---|---|
| 1–9 | 0% | — | None — warm-up floors; reward Gold + XP fodder cards only |
| 10–19 | 10% | 2 | Common + Uncommon shards |
| 20–29 | 20% | 3 | + Rare |
| 30–39 | 35% | 4 | + Epic |
| 40–49 | 50% | 5 | + Legendary |
| **50 — Tower Peak** | 100% | 8 | All rarities; repeatable weekly for a bonus reward box |

> **Calibration note:** Drop rates and quantities are a first-pass baseline — treat them the same way as the round timer in §4.3: tune during playtesting. The escalation curve (10% → 20% → 35% → 50% → 100%) is intentionally steep at the top to make the final floors feel meaningful and aspirational.

#### Favorite Card & Hero Bias
For each faction tower, the player marks **one Favorite Creature** and **one Favorite Hero** (free to change at any time, no cooldown — this is a preference, never a purchase). When a shard drop triggers:
- **60%** of that drop's shards go to the marked Favorite — if it belongs to the rarity pool unlocked at that floor bracket
- **40%** spread across the rest of the faction's eligible pool, weighted toward lower rarity

This keeps the floor bracket in full control of *rate and quantity* (the progression pacing lever), while Favorite selection only controls *which specific card* benefits most. The two axes are cleanly separated and explainable in a single tooltip.

#### Server Authority
Consistent with §18.5: floor completion, drop rolls, and Favorite selection are all validated and stored server-side. The client submits a Tower attempt request; the server resolves the combat outcome and the shard roll, then pushes the result to the client. Same pattern as existing chest and Battle Ticket flows — no new anti-cheat surface.

#### MVP Scope (Phase 2)
> **Scope Flag:** 5 towers × 50 floors = 250 individual balance points. To avoid pre-launch content debt, the Tower ships in **Phase 2** with:
> - **2 towers** at launch: **Ironclad** and **Al-Noor** (the flagship factions)
> - **Floors 1–20** unlocked at launch; floors 21–50 backfilled in content updates (same pattern as the Story Campaign)
> - Remaining 3 faction towers added in Phase 3 content drops
>
> This delivers the system's retention and Shard-farming value from Day 2 without asking the team to hand-balance 250 floors before launch.

---

## 14. Art Direction — Halal-Compliant Character Design

Since you can't use faces, here are 6 clear directions that look great and are completely compliant:

### Option A: Full Helmet Warriors (Most Familiar)
Medieval/fantasy knights with completely sealed visors. Think Dark Souls-style helmets but with a stylized 2D card art look. Players immediately understand "warrior" without any face.

### Option B: Elemental Constructs (Easiest to AI-generate)
Golems, stone titans, lava beings, crystal entities. They have no faces by nature. Ember faction and Ironclad faction fit perfectly here.

### Option C: Plant & Nature Beings (Verdant Faction)
Humanoid shapes made entirely of vines, bark, leaves, mushrooms. Visually stunning, no face required, familiar from games like Runeterra.

### Option D: Spirit / Mist Entities (Phantom Faction)
Ghost-like forms with glowing cores but no facial features. Dark robes, energy silhouettes, orb eyes (not a face, just glowing dots).

### Option E: Animal Warriors
Armored wolves, bears, eagles with helmets. Very popular in card games (think Clash Royale's hog rider but animal-focused). No human face.

### Option F: Mechanical / Clockwork
Steampunk-style automaton warriors — gears, pipes, bronze armor, no face needed. Very distinct visual style that stands out in app stores.

**Recommended mix:** Ironclad = helmeted warriors + golems, Verdant = plant beings + animal warriors, Ember = lava constructs + fire elementals, Phantom = spirit entities + shadow silhouettes.

### ملاحظة فنية مهمة — رسم الكائنات
> **نستطيع رسم الكائنات ولكن بدون ملامح وجه، أو بملامح وجه غير واضحة.**
>
> هذا يعني أننا نملك مرونة كبيرة في التصميم — يمكن رسم جندي أو مقاتل بشكل اعتيادي تمامًا، لكن مع إخفاء الوجه عبر أحد الأساليب التالية:
> - **خوذة مغلقة بالكامل** (visor مغلق، لا يظهر شيء من الوجه)
> - **وجه في الظل أو مُعتِم** (silhouette داكنة، الملامح غير مرئية)
> - **قناع أو نقاب** يغطي الوجه بالكامل أو أغلبه
> - **وجه ضبابي أو مُموَّه** كالكائنات الروحية والعناصرية
> - **ملامح مبسطة جدًا** بحيث لا تُشكّل صورة واضحة (مثل نقطتين مضيئتين كعيون فقط)
>
> هذا يفتح الباب لتصميمات أكثر تعبيرًا وقوةً بصريًا مقارنةً بالقيود الكاملة، مع الحفاظ على الضوابط الشرعية. الأولوية دومًا: **إذا رأيت الوجه بوضوح، راجع التصميم.**

---

## 14B. Islamic Character Design — الشخصيات ذات الطابع الإسلامي

This section defines a dedicated **5th faction** — or an integrated cross-faction character set — inspired by Islamic civilizational history, Islamic cosmology, and Arabic/Islamic mythology. These are among the most visually rich and culturally underexplored themes in mobile gaming, and they give FORGE a powerful identity in the MENA market that no competitor currently occupies.

> **Design principle:** All characters in this section follow the same face rule — helmets, wrappings, light/shadow obscuring, or non-human form. The Islamic aesthetic comes from architecture, calligraphy, geometric patterns, light symbolism, and historical warrior equipment — not from depicting specific people or religious figures.
>
> **ما لا يُرسم أبدًا:** لا يُصوَّر أي نبي أو صحابي أو ملاك بشكل مباشر. المصدر هو التراث الحضاري والأساطير والتاريخ — وليس الدين مباشرةً.

---

### Faction Name: **النور — Al-Noor (The Light)**

**Identity:** Warriors and constructs forged from light, geometric sacred patterns, and the architectural glory of Islamic civilization at its peak. Where Ironclad is brute steel, Al-Noor is precision, radiance, and wisdom-in-combat.

**Visual Language:**
- Gold and turquoise color palette (classic Islamic art colors)
- Arabic geometric patterns (zellige, girih, arabesque) etched into armor and shields
- Arabic calligraphy woven into card borders and ability effects — not as text to read, but as visual ornament
- Architecture motifs: pointed arches, muqarnas (honeycomb vaulting), minaret silhouettes in the background art
- Light particle effects — cards glow with warm golden light when abilities activate

**Faction Synergy Bonus (3+ Al-Noor cards):**
> **Deploy Light** — Every time you deploy an Al-Noor card onto the battlefield, it releases a burst of warm golden light that heals your Hero for 5 HP. Rewards Al-Noor-heavy decks with sustained Hero durability. *(Note: this is a deploy trigger, not a merge trigger — in FORGE, all star-tier evolution happens outside of battle on the collection screen.)*

---

### Al-Noor Card Roster (Sample — 10 cards)

#### Common Cards
| Card Name | Arabic Name | Visual | Keywords | Ability |
|---|---|---|---|---|
| **Shield Bearer** | حامل الترس | Full chainmail + large round shield with geometric pattern, face wrapped in keffiyeh | Shield, Taunt, Last Stand | **Fortify** — takes 20% less damage when adjacent to another Al-Noor card |
| **Desert Scout** | الطليعة | Hooded desert rider silhouette on horseback, face in shadow under hood | Haste | **Swift Strike** — attacks twice before opponent responds on first deploy |

#### Rare Cards
| Card Name | Arabic Name | Visual | Keywords | Ability |
|---|---|---|---|---|
| **Siege Engineer** | مهندس الحصار | Armored figure operating a منجنيق (mangonel) — siege weapon of Islamic armies | Pierce | **Arc Fire** — hits all 3 enemy lanes simultaneously for reduced damage |
| **Geometric Ward** | حارس الهندسة | A living construct made entirely of interlocking geometric tile patterns, no face by design | Shield, Thorns | **Mirror Shield** — reflects 25% of incoming damage for 8 seconds |
| **Sandstorm Caller** | صاحب العاصفة | Robed figure with swirling sand obscuring face entirely, arms raised | Freeze | **Blinding Sand** — reduces enemy attack speed by 30% for 5 seconds |

#### Epic Cards
| Card Name | Arabic Name | Visual | Keywords | Ability |
|---|---|---|---|---|
| **Mamluk Vanguard** | المقدمة المملوكية | Elite mounted warrior, ornate lamellar armor, helmet with chainmail aventail covering face | Haste | **Cavalry Charge** — deals double damage on first attack, pushes enemy card to back of lane |
| **Astrolabe Sage** | حكيم الأسطرلاب | Robed scholar-construct holding a brass astrolabe, face in deep hood shadow | — | **Celestial Reading** — reveals opponent's next 2 cards to be drawn; your deck draw is immediate next turn |
| **Dhow Captain** | ربان الداو | Armored maritime figure, face wrapped in sea-cloth, standing on a stylized dhow prow | — | **Trade Wind** — generates +2 bonus mana for 6 seconds when deployed |

#### Legendary Cards
| Card Name | Arabic Name | Visual | Keywords | Ability |
|---|---|---|---|---|
| **The Golden Architect** | المعمار الذهبي | A massive construct built from living Islamic architecture — arches form its body, muqarnas form its shoulders, no face, just a glowing geometric core | Shield, Heal | **Bayt Al-Hikmah** *(House of Wisdom)* — while on the field, all your merges produce 3★ effect regardless of star level. Once per match. |
| **Keeper of the Citadel** | حارس القلعة | A towering fortified giant, body resembling a Crusader-era Islamic citadel (like Saladin's Cairo Citadel) with battlements as shoulders | Taunt | **Unbreachable** — cannot be targeted by abilities, only direct attacks. Gains +5 HP every 5 seconds while alive. |

---

### Al-Noor Forge Commander (Hero Card)

**الحكيم — Al-Hakim (The Wise)**
A robed figure seated cross-legged, surrounded by floating geometric light constructs. Face is entirely obscured by a radiant glow emanating from within the hood — like light from a lantern. Holds an open book of geometric diagrams (not Quran — a scholar's engineering manuscript).

**Passive Aura — Ilm (Knowledge):**
> Every 45 seconds, Al-Hakim reveals the 3 rarest cards in the opponent's deck. Once per match, you may choose to discard one of your own cards and immediately draw from the bottom of your deck (bypass bad draws).

**Surge Ability — Illumination:**
> All your cards attack twice for the next 8 seconds. Charges at the 2:00 mark.

---

### Historical Inspiration Reference (for the artist)

These are the real historical sources to draw visual inspiration from — all verifiable, all stunning:

| Inspiration | What to Use Visually | Game Application |
|---|---|---|
| **Mamluk warriors (Egypt, 13th–16th c.)** | Lamellar armor, round shields, ornate helmets with Arabic inscriptions, chainmail coifs | Elite warrior cards, cavalry units |
| **Abbasid Baghdad scholars** | Dark robes, brass scientific instruments (astrolabe, orrery), geometric manuscripts | Sage/support cards |
| **Andalusian architecture (Alhambra)** | Red and gold geometric tile patterns, horseshoe arches, arabesque carvings | Card borders, ability particle effects, background art |
| **Islamic geometric mathematics** | Girih tiles, star polygons, infinite tessellation patterns | Construct card bodies (living geometry) |
| **Fatimid Cairo citadel walls** | Massive stone battlements, pointed arch gates, Arabic inscription bands | Tank/defender card silhouettes |
| **Ottoman Janissary equipment (pre-face era)** | Tall ceremonial helmets (börk), ornate armor, feathered crests | Rare/Epic warrior cards |
| **Arabian Nights / Alf Layla cosmology** | Djinn as smoke/light forms, flying carpets as card backgrounds, lantern glow effects | Phantom-adjacent Al-Noor hybrid cards |
| **Nasrid dynasty star patterns** | 8-point, 10-point, 12-point Islamic stars in gold on deep blue/teal | Card frame design, faction icon |

---

### What to Avoid (Red Lines)

| ❌ Do NOT Use | Reason |
|---|---|
| Any depiction of angels (الملائكة) | Forbidden to depict in Islamic tradition |
| Names or imagery of Prophets or Companions | Deeply sensitive, unnecessary for game design |
| Quranic verses as decorative text | Not appropriate for a game context |
| Crescent + star as a "faction logo" | Overused, potentially reductive of the tradition |
| Djinn depicted as demonic or evil | Problematic framing — if used, portray as neutral cosmic entities |
| Anything resembling prayer poses or religious ritual | Gameplay context trivializes it |
| Gambling/betting mechanics (قمار) | Haram — no stake-doubling, no wager systems, no luck-based paid outcomes |
| Loot boxes with real-money purchase + random outcome | Resembles gambling — use deterministic reward paths instead |

---

### How Al-Noor Fits the Other Factions Strategically

Al-Noor is designed as the **support + precision** faction — it counters Ember's aggression (Deploy Light heals offset burn damage), synergizes with Ironclad (both are armor-heavy), and is countered by Phantom's stealth (can't heal what it can't see). This gives the faction a clear identity in the meta:

```
Al-Noor (Heal/Wisdom) ←→ strong vs Ember (Burn/Aggro)
Al-Noor (Armor/Precision) ←→ synergy with Ironclad (Tank)
Al-Noor (Light/Reveal) ←→ countered by Phantom (Stealth/Dark)
Al-Noor (Speed/Utility) ←→ contested match vs Verdant (Sustain)
```

Pure Al-Noor decks reward patient, strategic players who want to out-think opponents. They are not the easiest faction to win with — but in skilled hands, the strongest.

---

## 15. New Player Onboarding — The Forge Awakening ✨ NEW

Bad onboarding kills 40–60% of players before they finish a tutorial. FORGE uses a **"learn by doing"** approach — no text popups, no walls of instructions.

### 15.1 Interactive Onboarding Flow (~3 minutes)

```
Match 1: "Deploy a card"
         → Only 1 lane available, only 1 card in hand
         → Player learns: tap card, drag to lane, auto-win
         
Match 2: "Deploy cards to counter"
         → Enemy has 1 weak card in each lane
         → Player learns: lane choice matters, placement is strategy
         
Match 3: "Merge two cards!"
         → Given 2 identical cards, forced merge scenario
         → Player learns: merge = power spike, 1★ + 1★ = 2★
         
Match 4: "Cast your first spell!"
         → Hand contains 1 creature + 1 Vine Snare spell
         → Player learns: spells exist, they're instant, they change the fight
         
Match 5: "Full match vs easy AI"
         → Player experiences a complete game loop with 4 cards in hand
         → Guaranteed win (AI plays suboptimally)
         
Match 6: "Here's your reward chest!"
         → Player opens first chest, sees new cards, understands the loop
         → Player learns: win → chest → cards → stronger deck
```

### 15.2 Onboarding Design Rules
- **NO text popups** — use visual highlights (glowing arrows, dimmed-out areas, pulsing buttons)
- **NO forced pauses** — player is always in control, always playing
- Total onboarding: 6 matches in ~3 minutes
- After Match 6, player has: 8 cards, a basic deck, and understanding of deploy/merge/spell/win
- The game transitions seamlessly into **Campaign Level 1** — no menu confusion
- Players can replay the tutorial from Settings if needed

---

## 16. Social & Community Systems ✨ ENHANCED

### 16.1 Friendly Challenges (Day 1 Feature)
Let friends challenge each other with **no cup loss/gain**. This is the #1 requested feature in every card game and costs almost nothing to build.
- Invite via friend code, username, or share link
- Both players see each other's deck composition after the match (learning tool)
- No rewards — purely for fun and practice

### 16.2 Spectate Mode
Watch live clan members' PvP matches in real-time.
- Delayed by 15 seconds to prevent coaching abuse in competitive
- Viewer can send predefined emotes ("Nice merge!", "Wow!", "Come on!")
- Builds community, creates content creators, gives new players a way to learn strategies

### 16.3 Clan Raids (Weekly Co-op PvE Boss)
Each week, the clan faces a **Mega Boss** with 10,000 HP. Each member gets **3 attacks per day**. The clan collectively chips away at the boss.

**Boss Phases:**
- **Phase 1 (100%–75% HP)**: Standard fight with strong AI deck
- **Phase 2 (75%–50% HP)**: Boss gains a new ability (e.g., deploys a free card every 15 seconds)
- **Phase 3 (50%–25% HP)**: Battlefield modifier activates (e.g., Burning Ground on all lanes)
- **Phase 4 (25%–0% HP)**: Boss uses "Desperate Forge" — gains +50% attack speed

**Rewards:**
- Individual damage leaderboard within clan → top 3 get bonus Iron
- Clan milestone thresholds (e.g., deal 5000 damage total → everyone gets a Rare chest)
- Weekly rotation of different bosses keeps it fresh

### 16.4 2v2 Tag Battle (Phase 4+ Feature)
Two players share a battlefield — Player A controls Lanes 1–2, Player B controls Lane 3 and provides spell support. Creates a unique cooperative experience.

### 16.5 Deck Sharing & Community Decks
Players can share deck builds with a **sharable code** (like Clash Royale deck links).
- Community can upvote popular builds on an in-game "Deck Browser"
- Each shared deck shows win rate, arena used, and player rank
- Creates a metagame discussion layer that extends engagement beyond the app

---

## 17. Islamic Compliance Guidelines ✨ NEW

FORGE is designed to be a game Muslim players can enjoy without concern. This section consolidates all Islamic design rules.

### 17.1 Content Rules
| Rule | Application |
|---|---|
| **No gambling mechanics** | No stake-doubling, no wager systems, no "bet" on match outcomes. Cup gain/loss is a fixed ranked system, not a wager |
| **No faces** | All characters use helmets, masks, silhouettes, or non-human forms |
| **No depicting religious figures** | No Prophets, Companions, or angels in any visual or textual form |
| **No Quranic text in gameplay** | Arabic calligraphy used is decorative geometric art, never Quranic verses |
| **No sexualized content** | No revealing armor, no suggestive card art — all characters are fully armored or non-human |
| **No alcohol/intoxicant references** | No "potion" items with alcohol imagery; use "elixir," "forge oil," or "mana fluid" |
| **No music with instruments during prayer times** (optional setting) | Allow players to enable "prayer mode" that mutes music and pauses notifications during prayer times |

### 17.2 Monetization Ethics
| Rule | Application |
|---|---|
| **No purchasing of draws/loot boxes** | You cannot purchase chest/draws containing random cards using Crystals or real money. This prevents *gharar* (gambling/buying what is unknown). All premium purchases must have fully transparent, pre-revealed outcomes |
| **Direct purchase model** | Premium currency is used for specific, fully visible cards/heroes in daily shops or during events |
| **No predatory spending patterns** | No "just one more spin" mechanics, no limited-time pressure sales on children |
| **Transparent drop rates** | If earned chests have random cards, show exact probabilities and drop rates clearly in the info panels |
| **No interest-based systems** | No "credit" or "loan" mechanics in-game economy |

### 17.3 Prayer Mode (Optional Feature)
Players can set their local prayer times. When enabled:
- Game music mutes automatically
- Push notifications are suppressed
- A small, respectful "prayer time" indicator appears
- No gameplay penalty for being offline during prayer times

---

## 18. Tech Stack

Here's why — and what the alternatives look like:

### 18.1 Option Comparison

| | **Unity 2D** | **Flutter + Flame** | **Godot 4** |
|---|---|---|---|
| **Best for** | Games (exactly this use case) | App+game hybrids | Indie 2D games |
| **Learning curve** | Medium | Low if you know Flutter | Low-Medium |
| **2D animation** | Excellent | Good | Very good |
| **Particle effects** | Excellent (VFX Graph) | Limited | Good |
| **Card flip/merge animations** | Native, smooth | Possible but manual | Possible |
| **AI tools available** | Huge ecosystem (Cursor + Unity) | Growing | Growing |
| **Multiplayer/Firebase** | Unity Gaming Services (UGS) | Firebase + custom | Custom only |
| **Asset store** | Massive — card templates, UI kits exist | None | Small |
| **App Store publish** | ✅ Native | ✅ Native | ✅ Native |
| **Your team fit** | Medium (C# learning) | High (you know Flutter) | Medium |

### 18.2 Recommendation For Your Situation

**Go with Unity 2D**, but use **AI tooling aggressively** to compensate for the small team:

- Use **Cursor AI** (or similar) for C# scripting — it handles Unity C# extremely well
- Use **Unity's free 2D starter kits** to get card game framework scaffolding in days, not weeks
- Use **Firebase** for backend (Realtime DB for matchmaking, Firestore for player data, Auth for accounts)
- Use **AI art generation** (Midjourney, Stable Diffusion) for card illustrations — your art direction (helmets, golems, plants) is ideal for AI generation since no faces = fewer prompt problems

### 18.3 Why Not Flutter + Flame?
Flutter + Flame is a valid choice **if you already have Flutter developers** (which you do). The tradeoff:
- Flame is excellent for simple 2D but card merge animations, particle effects, and smooth battle sequences require significantly more custom work compared to Unity
- Unity's Asset Store has ready-made card game frameworks (some for $20–50) that save months of work
- If your 2 employees are Flutter devs with zero Unity exposure, Flutter + Flame is viable — you'd ship MVP faster but hit animation and particle limits earlier

**If you choose Flutter + Flame:** Use Rive for card animations, Laravel as backend (same stack), and keep the visual scope modest (slide-in cards, no complex particle effects initially). The advantage here is you can share DTOs and API contracts more naturally since you already think in Laravel + Flutter.

### 18.4 Suggested Tech Stack (Unity Path)

| Layer | Technology |
|---|---|
| Game Engine | Unity 2022 LTS (2D URP) |
| Language | C# (with Cursor AI assistance) |
| Card Animations | Unity Animator + DOTween (free) |
| Particle Effects | Unity VFX Graph or Shuriken |
| UI | Unity UI Toolkit |
| **Backend API** | **Laravel 12 (REST API + Sanctum for mobile auth)** |
| **Database** | **PostgreSQL (primary data store)** |
| **Cache / Queue State** | **Redis (matchmaking queue, live battle relay, session)** |
| **Real-time PvP** | **Laravel Reverb (WebSocket server) + Redis pub/sub** |
| **Background Jobs** | **Laravel Horizon (chest timers, season resets, push jobs)** |
| **Deployment** | **GCP Compute Engine me-central1 + Laravel Forge** |
| Push Notifications | OneSignal (free tier, works with Laravel via HTTP API) |
| Analytics | Unity Analytics (free) + custom Laravel event logging |
| Thekr System (Ad-Free) | Custom Thekr Reward Module (5s view time, randomized, zero-repetition pool) |
| Art Generation | Midjourney / SDXL for card illustrations |
| Animation (card art) | Rive (export to Unity) |

#### Backend Architecture Notes
- **Auth flow:** Unity client → Laravel Sanctum token → all API calls authenticated via Bearer token
- **PvP matchmaking:** Player joins queue → Laravel pushes to Redis → Reverb notifies matched players → real-time battle relay runs through Reverb WebSocket channel
- **Battle state:** Each card deploy/merge action is sent as a WebSocket event; Laravel validates and broadcasts to opponent — works well since card games are low-frequency (1 action every 2–5 seconds, not FPS-level)
- **Chest timers:** Laravel Horizon job scheduled on dispatch; no polling needed from client
- **Fallback for PvP lag:** If Reverb latency becomes an issue at scale, swap only the in-match relay to **Photon Fusion free tier** (100 CCU) while keeping Laravel for everything else (auth, cards, economy, matchmaking queue)

### 18.5 Security & Anti-Hacking Measures (Anti-Cheat & Hardening)

To prevent cheating, game exploits, database tampering, and Remote Code Execution (RCE) vulnerabilities, the system enforces a strict defense-in-depth security model across the Laravel backend and Unity client.

#### 1. Server-Authoritative Gameplay (No Client Trust)
- **State Validation:** The game client is strictly a visual renderer. All gameplay actions (card deployments, merges, spell casts, mana consumption, card attacks) must be sent as events to the Laravel/Redis backend. The backend validates every event against game rules (e.g., verifying the player actually owns the card, has sufficient mana, and that cooldowns have expired) before updating the master game state and broadcasting to players.
- **Victory Resolution:** Match outcomes (win/loss/draw) are determined exclusively by the server. The client cannot send a "match_won" event to claim victory.

#### 2. Economy & Currency Integrity
- **Server-Side Ledgers:** All progression variables (Gold, Shards, Gems, Crystals, XP, Chest status) are computed and stored on the PostgreSQL database. The client cannot modify these values locally.
- **Time Tampering Protection:** Chest unlock schedules and daily quest resets are tracked using server UTC timestamps. The game is fully immune to local device time modification (time-travel cheats).

#### 3. Secure File Uploads & RCE Prevention (Account Security)
- **Strict MIME Validation:** If profile pictures, custom guild/clan banners, or other attachments are uploaded, they must pass strict backend validation. Only safe image formats are allowed (e.g., `image/jpeg`, `image/png`, `image/webp`).
- **Malicious Payload Mitigation:** 
  - To prevent Remote Code Execution (RCE) or hackers uploading executable files (like `.php`, `.phtml`, `.php5`, `.sh`, `.exe`, or other scripts), files are validated using Laravel's strict mime-type check rather than relying on the client-provided file extension.
  - Uploaded images must be processed (e.g., resized/re-encoded using GD or Intervention Image) on the server to strip any embedded executable payloads (like EXIF data PHP injections).
  - All uploads are stored in an isolated, non-executable storage container (e.g., AWS S3 or private storage with web execution disabled).

#### 4. API & WebSocket Security
- **Authentication & Authorization:** All API endpoints require Laravel Sanctum Bearer tokens. WebSocket connections via Reverb require private channel authentication to ensure users can only send and receive events for battles they are actively authorized to participate in.
- **Rate Limiting:** Enforce strict throttle limits on Laravel routes and Reverb event listeners to prevent API spamming, brute-force attacks, and DDoS attempts.

#### 5. Client Obfuscation & Memory Protection
- **Compilation:** Compile the Unity project using IL2CPP instead of Mono, making decompilation and reverse-engineering of game logic significantly harder.
- **Memory Obfuscation:** Implement memory obfuscation (e.g., Anti-Cheat Toolkit) for sensitive local variables (like client-side UI mana displays or animation states) to prevent memory scanners (e.g., Cheat Engine, GameGuardian) from freeze-editing local UI values.

---

## 19. MVP Scope (What to Build First)

With 2 testers/helpers and AI-assisted development, build this in **4–6 months**:

### Phase 1 — Core Game (Month 1–2)
- [ ] 3-lane battlefield with basic auto-battle
- [ ] 20 creature cards (5 per original 4 factions, Common + Rare only)
- [ ] 6 Forge Spells (1 per faction + 1 neutral) ✨
- [ ] Merge mechanic (1★→2★ only in MVP)
- [ ] Battlefield Environments — 4 modifiers for launch ✨
- [ ] Card Keyword system implemented ✨
- [ ] Card Skill unlocks at Level 2 and 3 (Skill 1 only) ✨
- [ ] Interactive onboarding (6-match tutorial flow) ✨
- [ ] Story Campaign: 20 levels (PvE only) with fixed environment modifiers
- [ ] Basic deck builder (8-card deck in MVP, 6 creatures + 2 spells)
- [ ] Gold currency + card leveling (Power Level 1–3 only)

### Phase 2 — PvP + Economy (Month 3–4)
- [ ] Laravel API + Reverb PvP matchmaking (async fallback first, real-time in Phase 2 end)
- [ ] Arena ladder (3 arenas in MVP)
- [ ] Battle chests system
- [ ] Daily free chest
- [ ] 40 cards total (add Epic tier + more spells)
- [ ] Forge Commander cards (5 commanders — one per faction including Al-Noor)
- [ ] Commander Surge abilities ✨
- [ ] Comeback mechanics (Desperate Forge mana acceleration) ✨
- [ ] Mid-match Forge Events (4 events for launch) ✨
- [ ] Forge Tower — 2 factions (Ironclad + Al-Noor), floors 1–20 (Phase 2 launch) ✨
- [ ] Card Skill unlocks at Level 4 (Skill 2) ✨
- [ ] Friendly Challenges ✨

### Phase 3 — Retention + Polish (Month 5–6)
- [ ] Season Pass
- [ ] Clan system (donate cards, member list, clan chat)
- [ ] Dungeon Crawl mode
- [ ] Full 60-card set (creatures + spells)
- [ ] Full 3★ merge system
- [ ] Rune system
- [ ] Last Stand keyword on select cards ✨
- [ ] Card Skill unlocks at Level 5 (Skill 2+ and Skill 3 for Epic/Legendary) ✨
- [ ] Spectate Mode (clan members) ✨
- [ ] Deck Sharing (sharable codes) ✨
- [ ] Soft launch (limited region test)

### Phase 4 — Depth Expansion (Post-Launch)
- [ ] Forge Depths (Roguelike PvE mode) ✨
- [ ] Clan Raids (weekly co-op boss) ✨
- [ ] Perk System (equippable + levelable Forge Core perks) ✨
- [ ] 2v2 Tag Battle ✨
- [ ] Draft Mode
- [ ] Guild Wars
- [ ] Full Battlefield Environment pool (10 modifiers)
- [ ] Grand Tournament
- [ ] Prayer Mode (optional Islamic feature) ✨
- [ ] Legendary cards (full set)

### What NOT to build in MVP
- Perk System (Phase 4+)
- Forge Depths roguelike (Phase 4+)
- 2v2 Tag Battle (Phase 4+)
- Guild wars (Phase 4+)
- Draft mode (Phase 4+)
- Legendary cards (Phase 3 end at earliest)
- Grand Tournament (post-launch)
- 3D anything

---

## 20. Competitive Differentiation

Why would players choose FORGE over Ludus, Black Deck, BFTT, or Deck Heroes?

| What's Broken in Competitors | What FORGE Does Differently |
|---|---|
| Winner's chest locked behind paywall (Ludus) | All PvP rewards unlock on win, period |
| Ads every 2 minutes (Black Deck) | 100% Ad-Free (Thekr system for voluntary rewards instead) |
| Stale, no updates (Deck Heroes) | Biweekly card + event drops in roadmap |
| Identical visual style (all use fantasy faces) | Unique helmets/constructs/plants — stands out in app store |
| P2W levels ruin PvP fairness | Arena-gated level caps ensure fair matchmaking |
| No real skill expression in battle | Real-time merge decisions + spell timing + lane reading = high skill ceiling |
| Same battlefield every match (all competitors) | Dynamic Battlefield Environments make every match feel different ✨ |
| No comeback chance when losing (Ludus, Black Deck) | Desperate Forge + Commander Surge + Last Stand = every match has a climax ✨ |
| Cards feel like stat sticks (Deck Heroes) | Card Skill Unlock system makes every level-up feel meaningful ✨ |
| No Islamic-compliant option in the market | Only deck builder designed from Day 1 for Muslim audience ✨ |
| PvE is boring filler content (all competitors) | Forge Depths roguelike makes PvE as engaging as PvP ✨ |
| Gambling-like mechanics in monetization | Zero gambling — all rewards are deterministic and transparent ✨ |

---

## 21. Risk Assessment

| Risk | Likelihood | Mitigation |
|---|---|---|
| Art quality too low for app store | Medium | AI generation + 1 freelance card artist for key cards |
| Firebase costs scale unexpectedly | Low-Medium | Firebase free tier handles ~10K DAU; optimize early |
| Unity learning curve too steep | Medium | Use Cursor AI + Unity card game starter kits |
| P2P multiplayer lag | Medium | Use Photon Fusion free tier for real-time; async as fallback |
| Content drought post-launch | High | Pre-build 80 cards before launch, release in waves |
| Copycat from larger studio | Low | Your niche (Halal design, Arabic market) is underserved |
| Spell system too complex for casual players | Medium | Limit to 2 spells per deck in early arenas; unlock 4-spell decks at Steel Forge |
| Battlefield Environments feel unfair | Low | All modifiers are visible to both players; symmetric impact |
| Card Skill system overwhelms new players | Low | Skills unlock gradually through leveling; early arenas cap at Skill 1 |
| Perk System creates P2W perception | Medium | Perks are post-MVP; earned through gameplay only (Forge Depths, Clan Raids) |

---

## 22. Target Audience

**Primary:** Male gamers aged 15–35, MENA region (Saudi Arabia, UAE, Egypt, Pakistan), familiar with Clash Royale / Ludus, want a game they can play without concern about Islamic content restrictions.

**Secondary:** Global fans of card strategy games who enjoy Auto Chess / deck-builders.

**Unique angle:** FORGE is the first well-produced deck-building card game explicitly designed around Halal-compliant art and Islamic cultural identity. This is an underserved gap in the MENA market that gives you a legitimate first-mover advantage. Zero gambling mechanics, zero haram content — by design, not by accident.

---

*Document version 2.3 — Shifted to Modern Neo-Islamic Futurism Aesthetic*  
*Changes from v2.2: Redesigned the visual theme in Section 3 from rustic ancient fantasy to a clean, bright "Neo-Islamic Futurist / Tech-Magic" art direction. Shifted factions to cybernetic, bio-luminescent, plasma, and celestial light constructs. Standardized a modern glassmorphism UI style with skeletal bone animations.*  
*Next step recommended: Build a paper prototype of 2-player battle to validate lane + merge + spell timing feel before writing any code.*
