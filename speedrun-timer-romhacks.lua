if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Functions
gGlobalSyncTable.AntiCheatOption = false
gGlobalSyncTable.PluginsRunsSlots = 0
gGlobalSyncTable.AntiCheatsSlots = 0
gGlobalSyncTable.GrandStar = false
gGlobalSyncTable.EndPicture = false
gGlobalSyncTable.CompatibleRomhacks = false
gGlobalSyncTable.RomhacksWarning = false
gGlobalSyncTable.TeamsCheck = false
EnablePluginRuns = true
Romhack_Runs_Option = false
Disable_Custom_Warps = false
BackupSlotPluginCheck = false

-- Runs Menu: Levels Functions Settings
-- Stars
gGlobalSyncTable.LREnabledStars = "Stop Timer"
gGlobalSyncTable.LRStarLimit = 0
gGlobalSyncTable.LRStarID = 1
gGlobalSyncTable.LRStarTypes = "Grand Star"
gGlobalSyncTable.LRStopTimerStars = "Behavior Types"
gGlobalSyncTable.LRCombinedStars = "Behavior Types"

-- Levels
gGlobalSyncTable.LREnabledLevels = "Disabled"
gGlobalSyncTable.LRLevelArea = 1
gGlobalSyncTable.LRLevelAct = 0
gGlobalSyncTable.LRStopTimerLevels = "Level Location"
gGlobalSyncTable.LRCombinedLevels = "Level Location"

-- Actions
gGlobalSyncTable.LREnabledActions = "Disabled"
gGlobalSyncTable.LRLevelActionTimer = 0
gGlobalSyncTable.LRLevelActionTimerSave = 0
gGlobalSyncTable.LRLevelActionTimerCheck = false
gGlobalSyncTable.LREnabledActions = "Disabled"
gGlobalSyncTable.LRStopTimerActions = "Only Actions"
gGlobalSyncTable.LRCombinedActions = "Only Actions"

-- Position Box
gGlobalSyncTable.LREnabledPositionBox = "Disabled"
gGlobalSyncTable.LRPBXPosition = 0
gGlobalSyncTable.LRPBYPosition = 0
gGlobalSyncTable.LRPBZPosition = 0
gGlobalSyncTable.LRPBXPositionExtra = 0
gGlobalSyncTable.LRPBYPositionExtra = 0
gGlobalSyncTable.LRPBZPositionExtra = 0
gGlobalSyncTable.LRStopTimerPositionBox = "X Position Area"
gGlobalSyncTable.LRCombinedPositionBox = "X Position Area"

function Romhack_Mario_Update_Functions(m)
-- this checks if one of the teams finish the run
	if gGlobalSyncTable.SpeedrunTeams then
	if gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == 1 and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#f90303\\Red Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
	elseif gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == 2 and gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#3903ff\\Blue Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
		end
	end
	
	-- Super Mario 64
if gGlobalSyncTable.SuperMario64 == true and gGlobalSyncTable.CustomPlugin == "Enabled" then
Set_SM64_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0)
	end
end

function Romhack_Update_Functions()
	-- stops when someone enter the end picture
	if gGlobalSyncTable.EndPicture then
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gGlobalSyncTable.CustomPlugin == "Enabled" then
        gGlobalSyncTable.beatedGame = true
		end
    end
	
	-- This is for romhack that isn't compatible, so this will set the positions to the start position
	for unsupportedromhacks in pairs(gActiveMods) do
	if gActiveMods[unsupportedromhacks].incompatible ~= nil and gActiveMods[unsupportedromhacks].incompatible:find("romhack") then
	if gGlobalSyncTable.CustomPlugin == "Disabled" and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	gGlobalSyncTable.RomhacksWarning = false
	end
	if gGlobalSyncTable.CustomPlugin == "Enabled" and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	if gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false and not gGlobalSyncTable.RomhacksWarning then
	gGlobalSyncTable.RomhacksWarning = true
	djui_popup_create("\\#ff0000\\\nWarning:\nThere's some Romhacks that won't stop the timer or will stop, but isn't complete.\nBe aware of those and report them if it happens!", 5)
	end
	if (gGlobalSyncTable.CompatibleRomhacks == false) then
	switched = false
	hasConfirmed = true
	if gNetworkPlayers[0].currAreaIndex == 1 then
	Set_Warp_For_Incompatible_Romhacks(1, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 2 then
	Set_Warp_For_Incompatible_Romhacks(2, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 3 then
	Set_Warp_For_Incompatible_Romhacks(3, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 4 then
	Set_Warp_For_Incompatible_Romhacks(4, 0)
			end
			end
		end
		end
	end
end

function Romhack_Interact_Functions(m, o, interactType)
	-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
	if gGlobalSyncTable.SuperMario64 == true and gGlobalSyncTable.CustomPlugin == "Enabled" then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
        gGlobalSyncTable.beatedGame = true
		end
    end
	
	-- pretty much how the timer stop when touching the grand star (only works for romhacks)
	if gGlobalSyncTable.GrandStar then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar and gGlobalSyncTable.CustomPlugin == "Enabled" then
        gGlobalSyncTable.beatedGame = true
		end
    end
end

function Runs_Starting_Positions_Menu()	
	if gGlobalSyncTable.CustomPlugin == "Disabled" then
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if gGlobalSyncTable.RunStarting == true then
	
	if gGlobalSyncTable.SPForcedSettings == "ForcedLevel" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currLevelNum ~= StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedArea" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currAreaIndex ~= gGlobalSyncTable.SPStartingAreas then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedAct" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currActNum ~= gGlobalSyncTable.SPStartingActs then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	end
	
	if (gGlobalSyncTable.StartingSettings == "None" or gGlobalSyncTable.GamemodeSetting == "PracticeRun") then
	if gGlobalSyncTable.SPForcedSettings == "ForcedLevel" and gGlobalSyncTable.startglobaltimer == 1 and gNetworkPlayers[0].currLevelNum ~= StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedArea" and gGlobalSyncTable.startglobaltimer == 1 and gNetworkPlayers[0].currAreaIndex ~= gGlobalSyncTable.SPStartingAreas then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedAct" and gGlobalSyncTable.startglobaltimer == 1 and gNetworkPlayers[0].currActNum ~= gGlobalSyncTable.SPStartingActs then
	warp_to_level(StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].levelid, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	end
	end
	
	if gGlobalSyncTable.SPPositionSettings == "Enabled" and gGlobalSyncTable.SPLockPosition == "Enabled" then
	if gGlobalSyncTable.startglobaltimer < 0.1 then 
	gMarioStates[0].pos.x = gGlobalSyncTable.SPXPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.SPYPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.SPZPosition
	end
	end
	
	if gGlobalSyncTable.SPPositionSettings == "Enabled" and gGlobalSyncTable.SPLockPosition == "Disabled" then
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.startglobaltimer < 0.1 then
	gMarioStates[0].pos.x = gGlobalSyncTable.SPXPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.SPYPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.SPZPosition
	end
	end
	
	if (gGlobalSyncTable.SPPositionSettings == "Disabled" and gGlobalSyncTable.SPLockPosition == "Disabled")
	or (gGlobalSyncTable.SPPositionSettings == "Disabled" and gGlobalSyncTable.SPLockPosition == "Enabled") or gGlobalSyncTable.SPForcedSettings == "ForcedNone" then
	
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.EnabledIntro == false then
	if gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	if gGlobalSyncTable.startglobaltimer == 0 then
	freeze_check = true
	FreezePlayers = true
	else
	FreezePlayers = false
	end
	if freeze_check and gGlobalSyncTable.startglobaltimer ~= 0 then
	set_mario_action(gMarioStates[0], ACT_IDLE, 0)
	freeze_check = false
	end
	if FreezePlayers then
	if (gMarioStates[0].action & ACT_FLAG_AIR) ~= 0 then
	set_mario_action(gMarioStates[0], ACT_SPAWN_SPIN_AIRBORNE, 0)
	end
	if gMarioStates[0].action ~= ACT_SPAWN_SPIN_AIRBORNE and gMarioStates[0].action ~= ACT_SPAWN_SPIN_LANDING then
	set_mario_action(gMarioStates[0], ACT_READING_AUTOMATIC_DIALOG, 0)
			end
			end
		end
		end
		end
	end
	
	if gGlobalSyncTable.SPWarpSettings == "NoWarps" and gGlobalSyncTable.EnabledIntro == false then
		Disable_Custom_Warps = true
		gGlobalSyncTable.set_warp = false
	end
	
	if gGlobalSyncTable.SPWarpSettings == "LevelWarp" and gGlobalSyncTable.EnabledIntro == false then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_level(gLevelValues.entryLevel, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
		set_warp_position = false
		return true
	end
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.EnabledIntro == false then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_level(gLevelValues.entryLevel, gGlobalSyncTable.SPStartingAreas, gGlobalSyncTable.SPStartingActs)
	set_warp_check = true
			end
		end
	end
	
	if gGlobalSyncTable.SPWarpSettings == "StartWarp" and gGlobalSyncTable.EnabledIntro == false then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_start_level()
		set_warp_position = false
		return true
	end
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.EnabledIntro == false then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_start_level()
	set_warp_check = true
		end
		end
	end
	end
end

function Runs_Level_Functions_Menu()
	if gGlobalSyncTable.RunStarting == false then return end
	
	if gGlobalSyncTable.CustomPlugin == "Disabled" then
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
		
	-- Level Functions Menu
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if gGlobalSyncTable.LREnabledStars ~= "Disabled" then
	if gGlobalSyncTable.LREnabledStars == "Stop Timer" then
	
	if (gGlobalSyncTable.LRStopTimerStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRStopTimerStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	end
	
	end
	
	if gGlobalSyncTable.LREnabledLevels ~= "Disabled" then
	
	if gGlobalSyncTable.LREnabledLevels == "Stop Timer" then
	if (gGlobalSyncTable.LRStopTimerLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRStopTimerLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRStopTimerLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRStopTimerLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRStopTimerLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRStopTimerLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if gGlobalSyncTable.LREnabledActions ~= "Disabled" then
	
	if gGlobalSyncTable.LREnabledActions == "Stop Timer" then
	if gGlobalSyncTable.LRStopTimerActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if (gGlobalSyncTable.LRStopTimerActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRStopTimerActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if gGlobalSyncTable.LREnabledPositionBox ~= "Disabled" then
	
	if gGlobalSyncTable.LREnabledPositionBox == "Stop Timer" then
	if (gGlobalSyncTable.LRStopTimerPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRStopTimerPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRStopTimerPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	end
	
	end
end

function Runs_Level_Functions_Interact(m, o, interactType)
	if gGlobalSyncTable.RunStarting == false then return end
	if gGlobalSyncTable.CustomPlugin == "Disabled" then
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	if gGlobalSyncTable.LREnabledStars ~= "Disabled" then
	if gGlobalSyncTable.LREnabledStars == "Stop Timer" then
	if (gGlobalSyncTable.LRStopTimerStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStopTimerStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRStopTimerStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRStopTimerStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRStopTimerStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	end
	end
	end
end

function Runs_Level_Functions_Combined_Menu()
	if gGlobalSyncTable.RunStarting == false then return end
	
	if gGlobalSyncTable.CustomPlugin == "Disabled" then
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
		
	-- Level Functions Menu
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels") and 
	not (gGlobalSyncTable.LREnabledActions == "Combined Actions" or gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledActions == "Combined Actions") and 
	not (gGlobalSyncTable.LREnabledLevels == "Combined Levels" or gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and 
	not (gGlobalSyncTable.LREnabledLevels == "Combined Levels" or gGlobalSyncTable.LREnabledActions == "Combined Actions") then
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	if (gGlobalSyncTable.LREnabledLevels == "Combined Levels" and gGlobalSyncTable.LREnabledActions == "Combined Actions") and 
	not (gGlobalSyncTable.LREnabledStars == "Combined Stars" or gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledLevels == "Combined Levels" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and 
	not (gGlobalSyncTable.LREnabledStars == "Combined Stars" or gGlobalSyncTable.LREnabledActions == "Combined Actions") then
	
	if ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledActions == "Combined Actions" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and 
	not (gGlobalSyncTable.LREnabledStars == "Combined Stars" or gGlobalSyncTable.LREnabledLevels == "Combined Levels") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) 
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" and 
	gGlobalSyncTable.LREnabledActions == "Combined Actions") and not (gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" and 
	gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and not (gGlobalSyncTable.LREnabledActions == "Combined Actions") then
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledActions == "Combined Actions" and 
	gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and not (gGlobalSyncTable.LREnabledLevels == "Combined Levels") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and	((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and	((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and	((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end

	end
	
	if (gGlobalSyncTable.LREnabledLevels == "Combined Levels" and gGlobalSyncTable.LREnabledActions == "Combined Actions" and 
	gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and not (gGlobalSyncTable.LREnabledStars == "Combined Stars") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" 
	and gGlobalSyncTable.LREnabledActions == "Combined Actions" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
		end
	end
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and	((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	end
	
	
	end
end

function Runs_Level_Functions_Interact_Combined(m, o, interactType)
	if gGlobalSyncTable.RunStarting == false then return end
	if gGlobalSyncTable.CustomPlugin == "Disabled" then
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels") and 
	not (gGlobalSyncTable.LREnabledActions == "Combined Actions" or gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledActions == "Combined Actions") and 
	not (gGlobalSyncTable.LREnabledLevels == "Combined Levels" or gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and 
	not (gGlobalSyncTable.LREnabledLevels == "Combined Levels" or gGlobalSyncTable.LREnabledActions == "Combined Actions") then
	
	if (( gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" and 
	gGlobalSyncTable.LREnabledActions == "Combined Actions") and not (gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" and 
	gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and not (gGlobalSyncTable.LREnabledActions == "Combined Actions") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledActions == "Combined Actions" and 
	gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") and not (gGlobalSyncTable.LREnabledLevels == "Combined Levels") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if (gGlobalSyncTable.LREnabledStars == "Combined Stars" and gGlobalSyncTable.LREnabledLevels == "Combined Levels" 
	and gGlobalSyncTable.LREnabledActions == "Combined Actions" and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox") then
	
	if ((gGlobalSyncTable.LRCombinedStars == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRCombinedStars == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRCombinedStars == "Star Behavior" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRCombinedStars == "Star L + ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star L + B" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Star B + ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24 then
	if ((gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit))
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit then
	if (gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	and ((gGlobalSyncTable.LRCombinedLevels == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid)
	or (gGlobalSyncTable.LRCombinedLevels == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Area" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRCombinedLevels == "Level + Act" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRCombinedLevels == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].levelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRCombinedActions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRCombinedActions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	end
	
	end
	
	end
	end
end

