local function str_update()
str_erase_save()
str_global_time()
str_level_updater()
str_sounds()
str_timer_function()
str_updater_function()
str_utils_functions()
str_single_stars_main()
str_level_functions_main()
str_menu_update()
str_romhack_hook_update()
end

local function str_mario_update(m)
str_menu_function(m)
str_menu_description(m)
str_romhack_mario_update(m)
end

local function str_interact(m, o, type)
str_single_stars_interact(m, o, type)
str_level_functions_interact(m, o, type)
str_romhack_interact(m, o, type)
end

local function str_hud_render()
All_Hud_Renders()
str_render_menu()
if STRHelper == "Enabled" and STRHelperOpen == true then
Helper_Display()
end
if STRRenderType == "Front" then
Timer_Hud_Renders()
end
end

local function str_hud_render_behind()
if STRRenderType == "Behind" then
Timer_Hud_Renders()
end
end

local function str_allowinteract()
	if (STRGST.EnabledInteraction == false and STRGST.STRGameState == "Lobby") then
		return true
	end
	
	if (STRGST.STRGlobalTimer < 1 and STRGST.STRGameMode ~= 4) or (STRGST.EnabledInteraction == true and STRGST.STRGameState == "Lobby") then
		return false
	end
end

local function str_packetreceive(SaveData)
	if SaveData.Update == STR_Packet_Data then
	str_reset_save()
	end
	str_sounds()
	play_full_sounds()
end

local function str_before_mario_update(m)
	if (STRMenuDisplay == true) then
	MStickX = gControllers[0].rawStickX
	MStickY = gControllers[0].rawStickY
	MBDown = gControllers[0].buttonDown
	MBPress = gControllers[0].buttonPressed
	end
	if (STRGST.STRSpotUpdater < 5 and STRLocationSpot == "Ground" and network_is_server()) or (STRMenuDisplay == true) or (MenuSwitchDeplay ~= 0) 
	or (STRGST.STRGameState == "Preparing" and STRGST.STRForceSpot == "Controller" and STRGST.STRGameMode == 1) or (STRGST.WarpNodeRandomierDeplay < 89 and STRGST.WNRCheck == true) then
	gControllers[0].stickX = 0
	gControllers[0].stickY = 0
	gControllers[0].stickMag = 0
	gControllers[0].buttonPressed = 0
	gControllers[0].buttonDown = 0
	end
end

hook_event(HOOK_UPDATE, 	    	   str_update)
hook_event(HOOK_MARIO_UPDATE,   	   str_mario_update)
hook_event(HOOK_ON_INTERACT,    	   str_interact)
hook_event(HOOK_ON_HUD_RENDER,  	   str_hud_render)
hook_event(HOOK_ON_HUD_RENDER_BEHIND,  str_hud_render_behind)
hook_event(HOOK_ALLOW_INTERACT, 	   str_allowinteract)
hook_event(HOOK_ON_PACKET_RECEIVE, 	   str_packetreceive)
hook_event(HOOK_BEFORE_MARIO_UPDATE,   str_before_mario_update)