if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Local Saves
-- Config Menus
showSpeedrunTimer = tonumber(mod_storage_load("DisplayTimer")) or 1
Rules_Display = tonumber(mod_storage_load("DisplayRules")) or 1
MenuOptionSetting = mod_storage_load("MenuOption") or "Menu"
ControlsHelper = tonumber(mod_storage_load("PopupHelper")) or 1
CommandMenuOption = mod_storage_load("CommandMenu") or "Commands"
LocationSpotSettings = mod_storage_load("LocationSettings") or "Ground"

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

-- Global Saves
gGlobalSyncTable.StartingSettings = mod_storage_load("StartingOption") or "Both"
gGlobalSyncTable.GamemodeSetting = mod_storage_load("GameModes") or "Normal"
gGlobalSyncTable.IntroSettings = mod_storage_load("IntroOption") or "Disabled"

-- Runs Menu
-- Starting Positon Functions
gGlobalSyncTable.SPForcedSettings = mod_storage_load("ForcedSettings") or "ForcedLevel"
gGlobalSyncTable.SPWarpSettings = mod_storage_load("WarpSettings") or "StartWarp"
gGlobalSyncTable.SPLockPosition = mod_storage_load("LockPosition") or "Disabled"

-- Save File Packet
Packet_Save_Data = 1

---------
--Hooks--
---------

-- Save Functions From Character Select (Thanks to Squishy)
function load_fonts()
	savefont = mod_storage_load("AddFont")
    if savefont == nil or savefont == "" then
        mod_storage_save("AddFont", "Normal")
        savefont = "Normal"
    end
    if savefont ~= nil and savefont ~= "Normal" then
        for i = 2, #FontTable do
            if FontTable[i].name == savefont then
                DefaultFont = i
                break
            end
        end
    end
    return savefont
end

function load_custom_fanfare()
	savefanfare = mod_storage_load("AddFanfare")
    if savefanfare == nil or savefanfare == "" then
        mod_storage_save("AddFanfare", "Normal")
        savefont = "Normal"
    end
    if savefanfare ~= nil and savefanfare ~= "Normal" then
        for i = 2, #FanfareTable do
            if FanfareTable[i].fanfare_sound == savefanfare then
                FanfareDefault = i
                break
            end
        end
    end
    return savefanfare
end

function load_custom_countdown()
	savecountdown = mod_storage_load("AddCountdown")
    if savecountdown == nil or savefont == "" then
        mod_storage_save("AddCountdown", "Normal")
        savecountdown = "Normal"
    end
    if savecountdown ~= nil and savecountdown ~= "Normal" then
        for i = 2, #CountdownTable do
            if CountdownTable[i].countdown_sound == savecountdown then
                CountdownDefault = i
                break
            end
        end
    end
    return savecountdown
end

function load_custom_go()
	savegosound = mod_storage_load("AddGoSound")
    if savegosound == nil or savegosound == "" then
        mod_storage_save("AddGoSound", "Normal")
        savegosound = "Normal"
    end
    if savegosound ~= nil and savegosound ~= "Normal" then
        for i = 2, #GoTable do
            if GoTable[i].go_sound == savegosound then
                GoDefault = i
                break
            end
        end
    end
    return savegosound
end

function pref_font(fonts)
    mod_storage_save("AddFont", fonts.name)
	DefaultName = fonts.name
end

function pref_fanfare(sounds)
    mod_storage_save("AddFanfare", sounds.fanfare_sound)
	FanfareName = sounds.fanfare_sound
end

function pref_countdown(sounds)
	mod_storage_save("AddCountdown", sounds.countdown_sound)
	CountdownName = sounds.countdown_sound
end

function pref_go(sounds)
	mod_storage_save("AddGoSound", sounds.go_sound)
	GoName = sounds.go_sound
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

function packet_function()
	if gGlobalSyncTable.ResetSaveCheck == true then
	str_reset_save()
	network_send(true, {Update = Packet_Save_Data})
	end
end

RunsPopup = 0

function Players_RunsPopup()
	if not (gGlobalSyncTable.LREnabledOption == "Stop Timer: Stars" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	StarsName = "None"
	else
	if gGlobalSyncTable.LRStarsFunctions == "Star Limit" then
	StarsName = "Stars Limit: " .. gGlobalSyncTable.LRStarLimit
	elseif gGlobalSyncTable.LRStarsFunctions == "Star ID" then
	StarsName = "Star ID: " .. gGlobalSyncTable.LRStarID
	elseif gGlobalSyncTable.LRStarsFunctions == "Behavior Types" then
	StarsName = "Behavior: " .. gGlobalSyncTable.LRStarTypes
	elseif gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" then
	StarsName = "Stars Limit: " .. gGlobalSyncTable.LRStarLimit .. "\nStar ID: " .. gGlobalSyncTable.LRStarID
	elseif gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" then
	StarsName = "Stars Limit: " .. gGlobalSyncTable.LRStarLimit .. "\nBehavior: " .. gGlobalSyncTable.LRStarTypes
	elseif gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" then
	StarsName = "Behavior: " .. gGlobalSyncTable.LRStarTypes .. "\nStar ID: " .. gGlobalSyncTable.LRStarID
	end
	end
	
	if not (gGlobalSyncTable.LREnabledOption == "Stop Timer: Levels" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	LevelsName = "None"
	else
	if gGlobalSyncTable.LRLevelsFunctions == "Level Location" then
	LevelsName = "Level: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname
	elseif gGlobalSyncTable.LRLevelsFunctions == "Area Number" then
	LevelsName = "Area: " .. gGlobalSyncTable.LRLevelArea
	elseif gGlobalSyncTable.LRLevelsFunctions == "Act Number" then
	LevelsName = "Act: " .. gGlobalSyncTable.LRLevelAct
	elseif gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" then
	LevelsName = "Level: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. "\nArea: " .. gGlobalSyncTable.LRLevelArea
	elseif gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" then
	LevelsName = "Level: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. "\nAct: " .. gGlobalSyncTable.LRLevelAct
	elseif gGlobalSyncTable.LRLevelsFunctions == "All Options" then
	LevelsName = "Level: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. "\nArea: " .. gGlobalSyncTable.LRLevelArea .. "\nAct: " .. gGlobalSyncTable.LRLevelAct
	end
	end
	
	if not (gGlobalSyncTable.LREnabledOption == "Stop Timer: Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	ActionsName = "None"
	else
	if gGlobalSyncTable.LRActionsFunctions == "Only Actions" then
	ActionsName = "Action: " .. ActionsTable[gGlobalSyncTable.LFActions].action_name
	elseif gGlobalSyncTable.LRActionsFunctions == "Action + Timer" then
	ActionsName = "Action: " .. ActionsTable[gGlobalSyncTable.LFActions].action_name .. "\nTimer: " .. gGlobalSyncTable.LRLevelActionTimerSave
	end
	end
	
	if not (gGlobalSyncTable.LREnabledOption == "Stop Timer: Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	PositionsName = "None"
	else
	if gGlobalSyncTable.LRPositionFunctions == "X Position Area" then
	PositionsName = "X: " .. gGlobalSyncTable.LRPBXPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Y Position Area" then
	PositionsName = "Y: " .. gGlobalSyncTable.LRPBYPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Z Position Area" then
	PositionsName = "Z: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X Position Box" then
	PositionsName = "X: " .. gGlobalSyncTable.LRPBXPosition  .. " + E_X : " .. gGlobalSyncTable.LRPBXPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "Y Position Box" then
	PositionsName = "Y: " .. gGlobalSyncTable.LRPBYPosition  .. " + E_Y: " .. gGlobalSyncTable.LRPBYPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "Z Position Box" then
	PositionsName = "Z: " .. gGlobalSyncTable.LRPBZPosition  .. " + E_Z: " .. gGlobalSyncTable.LRPBZPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" then
	PositionsName = "X: " .. gGlobalSyncTable.LRPBXPosition  .. " + Y: " .. gGlobalSyncTable.LRPBYPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" then
	PositionsName = "X: " .. gGlobalSyncTable.LRPBXPosition  .. " + Z: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" then
	PositionsName = "Y: " .. gGlobalSyncTable.LRPBYPosition  .. " + Z: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" then
	PositionsName = "(X: " .. gGlobalSyncTable.LRPBXPosition  .. " + E_X: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				")\n(Y: " .. gGlobalSyncTable.LRPBYPosition  .. " + E_Y: " .. gGlobalSyncTable.LRPBYPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" then
	PositionsName = "(X: " .. gGlobalSyncTable.LRPBXPosition  .. " + E_X: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				")\n(Z: " .. gGlobalSyncTable.LRPBZPosition  .. " + E_Z: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" then
	PositionsName = "(Y: " .. gGlobalSyncTable.LRPBYPosition  .. " + E_Y: " .. gGlobalSyncTable.LRPBYPositionExtra .. 
				")\n(Z: " .. gGlobalSyncTable.LRPBZPosition  .. " + E_Z: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "All Position Area" then
	PositionsName = "X: " .. gGlobalSyncTable.LRPBXPosition  .. " + Y: " .. gGlobalSyncTable.LRPBYPosition .. " + Z: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "All Position Box" then
	PositionsName = "(X: " .. gGlobalSyncTable.LRPBXPosition  .. " + E_X: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				")\n(Y: " .. gGlobalSyncTable.LRPBYPosition  .. " + E_Y: " .. gGlobalSyncTable.LRPBYPositionExtra .. 
				")\n(Z: " .. gGlobalSyncTable.LRPBZPosition  .. " + E_Z: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
		end
	end
	if gGlobalSyncTable.RunStarting == true and RunsPopup == 3 then
	djui_popup_create("\nRun In This Server:\n\nStars:\n".. StarsName .."\nLevels:\n".. LevelsName .."\nActions:\n".. ActionsName .."\nPositions:\n".. PositionsName, 17)
	end
end

function str_hook_mario_update(m)
if m.playerIndex ~= 0 then return end
Normal_Mario_Update_Functions(m)
Practice_Mario_Update_Functions(m)
Casual_Mario_Update_Functions(m)
Extra_Mario_Update_Functions(m)
Romhack_Mario_Update_Functions(m)
if network_is_server() then
str_menu_description()
end
str_config_description()
end

function str_hook_update()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
Normal_Update_Functions()
Practice_Update_Functions()
Casual_Update_Functions()
SingleStars_Update_Functions()
SingleStars_Main_Function()
Starting_Update_Functions()
Extra_Update_Functions()
Starting_Positions_Updater()
Runs_Starting_Positions_Menu()
Runs_Level_Functions_Menu()
Runs_Level_Functions_Combined_Menu()
set_timer_function()
Saving_Function()
packet_function()
Players_RunsPopup()
end

function str_hook_interact(m, o, interactType)
if m.playerIndex ~= 0 then return end
SingleStars_Interaction(m, o, interactType)
Runs_Level_Functions_Interact(m, o, interactType)
Runs_Level_Functions_Interact_Combined(m, o, interactType)
end

local function str_hook_hud_render_behind()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
on_timer_hud_render()
end

local function str_hook_hud_render()
local m = gMarioStates[0]
if m.playerIndex ~= 0 then return end
if is_game_paused() then return end
displaystrmenu(m)
displaymenu(m)
code_for_displaying_rules(m)
displayrules(m)
SwitchingMenusCheck(m)
end

-- This fixes the pipes for OMM Rebirth
function str_allowinteract()
    if gGlobalSyncTable.startglobaltimer < 0.1 and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
		return false
	end
end

function str_levelinit()
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" and gGlobalSyncTable.SingleStarsMode == true and not gGlobalSyncTable.beatedGame then
	if not (gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_1 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_2 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3) then
	gGlobalSyncTable.startglobaltimer = 0
	gGlobalSyncTable.startTimer = true
	gGlobalSyncTable.beatedGame = false
	end
	if gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" and not gGlobalSyncTable.beatedGame then
	save_file_clear_flags(SAVE_FLAG_HAVE_METAL_CAP)
    save_file_clear_flags(SAVE_FLAG_HAVE_VANISH_CAP)
    save_file_clear_flags(SAVE_FLAG_HAVE_WING_CAP)
	end
	end
end

function str_before_mario_update(m)
    if m.playerIndex ~= 0 then
        return
    end

    if (openmenu == true or openstrmenu == true or hasConfirmed == false) then
	DelayCheck = 5
	end
	if not (openmenu == true or openstrmenu == true or hasConfirmed == false) and DelayCheck >= 1 then
	DelayCheck = DelayCheck - 1
	end
	if DelayCheck >= 1 then
		MenuInputCheck = m.controller.buttonPressed
		MenuStickX = m.controller.stickX
		MenuStickY = m.controller.stickY
		m.controller.buttonPressed = 0
		m.controller.buttonDown = 0
		m.controller.stickX = 0
		m.controller.stickY = 0
		m.controller.stickMag = 0
	end
	
	if (gGlobalSyncTable.PositionUpdate < 3 and LocationSpotSettings == "Ground") 
	or (gGlobalSyncTable.PositionUpdate < 5 and LocationSpotSettings == "Anywhere") and network_is_server() then
	m.controller.stickX = 0
	m.controller.stickY = 0
	m.controller.stickMag = 0
	m.controller.buttonPressed = 0
	m.controller.buttonDown = 0
	end
end

function str_reset_save()
	file = get_current_save_file_num() - 1
	for course = 0, 25 do
	save_file_remove_star_flags(file, course - 1, 0xFF)
	end
	save_file_clear_flags(0xFFFFFFFF) -- ALL OF THEM
	save_file_do_save(file, 1)
    update_all_mario_stars()
end

function str_packetreceive(SaveData)
	if SaveData.Update == Packet_Save_Data then
	str_reset_save()
	end
end

function str_menu_description()
	if CommandMenuOption == "Buttons" then
	update_chat_command_description('str_menu', "[\\#FF0000\\Commands Only\\#FFFFFF\\]")
	elseif CommandMenuOption == "Commands" then
	update_chat_command_description('str_menu', "Display The Speedrun Timer Menu")
	end
end

function str_menu_function()
	if CommandMenuOption == "Buttons" then
	djui_chat_message_create("\\#FF0000\\This Command Only Works When Having Commands Enabled") 
	return true
	elseif CommandMenuOption == "Commands" then
	openstrmenu = true
	openmenu = false
	SwitchingMenus = 1
	MenuOptions = 1
	return true
	end
end

function str_config_description()
	if CommandMenuOption == "Buttons" then
	update_chat_command_description('str_config', "[\\#FF0000\\Commands Only\\#FFFFFF\\]")
	elseif CommandMenuOption == "Commands" then
	update_chat_command_description('str_config', "Display The Config Menu")
	end
end

function str_config_function()
	if CommandMenuOption == "Buttons" then
	djui_chat_message_create("\\#FF0000\\This Command Only Works When Having Commands Enabled") 
	return true
	elseif CommandMenuOption == "Commands" then
	openmenu = true
	openstrmenu = false
	SwitchingMenus = 2
	return true
	end
end

HostPopup = false

function str_host_connected()
	if CommandMenuOption == "Buttons" then
	if ControlsHelper == 1 then
	if network_is_server() and HostPopup == false then 
    djui_popup_create("\nControls For Menu: \n(L Trig + D-Pad Right) \nTo Open The Main Menu \n\n(L Trig + D-Pad Left)\nTo Open The Config Menu", 5)
	HostPopup = true
			end
		end
	end
	
	if CommandMenuOption == "Commands" then
	if ControlsHelper == 1 then
	if network_is_server() and HostPopup == false then 
	djui_chat_message_create("Controls For Commands: \n/str_menu - To Open The Main Menu \n/str_config - To Open The Config Menu")
	HostPopup = true	
		end
	end
	end
end

function str_player_joined_game()
	if CommandMenuOption == "Buttons" then
	if ControlsHelper == 1 then
    djui_popup_create("Controls For Menu: \n(L Trig + D-Pad Left)\nTo Open The Config Menu", 3)
		end
	end
	
	if CommandMenuOption == "Commands" then
	if ControlsHelper == 1 then
    djui_chat_message_create("Controls For Commands: \n/str_config - To Open The Config Menu")
		end
	end
end

if network_is_server() then
hook_chat_command("str_menu", "Display The Speedrun Timer Menu", str_menu_function)
end

hook_chat_command("str_config", "Display The Config Menu", str_config_function)

-- All Hooks in hook_event order
hook_event(HOOK_UPDATE, 	    	   str_hook_update)
hook_event(HOOK_MARIO_UPDATE,   	   str_hook_mario_update)
hook_event(HOOK_ON_INTERACT,    	   str_hook_interact)
hook_event(HOOK_ON_HUD_RENDER,  	   str_hook_hud_render)
hook_event(HOOK_ON_HUD_RENDER_BEHIND,  str_hook_hud_render_behind)
hook_event(HOOK_ALLOW_INTERACT, 	   str_allowinteract)
hook_event(HOOK_ON_LEVEL_INIT, 	       str_levelinit)
hook_event(HOOK_ON_PACKET_RECEIVE, 	   str_packetreceive)
hook_event(HOOK_BEFORE_MARIO_UPDATE,   str_before_mario_update)
hook_event(HOOK_ON_PLAYER_CONNECTED,   str_host_connected)
hook_event(HOOK_JOINED_GAME, 		   str_player_joined_game)

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
local hook_event = hook_event