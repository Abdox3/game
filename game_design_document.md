# 🃏 Game Design Document — Working Title: **FORGE**
### A Deck-Building Strategy Card Game for iOS & Android
**Prepared for:** Abdo | Digital Code  
**Version:** 2.0 — June 2026

---

## 1. Game Summary

**FORGE** is a 2D real-time auto-battle card game where players collect, upgrade, and strategically deploy warrior cards onto a 3-lane battlefield. Cards represent armored soldiers, magical constructs, elemental beings, and mythical creatures — all designed without visible human faces (helmets, masks, silhouettes, plants, golems, spirits, etc.) to respect Islamic guidelines.

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
| **Ironclad** | Sleek Cyber-Clockwork Constructs | Minimalist steel contours, brass gears, geometric shield plates, teal energy cores | Chrono-Sentinel, Alloy Tower, Kinetic Golem |
| **Verdant** | Bio-Luminescent Botanical Entities | Glowing neon-green vines, crystalline bark armor, floating spore nodes | Synth-Thornwall, Neo-Colossus, Bio-Mystic |
| **Ember** | Plasma-Molten Glass Reactors | Matte-black obsidian chassis containing white-hot plasma, floating magma rings | Plasma Drake, Obsidian Brute, Ignis Warden |
| **Phantom** | Holographic Neon Specters | Floating void-glass fragments, dark violet mist forms, geometric hollow eyes | Void Sentinel, Phantasm Anchor, Eclipse Shade |
| **Al-Noor** | Sacred Geometric Celestial Light | White marble with inlaid gold traces, floating turquoise ribbons, geometric light beams | Solar Vanguard, Dome Sentinel, Prism Archon |

### 3.3 UI Design: Modern Glassmorphism
To stand out in the current mobile market, FORGE abandons the heavy, muddy wood-and-stone UI common in older fantasy card games and adopts a high-end, clean look:
- **UI Styling:** Dark glassmorphic panels (semi-transparent blur) with thin, crisp gold, turquoise, and white-neon outlines.
- **Typography:** Sleek, modern sans-serif fonts (e.g., *Outfit*, *Inter*) for a clean, legible mobile display.
- **Visual Feedback:** Tactile micro-animations, glowing hover states, and smooth card scale-up transitions.
- **VFX & Particles:** Smooth particle emitters, floating light ribbons, and clean dust paths instead of chaotic flashes. Card merges trigger a geometric ring wave (girih pattern) expanding from the center.

### 3.4 Animation Style
- **Fluid & Tactile:** Sprites use modern skeletal bone animations (via Spine or Rive) for smooth, subtle breathing, attack swings, and drift animations.
- **Card Merging:** The cards dissolve into pure geometric energy particles that feed into the higher-tier card.
- **Minimalist 3D Effects:** Use parallax background scrolling and 2.5D rotating card fronts in the menu to create depth while maintaining a lightweight 2D engine.

---

## 4. Core Gameplay Loop

### 4.1 Battlefield Layout
```
[ Enemy Lane 1 ] [ Enemy Lane 2 ] [ Enemy Lane 3 ]
         ↕ Auto-battle happens here ↕
[ Your  Lane 1 ] [ Your  Lane 2 ] [ Your  Lane 3 ]
```
- 3 lanes, each lane holds up to 3 stacked cards
- Cards auto-attack the card directly across from them
- If a lane has no card across, the attacker damages the enemy **Forge Core** (base HP)
- Destroy the enemy's Forge Core to win

### 4.2 The Merge Mechanic (from Ludus)
- Deploy two identical cards in the same lane → they **merge** into a stronger version (next star level)
- 1★ + 1★ → 2★ (stronger stats, new visual)
- 2★ + 2★ → 3★ (max power, unique ability unlocks)
- Merging mid-battle is the real-time skill expression — timing matters

### 4.3 Turn Structure (simplified from Deck Heroes)
- Each player starts with a **hand of 4 cards** drawn from their 12-card deck
- You get **1 mana per second** (shown as a filling bar)
- Cards cost 2–6 mana to deploy
- After deploying, draw the next card from your deck
- No turn waiting — it's real-time, like Ludus + Clash Royale

### 4.4 Win Condition
- Destroy the enemy Forge Core (starts at 100 HP) → Win
- Time runs out (3 minutes) → whoever dealt more damage wins
- Tie → Sudden Death: both Cores lose 10 HP every 5 seconds until one falls

### 4.5 Forge Spells (Action Cards) ✨ NEW

Not every card is a creature. **Forge Spells** are instant-effect cards that cost mana but don't occupy a lane slot. They add **reactive gameplay** — the ability to respond to what your opponent does mid-fight — and create dramatic swings.

#### Spell Card List (Core Set)
| Spell | Faction | Mana Cost | Effect |
|---|---|---|---|
| **Iron Tempering** | Ironclad | 3 | Give one friendly card +30% HP for 15 seconds |
| **Vine Snare** | Verdant | 2 | Freeze an enemy card for 4 seconds (can't attack or be moved) |
| **Flame Wave** | Ember | 4 | Deal 15 damage to all cards in one enemy lane |
| **Shadow Swap** | Phantom | 3 | Swap the positions of two of your cards across lanes |
| **Radiant Burst** | Al-Noor | 3 | Heal all your cards for 10 HP and reveal enemy hand for 5s |
| **Forge Strike** | Neutral | 5 | Deal 20 damage directly to enemy Forge Core |
| **Ironhide** | Ironclad | 2 | One friendly card becomes immune to spells for 10 seconds |
| **Overgrowth** | Verdant | 4 | Summon a 1★ Thornwall in an empty lane slot |
| **Ember Trail** | Ember | 3 | All your Ember cards deal Burn 3 for 8 seconds |
| **Veil of Shadows** | Phantom | 3 | All your cards gain Stealth for 4 seconds |

#### Spell Rules
- Spells are drawn into hand like any card, but play instantly (no lane placement needed)
- Spells **cannot be merged** — they're single-use
- A deck can contain **2–4 spells** out of the 12 total cards
- Max 2 copies of any single spell
- When played, spells show a brief visual effect on the battlefield (vine tendrils wrapping, flames erupting, etc.)

#### Why Spells Matter
Spells create **interactive gameplay**. When your opponent plays Flame Wave, you need to think about lane spacing. When they hold 4 mana and haven't played anything, you wonder "are they holding a spell?" This creates **psychological tension** that pure creature deployment can't achieve.

### 4.6 Battlefield Environments (Forge Arenas) ✨ NEW

Every match isn't the same anymore. Each match randomly assigns **1–2 lane modifiers** from a pool. These are visible to both players at match start and change how those specific lanes behave.

#### Arena Modifier Pool
| Arena Modifier | Effect | Strategic Impact |
|---|---|---|
| **Burning Ground** | All cards in this lane lose 2 HP/s | Favors high-HP Ironclad/Al-Noor; punishes swarm |
| **Shadow Veil** | Cards in this lane are invisible to opponent until they attack | Phantom faction dream lane |
| **Overgrowth** | Cards in this lane heal 3 HP/s | Makes this lane very hard to clear; Verdant paradise |
| **Crumbling Bridge** | Lane only holds 2 cards instead of 3 | Forces quality over quantity |
| **Mana Spring** | Deploying to this lane costs -1 mana | Rush lane; tempo play |
| **Ancient Forge** | Merges in this lane produce 3★ directly (skip 2★) | High-value merge target |
| **Void Rift** | Cards here can attack ANY enemy lane, not just the opposite | Disrupts lane-matching strategy |
| **Sandstorm** | All cards in this lane have -20% attack speed | Punishes aggro builds, favors tanks |
| **Sacred Ground** | Cards in this lane cannot be targeted by spells | Safe haven; forces direct combat |
| **Crumbling Ruins** | At 1:30, this lane collapses — all cards in it are destroyed | Timed risk; deploy late |

#### Implementation Rules
- **PvP Arena**: 1 random modifier per match (2 modifiers in Grand Forge arena)
- **PvE Campaign**: Story missions have fixed, thematic modifiers (e.g., a volcano level = Burning Ground on all lanes)
- **Draft Mode**: 2 random modifiers to increase variance and skill expression
- Modifiers are shown during a **10-second "Arena Reveal" phase** before the match starts — gives players a moment to mentally adjust their strategy
- Both players always see the same modifiers simultaneously — no information asymmetry

### 4.7 Mid-Match Forge Events ✨ NEW

At the **1:30 mark** (halfway through the match), a random event triggers with a 5-second warning animation. These create **"moment of drama"** that prevent matches from feeling predictable.

| Event | Effect | Duration |
|---|---|---|
| **Mana Storm** | Both players gain +3 mana instantly | One-time |
| **Quake** | All cards lose 20% current HP | One-time |
| **The Forge Awakens** | A neutral 3★ card spawns in a random empty lane slot — first to defeat it claims it | Until defeated |
| **Eclipse** | All card abilities are disabled for 10 seconds | 10 seconds |
| **Double Time** | All attack speeds doubled for 15 seconds | 15 seconds |
| **Reinforcements** | Both players draw 2 extra cards | One-time |
| **Iron Rain** | All cards gain +10% ATK for the rest of the match | Permanent |
| **Healing Winds** | All cards heal 20% of their max HP | One-time |

#### Event Rules
- Only **1 event per match** — never stacks
- Events happen in **PvP Arena** and **Dungeon Crawl** modes
- Events are **disabled** in Grand Tournament and Draft Clash to preserve pure competitive integrity
- Both players see the event simultaneously with a dramatic screen-wide animation ("THE FORGE AWAKENS" with screen rumble)
- Events are NOT random dice rolls — they're selected from a curated pool that balances the current match state (e.g., if both players have low HP cards, Healing Winds is more likely)

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
- **Rarity** (Common, Rare, Epic, Legendary)
- **ATK** — damage per attack cycle
- **HP** — health before card dies
- **Speed** — how fast the card attacks (Slow / Normal / Fast)
- **Keywords** — standardized ability tags (see 5.5)
- **Skills** — special abilities that unlock at specific card levels (see 5.6)

### 5.3 Card Rarities
| Rarity | Color | Drop Rate | Power Level |
|---|---|---|---|
| Common | Gray | 70% | Starter cards, easy to merge |
| Rare | Blue | 20% | Mid-tier synergy cards |
| Epic | Purple | 8% | Game-changers, strong abilities |
| Legendary | Gold | 2% | Most powerful, unique effects |

### 5.4 Sample Card Abilities (no faces, themed)
| Card | Faction | Keywords | Ability |
|---|---|---|---|
| Tower Knight | Ironclad | Shield, Taunt | **Shield Wall** — all Ironclad cards gain +20% HP when this is on the field |
| Thornwall | Verdant | Thorns | **Thorn Barrier** — reflects 15% damage back to attacker |
| Cinder Drake | Ember | Burn | **Searing Breath** — deals 5 damage per second to all enemy lane cards |
| Void Shade | Phantom | Stealth | **Phased** — untargetable for first 5 seconds after deployment |
| Root Colossus | Verdant | Freeze, Last Stand | **Entangle** — freezes the enemy card in front for 3 seconds on merge |
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

### 5.6 Card Skill Unlock System ✨ NEW

Cards don't start with all their abilities. **Skills unlock progressively as a card levels up**, giving players a sense of growth and mastery with every card they invest in.

#### How It Works
Each card has up to **3 skill slots** that unlock at specific card levels:

| Card Level | What Unlocks | Example (Tower Knight) |
|---|---|---|
| **Level 1** | Base stats only (ATK, HP, Speed) + 1 keyword | Shield 10% |
| **Level 2** | **Skill 1 unlocks** — a passive ability | Shield Wall: Ironclad allies gain +10% HP |
| **Level 3** | **Skill 1 upgrades** — passive ability strengthens | Shield Wall: Ironclad allies gain +20% HP |
| **Level 4** | **Skill 2 unlocks** — an active/triggered ability | Fortified Stance: On merge, gains Taunt for 5 seconds |
| **Level 5** | **Skill 2 upgrades** + **Skill 3 unlocks** (for Epic/Legendary only) | Fortified Stance: Taunt for 8 seconds + Iron Will: Cannot be killed for 2 seconds after Taunt ends |

#### Skill Types
| Skill Type | Trigger | Example |
|---|---|---|
| **Passive** | Always active while card is on field | "All Ironclad allies gain +20% HP" |
| **On Deploy** | Triggers once when the card is first placed | "Freeze the nearest enemy for 3 seconds" |
| **On Merge** | Triggers when this card participates in a merge | "Deal 10 damage to all enemy cards in the lane" |
| **On Death** | Triggers when this card is destroyed | "Explode for 20 damage to the entire enemy lane" |
| **Last Stand** | Triggers when card drops below 25% HP | "ATK doubles for remaining attacks" |

#### Detailed Skill Unlock Examples

**Common Card — Thornwall (Verdant)**
| Level | Unlock | Description |
|---|---|---|
| 1 | Base + Thorns 10% | Reflects 10% damage |
| 2 | Skill 1: Barbed Growth | Thorns increases by 5% for each Verdant card on field |
| 3 | Skill 1+: Barbed Growth | Thorns increases by 8% per Verdant card |
| 4 | Skill 2: Root Anchor | On Deploy — cannot be moved or swapped by enemy spells for 6 seconds |
| 5 | Skill 2+: Deep Roots | Root Anchor lasts 10 seconds and heals 5 HP/s during anchor |

**Rare Card — Sandstorm Caller (Al-Noor)**
| Level | Unlock | Description |
|---|---|---|
| 1 | Base + Freeze 2s | Freezes enemy on deploy for 2 seconds |
| 2 | Skill 1: Desert Wind | On Deploy — reduces all enemy attack speed by 15% for 4 seconds |
| 3 | Skill 1+: Desert Wind | Duration increases to 6 seconds |
| 4 | Skill 2: Sandwall | On Merge — creates a barrier that absorbs the next 30 damage to your Forge Core |
| 5 | Skill 2+: Sandwall | Barrier absorbs 50 damage and reflects 10 back |

**Epic Card — Mamluk Vanguard (Al-Noor)**
| Level | Unlock | Description |
|---|---|---|
| 1 | Base + Haste | Attacks immediately on deploy |
| 2 | Skill 1: Cavalry Momentum | First attack deals +50% damage |
| 3 | Skill 1+: Cavalry Momentum | First attack deals +100% damage (double) |
| 4 | Skill 2: Push Back | On first attack, pushes enemy card to back of lane queue |
| 5 | Skill 2+: Push Back + Skill 3: Commander's Charge | Push Back stuns for 2s. Skill 3: If this card kills an enemy, gain +3 mana instantly |

**Legendary Card — The Golden Architect (Al-Noor)**
| Level | Unlock | Description |
|---|---|---|
| 1 | Base stats (very high HP) | No special abilities yet — raw stat power |
| 2 | Skill 1: Geometric Shield | All friendly cards gain Shield 10% while Architect is alive |
| 3 | Skill 1+: Geometric Shield | Shield 15% + heals 2 HP/s to adjacent cards |
| 4 | Skill 2: Bayt Al-Hikmah | While alive, all merges produce 3★ regardless of star level. Once per match. |
| 5 | Skill 2+ & Skill 3: House of Wisdom + Eternal Design | Bayt Al-Hikmah can trigger twice per match. Skill 3: On Death, all remaining friendly cards gain +30% ATK for 10 seconds (legacy buff) |

#### Design Philosophy
> **Why lock skills behind levels?** This creates a meaningful progression curve. A Level 1 Tower Knight is a decent tank — but a Level 5 Tower Knight is a strategic powerhouse with Taunt, Shield Wall, and Iron Will. This makes leveling feel **rewarding** rather than just "+10% stats." It also means new players can understand a card's basic function immediately, then discover deeper strategic possibilities as they invest in it.

> **Balance Rule:** Card level caps remain **arena-gated** (Section 7.4). This means a Copper Forge player can never face a Level 5 card with Skill 3 unlocked — they only face Level 1–3 cards. The skill system adds depth without breaking fairness.

### 5.7 Faction Synergy Bonus
Running 3+ cards of the same faction in your deck activates a **passive bonus**:
- **Ironclad** (3+): All your cards gain +15% HP
- **Verdant** (3+): Regenerate 0.5 HP/s per card on field
- **Ember** (3+): All attacks deal +10% damage
- **Phantom** (3+): Cards enter with a 2-second stealth phase on deploy
- **Al-Noor** (3+): Every merge heals all your other cards for 5 HP (Radiance)

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
| **Grove Shaper** | Verdant | One free merge per match costs 0 mana | **Full Bloom** — Heal all your cards to full HP |
| **Emberlord** | Ember | Every 30 seconds, deals 10 damage to all enemy cards | **Inferno** — Deal 30 damage to all enemy cards |
| **Voidkeeper** | Phantom | Reduces enemy attack speed by 10% passively | **Void Collapse** — Remove the strongest enemy card for 6 seconds |
| **Al-Hakim** | Al-Noor | Every 45s, reveals the 3 rarest cards in opponent's deck | **Illumination** — All your cards attack twice for 8 seconds |

---

## 7. Progression System (How Players Get Stronger)

This is where you can fix what's broken in all 4 reference games. **The goal: skill matters first, power level matters second.**

### 7.1 Card Leveling
- Cards level up by collecting **Shards** (duplicate cards become shards)
- Card levels: 1 → 5 (max), each level gives +10% ATK and HP
- **Skill unlocks** at levels 2, 3, 4, and 5 (see Section 5.6) — this is the primary reason to level cards
- Level-up cost uses **Iron** (soft currency, earned through gameplay)
- Level cap is **arena-gated**: you can't level a card beyond your current arena's cap → this keeps matchmaking fair

### 7.2 Forge Core Upgrades (Base Progression)
Players upgrade their **Forge** (base HQ) which unlocks:
- New card slots in deck (starts at 8, unlocks to 12 gradually)
- New arena access
- Passive income speed (resource generation)
- Clan participation

Forge upgrades use **Iron** (free currency) + **Crystals** (premium), but Iron is enough for all core upgrades.

### 7.3 Runes (Artifact Equivalent)
Equip **Runes** to your Forge Commander to add passive bonuses:
- Max 3 Rune slots (unlock at Forge levels 3, 6, 10)
- Runes: Common (ATK+, HP+), Rare (Speed, Regen), Epic (Faction bonus amplifiers)
- Runes drop from dungeons and event chests, NOT behind heavy paywalls

### 7.4 Arena Ladder (PvP Rank System)
| Arena | Name | Cup Range | Card Level Cap | Skills Available |
|---|---|---|---|---|
| 1 | Copper Forge | 0–400 | Level 3 max | Skill 1 only |
| 2 | Iron Forge | 400–900 | Level 4 max | Skill 1 + Skill 2 |
| 3 | Steel Forge | 900–1600 | Level 5 max | All skills |
| 4 | Crystal Forge | 1600–2500 | Level 5 + Epic unlock | All skills |
| 5 | Shadow Forge | 2500–4000 | Level 5 + Legendary unlock | All skills |
| 6 | Grand Forge | 4000+ | Uncapped, tournament tier | All skills |

Win PvP → earn **Cups** → rise in arena. Lose → lose cups. This creates fair bracket play — you always face players at your same strength tier.

### 7.5 How Players Compete with Others
1. **PvP Arena** — real-time matchmaking against players in the same cup range
2. **Ranked Season** — monthly reset, top players earn exclusive cosmetic rewards (no stat advantage)
3. **Clan Wars** — weekly clan vs clan tournament, 10 members each, contributes to clan score
4. **Draft Mode** — each player picks from random card pool (levels disabled) — pure skill, no pay-to-win
5. **Challenge Events** — limited-time modes with fixed decks, everyone on equal footing

### 7.6 Perk System (Post-MVP — Phase 4+) ✨ NEW

> **Note:** Perks are a major depth layer designed for **post-launch**. They should NOT be included in the MVP. This section documents the design so it's ready when the time comes.

#### What Are Perks?
Perks are **equippable passive bonuses** that modify your overall playstyle. Unlike Runes (which attach to your Commander), Perks attach to your **Forge Core** and affect your entire battlefield.

#### Perk Slots
- Players start with **0 perk slots**
- Slot 1 unlocks at Forge Level 8
- Slot 2 unlocks at Forge Level 12
- Slot 3 unlocks at Forge Level 15 (end-game content)

#### Perk Leveling
Each perk can be leveled from **Level 1 → Level 5** using **Perk Shards** (a new resource earned from Forge Depths runs and Clan Raids).

| Perk Level | Cost | Improvement |
|---|---|---|
| Level 1 | Free (on acquire) | Base effect |
| Level 2 | 50 Perk Shards | +25% effect strength |
| Level 3 | 150 Perk Shards | +50% effect strength |
| Level 4 | 400 Perk Shards | +75% effect strength + visual upgrade |
| Level 5 | 1000 Perk Shards | +100% effect strength + unique particle effect |

#### Sample Perks

| Perk | Base Effect (Lv 1) | Max Effect (Lv 5) | Playstyle |
|---|---|---|---|
| **Swift Deployment** | Cards deploy 10% faster (reduced animation delay) | 20% faster | Aggro/Rush |
| **Fortified Core** | Forge Core starts with +10 HP (110 total) | +20 HP (120 total) | Defensive/Control |
| **Mana Flow** | +0.1 mana/second generation | +0.2 mana/second | Economy/Spell-heavy |
| **Merge Mastery** | Merged cards gain +5% bonus ATK | +10% bonus ATK | Merge-focused |
| **Battle Wisdom** | Start with 5th card drawn at match start | 5th card + first spell costs -1 mana | Combo |
| **Thorn Aura** | All your cards reflect 3% damage | 6% damage | Verdant synergy |
| **Shadow Step** | All your cards gain 1 second of Stealth on deploy | 2 seconds of Stealth | Phantom synergy |
| **Ember Heart** | Your Burn effects deal +10% damage | +20% damage | Ember synergy |
| **Iron Constitution** | Your cards with Shield keyword gain +10% bonus HP | +20% bonus HP | Ironclad synergy |
| **Radiant Favor** | Merge healing (Al-Noor synergy) heals +2 extra HP | +4 extra HP | Al-Noor synergy |

#### Perk Acquisition
- **Common Perks**: Guaranteed drop from completing Forge Depths Floor 1
- **Rare Perks**: Random drop from Forge Depths Floor 2+, or purchasable in Shard Shop
- **Epic Perks**: Rare drop from Forge Depths Floor 3 boss, or Season milestone reward
- **Perk Shards for leveling**: Earned from Forge Depths runs, Clan Raids, and weekly challenge completions

#### Why Perks Are Post-MVP
Perks add a **third layer of strategy** (deck building → card skills → perks). Introducing them too early would overwhelm new players. They're designed as a "depth expansion" for players who've mastered the core game and need more to optimize.

---

## 8. Economy & Monetization (Fair Design)

The biggest failure of Ludus, Black Deck, and Deck Heroes is **punishing free players**. Here's a balanced model:

### 8.1 Currencies
| Currency | Name | How Earned | Used For |
|---|---|---|---|
| Soft (free) | **Iron** | Battles, daily quests, chests | Card leveling, Forge upgrades |
| Shards | **Shards** | Duplicate cards, weekly chest | Card leveling |
| Hard (paid/earnable) | **Crystals** | Purchase, seasonal rewards, achievements | Speed-ups, cosmetics, chest refreshes |

### 8.2 What Crystals Can Buy (CRITICAL for F2P trust & Islamic Compliance)
✅ Cosmetic card skins (visual only)  
✅ Extra chest slots / speed-ups (convenience, not power)  
✅ Season Pass (bonus Iron income, cosmetics — NOT exclusive cards)  
✅ Direct Purchase Shop: Buying specific, pre-revealed cards, Commanders/Heroes, or materials (always fully visible prior to purchase)  
✅ Event-Specific Shop: Directly buying a specific card or Hero during designated events  
❌ **NEVER sell random draws/loot boxes/mystery chests** — all premium currency purchases must have 100% transparent and deterministic outcomes (no buying what you don't know)  
❌ **NEVER sell power directly** — no card level boosts, no Legendary card bundles  
❌ **NEVER gate tournament winner's reward behind payment** (Ludus's biggest mistake)

### 8.3 Battle Pass (Season Pass)
- Free track: 30 days of daily Iron rewards, Shards, Common/Rare cards
- Paid track (~$4.99/month): 2x Iron rate + cosmetic skins + 1 guaranteed Epic card per season
- The paid pass gives speed, not power — F2P can reach the same card levels in ~2 weeks longer

### 8.4 Reward Loop
```
Win Battle → Earn Iron + Chest Slot fills
Open Chest (1–4 hours) → Get Cards + Shards
Duplicate Card → Becomes Shards
Shards → Level Up Card → Unlock New Skills
Stronger Card (with new skills) → Win More → Better Chests
```
Free players always have something to open, always making progress.

---

## 9. AI Automation System

### 9.1 Purpose
To reduce grind, players can use AI to automatically complete routine battles (campaign farming, daily dungeons, event grinding) while offline. The AI learns from the player's playstyle and deck preferences to make intelligent decisions during auto-battles.

### 9.2 AI Fuel — Energy / Tokens
The AI requires **Energy Cells** (a consumable resource) to run. Each auto-battle consumes 1 Energy Cell.
- **Free cap:** Players regenerate 5 Energy Cells per day for free (capped at 10 stored)
- **Subscription:** Monthly pass ($4.99) grants +15 Energy Cells per day and raises the cap to 50
- **Direct purchase:** 20 Energy Cells = 100 Crystals (not recommended for daily play, available as top-up)

### 9.3 AI Tokens (Subscription Perk)
Subscribing to the **Forge Pass** gives you **AI Tokens** each month:
- Free track: 0 AI Tokens
- Paid track: 20 AI Tokens per season
- AI Tokens are consumed **only** when AI fails a task and retries — a safety net to prevent infinite auto-farming
- 1 AI Token = 1 retry attempt on a failed auto-battle

### 9.4 AI Learning System
The AI doesn't just random-play — it learns from the player:
- **Playstyle mirroring:** The AI records your manual battle decisions (when you merge, which lane you prioritize, when you save mana) and builds a lightweight behavioral model per deck
- **Deck-specific profiles:** Each saved deck has its own AI profile — swap decks and the AI adapts its strategy
- **Learning persistence:** AI performance improves the more you play manually with a given deck; after ~20 manual matches, the AI reaches ~80% of your skill level with that deck
- **Reset:** Players can manually reset a deck's AI profile at any time (no cost)

### 9.5 AI Limitations
- AI cannot play in **PvP Arena** (ranked) — only in PvE modes (Campaign, Dungeon Crawl, Event battles)
- AI cannot make strategic decisions like choosing which chest to open or when to upgrade — these remain player-only
- AI has a **max confidence threshold**: if the AI calculates a <40% win chance for a battle, it will refuse to auto-battle and notify the player

### 9.6 Why This Design?
| Problem | Solution |
|---|---|
| Players burn out repeating easy campaign battles | AI farms them while offline |
| P2W concerns about auto-play | AI is limited to PvE only, no rank advantage |
| Bot abuse risk | AI Tokens cap + manual play requirement keeps it fair |
| AI too dumb to be useful | Learning system makes AI smarter the more you play |
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
| **PvP Arena** | Real-time 1v1 matchmaking with Battlefield Environments | Forge Level 2 |
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
| 🌿 **Lifebloom** | Heal 5 HP after every merge |
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
- Completing a full run gives: **Iron + Shards + chance at Rune drops + Perk Shards (post-MVP)**
- **Weekly Leaderboard**: "Deepest run" + "Fastest clear" + "Fewest cards lost"

### 12.6 Why This Matters
Roguelike runs are the #1 proven format for PvE retention in card games (Slay the Spire, Monster Train, Inscryption). The temporary relics let players experience wild, overpowered combos they'd never see in PvP — which is *incredibly fun* and gives PvE its own identity beyond "easier PvP."

---

## 13. Card Acquisition (No Gacha Frustration & Transparent Purchase)

The most important F2P fix — **no buying random draws**:

1. **Draws & Chests are ONLY Earned through Gameplay:** You cannot buy random card packs, chest draws, or mystery boxes with Crystals or real money (preventing *gharar*/gambling). They are strictly earned by active play:
   - **Battle Chests** — earned by winning PvP matches, containing cards from your current arena pool.
   - **Daily Free Chest** — 1 free Common/Rare chest per day.
   - **Season Milestone Chest** — complete 30/60/90 battles in a season → guaranteed Rare/Epic/Legendary chests.
2. **Direct Shop & Event-Based Sales (No Mystery):** Players spend currency only on fully transparent, specific cards/heroes:
   - **Rotating Daily Shop** — Buy specific, pre-revealed cards using Crystals or Iron.
   - **Shard Shop** — Exchange duplicate-card shards for specific cards/materials of your choice.
   - **Event-Specific Purchases** — Limited-time game events where users can directly buy specific new Heroes/Commanders or cards (every purchase is fully shown beforehand; absolutely no blind draws).
3. **Clan Donation** — request cards from clanmates once per day, donate to earn Iron.

This means: a patient player **always knows how many more battles or exactly how much currency** is needed to unlock the specific card/hero they want. No RNG monetization hell.

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
> **Radiance** — Every time a card merges, it releases a burst of light that heals all your other cards for 5 HP. Rewards the merge-heavy playstyle.

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

Al-Noor is designed as the **support + precision** faction — it counters Ember's aggression (Radiance heals cancel burn damage), synergizes with Ironclad (both are armor-heavy), and is countered by Phantom's stealth (can't heal what it can't see). This gives the faction a clear identity in the meta:

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
| Ads (optional) | Unity Ads (rewarded video only) |
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
- **Server-Side Ledgers:** All progression variables (Iron, Shards, Crystals, XP, Chest status) are computed and stored on the PostgreSQL database. The client cannot modify these values locally.
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
- [ ] Iron currency + card leveling (Level 1–3 only)

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
| Ads every 2 minutes (Black Deck) | Ads are voluntary, rewarded only |
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
