if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Functions
gGlobalSyncTable.AntiCheatOption = false
gGlobalSyncTable.PluginsRunsSlots = 0
gGlobalSyncTable.AntiCheatsSlots = 0
gGlobalSyncTable.TeamsCheck = false
DisablePluginRuns = true
Romhack_Runs_Option = false
BackupSlotPluginCheck = false
NoSlotsTypePlugin = "None"

-- Frame Update
SpawnLockPositionGrounds = true
SpawnLockPositionAnywhere = true
SpawnUpdateCheck = false
-- Levels
gGlobalSyncTable.LevelIdUpdate = 0
gGlobalSyncTable.LevelIdNumber = 0
gGlobalSyncTable.AreaNumber = 0
gGlobalSyncTable.ActNumber = 0

-- Position
gGlobalSyncTable.PositionUpdate = 0
gGlobalSyncTable.XSetPosition = 0
gGlobalSyncTable.YSetPosition = 0
gGlobalSyncTable.ZSetPosition = 0

-- Runs Menu: Levels Functions Settings
gGlobalSyncTable.LREnabledOption = "Stop Timer: Stars"

-- Stars
gGlobalSyncTable.LRStarLimit = 0
gGlobalSyncTable.LRStarID = 1
gGlobalSyncTable.LRStarTypes = "Grand Star"
gGlobalSyncTable.LRStarsFunctions = "Behavior Types"

-- Levels
gGlobalSyncTable.LRLevelArea = 1
gGlobalSyncTable.LRLevelAct = 0
gGlobalSyncTable.LRLevelsFunctions = "Level Location"

-- Actions
gGlobalSyncTable.LRLevelActionTimer = 0
gGlobalSyncTable.LRLevelActionTimerSave = 0
gGlobalSyncTable.LRLevelActionTimerCheck = false
gGlobalSyncTable.LRActionsFunctions = "Only Actions"

-- Position Box
gGlobalSyncTable.LRPBXPosition = 0
gGlobalSyncTable.LRPBYPosition = 0
gGlobalSyncTable.LRPBZPosition = 0
gGlobalSyncTable.LRPBXPositionExtra = 0
gGlobalSyncTable.LRPBYPositionExtra = 0
gGlobalSyncTable.LRPBZPositionExtra = 0
gGlobalSyncTable.LRPositionFunctions = "X Position Area"

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
end

function Starting_Positions_Updater()
	if gGlobalSyncTable.RunStarting == true then
	SpawnLockPositionGrounds = false
	SpawnLockPositionAnywhere = false
	else
	SpawnLockPositionGrounds = true
	SpawnLockPositionAnywhere = true
	end
	
	if network_is_server() then
	if gGlobalSyncTable.LevelIdUpdate < 5 then
	if gNetworkPlayers[0].currLevelNum == gNetworkPlayers[0].currLevelNum then
	gGlobalSyncTable.LevelIdNumber = gNetworkPlayers[0].currLevelNum
	end
	if gNetworkPlayers[0].currAreaIndex == gNetworkPlayers[0].currAreaIndex then
	gGlobalSyncTable.AreaNumber = gNetworkPlayers[0].currAreaIndex
	end
	if gNetworkPlayers[0].currActNum == gNetworkPlayers[0].currActNum then
	gGlobalSyncTable.ActNumber = gNetworkPlayers[0].currActNum
			end
		end
		
	if gGlobalSyncTable.LevelIdUpdate < 5 then
        gGlobalSyncTable.LevelIdUpdate = gGlobalSyncTable.LevelIdUpdate + 1
		end	
	end
	
	if LocationSpotSettings == "Ground" and network_is_server() then
	if gGlobalSyncTable.PositionUpdate < 3 and (gMarioStates[0].action & ACT_FLAG_AIR) ~= 0 then
	set_mario_action(gMarioStates[0], ACT_SPAWN_NO_SPIN_AIRBORNE, 0)
	end
	
	if gGlobalSyncTable.PositionUpdate < 3 and gMarioStates[0].action == ACT_SPAWN_NO_SPIN_LANDING then
	end
	
	if gGlobalSyncTable.PositionUpdate < 3 and (gMarioStates[0].action & ACT_FLAG_AIR) == 0 then
	
	if gMarioStates[0].pos.x == gMarioStates[0].pos.x then
	gGlobalSyncTable.XSetPosition = gMarioStates[0].pos.x
	end
	if gMarioStates[0].pos.y == gMarioStates[0].pos.y then
	gGlobalSyncTable.YSetPosition = gMarioStates[0].pos.y
	end
	if gMarioStates[0].pos.z == gMarioStates[0].pos.z then
	gGlobalSyncTable.ZSetPosition = gMarioStates[0].pos.z
	end
	end
	
	if gGlobalSyncTable.PositionUpdate < 3 and (gMarioStates[0].action & ACT_FLAG_AIR) == 0 and network_is_server() then
        gGlobalSyncTable.PositionUpdate = gGlobalSyncTable.PositionUpdate + 1
		end	
	end
	
	if LocationSpotSettings == "Anywhere" and network_is_server() then
	
	if gGlobalSyncTable.PositionUpdate < 3 and (gMarioStates[0].action & ACT_FLAG_AIR) ~= 0 then
	set_mario_action(gMarioStates[0], ACT_SPAWN_NO_SPIN_AIRBORNE, 0)
	end
	
	if gGlobalSyncTable.PositionUpdate == 0 then
	
	if SpawnUpdateCheck == false then
	if gMarioStates[0].pos.x == gMarioStates[0].pos.x then
	gGlobalSyncTable.XSetPosition = gMarioStates[0].pos.x
	end
	if gMarioStates[0].pos.y == gMarioStates[0].pos.y then
	gGlobalSyncTable.YSetPosition = gMarioStates[0].pos.y
	end
	if gMarioStates[0].pos.z == gMarioStates[0].pos.z then
	gGlobalSyncTable.ZSetPosition = gMarioStates[0].pos.z
	end
	SpawnUpdateCheck = true
	end
	end
	
	if gGlobalSyncTable.PositionUpdate == 2 and SpawnUpdateCheck == true then
	
	if gMarioStates[0].pos.x == gMarioStates[0].pos.x then
	gGlobalSyncTable.XSetPosition = gMarioStates[0].pos.x
	end
	if gMarioStates[0].pos.y == gMarioStates[0].pos.y then
	gGlobalSyncTable.YSetPosition = gMarioStates[0].pos.y
	end
	if gMarioStates[0].pos.z == gMarioStates[0].pos.z then
	gGlobalSyncTable.ZSetPosition = gMarioStates[0].pos.z
	end
	end
	
	if gGlobalSyncTable.PositionUpdate < 5 then
        gGlobalSyncTable.PositionUpdate = gGlobalSyncTable.PositionUpdate + 1
    end	
	end
end

function Runs_Starting_Positions_Menu()	
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if gGlobalSyncTable.SPForcedSettings == "ForcedLevel" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currLevelNum ~= gGlobalSyncTable.LevelIdNumber then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedArea" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currAreaIndex ~= gGlobalSyncTable.AreaNumber then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedAct" and gGlobalSyncTable.startglobaltimer < 0.1 and gNetworkPlayers[0].currActNum ~= gGlobalSyncTable.ActNumber then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	end
	
	if gGlobalSyncTable.GamemodeSetting ~= "PracticeRun" then
	if gGlobalSyncTable.SPLockPosition == "Enabled" and (SpawnLockPositionGrounds == false or SpawnLockPositionAnywhere == false) then
	if gGlobalSyncTable.startglobaltimer < 0.1 then 
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	
	if gGlobalSyncTable.SPLockPosition == "Disabled" then
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.startglobaltimer < 0.1 then
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "PracticeRun" or (gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.StartingSettings == "None") then
	if gGlobalSyncTable.SPLockPosition == "Enabled" and (SpawnLockPositionGrounds == false or SpawnLockPositionAnywhere == false) and gGlobalSyncTable.SPWarpSettings ~= "LevelWarp" then
	if gGlobalSyncTable.startglobaltimer < 2 then 
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	
	if gGlobalSyncTable.SPLockPosition == "Disabled" then
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.startglobaltimer < 2 and gGlobalSyncTable.SPWarpSettings ~= "LevelWarp" then
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	
	if gGlobalSyncTable.SPLockPosition == "Enabled" and (SpawnLockPositionGrounds == false or SpawnLockPositionAnywhere == false) and gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
	if gGlobalSyncTable.startglobaltimer < 5 then 
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	
	if gGlobalSyncTable.SPLockPosition == "Disabled" then
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.startglobaltimer < 5 and gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
	gMarioStates[0].pos.x = gGlobalSyncTable.XSetPosition
	gMarioStates[0].pos.y = gGlobalSyncTable.YSetPosition
	gMarioStates[0].pos.z = gGlobalSyncTable.ZSetPosition
	end
	end
	end
	
	if gGlobalSyncTable.SPWarpSettings == "NoWarps" then
		DisableWarps = true
		gGlobalSyncTable.set_warp = false
	end
	
	if gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
		set_warp_position = false
		return true
	end
	if ((gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.EnabledIntro == false and gGlobalSyncTable.RunStarting == true) 
	or (gGlobalSyncTable.GamemodeSetting ~= "Casual" and gGlobalSyncTable.RunStarting == true) then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	set_warp_check = true
			end
		end
	end
	
	if gGlobalSyncTable.SPWarpSettings == "StartWarp" then
	gGlobalSyncTable.set_warp = true
	if set_warp_position then
		warp_to_start_level()
		set_warp_position = false
		return true
	end
	if ((gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) and gGlobalSyncTable.EnabledIntro == false and gGlobalSyncTable.RunStarting == true) 
	or (gGlobalSyncTable.GamemodeSetting ~= "Casual" and gGlobalSyncTable.RunStarting == true) then
	if gGlobalSyncTable.set_warp and not set_warp_check then
	warp_to_start_level()
	set_warp_check = true
		end
	end
	end
end

function Runs_Level_Functions_Menu()
	if gGlobalSyncTable.RunStarting == false then return end
	
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
		
	-- Level Functions Menu
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Stars" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Levels" then
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Actions" then
	if gGlobalSyncTable.LRActionsFunctions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
		end
	end
	
	if gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
		end
	end
	
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Positions" then
	
	if ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	end
end

function Runs_Level_Functions_Interact(m, o, interactType)
	if gGlobalSyncTable.RunStarting == false then return end
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	if gGlobalSyncTable.LREnabledOption == "Stop Timer: Stars" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	end
end

function Runs_Level_Functions_Combined_Menu()
	if gGlobalSyncTable.RunStarting == false then return end
	
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
		
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" 
	or gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" or gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions" then
	if gGlobalSyncTable.LRActionsFunctions == "Action + Timer" then
	if gGlobalSyncTable.LRLevelActionTimerCheck == false then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimerSave
	gGlobalSyncTable.LRLevelActionTimerCheck = true
			end
		end
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions" then
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Positions" then
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Actions + Positions" then
	
	if (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Levels + Actions + Positions" then
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) 
	and (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	if gGlobalSyncTable.LRLevelActionTimer > 0 and network_is_server() then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star Limit" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))) 
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	end
end

function Runs_Level_Functions_Interact_Combined(m, o, interactType)
	if gGlobalSyncTable.RunStarting == false then return end
	if gGlobalSyncTable.GamemodeSetting == "SingleStars" then return end
	
	if (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer or gGlobalSyncTable.CasualTimer) and gGlobalSyncTable.startglobaltimer ~= 0 then
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Actions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0))))) 
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0)) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	if gGlobalSyncTable.LREnabledOption == "Combine Types: Stars + Levels + Actions + Positions" then
	
	if (((gGlobalSyncTable.LRStarsFunctions == "Star ID" and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	or (gGlobalSyncTable.LRStarTypes == "Grand Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and gGlobalSyncTable.LRStarsFunctions == "Behavior Types" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarsFunctions == "Star Limit + Star ID" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit and interactType == INTERACT_STAR_OR_KEY 
	and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24))
	or ((gGlobalSyncTable.LRStarsFunctions == "Star Limit + Behavior Types" and gMarioStates[0].numStars >= gGlobalSyncTable.LRStarLimit) 
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)))
	or ((gGlobalSyncTable.LRStarsFunctions == "Behavior Types + Star ID" and o.oBehParams == gGlobalSyncTable.LRStarID - 1 << 24)
	and ((gGlobalSyncTable.LRStarTypes == "Grand Star" and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	or (gGlobalSyncTable.LRStarTypes == "Normal Star" and get_id_from_behavior(o.behavior) == id_bhvStar)
	or (gGlobalSyncTable.LRStarTypes == "Spawn Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStar)
	or (gGlobalSyncTable.LRStarTypes == "Coordinate Star" and get_id_from_behavior(o.behavior) == id_bhvStarSpawnCoordinates)
	or (gGlobalSyncTable.LRStarTypes == "100 Coins Star" and get_id_from_behavior(o.behavior) == id_bhvSpawnedStarNoLevelExit)
	or (gGlobalSyncTable.LRStarTypes == "Key 1" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)) 
	or (gGlobalSyncTable.LRStarTypes == "Key 2" and (save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Red Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Blue Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Green Switch" and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Mips 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 1" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 2" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0))
	or (gGlobalSyncTable.LRStarTypes == "Toad 3" and (save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0)))))
	and ((gGlobalSyncTable.LRLevelsFunctions == "Level Location" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid)
	or (gGlobalSyncTable.LRLevelsFunctions == "Area Number" and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Act Number" and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Area Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea)
	or (gGlobalSyncTable.LRLevelsFunctions == "Level Location + Act Number" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct)
	or (gGlobalSyncTable.LRLevelsFunctions == "All Options" and gNetworkPlayers[0].currLevelNum == LevelFunctionTable[gGlobalSyncTable.LFLevels].LFlevelid 
	and gNetworkPlayers[0].currAreaIndex == gGlobalSyncTable.LRLevelArea and gNetworkPlayers[0].currActNum == gGlobalSyncTable.LRLevelAct))
	and ((gGlobalSyncTable.LRActionsFunctions == "Only Actions" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id)
	or (gGlobalSyncTable.LRActionsFunctions == "Action + Timer" and gMarioStates[0].action == ActionsTable[gGlobalSyncTable.LFActions].action_id and gGlobalSyncTable.LRLevelActionTimer <= 0))
	and ((gGlobalSyncTable.LRPositionFunctions == "X Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Area" and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X Position Box" and gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Y Position Box" and gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "Z Position Box" and gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Area" and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "X + Y Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "X + Z Position Box" and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "Y + Z Position Box" and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra) 
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Area" and gMarioStates[0].pos.x == gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.y == gGlobalSyncTable.LRPBYPosition 
	and gMarioStates[0].pos.z == gGlobalSyncTable.LRPBZPosition)
	or (gGlobalSyncTable.LRPositionFunctions == "All Position Box" 
	and (gMarioStates[0].pos.x <= gGlobalSyncTable.LRPBXPosition and gMarioStates[0].pos.x >= gGlobalSyncTable.LRPBXPositionExtra)
	and (gMarioStates[0].pos.y <= gGlobalSyncTable.LRPBYPosition and gMarioStates[0].pos.y >= gGlobalSyncTable.LRPBYPositionExtra)
	and (gMarioStates[0].pos.z <= gGlobalSyncTable.LRPBZPosition and gMarioStates[0].pos.z >= gGlobalSyncTable.LRPBZPositionExtra))) then
	gGlobalSyncTable.beatedGame = true
	end
	
	end
	
	end
end

