# FORGE — Creature & Hero Skill Catalog

## Design Philosophy — The Counter Triangle

> **Core guarantee: no universal top deck.** Every archetype has something it fears. A player wins by reading the meta and picking smart, not by owning the "best cards."

### Archetype Rock-Paper-Scissors

| Archetype | Led By | Strengths | Weaknesses |
|---|---|---|---|
| **Aggro/Burst** | Ember | Fast kills, board-wide burn, early pressure | Crumbles vs. Shield/Taunt walls, low sustain |
| **Sustain/Heal** | Verdant | Outlasts aggro, board-wide regen, death triggers | Slow setup, weak to displacement and burst |
| **Tank/Control** | Ironclad | High HP walls, damage reduction, lane lockdown | Slow kills, Phantom displacement ruins positioning |
| **Disruption/Tempo** | Phantom | Slot swaps, stealth, steal/disable effects | Low HP, struggles vs. heal-heavy boards |
| **Synergy/Support** | Al-Noor | Amplifies any ally faction, reveals intel, hero heals | Individually weak, needs board presence to function |

### Cross-Faction Counter Matrix

| If opponent runs… | Counter with… | Why it works |
|---|---|---|
| Heavy Ember burn | Ironclad shields + Verdant regen | Negates tick damage |
| Full Ironclad wall | Phantom displacement + Al-Noor pierce | Bypasses Taunt, reveals weak lanes |
| Verdant heal stall | Ember anti-heal burn + Phantom disruption | Prevents regen, dismantles positioning |
| Phantom stealth rush | Al-Noor reveal + Ironclad AoE | Exposes hidden units, AoE ignores stealth |
| Al-Noor synergy engine | Ember burst before synergies build | Kill the engine cards early |

---

## Skill Naming Convention

All skill names use Arabic/Islamic-heritage vocabulary. Sources: classical Arabic military terms, elemental Arabic nouns, Sufi/philosophical concepts, Islamic architectural terms.

**Red lines:** No prophet names, no companion names, no Quranic verses.

---

## Skill Gating Reference (from GDD §5.6)

| Rarity | Skill 1 (Passive) | Skill 2 (Active) | Skill 3 (Ultimate) |
|---|---|---|---|
| **Common** | ✅ | — | — |
| **Uncommon** | ✅ | ✅ | — |
| **Rare** | ✅ | ✅ | — |
| **Epic** | ✅ | ✅ | ✅ |
| **Legendary** | ✅ | ✅ | ✅ |

---

---

# 🔩 IRONCLAD FACTION — Tank / Control

**Theme:** Walls, armor, damage reduction, lane lockdown. Slow but immovable.
**Weakness:** Low damage output; Phantom displacement breaks their formations.

---

## Ironclad Creatures

---

### Common — Dara'a (الدرع — "Shield")

*A small clockwork sentinel with a massive tower shield.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tahseen** | تحصين — Fortification | Passive | Reduces all incoming damage by 10%. Increases to 15% if deployed in Slot 1 or Slot 5 (flanks). |

> **Strategic note:** Encourages deliberate lane placement — flanking slots reward the player.

---

### Common — Mismaar (مسمار — "Nail/Rivet")

*A squat, riveted golem bristling with gear-teeth.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tathbeet** | تثبيت — Anchoring | Passive | Cannot be displaced or swapped by enemy abilities. Gains +5% ATK for each adjacent friendly card. |

> **Counter-play:** Hard counter to Phantom's swap/displacement — but individually weak damage.

---

### Uncommon — Burj (برج — "Tower")

*A walking watchtower construct of steel and brass.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Hiraasa** | حراسة — Guarding | Passive | While deployed, adjacent friendly cards take 15% less damage from all sources. |
| Skill 2 | **Sadma** | صدمة — Impact | Active: On Attack | If Burj attacks a card with higher ATK, reduces that card's ATK by 20% for 4 seconds. |

> **Strategic note:** Burj is the "bodyguard" — park it next to your carry card. But its own damage is low, so pure Ironclad decks deal damage slowly.

---

### Uncommon — Sindaan (سندان — "Anvil")

*A massive flat-topped golem that absorbs punishment.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Sabar** | صبر — Endurance | Passive | Gains +2% max HP every 4 seconds while in play (caps at +30% max HP). |
| Skill 2 | **Radd** | رد — Retaliation | Active: On Damaged | When hit, deals 20% of damage taken back to attacker as direct damage. |

> **Strategic note:** Time-bomb tank — gets harder to kill the longer it stays alive. Aggro decks need to burst it fast or ignore it.

---

### Rare — Qal'a (قلعة — "Fortress")

*A walking citadel construct with battlements for shoulders.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Hisar** | حصار — Siege Wall | Passive | Has Taunt. Enemies in the same lane cannot redirect attacks to other lanes while Qal'a is alive. |
| Skill 2 | **Tadmir** | تدمير — Demolition | Active: Every 6s | Deals damage equal to 8% of Qal'a's current HP to the opposing card. |

> **Strategic note:** Qal'a is the ultimate lane-locker. But it can't attack adjacent lanes, so 4 other lanes are unprotected. Ember burn eats it alive over time.

---

### Rare — Jundub (جندب — "Grasshopper" / classical Arabic for light warrior)

*A sleek, fast-striking mechanical knight with teal energy cores.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Muqawama** | مقاومة — Resistance | Passive | Immune to Freeze and slow effects. |
| Skill 2 | **Darba Muzdawaja** | ضربة مزدوجة — Double Strike | Active: On Deploy | Attacks twice on the round it's deployed. |

> **Strategic note:** The Ironclad's answer to control — can't be frozen, hits hard on deploy. But no sustain — needs support.

---

### Epic — Sayyaad Al-Suwar (صيّاد السور — "Wall Breacher")

*An enormous siege automaton with a battering ram forehead.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Duru' Muharrak** | دروع محرّك — Animated Armor | Passive | Takes 25% less damage from the first hit each round. |
| Skill 2 | **Ikhtiraaq** | اختراق — Breach | Active: On Attack | Ignores 40% of the target's Shield keyword. If the target has no Shield, deals 15% bonus damage. |
| Skill 3 | **Zalzala** | زلزلة — Earthquake | Ultimate: Once per match | Deals 30 damage to ALL cards on BOTH sides of the field. Ironclad cards take half damage. |

> **Strategic note:** Zalzala is a board-reset button — devastating if your board is Ironclad-heavy (half damage), but punishes mixed decks on your own side too. Creates a deck-building constraint.

---

### Legendary — Tanneen Al-Hadid (تنّين الحديد — "Iron Dragon")

*A colossal dragon-shaped automaton of interlocking gears and molten steel.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Jild Al-Fulath** | جلد الفولاذ — Steel Hide | Passive | Damage from any single hit is capped at 15% of Tanneen's max HP. (Counters burst damage.) |
| Skill 2 | **Nafkhat Al-Nar** | نفخة النار — Fire Breath | Active: Every 6s | Deals 25 damage to the opposing card and 10 damage to cards in adjacent enemy slots. |
| Skill 3 | **Qalb Al-Masina** | قلب الماكينة — Heart of the Machine | Ultimate: Once per match | For 8 seconds, all friendly Ironclad cards become immune to damage. Non-Ironclad allies gain Shield (15% damage reduction) instead. |

> **Strategic note:** The mono-Ironclad dream card. Qalb Al-Masina rewards faction purity — mixed decks only get Shield, not full immunity. But Pierce and Phantom displacement bypass it entirely.

---

## Ironclad Hero — Mu'allim Al-Hadaada (معلّم الحدادة — "Master Blacksmith")

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Passive Aura | **Taqsiya** | تقسية — Tempering | Passive | All deployed Ironclad cards gain +8 flat damage reduction for the first 10 seconds after deployment. Non-Ironclad allies gain +4. |
| Surge | **Sitr Al-Hadid** | ستر الحديد — Iron Curtain | Once per match (2:00) | All friendly cards become invulnerable for 4 seconds. |

---

---

# 🌿 VERDANT FACTION — Sustain / Heal / Death Triggers

**Theme:** Healing, regeneration, on-death value, thorn damage. Outlasts aggro.
**Weakness:** Slow to set up; displacement and anti-heal effects destroy it.

---

## Verdant Creatures

---

### Common — Jidr (جذر — "Root")

*A small humanoid root-golem with bark armor.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Numuw** | نمو — Growth | Passive | Regenerates 2% of max HP every 2 seconds. |

---

### Common — Shawka (شوكة — "Thorn")

*A spiny cactus-like construct bristling with needles.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Radd Al-Shawk** | رد الشوك — Thorn Return | Passive | Reflects 10% of all incoming damage back to the attacker. |

---

### Uncommon — Ghusn (غصن — "Branch")

*A tall, slender tree-spirit with bioluminescent bark.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Zill Al-Shajara** | ظل الشجرة — Tree's Shade | Passive | Adjacent friendly cards heal 3 HP per round. |
| Skill 2 | **Taljeem** | تلجيم — Entangle | Active: On Deploy | Freezes the opposing card for 3 seconds. If no opposing card, reduces the nearest enemy's ATK by 15% for 4 seconds instead. |

---

### Uncommon — Ward (ورد — "Rose")

*A blooming floral golem that pulses with green light.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Ikseer** | إكسير — Elixir | Passive | When Ward is healed, 30% of the healing overflows to the adjacent ally with lowest HP. |
| Skill 2 | **Tafjeer Al-Zahr** | تفجير الزهر — Blossom Burst | Active: On Death | On death, heals all friendly cards for 15 HP. |

---

### Rare — Tineen (تينة — "Fig Tree" — ancient symbol of resilience)

*A massive fig-tree golem with winding roots for legs.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Judoor Ameeka** | جذور عميقة — Deep Roots | Passive | Cannot be displaced. Regenerates 3% of max HP per round. Regen increases to 5% if HP is below 40%. |
| Skill 2 | **Infijaar Al-Thamr** | انفجار الثمر — Fruit Burst | Active: On Death | When destroyed, spawns a 1★ Jidr (Common) in the same slot with 50% of Tineen's base HP. |

> **Strategic note:** Tineen makes lanes "sticky" — kill it and a replacement spawns. Forces the opponent to clear the lane twice. But Ember's anti-heal burn turns off the regen.

---

### Rare — Sarkhasa (سرخسة — "Fern")

*A fast-growing fern construct that spreads across lanes.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Intishaar** | انتشار — Spread | Passive | If both adjacent slots are empty, Sarkhasa gains +20% ATK and +20% HP. |
| Skill 2 | **Ghabat Samm** | غابة سم — Toxic Forest | Active: Every 8s | Poisons the opposing card, dealing 5 damage per second for 4 seconds. Poison does not stack. |

---

### Epic — Tanneen Al-Khashab (تنّين الخشب — "Wooden Dragon")

*A dragon-shaped treant construct, vines coiling like scales.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Qishra Hayya** | قشرة حيّة — Living Bark | Passive | Gains a shield equal to 10% of max HP at the start of each round. Shield does not stack — refreshes. |
| Skill 2 | **Sahq Al-Aghsaan** | سحق الأغصان — Branch Crush | Active: On Attack | Deals damage to the opposing card AND one random adjacent enemy card for 40% of ATK. |
| Skill 3 | **Ghaba Khaalida** | غابة خالدة — Eternal Forest | Ultimate: Once per match | For 10 seconds, all friendly Verdant cards regenerate 5% max HP per second. Non-Verdant allies regenerate 2%. |

> **Strategic note:** Ghaba Khaalida is the sustain ultimate — pairs devastatingly with high-HP tanks. But Ember's "Wasm" (anti-heal) shuts it down entirely.

---

### Legendary — Haaris Al-Waha (حارس الواحة — "Oasis Guardian")

*A titanic tree-spirit infused with spring water, crystalline roots glowing emerald.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Waaha** | واحة — Oasis | Passive | All friendly cards on the field heal 2 HP per second passively. If Haaris dies, all allies lose this regen. |
| Skill 2 | **Ma' Al-Hayat** | ماء الحياة — Water of Life | Active: Every 10s | Fully heals the friendly card with the lowest HP percentage. If that card is already above 80% HP, heals the Hero for 10 HP instead. |
| Skill 3 | **Ba'th Al-Rabee'** | بعث الربيع — Spring Resurrection | Ultimate: Once per match | Revives the last destroyed friendly Verdant card in an empty slot with 60% HP. That card gains +20% ATK for 8 seconds. |

> **Strategic note:** Haaris is the "engine" of heal decks — kill it and the entire regen engine collapses. Prioritizing its destruction is the counter.

---

## Verdant Hero — Shaykhah Al-Riyaad (شيخة الرياض — "Mistress of the Gardens")

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Passive Aura | **Naseem** | نسيم — Breeze | Passive | All friendly Verdant cards regenerate 1 HP/s passively. Non-Verdant allies regenerate 0.5 HP/s. |
| Surge | **Izdihar Kaamil** | إزدهار كامل — Full Bloom | Once per match (2:00) | Heals all friendly cards to full HP. |

---

---

# 🔥 EMBER FACTION — Aggro / Burst / Anti-Heal

**Theme:** Fast damage, burn over time, anti-heal, board-wide punishment.
**Weakness:** Low HP, no sustain. Crumbles vs. high-Shield tanks and control.

---

## Ember Creatures

---

### Common — Shara (شرارة — "Spark")

*A small fire elemental — a dancing flame with ember eyes.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Iltihab** | التهاب — Ignition | Passive | Attacks apply Burn to the target, dealing 3 damage per second for 4 seconds. Does not stack — refreshes duration. |

---

### Common — Ramad (رماد — "Ash")

*A drifting ash-cloud golem that smolders.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Ghubar Al-Nar** | غبار النار — Fire Dust | Passive | On death, deals 10 damage to all enemy cards in adjacent lanes. |

---

### Uncommon — Lahab (لهب — "Flame")

*A humanoid flame construct with a molten glass core.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Harara** | حرارة — Heat | Passive | Gains +5% ATK every 4 seconds (caps at +25% ATK). ATK buff resets if Lahab is frozen or stunned. |
| Skill 2 | **Wasm** | وسم — Brand | Active: On Attack | Target is Branded for 6 seconds. Branded targets cannot be healed by any source. |

> **Strategic note:** Wasm is the anti-heal keyword — the core counter to Verdant. But it only applies to one target at a time, so smart Verdant players heal around it.

---

### Uncommon — Jamra (جمرة — "Ember/Coal")

*A glowing coal construct that pulses with heat.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Daght** | ضغط — Pressure | Passive | Deals 2 damage per second to ALL cards in the same lane (enemies AND self). |
| Skill 2 | **Infijaar** | انفجار — Explosion | Active: On Death | When destroyed, deals 25 damage to the opposing card. |

> **Strategic note:** Jamra is a kamikaze — its passive hurts itself AND the opponent. Pair with heal support to offset self-damage. Creates interesting cross-faction deck decisions.

---

### Rare — Mawqid (موقد — "Furnace")

*A walking furnace construct with bellows for lungs.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tansheef Al-Nar** | تنشيف النار — Fire Drain | Passive | All enemy cards in the same lane as Mawqid lose 1 HP per second (passive burn aura). |
| Skill 2 | **Sahwa** | صحوة — Awakening | Active: Trigger at <30% HP | When HP drops below 30%, Mawqid's ATK doubles for 6 seconds. (Last Stand variant.) |

---

### Rare — Sayf Al-Lahab (سيف اللهب — "Flame Sword")

*A blazing sword-spirit — a sentient weapon of fire.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Huddah** | حدّة — Sharpness | Passive | Ignores 15% of target's Shield damage reduction. |
| Skill 2 | **Qat' Naar** | قطع ناري — Fire Slash | Active: Every 6s | Deals 20 damage to the opposing card. If that card is Burned, deals 35 damage instead. |

> **Strategic note:** Combos with any Burn applier — the "execute" card. But needs setup.

---

### Epic — Ifrit Al-Hajar (عفريت الحجر — "Stone Ifrit")

*A massive lava-stone djinn-construct, magma veins glowing through obsidian armor.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Jild Al-Hamm** | جلد الحمم — Lava Skin | Passive | Attackers take 10 damage when hitting Ifrit. Burn-affected attackers take 20 instead. |
| Skill 2 | **Nafas Al-Jahannam** | نفس الجحيم — Hellfire Breath | Active: Every 8s | Applies Burn (5 dmg/s for 6s) to ALL enemy cards. Also applies "Wasm" (anti-heal) to the card with highest HP for 4 seconds. |
| Skill 3 | **Thawratan Kubra** | ثورة كبرى — Great Eruption | Ultimate: Once per match | Deals 40 damage to all enemy cards. Enemy cards that are Burned take 60 instead. Removes all Burn from your own cards. |

> **Strategic note:** Thawratan Kubra punishes opponents who let Burns stack. But it also clears your own Burns, which can be relevant if an enemy Ember card is burning you back. Creates a timing decision.

---

### Legendary — Qaahir Al-Layl (قاهر الليل — "Night Conqueror")

*A towering plasma drake wreathed in white-hot flame, wings of molten glass.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Aura Al-Ihtiraaq** | هالة الاحتراق — Burning Aura | Passive | All enemy cards take 2 damage per second while Qaahir is alive. |
| Skill 2 | **Darba Khaariqa** | ضربة خارقة — Piercing Strike | Active: On Attack | Basic attacks ignore 30% of the target's damage reduction and Shield. |
| Skill 3 | **Shams Al-Fana'** | شمس الفناء — Sun of Destruction | Ultimate: Once per match | For 6 seconds, Qaahir's attacks hit ALL enemy cards for 50% damage (cleave). During this time, no enemy card can be healed. |

> **Strategic note:** The Ember finisher. Shams Al-Fana' is the ultimate Verdant counter — global anti-heal + AoE. But Qaahir's own HP is low for a Legendary; Ironclad can simply out-tank it.

---

## Ember Hero — Amir Al-Lahab (أمير اللهب — "Prince of Flame")

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Passive Aura | **Mawja Haarrah** | موجة حارّة — Heatwave | Passive | Every 30 seconds, deals 10 damage to all enemy cards. |
| Surge | **Naar Al-Qiyaama** | نار القيامة — Hellfire | Once per match (2:00) | Deals 30 damage to all enemy cards. |

---

---

# 👻 PHANTOM FACTION — Disruption / Tempo / Stealth

**Theme:** Displacement, stealth, tempo swings, enemy debuffs, positional disruption.
**Weakness:** Low HP and ATK. Needs to win through disruption — can't trade evenly.

---

## Phantom Creatures

---

### Common — Khayal (خيال — "Shadow/Phantom")

*A wispy shadow-construct with glowing void eyes.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Takhaffi** | تخفّي — Concealment | Passive | Gains Stealth for 4 seconds after deployment. While Stealthed, cannot be targeted by enemy abilities or basic attacks. |

---

### Common — Wiswaas (وسواس — "Whisper")

*A barely-visible mist entity that drifts between lanes.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tashweesh** | تشويش — Interference | Passive | The opposing card's ATK is reduced by 10% while Wiswaas is alive. |

---

### Uncommon — Saraaab (سراب — "Mirage")

*A shimmering, illusory desert spirit that flickers in and out.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Khida'** | خداع — Deception | Passive | Has a 25% chance to dodge any incoming attack (both basic and ability damage). |
| Skill 2 | **Tabaadul** | تبادل — Exchange | Active: On Deploy | Swaps the positions of two enemy cards on their side of the field. |

> **Strategic note:** Tabaadul is the signature Phantom disruption — it breaks the opponent's lane matchups. Deployed Qal'a protecting a carry? Swap it to a useless lane. But it costs Saraaab's deploy — you lose your own lane placement opportunity.

---

### Uncommon — Zilaal (ظلال — "Shadows")

*A cluster of dark, shifting silhouettes that move as one.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **In'ikaas** | انعكاس — Reflection | Passive | On deploy, creates a Mirror Image in a random empty slot. The Mirror Image has 30% of Zilaal's HP and ATK but dies after 6 seconds. |
| Skill 2 | **Tabkheer** | تبخير — Evaporation | Active: On Death | When destroyed, reduces the ATK of the card that killed it by 25% for 6 seconds. |

---

### Rare — Qareen (قرين — "Counterpart/Shadow-Self")

*A dark mirror entity that mimics the opponent's cards.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Muhaakaah** | محاكاة — Mimicry | Passive | Copies the Passive skill of the opposing card. If the opposing slot is empty, gains +15% ATK instead. |
| Skill 2 | **Salb Al-Quwa** | سلب القوى — Power Theft | Active: On Attack | Steals 10% of the opposing card's ATK and adds it to Qareen's ATK for 6 seconds. |

> **Strategic note:** Qareen is the ultimate "mirror match" card — its value depends entirely on what the opponent plays opposite it. Placing a weak card opposite Qareen wastes it. Placing a strong card lets Qareen copy its passive. Forces opponents to think about placement differently.

---

### Rare — Rasd (رصد — "Watcher")

*A tall, hooded phantom with a single glowing eye-orb.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Basira** | بصيرة — Insight | Passive | Reveals one random card from the opponent's hand every 10 seconds. |
| Skill 2 | **Lanat Al-Rasd** | لعنة الرصد — Watcher's Curse | Active: On Attack | The target cannot use Active skills for 4 seconds (Silence). |

> **Strategic note:** Information advantage + Silence. Perfect tempo card, but low stats means it's a liability in combat.

---

### Epic — Ifrit Al-Zalam (عفريت الظلام — "Dark Ifrit")

*A massive djinn-construct of swirling void energy and fractured geometric shards.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Hajib Al-Wujuud** | حاجب الوجود — Veil of Existence | Passive | Gains Stealth for 3 seconds after each kill. While Stealthed, regenerates 5% max HP per second. |
| Skill 2 | **Nafy** | نفي — Banishment | Active: Every 12s | Removes the opposing enemy card from the field for 4 seconds. The card returns to the same slot afterwards. (Target is untargetable while banished.) |
| Skill 3 | **Bab Al-Fana'** | باب الفناء — Gate of Oblivion | Ultimate: Once per match | Swaps ALL enemy cards' positions randomly. For 6 seconds after, all enemy cards have -20% ATK. |

> **Strategic note:** Bab Al-Fana' is the Ironclad killer — shuffles their carefully placed tanks and carries into wrong lanes. But it's random, so it might accidentally improve their positioning.

---

### Legendary — Sultaan Al-Zilaal (سلطان الظلال — "Sultan of Shadows")

*A regal phantom king of impossible geometry, his form a void in the shape of a throne.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Hukm Al-Khafaa'** | حكم الخفاء — Decree of Invisibility | Passive | All friendly Phantom cards gain Stealth for 2 seconds after any friendly card is destroyed. |
| Skill 2 | **Istibdaal** | استبدال — Substitution | Active: Every 10s | Swaps Sultaan with any friendly card on the field. Both cards retain their current HP. |
| Skill 3 | **Layl Abadi** | ليل أبدي — Eternal Night | Ultimate: Once per match | For 8 seconds, all enemy cards lose Stealth immunity and have their vision reduced — they can only attack the card directly opposite them (Void Rift modifier is disabled). All Phantom cards gain +25% ATK. |

> **Strategic note:** Layl Abadi forces the opponent into strict lane combat while empowering Phantom. But Al-Noor's reveal effects counter it, and Ember's AoE damage ignores lane restrictions entirely.

---

## Phantom Hero — Mudir Al-Ashbah (مدير الأشباح — "Master of Specters")

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Passive Aura | **Ibta'** | إبطاء — Deceleration | Passive | Reduces all enemy attack speed by 10% passively. |
| Surge | **Inhiyaar Al-Firaagh** | انهيار الفراغ — Void Collapse | Once per match (2:00) | Removes the strongest enemy card from the field for 6 seconds. |

---

---

# ✨ AL-NOOR FACTION — Synergy / Support / Intel

**Theme:** Amplifies allies, reveals enemy plans, hero sustain, cross-faction buffing.
**Weakness:** Individually weak. Without allies on the field, Al-Noor cards are liabilities.

---

## Al-Noor Creatures

---

### Common — Siraj (سراج — "Lamp")

*A floating lamp-construct radiating warm golden light.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tanweer** | تنوير — Illumination | Passive | Adjacent friendly cards gain +8% ATK. If both adjacent slots have friendly cards, bonus increases to +12%. |

> **Strategic note:** Siraj is the "engine" — put it in Slot 3 (center) to buff Slots 2 and 4. But it has the lowest HP of any card; kill Siraj and two cards lose their buff.

---

### Common — Nuqta (نقطة — "Point/Dot")

*A tiny geometric light construct — a single glowing point of sacred geometry.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Rabita** | رابطة — Bond | Passive | When deployed, heals the Hero for 5 HP. (Synergizes with Al-Noor faction synergy bonus — double trigger.) |

---

### Uncommon — Misbaah (مصباح — "Lantern")

*A large floating brass lantern with geometric cutouts casting light patterns.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Daleel** | دليل — Guide | Passive | The first card you deploy each round gains Haste (instant attack, no windup). |
| Skill 2 | **Kashf** | كشف — Revelation | Active: On Deploy | Reveals the opponent's entire hand for 6 seconds. |

> **Strategic note:** Information is power in FORGE — knowing your opponent's hand lets you make perfect placement decisions. But Misbaah itself is terrible in combat.

---

### Uncommon — Hilaal (هلال — "Crescent")

*A crescent-shaped light construct that orbits the battlefield.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Baraka** | بركة — Blessing | Passive | All friendly cards gain +5% HP. If 3+ Al-Noor cards are on the field, bonus increases to +10%. |
| Skill 2 | **Shifa'** | شفاء — Healing | Active: Every 8s | Heals the friendly card with the lowest HP for 15 HP. |

---

### Rare — Munajjim (منجّم — "Astrologer")

*A hooded scholar-construct holding a brass astrolabe, face in deep shadow.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Tawqee'** | توقيع — Prediction | Passive | At the start of each round, reveals the next card the opponent will draw. |
| Skill 2 | **Qadar** | قدر — Decree | Active: Every 12s | Choose one friendly card: it gains +20% ATK and +20% HP for 6 seconds. |

> **Strategic note:** Munajjim is the Al-Noor intel engine. Knowing what's coming lets you deploy preemptive counters. Qadar's targeted buff is versatile — works with any faction's carry.

---

### Rare — Muhandis (مهندس — "Engineer")

*An armored figure with geometric blueprints floating around it.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Takhteet** | تخطيط — Planning | Passive | When Muhandis is deployed, draw 1 extra card from your deck. |
| Skill 2 | **Bina'** | بناء — Construction | Active: On Deploy | Creates a "Haseen" (حصين — Bastion) ward in an empty slot adjacent to Muhandis. The ward has 50 HP, deals no damage, but has Taunt and blocks the lane for 8 seconds, then disappears. |

> **Strategic note:** Muhandis gives card advantage (extra draw) AND creates temporary blockers. Excellent support but can't carry alone.

---

### Epic — Qadi Al-Nujoom (قاضي النجوم — "Judge of Stars")

*A celestial construct of floating star-polygon shards connected by light threads.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Miizaan** | ميزان — Balance | Passive | If the enemy has more cards deployed than you, all your cards gain +10% ATK. If you have more, all your cards gain +10% HP instead. |
| Skill 2 | **Hukm** | حُكم — Judgment | Active: Every 10s | Deals damage to the enemy card with the highest ATK equal to 15% of that card's ATK. (Scales against strong enemies.) |
| Skill 3 | **Noor Al-Haqq** | نور الحق — Light of Truth | Ultimate: Once per match | For 10 seconds, all friendly cards gain +15% ATK and +15% HP. Enemy Stealth effects are removed. All enemy cards are revealed. |

> **Strategic note:** Noor Al-Haqq is the anti-Phantom ultimate — strips stealth, reveals everything. Also a general combat buff. But Qadi has low personal combat stats; it's a support card.

---

### Legendary — Mi'raj Al-Anwaar (معراج الأنوار — "Ascent of Lights")

*A towering construct of pure sacred geometry — interlocking star polygons forming a humanoid shape of pure light.*

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Skill 1 | **Wahda** | وحدة — Unity | Passive | Each friendly card of a different faction on the field gives Mi'raj +8% to all stats. (Max +40% with all 5 factions.) |
| Skill 2 | **Ishraaqa** | إشراقة — Radiance | Active: Every 8s | Heals ALL friendly cards for 8 HP and deals 8 damage to ALL enemy cards. |
| Skill 3 | **Siraat Al-Noor** | صراط النور — Path of Light | Ultimate: Once per match | For 10 seconds, each time a friendly card attacks, it heals the Hero for 3 HP. All friendly cards gain +20% ATK. |

> **Strategic note:** Mi'raj rewards *mixed-faction* decks with Wahda — the only Legendary that gets STRONGER from diversity. Mono-faction players get minimal benefit. This single card creates an entire "rainbow" deck archetype. But it's individually fragile — a Phantom displacement into a bad lane or an Ember burst can remove it before the synergies pay off.

---

## Al-Noor Hero — Al-Hakeem (الحكيم — "The Wise")

| Slot | Skill Name | Arabic | Type | Description |
|---|---|---|---|---|
| Passive Aura | **Ilm** | علم — Knowledge | Passive | Every 45 seconds, reveals the 3 rarest cards in the opponent's deck. |
| Surge | **Ishraaqa Kubraa** | إشراقة كبرى — Grand Illumination | Once per match (2:00) | All friendly cards attack twice for the next 8 seconds. |

---

---

# Summary — Full Card Roster

## Creature Cards (40 total)

| # | Card Name | Arabic Name | Faction | Rarity | Skills |
|---|---|---|---|---|---|
| 1 | Dara'a | الدرع | Ironclad | Common | Tahseen |
| 2 | Mismaar | مسمار | Ironclad | Common | Tathbeet |
| 3 | Burj | برج | Ironclad | Uncommon | Hiraasa, Sadma |
| 4 | Sindaan | سندان | Ironclad | Uncommon | Sabar, Radd |
| 5 | Qal'a | قلعة | Ironclad | Rare | Hisar, Tadmir |
| 6 | Jundub | جندب | Ironclad | Rare | Muqawama, Darba Muzdawaja |
| 7 | Sayyaad Al-Suwar | صيّاد السور | Ironclad | Epic | Duru' Muharrak, Ikhtiraaq, Zalzala |
| 8 | Tanneen Al-Hadid | تنّين الحديد | Ironclad | Legendary | Jild Al-Fulath, Nafkhat Al-Nar, Qalb Al-Masina |
| 9 | Jidr | جذر | Verdant | Common | Numuw |
| 10 | Shawka | شوكة | Verdant | Common | Radd Al-Shawk |
| 11 | Ghusn | غصن | Verdant | Uncommon | Zill Al-Shajara, Taljeem |
| 12 | Ward | ورد | Verdant | Uncommon | Ikseer, Tafjeer Al-Zahr |
| 13 | Tineen | تينة | Verdant | Rare | Judoor Ameeka, Infijaar Al-Thamr |
| 14 | Sarkhasa | سرخسة | Verdant | Rare | Intishaar, Ghabat Samm |
| 15 | Tanneen Al-Khashab | تنّين الخشب | Verdant | Epic | Qishra Hayya, Sahq Al-Aghsaan, Ghaba Khaalida |
| 16 | Haaris Al-Waha | حارس الواحة | Verdant | Legendary | Waaha, Ma' Al-Hayat, Ba'th Al-Rabee' |
| 17 | Shara | شرارة | Ember | Common | Iltihab |
| 18 | Ramad | رماد | Ember | Common | Ghubar Al-Nar |
| 19 | Lahab | لهب | Ember | Uncommon | Harara, Wasm |
| 20 | Jamra | جمرة | Ember | Uncommon | Daght, Infijaar |
| 21 | Mawqid | موقد | Ember | Rare | Tansheef Al-Nar, Sahwa |
| 22 | Sayf Al-Lahab | سيف اللهب | Ember | Rare | Huddah, Qat' Naar |
| 23 | Ifrit Al-Hajar | عفريت الحجر | Ember | Epic | Jild Al-Hamm, Nafas Al-Jahannam, Thawratan Kubra |
| 24 | Qaahir Al-Layl | قاهر الليل | Ember | Legendary | Aura Al-Ihtiraaq, Darba Khaariqa, Shams Al-Fana' |
| 25 | Khayal | خيال | Phantom | Common | Takhaffi |
| 26 | Wiswaas | وسواس | Phantom | Common | Tashweesh |
| 27 | Saraaab | سراب | Phantom | Uncommon | Khida', Tabaadul |
| 28 | Zilaal | ظلال | Phantom | Uncommon | In'ikaas, Tabkheer |
| 29 | Qareen | قرين | Phantom | Rare | Muhaakaah, Salb Al-Quwa |
| 30 | Rasd | رصد | Phantom | Rare | Basira, Lanat Al-Rasd |
| 31 | Ifrit Al-Zalam | عفريت الظلام | Phantom | Epic | Hajib Al-Wujuud, Nafy, Bab Al-Fana' |
| 32 | Sultaan Al-Zilaal | سلطان الظلال | Phantom | Legendary | Hukm Al-Khafaa', Istibdaal, Layl Abadi |
| 33 | Siraj | سراج | Al-Noor | Common | Tanweer |
| 34 | Nuqta | نقطة | Al-Noor | Common | Rabita |
| 35 | Misbaah | مصباح | Al-Noor | Uncommon | Daleel, Kashf |
| 36 | Hilaal | هلال | Al-Noor | Uncommon | Baraka, Shifa' |
| 37 | Munajjim | منجّم | Al-Noor | Rare | Tawqee', Qadar |
| 38 | Muhandis | مهندس | Al-Noor | Rare | Takhteet, Bina' |
| 39 | Qadi Al-Nujoom | قاضي النجوم | Al-Noor | Epic | Miizaan, Hukm, Noor Al-Haqq |
| 40 | Mi'raj Al-Anwaar | معراج الأنوار | Al-Noor | Legendary | Wahda, Ishraaqa, Siraat Al-Noor |

---

## Hero Cards (5 total)

| # | Hero Name | Arabic Name | Faction | Passive Aura | Surge |
|---|---|---|---|---|---|
| 1 | Mu'allim Al-Hadaada | معلّم الحدادة | Ironclad | Taqsiya (Tempering) | Sitr Al-Hadid (Iron Curtain) |
| 2 | Shaykhah Al-Riyaad | شيخة الرياض | Verdant | Naseem (Breeze) | Izdihar Kaamil (Full Bloom) |
| 3 | Amir Al-Lahab | أمير اللهب | Ember | Mawja Haarrah (Heatwave) | Naar Al-Qiyaama (Hellfire) |
| 4 | Mudir Al-Ashbah | مدير الأشباح | Phantom | Ibta' (Deceleration) | Inhiyaar Al-Firaagh (Void Collapse) |
| 5 | Al-Hakeem | الحكيم | Al-Noor | Ilm (Knowledge) | Ishraaqa Kubraa (Grand Illumination) |

---

## New Keyword Introduced: Wasm (Brand / Anti-Heal)

| Keyword | Definition | Visual Indicator |
|---|---|---|
| **Wasm** (وسم — Brand) | Target cannot be healed by any source for X seconds | Red brand mark glowing on card |

> This keyword integrates into the existing keyword system (§5.5 of GDD). It is the primary mechanic ensuring Sustain/Heal archetypes have a counter.

---

## New Keyword Introduced: Silence (Samt — صمت)

| Keyword | Definition | Visual Indicator |
|---|---|---|
| **Samt** (صمت — Silence) | Target cannot use Active or Ultimate skills for X seconds | Gray muzzle overlay on card |

> Silence is the Phantom faction's control tool — disabling enemy skills without killing the card. Creates tempo advantage.

---

## Sample Deck Archetypes (Strategic Diversity)

These are examples of viable competitive decks to demonstrate that no single deck dominates:

### 1. "Iron Wall" — Mono-Ironclad Tank

| Slot | Card | Role |
|---|---|---|
| Hero | Mu'allim Al-Hadaada | Tempering aura + Iron Curtain |
| 1 | Qal'a | Lane-lock Slot 1 |
| 2 | Sindaan | Scaling tank |
| 3 | Tanneen Al-Hadid | Carry |
| 4 | Burj | Bodyguard for Tanneen |
| 5 | Dara'a | Flank shield |
| Hand | Sayyaad Al-Suwar | Zalzala board reset |
| Hand | Jundub | Anti-freeze deploy |
| Spells | Iron Tempering, Ironhide | Defensive spells |

**Wins against:** Ember aggro (walls absorb burn), Al-Noor synergy (outlasts)
**Loses to:** Phantom displacement (breaks formation), Verdant sustain + Poison (out-heals Ironclad damage)

---

### 2. "Burn Everything" — Ember Aggro

| Slot | Card | Role |
|---|---|---|
| Hero | Amir Al-Lahab | Heatwave passive damage |
| 1-5 | Shara, Lahab, Jamra, Mawqid, Qaahir Al-Layl | Full burn pressure |
| Hand | Sayf Al-Lahab, Ifrit Al-Hajar | Execute + AoE |
| Spells | Flame Wave, Ember Trail | Board-wide burn |

**Wins against:** Verdant sustain (Wasm anti-heal), Al-Noor synergy (burst before setup)
**Loses to:** Ironclad walls (can't pierce), Phantom displacement (scattered burn targets)

---

### 3. "Shadow Ops" — Phantom Disruption

| Slot | Card | Role |
|---|---|---|
| Hero | Mudir Al-Ashbah | Speed reduction + Void Collapse |
| 1-5 | Khayal, Saraaab, Qareen, Rasd, Sultaan Al-Zilaal | Stealth + swap + copy |
| Hand | Ifrit Al-Zalam, Zilaal | Banishment + mirror images |
| Spells | Shadow Swap, Veil of Shadows | Repositioning |

**Wins against:** Ironclad (displacement dismantles walls), Al-Noor (removes engine cards)
**Loses to:** Ember AoE (ignores stealth), Verdant sustain (healing negates tempo)

---

### 4. "Garden of Life" — Verdant Sustain

| Slot | Card | Role |
|---|---|---|
| Hero | Shaykhah Al-Riyaad | Passive regen + Full Bloom surge |
| 1-5 | Tineen, Ghusn, Ward, Haaris Al-Waha, Tanneen Al-Khashab | Heal engine |
| Hand | Jidr, Sarkhasa | Lane filler + poison |
| Spells | Vine Snare, Overgrowth | Control + summon |

**Wins against:** Ironclad (out-heals, out-sustains), Phantom (heals through tempo loss)
**Loses to:** Ember Wasm (shuts down healing), Ember burst (too fast for regen to matter)

---

### 5. "Rainbow Forge" — Mixed-Faction Synergy

| Slot | Card | Role |
|---|---|---|
| Hero | Al-Hakeem | Intel + Grand Illumination |
| 1 | Qal'a (Ironclad) | Lane lock |
| 2 | Siraj (Al-Noor) | ATK buff engine |
| 3 | Mi'raj Al-Anwaar (Al-Noor) | Rainbow stat bonus |
| 4 | Lahab (Ember) | Anti-heal + damage |
| 5 | Khayal (Phantom) | Stealth scout |
| Hand | Ghusn (Verdant), Munajjim (Al-Noor) | Heal + intel |
| Spells | Radiant Burst, Forge Strike | Heal + direct hero damage |

**Wins against:** Mono-faction decks (Mi'raj outscales), Ironclad (mixed tools bypass walls)
**Loses to:** Focused Ember aggro (kills Mi'raj before synergies build), Phantom displacement (scatters the engine)
