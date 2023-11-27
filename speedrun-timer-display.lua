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

if mod_storage_load("showSm64Countdown") == nil or mod_storage_load("showSm64Countdown") == "true" then
	showSm64Countdown = true
else
	showSm64Countdown = false
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

if mod_storage_load("BISFonts") == nil or mod_storage_load("BISFonts") == "true" then
	BISFonts = true
else
	BISFonts = false
end

if mod_storage_load("MPFonts") == nil or mod_storage_load("MPFonts") == "true" then
	MPFonts = true
else
	MPFonts = false
end

if mod_storage_load("MK64Fonts") == nil or mod_storage_load("MK64Fonts") == "true" then
	MK64Fonts = true
else
	MK64Fonts = false
end

if mod_storage_load("SM64DSFonts") == nil or mod_storage_load("SM64DSFonts") == "true" then
	SM64DSFonts = true
else
	SM64DSFonts = false
end

if mod_storage_load("SMBFonts") == nil or mod_storage_load("SMBFonts") == "true" then
	SMBFonts = true
else
	SMBFonts = false
end

if mod_storage_load("MPDSFonts") == nil or mod_storage_load("MPDSFonts") == "true" then
	MPDSFonts = true
else
	MPDSFonts = false
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

    -- set size
    local size = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 32 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
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

    -- set size
    local size = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 32 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
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

    -- set size
    local size = 0.50

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.0
    local y = screenHeight - 16

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6, y, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = true
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with normal font
function classic_hud_center_render()

	if not showClassicCountdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set size
    local size = 2

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 16 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 3 * size, y, width + 6 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
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

    -- set size
    local size = 2

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 16 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 3 * size, y, width + 6 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showSm64Countdown = false
	showNewCountdown = false
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

    -- set size
    local size = 1

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.0
    local y = screenHeight - 16

    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6, y, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	
	showNormalCountdown = false
	showClassicCountdown = true
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with hud font
function sm64_hud_center_render()

	if not showSm64Countdown then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 212, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 200, y + 100, 2, 2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 224, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = true
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function sm64_hud_go_center_render()

	if not showSm64Countdown then return end

if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

	-- set text
    local go_texture = get_texture_info("mario_64_go_texture")
	djui_hud_render_texture(go_texture, x + 195, y + 100, 2, 2)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = true
	showNewCountdown = false
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
function sm64_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not showSm64Countdown then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end
	
	local slash_texture = get_texture_info("mario_64_slash")
	local slash2_texture = get_texture_info("mario_64_slash_2")
	local time_texture = get_texture_info("mario_64_time_texture")
	djui_hud_render_texture(slash2_texture, x + 248.37, y + 219, 1, 1)
	djui_hud_render_texture(slash2_texture, x + 214.40, y + 219, 1, 1)
	djui_hud_render_texture(slash_texture, x + 179, y + 219, 1, 1)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 157, y + 222, 1, 1, ((math.floor(Hours/10)%10)%8)*16, (math.floor(Hours%100/80))*16, 16, 16)
	djui_hud_render_texture(time_texture, x + 99, y + 222, 1, 1)
	end
	
	if Hours < 10 then
	djui_hud_render_texture(time_texture, x + 112, y + 222, 1, 1)
	end
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 168.99, y + 222, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 188.99, y + 222, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 200.9600, y + 222, 1, 1, (math.floor(Minutes%10)%8)*16, (math.floor(Minutes%10/8))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 223.39, y + 222, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 235.39, y + 222, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)

	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 257.30, y + 222, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 269.25, y + 222, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_numbers"), x + 281.27, y + 222, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = true
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
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

    -- set size
    local size = 3
	local x = 0
	
	if gGlobalSyncTable.startspeedruntime < 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 890, y + 400, size);
	end
	
	if gGlobalSyncTable.startspeedruntime >= 10 then
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 850, y + 400, size);
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = true
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
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

    -- set size
    local size = 3
	local x = 0

    -- render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 830, y + 400, size);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = true
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
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

    -- set size
    local size = 1.50

    -- get width of screen and text
    local screenHeight = djui_hud_get_screen_height()

	local x = 0
    local y = screenHeight - 89

    -- render
    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + 700, y, size);
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = true
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with MLBIS font
function bowser_inside_story_hud_center_render()
	if not BISFonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_big_numbers"), x + 210, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_big_numbers"), x + 220, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_big_numbers"), x + 200, y + 100, 2, 2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*16, 16, 16)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = true
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function bowser_inside_story_hud_go_center_render()
	if not BISFonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("bowser_inside_story_go_texture")
	djui_hud_render_texture(go_texture, x + 165, y + 80, 2, 2)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = true
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	end
end

-- Display the timer itself
function bowser_inside_story_hud_bottom_render()
    if not showSpeedrunTimer then return end
	
	if not BISFonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 277, y + 222, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 267, y + 222, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 257, y + 222, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 233, y + 222, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 223, y + 222, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 199, y + 222, 1, 1, (math.floor(Minutes%10)%8)*16, (math.floor(Minutes%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 189, y + 222, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 165, y + 222, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("bowser_inside_story_small_numbers"), x + 155, y + 222, 1, 1, ((math.floor(Hours/10)%10)%8)*16, (math.floor(Hours%100/80))*16, 16, 16)
	end
	
	local slash_texture = get_texture_info("bowser_inside_story_slash")
	djui_hud_render_texture(slash_texture, x + 245, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, x + 211, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, x + 177, y + 222, 1, 1)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = true
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with MP/1/2/3 font
function mario_party_hud_center_render()

	if not MPFonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_party_big_numbers"), x + 203, y + 95, 1.5, 1.5, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*32, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*32, 32, 32)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_party_big_numbers"), x + 220, y + 95, 1.5, 1.5, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*32, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*32, 32, 32)
    djui_hud_render_texture_tile(get_texture_info("mario_party_big_numbers"), x + 188, y + 95, 1.5, 1.5, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*32, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*32, 32, 32)
	end
	-- set size
    local size = 1
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = true
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function mario_party_hud_go_center_render()

	if not MPFonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("mario_party_go_texture")
	djui_hud_render_texture(go_texture, x + 180, y + 95, 1.5, 1.5)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = true
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	end
end

-- Display the timer itself
function mario_party_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not MPFonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 293, y + 223, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 278, y + 223, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 263, y + 223, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 234, y + 223, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 219, y + 223, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 190, y + 223, 1, 1, (math.floor(Minutes%10)%8)*16, (math.floor(Minutes%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 175, y + 223, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 153, y + 223, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_party_small_numbers"), x + 138, y + 223, 1, 1, ((math.floor(Hours/10)%10)%8)*16, (math.floor(Hours%100/80))*16, 16, 16)
	end
	
	local slash_texture = get_texture_info("mario_party_slash")
	djui_hud_render_texture(slash_texture, x + 248, y + 223, 1, 1)
	djui_hud_render_texture(slash_texture, x + 255, y + 223, 1, 1)
	djui_hud_render_texture(slash_texture, x + 211, y + 223, 1, 1)
	djui_hud_render_texture(slash_texture, x + 204, y + 223, 1, 1)
	djui_hud_render_texture(slash_texture, x + 167, y + 223, 1, 1)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = true
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with MK64 font
function mario_kart_64_hud_center_render()

	if not MK64Fonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 210, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 219, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 203, y + 100, 2, 2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*16, 16, 16)
	end
	-- set size
    local size = 1
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = true
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function mario_kart_64_hud_go_center_render()

	if not MK64Fonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("mario_kart_64_go_texture")
	djui_hud_render_texture(go_texture, x + 200, 100, 2, 2)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = true
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	end
end

-- Display the timer itself
function mario_kart_64_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not MK64Fonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 274, y + 222, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 266, y + 222, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 258, y + 222, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 242, y + 222, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 234, y + 222, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 218, y + 222, 1, 1, (math.floor(Minutes%10)%8)*16, (math.floor(Minutes%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 210, y + 222, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 194, y + 222, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	local time_texture = get_texture_info("mario_kart_64_time_texture")
	local slash_texture = get_texture_info("mario_kart_64_slash")
	local slash_2_texture = get_texture_info("mario_kart_64_slash_2")
	djui_hud_render_texture(slash_2_texture, x + 250, y + 222, 1, 1)
	djui_hud_render_texture(slash_2_texture, x + 226, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, 	 x + 202, y + 221, 1, 1)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_kart_64_numbers"), x + 186, y + 222, 1, 1, ((math.floor(Hours/10)%10)%8)*8, (math.floor(Hours%100/80))*16, 16, 16)
	djui_hud_render_texture(time_texture, x + 155, y + 222, 1, 1)
	end
	
	if Hours < 10 then
	djui_hud_render_texture(time_texture, x + 163, y + 222, 1, 1)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = true
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with SM64DS font
function mario_64_DS_hud_center_render()

	if not SM64DSFonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_big_numbers"), x + 210, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_big_numbers"), x + 225, y + 100, 2, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_big_numbers"), x + 195, y + 100, 2, 2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*16, 16, 16)
	end

	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = true
	SMBFonts = false
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function mario_64_DS_hud_go_center_render()

	if not SM64DSFonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("mario_64_DS_go_texture")
	djui_hud_render_texture(go_texture, x + 165, y + 85, 0.5, 0.5)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = true
	SMBFonts = false
	MPDSFonts = false
	end
end

-- Display the timer itself
function mario_64_DS_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not SM64DSFonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 275, y + 222, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 266, y + 222, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 257, y + 222, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 240.9, y + 222, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 232.9, y + 222, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 217, y + 222, 1, 1, (math.floor(Minutes%10)%8)*8, (math.floor(Minutes%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 209, y + 222, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 194, y + 222, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	local time_texture = get_texture_info("mario_64_DS_time_texture")
	local slash_texture = get_texture_info("mario_64_DS_slash")
	local slash_2_texture = get_texture_info("mario_64_DS_slash_2")
	djui_hud_render_texture(slash_2_texture, x + 250, y + 222, 1, 1)
	djui_hud_render_texture(slash_2_texture, x + 226, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, 	 x + 201, y + 222, 1, 1)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_64_DS_small_numbers"), x + 186, y + 222, 1, 1, ((math.floor(Hours/10)%10)%8)*16, (math.floor(Hours%100/80))*16, 16, 16)
	djui_hud_render_texture(time_texture, x + 154, y + 222, 1, 1)
	end
	
	if Hours < 10 then
	djui_hud_render_texture(time_texture, x + 163, y + 222, 1, 1)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = true
	SMBFonts = false
	MPDSFonts = false
end

-- Display the countdown timer with SMB font
function super_mario_bros_hud_center_render()

	if not SMBFonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 215, y + 105, 3, 3, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*8, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*8, 8, 8)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 229, y + 105, 3, 3, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*8, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*8, 8, 8)
    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 205, y + 105, 3, 3, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*8, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*8, 8, 8)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = true
	MPDSFonts = false
end

-- Display the Go after the countdown timer ends
function super_mario_bros_hud_go_center_render()

	if not SMBFonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("super_mario_bros_go_texture")
	djui_hud_render_texture(go_texture, x + 195, y + 105, 3, 3)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = true
	MPDSFonts = false
	end
end

-- Display the timer itself
function super_mario_bros_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not SMBFonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 292, y + 223, 2, 2, (math.floor(MilliSeconds%10)%8)*8, (math.floor(MilliSeconds%10/8))*8, 8, 8)
    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 275, y + 223, 2, 2, ((math.floor(MilliSeconds/10)%10)%8)*8, (math.floor(MilliSeconds%100/80))*8, 8, 8)
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 258, y + 223, 2, 2, ((math.floor(MilliSeconds/100)%10)%8)*8, (math.floor(MilliSeconds%1000/800))*8, 8, 8)
	
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 232, y + 223, 2, 2, (math.floor(Seconds%10)%8)*8, (math.floor(Seconds%10/8))*8, 8, 8)
    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 215, y + 223, 2, 2, ((math.floor(Seconds/10)%10)%8)*8, (math.floor(Seconds%100/80))*8, 8, 8)
	
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 189, y + 223, 2, 2, (math.floor(Minutes%10)%8)*8, (math.floor(Minutes%10/8))*8, 8, 8)
    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 172, y + 223, 2, 2, ((math.floor(Minutes/10)%10)%8)*8, (math.floor(Minutes%100/80))*8, 8, 8)
	
	djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 144, y + 223, 2, 2, (math.floor(Hours%10)%8)*8, (math.floor(Hours%10/8))*8, 8, 8)
	
	local time_texture = get_texture_info("super_mario_bros_time_texture")
	local slash_texture = get_texture_info("super_mario_bros_slash")
	djui_hud_render_texture(slash_texture, x + 157, y + 223, 2, 2)
	djui_hud_render_texture(slash_texture, x + 201, y + 223, 2, 2)
	djui_hud_render_texture(slash_texture, x + 244, y + 223, 2, 2)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("super_mario_bros_numbers"), x + 127, y + 223, 2, 2, ((math.floor(Hours/10)%10)%8)*8, (math.floor(Hours%100/80))*8, 8, 8)
	djui_hud_render_texture(time_texture, x + 126, y + 215, 1, 1)
	end
	
	if Hours < 10 then
	djui_hud_render_texture(time_texture, x + 143, y + 215, 1, 1)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = true
	MPDSFonts = false
end

-- Display the countdown timer with MPDS font
function mario_party_DS_hud_center_render()

	if not MPDSFonts then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end
	
	if gGlobalSyncTable.startspeedruntime < 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_big_numbers"), x + 211, y + 85, 4, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*32, 16, 32)
	end
	if gGlobalSyncTable.startspeedruntime >= 10 then
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_big_numbers"), x + 227, y + 85, 4, 2, (math.floor(gGlobalSyncTable.startspeedruntime%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%10/8))*32, 16, 32)
    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_big_numbers"), x + 197, y + 85, 4, 2, ((math.floor(gGlobalSyncTable.startspeedruntime/10)%10)%8)*16, (math.floor(gGlobalSyncTable.startspeedruntime%100/80))*32, 16, 32)
	end
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = true
end

-- Display the Go after the countdown timer ends
function mario_party_DS_hud_go_center_render()

	if not MPDSFonts then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.startspeedrun <= 0 then
        return true
	else
	if gGlobalSyncTable.startspeedrun >= 25 then
	return false
    end
end

    -- set text
    local go_texture = get_texture_info("mario_party_DS_go_texture")
	djui_hud_render_texture(go_texture, x + 165, y + 105, 1, 1)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = true
	end
end

-- Display the timer itself
function mario_party_DS_hud_bottom_render()
	
    if not showSpeedrunTimer then return end
	
	if not MPDSFonts then return end
	
    if math.floor(gGlobalSyncTable.startspeedrun/30/60) < 0 then
        Seconds = math.ceil(gGlobalSyncTable.startspeedrun/30)
        MilliSeconds = (1000 - math.ceil(gGlobalSyncTable.startspeedrun/30%1 * 1000)) % 1000
    else
        Hours = math.floor(gGlobalSyncTable.startspeedrun/30/60/60)
        Minutes = math.floor(gGlobalSyncTable.startspeedrun/30/60%60)
        Seconds = math.floor(gGlobalSyncTable.startspeedrun/30)%60
        MilliSeconds = math.floor(gGlobalSyncTable.startspeedrun/30%1 * 1000)
    end

    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 272, y + 222, 1, 1, (math.floor(MilliSeconds%10)%8)*16, (math.floor(MilliSeconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 261, y + 222, 1, 1, ((math.floor(MilliSeconds/10)%10)%8)*16, (math.floor(MilliSeconds%100/80))*16, 16, 16)
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 250, y + 222, 1, 1, ((math.floor(MilliSeconds/100)%10)%8)*16, (math.floor(MilliSeconds%1000/800))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 232, y + 222, 1, 1, (math.floor(Seconds%10)%8)*16, (math.floor(Seconds%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 221, y + 222, 1, 1, ((math.floor(Seconds/10)%10)%8)*16, (math.floor(Seconds%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 203, y + 222, 1, 1, (math.floor(Minutes%10)%8)*16, (math.floor(Minutes%10/8))*16, 16, 16)
    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 192, y + 222, 1, 1, ((math.floor(Minutes/10)%10)%8)*16, (math.floor(Minutes%100/80))*16, 16, 16)
	
	djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 174, y + 222, 1, 1, (math.floor(Hours%10)%8)*16, (math.floor(Hours%10/8))*16, 16, 16)
	
	if Hours >= 10 then
    djui_hud_render_texture_tile(get_texture_info("mario_party_DS_small_numbers"), x + 163, y + 222, 1, 1, ((math.floor(Hours/10)%10)%8)*32, (math.floor(Hours%100/80))*32, 32, 32)
	end
	
	local slash_texture = get_texture_info("mario_party_DS_slash")
	djui_hud_render_texture(slash_texture, x + 183, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, x + 212, y + 222, 1, 1)
	djui_hud_render_texture(slash_texture, x + 241, y + 222, 1, 1)
	
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = true
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

    -- set size
    local size = 0.5

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 32 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0
	

	if gMarioStates[0].numStars == 1 then
    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x + 4 * size, y, width + 0 * size, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(text1star, x + 4, y, size);
	else
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 2 * size, y, width + 12 * size, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(text, x + 2, y, size);
	end
	
	for change_save_file_check in pairs(gActiveMods) do
	if gActiveMods[change_save_file_check].name:find("Change save files") then
    -- render
    djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x + 200 * size, y + 16, width - 405 * size, height);

    djui_hud_set_color(232, 17, 35, 255);
    djui_hud_print_text(textsavefilemod, x + 105, y + 16, size);
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

	-- SM64 Custom Font
    sm64_hud_center_render()
	sm64_hud_go_center_render()
    sm64_hud_bottom_render()
	
	-- SM64 Built in Font
	font_hud_center_render()
	font_hud_go_center_render()
    font_hud_bottom_render()
	
	-- Mario & Luigi: Bowser's Inside Story 
	bowser_inside_story_hud_center_render()
	bowser_inside_story_hud_go_center_render()
    bowser_inside_story_hud_bottom_render()
	
	-- Mario Party 1/2/3
	mario_party_hud_center_render()
	mario_party_hud_go_center_render()
    mario_party_hud_bottom_render()
	
	-- Mario Kart 64
	mario_kart_64_hud_center_render()
	mario_kart_64_hud_go_center_render()
    mario_kart_64_hud_bottom_render()
	
	-- Super Mario 64 DS
	mario_64_DS_hud_center_render()
	mario_64_DS_hud_go_center_render()
    mario_64_DS_hud_bottom_render()
	
	-- Super Mario Bros.
	super_mario_bros_hud_center_render()
	super_mario_bros_hud_go_center_render()
    super_mario_bros_hud_bottom_render()
	
	-- Mario Party DS
	mario_party_DS_hud_center_render()
	mario_party_DS_hud_go_center_render()
    mario_party_DS_hud_bottom_render()
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
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create('Start with Super Mario 64 Ex-coop Text Fonts!', 2)
	return true
	elseif msg == "ORIGINAL" or msg == "CLASSIC" then
	showNormalCountdown = false
	showClassicCountdown = true
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create('Start with Original Super Mario 64 Text Fonts!', 2)
	return true
	elseif msg == "SM64" then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = true
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create('Start with SM64 Fonts! (Custom Font)', 2)
	return true
	elseif msg == "SM64_BUILT" then
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
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create('Start with SM64 Fonts! (Built in)', 2)
	return true
	elseif msg == "DJUI" then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = true
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create('Start with DJUI Fonts!', 2)
	return true
	elseif msg == 'MLBIS' or msg == 'BIS' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = true
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Mario & Luigi: Bowser's Inside Story Fonts", 2)
	return true
	elseif msg == 'MP' or msg == 'MP1' or msg == 'MP2' or msg == 'MP3' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = true
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Mario Party 1/2/3 Fonts", 2)
	return true
	elseif msg == 'MK64' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = true
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Mario Kart 64 Fonts", 2)
	return true
	elseif msg == 'SM64DS' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = true
	SMBFonts = false
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Super Mario 64 DS Fonts", 2)
	return true
	elseif msg == 'SMB' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = true
	MPDSFonts = false
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Super Mario Bros. Fonts", 2)
	return true
	elseif msg == 'MPDS' then
	showNormalCountdown = false
	showClassicCountdown = false
	showSm64Countdown = false
	showNewCountdown = false
	showMenuCountdown = false
	BISFonts = false
	MPFonts = false
	MK64Fonts = false
	SM64DSFonts = false
	SMBFonts = false
	MPDSFonts = true
	mod_storage_save("showNormalCountdown", tostring(showNormalCountdown))
	mod_storage_save("showClassicCountdown", tostring(showClassicCountdown))
	mod_storage_save("showSm64Countdown", tostring(showSm64Countdown))
	mod_storage_save("showNewCountdown", tostring(showNewCountdown))
	mod_storage_save("showMenuCountdown", tostring(showMenuCountdown))
	mod_storage_save("BISFonts", tostring(BISFonts))
	mod_storage_save("MPFonts", tostring(MPFonts))
	mod_storage_save("MK64Fonts", tostring(MK64Fonts))
	mod_storage_save("SM64DSFonts", tostring(SM64DSFonts))
	mod_storage_save("SMBFonts", tostring(SMBFonts))
	mod_storage_save("MPDSFonts", tostring(MPDSFonts))
	djui_popup_create("Start with Mario Party DS Fonts", 2)
	return true
	end
	
	djui_chat_message_create("/str_config fonts \n[force_4:3|full_screen|windowed] \nor \n[normal|original|sm64_built|djui] \n[sm64|mlbis|mp|mk64|sm64ds|smb|mpds]")
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
