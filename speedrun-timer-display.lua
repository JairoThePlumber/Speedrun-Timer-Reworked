if gamemodes_is_checked or notallowedmods or no_cheats then return end

Hours = 0
Minutes = 0
Seconds = 0
MilliSeconds = 0

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

-- Built in Fonts --

function normal_hud_center_render()
	
	if not showSpeedrunTimer then return end

	if not _G.FontsSelect == 1 then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))
	
	-- set size
	size = 1
	height = 32 * size

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
	djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
	djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	end
end

function normal_hud_go_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 1 then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set size
	size = 1
	height = 32 * size

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
	djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);
	
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
		end
	end
end

function normal_hud_bottom_render()
	
	if showSpeedrunTimer ~= 1 then return end

    if not showSpeedrunTimer then return end
	
	if not _G.FontsSelect == 1 then return end
    -- set text
    local text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))

    -- set size
	size = 0.50

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.0
    local y = screenHeight - 16

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(x - 6 + CustomXPos, y + CustomYPos, width + 12, 16);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x + CustomXPos, y + CustomYPos, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 + CustomXPos, y + CustomYPos, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + CustomXPos, y + CustomYPos, size);
	end
end

function aliased_hud_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 2 then return end

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
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
	end
end

function aliased_hud_go_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 2 then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
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
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x, y, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 * size, y, width + 12 * size, height);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x, y, size);
		end
	end
end

function aliased_hud_bottom_render()
	
    if showSpeedrunTimer ~= 1 then return end
	
	if not _G.FontsSelect == 2 then return end
	
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
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorRect, GreenColorRect, BlueColorRect, VisableRect);
    djui_hud_render_rect(x - 6 + CustomXPos, y + CustomYPos, width + 12, 16);

    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
    djui_hud_print_text(text, x + CustomXPos, y + CustomYPos, size);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(0, 0, 0, 128);
    djui_hud_render_rect(x - 6 + CustomXPos, y + CustomYPos, width + 12, 16);

    djui_hud_set_color(255, 255, 255, 255);
    djui_hud_print_text(text, x + CustomXPos, y + CustomYPos, size);
	end
end

function font_hud_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 3 then return end

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
	y = (screenHeight - height) / 2.5
	
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	djui_hud_print_text(text, x - 3, y, size);
end

function font_hud_go_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 3 then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end

    -- set text
    local text = "GO!"

    -- set size
    local size = 2
	
	-- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 16 * size

    local x = (screenWidth - width) / 2.0
	y = (screenHeight - height) / 2.5
	
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end

	djui_hud_print_text(text, x - 3, y, size);
	end
end

function font_hud_bottom_render()
	
    if showSpeedrunTimer ~= 1 then return end
	
	if not _G.FontsSelect == 3 then return end

    -- set text
	local timetext = "TIME"
	local text = "'"
	local alsotext = '"'
	
	local hours10text = string.format('%s', string.format("%02d", Hours))
    local hourstext = string.format('%s', string.format("%d", Hours))
	local Minutestext = string.format('%s', string.format("%02d", Minutes))
	local secondstext = string.format('%s', string.format("%02d", Seconds))
	local millisecondstext = string.format('%s', string.format("%03d", MilliSeconds))

    -- set size
    local size = 1
	
	local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = 1 * 1

    local x = (screenWidth - width) / 2.0
	y = screenHeight - 26
	
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	
	if Hours >= 10 then
	djui_hud_print_text(timetext, x - 125 + CustomXPos, y - 2 + CustomYPos, size);
	end

	if Hours < 10 then
	djui_hud_print_text(timetext, x - 115 + CustomXPos, y - 2 + CustomYPos, size);
	end
	
	if Hours >= 10 then
    djui_hud_print_text(hours10text, x - 70 + CustomXPos, y - 2 + CustomYPos, size);
	end
	
	if Hours < 10 then
    djui_hud_print_text(hourstext, x - 58 + CustomXPos, y - 2 + CustomYPos, size);
	end
	
    djui_hud_print_text(Minutestext, x - 38 + CustomXPos, y - 2 + CustomYPos, size);
    djui_hud_print_text(secondstext, x - 4 + CustomXPos, y - 2 + CustomYPos, size);
    djui_hud_print_text(millisecondstext, x + 30 + CustomXPos, y - 2 + CustomYPos, size);
	
	djui_hud_print_text(text, x - 43 + CustomXPos, y - 5 + CustomYPos, size);
    djui_hud_print_text(alsotext, x - 10 + CustomXPos, y - 5 + CustomYPos, size);
    djui_hud_print_text(alsotext, x + 24 + CustomXPos, y - 5 + CustomYPos, size);
end

function font_menu_hud_center_render()

	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 4 then return end

    if gGlobalSyncTable.startspeedruntime <= 0 then
        return
    end

    -- set text
    local text = tostring(math.floor(gGlobalSyncTable.startspeedruntime))

    -- set size
    local size = 0.75

	-- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 50 * size

    local x = (screenWidth - width) / 2.04
    local y = (screenHeight - height) / 2.0
	
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	djui_hud_print_text(text, x, y, size);
end

function font_menu_hud_go_center_render()
	
	if showSpeedrunTimer ~= 1 then return end

	if not _G.FontsSelect == 4 then return end
	
if gGlobalSyncTable.startspeedruntime <= 0 then
    if gGlobalSyncTable.GoTimer <= 0 then
        return true
	else
	if gGlobalSyncTable.GoTimer >= 30 then
	return false
    end
end

    -- set text
    local text = "Go!"

    -- set size
    local size = 0.75

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size
    local height = 50 * size

    local x = (screenWidth - width) / 2.0
    local y = (screenHeight - height) / 2.0

    -- render
    if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	djui_hud_print_text(text, x, y, size);
	end
end

function font_menu_hud_bottom_render()
	
   if showSpeedrunTimer ~= 1 then return end
	
	if not _G.FontsSelect == 4 then return end

    -- set text
    local text = string.format("%s:%s:%s.%s", string.format("%d", Hours), string.format("%02d", Minutes), string.format("%02d", Seconds), string.format("%03d", MilliSeconds))

    -- set size
    local size = 0.36

    -- get width of screen and text
    local screenWidth = djui_hud_get_screen_width()
    local screenHeight = djui_hud_get_screen_height()
    local width = djui_hud_measure_text(text) * size

    local x = (screenWidth - width) / 2.01
    local y = screenHeight - 21

    -- render
	if DisplayCustomColors == 1 then
    djui_hud_set_color(RedColorFont, GreenColorFont, BlueColorFont, VisableFont);
	elseif DisplayCustomColors == 0 then
	djui_hud_set_color(255, 255, 255, 255);
	end
	djui_hud_print_text(text, x + CustomXPos, y + CustomYPos, size);
end

--------------------------------------------------------

-- hooks for the huds
function on_timer_hud_render()
    djui_hud_set_resolution(RESOLUTION_N64)
	
	-- Normal Text Fonts
	if _G.SwitchFonts == 0 then
	-- Original Text Fonts
	if _G.FontsSelect == 1 then
	djui_hud_set_font(FONT_NORMAL)
	
	RectFontsOnly = true
	normal_hud_center_render()
	normal_hud_go_center_render()
    normal_hud_bottom_render()
	end
	
	-- aliased Text Fonts
	if _G.FontsSelect == 2 then
	djui_hud_set_font(FONT_ALIASED)
	
	RectFontsOnly = true
	aliased_hud_center_render()
	aliased_hud_go_center_render()
    aliased_hud_bottom_render()
	end
	
	-- SM64 Built in Fonts
	if _G.FontsSelect == 3 then
	if DisplayCustomColors == 1 then
	djui_hud_set_font(FONT_RECOLOR_HUD)
	elseif DisplayCustomColors == 0 then
	djui_hud_set_font(FONT_CUSTOM_HUD)
	end

	font_hud_center_render()
	font_hud_go_center_render()
    font_hud_bottom_render()
	end
	
	-- Djui Fonts
	if _G.FontsSelect == 4 then
	djui_hud_set_font(FONT_MENU)

	font_menu_hud_center_render()
	font_menu_hud_go_center_render()
    font_menu_hud_bottom_render()
		end
	end
end
