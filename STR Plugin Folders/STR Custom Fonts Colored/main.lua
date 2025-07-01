-- name: STR Official Custom Fonts Colored
-- incompatible:
-- description: The Official Speedrun Timer Custom Fonts Plugins

-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

SMB1ColorName, SMB1ColorTex = "SMB1Color", "smb_fonts_colors"
SMB2ColorName, SMB2ColorTex = "SMB2Color", "smb2_fonts_colors"

SMWColorName, SMWColorTex = "SMWColor", "smw_fonts_colors"
SMKColorName, SMKColorTex = "SMKColor", "smk_fonts_colors"
SMB1ASColorName, SMB1ASColorTex = "SMB1ASColor", "smbas_fonts_colors"
SMB2ASColorName, SMB2ASColorTex = "SMB2ASColor", "smb2as_fonts_colors"
SMB3ASColorName, SMB3ASColorTex = "SMB3ASColor", "smb3as_fonts_colors"

SM64ColorName, SM64ColorTex = "SM64Color", "sm64_fonts_colors"
MK64ColorName, MK64ColorTex = "MK64Color", "mk64_fonts_colors"
MP64ColorName, MP64ColorTex = "MP64Color", "mp64_fonts_colors"
MT64ColorName, MT64ColorTex = "MT64Color", "mt64_fonts_colors"
PM64ColorName, PM64ColorTex = "PM64Color", "pm64_fonts_colors"

MBCColorName, MBCColorTex = "MBCColor", "mbc_fonts_colors"
MKSCColorName, MKSCColorTex = "MKSCColor", "mksc_fonts_colors"
MPEColorName, MPEColorTex = "MPEColor", "mpe_fonts_colors"
MLSSColorName, MLSSColorTex = "MLSSColor", "mlss_fonts_colors"
MPLColorName, MPLColorTex = "MPLColor", "mpl_fonts_colors"

SM64DSColorName, SM64DSColorTex = "SM64DSColor", "sm64ds_fonts_colors"
MKDSColorName, MKDSColorTex = "MKDSColor", "mkds_fonts_colors"
MLPITColorName, MLPITColorTex = "MLPITColor", "mlpit_fonts_colors"
MPDSColorName, MPDSColorTex = "MPDSColor", "mpds_fonts_colors"
MLBISColorName, MLBISColorTex = "MLBISColor", "mlbis_fonts_colors"

ModernColorName, ModernColorTex = "SuperMarioColor", "modern_fonts_colors"

-- NES
_G.STRApi.add_custom_fonts(SMB1ColorName, "Super Mario Bros. (Colors)")
_G.STRApi.add_custom_fonts(SMB2ColorName, "Super Mario Bros. 2 USA (Colors)")

-- SNES
_G.STRApi.add_custom_fonts(SMWColorName, "Super Mario World (Colors)")
_G.STRApi.add_custom_fonts(SMKColorName, "Super Mario Kart (Colors)")
_G.STRApi.add_custom_fonts(SMB1ASColorName, "Super Mario Bros. All Stars (Colors)")
_G.STRApi.add_custom_fonts(SMB2ASColorName, "Super Mario Bros. 2 All Stars (Colors)")
_G.STRApi.add_custom_fonts(SMB3ASColorName, "Super Mario Bros. 3 All Stars (Colors)")

-- N64
_G.STRApi.add_custom_fonts(SM64ColorName, "Super Mario 64 Custom (Colors)")
_G.STRApi.add_custom_fonts(MK64ColorName, "Mario Kart 64 (Colors)")
_G.STRApi.add_custom_fonts(MP64ColorName, "Mario Party 1/2/3 (Colors)")
_G.STRApi.add_custom_fonts(MT64ColorName, "Mario Tennis 64 (Colors)")
_G.STRApi.add_custom_fonts(PM64ColorName, "Paper Mario 64 (Colors)")

-- GBA
_G.STRApi.add_custom_fonts(MBCColorName, "Mario Bros. Classic GBA (Colors)")
_G.STRApi.add_custom_fonts(MKSCColorName, "Mario Kart: Super Circuit (Colors)")
_G.STRApi.add_custom_fonts(MPEColorName, "Mario Party-e (Colors)")
_G.STRApi.add_custom_fonts(MLSSColorName, "Mario & Luigi: Superstar Saga (Colors)")
_G.STRApi.add_custom_fonts(MPLColorName, "Mario Pinball Land (Colors)")

-- DS
_G.STRApi.add_custom_fonts(SM64DSColorName, "Super Mario 64 DS (Colors)")
_G.STRApi.add_custom_fonts(MKDSColorName, "Mario Kart DS (Colors)")
_G.STRApi.add_custom_fonts(MLPITColorName, "Mario & Luigi: Partners in Time (Colors)")
_G.STRApi.add_custom_fonts(MPDSColorName, "Mario Party DS (Colors)")
_G.STRApi.add_custom_fonts(MLBISColorName, "Mario & Luigi: Bowser's inside Story (Colors)")

-- Modern
_G.STRApi.add_custom_fonts("SuperMario", "Modern Super Mario (Colors)")

local function custom_fonts_display()
	if not _G.STREnabled then return end
	local m = gMarioStates[0]
    djui_hud_set_resolution(RESOLUTION_N64)

	local screenWidth = djui_hud_get_screen_width()
	local screenHeight = djui_hud_get_screen_height()
	local width = 0 * 1
	local height = 16 * 1

	local x = (screenWidth - width) / 2.0
	local y = (screenHeight - height) / 2.0
	
	-- Super Mario Bros. Fonts
	_G.STRApi.set_custom_colors(true)
	_G.STRApi.set_custom_countdown(SMB1ColorName, SMB1ColorTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB1ColorName, SMB1ColorTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB1ColorName, SMB1ColorTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB1ColorName, SMB1ColorTex, x - 30, y, 0.75, 3, 0, 8, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB1ColorName, SMB1ColorTex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB1ColorName, SMB1ColorTex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB1ColorName, SMB1ColorTex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB1ColorName, SMB1ColorTex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB1ColorName, SMB1ColorTex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB1ColorName, SMB1ColorTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB1ColorName, SMB1ColorTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB1ColorName, SMB1ColorTex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB1ColorName, SMB1ColorTex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB1ColorName, SMB1ColorTex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ColorName, SMB1ColorTex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ColorName, SMB1ColorTex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB1ColorName, SMB1ColorTex, x - 60, y + 104, 0.25, 1, 97, 0, 32, 8, 0, 0, "None", "Static", x - 76, y + 104)
	
	-- Super Mario Bros. 2 (USA) Fonts
	_G.STRApi.set_custom_countdown(SMB2ColorName, SMB2ColorTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB2ColorName, SMB2ColorTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB2ColorName, SMB2ColorTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB2ColorName, SMB2ColorTex, x - 27, y, 0.75, 3, 97, 0, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB2ColorName, SMB2ColorTex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB2ColorName, SMB2ColorTex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB2ColorName, SMB2ColorTex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB2ColorName, SMB2ColorTex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB2ColorName, SMB2ColorTex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB2ColorName, SMB2ColorTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB2ColorName, SMB2ColorTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB2ColorName, SMB2ColorTex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB2ColorName, SMB2ColorTex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB2ColorName, SMB2ColorTex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ColorName, SMB2ColorTex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ColorName, SMB2ColorTex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	
	-- Super Mario World Fonts
	_G.STRApi.set_custom_countdown(SMWColorName, SMWColorTex, x - 8, y - 8, 4, 2, 8, 7, 8, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(SMWColorName, SMWColorTex, x, y - 8, 4, 2, 8, 7, 8, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(SMWColorName, SMWColorTex, x - 16, y - 8, 4, 2, 8, 7, 8, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x + 8, y - 6, 0.8, 2, 80, 8, 40, 16)
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x + 112, y - 6, 8, 2, 121, 8, 4, 16)
	if m.character.type == CT_MARIO then
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x - 94, y - 6, 0.744, 2, 0, 24, 43, 16)
	elseif m.character.type == CT_LUIGI then
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x - 88, y - 6, 0.842, 2, 43, 24, 38, 16)
	elseif m.character.type == CT_TOAD then
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x - 72, y - 6, 1, 2, 81, 24, 32, 16)
	elseif m.character.type == CT_WALUIGI then
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x - 113.7, y - 6, 0.626, 2, 0, 40, 51, 16)
	elseif m.character.type == CT_WARIO then
	_G.STRApi.set_custom_go(SMWColorName, SMWColorTex, x - 94, y - 6, 0.744, 2, 51, 40, 43, 16)
	end
	_G.STRApi.set_custom_milliseconds(SMWColorName, SMWColorTex, x + 86, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMWColorName, SMWColorTex, x + 70, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMWColorName, SMWColorTex, x + 54, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMWColorName, SMWColorTex, x + 26, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMWColorName, SMWColorTex, x + 10, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMWColorName, SMWColorTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMWColorName, SMWColorTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMWColorName, SMWColorTex, x - 62, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMWColorName, SMWColorTex, x - 78, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMWColorName, SMWColorTex, x - 49, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMWColorName, SMWColorTex, x - 5, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMWColorName, SMWColorTex, x + 39, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMWColorName, SMWColorTex, x - 62, y + 102, 0.25, 1, 96, 0, 32, 8, 0, 0, "None", "Static", x - 78, y + 102)
	
	-- Super Mario Kart Fonts
	_G.STRApi.set_custom_countdown(SMKColorName, SMKColorTex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMKColorName, SMKColorTex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMKColorName, SMKColorTex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMKColorName, SMKColorTex, x - 44.3, y - 6, 0.747, 2, 0, 16, 45, 16)
	_G.STRApi.set_custom_milliseconds(SMKColorName, SMKColorTex, x + 57.3, y + 105, 2.8, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMKColorName, SMKColorTex, x + 46.1, y + 105, 2.8, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMKColorName, SMKColorTex, x + 35.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMKColorName, SMKColorTex, x + 13.9, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMKColorName, SMKColorTex, x + 3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMKColorName, SMKColorTex, x - 18.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMKColorName, SMKColorTex, x - 29.4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMKColorName, SMKColorTex, x - 51, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMKColorName, SMKColorTex, x - 61.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(SMKColorName, SMKColorTex, x - 42.7, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SMKColorName, SMKColorTex, x - 9, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SMKColorName, SMKColorTex, x + 23.3, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	
	-- Super Mario Bros. (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB1ASColorName, SMB1ASColorTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB1ASColorName, SMB1ASColorTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB1ASColorName, SMB1ASColorTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB1ASColorName, SMB1ASColorTex, x - 30, y, 0.75, 3, 0, 8, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB1ASColorName, SMB1ASColorTex, x + 86, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB1ASColorName, SMB1ASColorTex, x + 70, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB1ASColorName, SMB1ASColorTex, x + 54, y + 110, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB1ASColorName, SMB1ASColorTex, x + 26, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB1ASColorName, SMB1ASColorTex, x + 10, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB1ASColorName, SMB1ASColorTex, x - 18, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB1ASColorName, SMB1ASColorTex, x - 34, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB1ASColorName, SMB1ASColorTex, x - 62, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB1ASColorName, SMB1ASColorTex, x - 78, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB1ASColorName, SMB1ASColorTex, x - 48, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ASColorName, SMB1ASColorTex, x - 4, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ASColorName, SMB1ASColorTex, x + 40, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB1ASColorName, SMB1ASColorTex, x - 62, y + 101, 0.25, 1, 96, 0, 32, 8, 0, 0, "None", "Static", x - 78, y + 101)
	
	-- Super Mario Bros. 2 (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB2ASColorName, SMB2ASColorTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB2ASColorName, SMB2ASColorTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB2ASColorName, SMB2ASColorTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB2ASColorName, SMB2ASColorTex, x - 27, y, 0.75, 3, 97, 0, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB2ASColorName, SMB2ASColorTex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB2ASColorName, SMB2ASColorTex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB2ASColorName, SMB2ASColorTex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB2ASColorName, SMB2ASColorTex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB2ASColorName, SMB2ASColorTex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB2ASColorName, SMB2ASColorTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB2ASColorName, SMB2ASColorTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB2ASColorName, SMB2ASColorTex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB2ASColorName, SMB2ASColorTex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB2ASColorName, SMB2ASColorTex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ASColorName, SMB2ASColorTex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ASColorName, SMB2ASColorTex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	
	-- Super Mario Bros. 3 (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB3ASColorName, SMB3ASColorTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB3ASColorName, SMB3ASColorTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB3ASColorName, SMB3ASColorTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x + 11, y - 3, 0.77, 2, 84, 8, 34, 13)
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x + 84, y - 3, 13, 2, 121, 8, 2, 13)
	if m.character.type == CT_MARIO then
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x - 64, y - 3, 0.77, 2, 0, 8, 31, 13)
	elseif m.character.type == CT_LUIGI then
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x - 61, y - 3, 1, 2, 31, 8, 26, 13)
	elseif m.character.type == CT_TOAD then
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x - 61, y - 3, 0.965, 2, 57, 8, 27, 13)
	elseif m.character.type == CT_WALUIGI then
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x - 90, y - 3, 0.626, 2, 0, 21, 41, 13)
	elseif m.character.type == CT_WARIO then
	_G.STRApi.set_custom_go(SMB3ASColorName, SMB3ASColorTex, x - 64, y - 3, 0.77, 2, 41, 21, 31, 13)
	end
	_G.STRApi.set_custom_milliseconds(SMB3ASColorName, SMB3ASColorTex, x + 86, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB3ASColorName, SMB3ASColorTex, x + 70, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB3ASColorName, SMB3ASColorTex, x + 54, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB3ASColorName, SMB3ASColorTex, x + 26, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB3ASColorName, SMB3ASColorTex, x + 10, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB3ASColorName, SMB3ASColorTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB3ASColorName, SMB3ASColorTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB3ASColorName, SMB3ASColorTex, x - 62, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB3ASColorName, SMB3ASColorTex, x - 78, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB3ASColorName, SMB3ASColorTex, x - 49, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB3ASColorName, SMB3ASColorTex, x - 5, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB3ASColorName, SMB3ASColorTex, x + 39, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB3ASColorName, SMB3ASColorTex, x - 80, y + 112, 2, 2, 96, 0, 8, 8, 0, 0, "None", "Static", x - 96, y + 103)
	
	-- SM64 Fonts
	_G.STRApi.set_custom_countdown(SM64ColorName, SM64ColorTex, x - 26.7, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_countdown(SM64ColorName, SM64ColorTex, x - 2.7, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SM64ColorName, SM64ColorTex, x - 14.2, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_go(SM64ColorName, SM64ColorTex, x - 26.0, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_extras(SM64ColorName, SM64ColorTex, x + 23.9, y + 107, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64ColorName, SM64ColorTex, x - 10.2, y + 107, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64ColorName, SM64ColorTex, x - 45.2, y + 107, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_time(SM64ColorName, SM64ColorTex, x - 115, y + 110, 0.25, 1, 192, 0, 64, 16, 0, 0, "None", "Static", x - 127, y + 110)
	_G.STRApi.set_custom_hours(SM64ColorName, SM64ColorTex, x - 67.3, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_hours(SM64ColorName, SM64ColorTex, x - 55, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SM64ColorName, SM64ColorTex, x - 35, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SM64ColorName, SM64ColorTex, x - 23.2, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SM64ColorName, SM64ColorTex, x - 1, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_seconds(SM64ColorName, SM64ColorTex, x + 10.9, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_milliseconds(SM64ColorName, SM64ColorTex, x + 33, y + 110, 1, 1, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_milliseconds(SM64ColorName, SM64ColorTex, x + 44.8, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SM64ColorName, SM64ColorTex, x + 57, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	
	-- Mario Kart 64 Fonts
	_G.STRApi.set_custom_countdown(MK64ColorName, MK64ColorTex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MK64ColorName, MK64ColorTex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MK64ColorName, MK64ColorTex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MK64ColorName, MK64ColorTex, x - 32, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_milliseconds(MK64ColorName, MK64ColorTex, x + 71.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MK64ColorName, MK64ColorTex, x + 60.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MK64ColorName, MK64ColorTex, x + 49.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MK64ColorName, MK64ColorTex, x + 28, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MK64ColorName, MK64ColorTex, x + 17.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MK64ColorName, MK64ColorTex, x - 4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MK64ColorName, MK64ColorTex, x - 14.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MK64ColorName, MK64ColorTex, x - 35.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MK64ColorName, MK64ColorTex, x - 46.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MK64ColorName, MK64ColorTex, x - 25.5, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MK64ColorName, MK64ColorTex, x + 6.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MK64ColorName, MK64ColorTex, x + 38.8, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MK64ColorName, MK64ColorTex, x - 94.3, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 94.3, y + 105)

	-- Mario Party 1/2/3 Fonts
	_G.STRApi.set_custom_countdown(MP64ColorName, MP64ColorTex, x - 18, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MP64ColorName, MP64ColorTex, x - 1, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MP64ColorName, MP64ColorTex, x - 32.4, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 100,"Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MP64ColorName, MP64ColorTex, x - 50, y - 14, 0.75, 1.50, 176, 24, 64, 32)
	_G.STRApi.set_custom_milliseconds(MP64ColorName, MP64ColorTex, x + 88.5, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MP64ColorName, MP64ColorTex, x + 70.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MP64ColorName, MP64ColorTex, x + 52.5, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MP64ColorName, MP64ColorTex, x + 18.8, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MP64ColorName, MP64ColorTex, x + 0.7, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MP64ColorName, MP64ColorTex, x - 32.9, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MP64ColorName, MP64ColorTex, x - 50.9, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MP64ColorName, MP64ColorTex, x - 77.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MP64ColorName, MP64ColorTex, x - 95.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MP64ColorName, MP64ColorTex, x + 35.6, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64ColorName, MP64ColorTex, x + 42.8, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64ColorName, MP64ColorTex, x - 8.8, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64ColorName, MP64ColorTex, x - 16, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64ColorName, MP64ColorTex, x - 60.5, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")

	-- Mario Tennis 64 Fonts
	_G.STRApi.set_custom_countdown(MT64ColorName, MT64ColorTex, x - 16, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MT64ColorName, MT64ColorTex, x - 1, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MT64ColorName, MT64ColorTex, x - 29, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MT64ColorName, MT64ColorTex, x - 88, y - 22, 0.50, 1.35, 0, 17, 128, 48)
	_G.STRApi.set_custom_milliseconds(MT64ColorName, MT64ColorTex, x + 76.6, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MT64ColorName, MT64ColorTex, x + 59.8, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MT64ColorName, MT64ColorTex, x + 43, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MT64ColorName, MT64ColorTex, x + 19, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MT64ColorName, MT64ColorTex, x + 2.0, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MT64ColorName, MT64ColorTex, x - 23.2, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MT64ColorName, MT64ColorTex, x - 40.0, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MT64ColorName, MT64ColorTex, x - 65.5, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MT64ColorName, MT64ColorTex, x - 82.4, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MT64ColorName, MT64ColorTex, x + 31, y + 107, 1.2, 1.2, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MT64ColorName, MT64ColorTex, x - 11.2, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MT64ColorName, MT64ColorTex, x - 53.4, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	
	-- Paper Mario 64 Fonts
	_G.STRApi.set_custom_countdown(PM64ColorName, PM64ColorTex, x - 14, y - 10, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(PM64ColorName, PM64ColorTex, x - 5, y - 10 , 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(PM64ColorName, PM64ColorTex, x - 26.5, y - 10, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(PM64ColorName, PM64ColorTex, x - 30, y - 12, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_custom_milliseconds(PM64ColorName, PM64ColorTex, x + 61, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(PM64ColorName, PM64ColorTex, x + 48, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(PM64ColorName, PM64ColorTex, x + 35, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(PM64ColorName, PM64ColorTex, x + 13.7, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(PM64ColorName, PM64ColorTex, x + 0.5, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(PM64ColorName, PM64ColorTex, x - 21, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(PM64ColorName, PM64ColorTex, x - 34, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(PM64ColorName, PM64ColorTex, x - 55.4, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(PM64ColorName, PM64ColorTex, x - 68.6, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(PM64ColorName, PM64ColorTex, x - 44.7, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(PM64ColorName, PM64ColorTex, x - 10.3, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(PM64ColorName, PM64ColorTex, x + 24.5, y + 107, 1.2, 1.2, 176, 0, 16, 16, "Timer")
	
	-- Mario Bros. Classic (GBA) Fonts
	_G.STRApi.set_custom_countdown(MBCColorName, MBCColorTex, x - 8, y - 8, 4, 2, 8, 8, 8, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MBCColorName, MBCColorTex, x, y - 8, 4, 2, 8, 8, 8, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MBCColorName, MBCColorTex, x - 16, y - 8, 4, 2, 8, 8, 8, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(MBCColorName, MBCColorTex, x - 50, y - 8, 0.75, 2, 81, 9, 45, 16)
	_G.STRApi.set_custom_milliseconds(MBCColorName, MBCColorTex, x + 82, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MBCColorName, MBCColorTex, x + 66, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MBCColorName, MBCColorTex, x + 50, y + 110, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MBCColorName, MBCColorTex, x + 22, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MBCColorName, MBCColorTex, x + 6, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MBCColorName, MBCColorTex, x - 22, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MBCColorName, MBCColorTex, x - 38, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MBCColorName, MBCColorTex, x - 66, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MBCColorName, MBCColorTex, x - 82, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MBCColorName, MBCColorTex, x - 52, y + 110, 2, 2, 82, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MBCColorName, MBCColorTex, x - 8, y + 110, 2, 2, 82, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MBCColorName, MBCColorTex, x + 36, y + 110, 2, 2, 91, 0, 8, 8, "Timer")
	
	-- Mario Kart: Super Circuit Fonts
	_G.STRApi.set_custom_countdown(MKSCColorName, MKSCColorTex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MKSCColorName, MKSCColorTex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MKSCColorName, MKSCColorTex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MKSCColorName, MKSCColorTex, x - 32, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_milliseconds(MKSCColorName, MKSCColorTex, x + 59.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MKSCColorName, MKSCColorTex, x + 48.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MKSCColorName, MKSCColorTex, x + 38.15, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MKSCColorName, MKSCColorTex, x + 17.21, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MKSCColorName, MKSCColorTex, x + 6.78, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MKSCColorName, MKSCColorTex, x - 14.19, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MKSCColorName, MKSCColorTex, x - 24.66, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MKSCColorName, MKSCColorTex, x - 45.35, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MKSCColorName, MKSCColorTex, x - 55.79, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MKSCColorName, MKSCColorTex, x + 27.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MKSCColorName, MKSCColorTex, x - 3.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MKSCColorName, MKSCColorTex, x - 34.98, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MKSCColorName, MKSCColorTex, x - 99.9, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 109.9, y - 2)
	
	-- Mario Party-e Fonts
	_G.STRApi.set_custom_countdown(MPEColorName, MPEColorTex, x - 16, y - 8, 2, 2, 16, 17, 16, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MPEColorName, MPEColorTex, x, y - 8, 2, 2, 16, 17, 16, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MPEColorName, MPEColorTex, x - 33, y - 8, 2, 2, 16, 17, 16, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(MPEColorName, MPEColorTex, x - 30, y - 8, 0.95, 2, 161, 17, 33, 16)
	_G.STRApi.set_custom_milliseconds(MPEColorName, MPEColorTex, x + 56.12, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPEColorName, MPEColorTex, x + 45.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPEColorName, MPEColorTex, x + 35.2, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPEColorName, MPEColorTex, x + 18.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPEColorName, MPEColorTex, x + 7.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPEColorName, MPEColorTex, x - 9.5, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPEColorName, MPEColorTex, x - 20.2, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPEColorName, MPEColorTex, x - 37.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPEColorName, MPEColorTex, x - 47.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPEColorName, MPEColorTex, x - 29.4, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MPEColorName, MPEColorTex, x - 1.6, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MPEColorName, MPEColorTex, x + 26, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MPEColorName, MPEColorTex, x - 92.5, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 92.5, y + 105)
	
	-- Mario & Luigi: Superstar Saga Fonts
	_G.STRApi.set_custom_countdown(MLSSColorName, MLSSColorTex, x - 16, y - 20, 3, 2, 16, 26, 16, 26, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLSSColorName, MLSSColorTex, x - 0.4, y - 20, 3, 2, 16, 26, 16, 26, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLSSColorName, MLSSColorTex, x - 30, y - 20, 3, 2, 16, 26, 16, 26, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLSSColorName, MLSSColorTex, x - 55, y - 20, 0.8, 2, 161, 3, 57, 23)
	_G.STRApi.set_custom_milliseconds(MLSSColorName, MLSSColorTex, x + 62.3, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MLSSColorName, MLSSColorTex, x + 51.1, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLSSColorName, MLSSColorTex, x + 39.9, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MLSSColorName, MLSSColorTex, x + 17.55, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLSSColorName, MLSSColorTex, x + 6.28, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLSSColorName, MLSSColorTex, x - 15.97, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLSSColorName, MLSSColorTex, x - 27.19, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLSSColorName, MLSSColorTex, x - 49.85, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MLSSColorName, MLSSColorTex, x - 61.02, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MLSSColorName, MLSSColorTex, x - 38.59, y + 110, 2.25, 1.25, 80, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MLSSColorName, MLSSColorTex, x - 4.9, y + 110, 2.25, 1.25, 80, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MLSSColorName, MLSSColorTex, x + 28.8, y + 110, 2.25, 1.25, 88, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_time(MLSSColorName, MLSSColorTex, x - 81.1, y + 87, 0.68, 1.38, 96, 27, 28, 14, 0, 0, "None", "Static", x - 81.1, y + 87)
	
	-- Mario Pinball Land Fonts
	_G.STRApi.set_custom_countdown(MPLColorName, MPLColorTex, x - 16, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MPLColorName, MPLColorTex, x - 3, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MPLColorName, MPLColorTex, x - 27, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MPLColorName, MPLColorTex, x - 28, y - 8, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_custom_milliseconds(MPLColorName, MPLColorTex, x + 57, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPLColorName, MPLColorTex, x + 45, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPLColorName, MPLColorTex, x + 33, y + 110, 1, 1, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPLColorName, MPLColorTex, x + 16, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPLColorName, MPLColorTex, x + 4, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPLColorName, MPLColorTex, x - 15, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPLColorName, MPLColorTex, x - 27, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPLColorName, MPLColorTex, x - 46, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPLColorName, MPLColorTex, x - 58, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPLColorName, MPLColorTex, x - 34, y + 110, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MPLColorName, MPLColorTex, x - 3, y + 110, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MPLColorName, MPLColorTex, x + 25.9, y + 110, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_time(MPLColorName, MPLColorTex, x - 72, y + 110, 1, 1, 225, 0, 16, 16, 0, 0, "None", "Static", x - 72, y + 110)
	
	-- Super Mario 64 DS Fonts
	_G.STRApi.set_custom_countdown(SM64DSColorName, SM64DSColorTex, x - 15, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SM64DSColorName, SM64DSColorTex, x, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SM64DSColorName, SM64DSColorTex, x - 30, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SM64DSColorName, SM64DSColorTex, x - 69, y - 25, 0.75, 1.75, 160, 0, 75, 32)
	_G.STRApi.set_custom_milliseconds(SM64DSColorName, SM64DSColorTex, x + 59.4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(SM64DSColorName, SM64DSColorTex, x + 47.02, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(SM64DSColorName, SM64DSColorTex, x + 34.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(SM64DSColorName, SM64DSColorTex, x + 12.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SM64DSColorName, SM64DSColorTex, x + 1.87, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SM64DSColorName, SM64DSColorTex, x - 20.04, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SM64DSColorName, SM64DSColorTex, x - 31.0, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SM64DSColorName, SM64DSColorTex, x - 51.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SM64DSColorName, SM64DSColorTex, x - 62.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SM64DSColorName, SM64DSColorTex, x + 25.1, y + 105, 2.7, 1.3, 88, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64DSColorName, SM64DSColorTex, x - 7.75, y + 105, 2.7, 1.3, 88, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64DSColorName, SM64DSColorTex, x - 42.06, y + 105, 2.7, 1.3, 80, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_time(SM64DSColorName, SM64DSColorTex, x - 100.9, y + 105, 0.7, 1.3, 96, 16, 32, 16, 0, 0, "None", "Static", x - 113.3, y + 105)
	
	-- Mario Kart DS Fonts
	_G.STRApi.set_custom_countdown(MKDSColorName, MKDSColorTex, x - 22, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MKDSColorName, MKDSColorTex, x - 8, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MKDSColorName, MKDSColorTex, x - 35, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MKDSColorName, MKDSColorTex, x - 88, y - 17, 0.36, 1.50, 290, 0, 128, 32)
	_G.STRApi.set_custom_milliseconds(MKDSColorName, MKDSColorTex, x + 65.3, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MKDSColorName, MKDSColorTex, x + 52.7, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MKDSColorName, MKDSColorTex, x + 40.1, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MKDSColorName, MKDSColorTex, x + 17.7, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MKDSColorName, MKDSColorTex, x + 5.2, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MKDSColorName, MKDSColorTex, x - 17.2, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MKDSColorName, MKDSColorTex, x - 30, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MKDSColorName, MKDSColorTex, x - 52.6, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MKDSColorName, MKDSColorTex, x - 65.5, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MKDSColorName, MKDSColorTex, x - 41.35, y + 110, 2.25, 1.25, 80, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MKDSColorName, MKDSColorTex, x - 6, y + 110, 2.25, 1.25, 80, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MKDSColorName, MKDSColorTex, x + 28.9, y + 110, 2.25, 1.25, 88, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_time(MKDSColorName, MKDSColorTex, x - 115.5, y + 110, 0.50, 1.25, 96, 30, 36, 13, 0, 0, "None", "Static", x - 128.2, y - 2)
	
	-- Mario & Luigi: Partners in Time Fonts
	_G.STRApi.set_custom_countdown(MLPITColorName, MLPITColorTex, x - 15, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLPITColorName, MLPITColorTex, x, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLPITColorName, MLPITColorTex, x - 28, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLPITColorName, MLPITColorTex, x - 30, y - 31, 2, 2, 194, 0, 32, 32)
	_G.STRApi.set_custom_hours(MLPITColorName, MLPITColorTex, x - 62, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLPITColorName, MLPITColorTex, x - 51, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLPITColorName, MLPITColorTex, x - 32, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLPITColorName, MLPITColorTex, x - 21, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLPITColorName, MLPITColorTex, x - 2, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_seconds(MLPITColorName, MLPITColorTex, x + 9, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_milliseconds(MLPITColorName, MLPITColorTex, x + 28, y + 110, 1, 1, 16, 23, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_milliseconds(MLPITColorName, MLPITColorTex, x + 39, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLPITColorName, MLPITColorTex, x + 50, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_extras(MLPITColorName, MLPITColorTex, x - 42, y + 110, 1, 1, 160, 23, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLPITColorName, MLPITColorTex, x - 12, y + 110, 1, 1, 160, 23, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLPITColorName, MLPITColorTex, x + 17, y + 110, 1, 1, 176, 23, 16, 16, "Timer")
	
	-- Mario Party DS Fonts
	_G.STRApi.set_custom_extras(MPDSColorName, MPDSColorTex, x - 39, y - 20, 1.2, 2, 122, 24, 40, 24, "Countdown")
	_G.STRApi.set_custom_countdown(MPDSColorName, MPDSColorTex, x - 15, y - 12, 2, 2, 16, 8, 16, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MPDSColorName, MPDSColorTex, x + 1, y - 12, 2, 2, 16, 8, 16, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MPDSColorName, MPDSColorTex, x - 31, y - 12, 2, 2, 16, 8, 16, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(MPDSColorName, MPDSColorTex, x - 68, y - 12, 0.35, 1.5, 163, 1, 92, 21)
	_G.STRApi.set_custom_extras(MPDSColorName, MPDSColorTex, x - 115.3, y + 102, 0.1938, 2, 0, 24, 122, 12, "Timer")
	_G.STRApi.set_custom_milliseconds(MPDSColorName, MPDSColorTex, x + 93.73, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPDSColorName, MPDSColorTex, x + 77.8, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPDSColorName, MPDSColorTex, x + 61.86, y + 106, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPDSColorName, MPDSColorTex, x + 30.46, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPDSColorName, MPDSColorTex, x + 14.53, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPDSColorName, MPDSColorTex, x - 16.87, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPDSColorName, MPDSColorTex, x - 32.81, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPDSColorName, MPDSColorTex, x - 64.21, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPDSColorName, MPDSColorTex, x - 80.14, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPDSColorName, MPDSColorTex, x + 46.3, y + 106, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MPDSColorName, MPDSColorTex, x - 1.1, y + 106, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MPDSColorName, MPDSColorTex, x - 48.4, y + 106, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(MPDSColorName, MPDSColorTex, x - 99.889, y + 106, 2, 2, 96, 0, 8, 8, 0, 0, "None", "Static", x - 99.889, y + 106)
	
	
	-- Mario & Luigi: Bowser's Inside Story Fonts
	_G.STRApi.set_custom_countdown(MLBISColorName, MLBISColorTex, x - 15, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLBISColorName, MLBISColorTex, x - 5, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLBISColorName, MLBISColorTex, x - 27, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLBISColorName, MLBISColorTex, x - 60, y - 30, 1, 2, 176, 0, 64, 32)
	_G.STRApi.set_custom_milliseconds(MLBISColorName, MLBISColorTex, x + 74, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MLBISColorName, MLBISColorTex, x + 57.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLBISColorName, MLBISColorTex, x + 41, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MLBISColorName, MLBISColorTex, x + 15.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLBISColorName, MLBISColorTex, x - 1, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLBISColorName, MLBISColorTex, x - 26.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLBISColorName, MLBISColorTex, x - 43, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLBISColorName, MLBISColorTex, x - 68.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MLBISColorName, MLBISColorTex, x - 85, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MLBISColorName, MLBISColorTex, x + 27.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLBISColorName, MLBISColorTex, x - 14.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLBISColorName, MLBISColorTex, x - 56.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	
	-- Modern Super Mario Fonts
	_G.STRApi.set_custom_countdown(ModernColorName, ModernColorTex, x - 31, y - 35, 2, 2, 32, 32, 32, 32, 8, 8, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(ModernColorName, ModernColorTex, x - 17, y - 35, 2, 2, 32, 32, 32, 32, 8, 8, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(ModernColorName, ModernColorTex, x - 47, y - 35, 2, 2, 32, 32, 32, 32, 8, 80, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(ModernColorName, ModernColorTex, x - 60, y - 27, 1, 2, 96, 32, 64, 32)
	_G.STRApi.set_custom_milliseconds(ModernColorName, ModernColorTex, x + 50, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(ModernColorName, ModernColorTex, x + 35, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(ModernColorName, ModernColorTex, x + 20, y + 96, 1, 1, 32, 32, 32, 32, 8, 800, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(ModernColorName, ModernColorTex, x - 3, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(ModernColorName, ModernColorTex, x - 18, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(ModernColorName, ModernColorTex, x - 41, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(ModernColorName, ModernColorTex, x - 56, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(ModernColorName, ModernColorTex, x - 79, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(ModernColorName, ModernColorTex, x - 94, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(ModernColorName, ModernColorTex, x - 68, y + 102, 1, 1, 64, 32, 32, 32, "Timer")
	_G.STRApi.set_custom_extras(ModernColorName, ModernColorTex, x - 30, y + 102, 1, 1, 64, 32, 32, 32, "Timer")
	_G.STRApi.set_custom_extras(ModernColorName, ModernColorTex, x + 9, y + 100, 1, 1, 160, 32, 32, 32, "Timer")
end

function Hud_Behind()
if _G.STRApi.Set_Font_Render("Behind") then
custom_fonts_display()
	end
end

function Hud_Front()
if _G.STRApi.Set_Font_Render("Front") then
custom_fonts_display()
	end
end

hook_event(HOOK_ON_HUD_RENDER, Hud_Front)
hook_event(HOOK_ON_HUD_RENDER_BEHIND, Hud_Behind)
