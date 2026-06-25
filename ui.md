# 🎨 FORGE — UI/UX Design Specification & AI Prompt Kit

> **Purpose:** This file contains everything needed to generate all FORGE game screens using an AI image tool (Midjourney, DALL·E, Ideogram, etc.). Each screen includes layout specs, component details, and a ready-to-use AI prompt.

---

## 1. Global Design System

### 1.1 Art Direction
- **Style:** Neo-Islamic Futurism / Tech-Magic — clean, modern, premium mobile gaming
- **Mood:** Sleek, luminous, advanced civilization — NOT gritty or dark medieval
- **Orientation:** Vertical 9:16 (portrait mobile)
- **Engine:** 2D with subtle parallax depth

### 1.2 Color Palette
| Token | Hex | Usage |
|---|---|---|
| `--bg-primary` | `#0A0E1A` | Main dark background |
| `--bg-secondary` | `#111827` | Card panels, modals |
| `--bg-glass` | `rgba(17, 24, 39, 0.65)` | Glassmorphic panels (backdrop-blur: 20px) |
| `--accent-gold` | `#D4A853` | Primary accent — buttons, titles, card borders |
| `--accent-teal` | `#2DD4BF` | Secondary accent — mana, highlights, active states |
| `--accent-white` | `#F0F4FF` | Primary text, icons |
| `--text-secondary` | `#94A3B8` | Subtext, descriptions |
| `--rarity-common` | `#9CA3AF` | Gray card border |
| `--rarity-rare` | `#3B82F6` | Blue card border |
| `--rarity-epic` | `#A855F7` | Purple card border |
| `--rarity-legendary` | `#F59E0B` | Gold animated card border |
| `--faction-ironclad` | `#5B8DEF` | Steel-blue tones |
| `--faction-verdant` | `#22C55E` | Neon green |
| `--faction-ember` | `#EF4444` | Plasma red-orange |
| `--faction-phantom` | `#8B5CF6` | Dark violet |
| `--faction-alnoor` | `#D4A853` | Gold-turquoise |
| `--hp-red` | `#EF4444` | Health bars |
| `--mana-blue` | `#2DD4BF` | Mana bar fill |
| `--success` | `#22C55E` | Win, success, confirmations |
| `--danger` | `#EF4444` | Lose, warnings, destructive actions |

### 1.3 Typography
| Element | Font | Weight | Size |
|---|---|---|---|
| Screen Title | Outfit | Bold (700) | 28px |
| Section Header | Outfit | SemiBold (600) | 20px |
| Card Name | Inter | Bold (700) | 14px |
| Body Text | Inter | Regular (400) | 14px |
| Button Label | Outfit | SemiBold (600) | 16px |
| Stat Numbers | Inter | Bold (700) | 18px |
| Small Label | Inter | Medium (500) | 11px |

### 1.4 Component Library
| Component | Description |
|---|---|
| **Glass Panel** | Semi-transparent dark panel with 20px backdrop-blur, 1px border `--accent-gold` at 30% opacity, rounded 16px corners |
| **Primary Button** | Gradient gold (`#D4A853` → `#B8912E`), rounded 12px, white text, subtle inner glow |
| **Secondary Button** | Glass panel style, teal border, teal text |
| **Card Thumbnail** | 3:4 ratio, rounded 8px, rarity-colored border glow (2px), card art fills frame |
| **Card Full** | Larger card with: art top half, stats bar middle, name + keywords bottom, faction icon top-left, mana cost top-right |
| **Health Bar** | Thin rounded bar, red fill, dark track, HP number overlaid |
| **Mana Bar** | Wider rounded bar, teal gradient fill, dark track, "X/10" text centered |
| **Currency Chip** | Small rounded pill showing icon + number (e.g., ⚒ 1,450) |
| **Bottom Tab Bar** | 5 tabs, glass background, active tab has teal underline + icon glow |
| **Modal / Popup** | Centered glass panel, dimmed overlay behind, gold close button |
| **Toast Notification** | Slides from top, glass panel, icon + text, auto-dismisses |

### 1.5 Layout Rules
- **Safe areas:** 44px top (status bar), 34px bottom (home indicator)
- **Content padding:** 16px horizontal
- **Card grid:** 4 columns for thumbnails, 8px gap
- **Bottom nav height:** 64px
- **All interactive elements:** minimum 44×44px touch target
- **RTL support:** All layouts must mirror for Arabic mode

### 1.6 Art Rules (Islamic Compliance)
- ❌ No human or animal faces — all characters are constructs, golems, automatons, or abstract forms
- ❌ No human profile pictures / avatars — use geometric emblems, faction crests, or abstract symbols
- ❌ No sexualized content
- ✅ Characters wear full helmets, have geometric hollow cores, or are non-humanoid
- ✅ Geometric Islamic patterns (girih, zellige, arabesque) used as decorative elements
- ✅ Arabic calligraphy used as visual ornamentation (NOT Quranic text)

---

## 2. Screen Map (Complete App Flow)

```
SPLASH → ONBOARDING (Matches 1-6) → HOME
                                       ├── BATTLE (PvP / PvE) → MATCH SCREEN → RESULTS
                                       ├── CARDS (Collection + Deck Builder)
                                       ├── SHOP (Daily / Event / Shard)
                                       ├── CAMPAIGN (Story Map)
                                       └── PROFILE / SETTINGS
```

### Navigation Structure
**Bottom Tab Bar (5 tabs):**
1. 🏠 **Home** — Main hub
2. ⚔️ **Battle** — Mode selection
3. 🃏 **Cards** — Collection + deck builder
4. 🛒 **Shop** — Daily/event shops
5. 👤 **Profile** — Stats, settings, clan

---

## 3. Screen Specifications & AI Prompts

---

### SCREEN 01: Splash / Loading Screen

**Layout:**
- Full-screen background: dark cosmic void with faint gold geometric lines radiating from center
- Center: FORGE logo (stylized geometric anvil made of light ribbons)
- Below logo: thin gold loading bar
- Bottom: "Digital Code" studio watermark in small text

**AI Prompt:**
```
A vertical 9:16 mobile game splash screen for a game called "FORGE". 
Ultra-dark cosmic background (#0A0E1A) with faint gold geometric Islamic 
patterns (girih lines) radiating outward from the center. In the center, a 
large stylized geometric anvil logo made of glowing gold and turquoise light 
ribbons, floating with subtle particle effects around it. Below the logo, a 
thin gold loading progress bar at 60% fill. At the bottom, small white text 
reading "Digital Code" as the studio name. The overall feel is premium, 
modern, and futuristic — not medieval. Clean, minimal, elegant. No text 
other than the game title "FORGE" integrated into the logo design. No human 
faces or characters.
```

---

### SCREEN 02: Home Screen (Main Hub)

**Layout (top to bottom):**
- **Top bar:** Player emblem (geometric crest, NOT a face) + player name + level badge | Currencies: ⚒ Iron count | 💎 Crystal count
- **Center hero area:** Large animated background showing the player's current Forge Core environment with floating geometric particles. The current Forge Commander stands in the center (full-body construct, no face).
- **Quick action cards (horizontal scroll):** 
  - "Battle Now" (PvP) — gold button
  - "Campaign" — shows current chapter progress
  - "Daily Quest" — shows 2/3 completed
  - "Free Chest" — shows timer or "OPEN NOW" if ready
- **News/Event banner (horizontal carousel):** Current event promo with countdown timer
- **Bottom tab bar:** Home (active), Battle, Cards, Shop, Profile

**AI Prompt:**
```
A vertical 9:16 mobile game home screen for the card game "FORGE". Modern 
dark glassmorphism UI style. At the top, a thin header bar with: a geometric 
hexagonal crest emblem (NOT a human face) on the left with "Player Lv.12" 
text, and on the right two currency chips showing "1,450" with a bronze 
anvil icon and "350" with a turquoise crystal icon. 

The center of the screen shows a large atmospheric scene: a futuristic forge 
chamber with white marble floors, floating geometric golden patterns, and a 
tall faceless mechanical commander construct standing in the center, 
surrounded by floating turquoise energy ribbons and golden particle effects.

Below the center scene, a horizontal row of 4 rounded glass-panel action 
cards: "Battle Now" (gold accent), "Campaign Ch.3" (with a small progress 
bar), "Daily Quests 2/3" (checkmark icons), and "Free Chest" (with a 
glowing chest icon and "READY" badge).

At the very bottom, a 5-icon bottom navigation bar with glass background: 
Home (active, glowing teal), Battle (swords icon), Cards (card deck icon), 
Shop (shopping bag icon), Profile (gear icon). All icons are minimal line 
style in white, with the active tab having a teal glow and underline.

The overall aesthetic is ultra-premium, clean, modern — like a luxury 
fintech app merged with a futuristic card game. No human faces anywhere. 
Dark background approximately #0A0E1A. Gold accents #D4A853. Teal accents 
#2DD4BF.
```

---

### SCREEN 03: Battle Mode Selection

**Layout:**
- **Header:** "SELECT MODE" title with teal underline
- **Mode cards (vertical list, full-width glass panels):**
  - 🏰 **Story Campaign** — "Chapter 3: The Ember Wastes" — progress bar — "CONTINUE" button
  - ⚔️ **PvP Arena** — "Iron Forge | 650 Cups" — trophy icon — "FIND MATCH" gold button
  - 🏔 **Dungeon Crawl** — "Daily Gauntlet | 2/5 Rooms" — "ENTER" button
  - 👥 **Friendly Challenge** — "Invite a Friend" — share icon
- Each mode card has a small background illustration on the right side (e.g., volcano for Ember, arena for PvP)
- **Bottom tab bar**

**AI Prompt:**
```
A vertical 9:16 mobile game mode selection screen for "FORGE". Dark 
glassmorphism UI. At the top, a section header "SELECT MODE" in gold Outfit 
font with a thin teal underline. 

Below, 4 vertically stacked glass-panel cards (rounded 16px corners, 
semi-transparent dark background with subtle blur, thin gold border at 30% 
opacity), each representing a game mode:

1. "Story Campaign" — icon of a stylized castle/fortress, subtext "Chapter 
3: The Ember Wastes", a thin gold progress bar showing 60%, and a teal 
"CONTINUE" button on the right.

2. "PvP Arena" — icon of crossed swords, subtext "Iron Forge | 650 Cups" 
with a small trophy icon, and a prominent gold gradient "FIND MATCH" button 
on the right.

3. "Dungeon Crawl" — icon of a dungeon door, subtext "Daily Gauntlet | 2/5 
Rooms", and a teal "ENTER" button on the right.

4. "Friendly Challenge" — icon of two handshake-like geometric symbols, 
subtext "Invite a Friend", and a share/link icon button on the right.

Each card has a very subtle atmospheric background illustration on the right 
edge (faded, not distracting). Bottom navigation bar with 5 tabs, "Battle" 
tab active with teal glow. Dark background #0A0E1A. No human faces.
```

---

### SCREEN 04: Pre-Match Screen (Arena Reveal)

**Layout:**
- **Top:** "MATCH FOUND" header with opponent info on right side
- **Center:** The battlefield preview showing the 3 lanes from a top-down angled view. 1-2 lane modifier badges are displayed on their respective lanes (e.g., "🔥 Burning Ground" on Lane 2)
- **10-second countdown timer** in the center
- **Bottom:** Player's selected deck shown as 12 small card thumbnails in a 6×2 grid. The Forge Commander card is larger and centered below.
- **"READY" button** — gold, pulsing

**AI Prompt:**
```
A vertical 9:16 mobile game pre-match "Arena Reveal" screen for "FORGE". 
Dark UI with glassmorphism. At the top, text "MATCH FOUND" in gold. On the 
left, the player's geometric emblem crest with "Player Lv.12", and on the 
right the opponent's geometric emblem with "Opponent Lv.13".

In the center, a top-down angled preview of the 3-lane battlefield: 
polished white-marble floor tiles with inlaid gold geometric lines dividing 
3 vertical lanes. Lane 2 (center) has a glowing red badge reading "BURNING 
GROUND 🔥" floating above it, indicating a lane modifier. The lanes are 
empty but ready.

A large circular countdown timer shows "7" seconds in the center of the 
battlefield, with a circular teal progress ring around it.

At the bottom half, the player's deck is shown: 12 small card thumbnails 
arranged in a 6×2 grid with rarity-colored borders (gray, blue, purple). 
Below the grid, a larger Forge Commander card is centered — showing a 
faceless mechanical construct with the name "Ironmaster" and a gold border.

A large pulsing gold gradient button at the very bottom reads "READY". Dark 
background #0A0E1A. No human faces anywhere.
```

---

### SCREEN 05: Battle Screen (In-Match HUD)

**Layout (top to bottom):**
- **Top HUD bar:**
  - Left: Player Forge Core HP bar (red, "78/100") + player emblem
  - Center: Match timer "1:42" countdown
  - Right: Enemy Forge Core HP bar (red, "55/100") + enemy emblem
- **Forge Commander panel (top-left):** Small Commander portrait (construct, no face) with a circular charge bar showing Surge readiness (65% charged)
- **Battlefield (center, 60% of screen):** 
  - 3 lanes viewed from a slightly angled top-down perspective
  - White marble floor with gold geometric line dividers between lanes
  - Each lane slot shows deployed cards as animated sprites
  - Cards have small HP bars floating above them and ATK/star-level indicators
  - Active spell effects (vine tendrils, fire trails) visible on affected lanes
  - Lane modifier badge visible if active (e.g., "Overgrowth 🌿" on lane 1)
- **Card hand (bottom, 25% of screen):**
  - 4 cards fanned out in a slight arc
  - Each card shows: mana cost (top-left circle), small card art, name, ATK/HP stats
  - Draggable — player drags a card up onto a lane to deploy
  - Playable cards are fully lit; unaffordable cards are dimmed
- **Mana bar (bottom edge):** Full-width teal gradient bar, "7/10 ⚡" text, smoothly filling

**AI Prompt:**
```
A vertical 9:16 mobile game battle screen HUD for the card game "FORGE". 
Modern, clean, dark glassmorphism UI.

TOP HUD: A thin glass-panel header bar. On the left, a red health bar 
showing "78/100" with a geometric player emblem. In the center, a match 
timer showing "1:42" in white bold text. On the right, the enemy's red 
health bar showing "55/100" with a different geometric emblem. Below the 
left emblem, a small circular Forge Commander icon (a faceless mechanical 
construct bust) with a teal circular charge ring around it showing 65% 
filled, labeled "SURGE".

CENTER BATTLEFIELD (60% of screen): A 3-lane arena viewed from a slightly 
angled top-down perspective. The floor is polished white marble with thin 
glowing gold geometric lines (girih patterns) dividing the 3 lanes. 

In Lane 1 (left): A sleek steel-blue clockwork automaton construct (no 
face, teal energy core in chest) on the player's side, fighting a dark 
obsidian plasma creature on the enemy's side, with orange slash VFX between 
them. Small red HP bars float above each.

In Lane 2 (center): A glowing neon-green bio-luminescent vine creature on 
the player's side. The enemy side is empty — the vine creature's attacks are 
shown as projectiles heading toward the enemy Forge Core.

In Lane 3 (right): Empty on both sides, with a subtle "OVERGROWTH 🌿" 
modifier badge floating in the center of the lane.

BOTTOM CARD HAND (25% of screen): 4 cards fanned in a slight arc. Each card 
is a small rectangle with rounded corners showing: a blue mana-cost circle 
in the top-left (showing "3", "4", "2", "5"), a small card illustration 
(abstract constructs, spell books, shields — no faces), the card name in 
small text, and tiny ATK/HP numbers. The "5" cost card is slightly dimmed 
(not enough mana). The other 3 are fully lit and interactive.

MANA BAR (very bottom edge): A full-width bar with a teal gradient fill 
showing "7 / 10" with a small lightning bolt icon. The bar is at 70% fill.

Overall aesthetic: ultra-clean, premium, futuristic. Dark background 
#0A0E1A. Gold accents for UI borders. Teal for mana/energy. No human faces 
anywhere in the UI, cards, or battlefield units.
```

---

### SCREEN 06: Match Result (Victory)

**Layout:**
- **Full-screen celebration:** Golden geometric ring wave expanding from center
- **"VICTORY" text** in large gold with glow effect
- **Trophy / cup change:** "+32 🏆" with animation
- **Rewards panel (glass card):**
  - Iron earned: ⚒ +120
  - Chest unlocked: Battle Chest (with rarity glow)
  - XP gained: +45 XP (progress bar)
- **Cards earned preview:** 2-3 card thumbnails flip-revealed
- **Buttons:** "PLAY AGAIN" (gold) | "HOME" (teal outline)

**AI Prompt:**
```
A vertical 9:16 mobile game victory screen for "FORGE". Dramatic and 
celebratory. Dark background with an expanding golden geometric ring wave 
(Islamic girih pattern) radiating from the center.

Large text "VICTORY" in gold (#D4A853) with a warm glow effect, centered 
near the top third.

Below, a trophy icon with "+32" cups gained, displayed in a small animated 
badge.

In the center, a large glass-panel rewards card showing:
- "Iron +120" with a bronze anvil icon
- "Battle Chest Unlocked" with a glowing ornate chest illustration
- "XP +45" with a thin progress bar showing level progression

Below the rewards panel, 3 card thumbnails are shown face-up, as if freshly 
revealed — each with a rarity-colored border glow (one gray Common, one blue 
Rare, one purple Epic).

At the bottom, two buttons side by side: "PLAY AGAIN" (gold gradient, 
prominent) and "HOME" (teal outlined, secondary). 

Overall mood: triumphant but elegant, not over-the-top. Clean dark UI. No 
human faces. No confetti — instead, geometric golden particle effects 
floating upward.
```

---

### SCREEN 07: Match Result (Defeat)

**AI Prompt:**
```
A vertical 9:16 mobile game defeat screen for "FORGE". Somber but dignified. 
Dark background (#0A0E1A) with subtle cracked geometric lines fading from 
center (like shattered glass in a girih pattern), tinted dark red.

Large text "DEFEAT" in a muted silver-white with a subtle red underglow, 
centered near the top third.

Below, a trophy icon with "-18" cups lost, displayed in a small red-tinted 
badge.

In the center, a glass-panel showing:
- "Iron +30" (consolation reward) with bronze anvil icon
- "XP +15" with a thin progress bar
- A subtle message: "Tip: Try adjusting your deck for more Ironclad 
synergy" in small gray text

At the bottom, two buttons: "TRY AGAIN" (teal outlined) and "EDIT DECK" 
(gold gradient). No human faces. Minimal, clean, respectful — the player 
lost but the UI doesn't punish them.
```

---

### SCREEN 08: Card Collection

**Layout:**
- **Top bar:** "MY CARDS" title | Filter tabs: All | Ironclad | Verdant | Ember | Phantom | Al-Noor
- **Sort dropdown:** By Rarity / By Level / By Faction / By Mana Cost
- **Card grid (scrollable):** 4-column grid of card thumbnails
  - Each card shows: small art, mana cost badge, star level, card level, rarity border glow
  - Locked/undiscovered cards shown as dark silhouettes with "?" 
  - Cards that can be upgraded show a small green arrow badge
- **Bottom:** Total count "47/80 Cards Collected"
- **Bottom tab bar**

**AI Prompt:**
```
A vertical 9:16 mobile game card collection screen for "FORGE". Dark 
glassmorphism UI.

At the top, the title "MY CARDS" in gold Outfit font. Below, a horizontal 
row of small filter tabs: "All" (active, teal underline), "Ironclad", 
"Verdant", "Ember", "Phantom", "Al-Noor" — each with a tiny faction-colored 
dot.

Below the filters, a scrollable 4-column grid of card thumbnails. Each 
thumbnail is a small card (3:4 ratio, rounded 8px) showing:
- A miniature illustration of a faceless construct/golem/spell
- A small blue circle in the top-left showing mana cost (2-6)
- The card's star level shown as tiny gold stars below the art (★★)
- A rarity-colored border glow: gray for Common, blue for Rare, purple for 
Epic
- A small "Lv.3" badge in the bottom-right corner
- Some cards have a tiny green up-arrow badge indicating they can be 
upgraded

3-4 cards in the grid are shown as dark silhouettes with a "?" symbol — 
these are undiscovered/locked cards.

At the bottom, centered text: "47 / 80 Cards Collected" with a thin 
progress bar. Below that, the standard 5-tab bottom navigation with "Cards" 
tab active (teal glow). Dark background #0A0E1A. No human faces on any card.
```

---

### SCREEN 09: Card Detail View

**Layout:**
- **Dimmed overlay** behind a centered large card
- **Large card (center, ~60% screen width):**
  - Top half: Full card art (construct/golem, no face)
  - Faction icon badge (top-left)
  - Mana cost (top-right, in a circle)
  - Rarity banner across middle
  - Card name (bold)
  - Star level: ★★☆ (2/3 stars)
  - Stats row: ATK ⚔ 14 | HP ❤ 22 | Speed: Normal
  - Keywords row: Shield | Taunt (as small icon pills)
- **Skills section (below card):** Glass panel showing:
  - Skill 1: "Shield Wall" — Lv.2 unlocked ✅ — description
  - Skill 2: "Fortified Stance" — Lv.4 🔒 LOCKED — "Reach Level 4 to unlock"
  - Skill 3: "Iron Will" — Lv.5 🔒 LOCKED
- **Upgrade button:** "UPGRADE TO LV.3 — ⚒ 250 Iron + 10 Shards" (gold)
- **Close button (X)** top-right corner

**AI Prompt:**
```
A vertical 9:16 mobile game card detail popup for "FORGE". Dimmed dark 
overlay background with a large card centered on screen.

The card takes up about 60% of the screen width. The top half shows 
detailed art of a massive steel-blue clockwork knight construct — fully 
helmeted with no face visible, teal energy core in chest, geometric shield 
plate in one hand. The art style is clean, illustrated, slightly stylized — 
not photorealistic.

Below the art: a steel-blue "IRONCLAD" faction badge on the left, a blue 
mana cost circle showing "4" on the right. A thin blue "RARE" banner 
across. The card name "Tower Knight" in bold white. Star rating showing 
★★☆ (2 of 3 stars filled in gold). A stats row: "ATK ⚔ 14 | HP ❤ 22 | 
Speed: Normal". Below stats, two small keyword pills: "Shield" (blue icon) 
and "Taunt" (gold icon).

Below the card, a glass-panel section titled "SKILLS":
- Skill 1: "Shield Wall" — green checkmark, "Lv.2" badge, description: 
"Ironclad allies gain +20% HP" 
- Skill 2: "Fortified Stance" — locked 🔒 icon, "Lv.4", grayed out 
description: "On merge, gains Taunt for 5s"
- Skill 3: "Iron Will" — locked 🔒 icon, "Lv.5", grayed out

At the bottom, a large gold gradient button: "UPGRADE TO LV.3 — ⚒ 250 + 
10 Shards". A small white X close button in the top-right corner. Dark 
glassmorphism. No human faces.
```

---

### SCREEN 10: Deck Builder

**Layout:**
- **Top:** "MY DECK" title + deck name (editable) + deck stats (avg. mana cost, faction breakdown pie chart)
- **Deck slots (top section, 40% screen):** 
  - 12 card slots in a 4×3 grid
  - 1 larger Commander card slot centered above the grid
  - Filled slots show card thumbnails, empty slots show dashed outlines with "+"
  - Slot 1-10: creature cards, Slot 11-12: spell cards (labeled)
- **Divider line**
- **Available cards (bottom section, 50% screen):** Scrollable 4-column grid of all owned cards. Tap a card to add it to the deck.
- **Constraints display:** "8/12 Cards | 1/4 Spells | Commander: ✅"
- **"SAVE DECK" button** (gold)

**AI Prompt:**
```
A vertical 9:16 mobile game deck builder screen for "FORGE". Dark 
glassmorphism UI with gold and teal accents.

At the top: title "MY DECK" in gold, with a small editable deck name 
"Ironclad Rush" next to a pencil icon. Below the title, tiny stats: "Avg. 
Mana: 3.2 | Ironclad 60% | Verdant 40%" displayed as small text.

TOP SECTION (40% of screen): The active deck display. A larger Commander 
card slot centered at the top showing a glass-framed card of "Ironmaster" 
(a faceless mechanical forge-master construct) with a gold border. Below 
the commander, a 4×3 grid of 12 card slots. 8 slots are filled with card 
thumbnails showing various faceless constructs and spell books with rarity 
borders (gray, blue, purple). 4 slots are empty, shown as dashed gold 
outlines with a "+" icon in the center. Slots 11-12 have a small "SPELL" 
label below them.

A thin gold divider line separates the sections. A constraints bar reads: 
"8/12 Cards | 1/4 Spells | Commander: ✅" in small teal text.

BOTTOM SECTION (50% of screen): A scrollable 4-column grid of all owned 
cards (the collection), showing card thumbnails with mana costs and rarity 
borders. Cards already in the deck have a small teal checkmark overlay.

At the very bottom (above the nav bar): a large gold gradient button "SAVE 
DECK". Bottom navigation bar with "Cards" tab active. Dark background 
#0A0E1A. No human faces.
```

---

### SCREEN 11: Shop — Daily Rotation

**Layout:**
- **Top:** "DAILY SHOP" title + refresh timer "Refreshes in 06:42:18"
- **Featured card (large banner):** A full-width glass card showcasing today's featured card for direct purchase. Shows the full card art, name, stats, and price: "💎 120 Crystals"
- **Daily offers (2×2 grid):** 4 smaller offer cards:
  - Card 1: Specific Rare card — "⚒ 500 Iron"
  - Card 2: 50 Shards bundle — "💎 80 Crystals"
  - Card 3: Specific Common card — "⚒ 200 Iron"
  - Card 4: Cosmetic card skin — "💎 200 Crystals"
- **Event banner (if active):** "⭐ EMBER FESTIVAL — Buy Plasma Drake directly! — 💎 350 Crystals" with a countdown timer
- **Important:** Every item shows exactly what the player gets. NO mystery boxes. NO random draws.

**AI Prompt:**
```
A vertical 9:16 mobile game daily shop screen for "FORGE". Dark 
glassmorphism UI.

At the top: title "DAILY SHOP" in gold with a small clock icon and 
"Refreshes in 06:42:18" subtext in gray.

Below, a large full-width featured offer card (glass panel, gold border): 
showing detailed art of a faceless plasma-ember construct called "Obsidian 
Brute" (Epic rarity, purple border glow). The card details are fully 
visible — name, stats (ATK 18, HP 28), rarity "EPIC". A prominent price 
button: "💎 120 Crystals" in a gold badge. A small label reads "DIRECT 
PURCHASE — you get exactly this card".

Below the featured card, a 2×2 grid of smaller offer cards:
1. A Rare card "Sand Scout" — price "⚒ 500 Iron"
2. A "50 Shards" bundle icon — price "💎 80 Crystals"  
3. A Common card "Steel Drone" — price "⚒ 200 Iron"
4. A cosmetic "Golden Border Skin" preview — price "💎 200 Crystals"

Each offer clearly shows what the player receives — no mystery, no 
randomness.

At the bottom, an event banner with a fiery ember-glow border: "🔥 EMBER 
FESTIVAL — Plasma Drake Available! — 💎 350 — Ends in 2d 14h". Below, the 
5-tab bottom nav with "Shop" active. Dark background. No human faces. No 
loot boxes or mystery items anywhere.
```

---

### SCREEN 12: Campaign / Story Map

**Layout:**
- **Top:** "STORY CAMPAIGN" title + Chapter name "Chapter 3: The Ember Wastes"
- **Map (center, 70% screen):** A vertically scrollable path-style level map. Nodes connected by glowing gold lines:
  - Completed levels: Gold filled circles with ★ rating (1-3 stars)
  - Current level: Pulsing teal circle with "PLAY" badge
  - Locked levels: Dimmed gray circles with 🔒
  - Every 5th node is a boss node (larger, red-ember glow)
- **Level info popup (when tapping a node):** Glass panel showing:
  - Level name: "3-7: Magma Chamber"
  - Modifier: "🔥 Burning Ground on all lanes"
  - Difficulty: ★★★ (3 flames)
  - Best score / star rating
  - "PLAY" button

**AI Prompt:**
```
A vertical 9:16 mobile game story campaign map screen for "FORGE". Dark 
background with subtle atmospheric effects.

At the top: "STORY CAMPAIGN" in gold, with "Chapter 3: The Ember Wastes" as 
a subtitle. The background has a faint volcanic/ember atmosphere with 
floating ash particles.

The center shows a vertically scrollable path-style level map. Circular 
level nodes are connected by thin glowing gold lines that wind upward 
through the screen in a serpentine path. 

- Levels 1-6 are completed: gold filled circles with 1-3 small star icons 
inside
- Level 7 is the current level: a larger pulsing teal circle with a "PLAY" 
badge, glowing prominently
- Levels 8-10 are locked: dimmed gray circles with small lock icons
- Level 5 and 10 are boss nodes: larger hexagonal shapes with a red ember 
glow and a small skull-like geometric emblem

A small glass-panel popup is shown near Level 7: "3-7: Magma Chamber | 🔥 
Burning Ground | Difficulty: ★★★" with a small gold "PLAY" button.

The overall aesthetic is a clean, modern take on the classic level-map — not 
cartoonish, more like a futuristic tactical display. Gold connecting lines, 
teal for active elements, gray for locked. Dark background. No human faces.
```

---

### SCREEN 13: Profile / Settings

**Layout:**
- **Top:** Player emblem (geometric crest) + player name + "Forge Level 12"
- **Stats cards (horizontal scroll):**
  - Total matches: 342
  - Win rate: 58%
  - Highest arena: Steel Forge
  - Cards collected: 47/80
- **Clan info:** "Clan: أسود الصحراء | Members: 18/30" with a "VIEW CLAN" button
- **Battle history (last 5 matches):** Win/Loss indicators with opponent names and cup change
- **Settings section:** Language toggle (EN/AR), Sound/Music toggles, Prayer Mode toggle, Notifications, Account/Logout
- **Bottom tab bar**

**AI Prompt:**
```
A vertical 9:16 mobile game profile screen for "FORGE". Dark glassmorphism 
UI.

At the top: a large geometric hexagonal crest emblem (intricate Islamic 
geometric pattern, NOT a human face) centered, with the player name 
"ForgeKnight" below in white bold text, and "Forge Level 12" as a small 
teal badge.

Below, a horizontal scroll of 4 small glass stat cards:
- "342 Matches" with a swords icon
- "58% Win Rate" with a pie chart icon
- "Steel Forge" (highest arena) with a trophy icon
- "47/80 Cards" with a card stack icon

A glass-panel clan section: "Clan: أسود الصحراء" (Desert Lions in Arabic) 
with "Members: 18/30" and a "VIEW CLAN" teal button.

Below, a "RECENT MATCHES" section showing 5 rows: each row has a 
Win (green) or Loss (red) indicator, opponent name, and cup change 
("+32" in green or "-18" in red).

Below that, a "SETTINGS" section with toggle rows:
- Language: EN | AR toggle switch
- Sound: ON toggle
- Music: ON toggle  
- Prayer Mode: OFF toggle (with a small crescent moon icon)
- A "LOG OUT" text button in red

Bottom navigation with "Profile" tab active. Dark background. No human 
faces — the player identity is represented by the geometric crest emblem.
```

---

### SCREEN 14: Chest Opening

**Layout:**
- **Full-screen dramatic reveal**
- **Center:** An ornate geometric chest floating with golden particle effects
- **Tap to open** prompt
- **After tap:** Chest opens with a burst of geometric light. Cards fly out one by one, flipping from face-down to face-up with rarity glow.
- **Final state:** All 4 revealed cards displayed in a row with their names and rarity. Currencies earned shown above.
- **"CONTINUE" button** at bottom

**AI Prompt:**
```
A vertical 9:16 mobile game chest opening screen for "FORGE". Dramatic 
reveal moment. Very dark background with golden light emanating from the 
center.

In the center, an ornate geometric chest floating in mid-air — the chest 
design is futuristic, made of white marble panels with gold geometric inlay 
(girih patterns), glowing teal energy seams, and floating particle effects 
around it. The chest is slightly open with golden light beaming out from 
the crack.

Below the chest, glowing text: "TAP TO OPEN" with a pulsing animation 
indicator.

The overall mood is one of anticipation and wonder — not gambling 
excitement. The chest feels like a reward earned, not a lottery. The 
aesthetic is premium and elegant. Floating geometric golden particles 
drift upward. No human faces. No slot-machine or gacha visual language 
— this is a dignified reward ceremony.
```

---

### SCREEN 15: Onboarding — Match 1 (Deploy Tutorial)

**Layout:**
- **Simplified battlefield:** Only 1 lane visible (lanes 1 and 3 are darkened/hidden)
- **Hand:** Only 1 card available, glowing with a pulsing teal highlight
- **Visual guide:** A large glowing arrow animates from the card in hand upward to the lane, showing the drag gesture
- **No text popup** — only the visual arrow and a dimmed-out everything else
- **Top:** Simplified HUD showing only "Your Core: 100 HP" and "Enemy Core: 30 HP"
- **Enemy side:** A single weak enemy card already deployed

**AI Prompt:**
```
A vertical 9:16 mobile game onboarding tutorial screen for "FORGE". A 
simplified, focused version of the battle screen.

The battlefield shows only 1 active lane (center lane) — the left and 
right lanes are heavily dimmed and darkened, clearly not interactive yet. 
The single lane has a white marble floor with gold geometric lines.

On the enemy side of the lane, a single small, weak-looking construct 
(a tiny stone golem) is deployed.

At the bottom, the card hand area shows a single card — a glowing 
clockwork construct card with a pulsing teal border highlight. Everything 
else in the hand area is empty/dimmed.

A large, animated glowing teal arrow curves from the card upward to the 
empty player-side of the lane, showing the drag-to-deploy gesture. The 
arrow pulses gently.

The top HUD is simplified: only "YOUR CORE: 100 HP" on the left and 
"ENEMY CORE: 30 HP" on the right. No timer, no mana bar (simplified for 
tutorial). The overall feel is clean, focused, and non-intimidating. No 
text popups or instruction boxes. Dark background. No human faces.
```

---

### SCREEN 16: Clan Screen

**AI Prompt:**
```
A vertical 9:16 mobile game clan screen for "FORGE". Dark glassmorphism UI.

At the top, a large clan banner: the clan name "أسود الصحراء" (Desert 
Lions) in decorative Arabic calligraphy, with a geometric lion crest emblem 
(stylized, abstract — no realistic face). Below: "Level 5 Clan | 18/30 
Members | Weekly Raid Boss: Active 🔴".

Below the banner, 3 horizontal tab buttons: "MEMBERS" (active, teal 
underline), "RAID BOSS", "DONATE".

The MEMBERS tab shows a scrollable list of clan members. Each row displays:
- A small geometric personal crest emblem
- Player name (mix of English and Arabic names)
- "Forge Level 14"
- "Cups: 1,240 🏆"
- Role badge: "Leader" (gold), "Elder" (teal), "Member" (gray)

The top 3 members have a subtle gold, silver, bronze highlight on their row.

At the bottom, a gold button "INVITE FRIENDS" and below that, the standard 
5-tab navigation bar. Dark background #0A0E1A. No human faces — all player 
identities use geometric crest emblems.
```

---

## 4. Card Art Template Prompts

These prompts generate individual card illustrations in a consistent style.

### Card Art Style Guide
```
GLOBAL STYLE PREFIX (prepend to all card art prompts):
"Digital card game illustration, Neo-Islamic Futurism style, clean 
detailed 2D art, dark background with subtle geometric patterns, vibrant 
color palette, faceless construct/golem/automaton character (absolutely NO 
human or animal faces), 3:4 portrait ratio, suitable for a mobile card 
game. Premium quality, modern aesthetic."
```

### Sample Card Art Prompts

**Ironclad — Chrono-Sentinel:**
```
[STYLE PREFIX] A towering steel-blue clockwork automaton knight. Minimalist 
sleek armor with brass gear mechanisms visible in the joints. A glowing 
teal energy core in the chest plate. The head is a smooth, featureless 
steel dome helmet with geometric etchings. Holds a large geometric shield 
plate covered in girih patterns. Background: faint blue energy field.
```

**Verdant — Neo-Colossus:**
```
[STYLE PREFIX] A massive bio-luminescent botanical titan. Body made 
entirely of crystalline bark armor with glowing neon-green vine networks 
running through it like circuitry. Floating spore nodes orbit around its 
shoulders. Where a face would be, there is only a cluster of bioluminescent 
flowers emitting green light. Background: dark forest with floating pollen 
particles.
```

**Ember — Plasma Drake:**
```
[STYLE PREFIX] A dragon-like construct made of matte-black obsidian 
plates containing white-hot plasma visible through the cracks and seams. 
Floating magma rings orbit its body. No face — the head is a smooth 
obsidian wedge with glowing orange fissures. Wings made of solidified 
lava sheets. Background: volcanic red-orange heat haze.
```

**Phantom — Eclipse Shade:**
```
[STYLE PREFIX] A spectral floating entity made of dark violet void-glass 
fragments and holographic neon mist. The body is a tattered robe-like 
form that dissolves into particles at the edges. Where the face would be, 
two geometric hollow diamond shapes glow with faint purple light. Chains 
of void energy trail behind it. Background: deep cosmic void with distant 
stars.
```

**Al-Noor — Solar Vanguard:**
```
[STYLE PREFIX] A majestic celestial warrior construct. Body of polished 
white marble with intricate inlaid gold geometric traces (arabesque 
patterns). Floating turquoise energy ribbons spiral around the arms and 
shoulders. The head is a smooth marble dome with a golden crescent finial 
on top and no face — just a soft warm golden glow where the visor would 
be. Holds a spear made of crystallized light. Background: golden sunrise 
with geometric light beams.
```

**Al-Noor — The Golden Architect (Legendary):**
```
[STYLE PREFIX] A towering, awe-inspiring construct of pure white marble 
and gold. The body resembles a walking Islamic minaret or dome structure 
— ornate, architectural, with muqarnas (honeycomb vaulting) patterns 
across the shoulders and chest. Floating geometric golden rings orbit 
the head (which has no face — just a radiant golden light source). 
Turquoise calligraphic energy ribbons flow from outstretched hands. 
Background: cosmic golden nebula. This is a LEGENDARY card — make it 
feel divine, powerful, and transcendent. Maximum visual impact.
```

---

## 5. Forge Commander Prompts

**Ironmaster:**
```
[STYLE PREFIX] A large, imposing forge-master construct seated behind an 
anvil of pure energy. Body of dark iron with glowing blue-white forge 
marks. The head is a welding-mask-like smooth steel dome. Massive 
mechanical arms hold a glowing hammer and tongs. Steam and sparks emit 
from the joints. Aura of molten metal. Faction: Ironclad (steel-blue 
tones). Background: industrial forge interior with geometric architecture.
```

**Al-Hakim:**
```
[STYLE PREFIX] A wise, scholarly construct seated on a floating geometric 
throne made of golden light. The body is white marble with turquoise 
circuit-like veins. Instead of a face, a smooth golden dome head with a 
floating astrolabe-like ring orbiting it. Holds an open book that emits 
golden calligraphic light particles. Serene, radiant, omniscient feel. 
Faction: Al-Noor (gold and turquoise). Background: interior of a grand 
Islamic library with pointed arches and floating geometric orbs.
```

---

## 6. UI Element Prompts

**Forge Core (Player Base):**
```
A glowing geometric fortress core for a mobile card game. Futuristic 
design: a floating octahedral crystal structure made of white marble and 
gold geometric inlay, with teal energy beams connecting it to the ground. 
Pulsing with warm golden light. Health bar displayed at 78/100. 
Dark background. This is the player's base that opponents must destroy 
to win. Vertical orientation. No faces.
```

**Mana Crystal:**
```
A premium game currency icon. A faceted turquoise crystal floating with 
golden geometric ring around it, emitting soft teal light particles. 
Clean, minimal, iconic — suitable for a mobile game UI at small sizes. 
Transparent/dark background. No face.
```

**Iron Currency:**
```
A premium game currency icon. A stylized bronze anvil with geometric 
patterns etched into it, slightly glowing with warm amber light. A 
small hammer rests against it. Clean, iconic, suitable for small UI 
display. Transparent/dark background.
```

---

## 7. Batch Generation Strategy

To generate all screens efficiently in one session, use this order:

### Priority 1 — Core Screens (Generate First)
1. Home Screen (Screen 02)
2. Battle Screen (Screen 05)
3. Card Collection (Screen 08)
4. Deck Builder (Screen 10)
5. Shop (Screen 11)

### Priority 2 — Flow Screens
6. Splash (Screen 01)
7. Battle Mode Selection (Screen 03)
8. Pre-Match (Screen 04)
9. Victory (Screen 06)
10. Defeat (Screen 07)

### Priority 3 — Detail Screens
11. Card Detail (Screen 09)
12. Campaign Map (Screen 12)
13. Profile (Screen 13)
14. Chest Opening (Screen 14)
15. Onboarding (Screen 15)
16. Clan (Screen 16)

### Priority 4 — Card Art
17. 5 faction hero cards (one per faction)
18. 5 Forge Commanders
19. UI elements (Forge Core, currencies)

---

## 8. Design Consistency Checklist

Before finalizing screens, verify:

- [ ] All backgrounds use `#0A0E1A` dark base
- [ ] All glass panels have backdrop-blur effect and thin gold borders
- [ ] All buttons follow the gold gradient (primary) or teal outline (secondary) pattern
- [ ] No human or animal faces appear ANYWHERE
- [ ] All player identities use geometric crest emblems (not avatars)
- [ ] Typography uses Outfit for headers, Inter for body
- [ ] All card borders match rarity colors (gray/blue/purple/gold)
- [ ] Bottom tab bar is consistent across all screens
- [ ] Currency display format is consistent (icon + number)
- [ ] RTL layout is achievable with mirror-flip (no hardcoded L/R text alignment)
- [ ] No mystery boxes, loot boxes, or "?" purchase items appear in any shop screen
- [ ] All shop items clearly show what the player receives
