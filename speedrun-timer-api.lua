-- This is a Api for adding a Romhack, I also added a warp to the right location
-- Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, Forced_Level, Custom_Lock, Custom_Warp, Condition)
local function Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, Forced_Level, Custom_Lock, Custom_Warp, Condition)
	if gGlobalSyncTable.CustomPlugin == "Enabled" and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	gGlobalSyncTable.CompatibleRomhacks = true
	currLevelNum = romhacklevel
	currAreaIndex = romhackarea
	currActNum = romhackact
	DisplayCustomRules = rules_set
	DisplayBuiltinRules = false
	
	if Condition ~= "Custom Runs" then
	Romhack_Runs_Option = false
	elseif Condition == "Custom Runs" then
	Romhack_Runs_Option = true
	end
	
	if Forced_Level == "Force Level" then
	if gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currLevelNum ~= romhacklevel then
	warp_to_level(romhacklevel, romhackarea, romhackact)
		end
	end
	if Forced_Level == "Force Area" then
	if gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currAreaIndex ~= romhackarea then
	warp_to_level(romhacklevel, romhackarea, romhackact)
		end
	end
	if Forced_Level == "Force Act" then
	if gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currActNum ~= romhackact then
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
	EnablePluginRuns = false
	else
	EnablePluginRuns = true
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
	EnablePluginRuns = true
	end
	
if Custom_Lock == "Lock" then
	if gGlobalSyncTable.startglobaltimer < 0.1 then
    gMarioStates[0].pos.x = xpos
	gMarioStates[0].pos.y = ypos
	gMarioStates[0].pos.z = zpos
	end
	elseif Custom_Lock == "No Lock" then
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer < 0.1 then
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
end

function custom_romhack_runs(RunNumber, Main_Function)
	if gGlobalSyncTable.CustomPlugin == "Enabled" and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	if gGlobalSyncTable.PluginsRunsSlots == RunNumber then
	if Main_Function == true then
	gGlobalSyncTable.beatedGame = true
		end
	end
	end
end

local function custom_anticheat(CheatsNumber, Option, Main_Function)
	if gGlobalSyncTable.AntiCheatsSlots == CheatsNumber then
	if (gGlobalSyncTable.AntiCheatOption == false and gGlobalSyncTable.GamemodeSetting ~= "Normal") then return end
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

local function set_time_record(h_time, m_time, s_time, ms_time)
	if gGlobalSyncTable.GamemodeSetting ~= "Normal" then return end
	if gGlobalSyncTable.beatedGame and not gGlobalSyncTable.timer_popup then
	djui_popup_create_global("Your Time: " .. string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds)) .. "\n\nRecord Time: " .. string.format("%s:%s:%s.%s", string.format("%d", h_time), string.format("%02d", m_time), string.format("%02d", s_time), string.format("%03d", ms_time)), 3)
	gGlobalSyncTable.timer_popup = true
	end
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

local function set_custom_color_on_RH_Fonts(Numbers, Words, SingleQuote, DoubleQuotes)
RomhackColors = true
if Numbers == "Number Colors" then
NumbersColors = true
elseif Quotes == "Number No Colors" then
NumbersColors = false
end
if Words == "Words Colors" then
WordsColors = true
elseif Words == "Words No Colors" then
WordsColors = false
end
if SingleQuote == "Single Quote Colors" then
SingleQuoteColors = true
elseif SingleQuote == "Single Quote No Colors" then
SingleQuoteColors = false
end
if DoubleQuotes == "Double Quotes Colors" then
DoubleQuotesColors = true
elseif DoubleQuotes == "Double Quotes No Colors" then
DoubleQuotesColors = false
end
end

local function set_countdown_custom(savename, texture, xpos, ypos, size1, size2, num1, size3, num2, size4, size5, size6, big_number, Layers)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end

	if gGlobalSyncTable.countdown_display_check == 0 and gGlobalSyncTable.startcountdown >= 1.01 then
	
	if big_number == "Multiplying" then
	if Layers == "Middle Number" then
	if gGlobalSyncTable.startcountdown < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startcountdown%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%10/num2))*size4, size5, size6)
		end
	elseif Layers == "Right Number" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startcountdown%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%10/num2))*size4, size5, size6)
		end
	elseif Layers == "Left Number (Tens)" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startcountdown/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%100/num2))*size4, size5, size6)
			end
	elseif Layers == "Left Number (Ones)" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startcountdown/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%100/num2))*size4, size5, size6)
			end
		end
	end
	
	if big_number == "Adding" then
	if Layers == "Middle Number" then
	if gGlobalSyncTable.startcountdown < 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startcountdown%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%10/num2)) + size4, size5, size6)
	end
	elseif Layers == "Right Number" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, (math.floor(gGlobalSyncTable.startcountdown%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%10/num2)) + size4, size5, size6)
	end
	elseif Layers == "Left Number (Tens)" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startcountdown/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%100/num2)) + size4, size5, size6)
	end
	elseif Layers == "Left Number (Ones)" then
	if gGlobalSyncTable.startcountdown >= 10 then
	djui_hud_render_texture_tile(get_texture_info(texture), xpos, ypos, size1, size2, ((math.floor(gGlobalSyncTable.startcountdown/10)%10)%num1)*size3, (math.floor(gGlobalSyncTable.startcountdown%100/num2)) + size4, size5, size6)
				end
			end
		end
	end
end

local function set_go_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
if gGlobalSyncTable.startcountdown <= 1 then
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

local function set_extras_timer_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
    djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
end

local function set_extras_countdown_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end

	if gGlobalSyncTable.countdown_display_check == 0 and gGlobalSyncTable.startcountdown >= 1.01 then
	
    djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	end
end

local function set_extras_go_custom(savename, texture, xpos, ypos, size1, size2, size3, size4, size5, size6)
	if showSpeedrunTimer ~= 1 then return end
	
	if FontTable[DefaultFont].name ~= savename then return end
	
if gGlobalSyncTable.startcountdown <= 1 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
	
    djui_hud_render_texture_tile(get_texture_info(texture), xpos + CustomXPos, ypos + CustomYPos, size1, size2, size3, size4, size5, size6)
	end
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

local function set_custom_fanfare(savename, longname, custom_sounds)
	if FanfareTable[FanfareDefault].fanfare_sound == savename and FanfareTable[FanfareDefault].long_fanfare_name == longname then
	
	if gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission" then
	if gGlobalSyncTable.Intermission and (gGlobalSyncTable.Intercountdown <= 5.93 and gGlobalSyncTable.Intercountdown >= 5.90) then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
	end
end

local function set_custom_countdown(savename, longname, custom_sounds, which_number, set_numbers)
	local sounds = gGlobalSyncTable.startcountdown
	
	if CountdownTable[CountdownDefault].countdown_sound == savename and CountdownTable[CountdownDefault].long_countdown_name == longname then
	if gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Countdown" then
	
	if which_number == "One Each" then
	if sounds == set_numbers + 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end

	
	if which_number == "Only 10" then
	if (sounds == 9 + 1 or sounds == 8 + 1 or sounds == 7 + 1 or sounds == 6 + 1
	or sounds == 5 + 1 or sounds == 4 + 1 or sounds == 3 + 1 or sounds == 2 + 1 or sounds == 1 + 1) then
	if gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startglobaltimer == 0 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
			end
		end
		end
	end
	end
end

local function set_custom_go(savename, longname, custom_sounds)
	if GoTable[GoDefault].go_sound == savename and GoTable[GoDefault].long_go_name == longname then
	
	if gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
	if gGlobalSyncTable.startglobaltimer == 2 and gGlobalSyncTable.timercountdown == 30 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
	end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.EnabledIntro == false then
	if gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Countdown" then
	if gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.timercountdown == 30 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
	
	if gGlobalSyncTable.StartingSettings == "Intermission" then
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.startglobaltimer == 1 and gGlobalSyncTable.Intercountdown == 0 then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
			end
		end
	end
	
	if gGlobalSyncTable.StartingSettings == "None" then
	if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.timercountdown = 30
	if gGlobalSyncTable.startglobaltimer == 2 and gGlobalSyncTable.timercountdown == 30 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
			end
		end
		end	
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.EnabledIntro == true then
	if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.timercountdown = 30
	if gGlobalSyncTable.startglobaltimer == 2 and gGlobalSyncTable.timercountdown == 30 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
			end
		end
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

-- Api For Other Mods
_G.SpeedrunTimerReworked = true
_G.STRApi = {
	-- Main Runs and Custom Runs --
	Set_Custom_Romhack_Position = Set_Custom_Romhack_Position,
	menu_custom_runs = menu_custom_runs,
	custom_romhack_runs = custom_romhack_runs,
	
	add_custom_run = function (Number, NameSlot)
	EnablePluginRuns = false
	Romhack_Runs_Option = true
	table.insert(RunTable, { RunsSlotName = NameSlot, RunsSlotNumber = Number })
	return #RunTable
	end,
	
	add_anti_cheat = function (AntiNumber, CheatSlot)
	gGlobalSyncTable.AntiCheatOption = true
	table.insert(AntiCheatTable, { AntiCheatName = CheatSlot, AntiCheatNumber = AntiNumber })
	return #AntiCheatTable
	end,
	
	set_beated_game = function (enable)
	gGlobalSyncTable.beatedGame = enable
	end,
	
	set_backup_slot = function (enable)
	gGlobalSyncTable.backupslot = enable
	BackupSlotPluginCheck = true
	end,
	
	-- Rules --
	Display_Custom_Rules_Text = Display_Custom_Rules_Text,
	Display_Custom_Rules_Romhack = Display_Custom_Rules_Romhack,
	
	-- Fonts --
	add_font = function (custom_name, custom_longname)
        table.insert(FontTable, { name = custom_name, longname = custom_longname })
		return #FontTable
    end,
	
	set_custom_color_on_fonts = set_custom_color_on_fonts,
	set_custom_color_on_RH_Fonts = set_custom_color_on_RH_Fonts,
	set_countdown_custom = set_countdown_custom,
	set_go_custom = set_go_custom,
	set_time_custom = set_time_custom,
	set_milliseconds_custom = set_milliseconds_custom,
	set_seconds_custom = set_seconds_custom,
	set_minutes_custom = set_minutes_custom,
	set_hours_custom = set_hours_custom,
	set_extras_timer_custom = set_extras_timer_custom,
	set_extras_countdown_custom = set_extras_countdown_custom,
	set_extras_go_custom = set_extras_go_custom,
	
	-- Sounds --
	set_custom_fanfare_name = function (savename, longname)
        table.insert(FanfareTable, { fanfare_sound = savename, long_fanfare_name = longname })
		return #FanfareTable
    end,
	
	set_custom_countdown_name = function (savename, longname)
        table.insert(CountdownTable, { countdown_sound = savename, long_countdown_name = longname })
		return #CountdownTable
    end,
	
	set_custom_go_name = function (savename, longname)
        table.insert(GoTable, { go_sound = savename, long_go_name = longname })
		return #GoTable
    end,
	
	set_custom_fanfare = set_custom_fanfare,
	set_custom_countdown = set_custom_countdown,
	set_custom_go = set_custom_go,
	
	-- Extra --
	set_time_record = set_time_record,
	custom_anticheat = custom_anticheat,

	disable_teams = function ()
	DisableTeams = true
	end,
}