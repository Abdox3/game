-- FORGE - Turn-Based Card Game Prototype in Love2D
-- Neo-Islamic Glassmorphic Aesthetic

-- Card Factions
local FACTION = {
    IRONCLAD = {name = "Ironclad", color = {0.35, 0.55, 0.93}},
    VERDANT = {name = "Verdant", color = {0.27, 0.72, 0.38}},
    EMBER = {name = "Ember", color = {0.91, 0.32, 0.22}},
    PHANTOM = {name = "Phantom", color = {0.61, 0.34, 0.89}},
    ALNOOR = {name = "Al-Noor", color = {0.83, 0.66, 0.33}},
    NEUTRAL = {name = "Neutral", color = {0.5, 0.5, 0.5}}
}

-- Card Definition
local Card = {}
function Card.new(name, faction, atk, hp, delay, lvl, icon, shield, taunt, haste)
    local c = {
        name = name,
        faction = faction,
        base_atk = atk,
        base_hp = hp,
        atk = atk,
        hp = hp,
        max_hp = hp,
        initial_delay = delay,
        delay = delay,
        level = lvl,
        icon = icon or "❓",
        has_shield = shield or false,
        has_taunt = taunt or false,
        has_haste = haste or false,
        -- Visual/Animation parameters
        x = 0, y = 0,
        target_x = 0, target_y = 0,
        anim_offset_y = 0,
        shake_timer = 0
    }
    return c
end

-- Deep clone card
function Card.clone(c)
    return Card.new(
        c.name, c.faction, c.base_atk, c.base_hp, c.initial_delay,
        c.level, c.icon, c.has_shield, c.has_taunt, c.has_haste
    )
end

-- Game State variables
local game = {
    phase = "setup", -- setup, round_start, placement, combat, game_over
    round = 1,
    player_hp = 100,
    opponent_hp = 100,
    player_deck = {},
    opponent_deck = {},
    player_hand = {},
    opponent_hand = {},
    player_slots = {nil, nil, nil, nil, nil},
    opponent_slots = {nil, nil, nil, nil, nil},
    
    -- Drag & Drop
    dragged_card = nil,
    dragged_index = nil,
    drag_offset_x = 0,
    drag_offset_y = 0,
    
    -- Combat sequencer
    combat_column = 1,
    combat_timer = 0,
    combat_step = 0, -- 0: idle, 1: player strike, 2: opponent strike, 3: column cleanup
    
    -- Combat Log
    logs = {},
    max_logs = 18,
    
    -- Screen shake for feedback
    screen_shake = 0,
    
    -- Particles / Floating Damage Text
    particles = {}
}

-- Setup default font sizes
local fonts = {}

-- Helper to log messages
local function add_log(msg)
    table.insert(game.logs, msg)
    if #game.logs > game.max_logs then
        table.remove(game.logs, 1)
    end
end

-- Helper to spawn floating text
local function spawn_damage_text(text, x, y, color)
    table.insert(game.particles, {
        text = text,
        x = x,
        y = y,
        vy = -40, -- float upwards
        alpha = 1.0,
        color = color or {1, 1, 1},
        life = 1.2
    })
end

-- Generate full starting decks
local function generate_decks()
    game.player_deck = {
        Card.new("Chrono-Sentinel", FACTION.IRONCLAD, 15, 60, 3, 30, "🤖", true, false, false),
        Card.new("Tower Knight", FACTION.IRONCLAD, 10, 80, 2, 10, "🛡️", false, true, false),
        Card.new("Alloy Golem", FACTION.IRONCLAD, 20, 100, 4, 60, "⛓️", false, false, false),
        Card.new("Thornwall", FACTION.VERDANT, 5, 90, 1, 10, "🌿", false, true, false),
        Card.new("Grove Warden", FACTION.VERDANT, 18, 70, 2, 40, "🌲", false, false, false),
        Card.new("Mamluk Vanguard", FACTION.ALNOOR, 25, 50, 0, 1, "🐎", false, false, true),
        Card.new("Sandstorm Caller", FACTION.ALNOOR, 12, 55, 3, 30, "🌪️", false, false, false),
        Card.new("Cinder Drake", FACTION.EMBER, 30, 40, 3, 10, "🐉", false, false, false),
        Card.new("Phoenix Automaton", FACTION.EMBER, 22, 60, 2, 30, "🔥", false, false, false),
        Card.new("Eclipse Shade", FACTION.PHANTOM, 16, 45, 1, 10, "👁️", false, false, false),
        Card.new("Void Sentinel", FACTION.PHANTOM, 20, 75, 3, 60, "🌀", false, false, false),
        Card.new("Rust Automaton", FACTION.NEUTRAL, 14, 50, 1, 1, "⚙️", false, false, false),
    }

    game.opponent_deck = {
        Card.new("Steel Defender", FACTION.IRONCLAD, 10, 75, 2, 10, "🛡️", false, true, false),
        Card.new("Kinetic Sentinel", FACTION.IRONCLAD, 18, 55, 3, 30, "🤖", false, false, false),
        Card.new("Bramble Beast", FACTION.VERDANT, 15, 65, 2, 10, "🐺", false, false, false),
        Card.new("Sylvan Oak", FACTION.VERDANT, 8, 100, 4, 60, "🌳", false, false, false),
        Card.new("Bedouin Scout", FACTION.ALNOOR, 14, 40, 0, 1, "🐫", false, false, true),
        Card.new("Solar Construct", FACTION.ALNOOR, 22, 50, 2, 30, "☀️", false, false, false),
        Card.new("Flame Spinner", FACTION.EMBER, 25, 45, 3, 10, "🕸️", false, false, false),
        Card.new("Magma Giant", FACTION.EMBER, 35, 90, 5, 60, "🌋", false, false, false),
        Card.new("Phantasm Anchor", FACTION.PHANTOM, 12, 85, 3, 30, "⚓", true, false, false),
        Card.new("Specter Shade", FACTION.PHANTOM, 20, 40, 1, 10, "👻", false, false, false),
        Card.new("Stone Automaton", FACTION.NEUTRAL, 15, 60, 2, 1, "🗿", false, false, false),
        Card.new("Bronze Defender", FACTION.NEUTRAL, 11, 70, 1, 10, "🪙", false, false, false),
    }

    -- Shuffle decks
    for i = #game.player_deck, 2, -1 do
        local r = love.math.random(i)
        game.player_deck[i], game.player_deck[r] = game.player_deck[r], game.player_deck[i]
    end
    for i = #game.opponent_deck, 2, -1 do
        local r = love.math.random(i)
        game.opponent_deck[i], game.opponent_deck[r] = game.opponent_deck[r], game.opponent_deck[i]
    end
end

-- Fill hands from decks
local function fill_hands()
    while #game.player_hand < 5 and #game.player_deck > 0 do
        local card = table.remove(game.player_deck, 1)
        table.insert(game.player_hand, card)
        add_log("Player drew " .. card.name .. " (Delay: " .. card.delay .. ")")
    end
    while #game.opponent_hand < 5 and #game.opponent_deck > 0 do
        local card = table.remove(game.opponent_deck, 1)
        table.insert(game.opponent_hand, card)
    end
end

-- Initialize round
local function start_round()
    game.phase = "round_start"
    add_log("--- Round " .. game.round .. " Begin ---")

    -- Decrement delay for hand cards
    for _, card in ipairs(game.player_hand) do
        if card.delay > 0 then
            card.delay = card.delay - 1
        end
    end
    for _, card in ipairs(game.opponent_hand) do
        if card.delay > 0 then
            card.delay = card.delay - 1
        end
    end

    fill_hands()

    game.phase = "placement"
end

-- Check game over conditions
local function check_game_over()
    if game.player_hp <= 0 then
        game.phase = "game_over"
        add_log("GAME OVER! Opponent Hero Wins.")
        return true
    elseif game.opponent_hp <= 0 then
        game.phase = "game_over"
        add_log("VICTORY! You Defeated the Opponent Hero.")
        return true
    end

    -- Check if card pools are completely empty
    local player_has_cards = false
    local opp_has_cards = false
    for i = 1, 5 do
        if game.player_slots[i] then player_has_cards = true end
        if game.opponent_slots[i] then opp_has_cards = true end
    end
    if #game.player_hand > 0 or #game.player_deck > 0 then player_has_cards = true end
    if #game.opponent_hand > 0 or #game.opponent_deck > 0 then opp_has_cards = true end

    if not player_has_cards and not opp_has_cards then
        game.phase = "game_over"
        add_log("GAME OVER! It is a Draw (No cards left).")
        return true
    elseif not player_has_cards then
        game.phase = "game_over"
        add_log("GAME OVER! Player ran out of cards.")
        return true
    elseif not opp_has_cards then
        game.phase = "game_over"
        add_log("VICTORY! Opponent ran out of cards.")
        return true
    end

    return false
end

-- Run simple Opponent AI deployment
local function run_bot_ai()
    local ready_cards = {}
    for i, card in ipairs(game.opponent_hand) do
        if card.delay == 0 then
            table.insert(ready_cards, {card = card, index = i})
        end
    end

    for _, entry in ipairs(ready_cards) do
        -- Find first empty slot
        for slot = 1, 5 do
            if not game.opponent_slots[slot] then
                -- Place card
                game.opponent_slots[slot] = entry.card
                -- Remove from hand
                for idx, c in ipairs(game.opponent_hand) do
                    if c == entry.card then
                        table.remove(game.opponent_hand, idx)
                        break
                    end
                end
                add_log("Opponent deployed " .. entry.card.name .. " to Slot " .. slot)
                break
            end
        end
    end
end

-- Run damage calculations on a card
local function damage_card(card, amount, is_player, slot_idx)
    local target_x = 130 + (slot_idx - 1) * 135 + 55
    local target_y = is_player and 360 + 80 or 160 + 80

    local final_damage = amount
    if card.has_shield then
        final_damage = math.max(1, math.round(amount * 0.85))
        spawn_damage_text("-" .. final_damage .. " (Shielded)", target_x, target_y - 20, {0.35, 0.55, 0.93})
    else
        spawn_damage_text("-" .. final_damage, target_x, target_y - 20, {0.91, 0.32, 0.22})
    end

    card.hp = card.hp - final_damage
    if card.hp < 0 then card.hp = 0 end
    card.shake_timer = 0.4
end

-- End Placement phase and trigger Fight
local function end_placement()
    if game.phase ~= "placement" then return end
    
    run_bot_ai()
    
    game.phase = "combat"
    game.combat_column = 1
    game.combat_timer = 0
    game.combat_step = 0
    add_log("Combat phase started!")
end

-- Start game
local function start_game()
    game.player_hp = 100
    game.opponent_hp = 100
    game.round = 1
    game.logs = {}
    game.player_slots = {nil, nil, nil, nil, nil}
    game.opponent_slots = {nil, nil, nil, nil, nil}
    game.player_hand = {}
    game.opponent_hand = {}
    game.particles = {}
    
    generate_decks()
    
    -- Draw 5
    for i = 1, 5 do
        if #game.player_deck > 0 then
            table.insert(game.player_hand, table.remove(game.player_deck, 1))
        end
        if #game.opponent_deck > 0 then
            table.insert(game.opponent_hand, table.remove(game.opponent_deck, 1))
        end
    end

    add_log("Game started! Drag and drop cards to deploy.")
    start_round()
end

-- Love2D callbacks
function love.load()
    love.window.setTitle("FORGE - Card Battle Prototype")
    love.window.setMode(1280, 720, {resizable = false, vsync = true})
    
    -- Set nice default fonts
    fonts.large = love.graphics.newFont(26)
    fonts.medium = love.graphics.newFont(16)
    fonts.small = love.graphics.newFont(12)
    fonts.micro = love.graphics.newFont(10)
    
    start_game()
end

function love.update(dt)
    -- Reduce screen shake
    if game.screen_shake > 0 then
        game.screen_shake = game.screen_shake - dt * 10
        if game.screen_shake < 0 then game.screen_shake = 0 end
    end

    -- Update card visual positions
    -- Hand positioning logic
    local start_x = 130
    local spacing = 125
    for i, card in ipairs(game.player_hand) do
        if card ~= game.dragged_card then
            local tx = start_x + (i - 1) * spacing
            local ty = 540
            card.x = card.x + (tx - card.x) * 10 * dt
            card.y = card.y + (ty - card.y) * 10 * dt
        end
    end

    -- Deployed slots card shakes
    for i = 1, 5 do
        local p = game.player_slots[i]
        if p then
            if p.shake_timer > 0 then p.shake_timer = p.shake_timer - dt end
        end
        local o = game.opponent_slots[i]
        if o then
            if o.shake_timer > 0 then o.shake_timer = o.shake_timer - dt end
        end
    end

    -- Update particles / damage texts
    for i = #game.particles, 1, -1 do
        local p = game.particles[i]
        p.y = p.y + p.vy * dt
        p.life = p.life - dt
        p.alpha = math.max(0, p.life / 1.2)
        if p.life <= 0 then
            table.remove(game.particles, i)
        end
    end

    -- Resolve Combat Sequencer
    if game.phase == "combat" then
        game.combat_timer = game.combat_timer + dt

        if game.combat_timer >= 0.8 then
            game.combat_timer = 0
            
            -- Find the current column with active cards
            local col = game.combat_column
            if col > 5 then
                -- Combat finishes, advance round
                if not check_game_over() then
                    game.round = game.round + 1
                    start_round()
                end
                return
            end

            local p_card = game.player_slots[col]
            local o_card = game.opponent_slots[col]

            if not p_card and not o_card then
                -- Skip empty column immediately
                game.combat_column = col + 1
                return
            end

            -- Combat Step Machine
            if game.combat_step == 0 then
                -- Strike 1: Player Card attacks
                if p_card then
                    p_card.anim_offset_y = -35 -- slide forward towards opponent slot
                    if o_card then
                        add_log("Slot " .. col .. ": " .. p_card.name .. " strikes " .. o_card.name .. " for " .. p_card.atk)
                        damage_card(o_card, p_card.atk, false, col)
                    else
                        add_log("Slot " .. col .. ": " .. p_card.name .. " attacks Opponent Hero directly for " .. p_card.atk)
                        game.opponent_hp = math.max(0, game.opponent_hp - p_card.atk)
                        game.screen_shake = 5
                        spawn_damage_text("-" .. p_card.atk, 445, 80, {0.91, 0.32, 0.22})
                    end
                end
                game.combat_step = 1

            elseif game.combat_step == 1 then
                -- Reset player anim
                if p_card then p_card.anim_offset_y = 0 end

                -- Strike 2: Opponent Card attacks
                if o_card then
                    o_card.anim_offset_y = 35 -- slide forward towards player slot
                    if p_card then
                        add_log("Slot " .. col .. ": " .. o_card.name .. " strikes " .. p_card.name .. " for " .. o_card.atk)
                        damage_card(p_card, o_card.atk, true, col)
                    else
                        add_log("Slot " .. col .. ": " .. o_card.name .. " attacks Player Hero directly for " .. o_card.atk)
                        game.player_hp = math.max(0, game.player_hp - o_card.atk)
                        game.screen_shake = 5
                        spawn_damage_text("-" .. o_card.atk, 445, 530, {0.91, 0.32, 0.22})
                    end
                end
                game.combat_step = 2

            elseif game.combat_step == 2 then
                -- Reset opponent anim
                if o_card then o_card.anim_offset_y = 0 end

                -- Cleanup Dead Cards
                if p_card and p_card.hp <= 0 then
                    add_log("Player's " .. p_card.name .. " has fallen.")
                    game.player_slots[col] = nil
                end
                if o_card and o_card.hp <= 0 then
                    add_log("Opponent's " .. o_card.name .. " has fallen.")
                    game.opponent_slots[col] = nil
                end

                -- Move to next column
                game.combat_step = 0
                game.combat_column = col + 1
            end
        end
    end
end

-- Math utility round
function math.round(n)
    return math.floor(n + 0.5)
end

-- Draw helper for glassmorphic panel
local function draw_panel(x, y, w, h, border_color)
    love.graphics.setColor(0.08, 0.11, 0.2, 0.85) -- Frosted glass dark blue
    love.graphics.rectangle("fill", x, y, w, h, 12, 12)
    love.graphics.setColor(border_color or {0.83, 0.66, 0.33, 0.15})
    love.graphics.setLineWidth(1.5)
    love.graphics.rectangle("line", x, y, w, h, 12, 12)
end

-- Draw a single large card
local function draw_card(c, x, y, is_ready, is_dragging)
    local width = 110
    local height = 160
    
    -- Base background color by faction
    local colors = c.faction.color
    local alpha = is_ready and 0.9 or 0.4
    
    love.graphics.setColor(0.05, 0.08, 0.14, alpha)
    love.graphics.rectangle("fill", x, y, width, height, 10, 10)
    
    -- Card border
    local border_color = {colors[1], colors[2], colors[3], is_ready and 0.6 or 0.15}
    if is_dragging then
        border_color = {0.83, 0.66, 0.33, 1.0}
    end
    love.graphics.setColor(border_color)
    love.graphics.setLineWidth(is_ready and 1.8 or 1.0)
    love.graphics.rectangle("line", x, y, width, height, 10, 10)
    
    -- Top bar header (Level and faction icon)
    love.graphics.setColor(1, 1, 1, is_ready and 0.8 or 0.3)
    love.graphics.setFont(fonts.micro)
    love.graphics.print("Lv." .. c.level, x + 8, y + 8)
    
    love.graphics.setFont(fonts.medium)
    love.graphics.print(c.icon, x + width - 26, y + 4)
    
    -- Card Name
    love.graphics.setColor(1, 1, 1, is_ready and 0.9 or 0.3)
    love.graphics.setFont(fonts.small)
    local wrap_limit = width - 12
    love.graphics.printf(c.name, x + 6, y + 50, wrap_limit, "center")
    
    -- Card Faction label
    love.graphics.setColor(colors[1], colors[2], colors[3], is_ready and 0.8 or 0.3)
    love.graphics.setFont(fonts.micro)
    love.graphics.printf(c.faction.name, x + 6, y + 105, wrap_limit, "center")
    
    -- Bottom stats bar (ATK and HP)
    love.graphics.setFont(fonts.medium)
    
    -- ATK
    love.graphics.setColor(0.95, 0.73, 0.15, is_ready and 0.9 or 0.3) -- Yellow/Gold ATK
    love.graphics.print("⚔" .. c.atk, x + 10, y + height - 26)
    
    -- HP
    love.graphics.setColor(0.27, 0.85, 0.45, is_ready and 0.9 or 0.3) -- Green HP
    local hp_txt = "❤" .. c.hp
    local hp_w = fonts.medium:getWidth(hp_txt)
    love.graphics.print(hp_txt, x + width - hp_w - 10, y + height - 26)

    -- Shield Icon overlay
    if c.has_shield then
        love.graphics.setColor(0.35, 0.55, 0.93, is_ready and 0.9 or 0.3)
        love.graphics.print("🛡️", x + width/2 - 8, y + height - 26)
    end
    
    -- Spawn Delay overlay
    if not is_ready then
        love.graphics.setColor(0, 0, 0, 0.75)
        love.graphics.rectangle("fill", x, y, width, height, 10, 10)
        
        love.graphics.setColor(0.95, 0.73, 0.15, 0.9)
        love.graphics.setFont(fonts.large)
        love.graphics.printf("⏳", x, y + 40, width, "center")
        
        love.graphics.setFont(fonts.small)
        love.graphics.printf(c.delay .. " Rnds", x, y + 90, width, "center")
    end
end

-- Draw the Girih pattern lines in the background
local function draw_girih()
    love.graphics.setColor(0.83, 0.66, 0.33, 0.035)
    love.graphics.setLineWidth(1)
    local cx, cy = love.graphics.getWidth() / 2, love.graphics.getHeight() / 2
    local r_step = 60
    for r = 50, 1100, r_step do
        local points = {}
        for i = 0, 7 do
            local angle1 = i * math.pi / 4
            local angle2 = (i + 3) * math.pi / 4
            local x1 = cx + math.cos(angle1) * r
            local y1 = cy + math.sin(angle1) * r
            local x2 = cx + math.cos(angle2) * r
            local y2 = cy + math.sin(angle2) * r
            love.graphics.line(x1, y1, x2, y2)
        end
    end
end

function love.draw()
    -- Apply screen shake
    love.graphics.push()
    if game.screen_shake > 0 then
        local dx = love.math.random(-game.screen_shake, game.screen_shake)
        local dy = love.math.random(-game.screen_shake, game.screen_shake)
        love.graphics.translate(dx, dy)
    end

    -- Draw Girih background patterns
    draw_girih()

    -- 1. OPPONENT HERO HUD
    draw_panel(130, 40, 640, 60)
    love.graphics.setColor(1, 1, 1, 0.9)
    love.graphics.setFont(fonts.large)
    love.graphics.print("😈 OPPONENT HERO", 150, 52)
    -- HP Bar
    love.graphics.setColor(0.2, 0.2, 0.2, 0.8)
    love.graphics.rectangle("fill", 440, 58, 300, 24, 6, 6)
    love.graphics.setColor(0.91, 0.32, 0.22)
    love.graphics.rectangle("fill", 440, 58, 300 * (game.opponent_hp / 100), 24, 6, 6)
    love.graphics.setColor(1, 1, 1, 0.9)
    love.graphics.setFont(fonts.medium)
    love.graphics.printf(game.opponent_hp .. " / 100", 440, 60, 300, "center")

    -- 2. FIELD SLOTS (OPPONENT)
    for i = 1, 5 do
        local slot_x = 130 + (i - 1) * 135
        local slot_y = 130
        
        -- Dotted Slot Outline
        love.graphics.setColor(0.91, 0.32, 0.22, 0.08)
        love.graphics.rectangle("fill", slot_x, slot_y, 110, 160, 10, 10)
        love.graphics.setColor(0.91, 0.32, 0.22, 0.2)
        love.graphics.setLineWidth(1.5)
        love.graphics.rectangle("line", slot_x, slot_y, 110, 160, 10, 10)
        
        local card = game.opponent_slots[i]
        if card then
            local draw_y = slot_y + card.anim_offset_y
            if card.shake_timer > 0 then
                draw_y = draw_y + love.math.random(-3, 3)
            end
            local isActive = (game.phase == "combat" and game.combat_column == i and game.combat_step == 1)
            draw_card(card, slot_x, draw_y, true, isActive)
        end
    end

    -- 3. FIELD SLOTS (PLAYER)
    for i = 1, 5 do
        local slot_x = 130 + (i - 1) * 135
        local slot_y = 330
        
        -- Dotted Slot Outline
        love.graphics.setColor(0.27, 0.72, 0.38, 0.08)
        love.graphics.rectangle("fill", slot_x, slot_y, 110, 160, 10, 10)
        love.graphics.setColor(0.27, 0.72, 0.38, 0.2)
        love.graphics.setLineWidth(1.5)
        love.graphics.rectangle("line", slot_x, slot_y, 110, 160, 10, 10)
        
        local card = game.player_slots[i]
        if card then
            local draw_y = slot_y + card.anim_offset_y
            if card.shake_timer > 0 then
                draw_y = draw_y + love.math.random(-3, 3)
            end
            local isActive = (game.phase == "combat" and game.combat_column == i and game.combat_step == 0)
            draw_card(card, slot_x, draw_y, true, isActive)
        end
    end

    -- Highlight current active column in combat
    if game.phase == "combat" and game.combat_column <= 5 then
        local col_x = 130 + (game.combat_column - 1) * 135 - 4
        love.graphics.setColor(0.83, 0.66, 0.33, 0.35)
        love.graphics.setLineWidth(3)
        love.graphics.rectangle("line", col_x, 126, 118, 368, 12, 12)
    end

    -- 4. PLAYER HERO HUD
    draw_panel(130, 520, 640, 60)
    love.graphics.setColor(1, 1, 1, 0.9)
    love.graphics.setFont(fonts.large)
    love.graphics.print("🛡️ YOUR HERO", 150, 532)
    -- HP Bar
    love.graphics.setColor(0.2, 0.2, 0.2, 0.8)
    love.graphics.rectangle("fill", 440, 538, 300, 24, 6, 6)
    love.graphics.setColor(0.27, 0.72, 0.38)
    love.graphics.rectangle("fill", 440, 538, 300 * (game.player_hp / 100), 24, 6, 6)
    love.graphics.setColor(1, 1, 1, 0.9)
    love.graphics.setFont(fonts.medium)
    love.graphics.printf(game.player_hp .. " / 100", 440, 540, 300, "center")

    -- 5. COMBAT LOG PANEL (RIGHT SIDE)
    draw_panel(820, 40, 360, 480)
    love.graphics.setColor(0.83, 0.66, 0.33, 0.9)
    love.graphics.setFont(fonts.medium)
    love.graphics.printf("⚔️ COMBAT LOG", 820, 55, 360, "center")
    
    love.graphics.setFont(fonts.small)
    love.graphics.setColor(0.9, 0.9, 0.9, 0.75)
    for idx, entry in ipairs(game.logs) do
        local draw_y = 90 + (idx - 1) * 22
        love.graphics.print("> " .. entry, 840, draw_y)
    end

    -- 6. CONTROLS PANEL
    draw_panel(820, 540, 360, 140)
    -- BUTTON: FIGHT
    local btn_x, btn_y, btn_w, btn_h = 840, 560, 320, 50
    local mx, my = love.mouse.getPosition()
    local hover_btn = (mx >= btn_x and mx <= btn_x + btn_w and my >= btn_y and my <= btn_y + btn_h)
    
    if game.phase == "placement" then
        if hover_btn then
            love.graphics.setColor(0.95, 0.8, 0.45, 1.0)
        else
            love.graphics.setColor(0.83, 0.66, 0.33, 1.0)
        end
    else
        love.graphics.setColor(0.3, 0.3, 0.3, 1.0)
    end
    love.graphics.rectangle("fill", btn_x, btn_y, btn_w, btn_h, 8, 8)
    
    love.graphics.setColor(0, 0, 0, 0.9)
    love.graphics.setFont(fonts.large)
    local btn_text = "FIGHT!"
    if game.phase == "combat" then
        btn_text = "RESOLVING..."
    elseif game.phase == "game_over" then
        btn_text = "PLAY AGAIN"
    end
    love.graphics.printf(btn_text, btn_x, btn_y + 10, btn_w, "center")

    -- Faction / round label in controller
    love.graphics.setColor(1, 1, 1, 0.6)
    love.graphics.setFont(fonts.small)
    love.graphics.printf("Round: " .. game.round .. "  |  Cards Remaining: " .. #game.player_deck, 820, 630, 360, "center")

    -- 7. PLAYER HAND LIST
    love.graphics.setColor(0.83, 0.66, 0.33, 0.8)
    love.graphics.setFont(fonts.small)
    love.graphics.print("YOUR HAND (Drag cards to Slots):", 130, 605)
    
    for i, card in ipairs(game.player_hand) do
        if card ~= game.dragged_card then
            draw_card(card, card.x, card.y, card.delay == 0, false)
        end
    end

    -- 8. DRAGGED CARD OVERLAY
    if game.dragged_card then
        local drag_x, drag_y = love.mouse.getPosition()
        draw_card(game.dragged_card, drag_x - game.drag_offset_x, drag_y - game.drag_offset_y, true, true)
    end

    -- 9. PARTICLES (Floating Damage Texts)
    for _, p in ipairs(game.particles) do
        love.graphics.setColor(p.color[1], p.color[2], p.color[3], p.alpha)
        love.graphics.setFont(fonts.medium)
        love.graphics.print(p.text, p.x, p.y)
    end

    -- 10. GAME OVER SCREEN OVERLAY
    if game.phase == "game_over" then
        love.graphics.setColor(0, 0, 0, 0.85)
        love.graphics.rectangle("fill", 0, 0, 1280, 720)
        
        love.graphics.setColor(0.83, 0.66, 0.33, 1)
        love.graphics.setFont(love.graphics.newFont(60))
        local over_title = "VICTORY!"
        if game.player_hp <= 0 then
            over_title = "DEFEAT"
            love.graphics.setColor(0.91, 0.32, 0.22, 1)
        end
        love.graphics.printf(over_title, 0, 240, 1280, "center")
        
        love.graphics.setColor(1, 1, 1, 0.8)
        love.graphics.setFont(fonts.large)
        local over_desc = "You won the card clash!"
        if game.player_hp <= 0 then
            over_desc = "Your Hero was defeated."
        end
        love.graphics.printf(over_desc, 0, 330, 1280, "center")
        
        -- Draw Play Again button
        local r_x, r_y, r_w, r_h = 490, 420, 300, 60
        local h_r = (mx >= r_x and mx <= r_x + r_w and my >= r_y and my <= r_y + r_h)
        if h_r then
            love.graphics.setColor(0.95, 0.8, 0.45, 1.0)
        else
            love.graphics.setColor(0.83, 0.66, 0.33, 1.0)
        end
        love.graphics.rectangle("fill", r_x, r_y, r_w, r_h, 10, 10)
        love.graphics.setColor(0, 0, 0, 0.9)
        love.graphics.printf("PLAY AGAIN", r_x, r_y + 14, r_w, "center")
    end

    love.graphics.pop()
end

function love.mousepressed(x, y, button, istouch, presses)
    if button ~= 1 then return end
    
    -- Restart game on Game Over click
    if game.phase == "game_over" then
        local r_x, r_y, r_w, r_h = 490, 420, 300, 60
        if x >= r_x and x <= r_x + r_w and y >= r_y and y <= r_y + r_h then
            start_game()
        end
        return
    end

    -- Handle Button Click (FIGHT!)
    if game.phase == "placement" then
        local btn_x, btn_y, btn_w, btn_h = 840, 560, 320, 50
        if x >= btn_x and x <= btn_x + btn_w and y >= btn_y and y <= btn_y + btn_h then
            end_placement()
            return
        end
    end

    -- Check if clicking card in hand to drag
    if game.phase == "placement" then
        for i = #game.player_hand, 1, -1 do
            local card = game.player_hand[i]
            local cw, ch = 110, 160
            if card.delay == 0 and x >= card.x and x <= card.x + cw and y >= card.y and y <= card.y + ch then
                game.dragged_card = card
                game.dragged_index = i
                game.drag_offset_x = x - card.x
                game.drag_offset_y = y - card.y
                break
            end
        end
    end
end

function love.mousereleased(x, y, button, istouch, presses)
    if button ~= 1 then return end
    if not game.dragged_card then return end
    
    local card = game.dragged_card
    local placed = false
    
    -- Check if dropped over player slots
    for slot = 1, 5 do
        local slot_x = 130 + (slot - 1) * 135
        local slot_y = 330
        local sw, sh = 110, 160
        
        -- Accept range
        if x >= slot_x and x <= slot_x + sw and y >= slot_y and y <= slot_y + sh then
            if not game.player_slots[slot] then
                -- Place card
                game.player_slots[slot] = card
                -- Remove from hand
                table.remove(game.player_hand, game.dragged_index)
                add_log("Player deployed " .. card.name .. " to Slot " .. slot)
                placed = true
                break
            end
        end
    end
    
    -- Return to hand if not placed
    if not placed then
        card.x = x - game.drag_offset_x
        card.y = y - game.drag_offset_y
    end
    
    game.dragged_card = nil
    game.dragged_index = nil
end
