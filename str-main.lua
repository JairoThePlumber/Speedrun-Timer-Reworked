function str_timer_function()
    if not network_is_server() then return end
	
	if STRGST.STRGameState == "Preparing" then
	gMarioStates[0].faceAngle.y = gMarioStates[0].intendedYaw
	if STRGST.STRSecondsDelay < 2 then
	STRGST.STRCountdown = STRGST.STRCDNumber
	end
	
	if STRGST.STRStartingType == 1 then
	if STRGST.STRSecondsDelay < 29 and STRGST.STRIntermission >= 1 then
	STRGST.STRSecondsDelay = STRGST.STRSecondsDelay + 1
	elseif STRGST.STRIntermission <= 1 and STRGST.STRSecondsDelay < 89 then
	STRGST.STRSecondsDelay = STRGST.STRSecondsDelay + 1
	STRGST.STRIntermission = 0
	end
	
	if STRGST.STRIntermission >= 0 and STRGST.STRSecondsDelay == 29 then
		STRGST.STRIntermission = STRGST.STRIntermission - 1 / 30
	end
	
	if STRGST.STRCountdown >= 1.01 and STRGST.STRIntermission < 2 and STRGST.STRSecondsDelay == 89 then
		STRGST.STRCountdown = STRGST.STRCountdown - 1 / 30
	elseif STRGST.STRCountdown <= 1.01 and STRGST.STRIntermission == 0 and STRGST.STRSecondsDelay == 89 then
		STRGST.STRGameState = "Started"
		end
	end
	
	if STRGST.STRStartingType == 2 then
	if STRGST.STRSecondsDelay < 29 and STRGST.STRIntermission >= 1 then
	STRGST.STRSecondsDelay = STRGST.STRSecondsDelay + 1
	elseif STRGST.STRIntermission <= 1 then
	STRGST.STRIntermission = 0
	end
	
	if STRGST.STRIntermission >= 1 and STRGST.STRSecondsDelay == 29 then
		STRGST.STRIntermission = STRGST.STRIntermission - 1 / 30
	end
	
	if STRGST.STRIntermission < 1 and STRGST.STRSecondsDelay == 29 then
	STRGST.STRGameState = "Started"
		end
	end
	
	if STRGST.STRStartingType == 3 then
	STRGST.STRIntermission = 0
	if STRGST.STRSecondsDelay < 59 and STRGST.STRIntermission == 0 then
	STRGST.STRSecondsDelay = STRGST.STRSecondsDelay + 1
	end
	
	if STRGST.STRCountdown >= 1.01 and STRGST.STRIntermission == 0 and STRGST.STRSecondsDelay == 59 then
		STRGST.STRCountdown = STRGST.STRCountdown - 1 / 30
	elseif STRGST.STRCountdown <= 1.01 and STRGST.STRSecondsDelay == 59 then
		STRGST.STRGameState = "Started"
		end
	end
		
	if STRGST.STRStartingType == 4 then
	STRGST.STRGameState = "Started"
		end
	end
	
	if STRGST.STRGameState == "Started" then
		STRGST.STRGlobalTimer = STRGST.STRGlobalTimer + 1
    end
end

function str_utils_functions()
	if ((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") 
	or (STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) and STRGST.STRGameState == "Finished" then
	
	if STRGST.STRWarpCountdown >= 1 and network_is_server() then
	STRGST.STRWarpCountdown = STRGST.STRWarpCountdown - 1 / 30
	end
	
	if STRGST.STRWarpCountdown <= 1.1 then
	warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID)
	end
	if STRGST.STRWarpCountdown <= 1 then
	if (STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3) then
	STRGST.STRGameState = "Resetting"
	end
	if (STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") then
	STRGST.STRGameState = "Finish_Lobby"
		end
	end
	
	end
	
	if STRGST.STRGameState == "Started" and STRGST.VanillaCG == true and STRGST.STRGameMode == 1 and STRGST.SwitchIntro == true then
	
	if STRGST.STRIntroAction > 1 then 
		STRGST.STRIntroAction = STRGST.STRIntroAction - 1
		set_mario_action(gMarioStates[0], ACT_INTRO_CUTSCENE, 0)
	end
	
	end
	
	if STRGST.STRXPos == -1328 and STRGST.STRYPos == 260 and STRGST.STRZPos == 4664 then
	STRGST.VanillaCG = true
	else
	STRGST.VanillaCG = false
	end
	
	if STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" and STRGST.STRGameState == "Finished" and STRGST.STRFinishText > 1 then
	STRGST.STRFinishText = STRGST.STRFinishText - 1 / 30
	end
	
	if STRGST.STRGameMode ~= 4 then
	if (STRGST.STRGameState == "Preparing" and STRGST.STRForceSpot == "Disabled" and STRGST.STRGameMode == 1) or (STRGST.STRGameMode == 1 and STRGST.STRForceSpot == "Enabled") 
	or (STRGST.STRGlobalTimer < 6 and (STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) or (STRGST.STRStartingType == 4 and STRGST.STRGameMode == 1) and STRGST.STRGameState == "Lobby" then
	if STRGST.STRSpotUpdater > 4 then
	gMarioStates[0].pos.x = STRGST.STRXPos
	gMarioStates[0].pos.y = STRGST.STRYPos
	gMarioStates[0].pos.z = STRGST.STRZPos
	end
	end
	
	if STRGST.EnabledInteraction == true then
	if (STRGST.STRGlobalTimer < 1 and (STRGST.STRForceLevelType == "Levels" and gNetworkPlayers[0].currLevelNum ~= STRGST.STRLevelID)
	or (STRGST.STRForceLevelType == "Areas" and gNetworkPlayers[0].currAreaIndex ~= STRGST.STRAreaID)
	or (STRGST.STRForceLevelType == "Acts" and gNetworkPlayers[0].currActNum ~= STRGST.STRActID)) and STRGST.STRGameState == "Lobby" then
	warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID)
	end
	end
	end
	
	if STRMenuWarp then
		if STRGST.STRWarpType == "Level" then
		warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID)
		elseif STRGST.STRWarpType == "Start" then
		warp_to_start_level()
		end
		STRMenuWarp = false
		return true
	end
	
	if STRGST.STRGameMode ~= 4 then
	if (STRGST.STRGameState == "Preparing")
	or (STRGST.STRGlobalTimer == 1 and STRGST.STRGameState == "Started" and STRGST.STRStartingWarp == "Unused") then
	if STRGST.STRStartingWarp == "Unused" then
	STRGST.STRStartingWarp = "Used"
	end
	if STRGST.STRStartingWarp == "Used" then
		if STRGST.STRWarpType == "Level" then
		warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID)
		elseif STRGST.STRWarpType == "Start" then
		warp_to_start_level()
		end
		STRGST.STRStartingWarp = "Disable"
		end
		end
	end
	
	if STRGST.STRGlobalTimer == 0 then
	gMarioStates[0].health = 0x880
	gMarioStates[0].peakHeight = gMarioStates[0].pos.y
	gMarioStates[0].numLives = STRGST.STRSetLives
	end
	
	if ((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") 
	or (STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) and STRGST.STRGameState == "Lobby" then
	if STRGST.STRLFLevel == 28 or STRGST.CakeEnding == true then
	STRGST.STRWarpCountdown = 19
	else
	STRGST.STRWarpCountdown = 6
	end
	end
	
	if STRGST.STRBSFOption == "Disabled" then
	if STRGST.STRSFUpdater == true then
	STRGST.STRBackupSF = false
	STRGST.STRSFUpdater = false
	save_file_set_using_backup_slot(STRGST.STRBackupSF)
	update_all_mario_stars()
	end
	end
	
	if STRGST.STRBSFOption == "Enabled" and (STRGST.STRBackupSF == false or STRGST.STRBackupSF == true) then
	if STRGST.STRSFUpdater == false then
	STRGST.STRSFUpdater = true
	save_file_set_using_backup_slot(STRGST.STRBackupSF)
	update_all_mario_stars()
	end
	end
	
	if STRGST.STRGameMode == 3 and STRGST.CasualGM == "Enabled" and STRGST.STRGameState ~= "Paused" then
	STRGST.STRGameState = "Started"
	end
	
	if STRRules == "Enabled" and (STRGST.STRGameMode == 1 or STRGST.STRGameMode == 2) and (SM64Rules == true or STRCustomRules == true or STRGST.BuildInRomhacks == true) and STRGST.STRGameState == "Lobby" then
	if str_button_combo(gControllers[0], STRButtonBinds[STRRBinds1].button, STRButtonBinds[STRRBinds2].button, STRButtonBinds[STRRBinds3].button) then
	if STRRulesOpen == false then
	STRRulesOpen = true
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) 
	elseif STRRulesOpen == true then
	STRRulesOpen = false
	play_sound(SOUND_MENU_HAND_DISAPPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) 
	end
	end
	end
	
	if STRRules == "Enabled" and (STRGST.STRGameMode == 1 or STRGST.STRGameMode == 2) and (SM64Rules == false and STRCustomRules == false and STRGST.BuildInRomhacks == false) and STRGST.STRGameState ~= "Lobby" then
	if str_button_combo(gControllers[0], STRButtonBinds[STRRBinds1].button, STRButtonBinds[STRRBinds2].button, STRButtonBinds[STRRBinds3].button) then
	play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject) 
	end
	end
	
	if STRGST.CakeEnding == true and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and STRGST.STRGameState == "Started" then STRGST.STRGameState = "Finished" end
	
	if STRGST.BestTimeOption == "Saves" and STRGST.STRGameState == "Finished" and STRGST.BestTimeNumber == 0 then
	STRGST.BestTimeNumber = STRGST.STRGlobalTimer
	end
	
	if STRGST.BestTimeOption == "Saves" and STRGST.STRGameState == "Finished" and STRGST.BestTimeNumber ~= 0 and STRGST.BestTimeNumber >= STRGST.STRGlobalTimer then
	STRGST.BestTimeNumber = STRGST.STRGlobalTimer
	end
	
	if (STRGST.STRGameState == "Started" and STRGST.STRGameMode == 4 and (gNetworkPlayers[0].currLevelNum ~= STRLevels[STRGST.STRSSLevelID].STRLID)) then
	if not (gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_1 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_2 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3) then
	warp_to_level(STRLevels[STRGST.STRSSLevelID].STRLID, STRGST.STRSSAreaID, STRGST.STRSSActID)
	end
	end
end

function str_single_stars_main()
	if str_button_combo(gControllers[0], STRButtonBinds[STRSBinds1].button, STRButtonBinds[STRSBinds2].button, STRButtonBinds[STRSBinds3].button) and network_is_server()
	and STRGST.STRGameMode == 4 and STRGST.STRGameState ~= "Lobby" then
	STRGST.STRGameState = "Started" STRGST.STRSSWarp = 3 STRGST.STRSSText = 300 STRGST.STRSSCollectedStar = STRGST.STRSSSetStars STRGST.STRGlobalTimer = 0 gMarioStates[0].health = 0x880
	end
	
	if STRGST.STRGameState == "Started" and STRGST.STRGameMode == 4 then
	
	if STRGST.STRSSWarp >= 1 then
	STRGST.STRSSWarp = STRGST.STRSSWarp - 1
	warp_to_level(STRLevels[STRGST.STRSSLevelID].STRLID, STRGST.STRSSAreaID, STRGST.STRSSActID)
	end
	
	if STRGST.STRSSWarp == 0 then
	if (STRGST.STRSSType == 1 and STRGST.STRSSCollectedStar < 1)
	or (STRGST.STRSSType == 6 and (gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_1 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_2 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3)) 
	or (STRGST.STRSSType == 7 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING) 
	or (STRGST.STRSSType == 8 and (save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP) ~= 0) 
	or (STRGST.STRSSType == 9 and (save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP) ~= 0)
	or (STRGST.STRSSType == 10 and (save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP) ~= 0) then
	STRGST.STRGameState = "Finished"
	end
	end
	end
	
	if STRGST.STRSSWarp ~= 0 then
	if (STRGST.STRSSType == 8 or STRGST.STRSSType == 9 or STRGST.STRSSType == 10) and STRGST.STRGameMode == 4 then
	save_file_clear_flags(SAVE_FLAG_HAVE_WING_CAP)
	save_file_clear_flags(SAVE_FLAG_HAVE_METAL_CAP)
    save_file_clear_flags(SAVE_FLAG_HAVE_VANISH_CAP)
	end
	end
end

function str_single_stars_interact(m, o, type)
	if STRGST.STRGameMode ~= 4 and get_id_from_behavior(o.behavior) == id_bhvGrandStar and STRGST.GrandStar == true and STRGST.STRGameState == "Started" then STRGST.STRGameState = "Finished" end

	if STRGST.STRGameState == "Started" and STRGST.STRGameMode == 4 then
	if STRGST.STRSSType == 1 and (type == INTERACT_STAR_OR_KEY and get_id_from_behavior(o.behavior) ~= id_bhvBowserKey) and STRGST.STRSSCollectedStar ~= 0 then
	STRGST.STRSSCollectedStar = STRGST.STRSSCollectedStar - 1
	end
	
	if (STRGST.STRSSType == 2 and (type == INTERACT_STAR_OR_KEY and o.oBehParams == STRGST.STRSSCollectedStar - 1 << 24))
	or (STRGST.STRSSType == 3 and get_id_from_behavior(o.behavior) == id_bhvBowserKey and gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_1)
	or (STRGST.STRSSType == 4 and get_id_from_behavior(o.behavior) == id_bhvBowserKey and gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_2)
	or (STRGST.STRSSType == 5 and get_id_from_behavior(o.behavior) == id_bhvGrandStar) then
	STRGST.STRGameState = "Finished"
		end
	end
end

function str_level_functions_main()
	if STRGST.STRPluginsCheck == false and STRGST.BuildInRomhacks == false then
	saveflag, m, Star, NP = save_file_get_flags(), gMarioStates[0], INTERACT_STAR_OR_KEY, gNetworkPlayers[0]
	if STRGST.STRGameState == "Lobby" then
	STRGST.STRLFTimer = STRGST.STRLFSetTimer
	end
	
	StarsFunctions = ((STRGST.STRLFStars == 1 and m.numStars >= STRGST.STRLFLimit)
	or (STRGST.STRLFStars == 3 and (saveflag & STRLFB[STRGST.STRLFBehavior].ID) ~= 0 and STRLFB[STRGST.STRLFBehavior].Interact == false) 
	or (STRGST.STRLFStars == 5 and (saveflag & STRLFB[STRGST.STRLFBehavior].ID) ~= 0 and STRLFB[STRGST.STRLFBehavior].Interact == false and m.numStars >= STRGST.STRLFLimit))
	
	LevelsFunctions = ((STRGST.STRLFLevels == 1 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID)
	or (STRGST.STRLFLevels == 2 and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 3 and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 4 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 5 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 6 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea and NP.currActNum == STRGST.STRLFAct))
	
	ActionsTimerFunctions = (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer > 0 and network_is_server())
	ActionsFunctions = ((STRGST.STRLFActions == 1 and m.action == STRActions[STRGST.STRLFAction].A_ID)
	or (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer <= 0))
	
	PositionsFunctions = ((STRGST.STRLFPositions == 1 and m.pos.x == STRGST.STRLFXPos) 
	or (STRGST.STRLFPositions == 2 and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 3 and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 4 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 5 and m.pos.x == STRGST.STRLFXPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 6 and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos) 
	or (STRGST.STRLFPositions == 7 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 8 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos)
	or (STRGST.STRLFPositions == 9 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos) 
	or (STRGST.STRLFPositions == 10 and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos)
	or (STRGST.STRLFPositions == 11 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEXPos) 
	or (STRGST.STRLFPositions == 12 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEYPos)
	or (STRGST.STRLFPositions == 13 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos) 
	or (STRGST.STRLFPositions == 14 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFZPos))

	if STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then
	
	if (StarsFunctions and STRGST.STRRunsTypes == 1) 
	or (LevelsFunctions and STRGST.STRRunsTypes == 2) 
	or (ActionsFunctions and STRGST.STRRunsTypes == 3)
	or (PositionsFunctions and STRGST.STRRunsTypes == 4) 
	or (StarsFunctions and LevelsFunctions and STRGST.STRRunsTypes == 5)
	or (StarsFunctions and ActionsFunctions and STRGST.STRRunsTypes == 6)
	or (StarsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 7)
	or (LevelsFunctions and ActionsFunctions and STRGST.STRRunsTypes == 8)
	or (LevelsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 9)
	or (ActionsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 10)
	or (StarsFunctions and LevelsFunctions and ActionsFunctions and STRGST.STRRunsTypes == 11)
	or (StarsFunctions and LevelsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 12)
	or (StarsFunctions and ActionsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 13)
	or (LevelsFunctions and ActionsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 14)
	or (StarsFunctions and LevelsFunctions and ActionsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 15) then
	STRGST.STRGameState = "Finished"
	end
	
	if (ActionsTimerFunctions and STRGST.STRRunsTypes == 3)
	or (StarsFunctions and ActionsTimerFunctions and STRGST.STRRunsTypes == 7)
	or (LevelsFunctions and ActionsTimerFunctions and STRGST.STRRunsTypes == 9)
	or (ActionsTimerFunctions and PositionsFunctions and STRGST.STRRunsTypes == 10)
	or (StarsFunctions and LevelsFunctions and ActionsTimerFunctions and STRGST.STRRunsTypes == 11)
	or (StarsFunctions and ActionsTimerFunctions and PositionsFunctions and STRGST.STRRunsTypes == 13)
	or (LevelsFunctions and ActionsTimerFunctions and PositionsFunctions and STRGST.STRRunsTypes == 14)
	or (StarsFunctions and LevelsFunctions and ActionsTimerFunctions and PositionsFunctions and STRGST.STRRunsTypes == 15) then
	gGlobalSyncTable.LRLevelActionTimer = gGlobalSyncTable.LRLevelActionTimer - 1
		end
	end
	end
end

function str_level_functions_interact(m, o, type)
	if STRGST.STRPluginsCheck == false and STRGST.BuildInRomhacks == false then
	saveflag, Star, BehavID, StarID, NP = save_file_get_flags(), INTERACT_STAR_OR_KEY, get_id_from_behavior(o.behavior), o.oBehParams, gNetworkPlayers[0]
	
	StarsInteractFunctions = ((STRGST.STRLFStars == 2 and type == Star and StarID == STRGST.STRLFID - 1 << 24)
	or (STRGST.STRLFStars == 3 and BehavID == STRLFB[STRGST.STRLFBehavior].ID and STRLFB[STRGST.STRLFBehavior].Interact == true) 
	or (STRGST.STRLFStars == 4 and m.numStars >= STRGST.STRLFLimit and type == Star and StarID == STRGST.STRLFID - 1 << 24)
	or (STRGST.STRLFStars == 5 and BehavID == STRLFB[STRGST.STRLFBehavior].ID and STRLFB[STRGST.STRLFBehavior].Interact == true and m.numStars >= STRGST.STRLFLimit) 
	or (STRGST.STRLFStars == 6 and type == Star and StarID == STRGST.STRLFID - 1 << 24 and ((BehavID == STRLFB[STRGST.STRLFBehavior].ID and STRLFB[STRGST.STRLFBehavior].Interact == true) 
	or (saveflag & STRLFB[STRGST.STRLFBehavior].ID) ~= 0 and STRLFB[STRGST.STRLFBehavior].Interact == false)))
	
	LevelsFunctions = ((STRGST.STRLFLevels == 1 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID)
	or (STRGST.STRLFLevels == 2 and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 3 and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 4 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 5 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 6 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea and NP.currActNum == STRGST.STRLFAct))
	
	ActionsTimerFunctions = (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer > 0 and network_is_server())
	ActionsFunctions = ((STRGST.STRLFActions == 1 and m.action == STRActions[STRGST.STRLFAction].A_ID)
	or (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer <= 0))
	
	PositionsFunctions = ((STRGST.STRLFPositions == 1 and m.pos.x == STRGST.STRLFXPos) 
	or (STRGST.STRLFPositions == 2 and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 3 and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 4 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 5 and m.pos.x == STRGST.STRLFXPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 6 and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos) 
	or (STRGST.STRLFPositions == 7 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 8 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos)
	or (STRGST.STRLFPositions == 9 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos) 
	or (STRGST.STRLFPositions == 10 and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos)
	or (STRGST.STRLFPositions == 11 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEXPos) 
	or (STRGST.STRLFPositions == 12 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEYPos)
	or (STRGST.STRLFPositions == 13 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos) 
	or (STRGST.STRLFPositions == 14 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFZPos))
	
	if STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then
	
	if (StarsInteractFunctions and STRGST.STRRunsTypes == 1) 
	or (StarsInteractFunctions and LevelsFunctions and STRGST.STRRunsTypes == 5)
	or (StarsInteractFunctions and ActionsFunctions and STRGST.STRRunsTypes == 6)
	or (StarsInteractFunctions and PositionsFunctions and STRGST.STRRunsTypes == 7)
	or (StarsInteractFunctions and LevelsFunctions and ActionsFunctions and STRGST.STRRunsTypes == 11)
	or (StarsInteractFunctions and LevelsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 12)
	or (StarsInteractFunctions and LevelsFunctions and ActionsFunctions and PositionsFunctions and STRGST.STRRunsTypes == 14) then
	STRGST.STRGameState = "Finished"
	end
	
	end
	end
end
