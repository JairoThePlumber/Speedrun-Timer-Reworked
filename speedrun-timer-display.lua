if gamemodes_is_checked or notallowedmods or no_cheats then return end

Hours = 0
Minutes = 0
Seconds = 0
MilliSeconds = 0
-- Fonts --
DefaultFont = 1
DefaultName = "Normal"
-- Fanfare --
FanfareDefault = 1
FanfareName = "Normal"
-- Countdown
CountdownDefault = 1
CountdownName = "Normal"
-- Go Sound --
GoDefault = 1
GoName = "Normal"

RectFontsOnly = false
function set_timer_function()
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end
end

function normal_and_aliased_hud_render()
	
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
    countdown_text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))
	countdown_width = djui_hud_measure_text(countdown_text) * size
	countdown_x = (screenWidth - countdown_width) / 2.0
	
    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(timer_x - 6 + CustomXPos, timer_y + CustomYPos, timer_width + 12, 16);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(timer_x - 6 + CustomXPos, timer_y + CustomYPos, timer_width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(timer_text, timer_x + CustomXPos, timer_y + CustomYPos, timer_size);
	end
	
if gGlobalSyncTable.startspeedruntime <= 1 then
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
	
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(go_text, go_x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(go_x - 6 * size, y, go_width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(go_text, go_x, y, size);
	end
end

    if countdown_sound_check == 0 and gGlobalSyncTable.startspeedruntime >= 1.01 then

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
	djui_hud_render_rect(countdown_x - 6 * size, y, countdown_width + 12 * size, height);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(countdown_text, countdown_x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
	djui_hud_render_rect(countdown_x - 6 * size, y, countdown_width + 12 * size, height);

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
	go_x = (screenWidth - go_width) / 2.0
    go_width = djui_hud_measure_text(go_text) * doublesize
	
	-- Countdown Display
    countdown_text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))
	countdown_width = djui_hud_measure_text(countdown_text) * doublesize
	countdown_x = (screenWidth - countdown_width) / 2.0
	
	if FontTable[DefaultFont].name == "SM64" then
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
		end
	end
	
	if FontTable[DefaultFont].name == "SM64" then
	
	if Hours >= 10 then
	djui_hud_print_text(timetext, timer_x - 125 + CustomXPos, timer_y - 2 + CustomYPos, size);
	end

	if Hours < 10 then
	djui_hud_print_text(timetext, timer_x - 115 + CustomXPos, timer_y - 2 + CustomYPos, size);
	end
	
	if Hours >= 10 then
    djui_hud_print_text(hours10text, timer_x - 70 + CustomXPos, timer_y - 2 + CustomYPos, size);
	end
	
	if Hours < 10 then
    djui_hud_print_text(hourstext, timer_x - 58 + CustomXPos, timer_y - 2 + CustomYPos, size);
	end
	
    djui_hud_print_text(Minutestext, timer_x - 38 + CustomXPos, timer_y - 2 + CustomYPos, size);
    djui_hud_print_text(secondstext, timer_x - 4 + CustomXPos, timer_y - 2 + CustomYPos, size);
    djui_hud_print_text(millisecondstext, timer_x + 30 + CustomXPos, timer_y - 2 + CustomYPos, size);
	
	
	djui_hud_print_text(singlequote, timer_x - 43 + CustomXPos, timer_y - 5 + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x - 10 + CustomXPos, timer_y - 5 + CustomYPos, size);
    djui_hud_print_text(Doublequote, timer_x + 24 + CustomXPos, timer_y - 5 + CustomYPos, size);
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	
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
	
if gGlobalSyncTable.startspeedruntime <= 1 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end
	
	if FontTable[DefaultFont].name == "SM64" then
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
		end
	end
	
	if FontTable[DefaultFont].name == "SM64" then
	djui_hud_print_text(go_text, go_x - 3, y, doublesize);
	end
	
	if FontTable[DefaultFont].name == "SM64RH" then
	djui_hud_print_text(go_text, go_x - 3, y + 21, doublesize);
	end
end

    if countdown_sound_check == 0 and gGlobalSyncTable.startspeedruntime >= 1.01 then
	
	if FontTable[DefaultFont].name == "SM64" then
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
		end
	end
	
	if FontTable[DefaultFont].name == "SM64" then
	djui_hud_print_text(countdown_text, countdown_x - 3, y, doublesize);
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
    countdown_text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))
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
	
if gGlobalSyncTable.startspeedruntime <= 1 then
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

    if countdown_sound_check == 0 and gGlobalSyncTable.startspeedruntime >= 1.01 then

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

--------------------------------------------------------

-- Built in Fonts --
FontTable = {
    [1] = {
        name = "Normal",
        longname = "Super Mario 64 Text"
    },
	[2] = {
        name = "Aliased",
        longname = "Coop Aliased Text"
    },
	[3] = {
        name = "SM64",
        longname = "Super Mario 64"
    },
	[4] = {
        name = "SM64RH",
        longname = "Super Mario 64 (Romhack)"
    },
	[5] = {
        name = "DJUI",
        longname = "Coop DJUI"

    },
}

-- Built in Sounds --
FanfareTable = {
    [1] = {
        fanfare_sound = "Normal",
		long_fanfare_name = "Normal"
    },
}

CountdownTable = {
    [1] = {
        countdown_sound = "Normal",
		long_countdown_name = "Normal"
    },
	[2] = {
        countdown_sound = "ReversePause",
		long_countdown_name = "Reverse Pause"
    },
	[3] = {
        countdown_sound = "ShortStar",
		long_countdown_name = "Short Star"
    },
	[4] = {
        countdown_sound = "SwitchTickSpeed",
		long_countdown_name = "Switch Tick Speed"
    },
	[5] = {
        countdown_sound = "StarSound",
		long_countdown_name = "Star Sound"
    },
}

GoTable = {
    [1] = {
		go_sound = "Normal",
		long_go_name = "Normal"
    },
}

-- Save Functions From Character Select (Thanks to Squishy)
function load_fonts()
	savefont = mod_storage_load("AddFont")
    if savefont == nil or savefont == "" then
        mod_storage_save("AddFont", "Normal")
        savefont = "Normal"
    end
    if savefont ~= nil and savefont ~= "Normal" then
        for i = 2, #FontTable do
            if FontTable[i].name == savefont then
                DefaultFont = i
                break
            end
        end
    end
    return savefont
end

function load_custom_fanfare()
	savefanfare = mod_storage_load("AddFanfare")
    if savefanfare == nil or savefanfare == "" then
        mod_storage_save("AddFanfare", "Normal")
        savefont = "Normal"
    end
    if savefanfare ~= nil and savefanfare ~= "Normal" then
        for i = 2, #FanfareTable do
            if FanfareTable[i].fanfare_sound == savefanfare then
                FanfareDefault = i
                break
            end
        end
    end
    return savefanfare
end

function load_custom_countdown()
	savecountdown = mod_storage_load("AddCountdown")
    if savecountdown == nil or savefont == "" then
        mod_storage_save("AddCountdown", "Normal")
        savecountdown = "Normal"
    end
    if savecountdown ~= nil and savecountdown ~= "Normal" then
        for i = 2, #CountdownTable do
            if CountdownTable[i].countdown_sound == savecountdown then
                CountdownDefault = i
                break
            end
        end
    end
    return savecountdown
end

function load_custom_go()
	savegosound = mod_storage_load("AddGoSound")
    if savegosound == nil or savegosound == "" then
        mod_storage_save("AddGoSound", "Normal")
        savegosound = "Normal"
    end
    if savegosound ~= nil and savegosound ~= "Normal" then
        for i = 2, #GoTable do
            if GoTable[i].go_sound == savegosound then
                GoDefault = i
                break
            end
        end
    end
    return savegosound
end

function pref_font(fonts)
    mod_storage_save("AddFont", fonts.name)
	DefaultName = fonts.name
end

function pref_fanfare(sounds)
    mod_storage_save("AddFanfare", sounds.fanfare_sound)
	FanfareName = sounds.fanfare_sound
end

function pref_countdown(sounds)
	mod_storage_save("AddCountdown", sounds.countdown_sound)
	CountdownName = sounds.countdown_sound
end

function pref_go(sounds)
	mod_storage_save("AddGoSound", sounds.go_sound)
	GoName = sounds.go_sound
end

-- hooks for the huds
function on_timer_hud_render()
    djui_hud_set_resolution(RESOLUTION_N64)
	
	-- Normal Text Fonts and Aliased Text Fonts
	if FontTable[DefaultFont].name == "Normal" then
	djui_hud_set_font(FONT_NORMAL)
	normal_and_aliased_hud_render()
	elseif FontTable[DefaultFont].name == "Aliased" then
	djui_hud_set_font(FONT_ALIASED)
	normal_and_aliased_hud_render()
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
	
	if (FontTable[DefaultFont].name == "Normal" or FontTable[DefaultFont].name == "Aliased") then
	RectFontsOnly = true
	else
	RectFontsOnly = false
	end
end
