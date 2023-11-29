if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- This is just for SM64, to keep it separate from the romhacks
function Set_SM64_Position(x, y, z, level, area, act)
	if gGlobalSyncTable.startingpoint then
	gGlobalSyncTable.EndPicture = false
	currLevelNum = level
	currAreaIndex = area
	currActNum = act
if gGlobalSyncTable.startspeedruntime > 0 then
    gMarioStates[0].pos.x = x
	gMarioStates[0].pos.y = y
	gMarioStates[0].pos.z = z
	end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currLevelNum ~= level then
	warp_to_level(level, area, act)
		end
	end
end

-- This is for Romhacks Only, I also make sure that you don't have to make the positions as a option
local function Set_Romhack_Position(xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackendpicturecheck, CompatibleRomhackscheck)
	gGlobalSyncTable.EndPicture = romhackendpicturecheck
	gGlobalSyncTable.CompatibleRomhacks = CompatibleRomhackscheck
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.CompatibleRomhacks then
if gGlobalSyncTable.startspeedruntime > 0 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
	end
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currLevelNum ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
	end
end

-- prints text in the center of the screen
function printColorText(text, x, y, font, scale, color)
    local r, g, b, a = 0, 0, 0, 0

    local rgbtable = checkColorFormat(color)
    djui_hud_set_resolution(RESOLUTION_DJUI)
    djui_hud_set_font(font)

    local screenWidth = djui_hud_get_screen_width()
    local width = (djui_hud_measure_text(text) / 2) * scale

    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- get centre of screen
    local halfwidth = screenWidth / 2
    local halfheight = screenHeight / 2

    local xc = halfwidth - width
    local yc = halfheight - height

    djui_hud_set_color(rgbtable.r, rgbtable.g, rgbtable.b, 255)
    djui_hud_print_text(text, xc + x, yc + y, scale)
end

-- returns X coordinate relative to text
local function returnX(text, scale, font)
    djui_hud_set_resolution(RESOLUTION_DJUI)
    djui_hud_set_font(font)

    local screenWidth = djui_hud_get_screen_width()
    local width = (djui_hud_measure_text(text) / 2) * scale

    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- get centre of screen
    local halfwidth = screenWidth / 2
    local halfheight = screenHeight / 2

    local xc = halfwidth - width
    local yc = halfheight - height

    return xc
end

-- returns Y coordinate relative to text
local function returnY(text, scale, font)
    djui_hud_set_resolution(RESOLUTION_DJUI)
    djui_hud_set_font(font)

    local screenWidth = djui_hud_get_screen_width()
    local width = (djui_hud_measure_text(text) / 2) * scale

    local screenHeight = djui_hud_get_screen_height()
    local height = 64 * scale

    -- get centre of screen
    local halfwidth = screenWidth / 2
    local halfheight = screenHeight / 2

    local xc = halfwidth - width
    local yc = halfheight - height

    return yc
end

-- renders a rectangle in the center of the screen
local function renderRect(x, y, font, w, h, color)
    local rgbtable = checkColorFormat(color)
    djui_hud_set_resolution(RESOLUTION_DJUI)
    --djui_hud_set_font(font);

    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()

    -- get center
    local halfwidth = screenWidth / 2
    local halfheight = screenHeight / 2

    local xc = x + halfwidth
    local yc = y + halfheight

    local xx = xc - halfwidth
    local yy = yc - halfheight

    local xd = x + (screenWidth / 2)
    local yd = y + (screenHeight / 2)

    local xe = x + (w / 2)
    local ye = y + (h / 2)

    local fx = xd - xe
    local fy = yd - ye

    djui_hud_set_color(rgbtable.r, rgbtable.g, rgbtable.b, 170)
    djui_hud_render_rect(fx, fy, w, h)
end

local function checkColorFormat(rgbhex)
    local r, g, b, a = 0, 0, 0, 0

    local d = string.find(color, "#")
    if ((d == 1) and (string.len(rgbhex) == 7)) then
        local colorhex = string.gsub(rgbhex, "#", "")
        r = string.sub(colorhex, 0, 2)
        g = string.sub(colorhex, 3, 4)
        b = string.sub(colorhex, 5, 6)

        r = tonumber(r, 16)
        g = tonumber(g, 16)
        b = tonumber(b, 16)
        return {r = r, g = g, b = b}
    else
        print("Color format is wrong.")
        return
    end
end

function all_hook_mario_update(m)
if m.playerIndex ~= 0 then return end
sm64_check(m)
mario_update(m)
mario_button_update(m)
check_health_update(m)
reworked_command_description(m)
countdown_sounds(m)
teams_update(m)
reworked_config_command_description(m)
on_romhack_speedrun_check(m)
on_teams_update(m)
save_files_no_teams_sm74(m)
romhack_positions(m)
unsupported_romhacks(m)
star_road_stars(m)
ldd_stars(m)
ztar_attack_2_stars(m)
reworked_description_star_road(m)
reworked_description_ldd(m)
reworked_description_ztar_attack_2(m)
SM64_rules(m)
end

function all_hook_update()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
speedrun_commands_update()
teams_character_update()
on_romhack_interact_end_picture()
on_king_boo_interact()
end

function all_hook_interact(m, o, intee, interacted)
if m.playerIndex ~= 0 then return end
on_interact(m, o, intee, interacted)
on_romhack_interact(m, o, intee, interacted)
on_moonshine_interact(m, o, intee, interacted)
end

function all_hook_interact_2(m, o, interactType)
if m.playerIndex ~= 0 then return end
on_star_revenge6_interact(m, o, interactType)
on_galactic_journey_interact(m, o, interactType)
ztar_attack_2_stars_2(m, o, interactType)
end

function all_hook_hud_render()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
on_timer_hud_render()
on_save_file_hud_render()
krb2_timer_check()
displaycredits(m)
displaycontrols(m)
displayrules(m)
displayrules_starroad(m)
displayrules_74(m)
displayrules_74ee(m)
displayrules_74ty(m)
displayrules_ms(m)
displayrules_kbr2(m)
displayrules_lug(m)
displayrules_green_star(m)
displayrules_sapphire(m)
displayrules_tpc(m)
displayrules_star_takeover(m)
displayrules_night_of_doom(m)
displayrules_sr65(m)
displayrules_ta(m)
displayrules_lm64(m)
displayrules_lm65(m)
displayrules_paradise_island(m)
displayrules_ztar_attack_2(m)
displayrules_pink_star(m)
displayrules_hidden_stars(m)
displayrules_galactic_journey(m)
displayrules_star_takeover_redone(m)
displayrules_forest_ruins(m)
end

-- All Hooks in hook_event order
hook_event(HOOK_UPDATE, 	    all_hook_update)
hook_event(HOOK_MARIO_UPDATE,   all_hook_mario_update)
hook_event(HOOK_ON_INTERACT,    all_hook_interact)
hook_event(HOOK_ON_INTERACT,    all_hook_interact_2)
hook_event(HOOK_ON_HUD_RENDER_BEHIND,  all_hook_hud_render)
hook_event(HOOK_ALLOW_INTERACT, function () return gGlobalSyncTable.startspeedrun > 0.1 end)

local mod_storage_load = mod_storage_load
local mod_storage_save = mod_storage_save
local tostring = tostring
local djui_hud_is_pause_menu_created = djui_hud_is_pause_menu_created
local djui_hud_set_color = djui_hud_set_color
local hud_get_value = hud_get_value
local djui_hud_print_text = djui_hud_print_text
local obj_get_first_with_behavior_id = obj_get_first_with_behavior_id
local djui_hud_set_resolution = djui_hud_set_resolution
local djui_hud_set_font = djui_hud_set_font
local djui_hud_get_screen_height = djui_hud_get_screen_height
local djui_hud_get_screen_width = djui_hud_get_screen_width
local djui_hud_set_render_behind_hud = djui_hud_set_render_behind_hud
local hud_set_value = hud_set_value
local network_player_set_description = network_player_set_description
local djui_popup_create = djui_popup_create
local djui_popup_create_global = djui_popup_create_global
local djui_hud_render_rect = djui_hud_render_rect
local djui_hud_measure_text = djui_hud_measure_text
local get_texture_info = get_texture_info
local djui_hud_render_texture_tile = djui_hud_render_texture_tile
local printColorText = printColorText
local returnX = returnX
local returnY = returnY
local renderRect = renderRect
local checkColorFormat = checkColorFormat
local hook_chat_command = hook_chat_command
local hook_event = hook_event

_G.SpeedrunTimerReworked = STREnabled
_G.Set_Romhack_Position = Set_Romhack_Position
_G.Rules_Display = Rules_Display
_G.printColorText = printColorText
_G.returnX = returnX
_G.returnY = returnY
_G.renderRect = renderRect
_G.checkColorFormat = checkColorFormat