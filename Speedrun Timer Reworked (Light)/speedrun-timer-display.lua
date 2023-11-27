if gamemodes_is_checked or notallowedmods or no_cheats then return end

if mod_storage_load("showSpeedrunTimer") == nil or mod_storage_load("showSpeedrunTimer") == "true" then
	showSpeedrunTimer = true
else
	showSpeedrunTimer = false
end

if mod_storage_load("showNormalCountdown") == nil or mod_storage_load("showNormalCountdown") == "true" then
	showNormalCountdown = true
else
	showNormalCountdown = false
end

if mod_storage_load("showClassicCountdown") == nil or mod_storage_load("showClassicCountdown") == "true" then
	showClassicCountdown = true
else
	showClassicCountdown = false
end

if mod_storage_load("showNewCountdown") == nil or mod_storage_load("showNewCountdown") == "true" then
	showNewCountdown = true
else
	showNewCountdown = false
end

if mod_storage_load("showMenuCountdown") == nil or mod_storage_load("showMenuCountdown") == "true" then
	showMenuCountdown = true
else
	showMenuCountdown = false
end

if mod_storage_load("force_4by3") == nil or mod_storage_load("force_4by3") == "true" then
	force_4by3 = true
else
	force_4by3 = false
end

if mod_storage_load("full_screen") == nil or mod_storage_load("full_screen") == "true" then
	full_screen = true
else
	full_screen = false
end

if mod_storage_load("windowed") == nil or mod_storage_load("windowed") == "true" then
	windowed = true
else
	windowed = false
end

if force_4by3 then
x = -69
y = 0
end

if full_screen then
x = -10
y = 0
end

if windowed then
x = 0
y = 0
end

-- Don't remove this, otherwise a error appears
x = 0
y = 0

Hours = 0
Minutes = 0
Seconds = 0
MilliSeconds = 0
Total = 0

function speedrun_timer_display()
	showSpeedrunTimer = not showSpeedrunTimer
	mod_storage_save("showSpeedrunTimer", tostring(showSpeedrunTimer))
	if showSpeedrunTimer then
		djui_popup_create("Timer Display is now Enabled", 1)
	else
		djui_popup_create("Timer Display is now Disabled", 1)
	end
	return true
end

-- Display the countdown timer with normal font
function normal_hud_center_render()

	if not showNormalCountdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set scale
    local scale = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale
    local height = 32 * scale

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = false
end

-- Display the Go after the countdown timer ends
function normal_hud_go_center_render()

	if not showNormalCountdown then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set scale
    local scale = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale
    local height = 32 * scale

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * scale, y, width + 12 * scale, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = false
	end
end

-- Display the timer itself
function normal_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not showNormalCountdown then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    -- set text
    local text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))

    -- set scale
    local scale = 0.50

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale

    local x = (screenWidth - width) / 2.0
    local y = screenHeight - 16

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6, y, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = false
end

-- Display the countdown timer with normal font
function classic_hud_center_render()

	if not showClassicCountdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set scale
    local scale = 2

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale
    local height = 16 * scale

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 3 * scale, y, width + 6 * scale, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showNewCountdown = false
	showMenuCountdown = false
end

-- Display the Go after the countdown timer ends
function classic_hud_go_center_render()

	if not showClassicCountdown then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set scale
    local scale = 2

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale
    local height = 16 * scale

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 3 * scale, y, width + 6 * scale, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showNewCountdown = false
	showMenuCountdown = false
	end
end

-- Display the timer itself
function classic_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not showClassicCountdown then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    -- set text
    local text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))

    -- set scale
    local scale = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale

    local x = (screenWidth - width) / 2.0
    local y = screenHeight - 16

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6, y, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, scale);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showNewCountdown = false
	showMenuCountdown = false
end

-- Display the countdown timer with hud font
function font_hud_center_render()

	if not showNewCountdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set size
    local size = 2
	
	if gGlobalSyncTable.startspeedruntime < 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 212, y + 100, size);
	end
	
	if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 200, y + 100, size);
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = true
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function font_hud_go_center_render()

	if not showNewCountdown then return end

if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set size
    local size = 2

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 200, y + 100, size);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = true
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	end
end

-- Display the timer itself
function font_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not showNewCountdown then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    -- set text
	local timetext = "Time"
	local text = "'"
	local alsotext = '"'
	
	local hours10text = string.format('%s', string.format("%02d", Hours))
    local hourstext = string.format('%s', string.format("%d", Hours))
	local Minutestext = string.format('%s', string.format("%02d", Minutes))
	local secondstext = string.format('%s', string.format("%02d", Seconds))
	local millisecondstext = string.format('%s', string.format("%03d", MilliSeconds))

    -- set size
    local size = 1
	
	if Hours >= 10 then
	djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(hours10text, x + 157, y + 222, size);
	djui_hud_print_text(timetext, x + 99, y + 222, size);
	end
	
	if Hours < 10 then
	djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(hourstext, x + 169, y + 222, size);
	djui_hud_print_text(timetext, x + 112, y + 222, size);
	end


    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(Minutestext, x + 189, y + 222, size);


    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(secondstext, x + 223.4, y + 222, size);


    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(millisecondstext, x + 257.3, y + 222, size);

    -- render
	
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 179, y + 214, size);


    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(alsotext, x + 214.4, y + 214, size);
	
	djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(alsotext, x + 248.3, y + 214, size);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = true
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with djui font
function font_menu_hud_center_render()

	if not showMenuCountdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set scale
    local scale = 3
	local x = 0
	
	if gGlobalSyncTable.startspeedruntime < 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 890, y + 400, scale);
	end
	
	if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 850, y + 400, scale);
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = true
end

-- Display the Go after the countdown timer ends
function font_menu_hud_go_center_render()

	if not showMenuCountdown then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set scale
    local scale = 3
	local x = 0

    -- render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 830, y + 400, scale);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = true
	end
end

-- Display the timer itself
function font_menu_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not showMenuCountdown then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    -- set text
    local text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))

    -- set scale
    local scale = 1.50

    -- get width of screen and text
    local screenHeight = djui_hud_get_screen_height()

	local x = 0
    local y = screenHeight - 89

    -- render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 700, y, scale);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = true
end

-- This prevents people for forgetting to make a fresh savefile
function save_file_stars()
	local m = gMarioStates[0]
	if not gGlobalSyncTable.startTimer or not gGlobalSyncTable.startIntro then
	if m.numStars <= 0 then
		return true
	elseif gGlobalSyncTable.startspeedrun >= 1 or gGlobalSyncTable.restartTimer then
		return false
	end

    -- set text
    local text = "You're starting a run with " .. gMarioStates[0].numStars .. " Stars in your save file, go back and rehost with a fresh save file"
	local text1star = "You're starting a run with " .. gMarioStates[0].numStars .. " Star in your save file, go back and rehost with a fresh save file"
	local textsavefilemod = "Unless you're using the change save files mod"

    -- set scale
    local scale = 0.5

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * scale
    local height = 32 * scale

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0
	

	if gMarioStates[0].numStars == 1 then
    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x + 4 * scale, y, width + 0 * scale, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(text1star, x + 4, y, scale);
	else
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 2 * scale, y, width + 12 * scale, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(text, x + 2, y, scale);
	end
	
	for change_save_file_check in pairs(gActiveMods) do
	if gActiveMods[change_save_file_check].name:find("Change save files") then
    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x + 200 * scale, y + 16, width - 405 * scale, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(textsavefilemod, x + 105, y + 16, scale);
		end
	end
	
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
	gGlobalSyncTable.starany = false
	gGlobalSyncTable.star20 = false
	gGlobalSyncTable.star80 = false
	gGlobalSyncTable.star130 = false
	gGlobalSyncTable.star150 = false
	gGlobalSyncTable.star64 = false
	gGlobalSyncTable.star74 = false
	gGlobalSyncTable.timestarany = false
	gGlobalSyncTable.timestarwarplessany = false
	gGlobalSyncTable.timestar81 = false
	gGlobalSyncTable.timestar90 = false
	gGlobalSyncTable.timestarallbosses = false
	end
end

-- hooks for the huds
function on_timer_hud_render()
	if showNormalCountdown then
	djui_hud_set_font(FONT_NORMAL)
	djui_hud_set_resolution(RESOLUTION_N64)
	
	-- Normal Text Fonts
	normal_hud_center_render()
	normal_hud_go_center_render()
    normal_hud_bottom_render()
	end
	
	if showClassicCountdown then
	djui_hud_set_font(FONT_TINY)
    djui_hud_set_resolution(RESOLUTION_N64)
	
	-- Original Text Fonts
	classic_hud_center_render()
	classic_hud_go_center_render()
    classic_hud_bottom_render()
	end
	
	if showMenuCountdown then
	djui_hud_set_font(FONT_MENU)
	djui_hud_set_resolution(RESOLUTION_DJUI)
	
	-- Djui Fonts
	font_menu_hud_center_render()
	font_menu_hud_go_center_render()
    font_menu_hud_bottom_render()
	end

    djui_hud_set_font(FONT_HUD)
    djui_hud_set_resolution(RESOLUTION_N64)
	
	-- SM64 Fonts
	font_hud_center_render()
	font_hud_go_center_render()
    font_hud_bottom_render()
end

function on_save_file_hud_render()
	djui_hud_set_font(FONT_NORMAL)
	djui_hud_set_resolution(RESOLUTION_N64)
	
	save_file_stars()
end

-- Display different fonts to make things nicer
function different_fonts_command(msg)
	if msg == "FORCE_4:3" then
	force_4by3 = true
	full_screen = false
	windowed = false
	mod_storage_save("force_4by3", tostring(force_4by3))
	mod_storage_save("full_screen", tostring(full_screen))
	mod_storage_save("windowed", tostring(windowed))
	djui_popup_create("Start with Force 4:3 Position", 2)
	return true
	elseif msg == "FULL_SCREEN" then
	force_4by3 = false
	full_screen = true
	windowed = false
	mod_storage_save("force_4by3", tostring(force_4by3))
	mod_storage_save("full_screen", tostring(full_screen))
	mod_storage_save("windowed", tostring(windowed))
	djui_popup_create("Start with Full Screen Position", 2)
	return true
	elseif msg == "WINDOWED" then
	force_4by3 = false
	full_screen = false
	windowed = true
	mod_storage_save("force_4by3", tostring(force_4by3))
	mod_storage_save("full_screen", tostring(full_screen))
	mod_storage_save("windowed", tostring(windowed))
	djui_popup_create("Start with Windowed Position", 2)
	return true
	end
	
	if msg == "NORMAL" then
	showNormalCountdown = true
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	djui_popup_create('Start with Super Mario 64 Ex-coop Text Fonts!', 2)
	return true
	elseif msg == "ORIGINAL" or msg == "CLASSIC" then
	showNormalCountdown = false
	showClassicCountdown = true
	showNewCountdown = false
	showMenuCountdown = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	djui_popup_create('Start with Original Super Mario 64 Text Fonts!', 2)
	return true
	elseif msg == "SM64" then
	showNormalCountdown = false
	showClassicCountdown = false
	showNewCountdown = true
	showMenuCountdown = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	djui_popup_create('Start with SM64 Fonts!', 2)
	return true
	elseif msg == "DJUI" then
	showNormalCountdown = false
	showClassicCountdown = false
	showNewCountdown = false
	showMenuCountdown = true
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	djui_popup_create('Start with DJUI Fonts!', 2)
	return true
	end
	
	djui_chat_message_create("/str_config fonts \n[force_4:3|full_screen|windowed] \nor \n[normal|original|sm64|djui]")
	return true
end

function reworked_config_command_description(m)
	if m.playerIndex ~= 0 then return end
	
	if showSpeedrunTimer then
	SST_Name = '\\#00FF00\\display\\#FFFFFF\\'
	else
	SST_Name = '\\#FF0000\\display\\#FFFFFF\\'
	end
	
	if Rules_Display then
	RD_Name = '\\#00FF00\\rules\\#FFFFFF\\'
	else
	RD_Name = '\\#FF0000\\rules\\#FFFFFF\\'
	end
	
	if SpeedrunTeams and gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam then
	Teams_Name = '|\\#f90303\\team\\#FFFFFF\\]'
	elseif SpeedrunTeams and gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam then
	Teams_Name = '|\\#3903ff\\team\\#FFFFFF\\]'
	else
	Teams_Name = ']'
	end
	
	
	update_chat_command_description('str_config', "[info|fonts|" .. SST_Name .. "|" .. RD_Name .. "|warp" .. Teams_Name .. "")
end

function reworked_settings_command(msg)	
	local args = {}
    for argument in string.upper(msg):gmatch("%S+") do table.insert(args, argument) end
	
	if args[1] == "INFO" or args[1] == "INFOS" then
		return displaycredits2(args[2])
	elseif args[1] == "FONTS" then
		return different_fonts_command(args[2])
	elseif args[1] == "DISPLAY" then
		return speedrun_timer_display(args[2])
	elseif args[1] == "RULES" then
		return speedrun_rules_display(args[2])
	elseif args[1] == "WARP" then
		return restart_location_area()
	elseif args[1] == "TEAM" or args[1] == "TEAMS" then
		return teams_color_command(args[2])
	end
	
	if SpeedrunTeams then
	djui_chat_message_create("/str_config [info|fonts|display|rules|warp|team]")
	return true
	else
	djui_chat_message_create("/str_config [info|fonts|display|rules|warp]")
	return true
	end
end

hook_chat_command('str_config', "[info|fonts|display|rules|warp|team]", reworked_settings_command)
