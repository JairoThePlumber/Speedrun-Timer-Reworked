-- This is a Api for adding a Romhack, I also added a warp to the right location
-- Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, romhackgrandstar, romhackendpicture, warp, runs_check)
local function Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, Forced_Level, Custom_Lock, Custom_Warp, Condition)
	gGlobalSyncTable.CompatibleRomhacks = true
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
	DisplayCustomRules = rules_set
	DisableBuiltinRules = true
	
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
		Disable_Custom_Warps = true
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

local function custom_romhack_runs(Number, Main_Function, NameSlot)
	DisableCommands = false
	if DisableCommands == false then
	Romhack_Runs_Option = true
	end
	if Number == 1 then
	RunsSlotsName1 = NameSlot
	end
	if Number == 2 then
	RunsSlotsName2 = NameSlot
	end
	if Number == 3 then
	RunsSlotsName3 = NameSlot
	end
	if Number == 4 then
	RunsSlotsName4 = NameSlot
	end
	if Number == 5 then
	RunsSlotsName5 = NameSlot
	end
	if Number == 6 then
	RunsSlotsName6 = NameSlot
	end
	if Number == 7 then
	RunsSlotsName7 = NameSlot
	end
	if Number == 8 then
	RunsSlotsName8 = NameSlot
	end
	if Number == 9 then
	RunsSlotsName9 = NameSlot
	end
	if Number == 10 then
	RunsSlotsName10 = NameSlot
	end
	
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
	
	if gGlobalSyncTable.RunsSlots == Number then
	if Main_Function == true then
	gGlobalSyncTable.beatedGame = true
	end
	end
end

local function set_custom_lives(livescheck, number)
	gGlobalSyncTable.custom_lives = livescheck
 if gGlobalSyncTable.startspeedrun == 0 then
		gMarioStates[0].health = 0x880
		gMarioStates[0].peakHeight = gMarioStates[0].pos.y
		if livescheck == true then
		gMarioStates[0].numLives = number
		else
		gMarioStates[0].numLives = 4
		end
	else
	return false
	end
end

local function custom_anticheat(Which, Option, Number, Main_Function)
	if Which == "All Runs" then
	if Main_Function == true then
	if Option == "Stop Timer" then
	gGlobalSyncTable.Cheated = true
	end
	if Option == "Popup" then
	if gGlobalSyncTable.anti_cheat == false then
	djui_popup_create_global("\\#FF0000\\\nUh oh!!\nSomeone is Trying to Cheat\nor\nTrying to Break the Rules!\n\nThe Timer Doesn't Stop\nSince it's a Warning Popup.", 6)
	gGlobalSyncTable.anti_cheat = true
				end
			end
	if Option == "Popup and Stop Timer" then
	gGlobalSyncTable.Cheated = true
	if gGlobalSyncTable.anti_cheat == false then
	djui_popup_create_global("\\#FF0000\\\nUh oh!!\nSomeone is Trying to Cheat\nor\nTrying to Break the Rules!\n\nThe Timer Will Stopped\nUnless The Timer Resets.", 6)
	gGlobalSyncTable.anti_cheat = true
				end
			end
		end
	end
		
	if Which == "Custom Runs" then
	if gGlobalSyncTable.RunsSlots == Number then
	if Main_Function == true then
	if Option == "Stop Timer" then
	gGlobalSyncTable.Cheated = true
	end
	if Option == "Popup" then
	if gGlobalSyncTable.anti_cheat == false then
	djui_popup_create_global("\\#FF0000\\\nUh oh!!\nSomeone is Trying to Cheat\nor\nTrying to Break the Rules!\n\nThe Timer Doesn't Stop\nSince it's a Warning Popup.", 6)
	gGlobalSyncTable.anti_cheat = true
				end
			end
	if Option == "Popup and Stop Timer" then
	gGlobalSyncTable.Cheated = true
	if gGlobalSyncTable.anti_cheat == false then
	djui_popup_create_global("\\#FF0000\\\nUh oh!!\nSomeone is Trying to Cheat\nor\nTrying to Break the Rules!\n\nThe Timer Will Stopped\nUnless The Timer Resets.", 6)
	gGlobalSyncTable.anti_cheat = true
			end
		end
		end
	end
	end
end

local function set_time_record(h_time, m_time, s_time, ms_time)
	if gGlobalSyncTable.beatedGame and not gGlobalSyncTable.timer_popup then
	djui_popup_create_global("Your Time: " .. string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds)) .. "\n\nRecord Time: " .. string.format("%s:%s:%s.%s", string.format("%d", h_time), string.format("%02d", m_time), string.format("%02d", s_time), string.format("%03d", ms_time)), 3)
	gGlobalSyncTable.timer_popup = true
	end
end

local function add_font(custom_name, custom_longname)
    table.insert(FontTable, {
        name = custom_name,
        longname = custom_longname
    })
	
	FontTable[#FontTable].name = FontTable[#FontTable].name
    return #FontTable
end

local function set_custom_color_on_fonts(SetCustomColors)
if DisplayCustomColors == 0 then
djui_hud_set_color(255, 255, 255, 255);
elseif DisplayCustomColors == 1 and SetCustomColors == true then
djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
elseif DisplayCustomColors == 1 and SetCustomColors == false then
djui_hud_set_color(255, 255, 255, VisableFont);
	end
end

local function set_countdown_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number, Layers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end

	if countdown_sound_check == 0 and gGlobalSyncTable.startspeedruntime >= 1.01 then
	
	if big_number == "Multiplying" then
	if Layers == "Middle Number" then
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2))*size4, size5, size6)
		end
	elseif Layers == "Right Number" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2))*size4, size5, size6)
		end
	elseif Layers == "Left Number (Tens)" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2))*size4, size5, size6)
			end
	elseif Layers == "Left Number (Ones)" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2))*size4, size5, size6)
			end
		end
	end
	
	if big_number == "Adding" then
	if Layers == "Middle Number" then
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2)) + size4, size5, size6)
		end
	elseif Layers == "Right Number" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%10/num2)) + size4, size5, size6)
		end
	elseif Layers == "Left Number (Tens)" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2)) + size4, size5, size6)
			end
	elseif Layers == "Left Number (Ones)" then
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startspeedruntime%100/num2)) + size4, size5, size6)
				end
			end
		end
	end
end

local function set_go_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
if gGlobalSyncTable.startspeedruntime <= 1 then
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

local function set_extras_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
    djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
end

local function set_time_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6, num1, num2, number, option, xpos2, ypos2, size7, size8, size9, num3, num4, size10, size11, size12, num3, num4)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end

    if Hours >= 10 then
	if option == "Static" and number == "None" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, size3, size4, size5, size6)
	elseif option == "Moveable" and number == "None" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, size9, size10, size11, size12)
	end
	
	if number == "Adding" then
	if option == "Clock Timer (Normal MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Normal S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Normal M Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Normal H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
	end
	
	if option == "Clock Timer (Moveable MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, ((math.floor(MilliSeconds/100)%10)%num1)*num3, (math.floor(MilliSeconds%1000/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Moveable S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Seconds%10)%num3)*size9, (math.floor(Seconds%10/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Moveable M Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Minutes%10)%num3)*size9, (math.floor(Minutes%10/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Moveable H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Hours%10)%num3)*size9, (math.floor(Hours%10/num4))+size10, size11, size12)
		end
	end
end
	
	if number == "Adding" then
	if option == "Clock Timer (Static Normal MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Static Normal S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Static Normal M Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))+size4, size5, size6)
	elseif option == "Clock Timer (Static Normal H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))+size4, size5, size6)
	end
	
	if option == "Clock Timer (Static Moveable MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, ((math.floor(MilliSeconds/100)%10)%num1)*num3, (math.floor(MilliSeconds%1000/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Static Moveable S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Seconds%10)%num3)*size9, (math.floor(Seconds%10/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Static Moveable M Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Minutes%10)%num3)*size9, (math.floor(Minutes%10/num4))+size10, size11, size12)
	elseif option == "Clock Timer (Static Moveable H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos2 + CustomXPos, ypos2 + CustomYPos, size7, size8, (math.floor(Hours%10)%num3)*size9, (math.floor(Hours%10/num4))+size10, size11, size12)
		end
	end
	
	if Hours < 10 then
	if (option == "Static" or option == "Moveable") and number == "None" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	end

	if number == "Multiplying" then
	if option == "Clock Timer (Normal MS Speed)" or option == "Clock Timer (Moveable MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Normal S Speed)" or option == "Clock Timer (Moveable S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Normal M Speed)" or option == "Clock Timer (Moveable M Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Normal H Speed)" or option == "Clock Timer (Moveable H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
			end
		end
	end
	
	if number == "Multiplying" then
	if option == "Clock Timer (Static Normal MS Speed)" or option == "Clock Timer (Static Moveable MS Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Static Normal S Speed)" or option == "Clock Timer (Static Moveable S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Static Normal M Speed)" or option == "Clock Timer (Static Moveable S Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif option == "Clock Timer (Static Normal H Speed)" or option == "Clock Timer (Static Moveable H Speed)" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
		end
	end
end

local function set_milliseconds_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number, Numbers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
	if small_number == "Multiplying" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(MilliSeconds%10)%num1)*size3, (math.floor(MilliSeconds%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/10)%10)%num1)*size3, (math.floor(MilliSeconds%100/num2))*size4, size5, size6)
	elseif Numbers == "Hundreds" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2))*size4, size5, size6)
	end
	end
	
	if small_number == "Adding" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(MilliSeconds%10)%num1)*size3, (math.floor(MilliSeconds%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/10)%10)%num1)*size3, (math.floor(MilliSeconds%100/num2)) + size4, size5, size6)
	elseif Numbers == "Hundreds" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(MilliSeconds/100)%10)%num1)*size3, (math.floor(MilliSeconds%1000/num2)) + size4, size5, size6)
	end
	end
end

local function set_seconds_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number, Numbers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
	if small_number == "Multiplying (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))*size4, size5, size6)
		end
	end
	if small_number == "Multiplying (Hidden)" then
	if Seconds >= 10 then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2))*size4, size5, size6)
			end
		end
	end
	
	if small_number == "Adding (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2)) + size4, size5, size6)
		end
	end
	if small_number == "Adding (Hidden)" then
	if Seconds >= 10 then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Seconds%10)%num1)*size3, (math.floor(Seconds%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Seconds/10)%10)%num1)*size3, (math.floor(Seconds%100/num2)) + size4, size5, size6)
			end
		end
	end
end

local function set_minutes_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number, Numbers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
	if small_number == "Multiplying (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))*size4, size5, size6)
		end
	end
	if small_number == "Multiplying (Hidden)" then
	if Minutes >= 10 then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2))*size4, size5, size6)
			end
		end
	end
	
	if small_number == "Adding (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2)) + size4, size5, size6)
		end
	end
	if small_number == "Adding (Hidden)" then
	if Minutes >= 10 then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Minutes%10)%num1)*size3, (math.floor(Minutes%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Minutes/10)%10)%num1)*size3, (math.floor(Minutes%100/num2)) + size4, size5, size6)
			end
		end
	end
end

local function set_hours_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, small_number, Numbers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
	if small_number == "Multiplying (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))*size4, size5, size6)
		end
	end
	if small_number == "Multiplying (Hidden)" then
	if Numbers == "Ones" and Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2))*size4, size5, size6)
	elseif Numbers == "Tens" and Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2))*size4, size5, size6)
		end
	end
	
	if small_number == "Adding (Normal)" then
	if Numbers == "Ones" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2)) + size4, size5, size6)
		end
	end
	if small_number == "Adding (Hidden)" then
	if Numbers == "Ones" and Hours < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, (math.floor(Hours%10)%num1)*size3, (math.floor(Hours%10/num2)) + size4, size5, size6)
	elseif Numbers == "Tens" and Hours >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, ((math.floor(Hours/10)%10)%num1)*size3, (math.floor(Hours%100/num2)) + size4, size5, size6)
		end
	end
end

local function set_custom_fanfare_name(savename, longname)
	table.insert(FanfareTable, {
        fanfare_sound = savename,
		long_fanfare_name = longname
    })
	
	FanfareTable[#FanfareTable].fanfare_sound = FanfareTable[#FanfareTable].fanfare_sound
    return #FanfareTable
end

local function set_custom_countdown_name(savename, longname)
	table.insert(CountdownTable, {
        countdown_sound = savename,
		long_countdown_name = longname
    })
	
	CountdownTable[#CountdownTable].countdown_sound = CountdownTable[#CountdownTable].countdown_sound
    return #CountdownTable
end

local function set_custom_go_name(savename, longname)
	table.insert(GoTable, {
        go_sound = savename,
		long_go_name = longname
    })
	
	GoTable[#GoTable].go_sound = GoTable[#GoTable].go_sound
    return #GoTable
end

local function set_custom_fanfare(savename, custom_sounds)
	if FanfareTable[FanfareDefault].fanfare_sound == savename then
	
	if gGlobalSyncTable.Intermission and (gGlobalSyncTable.Intercountdown <= 5.83 and gGlobalSyncTable.Intercountdown >= 5.80) then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
	end
	end
end

local function set_custom_countdown(savename, custom_sounds, which_number, set_numbers)
	local sounds = gGlobalSyncTable.startspeedruntime
	
	if CountdownTable[CountdownDefault].countdown_sound == savename then
	
	if which_number == "One Each" then
	if sounds == set_numbers + 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end

	
	if which_number == "Only 10" then
	if (sounds == 9 + 1 or sounds == 8 + 1 or sounds == 7 + 1 or sounds == 6 + 1
	or sounds == 5 + 1 or sounds == 4 + 1 or sounds == 3 + 1 or sounds == 2 + 1 or sounds == 1 + 1) then
	if gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startspeedrun == 0 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
				end
			end
		end
	end
end

local function set_custom_go(savename, custom_sounds)
	if GoTable[GoDefault].go_sound == savename then
	
	if gGlobalSyncTable.startspeedrun == 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
end

-- These are the functions for Custom Rules
-- Display_Custom_Rules_Text(texts, x, y, font, scale, color)
local function Display_Custom_Rules_Text(texts, x, y, font, scale, color)
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
local function Display_Custom_Rules_Romhack(x, y, font, w, h, color)
	if not DisplayCustomRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched == true and Rules_Display == 1) then
        -- render the rectangle.
        renderRect(x, y, font, w, h, color)
		end
	end
end

-- Display_Custom_Rules_Romhack_Position(romhack, mxpos, mypos, mzpos)
local function Display_Custom_Rules_Romhack_Function(mxpos, mypos, mzpos, position)
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
	-- Complex Plugins --
	Set_Custom_Romhack_Position = Set_Custom_Romhack_Position,
	set_time_record = set_time_record,
	custom_romhack_runs = custom_romhack_runs,
	set_custom_lives = set_custom_lives,
	custom_anticheat = custom_anticheat,
	Display_Custom_Rules_Text = Display_Custom_Rules_Text,
	Display_Custom_Rules_Romhack = Display_Custom_Rules_Romhack,
	Display_Custom_Rules_Romhack_Function = Display_Custom_Rules_Romhack_Function,
	add_font = add_font,
	set_countdown_custom = set_countdown_custom,
	set_time_custom = set_time_custom,
	set_milliseconds_custom = set_milliseconds_custom,
	set_seconds_custom = set_seconds_custom,
	set_minutes_custom = set_minutes_custom,
	set_hours_custom = set_hours_custom,
	set_go_custom = set_go_custom,
	set_extras_custom = set_extras_custom,
	set_custom_color_on_fonts = set_custom_color_on_fonts,
	set_custom_fanfare_name = set_custom_fanfare_name,
	set_custom_countdown_name = set_custom_countdown_name,
	set_custom_go_name = set_custom_go_name,
	set_custom_fanfare = set_custom_fanfare,
	set_custom_countdown = set_custom_countdown,
	set_custom_go = set_custom_go,
	
	-- Simple Plugins --
	set_teams = function (enable)
	gGlobalSyncTable.SpeedrunTeams = enable
	DisableTeams = true
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
	
	set_anti_cheat = function (enable)
	gGlobalSyncTable.Cheated = enable
	end,
}