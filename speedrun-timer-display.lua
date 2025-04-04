if gamemodes_is_checked or notallowedmods or no_cheats then return end

Hours = 0
Minutes = 0
Seconds = 0
MilliSeconds = 0
gGlobalSyncTable.HoursRecord = 0
gGlobalSyncTable.MinutesRecord = 0
gGlobalSyncTable.SecondsRecord = 0
gGlobalSyncTable.MilliSecondsRecord = 0
gGlobalSyncTable.TimeRecordOption = false
-- Romhack Fonts --
RomhackColors = false
NumbersColors = false
WordsColors = false
SingleQuoteColors = false
DoubleQuotesColors = false

RectFontsOnly = false
function set_timer_function()
    if math.floor(gGlobalSyncTable.startglobaltimer/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startglobaltimer/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startglobaltimer/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startglobaltimer/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startglobaltimer/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startglobaltimer/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startglobaltimer/30%1 * 1000)
    end
end

function intermission_render()
	if gGlobalSyncTable.Intercountdown <= 0 then
        return
    end
	
    -- set text
    local text = "The Run is Starting in " .. tostring(math.floor(gGlobalSyncTable.Intercountdown))

    -- set scale
    scale = 0.50

    -- get width of screen and text
    screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
    width = djui_hud_measure_text(text) * scale
    height = 32 * scale

    x = (screenWidth - width) / 2.0
    y = (screenHeight - height) / 2.0 - 112

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(text, x + 1, y + 1, scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Stars" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then

	if gGlobalSyncTable.LRStarsFunctions == "Star Limit" then
	stars_text = "Stars Requirements: " .. gGlobalSyncTable.LRStarLimit
	elseif gGlobalSyncTable.LRStarsFunctions == "Star ID" then
	stars_text = "Specific Star ID: " .. gGlobalSyncTable.LRStarID
	elseif gGlobalSyncTable.LRStarsFunctions == "Behavior Types" then
	stars_text = "Levels Behavior Type: " .. gGlobalSyncTable.LRStarTypes
	elseif gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" then
	stars_text = "Stars Requirements: " .. gGlobalSyncTable.LRStarLimit .. " + Specific Star ID: " .. gGlobalSyncTable.LRStarID
	elseif gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" then
	stars_text = "Stars Requirements: " .. gGlobalSyncTable.LRStarLimit .. " + Levels Behavior Type: " .. gGlobalSyncTable.LRStarTypes
	elseif gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" then
	stars_text = "Levels Behavior Type: " .. gGlobalSyncTable.LRStarTypes .. " + Specific Star ID: " .. gGlobalSyncTable.LRStarID
	end
	
	stars_scale = 0.35
	
	-- get width of screen and text
    stars_screenWidth = djui_hud_get_screen_width()
    stars_screenHeight = djui_hud_get_screen_height()
    stars_width = djui_hud_measure_text(stars_text) * stars_scale
    stars_height = 32 * stars_scale
	
	stars_x = (stars_screenWidth - stars_width) / 2.0
	stars_y = (stars_screenHeight - stars_height) / 2.0 - 98.4
	
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(stars_x - 6 * stars_scale, stars_y, stars_width + 12 * stars_scale, stars_height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(stars_text, stars_x + 0.70, stars_y + 0.70, stars_scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(stars_text, stars_x, stars_y, stars_scale);
	
	end
	
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Levels" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then

	if gGlobalSyncTable.LRLevelsFunctions == "Level Location" then
	levels_text = "Level Location: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname
	elseif gGlobalSyncTable.LRLevelsFunctions == "Area Number" then
	levels_text = "Area Number: " .. gGlobalSyncTable.LRLevelArea
	elseif gGlobalSyncTable.LRLevelsFunctions == "Act Number" then
	levels_text = "Act Number: " .. gGlobalSyncTable.LRLevelAct
	elseif gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" then
	levels_text = "Level Location: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. " + Area Number: " .. gGlobalSyncTable.LRLevelArea
	elseif gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" then
	levels_text = "Level Location: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. " + Act Number: " .. gGlobalSyncTable.LRLevelAct
	elseif gGlobalSyncTable.LRLevelsFunctions == "All Options" then
	levels_text = "Level Location: " .. LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelname .. " + Area Number: " .. gGlobalSyncTable.LRLevelArea .. " + Act Number: " .. gGlobalSyncTable.LRLevelAct
	end
	
	levels_scale = 0.35
	
	-- get width of screen and text
    levels_screenWidth = djui_hud_get_screen_width()
    levels_screenHeight = djui_hud_get_screen_height()
    levels_width = djui_hud_measure_text(levels_text) * levels_scale
    levels_height = 32 * levels_scale
	
	levels_x = (levels_screenWidth - levels_width) / 2.0
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Levels" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions") then
	levels_y = (levels_screenHeight - levels_height) / 2.0 - 98.4
	elseif (gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	levels_y = (levels_screenHeight - levels_height) / 2.0 - 87.3
	end
	
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(levels_x - 6 * levels_scale, levels_y, levels_width + 12 * levels_scale, levels_height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(levels_text, levels_x + 0.70, levels_y + 0.70, levels_scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(levels_text, levels_x, levels_y, levels_scale);
	
	end
	
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then

	if gGlobalSyncTable.LRActionsFunctions == "Only Actions" then
	actions_text = "Mario Action: " .. ActionsTable[gGlobalSyncTable.LFActions].action_name
	elseif gGlobalSyncTable.LRActionsFunctions == "Action + Timer" then
	actions_text = "Mario Action: " .. ActionsTable[gGlobalSyncTable.LFActions].action_name .. " + Action Timer: " .. gGlobalSyncTable.LRLevelActionTimerSave
	end
	
	actions_scale = 0.35
	
	-- get width of screen and text
    actions_screenWidth = djui_hud_get_screen_width()
    actions_screenHeight = djui_hud_get_screen_height()
    actions_width = djui_hud_measure_text(actions_text) * actions_scale
    actions_height = 32 * actions_scale
	
	actions_x = (actions_screenWidth - actions_width) / 2.0
	
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions") then
	actions_y = (actions_screenHeight - actions_height) / 2.0 - 98.4
	elseif (gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions") then
	actions_y = (actions_screenHeight - actions_height) / 2.0 - 87.3
	elseif (gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then
	actions_y = (actions_screenHeight - actions_height) / 2.0 - 76.2
	end
	
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(actions_x - 6 * actions_scale, actions_y, actions_width + 12 * actions_scale, actions_height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(actions_text, actions_x + 0.70, actions_y + 0.70, actions_scale);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(actions_text, actions_x, actions_y, actions_scale);
	
	end
	
	if (gGlobalSyncTable.LREnabledOption == "Stop Timer: Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions"
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions") then

	if gGlobalSyncTable.LRPositionFunctions == "X Position Area" then
	position_text = "X Position: " .. gGlobalSyncTable.LRPBXPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Y Position Area" then
	position_text = "Y Position: " .. gGlobalSyncTable.LRPBYPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Z Position Area" then
	position_text = "Z Position: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X Position Box" then
	position_text = "X Position: " .. gGlobalSyncTable.LRPBXPosition  .. " + Extra X Position: " .. gGlobalSyncTable.LRPBXPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "Y Position Box" then
	position_text = "Y Position: " .. gGlobalSyncTable.LRPBYPosition  .. " + Extra Y Position: " .. gGlobalSyncTable.LRPBYPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "Z Position Box" then
	position_text = "Z Position: " .. gGlobalSyncTable.LRPBZPosition  .. " + Extra Z Position: " .. gGlobalSyncTable.LRPBZPositionExtra
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" then
	position_text = "X Position: " .. gGlobalSyncTable.LRPBXPosition  .. " + Y Position: " .. gGlobalSyncTable.LRPBYPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" then
	position_text = "X Position: " .. gGlobalSyncTable.LRPBXPosition  .. " + Z Position: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" then
	position_text = "Y Position: " .. gGlobalSyncTable.LRPBYPosition  .. " + Z Position: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" then
	position_text = "(X Pos: " .. gGlobalSyncTable.LRPBXPosition  .. " + Extra X Pos: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				") + (Y Pos: " .. gGlobalSyncTable.LRPBYPosition  .. " + Extra Y Pos: " .. gGlobalSyncTable.LRPBYPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" then
	position_text = "(X Pos: " .. gGlobalSyncTable.LRPBXPosition  .. " + Extra X Pos: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				") + (Z Pos: " .. gGlobalSyncTable.LRPBZPosition  .. " + Extra Z Pos: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" then
	position_text = "(Y Pos: " .. gGlobalSyncTable.LRPBYPosition  .. " + Extra Y Pos: " .. gGlobalSyncTable.LRPBYPositionExtra .. 
				") + (Z Pos: " .. gGlobalSyncTable.LRPBZPosition  .. " + Extra Z Pos: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
	elseif gGlobalSyncTable.LRPositionFunctions == "All Position Area" then
	position_text = "X Position: " .. gGlobalSyncTable.LRPBXPosition  .. " + Y Position: " .. gGlobalSyncTable.LRPBYPosition .. " + Z Position: " .. gGlobalSyncTable.LRPBZPosition
	elseif gGlobalSyncTable.LRPositionFunctions == "All Position Box" then
	position_text = "(X Pos: " .. gGlobalSyncTable.LRPBXPosition  .. " + Extra X Pos: " .. gGlobalSyncTable.LRPBXPositionExtra .. 
				") + (Y Pos: " .. gGlobalSyncTable.LRPBYPosition  .. " + Extra Y Pos: " .. gGlobalSyncTable.LRPBYPositionExtra .. 
				") + (Z Pos: " .. gGlobalSyncTable.LRPBZPosition  .. " + Extra Z Pos: " .. gGlobalSyncTable.LRPBZPositionExtra .. ")"
	end
	
	position_scale = 0.35
	
	-- get width of screen and text
    position_screenWidth = djui_hud_get_screen_width()
    position_screenHeight = djui_hud_get_screen_height()
    position_width = djui_hud_measure_text(position_text) * position_scale
    position_height = 32 * position_scale
	
	position_x = (position_screenWidth - position_width) / 2.0
	
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Positions" then
	position_y = (position_screenHeight - position_height) / 2.0 - 98.4
	elseif (gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions") then
	position_y = (position_screenHeight - position_height) / 2.0 - 87.3
	elseif (gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions") then
	position_y = (position_screenHeight - position_height) / 2.0 - 76.2
	elseif gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions" then
	position_y = (position_screenHeight - position_height) / 2.0 - 65.1
	end
	
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(position_x - 6 * position_scale, position_y, position_width + 12 * position_scale, position_height);

	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(position_text, position_x + 0.70, position_y + 0.70, position_scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(position_text, position_x, position_y, position_scale);
	
	end
end

function warp_timer_render()
	if gGlobalSyncTable.beatedGame and (gGlobalSyncTable.GamemodeSetting == "Normal" or gGlobalSyncTable.GamemodeSetting == "PracticeRun" or gGlobalSyncTable.GamemodeSetting == "Casual") 
	and gGlobalSyncTable.SingleStarsMode == false then
	
    -- set text
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.NormalWarpSetting == "Disabled" then
	if gGlobalSyncTable.FinishedRunTextChange ~= 0 then
    text = "The Run is Finished!!"
	elseif gGlobalSyncTable.FinishedRunTextChange == 0 and not network_is_server() then
    text = "You can check around, While the Host is setting up"
	elseif gGlobalSyncTable.FinishedRunTextChange == 0 and network_is_server() then
    text = "You can Redo the Run or Do a Different Run."
	elseif gGlobalSyncTable.FinishedRunTextChange == 0 and network_is_server() then
    text = "You can Redo the Run or Do a Different Run."
	end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.NormalWarpSetting == "Enabled" then
	 text = "The Run will Reset in " .. tostring(math.floor(gGlobalSyncTable.NormalWarpTimer))
	elseif gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
    text = "The Run will Reset in " .. tostring(math.floor(gGlobalSyncTable.PracticeWarpTimer))
	elseif gGlobalSyncTable.GamemodeSetting == "Casual" then
	text = "The Run will Reset in " .. tostring(math.floor(gGlobalSyncTable.CasualWarpTimer))
	end

    -- set scale
    scale = 0.50

    -- get width of screen and text
    screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
    width = djui_hud_measure_text(text) * scale
    height = 32 * scale

    x = (screenWidth - width) / 2.0
    y = (screenHeight - height) / 2.0 - 112

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(text, x + 1, y  + 1, scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	end
end

function Single_Stars_Display()
    -- set text
	if gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" and gGlobalSyncTable.SingleStarsCollectedStar ~= 1 and not gGlobalSyncTable.beatedGame then
    text = "Amount of Stars: Collect " .. tostring(math.floor(gGlobalSyncTable.SingleStarsCollectedStar)) .. " Stars" 
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" and gGlobalSyncTable.SingleStarsCollectedStar == 1 and not gGlobalSyncTable.beatedGame then
    text = "Amount of Stars: Collect " .. tostring(math.floor(gGlobalSyncTable.SingleStarsCollectedStar)) .. " Star" 
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" and gGlobalSyncTable.beatedGame then
    text = "Amount of Stars: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Star ID" and not gGlobalSyncTable.beatedGame then
    text = "Star ID: Collect Star " .. tostring(math.floor(gGlobalSyncTable.SingleStarsStarNumbers))
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Star ID" and gGlobalSyncTable.beatedGame then
    text = "Star ID: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Key 1/2" and not gGlobalSyncTable.beatedGame then
    text = "Key 1/2: Collect The Key"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Key 1/2" and gGlobalSyncTable.beatedGame then
    text = "Key 1/2: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Grand Star" and not gGlobalSyncTable.beatedGame then
    text = "Grand Star: Collect The Grand Star"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Grand Star" and gGlobalSyncTable.beatedGame then
    text = "Grand Star: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Bowser Arenas" and not gGlobalSyncTable.beatedGame then
    text = "Bowser Arenas: Go Thought The Level"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Bowser Arenas" and gGlobalSyncTable.beatedGame then
    text = "Bowser Arenas: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" and not gGlobalSyncTable.beatedGame then
    text = "Cake Ending: Reach to the Cake Ending"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" and gGlobalSyncTable.beatedGame then
    text = "Cake Ending: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" and not gGlobalSyncTable.beatedGame then
    text = "Cake Ending: Reach to the Cake Ending"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" and gGlobalSyncTable.beatedGame then
    text = "Cake Ending: Complete!" 
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" and not gGlobalSyncTable.beatedGame then
    text = "Cap Switches: Press one of the Cap Switches"
	elseif gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" and gGlobalSyncTable.beatedGame then
    text = "Cap Switches: Complete!" 
	end

    -- set scale
    scale = 0.50
	
	if gGlobalSyncTable.SingleStarsTextChange == 0 and not network_is_server() then
	text = "You can check around the Levels, While the Host is setting up"
	elseif gGlobalSyncTable.SingleStarsTextChange == 0 and network_is_server() then
	text = "You can either Try Again Or Choose a different Run."
	end

    -- get width of screen and text
    screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
    width = djui_hud_measure_text(text) * scale
    height = 32 * scale

    x = (screenWidth - width) / 2.0
    y = (screenHeight - height) / 2.0 - 112

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(text, x + 1, y + 1, scale);
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.SingleStarsTextChange ~= 0 then
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(text, x, y, scale);
	
	djui_hud_set_color(0, 255, 0, 255);
    djui_hud_print_text(text, x, y, scale);
	end
end

function NAS_hud_render()
	
	if showSpeedrunTimer ~= 1 then return end
	
	-- All
	screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
	size = 1
	height = 32 * size
	y = (screenHeight - height) / 2.0
	
	-- Timer Display
	timer_text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))
	timer_size = 0.50
	timer_width = djui_hud_measure_text(timer_text) * timer_size
	timer_x = (screenWidth - timer_width) / 2.0
    timer_y = screenHeight - 16
	
	-- Go Display
    go_text = "Go!"
    go_width = djui_hud_measure_text(go_text) * size
    go_x = (screenWidth - go_width) / 2.0
	
	-- Countdown Display
    countdown_text = tostring(math.floor(gGlobalSyncTable.startcountdown))
	countdown_width = djui_hud_measure_text(countdown_text) * size
	countdown_x = (screenWidth - countdown_width) / 2.0
	
    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(timer_x - 6 + CustomXPos, timer_y + CustomYPos, timer_width + 12, 16);
	
	djui_hud_set_color(0, 0, 0, VisableFont);
    djui_hud_print_text(timer_text, timer_x + CustomXPos + 1, timer_y + CustomYPos + 1, timer_size);
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(timer_x - 6 + CustomXPos, timer_y + CustomYPos, timer_width + 12, 16);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(timer_text, timer_x + CustomXPos + 1, timer_y + CustomYPos + 1, timer_size);
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	end
	
if gGlobalSyncTable.startcountdown <= 1 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
    -- render
    if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
	djui_hud_render_rect(go_x - 6 * size, y, go_width + 12 * size, height);
	
	djui_hud_set_color(0, 0, 0, VisableFont);
    djui_hud_print_text(go_text, go_x + 2, y + 2, size);
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(go_text, go_x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(go_x - 6 * size, y, go_width + 12 * size, height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(go_text, go_x + 2, y + 2, size);
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(go_text, go_x, y, size);
	end
end

    if gGlobalSyncTable.countdown_display_check == 0 and gGlobalSyncTable.startcountdown >= 1.01 then

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
	djui_hud_render_rect(countdown_x - 6 * size, y, countdown_width + 12 * size, height);
	
	djui_hud_set_color(0, 0, 0, VisableFont);
    djui_hud_print_text(countdown_text, countdown_x + 2, y + 2, size);
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(countdown_text, countdown_x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
	djui_hud_render_rect(countdown_x - 6 * size, y, countdown_width + 12 * size, height);
	
	djui_hud_set_color(0, 0, 0, 255);
    djui_hud_print_text(countdown_text, countdown_x + 2, y + 2, size);
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(countdown_text, countdown_x, y, size);
		end
	end
end

function sm64_hud_render()
	
	if showSpeedrunTimer ~= 1 then return end

	-- All
	screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
	size = 1
	doublesize = 2
	height = 16 * doublesize
	y = (screenHeight - height) / 2.5
	
	go_text = "GO"
	
	if FontTable[DefaultFont].name == "SM64" then
	go_text = "GO!"
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	go_text = "GO"
	end
	
	-- Timer Display
	timetext = "TIME"
	singlequote = "'"
	Doublequote = '"'
	hours10text = string.format('%s', string.format("%02d", Hours))
    hourstext = string.format('%s', string.format("%d", Hours))
	Minutestext = string.format('%s', string.format("%02d", Minutes))
	secondstext = string.format('%s', string.format("%02d", Seconds))
	millisecondstext = string.format('%s', string.format("%03d", MilliSeconds))
	timer_width = 1 * 1
	timer_x = (screenWidth - timer_width) / 2.0
	timer_y = screenHeight - 26
	
	-- Go Display
	go_width = djui_hud_measure_text(go_text) * doublesize
	go_x = (screenWidth - go_width) / 2.0
	
	-- Countdown Display
    countdown_text = tostring(math.floor(gGlobalSyncTable.startcountdown))
	countdown_width = djui_hud_measure_text(countdown_text) * doublesize
	countdown_x = (screenWidth - countdown_width) / 2.0
	
	if FontTable[DefaultFont].name == "SM64" then
	
	if DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64" then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if Hours >= 10 then
	djui_hud_print_text(timetext, timer_x - 125 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end

	if Hours < 10 then
	djui_hud_print_text(timetext, timer_x - 115 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if Hours >= 10 then
    djui_hud_print_text(hours10text, timer_x - 70 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if Hours < 10 then
    djui_hud_print_text(hourstext, timer_x - 58 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
    djui_hud_print_text(Minutestext, timer_x - 38 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(secondstext, timer_x - 4 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(millisecondstext, timer_x + 30 + CustomXPos, timer_y + 8 + CustomYPos, size);
	
	
	djui_hud_print_text(singlequote, timer_x - 43 + CustomXPos, timer_y + 5 + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x - 10 + CustomXPos, timer_y + 5 + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x + 24 + CustomXPos, timer_y + 5 + CustomYPos, size);
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	
	if RomhackColors == false then
	if DisplayCustomColors == 1 then
    djui_hud_set_color(255, 255, 255, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if Hours >= 10 then
	djui_hud_print_text(timetext, timer_x - 125 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end

	if Hours < 10 then
	djui_hud_print_text(timetext, timer_x - 115 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if Hours >= 10 then
    djui_hud_print_text(hours10text, timer_x - 70 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if Hours < 10 then
    djui_hud_print_text(hourstext, timer_x - 58 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
    djui_hud_print_text(Minutestext, timer_x - 38 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(secondstext, timer_x - 4 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(millisecondstext, timer_x + 30 + CustomXPos, timer_y + 8 + CustomYPos, size);
	
	djui_hud_print_text(singlequote, timer_x - 48 + CustomXPos, timer_y + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x - 13 + CustomXPos, timer_y + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x + 21 + CustomXPos, timer_y + CustomYPos, size);
	end
	
	if RomhackColors == true then
	if WordsColors and DisplayCustomColors == 1 then
	djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	else
	djui_hud_set_color(255, 255, 255, VisableFont);
	end
	
	if Hours >= 10 then
	djui_hud_print_text(timetext, timer_x - 125 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end

	if Hours < 10 then
	djui_hud_print_text(timetext, timer_x - 115 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if NumbersColors and DisplayCustomColors == 1 then
	djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	else
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if Hours >= 10 then
    djui_hud_print_text(hours10text, timer_x - 70 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
	if Hours < 10 then
    djui_hud_print_text(hourstext, timer_x - 58 + CustomXPos, timer_y + 8 + CustomYPos, size);
	end
	
    djui_hud_print_text(Minutestext, timer_x - 38 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(secondstext, timer_x - 4 + CustomXPos, timer_y + 8 + CustomYPos, size);
    djui_hud_print_text(millisecondstext, timer_x + 30 + CustomXPos, timer_y + 8 + CustomYPos, size);
	
	if SingleQuoteColors and DisplayCustomColors == 1 then
	djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	else
	djui_hud_set_color(255, 255, 255, VisableFont);
	end
	
	djui_hud_print_text(singlequote, timer_x - 48 + CustomXPos, timer_y + CustomYPos, size);
	
	if DoubleQuotesColors and DisplayCustomColors == 1 then
	djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	else
	djui_hud_set_color(255, 255, 255, VisableFont);
	end
	
    djui_hud_print_text(Doublequote, timer_x - 13 + CustomXPos, timer_y + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x + 21 + CustomXPos, timer_y + CustomYPos, size);
		end
	end
	
if gGlobalSyncTable.startcountdown <= 1 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
	
	if DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64" then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64RH" and RomhackColors == true and WordsColors == true then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64RH" and RomhackColors == false then
    djui_hud_set_color(255, 255, 255, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if FontTable[DefaultFont].name == "SM64" then
	djui_hud_print_text(go_text, go_x - 3, y + 21, doublesize);
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	djui_hud_print_text(go_text, go_x - 3, y + 21, doublesize);
	end
end

    if gGlobalSyncTable.countdown_display_check == 0 and gGlobalSyncTable.startcountdown >= 1.01 then
	
	if DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64" then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64RH" and RomhackColors == true and NumbersColors == true then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 1 and FontTable[DefaultFont].name == "SM64RH" and RomhackColors == false then
    djui_hud_set_color(255, 255, 255, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if FontTable[DefaultFont].name == "SM64" then
	djui_hud_print_text(countdown_text, countdown_x - 3, y + 21, doublesize);
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	djui_hud_print_text(countdown_text, countdown_x - 3, y + 21, doublesize);
	end
	end
end

function djui_hud_render()
	
	if showSpeedrunTimer ~= 1 then return end

	-- All
	screenWidth = djui_hud_get_screen_width()
    screenHeight = djui_hud_get_screen_height()
	size = 0.75
	height = 50 * size
	y = (screenHeight - height) / 2.0
	
	-- Timer Display
	timer_text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))
	timer_size = 0.36
	timer_width = djui_hud_measure_text(timer_text) * timer_size
	timer_x = (screenWidth - timer_width) / 2.01
    timer_y = screenHeight - 21
	
	-- Go Display
    go_text = "Go!"
    go_width = djui_hud_measure_text(go_text) * size
    go_x = (screenWidth - go_width) / 2.0
	
	-- Countdown Display
    countdown_text = tostring(math.floor(gGlobalSyncTable.startcountdown))
	countdown_width = djui_hud_measure_text(countdown_text) * size
	countdown_x = (screenWidth - countdown_width) / 2.04
	
    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	elseif DisplayCustomColors == 0 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	end
	
if gGlobalSyncTable.startcountdown <= 1 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
    -- render
    if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(go_text, go_x, y, size);
	elseif DisplayCustomColors == 0 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(go_text, go_x, y, size);
	end
end

    if gGlobalSyncTable.countdown_display_check == 0 and gGlobalSyncTable.startcountdown >= 1.01 then

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(countdown_text, countdown_x, y, size);
	elseif DisplayCustomColors == 0 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(countdown_text, countdown_x, y, size);
		end
	end
end

-- hooks for the huds
function on_timer_hud_render()
    djui_hud_set_resolution(RESOLUTION_N64)
	
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" and gGlobalSyncTable.SingleStarsMode == true then
	djui_hud_set_font(FONT_NORMAL)
	Single_Stars_Display()
	end
	
	if gGlobalSyncTable.Intermission then
	djui_hud_set_font(FONT_NORMAL)
	intermission_render()
	end
	
	if (gGlobalSyncTable.GamemodeSetting == "Normal" or gGlobalSyncTable.GamemodeSetting == "PracticeRun" or gGlobalSyncTable.GamemodeSetting == "Casual") then
	djui_hud_set_font(FONT_NORMAL)
	warp_timer_render()
	end
	
	-- Normal Text Fonts and Aliased Text Fonts
	if FontTable[DefaultFont].name == "Normal" then
	djui_hud_set_font(FONT_NORMAL)
	NAS_hud_render()
	elseif FontTable[DefaultFont].name == "Aliased" then
	djui_hud_set_font(FONT_ALIASED)
	NAS_hud_render()
	elseif FontTable[DefaultFont].name == "Special" then
	djui_hud_set_font(FONT_SPECIAL)
	NAS_hud_render()
	end
	
	-- SM64 Built in Fonts
	if FontTable[DefaultFont].name == "SM64" then
	if DisplayCustomColors == 1 then
	djui_hud_set_font(FONT_RECOLOR_HUD)
	elseif DisplayCustomColors == 0 then
	djui_hud_set_font(FONT_CUSTOM_HUD)
	end
	sm64_hud_render()
	elseif FontTable[DefaultFont].name == "SM64RH" then
	djui_hud_set_font(FONT_HUD)

	sm64_hud_render()
	end
	
	-- Djui Fonts
	if FontTable[DefaultFont].name == "DJUI" then
	djui_hud_set_font(FONT_MENU)

	djui_hud_render()
	end
	
	if (FontTable[DefaultFont].name == "Normal" or FontTable[DefaultFont].name == "Aliased" or FontTable[DefaultFont].name == "Special") then
	RectFontsOnly = true
	else
	RectFontsOnly = false
	end
end
