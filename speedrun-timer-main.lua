if gamemodes_is_checked or notallowedmods or no_cheats then return end

gGlobalSyncTable.startspeedruntime = 0
gGlobalSyncTable.GoTimer = 0
gGlobalSyncTable.startspeedrun = 0
gGlobalSyncTable.beatedGame = false
gGlobalSyncTable.startTimer = false
gGlobalSyncTable.stopTimer = false
gGlobalSyncTable.stopSpeedrun = false
gGlobalSyncTable.restartTimer = false
gGlobalSyncTable.SpeedrunTeams = false
gGlobalSyncTable.notags = false
gGlobalSyncTable.NormalSaveFile = false
gGlobalSyncTable.TeamRedsavefile = false
gGlobalSyncTable.TeamBluesavefile = false
gGlobalSyncTable.SuperMario64 = true
gGlobalSyncTable.casualTimer = false
gGlobalSyncTable.Intermission = false
gGlobalSyncTable.Intercountdown = 6

gGlobalSyncTable.set_warp = false
gGlobalSyncTable.Cheated = false
gGlobalSyncTable.ResetSaveCheck = false
gGlobalSyncTable.ResetSave = 10
gGlobalSyncTable.custom_lives = false
gGlobalSyncTable.set_countdown_numbers = false
gGlobalSyncTable.timer_popup = false
gGlobalSyncTable.anti_cheat = false
countdown_sound_check = 31
FreezePlayers = false
freeze_check = false
set_warp_check = false
set_warp_position = false

SpeedrunNoTeams = 0
SpeedrunRedTeam = 1
SpeedrunBlueTeam = 2

startTimerbutton = false
startspeedruntime = 5 * 30

-- This Checks if you're not using romhacks
function sm64_check(m)
for vanilla_mario_64 in pairs(gActiveMods) do
	if gActiveMods[vanilla_mario_64].incompatible ~= nil and gActiveMods[vanilla_mario_64].incompatible:find("romhack") then
	gGlobalSyncTable.SuperMario64 = false
		end
	end
end

function timer_check()
if network_is_server() and casualTimer == 1 then
gGlobalSyncTable.casualTimer = true
	end
end

--- @param m MarioState
-- This starts the run when inputting it
function mario_update(m)
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedruntime > 0 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
		end
	end
	if not gGlobalSyncTable.Intermission then return end
    if (gGlobalSyncTable.startTimer and gGlobalSyncTable.Intercountdown < 0) then
		if not gGlobalSyncTable.set_countdown_numbers then
		startspeedruntime = 5 * 30
		end
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true 
		gGlobalSyncTable.restartSpeedrun = false
	end
end 

function freeze_players_update()
if (gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false) then
if gGlobalSyncTable.Intermission then
if gGlobalSyncTable.startspeedrun == 0 then
freeze_check = true
FreezePlayers = true
else
FreezePlayers = false
end
end
if freeze_check and gGlobalSyncTable.startspeedrun ~= 0 then
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
end

-- The Classic X button for starting a speedrun, I also included extra buttons as well
function mario_button_update(m)
if moveset_is_check or other_moveset_mods then
	buttonsonly = 0
	end
	
	if buttonsonly == 1 and network_is_server() then

	if (m.controller.buttonPressed & X_BUTTON) ~= 0 and not startTimerbutton then 
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.Intermission = true
		startTimerbutton = true
	end
	
	if (m.controller.buttonPressed & Y_BUTTON) ~= 0 and not gGlobalSyncTable.stopSpeedrun then 
		gGlobalSyncTable.stopTimer = true
		gGlobalSyncTable.startTimer = false
	end
	
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & D_JPAD) ~= 0)) and gGlobalSyncTable.Intermission then 
		gGlobalSyncTable.stopSpeedrun = true
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.Intermission = false
	end
	
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & Z_TRIG) ~= 0) then
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = true
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.Intermission = false
		gGlobalSyncTable.Intercountdown = 6
		gGlobalSyncTable.GoTimer = 0
		fanfare_check = false
	end
	
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & START_BUTTON) ~= 0) then
		gGlobalSyncTable.ResetSaveCheck = true
	end
	
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & X_BUTTON) ~= 0) and gGlobalSyncTable.restartTimer then
		gGlobalSyncTable.Intermission = true
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.stopTimer = false
		if CDNumbers ~= nil then
			CDNumbers = clamp(CDNumbers, 0, 50)
			startspeedruntime = CDNumbers * 30 + 60 
		end
		if not gGlobalSyncTable.set_countdown_numbers then
		startspeedruntime = 5 * 30
		end
	end
	
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 and gGlobalSyncTable.Intermission and gGlobalSyncTable.stopTimer then 
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.stopTimer = false
		end
	end
end 

-- Make sure people doesn't start with low health and doesn't take damage when starting the timer
function check_health_update(m)
    if gGlobalSyncTable.startspeedrun == 0 then
		m.health = 0x880
		m.peakHeight = m.pos.y
		if gGlobalSyncTable.custom_lives == false then
		m.numLives = 4
		end
	else
	return false
	end
end

-- All The functions for the commands
function speedrun_commands_update()
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.Intercountdown > 5.9 then
	set_warp_check = false
	freeze_check = false
	FreezePlayers = false
	countdown_sound_check = 31
	end
	
	if (gGlobalSyncTable.startspeedruntime == 1.0 and startspeedruntime == 30 and gGlobalSyncTable.Intercountdown == 0) and gGlobalSyncTable.GoTimer <= 29 then
	gGlobalSyncTable.GoTimer = gGlobalSyncTable.GoTimer + 1
	end
	if network_is_server() and gGlobalSyncTable.Intermission and gGlobalSyncTable.Intercountdown > 0 then
	gGlobalSyncTable.Intercountdown = gGlobalSyncTable.Intercountdown - 1 / 30
	end
	if gGlobalSyncTable.Intermission and gGlobalSyncTable.startspeedrun < 0.1 then
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
	if countdown_sound_check > 0 then
	countdown_sound_check = countdown_sound_check - 1
		end
	end
	
	-- Basic timer from the speedrun timer but doesn't effect the other commands
	-- But It would be part of the restart speedrun command as well (it's because having it's own function gotta take forever, so I just remove it)
	if network_is_server() then
    if gGlobalSyncTable.startTimer then
	gGlobalSyncTable.Intercountdown = 0
        if startspeedruntime > 30 then
            startspeedruntime = startspeedruntime - 1
            gGlobalSyncTable.startspeedruntime = startspeedruntime / 30
            gGlobalSyncTable.startspeedrun = 0
        elseif not gGlobalSyncTable.beatedGame then
			-- This stops the timer but make sure this doesn't unpause if the run is finished
			if not (gGlobalSyncTable.stopTimer or gGlobalSyncTable.Cheated) or (network_is_server() and casualTimer == 1) then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 1
				end
			end
		return true
        end
    end

	-- This change the timer to restart itself to 0 when stopping a speedrun
	if gGlobalSyncTable.stopSpeedrun then
	if startspeedruntime > 30 and not gGlobalSyncTable.beatedGame then
		gGlobalSyncTable.startspeedruntime = gGlobalSyncTable.startspeedruntime - gGlobalSyncTable.startspeedruntime
            gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
		else
			if not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
				end
			return true 
		end
	end
	-- This restart the timer to zero when doing /str restart timer (You Have to do /str restart speedrun after doing this)
	if gGlobalSyncTable.restartTimer then 
	if startspeedruntime > 30 and not gGlobalSyncTable.beatedGame then
            gGlobalSyncTable.startspeedruntime = gGlobalSyncTable.startspeedruntime - gGlobalSyncTable.startspeedruntime
            gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
		else
			if not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
				end
			return true 
		end
	end

	-- This Start the Timer everytime you make a room
	if network_is_server() and casualTimer == 1 then
    if gGlobalSyncTable.casualTimer then
	if not gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 1
			end
		end
    end
	-- This Checks if the speedrun is finished
	if gGlobalSyncTable.beatedGame then
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.stopTimer = false
	gGlobalSyncTable.stopSpeedrun = false
	gGlobalSyncTable.Intermission = false
	end
end

---@param m MarioState
---@param o Object
---@param intee InteractionType
---@param interacted any
-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
function on_interact(m, o, interactType)
	if gGlobalSyncTable.SuperMario64 == true and gGlobalSyncTable.RunsSlots == 0 then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
        gGlobalSyncTable.beatedGame = true
		end
    end
end

-- This plays the countdown sounds effects when starting the timer
function countdown_sounds(m)	
	if gGlobalSyncTable.Intermission and (gGlobalSyncTable.Intercountdown <= 5.86 and gGlobalSyncTable.Intercountdown >= 5.83) then
	if FanfareTable[FanfareDefault].fanfare_sound == "Normal" then
		play_race_fanfare()
		end
	end
	local sounds = gGlobalSyncTable.startspeedruntime
	if (sounds == 9 + 1 or sounds == 8 + 1 or sounds == 7 + 1 or sounds == 6 + 1
	or sounds == 5 + 1 or sounds == 4 + 1 or sounds == 3 + 1 or sounds == 2 + 1 or sounds == 1 + 1) then
	if gGlobalSyncTable.Intercountdown == 0 and gGlobalSyncTable.startspeedrun == 0 then
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

    if gGlobalSyncTable.startspeedrun == 1 then
	if GoTable[GoDefault].go_sound == "Normal" then
		play_sound(SOUND_GENERAL_RACE_GUN_SHOT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end
end

-- Bingo Mod by Blocky --
-- Separate teams on differents savefiles
function teams_update(m)
	if not gGlobalSyncTable.SpeedrunTeams then
	if gPlayerSyncTable[0].TeamColors == SpeedrunNoTeams then
	 gGlobalSyncTable.NormalSaveFile = true
	if gGlobalSyncTable.NormalSaveFile then	
       save_file_set_using_backup_slot(false)
	   m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
			end
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

-- Colors on Playerlist
function teams_character_update()
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