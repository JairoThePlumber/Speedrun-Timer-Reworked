-- This is a Api for adding a Romhack, I also added a warp to the right location
-- Set_Custom_Romhack_Position(rules_set, xpos, ypos, zpos, romhacklevel, romhackarea, romhackact, Forced_Level, Custom_Lock, Custom_Warp, Condition)

function custom_plugin_slots(RunNumber, InSlots, EnabledType, slot1, slot2, slot3, slot4, slot5, slot6, slot7, slot8, slot9, slot10, slot11, slot12, slot13, slot14, slot15, slot16, slot17, slot18)
	if gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	Romhack_Runs_Option = true
	
	if InSlots == "Disabled" then
	NoSlotsTypePlugin = "Enabled"
	end
	
	if InSlots == "Enabled" then
	NoSlotsTypePlugin = "Disabled"
	end
	
	
	if (gGlobalSyncTable.PluginsRunsSlots == RunNumber and InSlots == "Enabled") or (InSlots == "Disabled") then
	gGlobalSyncTable.LREnabledOption = EnabledType
	
	if (EnabledType == "Stop Timer: Stars" or EnabledType == "Combine Types: Stars + Levels" or EnabledType == "Combine Types: Stars + Actions" or EnabledType == "Combine Types: Stars + Positions"
	or EnabledType == "Combine Types: Stars + Levels + Actions" or EnabledType == "Combine Types: Stars + Levels + Positions" or EnabledType == "Combine Types: Stars + Levels + Actions + Positions") then
	gGlobalSyncTable.LRStarLimit = slot1
	gGlobalSyncTable.LRStarID = slot2
	gGlobalSyncTable.LRStarTypes = slot3
	gGlobalSyncTable.LRStarsFunctions = slot4
	end
	
	if (EnabledType == "Stop Timer: Levels" or EnabledType == "Combine Types: Levels + Actions" or EnabledType == "Combine Types: Levels + Positions" or EnabledType == "Combine Types: Levels + Actions + Positions") then
	gGlobalSyncTable.LFLevels = slot1
	gGlobalSyncTable.LRLevelArea = slot2
	gGlobalSyncTable.LRLevelAct = slot3
	gGlobalSyncTable.LRLevelsFunctions = slot4
	elseif (EnabledType == "Combine Types: Stars + Levels" or EnabledType == "Combine Types: Stars + Levels + Actions" or EnabledType == "Combine Types: Stars + Levels + Positions" 
	or EnabledType == "Combine Types: Stars + Levels + Actions + Positions") then
	gGlobalSyncTable.LFLevels = slot5
	gGlobalSyncTable.LRLevelArea = slot6
	gGlobalSyncTable.LRLevelAct = slot7
	gGlobalSyncTable.LRLevelsFunctions = slot8
	end
	
	
	if (EnabledType == "Stop Timer: Actions" or EnabledType == "Combine Types: Actions + Positions") then
	gGlobalSyncTable.LFActions = slot1
	gGlobalSyncTable.LRLevelActionTimerSave = slot2
	gGlobalSyncTable.LRActionsFunctions = slot3
	elseif (EnabledType == "Combine Types: Stars + Actions" or EnabledType == "Combine Types: Levels + Actions" or EnabledType == "Combine Types: Levels + Actions + Positions") then
	gGlobalSyncTable.LFActions = slot5
	gGlobalSyncTable.LRLevelActionTimerSave = slot6
	gGlobalSyncTable.LRActionsFunctions = slot7
	elseif (EnabledType == "Combine Types: Stars + Levels + Actions" or EnabledType == "Combine Types: Stars + Levels + Actions + Positions") then
	gGlobalSyncTable.LFActions = slot9
	gGlobalSyncTable.LRLevelActionTimerSave = slot10
	gGlobalSyncTable.LRActionsFunctions = slot11
	end
	
	if EnabledType == "Stop Timer: Positions" then
	gGlobalSyncTable.LRPBXPosition = slot1
	gGlobalSyncTable.LRPBYPosition = slot2
	gGlobalSyncTable.LRPBZPosition = slot3
	gGlobalSyncTable.LRPBXPositionExtra = slot4
	gGlobalSyncTable.LRPBYPositionExtra = slot5
	gGlobalSyncTable.LRPBZPositionExtra = slot6
	gGlobalSyncTable.LRPositionFunctions = slot7
	elseif (EnabledType == "Combine Types: Stars + Positions" or EnabledType == "Combine Types: Levels + Positions") then
	gGlobalSyncTable.LRPBXPosition = slot5
	gGlobalSyncTable.LRPBYPosition = slot6
	gGlobalSyncTable.LRPBZPosition = slot7
	gGlobalSyncTable.LRPBXPositionExtra = slot8
	gGlobalSyncTable.LRPBYPositionExtra = slot9
	gGlobalSyncTable.LRPBZPositionExtra = slot10
	gGlobalSyncTable.LRPositionFunctions = slot11
	elseif EnabledType == "Combine Types: Actions + Positions" then
	gGlobalSyncTable.LRPBXPosition = slot4
	gGlobalSyncTable.LRPBYPosition = slot5
	gGlobalSyncTable.LRPBZPosition = slot6
	gGlobalSyncTable.LRPBXPositionExtra = slot7
	gGlobalSyncTable.LRPBYPositionExtra = slot8
	gGlobalSyncTable.LRPBZPositionExtra = slot9
	gGlobalSyncTable.LRPositionFunctions = slot10
	elseif EnabledType == "Combine Types: Stars + Levels + Positions" then
	gGlobalSyncTable.LRPBXPosition = slot9
	gGlobalSyncTable.LRPBYPosition = slot10
	gGlobalSyncTable.LRPBZPosition = slot11
	gGlobalSyncTable.LRPBXPositionExtra = slot12
	gGlobalSyncTable.LRPBYPositionExtra = slot13
	gGlobalSyncTable.LRPBZPositionExtra = slot14
	gGlobalSyncTable.LRPositionFunctions = slot15
	elseif EnabledType == "Combine Types: Levels + Actions + Positions" then
	gGlobalSyncTable.LRPBXPosition = slot8
	gGlobalSyncTable.LRPBYPosition = slot9
	gGlobalSyncTable.LRPBZPosition = slot10
	gGlobalSyncTable.LRPBXPositionExtra = slot11
	gGlobalSyncTable.LRPBYPositionExtra = slot12
	gGlobalSyncTable.LRPBZPositionExtra = slot13
	gGlobalSyncTable.LRPositionFunctions = slot14
	elseif gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions" then
	gGlobalSyncTable.LRPBXPosition = slot12
	gGlobalSyncTable.LRPBYPosition = slot13
	gGlobalSyncTable.LRPBZPosition = slot14
	gGlobalSyncTable.LRPBXPositionExtra = slot15
	gGlobalSyncTable.LRPBYPositionExtra = slot16
	gGlobalSyncTable.LRPBZPositionExtra = slot17
	gGlobalSyncTable.LRPositionFunctions = slot18
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
	
	if (gGlobalSyncTable.IntermissionSound == false and gGlobalSyncTable.IntermissionSoundWarp == 2) then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end
end

local function set_custom_countdown(savename, longname, custom_sounds, which_number, set_numbers)
	if CountdownTable[CountdownDefault].countdown_sound == savename and CountdownTable[CountdownDefault].long_countdown_name == longname then
	if gGlobalSyncTable.GamemodeSetting == "Normal" and (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	
	if which_number == "One Each" then
	if gGlobalSyncTable.startcountdown == set_numbers + 1 then
	audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
	end

	if which_number == "All Numbers" then
	if (gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.CountdownSound == 29) then
		audio_stream_play(audio_stream_load(custom_sounds), true, 1)
		end
		end
	end
	end
end

local function set_custom_go(savename, longname, custom_sounds)
	if GoTable[GoDefault].go_sound == savename and GoTable[GoDefault].long_go_name == longname then
	
	if (gGlobalSyncTable.GoSound == false and gGlobalSyncTable.GoSoundWarp == 2 and gGlobalSyncTable.startglobaltimer < 5) then 
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

-- Api For Other Mods
_G.SpeedrunTimerReworked = true
_G.STRApi = {
	-- Main Runs and Custom Runs --
	custom_plugin_slots = custom_plugin_slots,
	
	add_custom_slot = function (Number, NameSlot)
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
	
	Enable_Custom_Rules = function ()
	DisplayCustomRules = true
	DisplayBuiltinRules = false
	end,
	
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
	custom_anticheat = custom_anticheat,

	disable_teams = function ()
	DisableTeams = true
	end,
}