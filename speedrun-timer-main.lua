if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Timers
gGlobalSyncTable.startglobaltimer = 0
gGlobalSyncTable.startcountdown = 0
gGlobalSyncTable.GoTimer = 0
gGlobalSyncTable.timercountdown = 5 * 30
gServerSettings.skipIntro = 1

gGlobalSyncTable.RunStarting = false -- This checks if the Run is started or not
gGlobalSyncTable.beatedGame = false
gGlobalSyncTable.startTimer = false
gGlobalSyncTable.CountdownCheck = false
gGlobalSyncTable.IntroSettings = "Disabled"
gGlobalSyncTable.EnabledIntro = false
gGlobalSyncTable.Intermission = false
gGlobalSyncTable.IntroCheck = 0
gGlobalSyncTable.Intercountdown = 6
gGlobalSyncTable.PracticeWarpTimer = 6

-- Gamemodes
gGlobalSyncTable.FinishedRunTextChange = 150
gGlobalSyncTable.NormalWarpSetting = "Disabled"
gGlobalSyncTable.NormalWarp = false
gGlobalSyncTable.NormalWarpTimer = 6
gGlobalSyncTable.PracticeWarp = false
gGlobalSyncTable.PracticeWarpTimer = 6
gGlobalSyncTable.CasualTimer = false
gGlobalSyncTable.CasualWarp = false
gGlobalSyncTable.CasualWarpTimer = 6
gGlobalSyncTable.SingleStarsMode = false
gGlobalSyncTable.SingleStarsWarp = 4
gGlobalSyncTable.SingleStarsStopTimer = "Amount Limit"
gGlobalSyncTable.SingleStarsAreaID = 1
gGlobalSyncTable.SingleStarsActID = 1
gGlobalSyncTable.SingleStarsStarNumbers = 1
gGlobalSyncTable.SingleStarsCollectedStar = 1
gGlobalSyncTable.SingleStarsTextChange = 0

-- Teams
gGlobalSyncTable.SpeedrunTeams = false
gGlobalSyncTable.TeamRedsavefile = false
gGlobalSyncTable.TeamBluesavefile = false

-- Other Functions
gGlobalSyncTable.set_warp = false
gGlobalSyncTable.Cheated = false
gGlobalSyncTable.ResettingTimer = false
gGlobalSyncTable.ResetTimer = 5
gGlobalSyncTable.ResetSaveCheck = false
gGlobalSyncTable.ResetSave = 10
gGlobalSyncTable.set_countdown_numbers = false
gGlobalSyncTable.timer_popup = false
gGlobalSyncTable.anti_cheat = false
gGlobalSyncTable.countdown_display_check = 31
gGlobalSyncTable.backupslot = false
gGlobalSyncTable.LivesNumber = 0
gGlobalSyncTable.lives_update = 0
IndicatorDisplay = 0
set_warp_check = false
set_warp_position = false
startTimerbutton = false
UpdateStarCounter = false
UpdateTeamsStarCounter = false

gGlobalSyncTable.IntermissionSound = false
gGlobalSyncTable.IntermissionSoundWarp = 0
gGlobalSyncTable.CountdownSound = 0
gGlobalSyncTable.GoSound = false
gGlobalSyncTable.GoSoundWarp = 0

function Normal_Mario_Update_Functions(m)
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.SingleStarsMode == false then
	-- This starts the run when inputting it
	if gGlobalSyncTable.StartingSettings == "Both" then
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startcountdown > 0 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
			end
		end
	end
	
	if gGlobalSyncTable.StartingSettings == "Intermission" then
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.Intercountdown > 1 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
			end
		end
	end
	
	if gGlobalSyncTable.StartingSettings == "Countdown" then
	if gGlobalSyncTable.startcountdown > 0 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
			end
		end
	end
	
	if MenuOptionSetting == "Buttons" and network_is_server() then

	if (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not startTimerbutton then 
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.Intermission = true
		gGlobalSyncTable.RunStarting = true
		startTimerbutton = true
		end
	end
	
	if (gGlobalSyncTable.StartingSettings == "Countdown" or gGlobalSyncTable.StartingSettings == "None") then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not startTimerbutton then 
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.RunStarting = true
		startTimerbutton = true
		end
	end
	
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer == false then 
		gGlobalSyncTable.startTimer = true
	elseif (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer then 
		gGlobalSyncTable.startTimer = false
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & Y_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResettingTimer = true
		end
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & START_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResetSaveCheck = true
		end
	end
	end
end

function Normal_Update_Functions()
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.SingleStarsMode == false then
	
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.NormalWarpTimer >= 1 and network_is_server() then
	gGlobalSyncTable.NormalWarpTimer = gGlobalSyncTable.NormalWarpTimer - 1 / 30
	end
	
	if gGlobalSyncTable.NormalWarpSetting == "Enabled" then
	if gGlobalSyncTable.NormalWarpTimer <= 1 then
	gGlobalSyncTable.NormalWarp = true
	end
	
	if gGlobalSyncTable.NormalWarp == true then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	gGlobalSyncTable.NormalWarp = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.NormalWarpTimer = 6
	return true
	end
	
	end
	
	for unsupportedromhacks in pairs(gActiveMods) do
	if gActiveMods[unsupportedromhacks].incompatible ~= nil and gActiveMods[unsupportedromhacks].incompatible:find("romhack") then
	DisableIntro = true
	gGlobalSyncTable.IntroSettings = "Disabled"
	gGlobalSyncTable.EnabledIntro = false
		end
	end
	
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.FinishedRunTextChange >= 1 and network_is_server() then
	gGlobalSyncTable.FinishedRunTextChange = gGlobalSyncTable.FinishedRunTextChange - 1
	end	
	
	end

	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.SingleStarsMode == false and gGlobalSyncTable.EnabledIntro == true then
	
	if gGlobalSyncTable.EnabledIntro == true then
	switched = false
	hasConfirmed = true

	if gGlobalSyncTable.IntroCheck < 5 and gGlobalSyncTable.startTimer then 
		gGlobalSyncTable.IntroCheck = gGlobalSyncTable.IntroCheck + 1
		set_mario_action(gMarioStates[0], ACT_INTRO_CUTSCENE, 0)
	end
	
	if (gGlobalSyncTable.timercountdown == 30) and gGlobalSyncTable.GoTimer <= 29 and network_is_server() then
	gGlobalSyncTable.GoTimer = gGlobalSyncTable.GoTimer + 1
	end
	
	-- Basic timer from the speedrun timer but doesn't effect the other commands
	-- But It would be part of the restart speedrun command as well (it's because having it's own function gotta take forever, so I just remove it)
	if network_is_server() then
    if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.timercountdown = 30
	gGlobalSyncTable.Intercountdown = 0
		if not (gGlobalSyncTable.startTimer == false or gGlobalSyncTable.Cheated or gGlobalSyncTable.beatedGame) then
            gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
			end
        end
		end
    end
	end
end

function Practice_Mario_Update_Functions(m)
	if gGlobalSyncTable.GamemodeSetting == "PracticeRun" and gGlobalSyncTable.SingleStarsMode == false then
	
	-- This starts the run when inputting it
	if MenuOptionSetting == "Buttons" and network_is_server() then
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not startTimerbutton then 
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.RunStarting = true
		startTimerbutton = true
	end

	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.startTimer == false then 
		gGlobalSyncTable.startTimer = true
	elseif (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.startTimer then 
		gGlobalSyncTable.startTimer = false
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & Y_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResettingTimer = true
		end
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & START_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResetSaveCheck = true
		end
	end
	end
end

function Practice_Update_Functions()	
	if gGlobalSyncTable.GamemodeSetting == "PracticeRun" and gGlobalSyncTable.SingleStarsMode == false then
	
	if (gGlobalSyncTable.timercountdown == 30) and gGlobalSyncTable.GoTimer <= 29 and network_is_server() then
	gGlobalSyncTable.GoTimer = gGlobalSyncTable.GoTimer + 1
	end
	
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.PracticeWarpTimer >= 1 and network_is_server() then
	gGlobalSyncTable.PracticeWarpTimer = gGlobalSyncTable.PracticeWarpTimer - 1 / 30
	end
	
	if gGlobalSyncTable.PracticeWarpTimer <= 1 then
	gGlobalSyncTable.PracticeWarp = true
	gGlobalSyncTable.ResettingTimer = true
	end
	
	if gGlobalSyncTable.PracticeWarp == true then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	gGlobalSyncTable.PracticeWarp = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.PracticeWarpTimer = 6
	return true
	end
	
	if network_is_server() then
    if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.Intercountdown = 0
	gGlobalSyncTable.timercountdown = 30
		if not (gGlobalSyncTable.startTimer == false or gGlobalSyncTable.Cheated or gGlobalSyncTable.beatedGame) then
            gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
			end
        end
    end
	end
end

function Casual_Mario_Update_Functions(m)
	if gGlobalSyncTable.GamemodeSetting == "Casual" and gGlobalSyncTable.SingleStarsMode == false then
	
	if MenuOptionSetting == "Buttons" and network_is_server() then
	
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.CasualTimer == false then 
		gGlobalSyncTable.CasualTimer = true
	elseif (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.CasualTimer then 
		gGlobalSyncTable.CasualTimer = false
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & Y_BUTTON) ~= 0)) then
		gGlobalSyncTable.startglobaltimer = 0
		gGlobalSyncTable.TeamsCheck = false
		end
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & START_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResetSaveCheck = true
		end
	end
	end
end

function Casual_Update_Functions()
	if gGlobalSyncTable.GamemodeSetting == "Casual" and gGlobalSyncTable.SingleStarsMode == false then
	-- This Start the Timer everytime you make a room
	if network_is_server() then
    if gGlobalSyncTable.CasualTimer == true then
	if not (gGlobalSyncTable.beatedGame or gGlobalSyncTable.CasualTimer == false) then
	gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
			end
		end
    end
	
	if gGlobalSyncTable.GamemodeSetting == "Casual" and gGlobalSyncTable.SingleStarsMode == false then
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.CasualWarpTimer >= 1 and network_is_server() then
	gGlobalSyncTable.CasualWarpTimer = gGlobalSyncTable.CasualWarpTimer - 1 / 30
	end
	
	if gGlobalSyncTable.CasualWarpTimer <= 1 then
	gGlobalSyncTable.CasualWarp = true
	gGlobalSyncTable.ResettingTimer = true
	end
	
	if gGlobalSyncTable.CasualWarp == true then
	warp_to_level(gGlobalSyncTable.LevelIdNumber, gGlobalSyncTable.AreaNumber, gGlobalSyncTable.ActNumber)
	gGlobalSyncTable.CasualWarp = false
	gGlobalSyncTable.CasualWarpTimer = 6
	return true
		end
	end
	end
end

function SingleStars_Main_Function()
	if gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then return end
		
	if gGlobalSyncTable.SingleStarsMode == true and gGlobalSyncTable.SingleStarsWarp >= 1 then
	gGlobalSyncTable.SingleStarsWarp = gGlobalSyncTable.SingleStarsWarp - 1
	end
	
	if gGlobalSyncTable.SingleStarsMode == true and gGlobalSyncTable.SingleStarsWarp >= 1 and SingleStarsLevelsTable[gGlobalSyncTable.SSLevels].SSlevelname then
	warp_to_level(SingleStarsLevelsTable[gGlobalSyncTable.SSLevels].SSlevelid, gGlobalSyncTable.SingleStarsAreaID, gGlobalSyncTable.SingleStarsActID)
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Bowser Arenas" and not gGlobalSyncTable.beatedGame then
	if gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_1 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_2 or gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3 then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" and not gGlobalSyncTable.beatedGame then
	if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" and not gGlobalSyncTable.beatedGame then
	if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
	gGlobalSyncTable.beatedGame = true
	elseif save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then
	gGlobalSyncTable.beatedGame = true
	elseif save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then
	gGlobalSyncTable.beatedGame = true
	end
	end
end

function SingleStars_Interaction(m, o, interactType)
	if gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then return end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" and not gGlobalSyncTable.beatedGame then
	if (interactType == INTERACT_STAR_OR_KEY and get_id_from_behavior(o.behavior) ~= id_bhvBowserKey) and gGlobalSyncTable.SingleStarsCollectedStar ~= 0 then
	gGlobalSyncTable.SingleStarsCollectedStar = gGlobalSyncTable.SingleStarsCollectedStar - 1
	end
	
	if gGlobalSyncTable.SingleStarsCollectedStar == 0 then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Star ID" and not gGlobalSyncTable.beatedGame then
	if interactType == INTERACT_STAR_OR_KEY and o.oBehParams == gGlobalSyncTable.SingleStarsStarNumbers - 1 << 24 then
	gGlobalSyncTable.beatedGame = true
	
	end
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Key 1/2" and not gGlobalSyncTable.beatedGame then
	if get_id_from_behavior(o.behavior) == id_bhvBowserKey then
	gGlobalSyncTable.beatedGame = true
	end
	end
	
	if gGlobalSyncTable.SingleStarsStopTimer == "Grand Star" and not gGlobalSyncTable.beatedGame then
	if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
    gGlobalSyncTable.beatedGame = true
	end
	end
end

function SingleStars_Update_Functions()
	local m = gMarioStates[0]
	
	if (gGlobalSyncTable.GamemodeSetting ~= "SingleStars" or gGlobalSyncTable.EnabledIntro ~= false) then return end
	
	if gGlobalSyncTable.beatedGame and gGlobalSyncTable.SingleStarsTextChange >= 1 and network_is_server() then
	gGlobalSyncTable.SingleStarsTextChange = gGlobalSyncTable.SingleStarsTextChange - 1
	end
	
	-- This Start the Timer everytime you make a room
	if network_is_server() then
    if gGlobalSyncTable.SingleStarsMode == true then
	if not gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
			end
		end
    end
end

function Starting_Update_Functions()
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.SingleStarsMode == false and gGlobalSyncTable.EnabledIntro == false then
	-- Update The Countdown Number
	if not gGlobalSyncTable.Intermission then
    if (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
    if (gGlobalSyncTable.startTimer and gGlobalSyncTable.Intercountdown < 0) then
		if not gGlobalSyncTable.set_countdown_numbers then
		gGlobalSyncTable.timercountdown = 5 * 30
		end
        gGlobalSyncTable.beatedGame = false
		end
		end
	end
	
	-- Main Timer Function
	if (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	if network_is_server() and gGlobalSyncTable.Intermission and gGlobalSyncTable.Intercountdown > 0 then
	gGlobalSyncTable.Intercountdown = gGlobalSyncTable.Intercountdown - 1 / 30
	end
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer < 0.1 then
	gMarioStates[0].faceAngle.y = gMarioStates[0].intendedYaw
	end
	if gMarioStates[0].action == ACT_READING_NPC_DIALOG and gGlobalSyncTable.Intercountdown < 0 then 
	set_mario_action(gMarioStates[0], ACT_IDLE, 0)
    end
	end
	
	if gGlobalSyncTable.Intercountdown <= 0 then
	if gGlobalSyncTable.Intermission and (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	gGlobalSyncTable.startTimer = true
	gGlobalSyncTable.Intermission = false
	end
	end
	
	if (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Countdown") and gGlobalSyncTable.startglobaltimer == 0 then
	gGlobalSyncTable.CountdownCheck = true
	if gGlobalSyncTable.startcountdown == 1.0 then
	gGlobalSyncTable.CountdownCheck = false
		end
	end
	
	if (gGlobalSyncTable.StartingSettings == "Intermission" or gGlobalSyncTable.StartingSettings == "None") then
	gGlobalSyncTable.CountdownCheck = false
	end
	
	if gGlobalSyncTable.startTimer and (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Countdown") then
	if gGlobalSyncTable.countdown_display_check > 0 and network_is_server() then
	gGlobalSyncTable.countdown_display_check = gGlobalSyncTable.countdown_display_check - 1
		end
	end
	
	if (gGlobalSyncTable.timercountdown == 30) and gGlobalSyncTable.GoTimer <= 29 and network_is_server() then
	gGlobalSyncTable.GoTimer = gGlobalSyncTable.GoTimer + 1
	end
	
	if gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Countdown" then
        if gGlobalSyncTable.timercountdown > 30 and network_is_server() and gGlobalSyncTable.startTimer then
            gGlobalSyncTable.timercountdown = gGlobalSyncTable.timercountdown - 1
            gGlobalSyncTable.startcountdown = gGlobalSyncTable.timercountdown / 30
            gGlobalSyncTable.startglobaltimer = 0
		end
	end
	
		if network_is_server() and gGlobalSyncTable.startTimer then
		gGlobalSyncTable.Intercountdown = 0
				
		if (gGlobalSyncTable.StartingSettings == "Intermission" or gGlobalSyncTable.StartingSettings == "None") then
		gGlobalSyncTable.timercountdown = 30
		end
			-- This stops the timer but make sure this doesn't unpause if the run is finished
		if not (gGlobalSyncTable.startTimer == false or gGlobalSyncTable.Cheated or gGlobalSyncTable.beatedGame or gGlobalSyncTable.CountdownCheck) then
               gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
		end
	end
	end
end

function Extra_Mario_Update_Functions(m)
	-- This Checks if you're not using romhacks
	for vanilla_mario_64 in pairs(gActiveMods) do
	if gActiveMods[vanilla_mario_64].incompatible ~= nil and gActiveMods[vanilla_mario_64].incompatible:find("romhack") then
	gGlobalSyncTable.SuperMario64 = false
		end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.RunStarting == false then
	gGlobalSyncTable.IntermissionSound = false
	gGlobalSyncTable.IntermissionSoundWarp = 0
	gGlobalSyncTable.GoSound = false
	gGlobalSyncTable.GoSoundWarp = 0
	elseif gGlobalSyncTable.GamemodeSetting ~= "Normal" and gGlobalSyncTable.RunStarting == false then
	gGlobalSyncTable.IntermissionSound = true
	gGlobalSyncTable.IntermissionSoundWarp = 0
	gGlobalSyncTable.GoSound = false
	gGlobalSyncTable.GoSoundWarp = 0
	end
	
	-- The Classic X button for starting a speedrun, I also included extra buttons as well
	if moveset_is_check or other_moveset_mods then
	MenuOptionSetting = "Menu"
	end
	
	-- Make sure people doesn't start with low health and doesn't take damage when starting the timer
	if gGlobalSyncTable.startglobaltimer == 0 then
		m.health = 0x880
		m.peakHeight = m.pos.y
	if gGlobalSyncTable.lives_update == 2 then
		gMarioStates[0].numLives = gGlobalSyncTable.LivesNumber
		end
	end
	
	-- Bingo Mod by Blocky --
	-- Separate teams on differents savefiles
	if not gGlobalSyncTable.SpeedrunTeams then
	gGlobalSyncTable.TeamRedsavefile = false
	gGlobalSyncTable.TeamBluesavefile = false
	save_file_set_using_backup_slot(gGlobalSyncTable.backupslot)
	if gGlobalSyncTable.backupslot == true and UpdateStarCounter == false then
	update_all_mario_stars()
	UpdateStarCounter = true
	elseif gGlobalSyncTable.backupslot == false and UpdateStarCounter == false then
	update_all_mario_stars()
	UpdateStarCounter = true
	end
	end
	
	if gGlobalSyncTable.SpeedrunTeams then
	if gPlayerSyncTable[0].TeamColors == 1 then
	 gGlobalSyncTable.TeamRedsavefile = true
	 gGlobalSyncTable.TeamBluesavefile = false
	if gGlobalSyncTable.TeamRedsavefile and UpdateTeamsStarCounter == false then	
       save_file_set_using_backup_slot(false)
	   update_all_mario_stars()
	   UpdateTeamsStarCounter = true
		end
	end
	
	if gPlayerSyncTable[0].TeamColors == 2 then
	gGlobalSyncTable.TeamBluesavefile = true
	gGlobalSyncTable.TeamRedsavefile = false
	if gGlobalSyncTable.TeamBluesavefile and UpdateTeamsStarCounter == false then	
        save_file_set_using_backup_slot(true)
		update_all_mario_stars()
		UpdateTeamsStarCounter = true
		end
    end
	
    if gPlayerSyncTable[0].TeamColors ~= 2 and gPlayerSyncTable[0].TeamColors ~= 1 then
	if math.random(1, 2) == 1 then
	   gPlayerSyncTable[0].TeamColors = 1
	else
	   gPlayerSyncTable[0].TeamColors = 2
		end
	end
	end
end

function Extra_Update_Functions()
	-- Sounds
	if gGlobalSyncTable.GamemodeSetting == "Normal" and (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	if (gGlobalSyncTable.RunStarting == true and gGlobalSyncTable.IntermissionSound == false and gGlobalSyncTable.IntermissionSoundWarp == 2) then
	if FanfareTable[FanfareDefault].fanfare_sound == "Normal" then
		play_race_fanfare()
			end
		end
	end
	
	if gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.CountdownSound == 29 then
		if CountdownTable[CountdownDefault].countdown_sound == "Normal" then
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif CountdownTable[CountdownDefault].countdown_sound == "ReversePause" then
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif CountdownTable[CountdownDefault].countdown_sound == "ShortStar" then
		play_sound(SOUND_GENERAL_SHORT_STAR, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif CountdownTable[CountdownDefault].countdown_sound == "SwitchTickSpeed" then
		play_sound(SOUND_GENERAL2_SWITCH_TICK_FAST, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif CountdownTable[CountdownDefault].countdown_sound == "StarSound" then
		play_sound(SOUND_MENU_STAR_SOUND, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end
	
	if GoTable[GoDefault].go_sound == "Normal" and gGlobalSyncTable.GoSound == false and gGlobalSyncTable.GoSoundWarp == 2 and gGlobalSyncTable.startglobaltimer < 5 then
		play_sound(SOUND_GENERAL_RACE_GUN_SHOT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end

	-- Sounds Functions
	if (gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.startglobaltimer == 0) and (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") then
	if (gGlobalSyncTable.RunStarting == true and gGlobalSyncTable.IntermissionSound == false) then
		if gGlobalSyncTable.IntermissionSoundWarp < 3 and network_is_server() then
		gGlobalSyncTable.IntermissionSoundWarp = gGlobalSyncTable.IntermissionSoundWarp + 1
		end
		if gGlobalSyncTable.IntermissionSoundWarp > 2 then
		gGlobalSyncTable.IntermissionSound = true
		end
		end
	end

	if gGlobalSyncTable.startcountdown > 1.99 and gGlobalSyncTable.startTimer and gGlobalSyncTable.CountdownCheck and network_is_server() then
		gGlobalSyncTable.CountdownSound = gGlobalSyncTable.CountdownSound + 1
	if gGlobalSyncTable.CountdownSound > 29 then 
		gGlobalSyncTable.CountdownSound = 0
		end
	end
	
	if gGlobalSyncTable.startTimer == true and gGlobalSyncTable.timercountdown == 30 then
	if (gGlobalSyncTable.RunStarting == true and gGlobalSyncTable.GoSound == false) then
	if gGlobalSyncTable.GoSoundWarp < 3 and network_is_server() then
		gGlobalSyncTable.GoSoundWarp = gGlobalSyncTable.GoSoundWarp + 1
		end
		if gGlobalSyncTable.GoSoundWarp > 2 then
		gGlobalSyncTable.GoSound = true
		end
	end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" or gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
	if (gGlobalSyncTable.beatedGame and gGlobalSyncTable.TimeRecordOption == true) and not gGlobalSyncTable.timer_popup then
	djui_popup_create_global("Your Time: " .. string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds)) .. "\n\nRecord Time: " .. string.format("%s:%s:%s.%s", string.format("%d", gGlobalSyncTable.HoursRecord), string.format("%02d", gGlobalSyncTable.MinutesRecord), string.format("%02d", gGlobalSyncTable.SecondsRecord), string.format("%03d", gGlobalSyncTable.MilliSecondsRecord)), 3)
	gGlobalSyncTable.timer_popup = true
		end
	end

	if gGlobalSyncTable.lives_update == 1 then
	gGlobalSyncTable.LivesNumber = gGlobalSyncTable.LivesNumber + gMarioStates[0].numLives
	end

	if gGlobalSyncTable.lives_update < 2 and network_is_server() then
        gGlobalSyncTable.lives_update = gGlobalSyncTable.lives_update + 1
    end	
	
	if indicatormods then
	if IndicatorDisplay >= 200 then
        IndicatorDisplay = 0
    end	
	
	if IndicatorDisplay ~= 200 then
        IndicatorDisplay = IndicatorDisplay + 1
    end	
	end
	
	if RunsPopup < 4 then
        RunsPopup = RunsPopup + 1
    end	

	-- This Checks if the speedrun is finished
	if gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.Intermission = false
	end
	
	-- Colors on Playerlist
	for i = 0, MAX_PLAYERS - 1 do
        if gGlobalSyncTable.SpeedrunTeams and gPlayerSyncTable[i].TeamColors == 1 and (indicatormods and IndicatorDisplay >= 100) then
            network_player_set_description(gNetworkPlayers[i], "Red Team", 249, 3, 3, 255)
        elseif gGlobalSyncTable.SpeedrunTeams and gPlayerSyncTable[i].TeamColors == 2 and (indicatormods and IndicatorDisplay >= 100) then
            network_player_set_description(gNetworkPlayers[i], "Blue Team", 57, 3, 255, 255)
		elseif (gGlobalSyncTable.SpeedrunTeams ~= true) and gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.backupslot == false and (indicatormods and IndicatorDisplay >= 100) then
			network_player_set_description(gNetworkPlayers[i], "Speedrun", 255, 255, 255, 255)
		elseif (gGlobalSyncTable.SpeedrunTeams ~= true) and gGlobalSyncTable.GamemodeSetting == "Normal" and gGlobalSyncTable.backupslot == true and (indicatormods and IndicatorDisplay >= 100) then
			network_player_set_description(gNetworkPlayers[i], "Backup_S", 255, 255, 255, 255)
		elseif (gGlobalSyncTable.SpeedrunTeams ~= true) and gGlobalSyncTable.GamemodeSetting == "PracticeRun" and (indicatormods and IndicatorDisplay >= 100) then
			network_player_set_description(gNetworkPlayers[i], "Practice", 255, 255, 255, 255)
		elseif gGlobalSyncTable.SpeedrunTeams ~= true and gGlobalSyncTable.GamemodeSetting == "Casual" and (indicatormods and IndicatorDisplay >= 100) then
			network_player_set_description(gNetworkPlayers[i], "Casual", 255, 255, 255, 255)
		elseif gGlobalSyncTable.SpeedrunTeams ~= true and gGlobalSyncTable.GamemodeSetting == "SingleStars" and (indicatormods and IndicatorDisplay >= 100) then
			network_player_set_description(gNetworkPlayers[i], "S_Stars", 255, 255, 255, 255)
		end
    end
end
