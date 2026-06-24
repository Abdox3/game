# 🃏 Game Design Document — Working Title: **FORGE**
### A Deck-Building Strategy Card Game for iOS & Android
**Prepared for:** Abdo | Digital Code  
**Version:** 1.0 — June 2026

---

## 1. Game Summary

**FORGE** is a 2D real-time auto-battle card game where players collect, upgrade, and strategically deploy warrior cards onto a 3-lane battlefield. Cards represent armored soldiers, magical constructs, elemental beings, and mythical creatures — all designed without visible human faces (helmets, masks, silhouettes, plants, golems, spirits, etc.) to respect Islamic guidelines.

The core loop: **collect cards → build a deck → fight PvP/PvE → earn rewards → get stronger → build a better deck**. Matches last 2–4 minutes. Strategy happens before the match (deck building), and during it (card placement timing, merge decisions).

**Inspired by:**
- **Ludus (Merge Arena)** → merge mechanic + auto-battle placement
- **Black Deck** → turn-based card attack order + faction system
- **Deck Heroes** → lane-based creature deployment + hero anchor card
- **Battle for the Throne (BFTT)** → kingdom upgrades + resource-based progression

---

## 2. Core Design Goals

| Goal | What It Means in Practice |
|---|---|
| Easy to learn | First 3 battles completable without reading any tutorial text |
| Hard to master | Deck synergies, counter-decks, merge timing create deep meta |
| No faces (Halal design) | All card art uses helmets, masks, golems, plants, spirits, animals |
| Fair F2P | Skill + strategy wins over raw card level, especially in lower arenas |
| Engaging long-term | Multiple systems unlock gradually — not all at once on Day 1 |
| Small team buildable | No 3D, no open world, no voice acting — tight scope |

---

## 3. Theme & Visual Style

### 3.1 World Setting
The world of **FORGE** is an ancient realm where great Forgemasters craft living warriors from iron, stone, nature, and spirit energy. There are no "people" — only **Constructs**. This gives you unlimited creative freedom and makes the game culturally neutral.

### 3.2 Card Factions (4 factions, no faces)
| Faction | Identity | Visual Style | Example Cards |
|---|---|---|---|
| **Ironclad** | Heavy armored war machines | Full plate armor, closed helmets, shields | Iron Sentinel, Tower Knight, Siege Golem |
| **Verdant** | Nature-powered plant/vine creatures | Thorned vines, mushroom caps, bark armor | Thornwall, Root Colossus, Spore Mystic |
| **Ember** | Fire & molten lava constructs | Lava-cracked stone, ember glow, no faces | Cinder Drake, Magma Brute, Flame Warden |
| **Phantom** | Shadow/spirit/ghost entities | Mist forms, robes with no face, orbs | Wraith Guard, Soul Anchor, Void Shade |

### 3.3 Animation Style
- **Smooth and simple** like Ludus and Black Deck
- 2D sprites with 3–4 animation states: idle, attack, merge glow, death
- Particle effects for abilities (ember sparks, vine whips, shadow pulses)
- NO complex 3D — all visual quality comes from polish on 2D art + particles
- Card art is illustrated (not photorealistic), similar to Clash Royale / Black Deck style

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

---

## 5. Card System

### 5.1 Card Anatomy
Each card has:
- **Name** (e.g., "Iron Sentinel")
- **Faction** (Ironclad / Verdant / Ember / Phantom)
- **Rarity** (Common, Rare, Epic, Legendary)
- **ATK** — damage per attack cycle
- **HP** — health before card dies
- **Speed** — how fast the card attacks (Slow / Normal / Fast)
- **Special Ability** — triggers at 2★ or 3★ level, or via faction bonus

### 5.2 Card Rarities
| Rarity | Color | Drop Rate | Power Level |
|---|---|---|---|
| Common | Gray | 70% | Starter cards, easy to merge |
| Rare | Blue | 20% | Mid-tier synergy cards |
| Epic | Purple | 8% | Game-changers, strong abilities |
| Legendary | Gold | 2% | Most powerful, unique effects |

### 5.3 Sample Card Abilities (no faces, themed)
| Card | Faction | Ability |
|---|---|---|
| Tower Knight | Ironclad | **Shield Wall** — all Ironclad cards gain +20% HP when this is on the field |
| Thornwall | Verdant | **Thorn Barrier** — reflects 15% damage back to attacker |
| Cinder Drake | Ember | **Burn** — deals 5 damage per second to all enemy lane cards |
| Void Shade | Phantom | **Phased** — untargetable for first 5 seconds after deployment |
| Root Colossus | Verdant | **Entangle** — freezes the enemy card in front for 3 seconds on merge |
| Siege Golem | Ironclad | **Armor Pierce** — ignores 30% of enemy HP when attacking base |

### 5.4 Faction Synergy Bonus
Running 3+ cards of the same faction in your deck activates a **passive bonus**:
- **Ironclad** (3+): All your cards gain +15% HP
- **Verdant** (3+): Regenerate 0.5 HP/s per card on field
- **Ember** (3+): All attacks deal +10% damage
- **Phantom** (3+): Cards enter with a 2-second stealth phase on deploy

Running a **mixed deck** (2 from each faction) activates **Harmony Bonus**: slight bonus to all stats — rewards smart hybrid builders.

---

## 6. Deck Building System

### 6.1 Deck Composition
- Deck size: **12 cards** (draw 4 at start, cycle through the rest)
- Max 2 copies of any single card
- Must include exactly **1 Forge Commander** (your anchor/hero card, passive aura effect)
- Free to build any combination across factions

### 6.2 Forge Commander (Hero Card, No Face)
The Forge Commander is your anchor — a large card that sits behind your lanes and provides a passive aura. Not a fighter. Examples:
- **Ironmaster** (Ironclad) — all deployed cards gain +10 armor for first 10 seconds
- **Grove Shaper** (Verdant) — one free merge per match costs 0 mana
- **Emberlord** (Ember) — every 30 seconds, deals 10 damage to all enemy cards
- **Voidkeeper** (Phantom) — reduces enemy attack speed by 10% passively

---

## 7. Progression System (How Players Get Stronger)

This is where you can fix what's broken in all 4 reference games. **The goal: skill matters first, power level matters second.**

### 7.1 Card Leveling
- Cards level up by collecting **Shards** (duplicate cards become shards)
- Card levels: 1 → 5 (max), each level gives +10% ATK and HP
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
| Arena | Name | Cup Range | Card Level Cap |
|---|---|---|---|
| 1 | Copper Forge | 0–400 | Level 3 max |
| 2 | Iron Forge | 400–900 | Level 4 max |
| 3 | Steel Forge | 900–1600 | Level 5 max |
| 4 | Crystal Forge | 1600–2500 | Level 5 + Epic unlock |
| 5 | Shadow Forge | 2500–4000 | Level 5 + Legendary unlock |
| 6 | Grand Forge | 4000+ | Uncapped, tournament tier |

Win PvP → earn **Cups** → rise in arena. Lose → lose cups. This creates fair bracket play — you always face players at your same strength tier.

### 7.5 How Players Compete with Others
1. **PvP Arena** — real-time matchmaking against players in the same cup range
2. **Ranked Season** — monthly reset, top players earn exclusive cosmetic rewards (no stat advantage)
3. **Clan Wars** — weekly clan vs clan tournament, 10 members each, contributes to clan score
4. **Draft Mode** — each player picks from random card pool (levels disabled) — pure skill, no pay-to-win
5. **Challenge Events** — limited-time modes with fixed decks, everyone on equal footing

---

## 8. Economy & Monetization (Fair Design)

The biggest failure of Ludus, Black Deck, and Deck Heroes is **punishing free players**. Here's a balanced model:

### 8.1 Currencies
| Currency | Name | How Earned | Used For |
|---|---|---|---|
| Soft (free) | **Iron** | Battles, daily quests, chests | Card leveling, Forge upgrades |
| Shards | **Shards** | Duplicate cards, weekly chest | Card leveling |
| Hard (paid/earnable) | **Crystals** | Purchase, seasonal rewards, achievements | Speed-ups, cosmetics, chest refreshes |

### 8.2 What Crystals Can Buy (CRITICAL for F2P trust)
✅ Cosmetic card skins (visual only)  
✅ Extra chest slots / speed-ups (convenience, not power)  
✅ Season Pass (bonus Iron income, cosmetics — NOT exclusive cards)  
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
Shards → Level Up Card
Stronger Card → Win More → Better Chests
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

## 10. Game Modes

| Mode | Description | Unlock |
|---|---|---|
| **Story Campaign** | 50 levels of PvE battles, introduces lore and mechanics | Day 1 |
| **PvP Arena** | Real-time 1v1 matchmaking | Forge Level 2 |
| **Dungeon Crawl** | Daily 5-room PvE gauntlet, unique rewards | Forge Level 3 |
| **Draft Clash** | Limited-time equal-level draft format | Forge Level 4 |
| **Clan War** | Weekly clan-vs-clan tournament | Forge Level 5 |
| **Grand Tournament** | Monthly top-100 bracket, pure skill | Grand Forge arena |

---

## 11. Card Acquisition (No Gacha Frustration)

The most important F2P fix — **no pure random gacha**:

1. **Battle Chests** — earned by winning PvP, always contain cards from your current arena pool
2. **Shard Shop** — buy specific cards with shards (earn shards from duplicates), guaranteed card you want
3. **Daily Free Chest** — 1 free Common/Rare chest per day, no timer tricks
4. **Season Milestone Chest** — complete 30/60/90 battles in a season → guaranteed Rare/Epic/Legendary
5. **Clan Donation** — request cards from clanmates once per day, donate to earn Iron

This means: a patient F2P player **always knows how many more battles** until they unlock the card they want. No RNG hell.

---

## 12. Art Direction — Halal-Compliant Character Design

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

## 12B. Islamic Character Design — الشخصيات ذات الطابع الإسلامي

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
| Card Name | Arabic Name | Visual | Ability |
|---|---|---|---|
| **Shield Bearer** | حامل الترس | Full chainmail + large round shield with geometric pattern, face wrapped in keffiyeh | **Fortify** — takes 20% less damage when adjacent to another Al-Noor card |
| **Desert Scout** | الطليعة | Hooded desert rider silhouette on horseback, face in shadow under hood | **Swift Strike** — attacks twice before opponent responds on first deploy |

#### Rare Cards
| Card Name | Arabic Name | Visual | Ability |
|---|---|---|---|
| **Siege Engineer** | مهندس الحصار | Armored figure operating a منجنيق (mangonel) — siege weapon of Islamic armies | **Arc Fire** — hits all 3 enemy lanes simultaneously for reduced damage |
| **Geometric Ward** | حارس الهندسة | A living construct made entirely of interlocking geometric tile patterns, no face by design | **Mirror Shield** — reflects 25% of incoming damage for 8 seconds |
| **Sandstorm Caller** | صاحب العاصفة | Robed figure with swirling sand obscuring face entirely, arms raised | **Blinding Sand** — reduces enemy attack speed by 30% for 5 seconds |

#### Epic Cards
| Card Name | Arabic Name | Visual | Ability |
|---|---|---|---|
| **Mamluk Vanguard** | المقدمة المملوكية | Elite mounted warrior, ornate lamellar armor, helmet with chainmail aventail covering face | **Cavalry Charge** — deals double damage on first attack, pushes enemy card to back of lane |
| **Astrolabe Sage** | حكيم الأسطرلاب | Robed scholar-construct holding a brass astrolabe, face in deep hood shadow | **Celestial Reading** — reveals opponent's next 2 cards to be drawn; your deck draw is immediate next turn |
| **Dhow Captain** | ربان الداو | Armored maritime figure, face wrapped in sea-cloth, standing on a stylized dhow prow | **Trade Wind** — generates +2 bonus mana for 6 seconds when deployed |

#### Legendary Cards
| Card Name | Arabic Name | Visual | Ability |
|---|---|---|---|
| **The Golden Architect** | المعمار الذهبي | A massive construct built from living Islamic architecture — arches form its body, muqarnas form its shoulders, no face, just a glowing geometric core | **Bayt Al-Hikmah** *(House of Wisdom)* — while on the field, all your merges produce 3★ effect regardless of star level. Once per match. |
| **Keeper of the Citadel** | حارس القلعة | A towering fortified giant, body resembling a Crusader-era Islamic citadel (like Saladin's Cairo Citadel) with battlements as shoulders | **Unbreachable** — cannot be targeted by abilities, only direct attacks. Gains +5 HP every 5 seconds while alive. |

---

### Al-Noor Forge Commander (Hero Card)

**الحكيم — Al-Hakim (The Wise)**
A robed figure seated cross-legged, surrounded by floating geometric light constructs. Face is entirely obscured by a radiant glow emanating from within the hood — like light from a lantern. Holds an open book of geometric diagrams (not Quran — a scholar's engineering manuscript).

**Passive Aura — Ilm (Knowledge):**
> Every 45 seconds, Al-Hakim reveals the 3 rarest cards in the opponent's deck. Once per match, you may choose to discard one of your own cards and immediately draw from the bottom of your deck (bypass bad draws).

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

Here's why — and what the alternatives look like:

### 13.1 Option Comparison

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

### 13.2 Recommendation For Your Situation

**Go with Unity 2D**, but use **AI tooling aggressively** to compensate for the small team:

- Use **Cursor AI** (or similar) for C# scripting — it handles Unity C# extremely well
- Use **Unity's free 2D starter kits** to get card game framework scaffolding in days, not weeks
- Use **Firebase** for backend (Realtime DB for matchmaking, Firestore for player data, Auth for accounts)
- Use **AI art generation** (Midjourney, Stable Diffusion) for card illustrations — your art direction (helmets, golems, plants) is ideal for AI generation since no faces = fewer prompt problems

### 13.3 Why Not Flutter + Flame?
Flutter + Flame is a valid choice **if you already have Flutter developers** (which you do). The tradeoff:
- Flame is excellent for simple 2D but card merge animations, particle effects, and smooth battle sequences require significantly more custom work compared to Unity
- Unity's Asset Store has ready-made card game frameworks (some for $20–50) that save months of work
- If your 2 employees are Flutter devs with zero Unity exposure, Flutter + Flame is viable — you'd ship MVP faster but hit animation and particle limits earlier

**If you choose Flutter + Flame:** Use Rive for card animations, Laravel as backend (same stack), and keep the visual scope modest (slide-in cards, no complex particle effects initially). The advantage here is you can share DTOs and API contracts more naturally since you already think in Laravel + Flutter.

### 13.4 Suggested Tech Stack (Unity Path)

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

---

## 14. MVP Scope (What to Build First)

With 2 testers/helpers and AI-assisted development, build this in **4–6 months**:

### Phase 1 — Core Game (Month 1–2)
- [ ] 3-lane battlefield with basic auto-battle
- [ ] 20 cards (5 per faction, Common + Rare only)
- [ ] Merge mechanic (1★→2★ only in MVP)
- [ ] Story Campaign: 20 levels (PvE only)
- [ ] Basic deck builder (8-card deck in MVP)
- [ ] Iron currency + card leveling (Level 1–3 only)

### Phase 2 — PvP + Economy (Month 3–4)
- [ ] Laravel API + Reverb PvP matchmaking (async fallback first, real-time in Phase 2 end)
- [ ] Arena ladder (3 arenas in MVP)
- [ ] Battle chests system
- [ ] Daily free chest
- [ ] 40 cards total (add Epic tier)
- [ ] Forge Commander card (4 commanders, one per faction)

### Phase 3 — Retention + Polish (Month 5–6)
- [ ] Season Pass
- [ ] Clan system (basic — donate cards, see member list)
- [ ] Dungeon Crawl mode
- [ ] Full 60-card set
- [ ] Full 3★ merge system
- [ ] Rune system
- [ ] Soft launch (limited region test)

### What NOT to build in MVP
- Guild wars (Phase 4+)
- Draft mode (Phase 4+)
- Legendary cards (Phase 3 end at earliest)
- Grand Tournament (post-launch)
- 3D anything

---

## 15. Competitive Differentiation

Why would players choose FORGE over Ludus, Black Deck, BFTT, or Deck Heroes?

| What's Broken in Competitors | What FORGE Does Differently |
|---|---|
| Winner's chest locked behind paywall (Ludus) | All PvP rewards unlock on win, period |
| Ads every 2 minutes (Black Deck) | Ads are voluntary, rewarded only |
| Stale, no updates (Deck Heroes) | Biweekly card + event drops in roadmap |
| Identical visual style (all use fantasy faces) | Unique helmets/constructs/plants — stands out in app store |
| P2W levels ruin PvP fairness | Arena-gated level caps ensure fair matchmaking |
| No real skill expression in battle | Real-time merge decisions + lane placement = skill ceiling |

---

## 16. Risk Assessment

| Risk | Likelihood | Mitigation |
|---|---|---|
| Art quality too low for app store | Medium | AI generation + 1 freelance card artist for key cards |
| Firebase costs scale unexpectedly | Low-Medium | Firebase free tier handles ~10K DAU; optimize early |
| Unity learning curve too steep | Medium | Use Cursor AI + Unity card game starter kits |
| P2P multiplayer lag | Medium | Use Photon Fusion free tier for real-time; async as fallback |
| Content drought post-launch | High | Pre-build 80 cards before launch, release in waves |
| Copycat from larger studio | Low | Your niche (Halal design, Arabic market) is underserved |

---

## 17. Target Audience

**Primary:** Male gamers aged 15–35, MENA region (Saudi Arabia, UAE, Egypt, Pakistan), familiar with Clash Royale / Ludus, want a game they can play without concern about Islamic content restrictions.

**Secondary:** Global fans of card strategy games who enjoy Auto Chess / deck-builders.

**Unique angle:** FORGE is the first well-produced deck-building card game explicitly designed around Halal-compliant art. This is an underserved gap in the MENA market that gives you a legitimate first-mover advantage.

---

*Document version 1.0 — Ready for pre-production planning*  
*Next step recommended: Build a paper prototype of 2-player battle to validate lane + merge feel before writing any code.*
