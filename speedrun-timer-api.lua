-- This is a Api for adding a Romhack, I also added a warp to the right location
-- Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture, warp, runs_check)
function Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture, warp, runs_check)
	gGlobalSyncTable.GrandStar = romhackgrandstar
	gGlobalSyncTable.EndPicture = romhackendpicture
	gGlobalSyncTable.CompatibleRomhacks = true
	DisplayCustomRules = rules_set
	DisableBuiltinRules = true
	gGlobalSyncTable.set_warp = warp
	gGlobalSyncTable.different_areas = romhackarea
	DisableCommands = runs_check
	if DisableCommands == true then
	Romhack_Runs_Option = false
	else
	Romhack_Runs_Option = true
	end
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currLevelNum ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
end
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

function Set_Custom_Romhack_Position_Area(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture, warp, runs_check)
	gGlobalSyncTable.GrandStar = romhackgrandstar
	gGlobalSyncTable.EndPicture = romhackendpicture
	gGlobalSyncTable.CompatibleRomhacks = true
	DisplayCustomRules = rules_set
	DisableBuiltinRules = true
	gGlobalSyncTable.set_warp = warp
	gGlobalSyncTable.different_areas = romhackarea
	DisableCommands = runs_check
	if DisableCommands == true then
	Romhack_Runs_Option = false
	else
	Romhack_Runs_Option = true
	end
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhackarea then
	warp_to_level(romhacklevel, romhackarea, romhackact)
end
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

function Set_Custom_Romhack_Position_Lock(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture)
	gGlobalSyncTable.GrandStar = romhackgrandstar
	gGlobalSyncTable.EndPicture = romhackendpicture
	gGlobalSyncTable.CompatibleRomhacks = true
	DisplayCustomRules = rules_set
	DisableBuiltinRules = true
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhackarea then
	warp_to_level(romhacklevel, romhackarea, romhackact)
	end
end

function Set_Custom_Romhack_Position_Disable_Warps(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture)
	gGlobalSyncTable.GrandStar = romhackgrandstar
	gGlobalSyncTable.EndPicture = romhackendpicture
	gGlobalSyncTable.CompatibleRomhacks = true
	Disable_Custom_Warps = true
	DisableBuiltinRules = true
	DisplayCustomRules = rules_set
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
	end
end

function Set_Custom_Romhack_Position_Lock_Disable_Warps(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture)
	gGlobalSyncTable.GrandStar = romhackgrandstar
	gGlobalSyncTable.EndPicture = romhackendpicture
	gGlobalSyncTable.CompatibleRomhacks = true
	Disable_Custom_Warps = true
	DisableBuiltinRules = true
	DisplayCustomRules = rules_set
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
if gGlobalSyncTable.startspeedrun < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
end
if gGlobalSyncTable.startspeedrun < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
	end
end

function Set_Custom_Lives(livescheck, number)
	custom_lives = livescheck
 if gGlobalSyncTable.startspeedrun == 0 then
		gMarioStates[0].health = 0x880
		gMarioStates[0].peakHeight = gMarioStates[0].pos.y
		if custom_lives then
		gMarioStates[0].numLives = number
		else
		gMarioStates[0].numLives = 4
		end
	else
	return false
	end
end

-- here's all the functions for the custom font
function custom_font_names(num, Name)
	if _G.CustomFontsSelect == num then
	Custom_Names = Name
	end
end

function custom_romhack_run_names(Slot1, Slot2, Slot3, Slot4, Slot5, Slot6, Slot7, Slot8, Slot9, Slot10)
	RunsSlotsName1 = Slot1
	RunsSlotsName2 = Slot2
	RunsSlotsName3 = Slot3
	RunsSlotsName4 = Slot4
	RunsSlotsName5 = Slot5
	RunsSlotsName6 = Slot6
	RunsSlotsName7 = Slot7
	RunsSlotsName8 = Slot8
	RunsSlotsName9 = Slot9
	RunsSlotsName10 = Slot10
	
	if RunsSlotsName1 == nil then
	RunsSlotsName1 = "Empty Slot 1"
	end
	
	if RunsSlotsName2 == nil then
	RunsSlotsName2 = "Empty Slot 2"
	end
	
	if RunsSlotsName3 == nil then
	RunsSlotsName3 = "Empty Slot 3"
	end
	
	if RunsSlotsName4 == nil then
	RunsSlotsName4 = "Empty Slot 4"
	end
	
	if RunsSlotsName5 == nil then
	RunsSlotsName5 = "Empty Slot 5"
	end
	
	if RunsSlotsName6 == nil then
	RunsSlotsName6 = "Empty Slot 6"
	end
	
	if RunsSlotsName7 == nil then
	RunsSlotsName7 = "Empty Slot 7"
	end
	
	if RunsSlotsName8 == nil then
	RunsSlotsName8 = "Empty Slot 8"
	end
	
	if RunsSlotsName9 == nil then
	RunsSlotsName9 = "Empty Slot 9"
	end
	
	if RunsSlotsName10 == nil then
	RunsSlotsName10 = "Empty Slot 10"
	end
end

function custom_romhack_run_functions(Number, Function)
	if RunsSlots == Number then
	if Function == true then
	gGlobalSyncTable.beatedGame = true
	end
	end
end

function custom_font_set_how_many_fonts(number)
	font_number = number
	CustomFontsDisplay = true
	if number == 0 then
	CustomFontsDisplay = false
	end
	
	if Menus == 3 and MenuOptions == 2 and FontSettings == 0 then
	if _G.SwitchFonts == 1 and number ~= 1 then
	if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and _G.CustomFontsSelect >= number then
	_G.CustomFontsSelect = _G.CustomFontsSelect - _G.CustomFontsSelect + 1
    play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
	_G.CustomFontsSelect = _G.CustomFontsSelect + 1
    play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
		
	if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and _G.CustomFontsSelect <= 1 then
	_G.CustomFontsSelect = _G.CustomFontsSelect + number - 1
	play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
	_G.CustomFontsSelect = _G.CustomFontsSelect - 1
    play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	end
	end
end

function set_custom_color_on_fonts(SetCustomColors)
if DisplayCustomColors == 0 then
djui_hud_set_color(255, 255, 255, 255);
elseif DisplayCustomColors == 1 and SetCustomColors == true then
djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
elseif DisplayCustomColors == 1 and SetCustomColors == false then
djui_hud_set_color(255, 255, 255, VisableFont);
	end
end

-- here's all the functions for setting a custom font
function set_countdown_1_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number)
	if showSpeedrunTimer ~= 1 then return end

	if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if not big_number then
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2))*size4, size5, size6)
		end
	end
	
	if big_number then
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2)) + size4, size5, size6)
		end
	end
end

function set_countdown_2_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number)
	if showSpeedrunTimer ~= 1 then return end

	if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if not big_number then
    if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2))*size4, size5, size6)
		end
	end
	
	if big_number then
    if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2)) + size4, size5, size6)
		end
	end
end

function set_countdown_3_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number)
	if showSpeedrunTimer ~= 1 then return end

	if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if not big_number then
    if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2))*size4, size5, size6)
		end
	end
	
	if big_number then
    if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2))+ size4, size5, size6)
		end
	end
end

-- here's all the functions for setting a custom font
function set_countdown_4_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number)
	if showSpeedrunTimer ~= 1 then return end

	if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if not big_number then
    if gGlobalSyncTable.startspeedruntime < 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2))*size4, size5, size6)
		end
	end
	
	if big_number then
    if gGlobalSyncTable.startspeedruntime < 10 then
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2)) + size4, size5, size6)
		end
	end
end

function set_go_custom(texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
	
    djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, size3, size4, size5, size6)
	end
end

function set_extras_custom(texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
    djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
end

function set_time_custom_1(texture, xpos1, ypos1, size1, size2, size3, size4, size5, size6, xpos2, ypos2)
	if showSpeedrunTimer ~= 1 then return end
    if Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, size3, size4, size5, size6)
	end
	
	if Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos1 + CustomXPos, ypos1 + CustomYPos, size1, size2, size3, size4, size5, size6)
	end
end

function set_time_custom_2(texture, xpos1, ypos1, size1, size2, size3, size4, size5, size6, xpos2, ypos2, size7, size8, size9, size10, size11, size12)
	if showSpeedrunTimer ~= 1 then return end
    if Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, size9, size10, size11, size12)
	end
	
	if Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos1 + CustomXPos, ypos1 + CustomYPos, size1, size2, size3, size4, size5, size6)
	end
end

function set_time_custom_3(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, xpos2, ypos2, small_number, set_frames)
	if showSpeedrunTimer ~= 1 then return end
	if small_number then
	if Hours >= 10 then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))+size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))+size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
			end
		end
	end
	
	if not small_number then
	if Hours < 10 then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
			end
		end
	end
end

function set_time_custom_4(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, xpos2, ypos2, size7, size8, num3, size9, num4, size10, size11, size12, small_number, set_frames)
	if showSpeedrunTimer ~= 1 then return end
	if small_number then
	if Hours >= 10 then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, size9, size10, size11, size12)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, ((math.floor(MilliSeconds/100)%10)%num1)*num3, (math.floor(MilliSeconds%1000/num4))+size10, size11, size12)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Seconds%10)%num3)*size9, (math.floor(Seconds%10/num4))+size10, size11, size12)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Minutes%10)%num3)*size9, (math.floor(Minutes%10/num4))+size10, size11, size12)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Hours%10)%num3)*size9, (math.floor(Hours%10/num4))+size10, size11, size12)
			end
		end
	end
	
	if not small_number then
	if Hours < 10 then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
			end
		end
	end
end

function set_time_custom_5(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, xpos2, ypos2, small_number, set_frames)
	if showSpeedrunTimer ~= 1 then return end
	if small_number then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))+size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))+size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
		end
	end
	
	if not small_number then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
		end
	end
end

function set_time_custom_6(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, xpos2, ypos2, size7, size8, num3, size9, num4, size10, size11, size12, small_number, set_frames)
	if showSpeedrunTimer ~= 1 then return end
	if small_number then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, size9, size10, size11, size12)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, ((math.floor(MilliSeconds/100)%10)%num1)*num3, (math.floor(MilliSeconds%1000/num4))+size10, size11, size12)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Seconds%10)%num3)*size9, (math.floor(Seconds%10/num4))+size10, size11, size12)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Minutes%10)%num3)*size9, (math.floor(Minutes%10/num4))+size10, size11, size12)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Hours%10)%num3)*size9, (math.floor(Hours%10/num4))+size10, size11, size12)
		end
	end
	
	if not small_number then
	if set_frames == 0 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif set_frames == 1 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif set_frames == 2 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif set_frames == 3 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif set_frames == 4 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
		end
	end
end

function set_milliseconds_1_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(MilliSeconds%10)%num1)*size3, (math.floor(MilliSeconds%10/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(MilliSeconds%10)%num1)*size3, (math.floor(MilliSeconds%10/num2))+size4, size5, size6)
	end
end

function set_milliseconds_2_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/10)%10)%num1)*size3, (math.floor(MilliSeconds%100/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/10)%10)%num1)*size3, (math.floor(MilliSeconds%100/num2))+size4, size5, size6)
	end
end

function set_milliseconds_3_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))+size4, size5, size6)
	end
end

function set_seconds_1_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))+size4, size5, size6)
	end
end

function set_seconds_2_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))+size4, size5, size6)
	end
end

function set_seconds_3_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Seconds >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Seconds >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))+size4, size5, size6)
		end
	end
end

function set_seconds_4_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Seconds >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Seconds >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))+size4, size5, size6)
		end
	end
end

function set_minutes_1_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
	end
end

function set_minutes_2_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))+size4, size5, size6)
	end
end

function set_minutes_3_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Minutes >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Minutes >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
		end
	end
end

function set_minutes_4_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Minutes >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Minutes >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))+size4, size5, size6)
		end
	end
end

function set_hours_1_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
	end
end

function set_hours_2_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))+size4, size5, size6)
		end
	end
end

function set_hours_3_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))*size4, size5, size6)
	end
	
	if small_number then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))+size4, size5, size6)
	end
end

function set_hours_4_custom(texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number)
	if showSpeedrunTimer ~= 1 then return end
	if not small_number then
	if Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
		end
	end
	
	if small_number then
	if Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
		end
	end
end

function set_time_record(h_time, m_time, s_time, ms_time)
	if gGlobalSyncTable.beatedGame and not timer_popup then
	djui_popup_create_global("Your Time: " .. string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds)) .. "\n\nRecord Time: " .. string.format("%s:%s:%s.%s", string.format("%d", h_time), string.format("%02d", m_time), string.format("%02d", s_time), string.format("%03d", ms_time)), 3)
	timer_popup = true
	end
end

function set_custom_fanfare(custom_sounds)
	if gGlobalSyncTable.Intermission and not gGlobalSyncTable.set_warp and not fanfare_check then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
	end
	if custom_timer and custom_fanfare_check == 0 then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
	end
end

function set_custom_countdown(custom_sounds, only_10, set_numbers)
local sounds = gGlobalSyncTable.startspeedruntime 
	if not only_10 then
	if sounds == set_numbers then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
	
	if only_10 then
	if sounds == 10 or sounds == 9 or sounds == 8 or sounds == 7 or sounds == 6 
	or sounds == 5 or sounds == 4 or sounds == 3 or sounds == 2 or sounds == 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
end

function set_custom_go(custom_sounds)
if gGlobalSyncTable.startspeedrun == 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
	end
end

-- These are the functions for Custom Rules
-- Display_Custom_Rules_Text(texts, x, y, font, scale, color)
function Display_Custom_Rules_Text(texts, x, y, font, scale, color)
	if not DisplayCustomRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if (switched == true and Rules_Display == 1) then
	custom_texts = {
		{
            texts,
            x,
            y,
            font,
            scale,
            color
		},
	}
	
	for _, v in ipairs(custom_texts) do
		printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
	end
	end
end

-- Display_Custom_Rules_Romhack(x, y, font, w, h, color)
function Display_Custom_Rules_Romhack(x, y, font, w, h, color)
	if not DisplayCustomRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched == true and Rules_Display == 1) then
        -- render the rectangle.
        renderRect(x, y, font, w, h, color)
		end
	end
end

-- Display_Custom_Rules_Romhack_Position(romhack, mxpos, mypos, mzpos)
function Display_Custom_Rules_Romhack_Function(mxpos, mypos, mzpos, position)
	set_placement = position
	if not DisplayCustomRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
			if set_placement then
			gMarioStates[0].pos.x = mxpos
			gMarioStates[0].pos.y = mypos
			gMarioStates[0].pos.z = mzpos
		end
		end
	end
	end
end

-- Api For Other Mods
_G.SpeedrunTimerReworked = true
_G.STRApi = {
	Set_Custom_Romhack_Position = Set_Custom_Romhack_Position,
	
	Set_Custom_Romhack_Position_Area = Set_Custom_Romhack_Position_Area,
	
	Set_Custom_Romhack_Position_Lock = Set_Custom_Romhack_Position_Lock,
	
	Set_Custom_Romhack_Position_Disable_Warps = Set_Custom_Romhack_Position_Disable_Warps,
	
	Set_Custom_Romhack_Position_Lock_Disable_Warps = Set_Custom_Romhack_Position_Lock_Disable_Warps,
	
	Set_Custom_Lives = Set_Custom_Lives,
	
	Display_Custom_Rules_Text = Display_Custom_Rules_Text,
	
	Display_Custom_Rules_Romhack = Display_Custom_Rules_Romhack,
	
	Display_Custom_Rules_Romhack_Function = Display_Custom_Rules_Romhack_Function,
	
	custom_font_set_how_many_fonts = custom_font_set_how_many_fonts,
	
	custom_font_names = custom_font_names,
	
	custom_romhack_run_functions = custom_romhack_run_functions,
	
	custom_romhack_run_names = custom_romhack_run_names,
	
	set_countdown_1_custom = set_countdown_1_custom,
	
	set_countdown_2_custom = set_countdown_2_custom,
	
	set_countdown_3_custom = set_countdown_3_custom,
	
	set_countdown_4_custom = set_countdown_4_custom,
	
	set_milliseconds_1_custom = set_milliseconds_1_custom,
	
	set_milliseconds_2_custom = set_milliseconds_2_custom,
	
	set_milliseconds_3_custom = set_milliseconds_3_custom,
	
	set_seconds_1_custom = set_seconds_1_custom,
	
	set_seconds_2_custom = set_seconds_2_custom,
	
	set_seconds_3_custom = set_seconds_3_custom,
	
	set_seconds_4_custom = set_seconds_4_custom,
	
	set_minutes_1_custom = set_minutes_1_custom,
	
	set_minutes_2_custom = set_minutes_2_custom,
	
	set_minutes_3_custom = set_minutes_3_custom,
	
	set_minutes_4_custom = set_minutes_4_custom,
	
	set_hours_1_custom = set_hours_1_custom,
	
	set_hours_2_custom = set_hours_2_custom,
	
	set_hours_3_custom = set_hours_3_custom,
	
	set_hours_4_custom = set_hours_4_custom,
	
	set_go_custom = set_go_custom,
	
	set_time_custom_1 = set_time_custom_1,
	
	set_time_custom_2 = set_time_custom_2,
	
	set_time_custom_3 = set_time_custom_3,
	
	set_time_custom_4 = set_time_custom_4,
	
	set_time_custom_5 = set_time_custom_5,
	
	set_time_custom_6 = set_time_custom_6,
	
	set_extras_custom = set_extras_custom,
	
	set_custom_color_on_fonts = set_custom_color_on_fonts,
	
	set_time_record = set_time_record,
	
	set_custom_fanfare = set_custom_fanfare,
	
	set_custom_countdown = set_custom_countdown,
	
	set_custom_go = set_custom_go,
	
	set_teams = function (enable)
	gGlobalSyncTable.SpeedrunTeams = enable
	DisableTeams = true
	end,
	
	fix_area_warps = function (enable)
	set_different_areas = enable
	end,
	
	set_beated_game = function (enable)
	gGlobalSyncTable.beatedGame = enable
	end,
	
	set_start_timer = function (enable)
	gGlobalSyncTable.startTimer = enable
	end,
	
	set_stop_timer = function (enable)
	gGlobalSyncTable.stopTimer = enable
	end,
	
	set_stop_speedrun = function (enable)
	gGlobalSyncTable.stopSpeedrun = enable
	end,
	
	set_restart_timer = function (enable)
	gGlobalSyncTable.restartTimer = enable
	end,
	
	set_run_check = function (enable)
	DisableCommands = enable
	Romhack_Runs_Option = true
	if RunsSlots ~= 0 then
	DisableCommands = true
		end
	end,
	
	set_custom_fanfare_sounds = function (enable)
	custom_fanfare_sounds = enable
	end,
	
	set_custom_countdown_sounds = function (enable)
	custom_countdown_sounds = enable
	end,
	
	set_custom_go_sounds = function (enable)
	custom_go_sounds = enable
	end,
}