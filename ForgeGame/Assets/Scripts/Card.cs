using UnityEngine;
using System;

[System.Serializable]
public enum Faction
{
    Ironclad,
    Verdant,
    Ember,
    Phantom,
    AlNoor,
    Neutral
}

[System.Serializable]
public class Card
{
    public string cardName;
    public Faction faction;
    public int baseATK;
    public int baseHP;
    public int currentATK;
    public int currentHP;
    public int initialSpawnDelay; // initial rounds delay
    public int currentSpawnDelay; // remaining rounds delay
    public int level;
    public bool isSpell;
    public string skillDescription;

    // Active keywords
    public bool hasShield;
    public bool hasTaunt;
    public bool hasHaste;

    public Card(string name, Faction faction, int atk, int hp, int delay, int level, bool isSpell = false)
    {
        this.cardName = name;
        this.faction = faction;
        this.baseATK = atk;
        this.baseHP = hp;
        this.currentATK = atk;
        this.currentHP = hp;
        this.initialSpawnDelay = delay;
        this.currentSpawnDelay = delay;
        this.level = level;
        this.isSpell = isSpell;
    }

    public Card Clone()
    {
        Card copy = new Card(cardName, faction, baseATK, baseHP, initialSpawnDelay, level, isSpell)
        {
            currentATK = this.currentATK,
            currentHP = this.currentHP,
            currentSpawnDelay = this.currentSpawnDelay,
            hasShield = this.hasShield,
            hasTaunt = this.hasTaunt,
            hasHaste = this.hasHaste,
            skillDescription = this.skillDescription
        };
        return copy;
    }

    public void TakeDamage(int amount)
    {
        if (hasShield)
        {
            // Shield blocks 15% damage
            amount = Mathf.Max(1, Mathf.RoundToInt(amount * 0.85f));
        }
        currentHP -= amount;
        if (currentHP < 0) currentHP = 0;
    }
}
