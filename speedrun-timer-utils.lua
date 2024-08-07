if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Rewrite Save Functions with Numbers to make SM64-Coop Deluxe Possible
showSpeedrunTimer = tonumber(mod_storage_load("DisplayTimer")) or 1
Rules_Display = tonumber(mod_storage_load("DisplayRules")) or 1
buttonsonly = tonumber(mod_storage_load("Buttons")) or 0
casualTimer = tonumber(mod_storage_load("Casual")) or 0
ControlsHelper = tonumber(mod_storage_load("PopupHelper")) or 1

-- Custom Colors and the Timer Position
DisplayCustomColors = tonumber(mod_storage_load("DisplayColors")) or 0
RedColorFont = tonumber(mod_storage_load("Red")) or 255
BlueColorFont = tonumber(mod_storage_load("Blue")) or 255
GreenColorFont = tonumber(mod_storage_load("Green")) or 255
VisableFont = tonumber(mod_storage_load("Visable")) or 255
RedColorRect = tonumber(mod_storage_load("RedRect")) or 0
BlueColorRect = tonumber(mod_storage_load("BlueRect")) or 0
GreenColorRect = tonumber(mod_storage_load("GreenRect")) or 0
VisableRect = tonumber(mod_storage_load("VisableRect")) or 128
CustomXPos = tonumber(mod_storage_load("XPos")) or 0
CustomYPos = tonumber(mod_storage_load("YPos")) or 0

-- This is just for SM64, to keep it separate from the romhacks
function Set_SM64_Position(x, y, z, level, area, act)
	gGlobalSyncTable.EndPicture = false
	gGlobalSyncTable.set_warp = true
	currLevelNum = level
	currAreaIndex = area
	currActNum = act
if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = x
	gMarioStates[0].pos.y = y
	gMarioStates[0].pos.z = z
	end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currLevelNum ~= level then
	warp_to_level(level, area, act)
	end
	if set_warp_position then
		warp_to_level(gLevelValues.entryLevel, area, act)
		set_warp_position = false
		return true
		end
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_level(gLevelValues.entryLevel, 1, 0)
	set_warp_check = true
		end
	end
end

-- This is for Romhacks Only, I also added a warp to the right location
function Set_Romhack_Position(xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, Forced_Level, Custom_Lock, Custom_Warp, Condition)
	gGlobalSyncTable.CompatibleRomhacks = true
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
	
	if Condition ~= "Custom Runs" then
	Romhack_Runs_Option = false
	elseif Condition == "Custom Runs" then
	Romhack_Runs_Option = true
	end
	
	if Forced_Level == "Force Level" then
	if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currLevelNum ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
		end
	end
	if Forced_Level == "Force Area" then
	if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhackarea then
	warp_to_level(romhacklevel, romhackarea, romhackact)
		end
	end
	if Forced_Level == "Force Act" then
	if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhackact then
	warp_to_level(romhacklevel, romhackarea, romhackact)
		end
	end
	
	if Condition == "Grand Star" then
	gGlobalSyncTable.GrandStar = true
	else
	gGlobalSyncTable.GrandStar = false
	end
	if Condition == "End Picture" then
	gGlobalSyncTable.EndPicture = true
	else
	gGlobalSyncTable.EndPicture = false
	end
	if Condition == "Custom Runs" then
	DisableCommands = false
	else
	DisableCommands = true
	end
	if Condition == "Grand Star and End Picture" then
	gGlobalSyncTable.GrandStar = true
	gGlobalSyncTable.EndPicture = true
	else
	gGlobalSyncTable.GrandStar = false
	gGlobalSyncTable.EndPicture = false
	end
	if Condition == "None" then
	gGlobalSyncTable.GrandStar = false
	gGlobalSyncTable.EndPicture = false
	DisableCommands = true
	end
	
if Custom_Lock == "Lock" then
	if gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
	end
	elseif Custom_Lock == "No Lock" then
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
	end
end
	if Custom_Warp == "Disable" then
		DisableWarps = true
		gGlobalSyncTable.set_warp = false
	end
	
	if Custom_Warp == "Level Warp" then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_level(gLevelValues.entryLevel, romhackarea, romhackact)
		set_warp_position = false
		return true
	end
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_level(gLevelValues.entryLevel, romhackarea, romhackact)
	set_warp_check = true
			end
		end
	end
	
	if Custom_Warp == "Start Warp" then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_start_level()
		set_warp_position = false
		return true
	end
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_start_level()
	set_warp_check = true
		end
	end
	end
end

-- This is only for Incompatible Romhacks, So The Warp Command Doesn't Break
function Set_Warp_For_Incompatible_Romhacks(romhackarea, romhackact)
	currAreaIndex = romhackarea
	currActNum = romhackact
	gGlobalSyncTable.set_warp = true
if gGlobalSyncTable.CompatibleRomhacks == false then
	if set_warp_position then
		warp_to_level(gLevelValues.entryLevel, romhackarea, romhackact)
		set_warp_position = false
		return true
	end
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_start_level()
	set_warp_check = true
		end
	end
	end
end

-- prints text in the center of the screen
function printColorText(text, x, y, font, scale, color)
    local r, g, b, a = 0, 0, 0, 0

    local rgbtable = checkColorFormat(color)
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(font)
	
	-- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale

    local xc = (screenWidth - width) / 2.0
    local yc = screenHeight - 16

    djui_hud_set_color(rgbtable.r, rgbtable.g, rgbtable.b, 255)
    djui_hud_print_text(text, xc + x, yc + y, scale)
end

function printMenuText(text, x, y, font, scale, color, left, right)
    local r, g, b, a = 0, 0, 0, 0

    local rgbtable = checkColorFormat(color)
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(font)
	
	-- get width of screen and text
	if left == true then
	xc = x 
	end
	if right == true then
	xc = djui_hud_get_screen_width() - x
	end
	
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale

    local yc = screenHeight - 16

    djui_hud_set_color(rgbtable.r, rgbtable.g, rgbtable.b, 255)
    djui_hud_print_text(text, xc, yc - y, scale)
end


-- renders a rectangle in the center of the screen
function renderRect(x, y, font, w, h, color)
    local rgbtable = checkColorFormat(color)
    djui_hud_set_resolution(RESOLUTION_N64)
    djui_hud_set_font(font);

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

function checkColorFormat(rgbhex)
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

function reset_savefile()
-- From EmilyEmmi
file = get_current_save_file_num() - 1
for course = 0, 25 do
save_file_remove_star_flags(file, course - 1, 0xFF)
end
save_file_clear_flags(0xFFFFFFFF) -- ALL OF THEM
save_file_do_save(file, 1)
gMarioStates[0].numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
end

function all_hook_mario_update(m)
if m.playerIndex ~= 0 then return end
sm64_check(m)
mario_update(m)
mario_button_update(m)
check_health_update(m)
countdown_sounds(m)
teams_update(m)
on_romhack_speedrun_check(m)
on_teams_update(m)
save_files_no_teams_sm74ee(m)
romhack_positions(m)
unsupported_romhacks(m)
romhack_stars_mario_update(m)
end

function all_hook_update()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
freeze_players_update()
speedrun_commands_update()
teams_character_update()
on_romhack_interact_end_picture()
on_king_boo_interact()
on_only_up_64_interact()
timer_check()
set_timer_function()
Controls_Players()
end

function all_hook_interact(m, o, interactType)
if m.playerIndex ~= 0 then return end
on_interact(m, o, interactType)
on_romhack_interact(m, o, interactType)
romhack_stars_interaction(m, o, interactType)
end

local function all_hook_hud_render_behind()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
on_timer_hud_render()
krb2_timer_check()
end

local function all_hook_hud_render()
local m = gMarioStates[0]
if is_game_paused() then return end
if m.playerIndex ~= 0 then return end
displaystrmenu(m)
displaymenu(m)
code_for_rules(m)
code_for_custom_rules(m)
displayrules(m)
SwitchingMenusCheck(m)
end

-- This fixes the pipes for OMM Rebirth
function allowinteract()
    if gGlobalSyncTable.startspeedrun < 0.1 then
		return false
	end
end

PlayersPopup = false

function Controls_Players()
	if ControlsHelper == 0 then
	PlayersPopup = true
	end
	if ControlsHelper == 1 then
	if network_is_server() and PlayersPopup == false then 
    djui_popup_create("\nControls For Menu: \n(L Trig + R Trig + D-Pad Right) \nTo Open The Main Menu \n\n(L Trig + R Trig + D-Pad Left)\nTo Open The Config Menu", 5)
	PlayersPopup = true
	elseif not network_is_server() and PlayersPopup == false then 
    djui_popup_create("Controls For Menu: \n(L Trig + R Trig + D-Pad Left)\nTo Open The Config Menu", 3)
	PlayersPopup = true
		end
	end
end

-- All Hooks in hook_event order
hook_event(HOOK_UPDATE, 	    	   all_hook_update)
hook_event(HOOK_MARIO_UPDATE,   	   all_hook_mario_update)
hook_event(HOOK_ON_INTERACT,    	   all_hook_interact)
hook_event(HOOK_ON_HUD_RENDER,  	   all_hook_hud_render)
hook_event(HOOK_ON_HUD_RENDER_BEHIND,  all_hook_hud_render_behind)
hook_event(HOOK_ALLOW_INTERACT, 	   allowinteract)

local mod_storage_load = mod_storage_load
local mod_storage_save = mod_storage_save
local tonumber = tonumber
local tostring = tostring
local djui_hud_set_color = djui_hud_set_color
local hud_get_value = hud_get_value
local djui_hud_print_text = djui_hud_print_text
local obj_get_first_with_behavior_id = obj_get_first_with_behavior_id
local djui_hud_set_resolution = djui_hud_set_resolution
local djui_hud_set_font = djui_hud_set_font
local djui_hud_get_screen_height = djui_hud_get_screen_height
local djui_hud_get_screen_width = djui_hud_get_screen_width
local djui_hud_set_render_behind_hud = djui_hud_set_render_behind_hud
local network_player_set_description = network_player_set_description
local djui_popup_create = djui_popup_create
local djui_popup_create_global = djui_popup_create_global
local djui_hud_render_rect = djui_hud_render_rect
local djui_hud_measure_text = djui_hud_measure_text
local get_texture_info = get_texture_info
local djui_hud_render_texture_tile = djui_hud_render_texture_tile
local printColorText = printColorText
local printMenuText = printMenuText
local renderRect = renderRect
local checkColorFormat = checkColorFormat
local hook_chat_command = hook_chat_command
local hook_event = hook_event