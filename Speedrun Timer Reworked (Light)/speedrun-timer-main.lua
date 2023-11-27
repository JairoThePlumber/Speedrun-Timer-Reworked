if gamemodes_is_checked or notallowedmods or no_cheats then return end

gGlobalSyncTable.startspeedruntime = 0
gGlobalSyncTable.startspeedrun = 0
gGlobalSyncTable.beatedGame = false
gGlobalSyncTable.startingpoint = false
gGlobalSyncTable.startTimer = false
gGlobalSyncTable.stopTimer = true
gGlobalSyncTable.stopSpeedrun = false
gGlobalSyncTable.startIntro = false
gGlobalSyncTable.warptointro = false
gGlobalSyncTable.restartTimer = false
gGlobalSyncTable.restartSpeedrun = false
gGlobalSyncTable.AntiBLJ50 = false
gGlobalSyncTable.countdownfanfare = true
gGlobalSyncTable.countdownfanfarebuttons = true
gGlobalSyncTable.SpeedrunTeams = false
gGlobalSyncTable.notags = false
gGlobalSyncTable.TeamRedsavefile = false
gGlobalSyncTable.TeamBluesavefile = false
gGlobalSyncTable.SuperMario64 = false
AntiBLJ50_check = true

SpeedrunTeams = false
SpeedrunRedTeam = 1
SpeedrunBlueTeam = 2

startTimer = true
speedrunTimer = true
restartSpeedrun = true
startTimerbutton = false
startsoundbutton = true

startspeedruntime = 4 * 30

-- This Checks if you're not using romhacks
function sm64_check(m)
gGlobalSyncTable.SuperMario64 = true
for vanilla_mario_64 in pairs(gActiveMods) do
	if gActiveMods[vanilla_mario_64].incompatible ~= nil and gActiveMods[vanilla_mario_64].incompatible:find("romhack") then
	gGlobalSyncTable.SuperMario64 = false
	end
	if gGlobalSyncTable.SuperMario64 then
	gGlobalSyncTable.startingpoint = true
	end
	end
end

if mod_storage_load("commandsonly") == nil or mod_storage_load("commandsonly") == "true" then
	commandsonly = true
else
	commandsonly = false
end

if mod_storage_load("buttonsonly") == nil or mod_storage_load("buttonsonly") == "true" then
	buttonsonly = true
else
	buttonsonly = false
end

if commandsonly then 
	buttonsonly = false
	mod_storage_save("buttonsonly", tostring(buttonsonly))
end

--- @param m MarioState
-- This starts the run when inputting it
function mario_update(m)

    if gGlobalSyncTable.startTimer and network_is_server() and not startTimer then 
		
		startspeedruntime = 4 * 30
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true 
		gGlobalSyncTable.restartSpeedrun = false
	end
	
	if gGlobalSyncTable.restartSpeedrun and network_is_server() and not restartSpeedrun then 

		startspeedruntime = 4 * 30
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartSpeedrun = true
		gGlobalSyncTable.startTimer = false
		restartSpeedrun = true
        
	end
	
    if gGlobalSyncTable.startspeedruntime > 0 then
        m.freeze = true
	
        m.faceAngle.y = m.intendedYaw
	end
end 

-- The Classic X button for starting a speedrun, I also included extra buttons as well
function mario_button_update(m)
if moveset_is_check or other_moveset_mods then
	buttonsonly = false
	commandsonly = true
	end


	if buttonsonly then
	if gGlobalSyncTable.restartSpeedrun == true then
	gGlobalSyncTable.startTimer = false
    else
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 and network_is_server() and not startTimerbutton then 

		startspeedruntime = 4 * 30
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.restartSpeedrun = false
		startTimerbutton = true
		end
	end
	
	if (m.controller.buttonPressed & Y_BUTTON) ~= 0 and network_is_server() then 

		startspeedruntime = 4 * 30
        gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartSpeedrun = true
		gGlobalSyncTable.startTimer = false
        
	end
	
	if (m.controller.buttonPressed & L_TRIG) ~= 0 and network_is_server() then 
		gGlobalSyncTable.stopTimer = true
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.restartSpeedrun = false
	end
	
	if (m.controller.buttonPressed & X_BUTTON) ~= 0 and network_is_server() then 
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.stopTimer = false
	end
	
	if ((m.controller.buttonDown & Z_TRIG) ~= 0) and ((m.controller.buttonDown & D_JPAD) ~= 0) and ((m.controller.buttonDown & START_BUTTON ~= 0)) and network_is_server() then 

		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.startIntro = true
		gGlobalSyncTable.warptointro = true
        
	end
	
    if gGlobalSyncTable.startspeedruntime > 0 then
        m.freeze = true
	
        m.faceAngle.y = m.intendedYaw
		end
	end 
end 

-- Make sure people doesn't start with low health and doesn't take damage when starting the timer
function check_health_update(m)
    if gGlobalSyncTable.startspeedrun == 0 then
		m.health = 0x880
		m.peakHeight = m.pos.y
		m.numLives = 4
	elseif gGlobalSyncTable.startspeedrun < 0.5 then
	return false
	end
end

-- This Checks if the speedrun is finished
function beated_game_update()
if gGlobalSyncTable.beatedGame then
gGlobalSyncTable.startTimer = false
gGlobalSyncTable.stopTimer = false
gGlobalSyncTable.stopSpeedrun = false
gGlobalSyncTable.startIntro = false
gGlobalSyncTable.warptointro = false
	end
end

-- Basic timer from the speedrun timer but doesn't effect the other commands
function speedrun_update()
	if network_is_server() then
    if gGlobalSyncTable.startTimer then
        if startspeedruntime > 0 and not gGlobalSyncTable.beatedGame then
            startspeedruntime = startspeedruntime - 1
            gGlobalSyncTable.startspeedruntime = startspeedruntime / 30
            gGlobalSyncTable.startspeedrun = 0
        elseif not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 1
			end
		return true
        end
    end
end

-- This starts the speedrun with the Intro cutscene without the countdown
function introupdate()
	if gGlobalSyncTable.startIntro then
		if not gGlobalSyncTable.beatedGame then
			gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 1
		end
	end
end

-- This change the timer to restart itself to 0 when doing /stop speedrun 
function stop_timer_update()
if gGlobalSyncTable.stopTimer and not gGlobalSyncTable.beatedGame then
       gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 0
	end
end

-- This change the timer to restart itself to 0 when doing /stop speedrun 
function stop_speedrun_update()
  if gGlobalSyncTable.stopSpeedrun then
	if startspeedruntime > 0 and not gGlobalSyncTable.beatedGame then
		gGlobalSyncTable.startspeedruntime = gGlobalSyncTable.startspeedruntime - gGlobalSyncTable.startspeedruntime
            gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
		else
			if not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
				end
			return true 
		end
	end
end

-- This restart the timer to zero when doing /restart timer (now it's doesn't start a countdown unless you do /restart speedrun)
function restart_timer_update()
  if gGlobalSyncTable.restartTimer then 
	if startspeedruntime > 0 and not gGlobalSyncTable.beatedGame then
            gGlobalSyncTable.startspeedruntime = gGlobalSyncTable.startspeedruntime - gGlobalSyncTable.startspeedruntime
            gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
		else
			if not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun - gGlobalSyncTable.startspeedrun
				end
			return true 
		end
	end
end

-- This is how you restart the speedrun when messing up the a run (you can use it once, otherwise you have to rehost it)
function restart_speedrun_better_update()
	if network_is_server() then
    if gGlobalSyncTable.restartSpeedrun and not gGlobalSyncTable.startTimer then
	if startspeedruntime > 0 and not gGlobalSyncTable.beatedGame then
            startspeedruntime = startspeedruntime - 1
            gGlobalSyncTable.startspeedruntime = startspeedruntime / 30
            gGlobalSyncTable.startspeedrun = 0
        elseif not gGlobalSyncTable.beatedGame then
                gGlobalSyncTable.startspeedrun = gGlobalSyncTable.startspeedrun + 1
			end
		return true
        end
    end
end

---@param m MarioState
---@param o Object
---@param intee InteractionType
---@param interacted any
-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
function on_interact(m, o, intee, interacted)
	if gGlobalSyncTable.SuperMario64 then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
        gGlobalSyncTable.beatedGame = true
		end
    end
end
	
-- better start speedrun command than the last old ones
function speedrun_command(msg)
	if gGlobalSyncTable.beatedGame then
		djui_popup_create("\\#ff0000\\The Run is Finished, You have to rehost or Restart The Speedrun", 2)
		return true
	end
	
	if gGlobalSyncTable.restartTimer then
        djui_popup_create("\\#ff0000\\This Command is disabled when restarting a run", 2)
        return true
    end
	
	if gGlobalSyncTable.stopSpeedrun then
        djui_popup_create("\\#ff0000\\The Speedrun has Stopped, so either rehost to restart", 2)
        return true
    end
	
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.startIntro then
        djui_popup_create("\\#ff0000\\The Speedrun is already running!", 2)
        return true
    end

	if buttonsonly and not commandsonly then
		djui_popup_create("\\#ff0000\\That command is disabled when having button controls", 2)
		return true
	end
	
	if StarRoad_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	elseif Lugs_Delightful_Dioramas_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	elseif Ztar_Attack_2_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	end

	
    if msg == 'SPEEDRUN' or msg == 'TIMER' then
        djui_popup_create_global('The Speedrun is Starting!', 2)
        gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.restartSpeedrun = false
		gGlobalSyncTable.stopSpeedrun = false
		gGlobalSyncTable.stopTimer = false
		return true
	elseif msg == 'INTRO' then
		djui_popup_create_global('The Speedrun is Starting with a Intro!', 2)
        gGlobalSyncTable.startIntro = true
		gGlobalSyncTable.warptointro = true
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.restartSpeedrun = false
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.stopSpeedrun = false
		return true
	end
	
	djui_chat_message_create("/str start [Speedrun/Timer|Intro]")
	return true
end

-- added a stop speedrun command to fully stop the run
function stop_speedrun_command(msg)
	if gGlobalSyncTable.beatedGame then
		djui_popup_create("\\#ff0000\\The Run is Finished, You have to rehost or Restart The Speedrun", 2)
		return true
	end
	
	if gGlobalSyncTable.stopSpeedrun then
        djui_popup_create("\\#ff0000\\You already stopped the speedrun, so either rehost to restart", 2)
        return true
    end
	
	if gGlobalSyncTable.stopTimer then
        djui_popup_create("\\#ff0000\\You already paused the timer", 2)
        return true
    end
	
	if buttonsonly and not commandsonly then
		djui_popup_create("\\#ff0000\\That command is disabled when having button controls", 2)
		return true
	end
	
	if msg == 'TIMER' then 
        djui_popup_create_global("\\#ff0000\\The Speedrun is Paused!", 2)
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.restartSpeedrun = false
		gGlobalSyncTable.stopTimer = true
		gGlobalSyncTable.stopSpeedrun = false
		return true
	elseif msg == 'SPEEDRUN' then
        djui_popup_create_global("\\#ff0000\\The Speedrun has Stopped!", 2)
        gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.restartSpeedrun = false
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.stopSpeedrun = true
		return true
	end
	
	djui_chat_message_create("/str stop [Timer|Speedrun]")
	return true
end

-- now restarting the speedrun or timer doesn't feel useless I guess?
function restart_speedrun_command(msg)
	if buttonsonly and not commandsonly then
		djui_popup_create("\\#ff0000\\That command is disabled when having button controls", 2)
		return true
	end
	
	if StarRoad_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	elseif Lugs_Delightful_Dioramas_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	elseif Ztar_Attack_2_Check == false then
	djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
	return true
	end

	if msg == 'TIMER' then
        djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = true
		gGlobalSyncTable.restartSpeedrun = false
		gGlobalSyncTable.stopSpeedrun = false
		gGlobalSyncTable.countdownfanfare = false
		gGlobalSyncTable.stopTimer = false
		return true
	elseif msg == 'SPEEDRUN' then
        djui_popup_create_global("\\#ff0000\\The Speedrun is Restarting!", 2)
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.restartSpeedrun = true
		gGlobalSyncTable.warptointro = false
		gGlobalSyncTable.stopSpeedrun = false
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.TeamsCheck = false
		restartSpeedrun = false
        return true
	end
	
	djui_chat_message_create("/str restart [Timer|Speedrun]")
	return true
end

-- Change how many countdowns you want to start
function countdown_command(msg)
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		djui_popup_create("\\#ff0000\\This Command is Disabled when a Speedrun is Starting", 2)
		return true
	end

	if buttonsonly and not commandsonly then
		djui_popup_create("\\#ff0000\\This Command is Disabled when having Button Controls", 2)
		return true
	end
	
	local countdown = tonumber(msg)
    if countdown ~= nil then
        countdown = clamp(countdown, 0, 50)
		if countdown == 0 then
		djui_popup_create_global("No Countdown \n(That's Pretty Much it)", 2)
		elseif countdown == 1 then
		djui_popup_create_global("Countdown set to " .. countdown .. "\n(Which is Short.)", 2)
		elseif countdown == 4 then
		djui_popup_create_global("Countdown set to Default\n(".. countdown.. " Seconds)", 2)
		elseif countdown < 29 then
		djui_popup_create_global("Countdown set to " .. countdown .. " Seconds", 2)
		elseif countdown > 29 and countdown < 40 then
		djui_popup_create_global("\\#FFFF00\\Countdown set to " .. countdown .. " Seconds\n(Lower than the Max Countdown)", 2)
		elseif countdown > 39 and countdown < 50 then
		djui_popup_create_global("\\#FFA500\\Countdown set to " .. countdown .. " Seconds\n(Getting Close to the Max Countdown)", 2)
		elseif countdown == 49 then
		djui_popup_create_global("\\#FFA500\\Countdown set to " .. countdown .. " Seconds\n(Almost to the Max Countdown)", 2)
		elseif countdown > 49 then
		djui_popup_create_global("\\#FF0000\\Countdown set to " .. countdown .. " Seconds\n(The Max Countdown)", 2)
		end
        startspeedruntime = countdown * 30
        return true
	end
	
	djui_chat_message_create("/str countdown [0 - 10]")
	return true
end

-- change this to the buttons commands like the old Speedrun Timer
function button_speedrun_command(msg)
	if moveset_is_check or other_moveset_mods then
	djui_popup_create("\\#ff0000\\This Command is Disabled for Moveset Mods", 2)
	return true
	else
	if msg == 'BUTTONS' or msg == 'BUTTON' then
		djui_popup_create("Button commands! The original settings of the Speedrun Timer", 2)
		buttonsonly = true
		commandsonly = false
		mod_storage_save("buttonsonly", tostring(buttonsonly))
		mod_storage_save("commandsonly", tostring(commandsonly))
		return true
	elseif msg == 'COMMANDS' or msg == 'COMMAND' then
		djui_popup_create("Slash commands! The Modern Settings of the Speedrun Timer", 2)
		buttonsonly = false
		commandsonly = true
		mod_storage_save("buttonsonly", tostring(buttonsonly))
		mod_storage_save("commandsonly", tostring(commandsonly))
		return true
		end
	end
	djui_chat_message_create("/str options [Commands|Buttons]")
	return true
end

function reworked_command_description(m)
	if not network_is_server() then return end
	if not buttonsonly and not moveset_is_check and not other_moveset_mods and commandsonly then
		update_chat_command_description("str", "[start|stop|restart|countdown|options|controls|teams]")
    elseif buttonsonly and not moveset_is_check and not other_moveset_mods and not commandsonly then
        update_chat_command_description("str", "[options|controls|teams]")
	elseif moveset_is_check or other_moveset_mods and commandsonly then
		update_chat_command_description("str", "[start|stop|restart|countdown|controls|teams]")
	end
end

-- First Set of Commands to use
function reworked_command(msg)
	local args = {}
    for argument in string.upper(msg):gmatch("%S+") do table.insert(args, argument) end
	
	if args[1] == "START" and commandsonly then
		return speedrun_command(args[2])
	elseif args[1] == "STOP" and commandsonly then
		return stop_speedrun_command(args[2])
	elseif args[1] == "RESTART" and commandsonly then
		return restart_speedrun_command(args[2])
	elseif args[1] == "COUNTDOWN" and commandsonly then
		return countdown_command(args[2])
	elseif args[1] == "OPTIONS" then
		return button_speedrun_command(args[2])
	elseif args[1] == "CONTROLS" then
		return displaycontrols2(args[2])
	elseif args[1] == "TEAMS" then
		return teams_command_update(args[2]) 
	end
	
	if not buttonsonly and commandsonly then
	djui_chat_message_create("/str [start|stop|restart|countdown|options|controls|teams]")
	return true
	elseif buttonsonly and not moveset_is_check and not other_moveset_mods and not commandsonly then
	djui_chat_message_create("/str [options|controls|teams]")
	return true
	elseif moveset_is_check or other_moveset_mods and commandsonly then
	djui_chat_message_create("/str [start|stop|restart|countdown|controls|teams]")
	return true
	end
end

-- Making sure that the command is only for the host
if network_is_server() then
hook_chat_command('str', "[start|stop|restart|countdown|options|controls|teams]", reworked_command)
end

-- This plays the countdown sounds effects when starting the timer
function countdown_sounds(m)
	if gGlobalSyncTable.startTimer and gGlobalSyncTable.startspeedrun == 0 and not buttonsonly then
	if gGlobalSyncTable.countdownfanfare == true then
	play_race_fanfare()
	gGlobalSyncTable.countdownfanfare = false
		end
	end
	
	if gGlobalSyncTable.restartSpeedrun and gGlobalSyncTable.startspeedrun == 0 and not buttonsonly then
	if gGlobalSyncTable.countdownfanfare == false then
	play_race_fanfare()
	gGlobalSyncTable.countdownfanfare = true
		end
	end
	
	if gGlobalSyncTable.startTimer and gGlobalSyncTable.startspeedrun == 0 and buttonsonly and startsoundbutton then
	if gGlobalSyncTable.countdownfanfarebuttons == true then
	play_race_fanfare()
	startsoundbutton = false
	gGlobalSyncTable.countdownfanfarebuttons = false
		end 
	end
	
	if gGlobalSyncTable.restartSpeedrun and gGlobalSyncTable.startspeedrun == 0 and buttonsonly then
	if gGlobalSyncTable.countdownfanfarebuttons == false then
	play_race_fanfare()
	gGlobalSyncTable.countdownfanfarebuttons = true
		end
	end
	
	if gGlobalSyncTable.startspeedruntime == 10 or gGlobalSyncTable.startspeedruntime == 9 or gGlobalSyncTable.startspeedruntime == 8 or gGlobalSyncTable.startspeedruntime == 7 or gGlobalSyncTable.startspeedruntime == 6 
	or gGlobalSyncTable.startspeedruntime == 5 or gGlobalSyncTable.startspeedruntime == 4 or gGlobalSyncTable.startspeedruntime == 3 or gGlobalSyncTable.startspeedruntime == 2 or gGlobalSyncTable.startspeedruntime == 1 then
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
    elseif gGlobalSyncTable.startspeedrun == 1 then
		play_sound(SOUND_GENERAL_RACE_GUN_SHOT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	if gGlobalSyncTable.startspeedruntime > 0 then
	if (m.action == ACT_SLEEPING or m.action == ACT_START_SLEEPING) then
        set_mario_action(m, ACT_IDLE, 0)
		end
	end
end

function restart_location_area()
	if gGlobalSyncTable.startspeedruntime == 0 then
		warp_to_level(gLevelValues.entryLevel, 1, 0)
        return true
	else
	if gGlobalSyncTable.startspeedruntime > 0.1 then
	    djui_popup_create("\\#FF0000\\You only use this to avoid getting stuck, not using it for a speedrun", 2)
		return true
		end
	end
end

-- Bingo Mod by Blocky --

-- Teams Command for Host
function teams_command_update()
	if gGlobalSyncTable.startspeedrun > 0.1 and SpeedrunTeams then
		djui_popup_create("\\#ff0000\\You Starting a Speedrun with teams, therefore it stays on until you rehost", 2)
		return true
	end
	
	if gGlobalSyncTable.startspeedrun > 0.1 and not SpeedrunTeams then 
		djui_popup_create("\\#ff0000\\You Starting a Speedrun with no teams, therefore it's off until you rehost", 2) 
		return true
	end
	
	gGlobalSyncTable.SpeedrunTeams = not gGlobalSyncTable.SpeedrunTeams
	if gGlobalSyncTable.SpeedrunTeams then
		djui_popup_create("Speedrun in Teams is Enabled", 1)
		gGlobalSyncTable.notags = true
		gGlobalSyncTable.TeamRedsavefile = true
		gGlobalSyncTable.TeamBluesavefile = true
	else
		djui_popup_create("Speedrun in Teams is Disabled", 1)
		SpeedrunTeams = false
		gGlobalSyncTable.notags = false
		gGlobalSyncTable.backupslot = false
		gGlobalSyncTable.TeamRedsavefile = true
		gGlobalSyncTable.TeamBluesavefile = false
	end
	return true
end

-- Separate teams on differents savefiles
function teams_update(m)
if gGlobalSyncTable.SpeedrunTeams then
SpeedrunTeams = true
else
SpeedrunTeams = false
end
	
	if SpeedrunTeams then 
    if gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam then
	if gGlobalSyncTable.TeamRedsavefile then	
        save_file_set_using_backup_slot(false)
        m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
    	end
    end
	
	if gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam then
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

-- changing teams chat messages
function teams_color_command(msg)
if not SpeedrunTeams then 
djui_popup_create("\\#FF0000\\You have teams off, so you can't change color when it's off", 2)
return true
end
	if gGlobalSyncTable.startspeedrun > 0.1 then
        djui_popup_create("\\#ff0000\\You can't change teams while the speedrun is starting", 2)
        return true
    end
	
	if gGlobalSyncTable.notags ~= true then return end
        if msg == 'BLUE' and gGlobalSyncTable.notags then
            gPlayerSyncTable[0].TeamColors = SpeedrunBlueTeam
            djui_popup_create("\\#FFFF00\\You are in Team \\#3903ff\\Blue!", 2)
			return true
        elseif msg == 'RED' and gGlobalSyncTable.notags then
			gPlayerSyncTable[0].TeamColors = SpeedrunRedTeam
            djui_popup_create("\\#FFFF00\\You are in Team \\#f90303\\Red!", 2)
			return true
		end
	
	djui_chat_message_create("/str_config team [\\#f90303\\Red\\#FFFFFF\\|\\#3903ff\\Blue\\#FFFFFF\\]")
    return true
end

-- Colors on Playerlist
function teams_character_update()
	for i = 0, MAX_PLAYERS - 1 do
        if SpeedrunTeams and gPlayerSyncTable[i].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.notags then
            network_player_set_description(gNetworkPlayers[i], "Red Team", 249, 3, 3, 255)
        elseif SpeedrunTeams and gPlayerSyncTable[i].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.notags then
            network_player_set_description(gNetworkPlayers[i], "Blue Team", 57, 3, 255, 255)
		elseif gGlobalSyncTable.SpeedrunTeams ~= true and not indicatormods then
			network_player_set_description(gNetworkPlayers[i], "Speedrun", 255, 255, 255, 255)
		end
    end
end


