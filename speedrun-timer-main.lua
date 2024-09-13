if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Timers
gGlobalSyncTable.startglobaltimer = 0
gGlobalSyncTable.startcountdown = 0
gGlobalSyncTable.GoTimer = 0
gGlobalSyncTable.timercountdown = 5 * 30
gGlobalSyncTable.beatedGame = false
gGlobalSyncTable.startTimer = false
gGlobalSyncTable.Intermission = false
gGlobalSyncTable.Intercountdown = 6

gGlobalSyncTable.SpeedrunTeams = false
gGlobalSyncTable.notags = false
gGlobalSyncTable.NormalSaveFile = false
gGlobalSyncTable.TeamRedsavefile = false
gGlobalSyncTable.TeamBluesavefile = false
gGlobalSyncTable.SuperMario64 = true
gGlobalSyncTable.casualTimer = false

gGlobalSyncTable.set_warp = false
gGlobalSyncTable.Cheated = false
gGlobalSyncTable.ResettingTimer = false
gGlobalSyncTable.ResetTimer = 10
gGlobalSyncTable.ResetSaveCheck = false
gGlobalSyncTable.ResetSave = 10
gGlobalSyncTable.custom_lives = false
gGlobalSyncTable.set_countdown_numbers = false
gGlobalSyncTable.timer_popup = false
gGlobalSyncTable.anti_cheat = false
countdown_display_check = 31
FreezePlayers = false
freeze_check = false
set_warp_check = false
set_warp_position = false
startTimerbutton = false
incompatible_warp = false

SpeedrunNoTeams = 0
SpeedrunRedTeam = 1
SpeedrunBlueTeam = 2

function Main_Mario_Update_Functions(m)
	-- This Checks if you're not using romhacks
	for vanilla_mario_64 in pairs(gActiveMods) do
	if gActiveMods[vanilla_mario_64].incompatible ~= nil and gActiveMods[vanilla_mario_64].incompatible:find("romhack") then
	gGlobalSyncTable.SuperMario64 = false
		end
	end
	
	-- This starts the run when inputting it
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startcountdown > 0 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
		end
	end
	if not gGlobalSyncTable.Intermission then
    if (gGlobalSyncTable.startTimer and gGlobalSyncTable.Intercountdown < 0) then
		if not gGlobalSyncTable.set_countdown_numbers then
		gGlobalSyncTable.timercountdown = 5 * 30
		end
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true 
		gGlobalSyncTable.restartSpeedrun = false
		end
	end
	
	-- The Classic X button for starting a speedrun, I also included extra buttons as well
	if moveset_is_check or other_moveset_mods then
	buttonsonly = 0
	end
	
	if buttonsonly == 1 and network_is_server() then

	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and not startTimerbutton then 
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.Intermission = true
		startTimerbutton = true
	end
	
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer == false then 
		gGlobalSyncTable.startTimer = true
	elseif (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & X_BUTTON) ~= 0)) and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer then 
		gGlobalSyncTable.startTimer = false
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonPressed & Y_BUTTON) ~= 0)) then
		reset_timer()
		end
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & START_BUTTON) ~= 0)) then
		gGlobalSyncTable.ResetSaveCheck = true
		end
	end
	
	-- Make sure people doesn't start with low health and doesn't take damage when starting the timer
	if gGlobalSyncTable.startglobaltimer == 0 then
		m.health = 0x880
		m.peakHeight = m.pos.y
		if gGlobalSyncTable.custom_lives == false then
		m.numLives = 4
		end
	end
	
	-- This plays the countdown sounds effects when starting the timer
	if gGlobalSyncTable.Intermission and (gGlobalSyncTable.Intercountdown <= 5.96 and gGlobalSyncTable.Intercountdown >= 5.93) then
	if FanfareTable[FanfareDefault].fanfare_sound == "Normal" then
		play_race_fanfare()
		end
	end
	local sounds = gGlobalSyncTable.startcountdown
	if (sounds == 9 + 1 or sounds == 8 + 1 or sounds == 7 + 1 or sounds == 6 + 1
	or sounds == 5 + 1 or sounds == 4 + 1 or sounds == 3 + 1 or sounds == 2 + 1 or sounds == 1 + 1) then
	if gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startglobaltimer == 0 then
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
	end
	
	if gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.timercountdown == 30 then
	if GoTable[GoDefault].go_sound == "Normal" then
		play_sound(SOUND_GENERAL_RACE_GUN_SHOT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end
	
	-- Bingo Mod by Blocky --
	-- Separate teams on differents savefiles
	if not gGlobalSyncTable.SpeedrunTeams then
	gPlayerSyncTable[0].TeamColors = SpeedrunNoTeams
	if gPlayerSyncTable[0].TeamColors == SpeedrunNoTeams then
	 gGlobalSyncTable.NormalSaveFile = true
	if gGlobalSyncTable.NormalSaveFile then	
       save_file_set_using_backup_slot(false)
	   m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
			end
		end
	end
	
	if gGlobalSyncTable.SpeedrunTeams then
	if gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam then
	 gGlobalSyncTable.TeamRedsavefile = true
	 gGlobalSyncTable.TeamBluesavefile = false
	if gGlobalSyncTable.TeamRedsavefile then	
       save_file_set_using_backup_slot(false)
	   m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
		end
	end
	
	if gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam then
	gGlobalSyncTable.TeamBluesavefile = true
	gGlobalSyncTable.TeamRedsavefile = false
	if gGlobalSyncTable.TeamBluesavefile then	
        save_file_set_using_backup_slot(true)
		m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
		end
    end
	
    if gPlayerSyncTable[0].TeamColors ~= SpeedrunBlueTeam and gPlayerSyncTable[0].TeamColors ~= SpeedrunRedTeam and gGlobalSyncTable.notags then
	if math.random(SpeedrunRedTeam, SpeedrunBlueTeam) == SpeedrunRedTeam then
	   gPlayerSyncTable[0].TeamColors = SpeedrunRedTeam
	else
	   gPlayerSyncTable[0].TeamColors = SpeedrunBlueTeam
		end
	end
	end
end

function Main_Update_Functions(m)
	-- This checks if the host has Casual Timer On
	if network_is_server() and casualTimer == 1 then
	gGlobalSyncTable.casualTimer = true
	end

	-- This Freezes Players for Incompatible Romhacks
	if (gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false) then
	if gGlobalSyncTable.Intermission then
	if gGlobalSyncTable.startglobaltimer == 0 then
	freeze_check = true
	FreezePlayers = true
	else
	FreezePlayers = false
	end
	end
	if freeze_check and gGlobalSyncTable.startglobaltimer ~= 0 then
	set_mario_action(gMarioStates[0], ACT_IDLE, 0)
	freeze_check = false
	end
	if FreezePlayers then
	if gMarioStates[0].action == ACT_FREEFALL then
	set_mario_action(gMarioStates[0], ACT_SPAWN_SPIN_AIRBORNE, 0)
	end
	if gMarioStates[0].action ~= ACT_SPAWN_SPIN_AIRBORNE and gMarioStates[0].action ~= ACT_SPAWN_SPIN_LANDING then
	set_mario_action(gMarioStates[0], ACT_READING_AUTOMATIC_DIALOG, 0)
			end
		end
	end
	
	-- Main Timer Function
	if (gGlobalSyncTable.startcountdown == 1.0 and gGlobalSyncTable.timercountdown == 30 and gGlobalSyncTable.Intercountdown == 0) and gGlobalSyncTable.GoTimer <= 29 and network_is_server() then
	gGlobalSyncTable.GoTimer = gGlobalSyncTable.GoTimer + 1
	end
	if network_is_server() and gGlobalSyncTable.Intermission and gGlobalSyncTable.Intercountdown > 0 then
	gGlobalSyncTable.Intercountdown = gGlobalSyncTable.Intercountdown - 1 / 30
	end
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer < 0.1 then
	if (gGlobalSyncTable.CompatibleRomhacks == true or gGlobalSyncTable.SuperMario64 == true) then
	gMarioStates[0].freeze = true
	gMarioStates[0].faceAngle.y = gMarioStates[0].intendedYaw
	end
	end
	if gMarioStates[0].action == ACT_READING_NPC_DIALOG and gGlobalSyncTable.Intercountdown < 0 then 
	set_mario_action(gMarioStates[0], ACT_IDLE, 0)
    end
	if gGlobalSyncTable.Intercountdown < 0 then
	if gGlobalSyncTable.Intermission then
	gGlobalSyncTable.startTimer = true
		end
	end
	
	if gGlobalSyncTable.startTimer then
	if countdown_display_check > 0 then
	countdown_display_check = countdown_display_check - 1
		end
	end
	
	-- Basic timer from the speedrun timer but doesn't effect the other commands
	-- But It would be part of the restart speedrun command as well (it's because having it's own function gotta take forever, so I just remove it)
	if network_is_server() then
    if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.Intercountdown = 0
        if gGlobalSyncTable.timercountdown > 30 then
            gGlobalSyncTable.timercountdown = gGlobalSyncTable.timercountdown - 1
            gGlobalSyncTable.startcountdown = gGlobalSyncTable.timercountdown / 30
            gGlobalSyncTable.startglobaltimer = 0
        elseif not gGlobalSyncTable.beatedGame then
			-- This stops the timer but make sure this doesn't unpause if the run is finished
			if not (gGlobalSyncTable.startTimer == false or gGlobalSyncTable.Cheated) or (network_is_server() and casualTimer == 1) then
                gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
				end
			end
        end
    end

	-- This Start the Timer everytime you make a room
	if network_is_server() and casualTimer == 1 then
    if gGlobalSyncTable.casualTimer then
	if not gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startglobaltimer = gGlobalSyncTable.startglobaltimer + 1
			end
		end
    end
	-- This Checks if the speedrun is finished
	if gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.Intermission = false
	end
	
	-- Colors on Playerlist
	for i = 0, MAX_PLAYERS - 1 do
        if gGlobalSyncTable.SpeedrunTeams and gPlayerSyncTable[i].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.notags then
            network_player_set_description(gNetworkPlayers[i], "Red Team", 249, 3, 3, 255)
        elseif gGlobalSyncTable.SpeedrunTeams and gPlayerSyncTable[i].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.notags then
            network_player_set_description(gNetworkPlayers[i], "Blue Team", 57, 3, 255, 255)
		elseif (gGlobalSyncTable.SpeedrunTeams ~= true) and not gGlobalSyncTable.casualTimer and not indicatormods then
			network_player_set_description(gNetworkPlayers[i], "Speedrun", 255, 255, 255, 255)
		elseif gGlobalSyncTable.SpeedrunTeams ~= true and gGlobalSyncTable.casualTimer and not indicatormods then
			network_player_set_description(gNetworkPlayers[i], "Casual", 255, 255, 255, 255)
		end
    end
end