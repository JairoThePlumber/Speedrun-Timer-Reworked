-- name: STR Official Custom Fonts
-- incompatible:
-- description: The Official Speedrun Timer Custom Fonts Plugins

-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

SMB1Name, SMB1Tex = "SMB1", "smb_fonts"
SMB2Name, SMB2Tex = "SMB2", "smb2_fonts"

SMWName, SMWTex = "SMW", "smw_fonts"
SMKName, SMKTex = "SMK", "smk_fonts"
SMB1ASName, SMB1ASTex = "SMB1AS", "smbas_fonts"
SMB2ASName, SMB2ASTex = "SMB2AS", "smb2as_fonts"
SMB3ASName, SMB3ASTex = "SMB3AS", "smb3as_fonts"

SM64Name, SM64Tex = "SM64", "sm64_fonts"
MK64Name, MK64Tex = "MK64", "mk64_fonts"
MP64Name, MP64Tex = "MP64", "mp64_fonts"
MT64Name, MT64Tex = "MT64", "mt64_fonts"
PM64Name, PM64Tex = "PM64", "pm64_fonts"

MBCName, MBCTex = "MBC", "mbc_fonts"
MKSCName, MKSCTex = "MKSC", "mksc_fonts"
MPEName, MPETex = "MPE", "mpe_fonts"
MLSSName, MLSSTex = "MLSS", "mlss_fonts"
MPLName, MPLTex = "MPL", "mpl_fonts"

SM64DSName, SM64DSTex = "SM64DS", "sm64ds_fonts"
MKDSName, MKDSTex = "MKDS", "mkds_fonts"
MLPITName, MLPITTex = "MLPIT", "mlpit_fonts"
MPDSName, MPDSTex = "MPDS", "mpds_fonts"
MLBISName, MLBISTex = "MLBIS", "mlbis_fonts"

ModernName, ModernTex = "SuperMario", "modern_fonts"

-- NES
_G.STRApi.add_custom_fonts(SMB1Name, "Super Mario Bros.")
_G.STRApi.add_custom_fonts(SMB2Name, "Super Mario Bros. 2 (USA)")

-- SNES
_G.STRApi.add_custom_fonts(SMWName, "Super Mario World")
_G.STRApi.add_custom_fonts(SMKName, "Super Mario Kart")
_G.STRApi.add_custom_fonts(SMB1ASName, "Super Mario Bros. (All Stars)")
_G.STRApi.add_custom_fonts(SMB2ASName, "Super Mario Bros. 2 (All Stars)")
_G.STRApi.add_custom_fonts(SMB3ASName, "Super Mario Bros. 3 (All Stars)")

-- N64
_G.STRApi.add_custom_fonts(SM64Name, "Super Mario 64 (Custom)")
_G.STRApi.add_custom_fonts(MK64Name, "Mario Kart 64")
_G.STRApi.add_custom_fonts(MP64Name, "Mario Party 1/2/3")
_G.STRApi.add_custom_fonts(MT64Name, "Mario Tennis 64")
_G.STRApi.add_custom_fonts(PM64Name, "Paper Mario 64")

-- GBA
_G.STRApi.add_custom_fonts(MBCName, "Mario Bros. Classic (GBA)")
_G.STRApi.add_custom_fonts(MKSCName, "Mario Kart: Super Circuit")
_G.STRApi.add_custom_fonts(MPEName, "Mario Party-e")
_G.STRApi.add_custom_fonts(MLSSName, "Mario & Luigi: Superstar Saga")
_G.STRApi.add_custom_fonts(MPLName, "Mario Pinball Land")

-- DS
_G.STRApi.add_custom_fonts(SM64DSName, "Super Mario 64 DS")
_G.STRApi.add_custom_fonts(MKDSName, "Mario Kart DS")
_G.STRApi.add_custom_fonts(MLPITName, "Mario & Luigi: Partners in Time")
_G.STRApi.add_custom_fonts(MPDSName, "Mario Party DS")
_G.STRApi.add_custom_fonts(MLBISName, "Mario & Luigi: Bowser's inside Story")

-- Modern
_G.STRApi.add_custom_fonts("SuperMario", "Modern Super Mario")

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
	_G.STRApi.set_custom_countdown(SMB1Name, SMB1Tex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB1Name, SMB1Tex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB1Name, SMB1Tex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB1Name, SMB1Tex, x - 30, y, 0.75, 3, 0, 8, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB1Name, SMB1Tex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB1Name, SMB1Tex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB1Name, SMB1Tex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB1Name, SMB1Tex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB1Name, SMB1Tex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB1Name, SMB1Tex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB1Name, SMB1Tex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB1Name, SMB1Tex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB1Name, SMB1Tex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB1Name, SMB1Tex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1Name, SMB1Tex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1Name, SMB1Tex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB1Name, SMB1Tex, x - 60, y + 104, 0.25, 1, 97, 0, 32, 8, 0, 0, "None", "Static", x - 76, y + 104)
	
	-- Super Mario Bros. 2 (USA) Fonts
	_G.STRApi.set_custom_countdown(SMB2Name, SMB2Tex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB2Name, SMB2Tex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB2Name, SMB2Tex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB2Name, SMB2Tex, x - 27, y, 0.75, 3, 97, 0, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB2Name, SMB2Tex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB2Name, SMB2Tex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB2Name, SMB2Tex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB2Name, SMB2Tex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB2Name, SMB2Tex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB2Name, SMB2Tex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB2Name, SMB2Tex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB2Name, SMB2Tex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB2Name, SMB2Tex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB2Name, SMB2Tex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2Name, SMB2Tex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2Name, SMB2Tex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	
	-- Super Mario World Fonts
	_G.STRApi.set_custom_countdown(SMWName, SMWTex, x - 8, y - 8, 4, 2, 8, 7, 8, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(SMWName, SMWTex, x, y - 8, 4, 2, 8, 7, 8, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(SMWName, SMWTex, x - 16, y - 8, 4, 2, 8, 7, 8, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(SMWName, SMWTex, x + 8, y - 6, 0.8, 2, 80, 8, 40, 16)
	_G.STRApi.set_custom_go(SMWName, SMWTex, x + 112, y - 6, 8, 2, 121, 8, 4, 16)
	_G.STRApi.set_custom_colors(false)
	if m.character.type == CT_MARIO then
	_G.STRApi.set_custom_go(SMWName, SMWTex, x - 94, y - 6, 0.744, 2, 0, 24, 43, 16)
	elseif m.character.type == CT_LUIGI then
	_G.STRApi.set_custom_go(SMWName, SMWTex, x - 88, y - 6, 0.842, 2, 43, 24, 38, 16)
	elseif m.character.type == CT_TOAD then
	_G.STRApi.set_custom_go(SMWName, SMWTex, x - 72, y - 6, 1, 2, 81, 24, 32, 16)
	elseif m.character.type == CT_WALUIGI then
	_G.STRApi.set_custom_go(SMWName, SMWTex, x - 113.7, y - 6, 0.626, 2, 0, 40, 51, 16)
	elseif m.character.type == CT_WARIO then
	_G.STRApi.set_custom_go(SMWName, SMWTex, x - 94, y - 6, 0.744, 2, 51, 40, 43, 16)
	end
	_G.STRApi.set_custom_milliseconds(SMWName, SMWTex, x + 86, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMWName, SMWTex, x + 70, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMWName, SMWTex, x + 54, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMWName, SMWTex, x + 26, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMWName, SMWTex, x + 10, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMWName, SMWTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMWName, SMWTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMWName, SMWTex, x - 62, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMWName, SMWTex, x - 78, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMWName, SMWTex, x - 49, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMWName, SMWTex, x - 5, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMWName, SMWTex, x + 39, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMWName, SMWTex, x - 62, y + 102, 0.25, 1, 96, 0, 32, 8, 0, 0, "None", "Static", x - 78, y + 102)
	
	-- Super Mario Kart Fonts
	_G.STRApi.set_custom_countdown(SMKName, SMKTex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMKName, SMKTex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMKName, SMKTex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMKName, SMKTex, x - 44.3, y - 6, 0.747, 2, 0, 16, 45, 16)
	_G.STRApi.set_custom_milliseconds(SMKName, SMKTex, x + 57.3, y + 105, 2.8, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMKName, SMKTex, x + 46.1, y + 105, 2.8, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMKName, SMKTex, x + 35.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMKName, SMKTex, x + 13.9, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMKName, SMKTex, x + 3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMKName, SMKTex, x - 18.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMKName, SMKTex, x - 29.4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMKName, SMKTex, x - 51, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMKName, SMKTex, x - 61.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(SMKName, SMKTex, x - 42.7, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SMKName, SMKTex, x - 9, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SMKName, SMKTex, x + 23.3, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	
	-- Super Mario Bros. (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB1ASName, SMB1ASTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB1ASName, SMB1ASTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB1ASName, SMB1ASTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB1ASName, SMB1ASTex, x - 30, y, 0.75, 3, 0, 8, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB1ASName, SMB1ASTex, x + 86, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB1ASName, SMB1ASTex, x + 70, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB1ASName, SMB1ASTex, x + 54, y + 110, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB1ASName, SMB1ASTex, x + 26, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB1ASName, SMB1ASTex, x + 10, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB1ASName, SMB1ASTex, x - 18, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB1ASName, SMB1ASTex, x - 34, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB1ASName, SMB1ASTex, x - 62, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB1ASName, SMB1ASTex, x - 78, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB1ASName, SMB1ASTex, x - 48, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ASName, SMB1ASTex, x - 4, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB1ASName, SMB1ASTex, x + 40, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB1ASName, SMB1ASTex, x - 62, y + 101, 0.25, 1, 96, 0, 32, 8, 0, 0, "None", "Static", x - 78, y + 101)
	
	-- Super Mario Bros. 2 (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB2ASName, SMB2ASTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB2ASName, SMB2ASTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB2ASName, SMB2ASTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB2ASName, SMB2ASTex, x - 27, y, 0.75, 3, 97, 0, 32, 8)
	_G.STRApi.set_custom_milliseconds(SMB2ASName, SMB2ASTex, x + 82, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB2ASName, SMB2ASTex, x + 66, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB2ASName, SMB2ASTex, x + 50, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB2ASName, SMB2ASTex, x + 24, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB2ASName, SMB2ASTex, x + 8, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB2ASName, SMB2ASTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB2ASName, SMB2ASTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB2ASName, SMB2ASTex, x - 60, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB2ASName, SMB2ASTex, x - 76, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB2ASName, SMB2ASTex, x - 48, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ASName, SMB2ASTex, x - 6, y + 112, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB2ASName, SMB2ASTex, x + 36, y + 112, 2, 2, 88, 0, 8, 8, "Timer")
	
	-- Super Mario Bros. 3 (All Stars) Fonts
	_G.STRApi.set_custom_countdown(SMB3ASName, SMB3ASTex, x - 10, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SMB3ASName, SMB3ASTex, x + 2, y, 3, 3, 8, 8, 8, 8, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SMB3ASName, SMB3ASTex, x - 22, y, 3, 3, 8, 8, 8, 8, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x + 11, y - 3, 0.77, 2, 84, 8, 34, 13)
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x + 84, y - 3, 13, 2, 121, 8, 2, 13)
	if m.character.type == CT_MARIO then
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x - 64, y - 3, 0.77, 2, 0, 8, 31, 13)
	elseif m.character.type == CT_LUIGI then
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x - 61, y - 3, 1, 2, 31, 8, 26, 13)
	elseif m.character.type == CT_TOAD then
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x - 61, y - 3, 0.965, 2, 57, 8, 27, 13)
	elseif m.character.type == CT_WALUIGI then
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x - 90, y - 3, 0.626, 2, 0, 21, 41, 13)
	elseif m.character.type == CT_WARIO then
	_G.STRApi.set_custom_go(SMB3ASName, SMB3ASTex, x - 64, y - 3, 0.77, 2, 41, 21, 31, 13)
	end
	_G.STRApi.set_custom_milliseconds(SMB3ASName, SMB3ASTex, x + 86, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(SMB3ASName, SMB3ASTex, x + 70, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SMB3ASName, SMB3ASTex, x + 54, y + 112, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(SMB3ASName, SMB3ASTex, x + 26, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SMB3ASName, SMB3ASTex, x + 10, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SMB3ASName, SMB3ASTex, x - 18, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SMB3ASName, SMB3ASTex, x - 34, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SMB3ASName, SMB3ASTex, x - 62, y + 112, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SMB3ASName, SMB3ASTex, x - 78, y + 112, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SMB3ASName, SMB3ASTex, x - 49, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB3ASName, SMB3ASTex, x - 5, y + 110, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(SMB3ASName, SMB3ASTex, x + 39, y + 110, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(SMB3ASName, SMB3ASTex, x - 80, y + 112, 2, 2, 96, 0, 8, 8, 0, 0, "None", "Static", x - 96, y + 103)
	
	-- SM64 Fonts
	_G.STRApi.set_custom_countdown(SM64Name, SM64Tex, x - 26.7, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_countdown(SM64Name, SM64Tex, x - 2.7, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SM64Name, SM64Tex, x - 14.2, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_go(SM64Name, SM64Tex, x - 26.0, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_extras(SM64Name, SM64Tex, x + 23.9, y + 107, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64Name, SM64Tex, x - 10.2, y + 107, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64Name, SM64Tex, x - 45.2, y + 107, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_time(SM64Name, SM64Tex, x - 115, y + 110, 0.25, 1, 192, 0, 64, 16, 0, 0, "None", "Static", x - 127, y + 110)
	_G.STRApi.set_custom_hours(SM64Name, SM64Tex, x - 67.3, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_hours(SM64Name, SM64Tex, x - 55, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SM64Name, SM64Tex, x - 35, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SM64Name, SM64Tex, x - 23.2, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SM64Name, SM64Tex, x - 1, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_seconds(SM64Name, SM64Tex, x + 10.9, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_milliseconds(SM64Name, SM64Tex, x + 33, y + 110, 1, 1, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_milliseconds(SM64Name, SM64Tex, x + 44.8, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(SM64Name, SM64Tex, x + 57, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	
	-- Mario Kart 64 Fonts
	_G.STRApi.set_custom_countdown(MK64Name, MK64Tex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MK64Name, MK64Tex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MK64Name, MK64Tex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MK64Name, MK64Tex, x - 32, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_milliseconds(MK64Name, MK64Tex, x + 71.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MK64Name, MK64Tex, x + 60.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MK64Name, MK64Tex, x + 49.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MK64Name, MK64Tex, x + 28, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MK64Name, MK64Tex, x + 17.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MK64Name, MK64Tex, x - 4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MK64Name, MK64Tex, x - 14.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MK64Name, MK64Tex, x - 35.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MK64Name, MK64Tex, x - 46.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MK64Name, MK64Tex, x - 25.5, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MK64Name, MK64Tex, x + 6.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MK64Name, MK64Tex, x + 38.8, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MK64Name, MK64Tex, x - 94.3, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 94.3, y + 105)

	-- Mario Party 1/2/3 Fonts
	_G.STRApi.set_custom_countdown(MP64Name, MP64Tex, x - 18, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MP64Name, MP64Tex, x - 1, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MP64Name, MP64Tex, x - 32.4, y - 8, 1.5, 1.5, 24, 24, 24, 24, 10, 100,"Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MP64Name, MP64Tex, x - 50, y - 14, 0.75, 1.50, 176, 24, 64, 32)
	_G.STRApi.set_custom_milliseconds(MP64Name, MP64Tex, x + 88.5, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MP64Name, MP64Tex, x + 70.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MP64Name, MP64Tex, x + 52.5, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MP64Name, MP64Tex, x + 18.8, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MP64Name, MP64Tex, x + 0.7, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MP64Name, MP64Tex, x - 32.9, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MP64Name, MP64Tex, x - 50.9, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MP64Name, MP64Tex, x - 77.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MP64Name, MP64Tex, x - 95.4, y + 108, 1.2, 1.2, 16, 24, 16, 16, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MP64Name, MP64Tex, x + 35.6, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64Name, MP64Tex, x + 42.8, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64Name, MP64Tex, x - 8.8, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64Name, MP64Tex, x - 16, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MP64Name, MP64Tex, x - 60.5, y + 108, 1.2, 1.2, 160, 24, 16, 16, "Timer")

	-- Mario Tennis 64 Fonts
	_G.STRApi.set_custom_countdown(MT64Name, MT64Tex, x - 16, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MT64Name, MT64Tex, x - 1, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MT64Name, MT64Tex, x - 29, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MT64Name, MT64Tex, x - 88, y - 22, 0.50, 1.35, 0, 17, 128, 48)
	_G.STRApi.set_custom_milliseconds(MT64Name, MT64Tex, x + 76.6, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MT64Name, MT64Tex, x + 59.8, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MT64Name, MT64Tex, x + 43, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MT64Name, MT64Tex, x + 19, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MT64Name, MT64Tex, x + 2.0, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MT64Name, MT64Tex, x - 23.2, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MT64Name, MT64Tex, x - 40.0, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MT64Name, MT64Tex, x - 65.5, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MT64Name, MT64Tex, x - 82.4, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MT64Name, MT64Tex, x + 31, y + 107, 1.2, 1.2, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MT64Name, MT64Tex, x - 11.2, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MT64Name, MT64Tex, x - 53.4, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	
	-- Paper Mario 64 Fonts
	_G.STRApi.set_custom_colors(true)
	_G.STRApi.set_custom_countdown(PM64Name, PM64Tex, x - 14, y - 10, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(PM64Name, PM64Tex, x - 5, y - 10 , 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(PM64Name, PM64Tex, x - 26.5, y - 10, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(PM64Name, PM64Tex, x - 30, y - 12, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_custom_milliseconds(PM64Name, PM64Tex, x + 61, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(PM64Name, PM64Tex, x + 48, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(PM64Name, PM64Tex, x + 35, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(PM64Name, PM64Tex, x + 13.7, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(PM64Name, PM64Tex, x + 0.5, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(PM64Name, PM64Tex, x - 21, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(PM64Name, PM64Tex, x - 34, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(PM64Name, PM64Tex, x - 55.4, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(PM64Name, PM64Tex, x - 68.6, y + 107, 1.2, 1.2, 16, 16, 16, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(PM64Name, PM64Tex, x - 44.7, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(PM64Name, PM64Tex, x - 10.3, y + 107, 1.2, 1.2, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(PM64Name, PM64Tex, x + 24.5, y + 107, 1.2, 1.2, 176, 0, 16, 16, "Timer")
	
	-- Mario Bros. Classic (GBA) Fonts
	_G.STRApi.set_custom_colors(false)
	_G.STRApi.set_custom_countdown(MBCName, MBCTex, x - 8, y - 8, 4, 2, 8, 8, 8, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MBCName, MBCTex, x, y - 8, 4, 2, 8, 8, 8, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MBCName, MBCTex, x - 16, y - 8, 4, 2, 8, 8, 8, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(MBCName, MBCTex, x - 50, y - 8, 0.75, 2, 81, 9, 45, 16)
	_G.STRApi.set_custom_milliseconds(MBCName, MBCTex, x + 82, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MBCName, MBCTex, x + 66, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MBCName, MBCTex, x + 50, y + 110, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MBCName, MBCTex, x + 22, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MBCName, MBCTex, x + 6, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MBCName, MBCTex, x - 22, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MBCName, MBCTex, x - 38, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MBCName, MBCTex, x - 66, y + 110, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MBCName, MBCTex, x - 82, y + 110, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MBCName, MBCTex, x - 52, y + 110, 2, 2, 82, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MBCName, MBCTex, x - 8, y + 110, 2, 2, 82, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MBCName, MBCTex, x + 36, y + 110, 2, 2, 91, 0, 8, 8, "Timer")
	
	-- Mario Kart: Super Circuit Fonts
	_G.STRApi.set_custom_countdown(MKSCName, MKSCTex, x - 8, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MKSCName, MKSCTex, x, y - 8, 4, 2, 8, 16, 8, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MKSCName, MKSCTex, x - 16, y - 8, 4, 2, 8, 16, 8, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MKSCName, MKSCTex, x - 32, y - 8, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_custom_milliseconds(MKSCName, MKSCTex, x + 59.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MKSCName, MKSCTex, x + 48.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MKSCName, MKSCTex, x + 38.15, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MKSCName, MKSCTex, x + 17.21, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MKSCName, MKSCTex, x + 6.78, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MKSCName, MKSCTex, x - 14.19, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MKSCName, MKSCTex, x - 24.66, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MKSCName, MKSCTex, x - 45.35, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MKSCName, MKSCTex, x - 55.79, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MKSCName, MKSCTex, x + 27.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MKSCName, MKSCTex, x - 3.7, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MKSCName, MKSCTex, x - 34.98, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MKSCName, MKSCTex, x - 99.9, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 109.9, y - 2)
	
	-- Mario Party-e Fonts
	_G.STRApi.set_custom_countdown(MPEName, MPETex, x - 16, y - 8, 2, 2, 16, 17, 16, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MPEName, MPETex, x, y - 8, 2, 2, 16, 17, 16, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MPEName, MPETex, x - 33, y - 8, 2, 2, 16, 17, 16, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_go(MPEName, MPETex, x - 30, y - 8, 0.95, 2, 161, 17, 33, 16)
	_G.STRApi.set_custom_milliseconds(MPEName, MPETex, x + 56.12, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPEName, MPETex, x + 45.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPEName, MPETex, x + 35.2, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPEName, MPETex, x + 18.1, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPEName, MPETex, x + 7.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPEName, MPETex, x - 9.5, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPEName, MPETex, x - 20.2, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPEName, MPETex, x - 37.3, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPEName, MPETex, x - 47.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPEName, MPETex, x - 29.4, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MPEName, MPETex, x - 1.6, y + 105, 2.7, 1.3, 80, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(MPEName, MPETex, x + 26, y + 105, 2.7, 1.3, 88, 0, 8, 16, "Timer")
	_G.STRApi.set_custom_time(MPEName, MPETex, x - 92.5, y + 105, 0.7, 1.3, 96, 0, 32, 16, 0, 0, "None", "Static", x - 92.5, y + 105)
	
	-- Mario & Luigi: Superstar Saga Fonts
	_G.STRApi.set_custom_countdown(MLSSName, MLSSTex, x - 16, y - 20, 3, 2, 16, 26, 16, 26, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLSSName, MLSSTex, x - 0.4, y - 20, 3, 2, 16, 26, 16, 26, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLSSName, MLSSTex, x - 30, y - 20, 3, 2, 16, 26, 16, 26, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLSSName, MLSSTex, x - 55, y - 20, 0.8, 2, 161, 3, 57, 23)
	_G.STRApi.set_custom_milliseconds(MLSSName, MLSSTex, x + 62.3, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MLSSName, MLSSTex, x + 51.1, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLSSName, MLSSTex, x + 39.9, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MLSSName, MLSSTex, x + 17.55, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLSSName, MLSSTex, x + 6.28, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLSSName, MLSSTex, x - 15.97, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLSSName, MLSSTex, x - 27.19, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLSSName, MLSSTex, x - 49.85, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MLSSName, MLSSTex, x - 61.02, y + 110, 2.25, 1.25, 8, 27, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MLSSName, MLSSTex, x - 38.59, y + 110, 2.25, 1.25, 80, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MLSSName, MLSSTex, x - 4.9, y + 110, 2.25, 1.25, 80, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MLSSName, MLSSTex, x + 28.8, y + 110, 2.25, 1.25, 88, 27, 8, 13, "Timer")
	_G.STRApi.set_custom_time(MLSSName, MLSSTex, x - 81.1, y + 87, 0.68, 1.38, 96, 27, 28, 14, 0, 0, "None", "Static", x - 81.1, y + 87)
	
	-- Mario Pinball Land Fonts
	_G.STRApi.set_custom_countdown(MPLName, MPLTex, x - 16, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MPLName, MPLTex, x - 3, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MPLName, MPLTex, x - 27, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MPLName, MPLTex, x - 28, y - 8, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_custom_milliseconds(MPLName, MPLTex, x + 57, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPLName, MPLTex, x + 45, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPLName, MPLTex, x + 33, y + 110, 1, 1, 16, 16, 16, 16, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPLName, MPLTex, x + 16, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPLName, MPLTex, x + 4, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPLName, MPLTex, x - 15, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPLName, MPLTex, x - 27, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPLName, MPLTex, x - 46, y + 110, 1, 1, 16, 16, 16, 16, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPLName, MPLTex, x - 58, y + 110, 1, 1, 16, 16, 16, 16, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPLName, MPLTex, x - 34, y + 110, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MPLName, MPLTex, x - 3, y + 110, 1, 1, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MPLName, MPLTex, x + 25.9, y + 110, 1, 1, 176, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_time(MPLName, MPLTex, x - 72, y + 110, 1, 1, 225, 0, 16, 16, 0, 0, "None", "Static", x - 72, y + 110)
	
	-- Super Mario 64 DS Fonts
	_G.STRApi.set_custom_countdown(SM64DSName, SM64DSTex, x - 15, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(SM64DSName, SM64DSTex, x, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(SM64DSName, SM64DSTex, x - 30, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(SM64DSName, SM64DSTex, x - 69, y - 25, 0.75, 1.75, 160, 0, 75, 32)
	_G.STRApi.set_custom_milliseconds(SM64DSName, SM64DSTex, x + 59.4, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(SM64DSName, SM64DSTex, x + 47.02, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(SM64DSName, SM64DSTex, x + 34.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(SM64DSName, SM64DSTex, x + 12.8, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(SM64DSName, SM64DSTex, x + 1.87, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(SM64DSName, SM64DSTex, x - 20.04, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(SM64DSName, SM64DSTex, x - 31.0, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(SM64DSName, SM64DSTex, x - 51.7, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(SM64DSName, SM64DSTex, x - 62.6, y + 105, 2.7, 1.3, 8, 16, 8, 16, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(SM64DSName, SM64DSTex, x + 25.1, y + 105, 2.7, 1.3, 88, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64DSName, SM64DSTex, x - 7.75, y + 105, 2.7, 1.3, 88, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_extras(SM64DSName, SM64DSTex, x - 42.06, y + 105, 2.7, 1.3, 80, 16, 8, 16, "Timer")
	_G.STRApi.set_custom_time(SM64DSName, SM64DSTex, x - 100.9, y + 105, 0.7, 1.3, 96, 16, 32, 16, 0, 0, "None", "Static", x - 113.3, y + 105)
	
	-- Mario Kart DS Fonts
	_G.STRApi.set_custom_countdown(MKDSName, MKDSTex, x - 22, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MKDSName, MKDSTex, x - 8, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MKDSName, MKDSTex, x - 35, y - 14, 1.50, 1.50, 29, 29, 29, 29, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MKDSName, MKDSTex, x - 88, y - 17, 0.36, 1.50, 290, 0, 128, 32)
	_G.STRApi.set_custom_colors(true)
	_G.STRApi.set_custom_milliseconds(MKDSName, MKDSTex, x + 65.3, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MKDSName, MKDSTex, x + 52.7, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MKDSName, MKDSTex, x + 40.1, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MKDSName, MKDSTex, x + 17.7, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MKDSName, MKDSTex, x + 5.2, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MKDSName, MKDSTex, x - 17.2, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MKDSName, MKDSTex, x - 30, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MKDSName, MKDSTex, x - 52.6, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MKDSName, MKDSTex, x - 65.5, y + 110, 2.25, 1.25, 8, 30, 8, 13, 10, 100, "Add (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(MKDSName, MKDSTex, x - 41.35, y + 110, 2.25, 1.25, 80, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MKDSName, MKDSTex, x - 6, y + 110, 2.25, 1.25, 80, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_extras(MKDSName, MKDSTex, x + 28.9, y + 110, 2.25, 1.25, 88, 30, 8, 13, "Timer")
	_G.STRApi.set_custom_time(MKDSName, MKDSTex, x - 115.5, y + 110, 0.50, 1.25, 96, 30, 36, 13, 0, 0, "None", "Static", x - 128.2, y - 2)
	_G.STRApi.set_custom_colors(false)
	
	-- Mario & Luigi: Partners in Time Fonts
	_G.STRApi.set_custom_countdown(MLPITName, MLPITTex, x - 15, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLPITName, MLPITTex, x, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLPITName, MLPITTex, x - 28, y - 15, 2.50, 2, 16, 20, 16, 20, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLPITName, MLPITTex, x - 30, y - 31, 2, 2, 194, 0, 32, 32)
	_G.STRApi.set_custom_hours(MLPITName, MLPITTex, x - 62, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLPITName, MLPITTex, x - 51, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLPITName, MLPITTex, x - 32, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLPITName, MLPITTex, x - 21, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLPITName, MLPITTex, x - 2, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_seconds(MLPITName, MLPITTex, x + 9, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_milliseconds(MLPITName, MLPITTex, x + 28, y + 110, 1, 1, 16, 23, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_milliseconds(MLPITName, MLPITTex, x + 39, y + 110, 1, 1, 16, 23, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLPITName, MLPITTex, x + 50, y + 110, 1, 1, 16, 23, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_extras(MLPITName, MLPITTex, x - 42, y + 110, 1, 1, 160, 23, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLPITName, MLPITTex, x - 12, y + 110, 1, 1, 160, 23, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLPITName, MLPITTex, x + 17, y + 110, 1, 1, 176, 23, 16, 16, "Timer")
	
	-- Mario Party DS Fonts
	_G.STRApi.set_custom_extras(MPDSName, MPDSTex, x - 39, y - 20, 1.2, 2, 122, 24, 40, 24, "Countdown")
	if _G.STRApi.Set_Countdown() > 6 then
	_G.STRApi.set_custom_colors("Custom", 0, 255, 255)
	else
	_G.STRApi.set_custom_colors("Custom", 255, 148, 8)
	end
	_G.STRApi.set_custom_countdown(MPDSName, MPDSTex, x - 15, y - 12, 2, 2, 16, 8, 16, 16, 10, 10, "Add", "Middle")
	_G.STRApi.set_custom_countdown(MPDSName, MPDSTex, x + 1, y - 12, 2, 2, 16, 8, 16, 16, 10, 10, "Add", "Right")
	_G.STRApi.set_custom_countdown(MPDSName, MPDSTex, x - 31, y - 12, 2, 2, 16, 8, 16, 16, 10, 100, "Add", "Left (Tens)")
	_G.STRApi.set_custom_colors(false)
	_G.STRApi.set_custom_go(MPDSName, MPDSTex, x - 68, y - 12, 0.35, 1.5, 163, 1, 92, 21)
	_G.STRApi.set_custom_extras(MPDSName, MPDSTex, x - 115.3, y + 102, 0.1938, 2, 0, 24, 122, 12, "Timer")
	_G.STRApi.set_custom_colors(true)
	_G.STRApi.set_custom_milliseconds(MPDSName, MPDSTex, x + 93.73, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(MPDSName, MPDSTex, x + 77.8, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(MPDSName, MPDSTex, x + 61.86, y + 106, 2, 2, 8, 8, 8, 8, 10, 1000, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(MPDSName, MPDSTex, x + 30.46, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MPDSName, MPDSTex, x + 14.53, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MPDSName, MPDSTex, x - 16.87, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MPDSName, MPDSTex, x - 32.81, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MPDSName, MPDSTex, x - 64.21, y + 106, 2, 2, 8, 8, 8, 8, 10, 10, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MPDSName, MPDSTex, x - 80.14, y + 106, 2, 2, 8, 8, 8, 8, 10, 100, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MPDSName, MPDSTex, x + 46.3, y + 106, 2, 2, 88, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MPDSName, MPDSTex, x - 1.1, y + 106, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_extras(MPDSName, MPDSTex, x - 48.4, y + 106, 2, 2, 80, 0, 8, 8, "Timer")
	_G.STRApi.set_custom_time(MPDSName, MPDSTex, x - 99.889, y + 106, 2, 2, 96, 0, 8, 8, 0, 0, "None", "Static", x - 99.889, y + 106)
	_G.STRApi.set_custom_colors(false)
	
	-- Mario & Luigi: Bowser's Inside Story Fonts
	_G.STRApi.set_custom_countdown(MLBISName, MLBISTex, x - 15, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(MLBISName, MLBISTex, x - 5, y - 8, 2, 2, 16, 16, 16, 16, 10, 10, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(MLBISName, MLBISTex, x - 27, y - 8, 2, 2, 16, 16, 16, 16, 10, 100, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(MLBISName, MLBISTex, x - 60, y - 30, 1, 2, 176, 0, 64, 32)
	_G.STRApi.set_custom_milliseconds(MLBISName, MLBISTex, x + 74, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add", "Ones")
	_G.STRApi.set_custom_milliseconds(MLBISName, MLBISTex, x + 57.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add", "Tens")
	_G.STRApi.set_custom_milliseconds(MLBISName, MLBISTex, x + 41, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 1000, "Add", "Hundreds")
	_G.STRApi.set_custom_seconds(MLBISName, MLBISTex, x + 15.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(MLBISName, MLBISTex, x - 1, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(MLBISName, MLBISTex, x - 26.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(MLBISName, MLBISTex, x - 43, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_hours(MLBISName, MLBISTex, x - 68.5, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 10, "Add (Normal)", "Ones")
	_G.STRApi.set_custom_hours(MLBISName, MLBISTex, x - 85, y + 105, 1.5, 1.5, 16, 17, 16, 16, 10, 100, "Add (Normal)", "Tens")
	_G.STRApi.set_custom_extras(MLBISName, MLBISTex, x + 27.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLBISName, MLBISTex, x - 14.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	_G.STRApi.set_custom_extras(MLBISName, MLBISTex, x - 56.5, y + 103.5, 1.5, 1.5, 160, 0, 16, 16, "Timer")
	
	-- Modern Super Mario Fonts
	_G.STRApi.set_custom_colors(true)
	_G.STRApi.set_custom_countdown(ModernName, ModernTex, x - 31, y - 35, 2, 2, 32, 32, 32, 32, 8, 8, "Multiply", "Middle")
	_G.STRApi.set_custom_countdown(ModernName, ModernTex, x - 17, y - 35, 2, 2, 32, 32, 32, 32, 8, 8, "Multiply", "Right")
	_G.STRApi.set_custom_countdown(ModernName, ModernTex, x - 47, y - 35, 2, 2, 32, 32, 32, 32, 8, 80, "Multiply", "Left (Tens)")
	_G.STRApi.set_custom_go(ModernName, ModernTex, x - 60, y - 27, 1, 2, 96, 32, 64, 32)
	_G.STRApi.set_custom_milliseconds(ModernName, ModernTex, x + 50, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply", "Ones")
	_G.STRApi.set_custom_milliseconds(ModernName, ModernTex, x + 35, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply", "Tens")
	_G.STRApi.set_custom_milliseconds(ModernName, ModernTex, x + 20, y + 96, 1, 1, 32, 32, 32, 32, 8, 800, "Multiply", "Hundreds")
	_G.STRApi.set_custom_seconds(ModernName, ModernTex, x - 3, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_seconds(ModernName, ModernTex, x - 18, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_minutes(ModernName, ModernTex, x - 41, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_minutes(ModernName, ModernTex, x - 56, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Normal)", "Tens")
	_G.STRApi.set_custom_hours(ModernName, ModernTex, x - 79, y + 96, 1, 1, 32, 32, 32, 32, 8, 8, "Multiply (Normal)", "Ones")
	_G.STRApi.set_custom_hours(ModernName, ModernTex, x - 94, y + 96, 1, 1, 32, 32, 32, 32, 8, 80, "Multiply (Hidden)", "Tens")
	_G.STRApi.set_custom_extras(ModernName, ModernTex, x - 68, y + 102, 1, 1, 64, 32, 32, 32, "Timer")
	_G.STRApi.set_custom_extras(ModernName, ModernTex, x - 30, y + 102, 1, 1, 64, 32, 32, 32, "Timer")
	_G.STRApi.set_custom_extras(ModernName, ModernTex, x + 9, y + 100, 1, 1, 160, 32, 32, 32, "Timer")
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
