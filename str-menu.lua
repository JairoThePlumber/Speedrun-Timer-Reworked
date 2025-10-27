
STRMenuTitles = {
	-- Main -- 
	["MDMain"] = "MAIN MENU", ["MDSave"] = "SAVEFILE SETTINGS", ["MDSettings"] = "SETTINGS", ["MDServer"] = "SERVER SETTINGS", 
	["MDRuns"] = "RUNS CONFIG", ["MDLobby"] = "LOBBY SETTINGS", ["MDLevels"] = "LEVEL SETTINGS", ["MDSingle"] = "SINGLE STARS",
	-- Config -- 
	["MDConfig"] = "CONFIG MENU", ["MDInfo"] = "INFO", ["MDHTP"] = "HOW TO PLAY", ["MDCSettings"] = "SETTINGS", ["MDConfigVH"] = "VIEW HOST SETTINGS", 
}

STRMenuDeplay = {
	[370] = 370, [440] = 440, [510] = 510, [580] = 580, [650] = 650, [720] = 720, [790] = 790, [860] = 860, [930] = 930, 
	[1000] = 1000, [1070] = 1070, [1140] = 1140, [1210] = 1210, [1280] = 1280, [1350] = 1350, [1420] = 1420, [1490] = 1490
}

function str_render_menu()
djui_hud_set_resolution(RESOLUTION_N64)
if STRMenuDisplay == true then
MGRSize = 100
MGRW = 5 * MGRSize
MGRH = 3 * MGRSize
MGRX = (S_Width() - MGRW) / 2.0
MGRY = (S_Height() - MGRH) / 2.0
render_rect(MGRX, MGRY, MGRW, MGRH, STRMenuR, STRMenuG, STRMenuB, STRMenuV)

djui_hud_set_font(FONT_CUSTOM_HUD)
MGTTitle = STRMenuTitles[STRMenuTitleName]
MGTSize = 1
MGTWidth = Hud_Measure(MGTTitle) * MGTSize
MGTHeight = 32 * MGTSize
MGTX = (S_Width() - MGTWidth) / 2.0
MGTY = (S_Height() - MGTHeight) / 2.0 - 100
shadow_text(MGTTitle, MGTX, MGTY, MGTSize, 1, 1, 255, 255, 255, 255)

djui_hud_set_font(FONT_NORMAL)
MDGSize = 0.75
MDGWidth = 0 * MDGSize
MDGHeight = 32 * MDGSize
MDGX = (S_Width() - MDGWidth) / 2.0
MDGY = (S_Height() - MDGHeight) / 2.0

if STRMenuTitleName == "MDMain" or STRMenuTitleName == "MDConfig" then
if network_is_server() and STRMenuTitleName == "MDMain" then SDJM = "(X) Switch to the Main Menu | (R) DJUI Menu" 
elseif network_is_server() and STRMenuTitleName == "MDConfig" then SDJM = "(X) Switch to the Config Menu | (R) DJUI Menu" 
else SDJM = "(R) DJUI Menu" end
local SDJMX = (S_Width() - Hud_Measure(SDJM) * 0.35) / 2.0
shadow_text(SDJM, SDJMX, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255) 

local STRVersion = "Speedrun Timer Reworked V2.1.1" local STRVX = (S_Width() - Hud_Measure(STRVersion) * 0.25) / 2.0
shadow_text(STRVersion, STRVX, MDGY - 85, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255) 
end

if STRMenuTitleName == "MDMain" then
if STRGST.STRGameState == "Lobby" and STRGST.STRGameMode ~= 4 then StartText = "Start" elseif STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then StartText = "Pause"
elseif STRGST.STRGameState == "Paused" and STRGST.STRGameMode ~= 4 then StartText = "Continue" elseif STRGST.STRGameMode == 4 then StartText = "Stars" 
elseif STRGST.STRGameState == "Finished" then StartText = "Finish" end
if charSelectExists then if STRGST.DisableCSMoveset == true then CSMText = "Disabled" else CSMText = "Enabled" end end
if STRGST.SwitchIntro == true then IntroText = "Enabled " else IntroText = "Disabled" end
if STRGST.VanillaCG == true and gServerSettings.skipIntro == 1 then CSMIY = 48 else CSMIY = 40 end

local GSWidth = Hud_Measure(StartText) * MDGSize local GSX = (S_Width() - GSWidth) / 2.0
menu_shadow_text(StartText, GSX - 94, MDGY - 30, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 1)
hide_shadow_text("(Y) Intro:", MDGX - 117, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameMode == 1 and STRGST.VanillaCG == true and gServerSettings.skipIntro == 1 and STRGST.STRGameState == "Lobby")
hide_shadow_text(IntroText, MDGX - 89, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameMode == 1 and STRGST.VanillaCG == true and gServerSettings.skipIntro == 1 and STRGST.STRGameState == "Lobby")
hide_shadow_text("(Z) CS Moveset:", MDGX - 133, MDGY - CSMIY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 1 and charSelectExists and STRGST.STRGameState == "Lobby")
hide_shadow_text(CSMText, MDGX - 89, MDGY - CSMIY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 1 and charSelectExists and STRGST.STRGameState == "Lobby")
menu_shadow_text("Restart", MDGX - 32, MDGY - 30, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 2 and MenuUDOption == 1)
menu_shadow_text("Savefile", MDGX + 63, MDGY - 40, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 3 and MenuUDOption == 1)
menu_shadow_text("Settings", MDGX + 61, MDGY - 20, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 3 and MenuUDOption == 1)
menu_shadow_text("Settings", MDGX - 125, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 1 and MenuUDOption == 2)
menu_shadow_text("Server", MDGX - 27, MDGY + 10, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 2 and MenuUDOption == 2)
menu_shadow_text("Settings", MDGX - 35, MDGY + 30, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 2 and MenuUDOption == 2)
menu_shadow_text("Runs Config", MDGX + 52, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 3 and MenuUDOption == 2)
end
if STRMenuTitleName == "MDSave" then
menu_shadow_text("Mips Star 1: " .. STRGST.SFSMipsStar1, MDGX - 110, MDGY - 85, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Mips Star 2: " .. STRGST.SFSMipsStar2, MDGX - 110, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Toad Star 1: " .. STRGST.SFSToadStar1, MDGX - 110, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Toad Star 2: " .. STRGST.SFSToadStar2, MDGX - 110, MDGY - 40, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Toad Star 3: " .. STRGST.SFSToadStar3, MDGX - 110, MDGY - 25, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Wing Cap: " .. STRGST.SFSWingCap, MDGX - 110, MDGY - 10, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 6 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Metal Cap: " .. STRGST.SFSMetalCap, MDGX - 110, MDGY + 5, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 7 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Vanish Cap: " .. STRGST.SFSVanishCap, MDGX - 110, MDGY + 20, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 8 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("DDD Moved: " .. STRGST.SFSDDDMovedBack, MDGX - 110, MDGY + 35, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 9 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Moat Drain: " .. STRGST.SFSMoatDrain, MDGX - 110, MDGY + 50, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 10 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("50 Star Door: " .. STRGST.SFS50StarDoor, MDGX + 10, MDGY - 85, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Basement Door: " .. STRGST.SFSBasementDoor, MDGX + 10, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("BITDW Door: " .. STRGST.SFSBTIDWDoor, MDGX + 10, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("BITFS Door: " .. STRGST.SFSBITFSDoor, MDGX + 10, MDGY - 40, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("CCM Door: " .. STRGST.SFSCCMDoor, MDGX + 10, MDGY - 25, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("JRB Door: " .. STRGST.SFSJRBDoor, MDGX + 10, MDGY - 10, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 6 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("PSS Door: " .. STRGST.SFSPSSDoor, MDGX + 10, MDGY + 5, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 7 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Upstairs Door: " .. STRGST.SFSUpstairsDoor, MDGX + 10, MDGY + 20, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 8 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("WF Door: " .. STRGST.SFSWFDoor, MDGX + 10, MDGY + 35, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 9 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Keys 1 & 2: " .. STRGST.SFSKeys, MDGX + 10, MDGY + 50, MDGSize - 0.35, 1.00, 1.00, 255, 255, 0, 255, MenuUDOption == 10 and MenuLROption == 2 and MenuSelectedOption == "Main")

menu_shadow_text("- (Z) Erase Save File -", MDGX - 52, MDGY + 63, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
hide_shadow_text("(A) Reset | (B) Back", MDGX - 25, MDGY + 87, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
hide_shadow_text("Are you sure you want to Erase your Save Data?", MDGX - 58, MDGY + 78, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
end
if STRMenuTitleName == "MDSettings" then
if MenuLROption == 1 then GType = "Normal" elseif MenuLROption == 2 then GType = "Practice" elseif MenuLROption == 3 then GType = "Casual" elseif MenuLROption == 4 then GType = "Single Stars" end
if not network_is_server() then
if STRGST.STRGameMode == 1 then GType = "Normal" elseif STRGST.STRGameMode == 2 then GType = "Practice" elseif STRGST.STRGameMode == 3 then GType = "Casual" elseif STRGST.STRGameMode == 4 then GType = "Single Stars" end
end
if STRGST.STRStartingType == 1 then SOType = "Both" elseif STRGST.STRStartingType == 2 then SOType = "Intermission"
elseif STRGST.STRStartingType == 3 then SOType = "Countdown" elseif STRGST.STRStartingType == 4 then SOType = "None" end
local GMWidth = Hud_Measure(GType) * MDGSize local GMX = (S_Width() - GMWidth) / 2.0
local SOTWidth = Hud_Measure(SOType) * MDGSize local SOTX = (S_Width() - SOTWidth) / 2.0
local CDNWidth = Hud_Measure(tostring(STRGST.STRCDNumber)) * MDGSize local CDNX = (S_Width() - CDNWidth) / 2.0
local FGWWidth = Hud_Measure(STRGST.STRFinishGameWarp) * MDGSize local FGWX = (S_Width() - FGWWidth) / 2.0
if STRGST.STRBSFOption == "Disabled" then BackupText = "Off" elseif STRGST.STRBSFOption == "Enabled" and STRGST.STRBackupSF == false then BackupText = "On (Normal)"
elseif STRGST.STRBSFOption == "Enabled" and STRGST.STRBackupSF == true then BackupText = "On (Backup)" end
local BSWidth = Hud_Measure(BackupText) * MDGSize local BSX = (S_Width() - BSWidth) / 2.0

menu_shadow_text("Gamemode Type: ", MDGX - 130, MDGY - 70, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1)
menu_shadow_text("Starting Option:", MDGX - 130, MDGY - 40, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2)
menu_shadow_text("Countdown Number:", MDGX - 130, MDGY - 10, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3)
menu_shadow_text("Finish Run Warp:", MDGX - 130, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4)
menu_shadow_text("Backup Save:", MDGX - 130, MDGY + 50, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 5)
menu_shadow_text(GType, GMX + 87, MDGY - 70, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1)
menu_shadow_text(SOType, SOTX + 86, MDGY - 40, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2)
menu_shadow_text(tostring(STRGST.STRCDNumber), CDNX + 86, MDGY - 10, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3)
menu_shadow_text(STRGST.STRFinishGameWarp, FGWX + 86, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4)
hide_shadow_text("(Y) Switch Files", MDGX + 65, MDGY + 45, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 5)
menu_shadow_text(BackupText, BSX + 85, MDGY + 50, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 5)
end
if STRMenuTitleName == "MDServer" then
if gServerSettings.playerInteractions == 0 then PIFunc = "Non Solid" elseif gServerSettings.playerInteractions == 1 then PIFunc = "Solid" elseif gServerSettings.playerInteractions == 2 then PIFunc = "Friendly Fire" end
if gServerSettings.playerKnockbackStrength == 10 then KBFunc = "Weak" elseif gServerSettings.playerKnockbackStrength == 25 then KBFunc = "Normal" elseif gServerSettings.playerKnockbackStrength == 60 then KBFunc = "Too Much" end
if gServerSettings.pvpType == 0 then PVPFunc = "Classic" elseif gServerSettings.pvpType == 1 then PVPFunc = "Revamped" end
if gServerSettings.stayInLevelAfterStar == 0 then SCFunc = "Leave Level" elseif gServerSettings.stayInLevelAfterStar == 1 then SCFunc = "Stay In Level" elseif gServerSettings.stayInLevelAfterStar == 2 then SCFunc = "Non-Stop" end
if gServerSettings.bouncyLevelBounds == 0 then BLFunc = "Off" elseif gServerSettings.bouncyLevelBounds == 1 then BLFunc = "On" elseif gServerSettings.bouncyLevelBounds == 2 then BLFunc = "On (Capped)" end
if gServerSettings.nametags == 0 then NTFunc = "Disabled" elseif gServerSettings.nametags == 1 then NTFunc = "Enabled" end
if gServerSettings.bubbleDeath == 0 then BDFunc = "Disabled" elseif gServerSettings.bubbleDeath == 1 then BDFunc = "Enabled" end
if gServerSettings.pauseAnywhere == 0 then PAFunc = "Disabled" elseif gServerSettings.pauseAnywhere == 1 then PAFunc = "Enabled" end
if gServerSettings.skipIntro == 0 then SITText = "Enabled" else SITText = "Disabled" end

menu_shadow_text("Players Interact:", MDGX - 110, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1)
menu_shadow_text("PVP Mode:", MDGX - 110, MDGY - 43, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 1)
menu_shadow_text("Bouncy Level Bounds:", MDGX - 110, MDGY - 11, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1)
menu_shadow_text("Bubble On Death:", MDGX - 110, MDGY + 21, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1)
menu_shadow_text("Max Players:", MDGX - 110, MDGY + 52, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text("Knockback Strength:", MDGX + 20, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("On Star Collection:", MDGX + 20, MDGY - 43, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 2)
menu_shadow_text("Nametags: ", MDGX + 20, MDGY - 11, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 2)
menu_shadow_text("Pause Anywhere:", MDGX + 20, MDGY + 21, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 2)
menu_shadow_text("Skip Intro:", MDGX + 20, MDGY + 52, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 2)

menu_shadow_text(PIFunc, MDGX - 110, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1)
menu_shadow_text(PVPFunc, MDGX - 110, MDGY - 28, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 1)
menu_shadow_text(BLFunc, MDGX - 110, MDGY + 4, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1)
menu_shadow_text(BDFunc, MDGX - 110, MDGY + 36, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1)
menu_shadow_text(tostring(gServerSettings.maxPlayers), MDGX - 110, MDGY + 66, MDGSize - 0.40, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "MaxPlayers")

menu_shadow_text(KBFunc, MDGX + 20, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 2 )
menu_shadow_text(SCFunc, MDGX + 20, MDGY - 28, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 2)
menu_shadow_text(NTFunc, MDGX + 20, MDGY + 4, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 2)
menu_shadow_text(PAFunc, MDGX + 20, MDGY + 36, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 2)
menu_shadow_text(SITText, MDGX + 20, MDGY + 66, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 2)
end
if STRMenuTitleName == "MDRuns" then
menu_shadow_text("- Lobby Settings -", MDGX - 90, MDGY - 70, MDGSize + 0.20, 1.50, 1.50, 255, 255, 0, 255, MenuUDOption == 1)
menu_shadow_text("- Level Settings -", MDGX - 89, MDGY - 20, MDGSize + 0.20, 1.50, 1.50, 255, LSA, 0, 255, MenuUDOption == 2)
if STRGST.AddRomhack == true then LSA = 0 else LSA = 255 end
if STRRunSlotAdded == false then RSA = 0 else RSA = 255 end
menu_shadow_text("- Run Slot Plugins -", MDGX - 65, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, RSA, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
if STRGST.STRPluginsCheck == true then PluginText = "(A) Disabled Plugin, (L/R) Select Slot" else PluginText = "(A) Enabled Plugin" end
local PTX = (S_Width() - Hud_Measure(PluginText) * 0.25) / 2.0
hide_shadow_text(PluginText, PTX, MDGY + 43, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "MDRunSlot")

if STRGST.STRPluginsCheck == false and #STRPluginRuns == 0 then RPCText = "No Plugins" RPCColor = 0
elseif #STRPluginRuns ~= 1 and STRGST.STRPluginsCheck == false then RPCText = "Available Slots (" .. #STRPluginRuns .. ")" RPCColor = 255
elseif #STRPluginRuns == 1 and STRGST.STRPluginsCheck == false then RPCText = "Available Slot (" .. #STRPluginRuns .. ")" RPCColor = 255
else RPCText = STRPluginRuns[STRGST.STRPluginsTypes].PluginName RPCColor = 255 end
if (MenuUDOption == 3 and MenuSelectedOption == "MDRunSlot") or (STRGST.STRPluginsCheck == false and #STRPluginRuns == 0) then RPC2Color = 0 else RPC2Color = 255 end
local RPCX = (S_Width() - Hud_Measure(RPCText) * 0.45) / 2.0
shadow_text(RPCText, RPCX, MDGY + 52, MDGSize - 0.30, 1.05, 1.05, 255, RPCColor, RPC2Color, 255)
end

if STRMenuTitleName == "MDLobby" then
if STRGST.EnabledInteraction == true then LIText = "Disabled" else LIText = "Enabled" end
if MenuViewHostCheck == true then
menu_shadow_text("Interaction:", MDGX - 65, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Forced Type:", MDGX - 65, MDGY - 55, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Warp Settings:", MDGX - 65, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Position Settings:", MDGX - 65, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text(LIText, MDGX + 25, MDGY - 72, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceLevelType, MDGX + 25, MDGY - 52, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRWarpType, MDGX + 25, MDGY - 32, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceSpot, MDGX + 25, MDGY - 12, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")
end
FullLevel = "Location - (".. get_level_name(STRGST.STRCourseID, STRGST.STRLevelID, STRGST.STRAreaID)..", "..STRGST.STRAreaID ..", ".. STRGST.STRActID  ..")" local MDCLLX = (S_Width() - Hud_Measure(FullLevel) * 0.25) / 2.0
FullPosition = "Position - (".. tostring(math.floor(STRGST.STRXPos))..", "..tostring(math.floor(STRGST.STRYPos))..", ".. tostring(math.floor(STRGST.STRZPos)) ..")" 
local MDCLPX = (S_Width() - Hud_Measure(FullPosition) * 0.25) / 2.0
shadow_text(FullLevel, MDCLLX, MDGY + 29, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text(FullPosition, MDCLPX, MDGY + 45, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
if MenuViewHostCheck == false then
menu_shadow_text("Interaction:", MDGX - 140, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Update Location:", MDGX - 140, MDGY - 55, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Forced Type:", MDGX - 140, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Warp Settings:", MDGX - 140, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Position Settings:", MDGX - 140, MDGY + 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text(LIText, MDGX - 50, MDGY - 72, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRLocationSpot, MDGX - 50, MDGY - 52, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceLevelType, MDGX - 50, MDGY - 32, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRWarpType, MDGX - 50, MDGY - 12, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceSpot, MDGX - 50, MDGY + 8, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text("- Custom Location -", MDGX + 30, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(A) New Location", MDGX + 40, MDGY - 55, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(B) New Position", MDGX + 40, MDGY - 35, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(Y) Warp Position", MDGX + 40, MDGY - 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(X) Reset Everything", MDGX + 40, MDGY + 5, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuLROption == 2 and MenuSelectedOption == "Main")

menu_shadow_text("- (Z) Reset Saved Settings -", MDGX - 65, MDGY + 63, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuSelectedOption == "EraseLobby")
hide_shadow_text("(A) Reset | (B) Back", MDGX - 26, MDGY + 87, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseLobby")
hide_shadow_text("Are you sure you want to Reset your Settings?", MDGX - 55, MDGY + 78, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseLobby")
end
end
if STRMenuTitleName == "MDLevels" then
if MenuPageLRDisplay == 1 then MDRLTitle = "Stars"
elseif MenuPageLRDisplay == 2 then MDRLTitle = "Levels"
elseif MenuPageLRDisplay == 3 then MDRLTitle = "Actions"
elseif MenuPageLRDisplay == 4 then MDRLTitle = "Positions"
end
local MDRLX = (S_Width() - Hud_Measure(MDRLTitle) * 0.35) / 2.0
shadow_text(MDRLTitle, MDRLX, MDGY - 85, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)

MDRSOption = "(B) Exit | (Y) Switch Between Options | (L/R Trig) Menu Page: " .. MenuPageLRDisplay .. "/4" local MDRSX = (S_Width() - Hud_Measure(MDRSOption) * 0.25) / 2.0
shadow_text(MDRSOption, MDRSX, MDGY + 46, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
if MenuPageLRDisplay == 1 then
menu_shadow_text("Star Limit:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Star ID:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Behavior Types:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Stars Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

menu_shadow_text(tostring(STRGST.STRLFLimit), MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFID), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFB[STRGST.STRLFBehavior].Type, MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFS[STRGST.STRLFStars], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 2 then
menu_shadow_text("Level Location:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Level Area Num:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Level Act Num:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Levels Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

menu_shadow_text(STRLevels[STRGST.STRLFLevel].STRLN, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFArea), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFAct), MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFL[STRGST.STRLFLevels], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 3 then
menu_shadow_text("Mario Action:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Action Timer:", MDGX - 130, MDGY - 25, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Action Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

menu_shadow_text(STRActions[STRGST.STRLFAction].A_Name, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFSetTimer), MDGX - 5, MDGY - 20, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFA[STRGST.STRLFActions], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 4 then
menu_shadow_text("X Position:", MDGX - 130, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Y Position:", MDGX - 130, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Z Position:", MDGX - 130, MDGY - 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("X Box Position:", MDGX - 130, MDGY - 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Y Box Position:", MDGX - 130, MDGY, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
menu_shadow_text("Z Box Position:", MDGX - 130, MDGY + 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 6 and MenuSelectedOption == "Main")
menu_shadow_text("Position Functions:", MDGX - 130, MDGY + 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 7 and MenuSelectedOption == "Main")

menu_shadow_text(tostring(STRGST.STRLFXPos), MDGX - 5, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFYPos), MDGX - 5, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFZPos), MDGX - 5, MDGY - 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEXPos), MDGX - 5, MDGY - 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEYPos), MDGX - 5, MDGY, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEZPos), MDGX - 5, MDGY + 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 6 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFP[STRGST.STRLFPositions], MDGX - 5, MDGY + 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuUDOption == 7 and MenuSelectedOption == "Main")
end

menu_shadow_text("Requirement Type:", MDGX - 130, MDGY + 55, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuSelectedOption == "RunTypes")
menu_shadow_text(STRRunsTypeTable[STRGST.STRRunsTypes], MDGX - 5, MDGY + 62, MDGSize - 0.40, 0.95, 0.95, 255, 255, 0, 255, MenuSelectedOption == "RunTypes")
end

if STRMenuTitleName == "MDSingle" then
if MenuLROption == 1 then SBLF = "Left" elseif MenuLROption == 2 then SBLF = "Middle" elseif MenuLROption == 3 then SBLF = "Right" end 
if MenuSelectedOption == "SingleBinds" then MDSSOption = "(A) Save | (B) Exit | (Y) Randomize Buttons"
else MDSSOption = "(A) Start | (B) Exit | (X) Change Binds | (Y) Stop Run"
end
local MDSSX = (S_Width() - Hud_Measure(MDSSOption) * 0.25) / 2.0
shadow_text(MDSSOption, MDSSX, MDGY + 75, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

if MenuSelectedOption == "SingleBinds" then
WarpBindsText = "Warp Binds:  " .. STRButtonBinds[STRSBinds1].name .. " + " .. STRButtonBinds[STRSBinds2].name .. " + " .. STRButtonBinds[STRSBinds3].name .. " (" .. SBLF .. ")"
else
WarpBindsText = "Warp Binds:  " .. STRButtonBinds[STRSBinds1].name .. " + " .. STRButtonBinds[STRSBinds2].name .. " + " .. STRButtonBinds[STRSBinds3].name
end
local MDSSBX = (S_Width() - Hud_Measure(WarpBindsText) * 0.25) / 2.0
menu_shadow_text(WarpBindsText, MDSSBX, MDGY - 80, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "SingleBinds")

if MenuSelectedOption == "SingleBinds" then SBX = 56 else SBX = 53 end
menu_shadow_text("Levels:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Areas:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Acts:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Amount/Star ID:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Set Function:", MDGX - 130, MDGY + 50, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

menu_shadow_text(STRLevels[STRGST.STRSSLevelID].STRLN, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRSSAreaID), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRSSActID), MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRSSSetStars), MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(STRSSTypeTable[STRGST.STRSSType].SSName, MDGX - 5, MDGY + 55, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
end

if STRMenuTitleName == "MDConfig" then
menu_shadow_text("Info", MDGX - 105, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 1)
menu_shadow_text("How To Play", MDGX - 45, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 2)
menu_shadow_text("Settings", MDGX + 60, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 0, 255, MenuLROption == 3)
end
if STRMenuTitleName == "MDInfo" then
if MenuPageLRDisplay == 1 then MDInfoTitle = "What's new?"
elseif MenuPageLRDisplay == 2 then MDInfoTitle = "Credits"
elseif MenuPageLRDisplay == 3 then MDInfoTitle = "Changelog"
elseif MenuPageLRDisplay == 4 then MDInfoTitle = "Romhacks, Total: 69"
elseif MenuPageLRDisplay == 5 then MDInfoTitle = "Fixed Bugs"
end
local MDIX = (S_Width() - Hud_Measure(MDInfoTitle) * 0.35) / 2.0
shadow_text(MDInfoTitle, MDIX, MDGY - 85, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
if MenuPageLRDisplay == 1 then
shadow_text("No Major Additions Right Now...", MDGX - 100, MDGY, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255)
elseif MenuPageLRDisplay == 2 then
shadow_text("Original Mod by EmeraldLockdown", MDGX - 40, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Reworked Mod by JairoThePlumber", MDGX - 40, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Road Postions by Mr.Needlemouse", MDGX - 48, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Rules by Jairo and Chiara", MDGX - 40, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Reset Save File Code by EmilyEmmi", MDGX - 42, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Save Function From CS Mod by Squishy", MDGX - 48, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Button Combo Code By Pipocalio", MDGX - 38, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("The SM64 CoopDX Team", MDGX - 28, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Everyone Who help Test This Mod", MDGX - 40, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
elseif MenuPageLRDisplay == 3 then
shadow_text("! Move Run Slot Plugin to Runs Config", MDGX - 65, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Forgot to add Pink Star in Romhacks Info", MDGX - 65, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Kinda Redone Location and Position ID Lables", MDGX - 65, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Now Gamemode Doesn't Change Until you Select one", MDGX - 65, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added Some Buttons Display to some Menus", MDGX - 65, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Did Some Changes to keep the Text in the Center", MDGX - 65, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Stars/Keys are not Interactable when interaction is on", MDGX - 65, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added 6 Romahcks", MDGX - 65, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
elseif MenuPageLRDisplay == 4 then
Left = 100
Right = -20
if MenuPageUDDisplay == 1 then
shadow_text("Star Road", MDGX - Left, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Road: The Replica Comet", MDGX - Left, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 74 (+EE)", MDGX - Left, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM74: Ten Years After", MDGX - Left, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64 Moonshine", MDGX - Left, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("King Boo's Revenge 2", MDGX - Left, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Lug's Delightful Dioramas", MDGX - Left, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Lug's Delightful Dioramas: Green Comet", MDGX - Left, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64: The Green Stars", MDGX - Left, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64 Sapphire", MDGX - Left, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("The Phantom's Call", MDGX - Left, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 1: Star Takeover", MDGX - Left, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 2: Night of Doom", MDGX - Left, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 6.5", MDGX - Left, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Twisted Adventures", MDGX - Left, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

shadow_text("Luigi's Mansion 64", MDGX - Right, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Luigi's Mansion 64.5", MDGX - Right, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Paradise Island", MDGX - Right, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Ztar Attack 2", MDGX - Right, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Peach and The Pink Star", MDGX - Right, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64: Hidden Stars", MDGX - Right, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario The Galactic Journey", MDGX - Right, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 1.5: Star Takeover Redone", MDGX - Right, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Luigi and the Forest Ruins", MDGX - Right, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Only Up 64", MDGX - Right, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Thousand Year Door 64", MDGX - Right, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: The Mushroom Cup", MDGX - Right, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Eternal Realm", MDGX - Right, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Despair Mario's Gambit", MDGX - Right, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Retro Land", MDGX - Right, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
elseif MenuPageUDDisplay == 2 then
shadow_text("Super Mario 64: The Underworld", MDGX - Left, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Katze Stuck in the Toilet 64", MDGX - Left, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario The Power Star Journey", MDGX - Left, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Shining Stars", MDGX - Left, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Shining Stars 2: Mirror Madness", MDGX - Left, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario's Treasure Dome: The Revival", MDGX - Left, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Luigi & The Violet Stars", MDGX - Left, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Sapphire Green Comet", MDGX - Left, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Royal Legacy", MDGX - Left, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Extra", MDGX - Left, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 3: Mario on An Saoire 64", MDGX - Left, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 4: The Kedama Takeover 64", MDGX - Left, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64 Trouble Town", MDGX - Left, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 1.3: Redone", MDGX - Left, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64 Into Bowser's Castle", MDGX - Left, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

shadow_text("Green Star Revenge 1", MDGX - Right, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario and the Marvel Adventure", MDGX - Right, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Rainbow Road", MDGX - Right, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Sonic Adventure 64 DX", MDGX - Right, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Bell Thrill", MDGX - Right, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Beat Block Beatdown", MDGX - Right, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario In The Colorful Lands", MDGX - Right, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Roblox 64", MDGX - Right, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: The Green Comet", MDGX - Right, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Return to Retroland", MDGX - Right, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Somari 64: DASH!", MDGX - Right, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Fallen Stars", MDGX - Right, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Banjo Kazooie 64 Redux", MDGX - Right, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 4.5: The Kedama Takeover Redone", MDGX - Right, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 5: Neo Blue Realm", MDGX - Right, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
elseif MenuPageUDDisplay == 3 then
shadow_text("Super Mario 8MB", MDGX - Left, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Star", MDGX - Left, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Goomba's Easter Egg Hunt", MDGX - Left, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Kaizo Mario 64", MDGX - Left, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Openworld Quest", MDGX - Left, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Organ of Matrias", MDGX - Left, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 8: Scepter of Hope", MDGX - Left, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario on Indigo Island", MDGX - Left, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 3.9: Dreamish Block Beats", MDGX - Left, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
end
elseif MenuPageLRDisplay == 5 then
shadow_text("Fixed Best Time Display Behind Single Stars Requirement", MDGX - 65, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Gamemode Instantly Switches when changing it", MDGX - 65, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Run Slot Switching to 1 When checking it", MDGX - 65, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed STRGST.STRLFSetTimer set to 0 instead of 1", MDGX - 65, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Blue and Green being swap for some reason", MDGX - 65, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed one of the host options is visable for non host", MDGX - 65, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Available Slot being Visable for non host", MDGX - 65, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed not being able to Pause in Practice", MDGX - 65, MDGY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
end
end
if STRMenuTitleName == "MDHTP" then
if MenuPageLRDisplay == 1 then MDHTPTitle = "Normal"
elseif MenuPageLRDisplay == 2 then MDHTPTitle = "Practice"
elseif MenuPageLRDisplay == 3 then MDHTPTitle = "Casual"
elseif MenuPageLRDisplay == 4 then MDHTPTitle = "Single Stars"
end
local MDHTPX = (S_Width() - Hud_Measure(MDHTPTitle) * 0.35) / 2.0
shadow_text(MDHTPTitle, MDHTPX, MDGY - 85, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
if MenuPageLRDisplay == 1 then
shadow_text("Your Goal is to Beat the Game as Quickly as Possible", MDGX - 105, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("Rules are Needed to Insure you're doing the Right Run", MDGX - 105, MDGY - 55, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("Server Settings are Needed If you want your Run to be Vaild", MDGX - 105, MDGY - 40, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("And Finally, Make sure to have Fun with this Mod", MDGX - 105, MDGY - 25, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("0:03:59.366", MDGX - 25, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
Hud_Texture(gTextures.mario_head, MDGX + 0, MDGY + 30, 1, 1)
Hud_Texture(gTextures.luigi_head, MDGX + 20, MDGY + 30, 1, 1)
Hud_Texture(gTextures.toad_head, MDGX + 40, MDGY + 30, 1, 1)
Hud_Texture(gTextures.wario_head, MDGX + 60, MDGY + 30, 1, 1)
Hud_Texture(gTextures.waluigi_head, MDGX + 80, MDGY + 30, 1, 1)
Hud_Texture(gTextures.star, MDGX - 60, MDGY + 0, 1, 1)
end
if MenuPageLRDisplay == 2 then
shadow_text("This Gamemode is for those who want to Practice Runs", MDGX - 105, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("The Timer will Reset After Finishing a Run", MDGX - 105, MDGY - 55, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("You will Start Instantly when Starting a Run", MDGX - 105, MDGY - 40, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("This can be used for Best Time as well", MDGX - 105, MDGY - 25, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("0:05:42.533", MDGX - 70, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("-->", MDGX - 9, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("0:02:13.700", MDGX + 15, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
Hud_Texture(gTextures.mario_head, MDGX - 55, MDGY + 30, 1, 1)
Hud_Texture(gTextures.mario_head, MDGX + 30, MDGY + 30, 1, 1)
Hud_Texture(gTextures.star, MDGX - 55, MDGY + 10, 1, 1)
Hud_Texture(gTextures.star, MDGX + 30, MDGY + 10, 1, 1)
end
if MenuPageLRDisplay == 3 then
shadow_text("A Simple Gamemode is for those who want to play it Normal", MDGX - 105, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("The Timer will Reset After Finishing a Run", MDGX - 105, MDGY - 55, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("The Timer will still be on even after Rehosting", MDGX - 105, MDGY - 40, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("It can be Paused Incase You want the Timer to Stop", MDGX - 105, MDGY - 25, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("0:18:34.933", MDGX - 25, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
Hud_Texture(gTextures.mario_head, MDGX - 45, MDGY + 30, 1, 1)
Hud_Texture(gTextures.luigi_head, MDGX - 25, MDGY + 30, 1, 1)
Hud_Texture(gTextures.toad_head, MDGX - 5, MDGY + 30, 1, 1)
Hud_Texture(gTextures.wario_head, MDGX + 15, MDGY + 30, 1, 1)
Hud_Texture(gTextures.waluigi_head, MDGX + 35, MDGY + 30, 1, 1)
end
if MenuPageLRDisplay == 4 then
shadow_text("This Gamemode is for those who want to do Single Stars", MDGX - 105, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("You can choose on what run you can try", MDGX - 105, MDGY - 55, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("You can Reset by using Binds of your Choice", MDGX - 105, MDGY - 40, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("You can reset the Timer if you want to Redo the Run", MDGX - 105, MDGY - 25, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("Amount Limit: Collect 3 Stars", MDGX - 50, MDGY - 5, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
shadow_text("0:00:13.466", MDGX - 25, MDGY + 50, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)
Hud_Texture(gTextures.mario_head, MDGX - 10, MDGY + 30, 1, 1)
Hud_Texture(gTextures.luigi_head, MDGX + 10, MDGY + 30, 1, 1)
Hud_Texture(gTextures.toad_head, MDGX + 30, MDGY + 30, 1, 1)
Hud_Texture(gTextures.wario_head, MDGX + 50, MDGY + 30, 1, 1)
Hud_Texture(gTextures.waluigi_head, MDGX + 70, MDGY + 30, 1, 1)
Hud_Texture(gTextures.star, MDGX - 75, MDGY + 10, 1, 1)
Hud_Texture(gTextures.star, MDGX - 40, MDGY + 20, 1, 1)
Hud_Texture(gTextures.star, MDGX - 60, MDGY + 40, 1, 1)

end
end
if STRMenuTitleName == "MDCSettings" then
if MenuPageLRDisplay == 2 then MDCSROption = "(A) Select | (B) Exit | (L/R Trig) Menu Page: " .. MenuPageLRDisplay .. "/4 | (Y) Randomize Settings | (X) Play Sound"
elseif MenuPageLRDisplay == 4 then MDCSROption = "(A) Select | (B) Exit | (L/R Trig) Menu Page: " .. MenuPageLRDisplay .. "/4 | (Y) Softlock Warp Help"
else MDCSROption = "(A) Select | (B) Exit | (L/R Trig) Menu Page: " .. MenuPageLRDisplay .. "/4 | (Y) Randomize Settings" 
end
local MDCSROX = (S_Width() - Hud_Measure(MDCSROption) * 0.25) / 2.0
shadow_text(MDCSROption, MDCSROX, MDGY + 46, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
if MenuPageLRDisplay == 1 then MDCSTitle = "Fonts"
elseif MenuPageLRDisplay == 2 then MDCSTitle = "Sounds"
elseif MenuPageLRDisplay == 3 then MDCSTitle = "Colors"
elseif MenuPageLRDisplay == 4 then MDCSTitle = "Extras"
end
local MDCSX = (S_Width() - Hud_Measure(MDCSTitle) * 0.35) / 2.0
shadow_text(MDCSTitle, MDCSX, MDGY - 85, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)

menu_shadow_text("- (Z) Reset Saved Settings -", MDGX - 65, MDGY + 56, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")
hide_shadow_text("(A) Reset | (B) Back", MDGX - 26, MDGY + 80, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")
hide_shadow_text("Are you sure you want to Reset your Settings?", MDGX - 55, MDGY + 71, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")
if MenuPageLRDisplay == 1 then
menu_shadow_text("Timer:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Countdown:", MDGX - 130, MDGY - 25, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Go:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

if STRFontTMNumber > 6 then RFontColor = 0 GFontColor = 150 BFontColor = 255 else RFontColor = 255 GFontColor = 255 BFontColor = 0 end
menu_shadow_text(STRFontsTable[STRFontTMNumber].str_font_name, MDGX - 40, MDGY - 63, MDGSize - 0.40, 0.95, 0.95, RFontColor, GFontColor, BFontColor, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRFontsTable[STRFontCDNumber].str_font_name, MDGX - 40, MDGY - 18, MDGSize - 0.40, 0.95, 0.95, RFontColor, GFontColor, BFontColor, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRFontsTable[STRFontGONumber].str_font_name, MDGX - 40, MDGY + 27, MDGSize - 0.40, 0.95, 0.95, RFontColor, GFontColor, BFontColor, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
end
if MenuPageLRDisplay == 2 then
menu_shadow_text("Fanfare:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Countdown:", MDGX - 130, MDGY - 25, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Go:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

if STRFanfareNumber ~= 1 then RFFColor = 0 GFFColor = 150 BFFColor = 255 else RFFColor = 255 GFFColor = 255 BFFColor = 0 end
if STRCountdownNumber > 5 then RCDColor = 0 GCDColor = 150 BCDColor = 255 else RCDColor = 255 GCDColor = 255 BCDColor = 0 end
if STRGoNumber ~= 1 then RGOColor = 0 GGOColor = 150 BGOColor = 255 else RGOColor = 255 GGOColor = 255 BGOColor = 0 end

menu_shadow_text(STRFanfareTable[STRFanfareNumber].str_fanfare_name, MDGX - 40, MDGY - 63, MDGSize - 0.40, 0.95, 0.95, RFFColor, GFFColor, BFFColor, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRCountdownTable[STRCountdownNumber].str_countdown_name, MDGX - 40, MDGY - 18, MDGSize - 0.40, 0.95, 0.95, RCDColor, GCDColor, BCDColor, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRGoTable[STRGoNumber].str_go_name, MDGX - 40, MDGY + 27, MDGSize - 0.40, 0.95, 0.95, RGOColor, GGOColor, BGOColor, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

end
if MenuPageLRDisplay == 3 then
menu_shadow_text("Font Colors:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Rect Colors:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Menu Colors:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Timer Pos:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

if MenuLROption == 1 then RCSet = 255 GCSet = 0 BCSet = 0 elseif MenuLROption == 2 then RCSet = 0 GCSet = 255 BCSet = 0
elseif MenuLROption == 3 then RCSet = 0 GCSet = 0 BCSet = 255 elseif MenuLROption == 4 then RCSet = 255 GCSet = 255 BCSet = 255
end
menu_shadow_text("(" .. STRFR .. ", " .. STRFG .. ", " .. STRFB .. ", " .. STRFV .. ")", MDGX - 40, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 1 and MenuSelectedOption == "FontColors")
menu_shadow_text("(" .. STRRR .. ", " .. STRRG .. ", " .. STRRB .. ", " .. STRRV .. ")", MDGX - 40, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 2 and MenuSelectedOption == "RectColors")
menu_shadow_text("(" .. STRMenuR .. ", " .. STRMenuG .. ", " .. STRMenuB .. ", " .. STRMenuV .. ")", MDGX - 40, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 3 and MenuSelectedOption == "MenuColors")

if MenuLROption == 1 and MenuUDOption == 4 and MenuSelectedOption == "FontPosition" then
menu_shadow_text("(" .. CXPos .. ", " .. CYPos .. ") - XPos", MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
elseif MenuLROption == 2 and MenuUDOption == 4 then
menu_shadow_text("(" .. CXPos .. ", " .. CYPos .. ") - YPos", MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
else
menu_shadow_text("(" .. CXPos .. ", " .. CYPos .. ")", MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
end
end
if MenuPageLRDisplay == 4 then
if MenuPageUDDisplay == 1 then
menu_shadow_text("Custom Colors:", MDGX - 130, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Font Render:", MDGX - 130, MDGY - 50, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Helper Display:", MDGX - 130, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Menu Config:", MDGX - 130, MDGY + 0, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Rules Display:", MDGX - 130, MDGY + 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

menu_shadow_text(STRCustomColors, MDGX - 15, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRRenderType, MDGX - 15, MDGY - 50, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRHelper, MDGX - 15, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRMenuButtons, MDGX - 15, MDGY + 0, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(STRRules, MDGX - 15, MDGY + 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

if MenuSelectedOption == "MenuBinds" then MBC = 0 else MBC = 255 end
if MenuSelectedOption == "RulesBinds" then RBC = 0 else RBC = 255 end
if MenuUDOption == 4 then MRBY = 15 elseif MenuUDOption == 5 then MRBY = -15 else MRBY = 15 end
if MenuLROption == 1 then MBLF = "Left" elseif MenuLROption == 2 then MBLF = "Middle" elseif MenuLROption == 3 then MBLF = "Right" end 

if MenuSelectedOption == "Main" then
hide_shadow_text("(X) Change Binds", MDGX - 15, MDGY - MRBY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, (MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both")) 
or (MenuUDOption == 5 and STRRules == "Enabled"))
else 
hide_shadow_text("(A) Save | (Y) Randomize Buttons | (L/R) " .. MBLF, MDGX - 15, MDGY - MRBY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, 
(MenuSelectedOption == "MenuBinds" or MenuSelectedOption == "RulesBinds") and ((STRMenuButtons == "Buttons" or STRMenuButtons == "Both") or STRRules == "Enabled"))
end

hide_shadow_text(STRButtonBinds[STRMBinds1].name .. " + " .. STRButtonBinds[STRMBinds2].name .. " + " .. STRButtonBinds[STRMBinds3].name, MDGX - 15, MDGY - 7, MDGSize - 0.50, 0.50, 0.50, 255, 255, MBC, 255, 
MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both"))

hide_shadow_text(STRButtonBinds[STRRBinds1].name .. " + " .. STRButtonBinds[STRRBinds2].name .. " + " .. STRButtonBinds[STRRBinds3].name, MDGX - 15, MDGY + 23, MDGSize - 0.50, 0.50, 0.50, 255, 255, RBC, 255, 
MenuUDOption == 5 and STRRules == "Enabled")
end

if MenuPageUDDisplay == 2 then
BTTotal = STRBestTimeNumber / 30 BTHours = math.floor(BTTotal / 3600) BTMinutes = math.floor((BTTotal % 3600) / 60) BTSeconds = math.floor(BTTotal % 60) BTMilliSeconds = math.floor((BTTotal * 1000) % 1000)
BestTimeText = string.format('%01d:%02d:%02d.%03d', BTHours, BTMinutes, BTSeconds, BTMilliSeconds)
if STRBestTimeOption == "Enabled" then BTOText = "(A) Enabled" elseif STRBestTimeOption == "Disabled" then BTOText = "(A) Disabled"  elseif STRBestTimeOption == "Saves" then BTOText = "(A) Saves After Run" end
if STRBTNLimit == 1 then BTNLText = "Millisecond" elseif STRBTNLimit == 30 then BTNLText = "Second" elseif STRBTNLimit == 1800 then BTNLText = "Minute" elseif STRBTNLimit == 108000 then BTNLText = "Hour" end

menu_shadow_text("Display Requirements:", MDGX - 130, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Warp Settings:", MDGX - 130, MDGY - 45, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Best Time Settings: ", MDGX - 130, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("- View Host Settings -", MDGX - 55, MDGY + 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

menu_shadow_text(STRRDisplay, MDGX - 15, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRMenuWarpType, MDGX - 15, MDGY - 45, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(BestTimeText, MDGX - 15, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
hide_shadow_text(BTOText .. " | (Y) Randomize Time | (X) Reset Time", MDGX - 15, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
hide_shadow_text("(U/D) + " .. BTNLText .. " | (L/R Trig) Change Seconds", MDGX - 15, MDGY - 22, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
end
end
end
if STRMenuTitleName == "MDConfigVH" then
local VHHSWidth = Hud_Measure("- Host Settings -") * MDGSize local VHHSX = (S_Width() - VHHSWidth) / 2.0
local VHSSWidth = Hud_Measure("- Server Settings -") * MDGSize local VHSSX = (S_Width() - VHSSWidth) / 2.0
local VHLSWidth = Hud_Measure("- Lobby Settings -") * MDGSize local VHLSX = (S_Width() - VHLSWidth) / 2.0

menu_shadow_text("- Host Settings -", VHHSX - 18, MDGY - 70, MDGSize + 0.20, 1.50, 1.50, 255, 255, 0, 255, MenuUDOption == 1)
menu_shadow_text("- Server Settings -", VHSSX - 18, MDGY - 20, MDGSize + 0.20, 1.50, 1.50, 255, 255, 0, 255, MenuUDOption == 2)
menu_shadow_text("- Lobby Settings -", VHLSX - 18, MDGY + 30, MDGSize + 0.20, 1.50, 1.50, 255, 255, 0, 255, MenuUDOption == 3)
end
end
end

function str_menu_update()
	if (STRMenuButtons == "Buttons" or STRMenuButtons == "Both") then 
	if str_button_combo(gControllers[0], STRButtonBinds[STRMBinds1].button, STRButtonBinds[STRMBinds2].button, STRButtonBinds[STRMBinds3].button) then
	STRMenuDisplay = true 
	STRRulesOpen = false
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) 
	end
	end
	 
	if charSelectExists then charSelect.restrict_movesets(STRGST.DisableCSMoveset) 
	if charSelect.is_menu_open() and (STRRulesOpen == true or STRMenuDisplay == true) then STRRulesOpen = false STRMenuDisplay = false play_sound(SOUND_MENU_HAND_DISAPPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) end
	end

	if STRMenuDisplay == false and MenuSwitchDeplay >= 1 then MenuSwitchDeplay = MenuSwitchDeplay - 1 end
	if STRMenuDisplay == true and MenuSwitchDeplay <= 4 then MenuSwitchDeplay = MenuSwitchDeplay + 1 MenuButtonsDeplay = 100 end
	
	if is_game_paused() then
	STRMenuDisplay = false
	STRRulesOpen = false
	MenuSwitchDeplay = 0
	end
	
	if STRMenuDisplay == true then
	if MenuOptionDeplay >= 1 then MenuOptionDeplay = MenuOptionDeplay - 1 end
	if DPUpDelay <= 4 then DPUpDelay = DPUpDelay + 1 end
	if DPDownDelay <= 4 then DPDownDelay = DPDownDelay + 1 end
	if DPLeftDelay <= 4 then DPLeftDelay = DPLeftDelay + 1 end
	if DPRightDelay <= 4 then DPRightDelay = DPRightDelay + 1 end
	end
	
	-- FailSafe on Buttons
	MBDpadNum1 = (STRMBinds1 == 10 or STRMBinds1 == 11 or STRMBinds1 == 12 or STRMBinds1 == 13)
	MBDpadNum2 = (STRMBinds2 == 10 or STRMBinds2 == 11 or STRMBinds2 == 12 or STRMBinds2 == 13)
	MBDpadNum3 = (STRMBinds3 == 10 or STRMBinds3 == 11 or STRMBinds3 == 12 or STRMBinds3 == 13)
	MBCStickNum1 = (STRMBinds1 == 14 or STRMBinds1 == 15 or STRMBinds1 == 16 or STRMBinds1 == 17)
	MBCStickNum2 = (STRMBinds2 == 14 or STRMBinds2 == 15 or STRMBinds2 == 16 or STRMBinds2 == 17)
	MBCStickNum3 = (STRMBinds3 == 14 or STRMBinds3 == 15 or STRMBinds3 == 16 or STRMBinds3 == 17)
	RBDpadNum1 = (STRRBinds1 == 10 or STRRBinds1 == 11 or STRRBinds1 == 12 or STRRBinds1 == 13)
	RBDpadNum2 = (STRRBinds2 == 10 or STRRBinds2 == 11 or STRRBinds2 == 12 or STRRBinds2 == 13)
	RBDpadNum3 = (STRRBinds3 == 10 or STRRBinds3 == 11 or STRRBinds3 == 12 or STRRBinds3 == 13)
	RBCStickNum1 = (STRRBinds1 == 14 or STRRBinds1 == 15 or STRRBinds1 == 16 or STRRBinds1 == 17)
	RBCStickNum2 = (STRRBinds2 == 14 or STRRBinds2 == 15 or STRRBinds2 == 16 or STRRBinds2 == 17)
	RBCStickNum3 = (STRRBinds3 == 14 or STRRBinds3 == 15 or STRRBinds3 == 16 or STRRBinds3 == 17)
	SBDpadNum1 = (STRSBinds1 == 10 or STRSBinds1 == 11 or STRSBinds1 == 12 or STRSBinds1 == 13)
	SBDpadNum2 = (STRSBinds2 == 10 or STRSBinds2 == 11 or STRSBinds2 == 12 or STRSBinds2 == 13)
	SBDpadNum3 = (STRSBinds3 == 10 or STRSBinds3 == 11 or STRSBinds3 == 12 or STRSBinds3 == 13)
	SBCStickNum1 = (STRSBinds1 == 14 or STRSBinds1 == 15 or STRSBinds1 == 16 or STRSBinds1 == 17)
	SBCStickNum2 = (STRSBinds2 == 14 or STRSBinds2 == 15 or STRSBinds2 == 16 or STRSBinds2 == 17)
	SBCStickNum3 = (STRSBinds3 == 14 or STRSBinds3 == 15 or STRSBinds3 == 16 or STRSBinds3 == 17)
	
	if (STRMBinds1 == 1 and STRMBinds2 == 1 and STRMBinds3 == 1) 
	or (MBDpadNum1 and MBDpadNum2 and MBDpadNum3) or (MBCStickNum1 and MBCStickNum2 and MBCStickNum3)
	or (MBDpadNum1 and MBDpadNum2) or (MBDpadNum2 and MBDpadNum3) or (MBDpadNum1 and MBDpadNum3) 
	or (MBCStickNum1 and MBCStickNum2) or (MBCStickNum2 and MBCStickNum3) or (MBCStickNum1 and MBCStickNum3) then
	STRMenuBindsFS = true
	else
	STRMenuBindsFS = false
	end
	if (STRRBinds1 == 1 and STRRBinds2 == 1 and STRRBinds3 == 1) 
	or (RBDpadNum1 and RBDpadNum2 and RBDpadNum3) or (RBCStickNum1 and RBCStickNum2 and RBCStickNum3)
	or (RBDpadNum1 and RBDpadNum2) or (RBDpadNum2 and RBDpadNum3) or (RBDpadNum1 and RBDpadNum3) 
	or (RBCStickNum1 and RBCStickNum2) or (RBCStickNum2 and RBCStickNum3) or (RBCStickNum1 and RBCStickNum3) then
	STRRulesBindsFS = true
	else
	STRRulesBindsFS = false
	end
	if (SBDpadNum1 and SBDpadNum2 and SBDpadNum3) or (SBCStickNum1 and SBCStickNum2 and SBCStickNum3)
	or (SBDpadNum1 and SBDpadNum2) or (SBDpadNum2 and SBDpadNum3) or (SBDpadNum1 and SBDpadNum3) 
	or (SBCStickNum1 and SBCStickNum2) or (SBCStickNum2 and SBCStickNum3) or (SBCStickNum1 and SBCStickNum3) then
	STRSingleBindsFS = true
	else
	STRSingleBindsFS = false
	end
end

function str_menu_function(m)
	CameraObject = gMarioStates[0].marioObj.header.gfx.cameraToObject
	Change_Select = SOUND_MENU_CHANGE_SELECT
	File_Select = SOUND_MENU_CLICK_FILE_SELECT
	Appear_Message = SOUND_MENU_MESSAGE_APPEAR
	Disappear_Message = SOUND_MENU_MESSAGE_DISAPPEAR
	Next_Page = SOUND_MENU_MESSAGE_NEXT_PAGE
	Camera_Buzz = SOUND_MENU_CAMERA_BUZZ
	Hand_Appear = SOUND_MENU_HAND_APPEAR
	Hand_Disappear = SOUND_MENU_HAND_DISAPPEAR
	Star_Appear = SOUND_GENERAL2_STAR_APPEARS
	Reverse_Pause = SOUND_MENU_REVERSE_PAUSE
	Read_Sign = SOUND_MENU_READ_A_SIGN
	Exit_Sign = SOUND_MENU_EXIT_A_SIGN
	Bowser_Laugh = SOUND_MENU_BOWSER_LAUGH
	castle_warp = SOUND_MENU_MARIO_CASTLE_WARP
	castle_warp2 = SOUND_MENU_MARIO_CASTLE_WARP2
	
if STRMenuDisplay == true and MenuSwitchDeplay == 5 and not djui_hud_is_pause_menu_created() then
	if (MBDown & START_BUTTON) ~= 0 and MenuButtonsDeplay == 0 then STRMenuDisplay = false play_sound(Hand_Disappear, CameraObject) end
	
	MDGHoldUp = (MStickY < 129 and MStickY > 110)
	MDGHoldDown = (MStickY < -110 and MStickY > -129) 
	MDGHoldLeft = (MStickX < -110 and MStickX > -129)
	MDGHoldRight = (MStickX < 129 and MStickX > 110)
	
	MDGUpStick = (MDGHoldUp and (MenuUpDelay == 1 or MenuUpDelay == STRMenuDeplay[MenuUpDelay]))
	MDGDownStick = (MDGHoldDown and (MenuDownDelay == 1 or MenuDownDelay == STRMenuDeplay[MenuDownDelay]))
	MDGLeftStick = (MDGHoldLeft and (MenuLeftDelay == 1 or MenuLeftDelay == STRMenuDeplay[MenuLeftDelay]))
	MDGRightStick = (MDGHoldRight and (MenuRightDelay == 1 or MenuRightDelay == STRMenuDeplay[MenuRightDelay]))
	
	if MDGHoldUp then MenuUpDelay = MenuUpDelay + 1 elseif not MDGHoldUp then MenuUpDelay = 0 end
	if MDGHoldDown then MenuDownDelay = MenuDownDelay + 1 elseif not MDGHoldDown then MenuDownDelay = 0 end
	if MDGHoldLeft then MenuLeftDelay = MenuLeftDelay + 1 elseif not MDGHoldLeft then MenuLeftDelay = 0 end
	if MDGHoldRight then MenuRightDelay = MenuRightDelay + 1 elseif not MDGHoldRight then MenuRightDelay = 0 end
	
	if MenuUpDelay == 1505 then MenuUpDelay = 1490 end
	if MenuDownDelay == 1505 then MenuDownDelay = 1490 end
	if MenuLeftDelay == 1505 then MenuLeftDelay = 1490 end
	if MenuRightDelay == 1505 then MenuRightDelay = 1490 end
	
	DpadUp = (MBDown & U_JPAD ~= 0 and DPUpDelay == 5)
	DpadDown = (MBDown & D_JPAD ~= 0 and DPDownDelay == 5)
	DpadLeft = (MBDown & L_JPAD ~= 0 and DPLeftDelay == 5)
	DpadRight = (MBDown & R_JPAD ~= 0 and DPRightDelay == 5)
	
	if DpadUp then DPUpDelay = 0 end
	if DpadDown then DPDownDelay = 0 end
	if DpadLeft then DPLeftDelay = 0 end
	if DpadRight then DPRightDelay = 0 end
	
	AButton = (MBDown == A_BUTTON and MenuOptionDeplay == 0)
	BButton = (MBDown == B_BUTTON and MenuOptionDeplay == 0)
	XButton = (MBDown == X_BUTTON and MenuOptionDeplay == 0)
	YButton = (MBDown == Y_BUTTON and MenuOptionDeplay == 0)
	LTrigger = (MBDown == L_TRIG and MenuOptionDeplay == 0)
	RTrigger = (MBDown == R_TRIG and MenuOptionDeplay == 0)
	ZTrigger = (MBDown == Z_TRIG and MenuOptionDeplay == 0)
	AllButtons = (AButton or BButton or XButton or YButton or LTrigger or RTrigger or ZTrigger)
	if AllButtons then MenuOptionDeplay = 10 end
	if MenuButtonsDeplay >= 1 then MenuButtonsDeplay = MenuButtonsDeplay - 1 end

if STRMenuTitleName == "MDMain" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 2 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 2 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end
end

if BButton then STRMenuDisplay = false play_sound(Hand_Disappear, CameraObject) end

if charSelectExists then
if ZTrigger and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" then play_sound(File_Select, CameraObject)
if STRGST.DisableCSMoveset == false then STRGST.DisableCSMoveset = true elseif STRGST.DisableCSMoveset == true then STRGST.DisableCSMoveset = false end
elseif ZTrigger and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 1 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 
and ((#STRPluginRuns == 0 and STRGST.STRPluginsTypes == 0) or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes ~= 0 and STRGST.STRPluginsCheck == true)) then
STRMenuDisplay = false
if STRGST.VanillaCG == true and (STRGST.SwitchIntro == true or gServerSettings.skipIntro == 0) then STRGST.STRGameState = "Started" else STRGST.STRGameState = "Preparing" end
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" STRMenuDisplay = false end
elseif AButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby") or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes == 0 and STRGST.STRPluginsCheck == false)) then 
play_sound(Camera_Buzz, CameraObject) 
end
if YButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 and STRGST.VanillaCG == true and gServerSettings.skipIntro == 1 and STRGST.STRGameState == "Lobby" then play_sound(File_Select, CameraObject)
if STRGST.SwitchIntro == false then STRGST.SwitchIntro = true elseif STRGST.SwitchIntro == true then STRGST.SwitchIntro = false end
elseif YButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 and STRGST.VanillaCG == true and STRGST.STRGameState ~= "Lobby") 
or (STRGST.VanillaCG == true and gServerSettings.skipIntro == 0)) then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 2 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 
and ((#STRPluginRuns == 0 and STRGST.STRPluginsTypes == 0) or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes ~= 0 and STRGST.STRPluginsCheck == true)) then
STRMenuDisplay = false STRGST.STRGameState = "Started"
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" STRMenuDisplay = false end
elseif AButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby") or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes == 0 and STRGST.STRPluginsCheck == false)) then 
play_sound(Camera_Buzz, CameraObject) 
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 3 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 then
STRMenuDisplay = false STRGST.STRGameState = "Started"
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" STRMenuDisplay = false end
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 4 then
if AButton and MenuLROption == 2 and MenuUDOption == 1 then play_sound(Camera_Buzz, CameraObject) end
end
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameMode == 4 then STRMenuTitleName = "MDSingle" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end

if AButton and MenuLROption == 3 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" then STRMenuTitleName = "MDSave" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuLROption == 3 and MenuUDOption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
if AButton and MenuLROption == 1 and MenuUDOption == 2 then STRMenuTitleName = "MDSettings" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuLROption == 2 and MenuUDOption == 2 then STRMenuTitleName = "MDServer" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuLROption == 3 and MenuUDOption == 2 and STRGST.STRGameMode ~= 4 then STRMenuTitleName = "MDRuns" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuLROption == 3 and MenuUDOption == 2 and STRGST.STRGameMode == 4 then play_sound(Camera_Buzz, CameraObject) end
if network_is_server() then
if XButton then STRMenuTitleName = "MDConfig" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Reverse_Pause, CameraObject) end
if RTrigger then MenuButtonsDeplay = 100 djui_open_pause_menu() end
end
end
end

if STRMenuTitleName == "MDSave" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 10 then MenuUDOption = MenuUDOption + 9 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 10 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 9 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuUDOption == 1 and MenuLROption == 1 then 
if STRGST.SFSMipsStar1 == "Erase" then STRGST.SFSMipsStar1 = "No Erase" elseif STRGST.SFSMipsStar1 == "No Erase" then STRGST.SFSMipsStar1 = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 2 and MenuLROption == 1 then 
if STRGST.SFSMipsStar2 == "Erase" then STRGST.SFSMipsStar2 = "No Erase" elseif STRGST.SFSMipsStar2 == "No Erase" then STRGST.SFSMipsStar2 = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 3 and MenuLROption == 1 then 
if STRGST.SFSToadStar1 == "Erase" then STRGST.SFSToadStar1 = "No Erase" elseif STRGST.SFSToadStar1 == "No Erase" then STRGST.SFSToadStar1 = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 4 and MenuLROption == 1 then 
if STRGST.SFSToadStar2 == "Erase" then STRGST.SFSToadStar2 = "No Erase" elseif STRGST.SFSToadStar2 == "No Erase" then STRGST.SFSToadStar2 = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 5 and MenuLROption == 1 then 
if STRGST.SFSToadStar3 == "Erase" then STRGST.SFSToadStar3 = "No Erase" elseif STRGST.SFSToadStar3 == "No Erase" then STRGST.SFSToadStar3 = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 6 and MenuLROption == 1 then 
if STRGST.SFSWingCap == "Erase" then STRGST.SFSWingCap = "No Erase" elseif STRGST.SFSWingCap == "No Erase" then STRGST.SFSWingCap = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 7 and MenuLROption == 1 then 
if STRGST.SFSMetalCap == "Erase" then STRGST.SFSMetalCap = "No Erase" elseif STRGST.SFSMetalCap == "No Erase" then STRGST.SFSMetalCap = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 8 and MenuLROption == 1 then 
if STRGST.SFSVanishCap == "Erase" then STRGST.SFSVanishCap = "No Erase" elseif STRGST.SFSVanishCap == "No Erase" then STRGST.SFSVanishCap = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 9 and MenuLROption == 1 then 
if STRGST.SFSDDDMovedBack == "Erase" then STRGST.SFSDDDMovedBack = "No Erase" elseif STRGST.SFSDDDMovedBack == "No Erase" then STRGST.SFSDDDMovedBack = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 10 and MenuLROption == 1 then 
if STRGST.SFSMoatDrain == "Erase" then STRGST.SFSMoatDrain = "No Erase" elseif STRGST.SFSMoatDrain == "No Erase" then STRGST.SFSMoatDrain = "Erase" end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 1 and MenuLROption == 2 then 
if STRGST.SFS50StarDoor == "Erase" then STRGST.SFS50StarDoor = "No Erase" elseif STRGST.SFS50StarDoor == "No Erase" then STRGST.SFS50StarDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 2 and MenuLROption == 2 then 
if STRGST.SFSBasementDoor == "Erase" then STRGST.SFSBasementDoor = "No Erase" elseif STRGST.SFSBasementDoor == "No Erase" then STRGST.SFSBasementDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 3 and MenuLROption == 2 then 
if STRGST.SFSBTIDWDoor == "Erase" then STRGST.SFSBTIDWDoor = "No Erase" elseif STRGST.SFSBTIDWDoor == "No Erase" then STRGST.SFSBTIDWDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 4 and MenuLROption == 2 then 
if STRGST.SFSBITFSDoor == "Erase" then STRGST.SFSBITFSDoor = "No Erase" elseif STRGST.SFSBITFSDoor == "No Erase" then STRGST.SFSBITFSDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 5 and MenuLROption == 2 then 
if STRGST.SFSCCMDoor == "Erase" then STRGST.SFSCCMDoor = "No Erase" elseif STRGST.SFSCCMDoor == "No Erase" then STRGST.SFSCCMDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 6 and MenuLROption == 2 then 
if STRGST.SFSJRBDoor == "Erase" then STRGST.SFSJRBDoor = "No Erase" elseif STRGST.SFSJRBDoor == "No Erase" then STRGST.SFSJRBDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 7 and MenuLROption == 2 then 
if STRGST.SFSPSSDoor == "Erase" then STRGST.SFSPSSDoor = "No Erase" elseif STRGST.SFSPSSDoor == "No Erase" then STRGST.SFSPSSDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 8 and MenuLROption == 2 then 
if STRGST.SFSUpstairsDoor == "Erase" then STRGST.SFSUpstairsDoor = "No Erase" elseif STRGST.SFSUpstairsDoor == "No Erase" then STRGST.SFSUpstairsDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 9 and MenuLROption == 2 then 
if STRGST.SFSWFDoor == "Erase" then STRGST.SFSWFDoor = "No Erase" elseif STRGST.SFSWFDoor == "No Erase" then STRGST.SFSWFDoor = "Erase" end play_sound(Change_Select, CameraObject) end
if AButton and MenuUDOption == 10 and MenuLROption == 2 then 
if STRGST.SFSKeys == "Erase" then STRGST.SFSKeys = "No Erase" elseif STRGST.SFSKeys == "No Erase" then STRGST.SFSKeys = "Erase" end play_sound(Change_Select, CameraObject) end

if ZTrigger and STRGST.STRGameState == "Lobby" then MenuSelectedOption = "EraseSave" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) 
elseif ZTrigger and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
end

if MenuSelectedOption == "EraseSave" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" STRGST.EraseSave = true STRMenuDisplay = false MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject) end

if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(File_Select, CameraObject) end
end

if BButton and MenuButtonsDeplay == 0 then STRMenuTitleName = "MDMain" MenuLROption = 3 MenuUDOption = 1 play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDSettings" and MenuButtonsDeplay == 0 and MenuViewHostCheck == false then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 4 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 4 play_sound(Next_Page, CameraObject) end
end

if MenuUDOption == 1 then
if MenuLROption ~= STRGST.STRGameMode and MenuSaveUpdate == false then MenuLROption = STRGST.STRGameMode MenuSaveUpdate = true 
elseif MenuLROption == STRGST.STRGameMode then MenuSaveUpdate = true end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 3 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end
end
end

if MenuUDOption == 2 then
if (MDGRightStick or DpadRight) and STRGST.STRGameState == "Lobby" then 
if STRGST.STRStartingType < 4 then STRGST.STRStartingType = STRGST.STRStartingType + 1 play_sound(Next_Page, CameraObject) 
elseif STRGST.STRStartingType > 3 then STRGST.STRStartingType = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and STRGST.STRGameState == "Lobby" then 
if STRGST.STRStartingType > 1 then STRGST.STRStartingType = STRGST.STRStartingType - 1 play_sound(Next_Page, CameraObject)
elseif STRGST.STRStartingType < 2 then STRGST.STRStartingType = 4 play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end
end

if MenuUDOption == 3 then
if (MDGRightStick or DpadRight) and STRGST.STRGameState == "Lobby" then 
if STRGST.STRCDNumber < 99 then STRGST.STRCDNumber = STRGST.STRCDNumber + 1 play_sound(Next_Page, CameraObject) 
elseif STRGST.STRCDNumber > 3 then STRGST.STRCDNumber = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and STRGST.STRGameState == "Lobby" then 
if STRGST.STRCDNumber > 1 then STRGST.STRCDNumber = STRGST.STRCDNumber - 1 play_sound(Next_Page, CameraObject)
elseif STRGST.STRCDNumber < 2 then STRGST.STRCDNumber = 99 play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if AButton then Save_Storage("STRCDNum", tostring(STRGST.STRCDNumber)) play_sound(Star_Appear, CameraObject) end
end

if AButton and MenuUDOption == 1 then STRGST.STRGameMode = MenuLROption Save_Storage("STRGM", tostring(STRGST.STRGameMode)) play_sound(Star_Appear, CameraObject)
STRGST.STRGameState = "Resetting"
if AButton and MenuUDOption == 1 and STRGST.STRGameMode == 3 then STRGST.CasualGM = "Enabled" 
elseif AButton and MenuUDOption == 1 and STRGST.STRGameMode ~= 3 then STRGST.CasualGM = "Disabled"
end
Save_Storage("STRCasualOption", tostring(STRGST.CasualGM))
elseif AButton and MenuUDOption == 1 then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 2 and STRGST.STRGameState == "Lobby" then Save_Storage("STRSType", tostring(STRGST.STRStartingType)) play_sound(Star_Appear, CameraObject) 
elseif AButton and MenuUDOption == 2 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 4 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRFinishGameWarp == "Disabled" then STRGST.STRFinishGameWarp = "Enabled" elseif STRGST.STRFinishGameWarp == "Enabled" then STRGST.STRFinishGameWarp = "Disabled" end
Save_Storage("STRFGWarp", tostring(STRGST.STRFinishGameWarp)) play_sound(Star_Appear, CameraObject) 
elseif AButton and MenuUDOption == 4 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 5 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRBSFOption == "Disabled" then STRGST.STRBSFOption = "Enabled" elseif STRGST.STRBSFOption == "Enabled" then STRGST.STRBSFOption = "Disabled" end
Save_Storage("STRBackupOption", tostring(STRGST.STRBSFOption)) play_sound(Star_Appear, CameraObject) 
elseif AButton and MenuUDOption == 5 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if YButton and MenuUDOption == 5 and (STRGST.STRGameState == "Lobby" and STRGST.STRBSFOption == "Enabled") then 
if STRGST.STRBackupSF == false then STRGST.STRBackupSF = true STRGST.STRSFUpdater = false 
elseif STRGST.STRBackupSF == true then STRGST.STRBackupSF = false STRGST.STRSFUpdater = false end play_sound(Change_Select, CameraObject) 
elseif YButton and MenuUDOption == 5 and (STRGST.STRGameState ~= "Lobby" or STRGST.STRBSFOption == "Disabled") then play_sound(Camera_Buzz, CameraObject) end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 2 MenuSaveUpdate = false play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDSettings" and MenuViewHostCheck == true then 
if BButton then STRMenuTitleName = "MDConfigVH" MenuUDOption = 1 MenuButtonsDeplay = 10 MenuViewHostCheck = false play_sound(Disappear_Message, CameraObject) end end

if STRMenuTitleName == "MDServer" and MenuButtonsDeplay == 0 and MenuViewHostCheck == false then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 4 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 4 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 2 MenuUDOption = 2 play_sound(Disappear_Message, CameraObject) end
end

if AButton and MenuUDOption == 1 and MenuLROption == 1 then 
if gServerSettings.playerInteractions == 0 then gServerSettings.playerInteractions = 1 
elseif gServerSettings.playerInteractions == 1 then gServerSettings.playerInteractions = 2 
elseif gServerSettings.playerInteractions == 2 then gServerSettings.playerInteractions = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 1 and MenuLROption == 2 then 
if gServerSettings.playerKnockbackStrength == 10 then gServerSettings.playerKnockbackStrength = 25 
elseif gServerSettings.playerKnockbackStrength == 25 then gServerSettings.playerKnockbackStrength = 60
elseif gServerSettings.playerKnockbackStrength == 60 then gServerSettings.playerKnockbackStrength = 10 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 2 and MenuLROption == 1 then 
if gServerSettings.pvpType == 0 then gServerSettings.pvpType = 1 elseif gServerSettings.pvpType == 1 then gServerSettings.pvpType = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 2 and MenuLROption == 2 then 
if gServerSettings.stayInLevelAfterStar == 0 then gServerSettings.stayInLevelAfterStar = 1 
elseif gServerSettings.stayInLevelAfterStar == 1 then gServerSettings.stayInLevelAfterStar = 2
elseif gServerSettings.stayInLevelAfterStar == 2 then gServerSettings.stayInLevelAfterStar = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 3 and MenuLROption == 1 then 
if gServerSettings.bouncyLevelBounds == 0 then gServerSettings.bouncyLevelBounds = 1 
elseif gServerSettings.bouncyLevelBounds == 1 then gServerSettings.bouncyLevelBounds = 2
elseif gServerSettings.bouncyLevelBounds == 2 then gServerSettings.bouncyLevelBounds = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 3 and MenuLROption == 2 then 
if gServerSettings.nametags == 0 then gServerSettings.nametags = 1 elseif gServerSettings.nametags == 1 then gServerSettings.nametags = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 4 and MenuLROption == 1 then 
if gServerSettings.bubbleDeath == 0 then gServerSettings.bubbleDeath = 1 elseif gServerSettings.bubbleDeath == 1 then gServerSettings.bubbleDeath = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 4 and MenuLROption == 2 then 
if gServerSettings.pauseAnywhere == 0 then gServerSettings.pauseAnywhere = 1 elseif gServerSettings.pauseAnywhere == 1 then gServerSettings.pauseAnywhere = 0 end play_sound(Change_Select, CameraObject) end

if AButton and MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "MaxPlayers" end play_sound(Read_Sign, CameraObject) end

if MenuSelectedOption == "MaxPlayers" and MenuButtonsDeplay == 0 then
if MenuUDOption == 5 and MenuLROption == 1 then
if (MDGRightStick or DpadRight) then 
if gServerSettings.maxPlayers < 16 then gServerSettings.maxPlayers = gServerSettings.maxPlayers + 1 play_sound(Next_Page, CameraObject) 
elseif gServerSettings.maxPlayers > 3 then gServerSettings.maxPlayers = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if gServerSettings.maxPlayers > 1 then gServerSettings.maxPlayers = gServerSettings.maxPlayers - 1 play_sound(Next_Page, CameraObject)
elseif gServerSettings.maxPlayers < 2 then gServerSettings.maxPlayers = 16 play_sound(Next_Page, CameraObject) end
end
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if AButton and MenuUDOption == 5 and MenuLROption == 2 then 
if gServerSettings.skipIntro == 0 then gServerSettings.skipIntro = 1 elseif gServerSettings.skipIntro == 1 then gServerSettings.skipIntro = 0 end play_sound(Change_Select, CameraObject) end
end

if STRMenuTitleName == "MDServer" and MenuViewHostCheck == true then 
if BButton then STRMenuTitleName = "MDConfigVH" MenuUDOption = 2 MenuButtonsDeplay = 10 MenuViewHostCheck = false play_sound(Disappear_Message, CameraObject) end end

if STRMenuTitleName == "MDRuns" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 3 then MenuUDOption = MenuUDOption + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 3 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuUDOption == 1 then STRMenuTitleName = "MDLobby" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuUDOption == 2 and STRGST.AddRomhack == false then STRMenuTitleName = "MDLevels" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuUDOption == 2 and STRGST.AddRomhack == true then play_sound(Camera_Buzz, CameraObject) end
if AButton and MenuUDOption == 3 and STRRunSlotAdded == true then MenuSelectedOption = "MDRunSlot" MenuButtonsDeplay = 10 play_sound(Read_Sign, CameraObject) 
elseif AButton and MenuUDOption == 3 and STRRunSlotAdded == false then play_sound(Camera_Buzz, CameraObject) end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 3 MenuUDOption = 2 play_sound(Disappear_Message, CameraObject) end
end
end

if MenuSelectedOption == "MDRunSlot" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) and STRGST.STRGameState == "Lobby" and STRGST.STRPluginsCheck == true then 
if STRGST.STRPluginsTypes < #STRPluginRuns then STRGST.STRPluginsTypes = STRGST.STRPluginsTypes + 1 STRGST.STRPluginsSaved = STRGST.STRPluginsSaved + 1 play_sound(Next_Page, CameraObject) 
elseif STRGST.STRPluginsTypes > 1 then STRGST.STRPluginsTypes = 1 STRGST.STRPluginsSaved = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and (STRGST.STRGameState ~= "Lobby" or STRGST.STRPluginsCheck == false or #STRPluginRuns == 1) then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and STRGST.STRGameState == "Lobby" and STRGST.STRPluginsCheck == true then
if STRGST.STRPluginsTypes > 1 then STRGST.STRPluginsTypes = STRGST.STRPluginsTypes - 1 STRGST.STRPluginsSaved = STRGST.STRPluginsSaved - 1 play_sound(Next_Page, CameraObject) 
elseif STRGST.STRPluginsTypes < 2 then STRGST.STRPluginsTypes = #STRPluginRuns STRGST.STRPluginsSaved = #STRPluginRuns play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and (STRGST.STRGameState ~= "Lobby" or STRGST.STRPluginsCheck == false or #STRPluginRuns == 1) then play_sound(Camera_Buzz, CameraObject) 
end

if AButton and STRGST.STRGameState == "Lobby" then 
if STRGST.STRPluginsCheck == false then STRGST.STRPluginsCheck = true STRGST.STRPluginsTypes = STRGST.STRPluginsSaved
elseif STRGST.STRPluginsCheck == true then STRGST.STRPluginsCheck = false STRGST.STRPluginsTypes = 0 end play_sound(Change_Select, CameraObject) 
elseif AButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if BButton then MenuSelectedOption = "Main" MenuLROption = 1 MenuUDOption = 3 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if STRMenuTitleName == "MDLobby" and MenuButtonsDeplay == 0 and MenuViewHostCheck == false then
if MenuSelectedOption == "Main" then
if MenuLROption == 1 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = 5 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = 1 play_sound(Next_Page, CameraObject) end
end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuUDOption == 1 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.EnabledInteraction == false then STRGST.EnabledInteraction = true 
elseif STRGST.EnabledInteraction == true then STRGST.EnabledInteraction = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuUDOption == 1 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if MenuLROption == 2 then
if AButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRLevelUpdater = 0 play_sound(Change_Select, CameraObject) 
elseif AButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if BButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRSpotUpdater = 0 play_sound(Change_Select, CameraObject)
elseif BButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if YButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRSpotUpdater = 0 if STRGST.STRWarpType == "Level" then warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID) else warp_to_start_level() end
elseif YButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if XButton and STRGST.STRGameState == "Lobby" then 
play_sound(Change_Select, CameraObject)
STRGST.STRLevelID = STRGST.STRSavLevelID
STRGST.STRCourseID = STRGST.STRSavCourseID
STRGST.STRAreaID = STRGST.STRSavAreaID
STRGST.STRActID = STRGST.STRSavActID
STRGST.STRXPos = STRGST.STRSavXPos
STRGST.STRYPos = STRGST.STRSavYPos
STRGST.STRZPos = STRGST.STRSavZPos
elseif XButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end
end

if AButton and MenuUDOption == 2 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRLocationSpot == "Ground" then STRLocationSpot = "Anywhere" elseif STRLocationSpot == "Anywhere" then STRLocationSpot = "FrameSpot" elseif STRLocationSpot == "FrameSpot" then STRLocationSpot = "Ground" end 
Save_Storage("STRLSpot", tostring(STRLocationSpot)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 2 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 3 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRForceLevelType == "Levels" then STRGST.STRForceLevelType = "Areas" elseif STRGST.STRForceLevelType == "Areas" then STRGST.STRForceLevelType = "Acts"
elseif STRGST.STRForceLevelType == "Acts" then STRGST.STRForceLevelType = "Levels" end Save_Storage("STRFLType", tostring(STRGST.STRForceLevelType)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 3 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 4 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRWarpType == "Level" then STRGST.STRWarpType = "Start" elseif STRGST.STRWarpType == "Start" then STRGST.STRWarpType = "None"
elseif STRGST.STRWarpType == "None" then STRGST.STRWarpType = "Level" end Save_Storage("STRWType", tostring(STRGST.STRWarpType)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 4 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 5 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRForceSpot == "All" then STRGST.STRForceSpot = "Lobby" elseif STRGST.STRForceSpot == "Lobby" then STRGST.STRForceSpot = "Start" elseif STRGST.STRForceSpot == "Start" then STRGST.STRForceSpot = "Controller" 
elseif STRGST.STRForceSpot == "Controller" then STRGST.STRForceSpot = "TimeStop" elseif STRGST.STRForceSpot == "TimeStop" then STRGST.STRForceSpot = "None" elseif STRGST.STRForceSpot == "None" then STRGST.STRForceSpot = "All" end
Save_Storage("STRFSpot", tostring(STRGST.STRForceSpot)) play_sound(Star_Appear, CameraObject) 
elseif AButton and MenuUDOption == 5 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if ZTrigger and STRGST.STRGameState == "Lobby" then MenuSelectedOption = "EraseLobby" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) 
elseif ZTrigger and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if BButton and MenuLROption == 1 then STRMenuTitleName = "MDRuns" MenuLROption = 1 MenuUDOption = 1 play_sound(Disappear_Message, CameraObject) end
end

if MenuSelectedOption == "EraseLobby" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject) 
STRLocationSpot = "Ground"
STRGST.STRForceLevelType = "Levels"
STRGST.STRWarpType = "Level"
STRGST.STRForceSpot = "Start"
Save_Storage("STRLSpot", tostring(STRLocationSpot))
Save_Storage("STRFLType", tostring(STRGST.STRForceLevelType))
Save_Storage("STRWType", tostring(STRGST.STRWarpType))
Save_Storage("STRFSpot", tostring(STRGST.STRForceSpot))
end

if BButton then MenuSelectedOption = "Main" play_sound(File_Select, CameraObject) end
end
end

if STRMenuTitleName == "MDLobby" and MenuViewHostCheck == true then 
if BButton then STRMenuTitleName = "MDConfigVH" MenuUDOption = 3 MenuButtonsDeplay = 10 MenuViewHostCheck = false play_sound(Disappear_Message, CameraObject) end end

if STRMenuTitleName == "MDLevels" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if RTrigger then 
if MenuPageLRDisplay < 4 then MenuPageLRDisplay = MenuPageLRDisplay + 1 MenuUDOption = 1 play_sound(Next_Page, CameraObject) elseif MenuPageLRDisplay > 2 then MenuPageLRDisplay = 1 play_sound(Next_Page, CameraObject) end
MenuUDOption = 1
end

if LTrigger then 
if MenuPageLRDisplay > 1 then MenuPageLRDisplay = MenuPageLRDisplay - 1 MenuUDOption = 1 play_sound(Next_Page, CameraObject) elseif MenuPageLRDisplay < 2 then MenuPageLRDisplay = 4 play_sound(Next_Page, CameraObject) end
MenuUDOption = 1
end

if MenuPageLRDisplay == 1 or MenuPageLRDisplay == 2 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 4 then MenuUDOption = MenuUDOption + 3 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 4 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 3 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 3 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 3 then MenuUDOption = MenuUDOption + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 3 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 2 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 4 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 7 then MenuUDOption = MenuUDOption + 6 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 7 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 6 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 1 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRGST.STRLFLimit < 999 then STRGST.STRLFLimit = STRGST.STRLFLimit + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLimit > 2 then STRGST.STRLFLimit = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRGST.STRLFLimit > 1 then STRGST.STRLFLimit = STRGST.STRLFLimit - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLimit < 2 then STRGST.STRLFLimit = 999 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRGST.STRLFID < 16 then STRGST.STRLFID = STRGST.STRLFID + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFID > 2 then STRGST.STRLFID = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRGST.STRLFID > 1 then STRGST.STRLFID = STRGST.STRLFID - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFID < 2 then STRGST.STRLFID = 16 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRGST.STRLFBehavior < 16 then STRGST.STRLFBehavior = STRGST.STRLFBehavior + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFBehavior > 2 then STRGST.STRLFBehavior = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRGST.STRLFBehavior > 1 then STRGST.STRLFBehavior = STRGST.STRLFBehavior - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFBehavior < 2 then STRGST.STRLFBehavior = 16 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 4 then 
if STRGST.STRLFStars < 6 then STRGST.STRLFStars = STRGST.STRLFStars + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFStars > 2 then STRGST.STRLFStars = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 4 then 
if STRGST.STRLFStars > 1 then STRGST.STRLFStars = STRGST.STRLFStars - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFStars < 2 then STRGST.STRLFStars = 6 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 2 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRGST.STRLFLevel < 35 then STRGST.STRLFLevel = STRGST.STRLFLevel + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLevel > 2 then STRGST.STRLFLevel = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRGST.STRLFLevel > 1 then STRGST.STRLFLevel = STRGST.STRLFLevel - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLevel < 2 then STRGST.STRLFLevel = 35 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRGST.STRLFArea < 16 then STRGST.STRLFArea = STRGST.STRLFArea + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFArea > 2 then STRGST.STRLFArea = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRGST.STRLFArea > 1 then STRGST.STRLFArea = STRGST.STRLFArea - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFArea < 2 then STRGST.STRLFArea = 16 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRGST.STRLFAct < 8 then STRGST.STRLFAct = STRGST.STRLFAct + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFAct > 2 then STRGST.STRLFAct = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRGST.STRLFAct > 1 then STRGST.STRLFAct = STRGST.STRLFAct - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFAct < 2 then STRGST.STRLFAct = 8 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 4 then 
if STRGST.STRLFLevels < 6 then STRGST.STRLFLevels = STRGST.STRLFLevels + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLevels > 2 then STRGST.STRLFLevels = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 4 then 
if STRGST.STRLFLevels > 1 then STRGST.STRLFLevels = STRGST.STRLFLevels - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFLevels < 2 then STRGST.STRLFLevels = 6 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 3 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRGST.STRLFAction < 8 then STRGST.STRLFAction = STRGST.STRLFAction + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFAction > 2 then STRGST.STRLFAction = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRGST.STRLFAction > 1 then STRGST.STRLFAction = STRGST.STRLFAction - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFAction < 2 then STRGST.STRLFAction = 8 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRGST.STRLFSetTimer < 999 then STRGST.STRLFSetTimer = STRGST.STRLFSetTimer + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFSetTimer > 2 then STRGST.STRLFSetTimer = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRGST.STRLFSetTimer > 1 then STRGST.STRLFSetTimer = STRGST.STRLFSetTimer - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFSetTimer < 2 then STRGST.STRLFSetTimer = 999 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRGST.STRLFActions < 2 then STRGST.STRLFActions = STRGST.STRLFActions + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFActions > 1 then STRGST.STRLFActions = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRGST.STRLFActions > 1 then STRGST.STRLFActions = STRGST.STRLFActions - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFActions < 2 then STRGST.STRLFActions = 2 play_sound(Next_Page, CameraObject) end
end
end

if MenuPageLRDisplay == 4 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRGST.STRLFXPos < 18000 then STRGST.STRLFXPos = STRGST.STRLFXPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFXPos > -18000 then STRGST.STRLFXPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRGST.STRLFXPos > -18000 then STRGST.STRLFXPos = STRGST.STRLFXPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFXPos < 18000 then STRGST.STRLFXPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRGST.STRLFYPos < 18000 then STRGST.STRLFYPos = STRGST.STRLFYPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFYPos > -18000 then STRGST.STRLFYPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRGST.STRLFYPos > -18000 then STRGST.STRLFYPos = STRGST.STRLFYPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFYPos < 18000 then STRGST.STRLFYPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRGST.STRLFZPos < 18000 then STRGST.STRLFZPos = STRGST.STRLFZPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFZPos > -18000 then STRGST.STRLFZPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRGST.STRLFZPos > -18000 then STRGST.STRLFZPos = STRGST.STRLFZPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFZPos < 18000 then STRGST.STRLFZPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 4 then 
if STRGST.STRLFEXPos < 18000 then STRGST.STRLFEXPos = STRGST.STRLFEXPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEXPos > -18000 then STRGST.STRLFEXPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 4 then 
if STRGST.STRLFEXPos > -18000 then STRGST.STRLFEXPos = STRGST.STRLFEXPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEXPos < 18000 then STRGST.STRLFEXPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 5 then 
if STRGST.STRLFEYPos < 18000 then STRGST.STRLFEYPos = STRGST.STRLFEYPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEYPos > -18000 then STRGST.STRLFEYPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 5 then 
if STRGST.STRLFEYPos > -18000 then STRGST.STRLFEYPos = STRGST.STRLFEYPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEYPos < 18000 then STRGST.STRLFEYPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 6 then 
if STRGST.STRLFEZPos < 18000 then STRGST.STRLFEZPos = STRGST.STRLFEZPos + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEZPos > -18000 then STRGST.STRLFEZPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 6 then 
if STRGST.STRLFEZPos > -18000 then STRGST.STRLFEZPos = STRGST.STRLFEZPos - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFEZPos < 18000 then STRGST.STRLFEZPos = 0 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 7 then 
if STRGST.STRLFPositions < 14 then STRGST.STRLFPositions = STRGST.STRLFPositions + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFPositions > 2 then STRGST.STRLFPositions = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 7 then 
if STRGST.STRLFPositions > 1 then STRGST.STRLFPositions = STRGST.STRLFPositions - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRLFPositions < 2 then STRGST.STRLFPositions = 14 play_sound(Next_Page, CameraObject) end
end
end

if YButton and MenuButtonsDeplay == 0 then play_sound(Read_Sign, CameraObject) MenuSelectedOption = "RunTypes" MenuButtonsDeplay = 10 end
end

if MenuSelectedOption == "RunTypes" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if STRGST.STRRunsTypes < 15 then STRGST.STRRunsTypes = STRGST.STRRunsTypes + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRRunsTypes > 2 then STRGST.STRRunsTypes = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if STRGST.STRRunsTypes > 1 then STRGST.STRRunsTypes = STRGST.STRRunsTypes - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRRunsTypes < 2 then STRGST.STRRunsTypes = 15 play_sound(Next_Page, CameraObject) end
end

if YButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end
if BButton then STRMenuTitleName = "MDRuns" MenuLROption = 1 MenuUDOption = 2 MenuPageLRDisplay = 1 MenuSelectedOption = "Main" play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDSingle" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 4 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 4 play_sound(Next_Page, CameraObject) end
end

if YButton then STRGST.STRGameState = "Resetting" play_sound(Change_Select, CameraObject) end

if XButton then MenuSelectedOption = "SingleBinds" play_sound(Read_Sign, CameraObject) end

if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRGST.STRSSLevelID < 35 then STRGST.STRSSLevelID = STRGST.STRSSLevelID + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSLevelID > 2 then STRGST.STRSSLevelID = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRGST.STRSSLevelID > 1 then STRGST.STRSSLevelID = STRGST.STRSSLevelID - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSLevelID < 2 then STRGST.STRSSLevelID = 35 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRGST.STRSSAreaID < 16 then STRGST.STRSSAreaID = STRGST.STRSSAreaID + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSAreaID > 2 then STRGST.STRSSAreaID = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRGST.STRSSAreaID > 1 then STRGST.STRSSAreaID = STRGST.STRSSAreaID - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSAreaID < 2 then STRGST.STRSSAreaID = 16 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRGST.STRSSActID < 8 then STRGST.STRSSActID = STRGST.STRSSActID + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSActID > 2 then STRGST.STRSSActID = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRGST.STRSSActID > 1 then STRGST.STRSSActID = STRGST.STRSSActID - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSActID < 2 then STRGST.STRSSActID = 8 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 4 then 
if STRGST.STRSSSetStars < 999 then STRGST.STRSSSetStars = STRGST.STRSSSetStars + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSSetStars > 2 then STRGST.STRSSSetStars = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 4 then 
if STRGST.STRSSSetStars > 1 then STRGST.STRSSSetStars = STRGST.STRSSSetStars - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSSetStars < 2 then STRGST.STRSSSetStars = 999 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 5 then 
if STRGST.STRSSType < 10 then STRGST.STRSSType = STRGST.STRSSType + 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSType > 2 then STRGST.STRSSType = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 5 then 
if STRGST.STRSSType > 1 then STRGST.STRSSType = STRGST.STRSSType - 1 play_sound(Next_Page, CameraObject) elseif STRGST.STRSSType < 2 then STRGST.STRSSType = 10 play_sound(Next_Page, CameraObject) end
end

if AButton then STRGST.STRGameState = "Started" STRGST.STRSSWarp = 3 STRGST.STRSSText = 300 STRGST.STRSSCollectedStar = STRGST.STRSSSetStars STRGST.STRGlobalTimer = 0 STRMenuDisplay = false end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 1 play_sound(Disappear_Message, CameraObject) end
end

if MenuSelectedOption == "SingleBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRSBinds1 < 17 then STRSBinds1 = STRSBinds1 + 1 play_sound(Next_Page, CameraObject) elseif STRSBinds1 > 1 then STRSBinds1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRSBinds1 > 1 then STRSBinds1 = STRSBinds1 - 1 play_sound(Next_Page, CameraObject) elseif STRSBinds1 < 17 then STRSBinds1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRSBinds2 < 17 then STRSBinds2 = STRSBinds2 + 1 play_sound(Next_Page, CameraObject) elseif STRSBinds2 > 1 then STRSBinds2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRSBinds2 > 1 then STRSBinds2 = STRSBinds2 - 1 play_sound(Next_Page, CameraObject) elseif STRSBinds2 < 17 then STRSBinds2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRSBinds3 < 17 then STRSBinds3 = STRSBinds3 + 1 play_sound(Next_Page, CameraObject) elseif STRSBinds3 > 1 then STRSBinds3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRSBinds3 > 1 then STRSBinds3 = STRSBinds3 - 1 play_sound(Next_Page, CameraObject) elseif STRSBinds3 < 17 then STRSBinds3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRSBinds1 = math.random(17) STRSBinds2 = math.random(17) STRSBinds3 = math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRSingleBindsFS == false then
Save_Storage("STRSingleBinds1", tostring(STRSBinds1)) Save_Storage("STRSingleBinds2", tostring(STRSBinds2)) Save_Storage("STRSingleBinds3", tostring(STRSBinds3)) play_sound(Star_Appear, CameraObject)
end
if AButton and STRSingleBindsFS == true then play_sound(Camera_Buzz, CameraObject) 
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
end

if STRMenuTitleName == "MDConfig" and MenuButtonsDeplay == 0 then
if network_is_server() then
if XButton then STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Reverse_Pause, CameraObject) end
end
if (MDGRightStick or DpadRight) then 
if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuLROption == 1 then STRMenuTitleName = "MDInfo" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuLROption == 2 then STRMenuTitleName = "MDHTP" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuLROption == 3 then STRMenuTitleName = "MDCSettings" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if BButton then STRMenuDisplay = false play_sound(Hand_Disappear, CameraObject) end
if RTrigger then MenuButtonsDeplay = 100 djui_open_pause_menu() end
end

if STRMenuTitleName == "MDInfo" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuPageLRDisplay < 5 then MenuPageLRDisplay = MenuPageLRDisplay + 1 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay > 2 then MenuPageLRDisplay = 1 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuPageLRDisplay > 1 then MenuPageLRDisplay = MenuPageLRDisplay - 1 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay < 2 then MenuPageLRDisplay = 5 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and MenuPageLRDisplay == 4 then 
if MenuPageUDDisplay > 1 then MenuPageUDDisplay = MenuPageUDDisplay - 1 play_sound(Next_Page, CameraObject) elseif MenuPageUDDisplay < 3 then MenuPageUDDisplay = MenuPageUDDisplay + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 4 then 
if MenuPageUDDisplay < 3 then MenuPageUDDisplay = MenuPageUDDisplay + 1 play_sound(Next_Page, CameraObject) elseif MenuPageUDDisplay > 1 then MenuPageUDDisplay = MenuPageUDDisplay - 2 play_sound(Next_Page, CameraObject) end
end

if BButton then STRMenuTitleName = "MDConfig" MenuLROption = 1 MenuUDOption = 1 MenuPageLRDisplay = 1 play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDHTP" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuPageLRDisplay < 4 then MenuPageLRDisplay = MenuPageLRDisplay + 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay > 2 then MenuPageLRDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuPageLRDisplay > 1 then MenuPageLRDisplay = MenuPageLRDisplay - 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay < 2 then MenuPageLRDisplay = 4 play_sound(Next_Page, CameraObject) end
end

if BButton then STRMenuTitleName = "MDConfig" MenuLROption = 2 MenuUDOption = 1 MenuPageLRDisplay = 1 play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDCSettings" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if RTrigger then 
if MenuPageLRDisplay < 4 then MenuPageLRDisplay = MenuPageLRDisplay + 1 MenuUDOption = 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay > 2 then MenuPageLRDisplay = 1 MenuUDOption = 1 play_sound(Next_Page, CameraObject) end
end

if LTrigger then 
if MenuPageLRDisplay > 1 then MenuPageLRDisplay = MenuPageLRDisplay - 1 MenuUDOption = 1 play_sound(Next_Page, CameraObject) 
elseif MenuPageLRDisplay < 2 then MenuPageLRDisplay = 4 MenuUDOption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and (MenuPageLRDisplay == 1 or MenuPageLRDisplay == 2) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 3 then MenuUDOption = MenuUDOption + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and (MenuPageLRDisplay == 1 or MenuPageLRDisplay == 2) then 
if MenuUDOption < 3 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 2 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and MenuPageLRDisplay == 3 then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 4 then MenuUDOption = MenuUDOption + 3 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 3 then 
if MenuUDOption < 4 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 3 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 4 MenuPageUDDisplay = 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 5 MenuPageUDDisplay = 2 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 4 then MenuUDOption = MenuUDOption + 4 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if MenuUDOption < 4 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 3 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if MenuPageLRDisplay == 1 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRFontTMNumber < #STRFontsTable then STRFontTMNumber = STRFontTMNumber + 1 play_sound(Next_Page, CameraObject) elseif STRFontTMNumber > 2 then STRFontTMNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRFontTMNumber > 1 then STRFontTMNumber = STRFontTMNumber - 1 play_sound(Next_Page, CameraObject) elseif STRFontTMNumber < 2 then STRFontTMNumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRFontCDNumber < #STRFontsTable then STRFontCDNumber = STRFontCDNumber + 1 play_sound(Next_Page, CameraObject) elseif STRFontCDNumber > 2 then STRFontCDNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRFontCDNumber > 1 then STRFontCDNumber = STRFontCDNumber - 1 play_sound(Next_Page, CameraObject) elseif STRFontCDNumber < 2 then STRFontCDNumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRFontGONumber < #STRFontsTable then STRFontGONumber = STRFontGONumber + 1 play_sound(Next_Page, CameraObject) elseif STRFontGONumber > 2 then STRFontGONumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRFontGONumber > 1 then STRFontGONumber = STRFontGONumber - 1 play_sound(Next_Page, CameraObject) elseif STRFontGONumber < 2 then STRFontGONumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if YButton then STRFontTMNumber = math.random(#STRFontsTable) STRFontCDNumber = math.random(#STRFontsTable) STRFontGONumber = math.random(#STRFontsTable) play_sound(castle_warp2, CameraObject) end
if AButton and MenuUDOption == 1 then Save_Storage("STRFontTM", STRFontsTable[STRFontTMNumber].str_font_id) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then Save_Storage("STRFontCD", STRFontsTable[STRFontCDNumber].str_font_id) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then Save_Storage("STRFontGO", STRFontsTable[STRFontGONumber].str_font_id) play_sound(Star_Appear, CameraObject) end
end

if MenuPageLRDisplay == 2 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 and #STRFanfareTable ~= 1 then 
if STRFanfareNumber < #STRFanfareTable then STRFanfareNumber = STRFanfareNumber + 1 play_sound(Next_Page, CameraObject) elseif STRFanfareNumber > 2 then STRFanfareNumber = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and MenuUDOption == 1 and #STRFanfareTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 and #STRFanfareTable ~= 1 then 
if STRFanfareNumber > 1 then STRFanfareNumber = STRFanfareNumber - 1 play_sound(Next_Page, CameraObject) elseif STRFanfareNumber < 2 then STRFanfareNumber = #STRFanfareTable play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and MenuUDOption == 1 and #STRFanfareTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRCountdownNumber < #STRCountdownTable then STRCountdownNumber = STRCountdownNumber + 1 play_sound(Next_Page, CameraObject) elseif STRCountdownNumber > 2 then STRCountdownNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRCountdownNumber > 1 then STRCountdownNumber = STRCountdownNumber - 1 play_sound(Next_Page, CameraObject) elseif STRCountdownNumber < 2 then STRCountdownNumber = #STRCountdownTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 and #STRGoTable ~= 1 then 
if STRGoNumber < #STRGoTable then STRGoNumber = STRGoNumber + 1 play_sound(Next_Page, CameraObject) elseif STRGoNumber > 2 then STRGoNumber = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and MenuUDOption == 3 and #STRGoTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 and #STRGoTable ~= 1 then 
if STRGoNumber > 1 then STRGoNumber = STRGoNumber - 1 play_sound(Next_Page, CameraObject) elseif STRGoNumber < 2 then STRGoNumber = #STRGoTable play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and MenuUDOption == 3 and #STRGoTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if XButton and MenuUDOption == 1 then 
if STRFanfareNumber == 1 then
play_race_fanfare()
elseif STRFanfareNumber ~= 1 then
STRPlaySound = true
end
end
if XButton and MenuUDOption == 2 then
if STRCountdownNumber < 6 then
play_sound(STRCountdownTable[STRCountdownNumber].str_countdown_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
elseif STRCountdownNumber > 5 then
STRPlaySound = true
end 
end
if XButton and MenuUDOption == 3 then 
if STRGoNumber == 1 then
play_sound(STRGoTable[STRGoNumber].str_go_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
elseif STRGoNumber ~= 1 then
STRPlaySound = true
end 
end

if YButton then STRFanfareNumber = math.random(#STRFanfareTable) STRCountdownNumber = math.random(#STRCountdownTable) STRGoNumber = math.random(#STRGoTable) play_sound(castle_warp2, CameraObject) end
if AButton and MenuUDOption == 1 then Save_Storage("STRFanfare", STRFanfareTable[STRFanfareNumber].str_fanfare_id) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then Save_Storage("STRCountdown", STRCountdownTable[STRCountdownNumber].str_countdown_id) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then Save_Storage("STRGo", STRGoTable[STRGoNumber].str_go_id) play_sound(Star_Appear, CameraObject) end
end
if ZTrigger then MenuSelectedOption = "EraseSettings" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) end
if BButton then STRMenuTitleName = "MDConfig" MenuLROption = 3 MenuUDOption = 1 MenuPageLRDisplay = 1 MenuPageUDDisplay = 1 play_sound(Disappear_Message, CameraObject) end

if MenuPageLRDisplay == 3 then
if AButton and MenuUDOption == 1 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "FontColors" end
if AButton and MenuUDOption == 2 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "RectColors" end
if AButton and MenuUDOption == 3 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "MenuColors" end
if AButton and MenuUDOption == 4 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "FontPosition" end
end
if MenuPageLRDisplay == 4 then 
if YButton and STRMenuWarpType ~= "None" then STRMenuWarp = true play_sound(castle_warp, CameraObject)
elseif YButton and STRMenuWarpType == "None" then play_sound(Camera_Buzz, CameraObject) end
end

if MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
if AButton and MenuUDOption == 1 then 
if STRCustomColors == "Enabled" then STRCustomColors = "Disabled" elseif STRCustomColors == "Disabled" then STRCustomColors = "Enabled" end
Save_Storage("STRCColors", tostring(STRCustomColors)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then 
if STRRenderType == "Behind" then STRRenderType = "Front" elseif STRRenderType == "Front" then STRRenderType = "Behind" end
Save_Storage("STRRType", tostring(STRRenderType)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then 
if STRHelper == "Enabled" then STRHelper = "Disabled" elseif STRHelper == "Disabled" then STRHelper = "Enabled" end
Save_Storage("STRHelperDisplay", tostring(STRHelper)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 4 then 
if STRMenuButtons == "Buttons" then STRMenuButtons = "Commands" elseif STRMenuButtons == "Commands" then STRMenuButtons = "Both" elseif STRMenuButtons == "Both" then STRMenuButtons = "Buttons" end
Save_Storage("STRMButtons", tostring(STRMenuButtons)) play_sound(Star_Appear, CameraObject) end
if XButton and MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both") then 
MenuSelectedOption = "MenuBinds" play_sound(Read_Sign, CameraObject) end
if AButton and MenuUDOption == 5 then 
if STRRules == "Enabled" then STRRules = "Disabled" elseif STRRules == "Disabled" then STRRules = "Enabled" end
Save_Storage("STRRulesDisplay", tostring(STRRules)) play_sound(Star_Appear, CameraObject) end
if XButton and MenuUDOption == 5 and STRRules == "Enabled" then 
MenuSelectedOption = "RulesBinds" play_sound(Read_Sign, CameraObject) end
end

if MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if AButton and MenuUDOption == 1 then 
if STRRDisplay == "Start" then STRRDisplay = "SS_Lobby" elseif STRRDisplay == "SS_Lobby" then STRRDisplay = "SS_Start" elseif STRRDisplay == "SS_Start" then STRRDisplay = "None" 
elseif STRRDisplay == "None" then STRRDisplay = "Lobby" elseif STRRDisplay == "Lobby" then STRRDisplay = "Start" end
Save_Storage("STRRequireDisplay", tostring(STRRDisplay)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then 
if STRMenuWarpType == "Level" then STRMenuWarpType = "Start" elseif STRMenuWarpType == "Start" then STRMenuWarpType = "None"
elseif STRMenuWarpType == "None" then STRMenuWarpType = "Level" end Save_Storage("STRMenuWType", tostring(STRMenuWarpType)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "BestTime" end
if AButton and MenuUDOption == 4 then play_sound(Appear_Message, CameraObject) MenuButtonsDeplay = 10 MenuUDOption = 1 STRMenuTitleName = "MDConfigVH" end
end
end
if MenuSelectedOption == "FontColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRFR < 255 then STRFR = STRFR + 1 play_sound(Next_Page, CameraObject) elseif STRFR > 0 then STRFR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRFR > 0 then STRFR = STRFR - 1 play_sound(Next_Page, CameraObject) elseif STRFR < 255 then STRFR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRFG < 255 then STRFG = STRFG + 1 play_sound(Next_Page, CameraObject) elseif STRFG > 0 then STRFG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRFG > 0 then STRFG = STRFG - 1 play_sound(Next_Page, CameraObject) elseif STRFG < 255 then STRFG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRFB < 255 then STRFB = STRFB + 1 play_sound(Next_Page, CameraObject) elseif STRFB > 0 then STRFB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRFB > 0 then STRFB = STRFB - 1 play_sound(Next_Page, CameraObject) elseif STRFB < 255 then STRFB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRFV < 255 then STRFV = STRFV + 1 play_sound(Next_Page, CameraObject) elseif STRFV > 0 then STRFV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRFV > 0 then STRFV = STRFV - 1 play_sound(Next_Page, CameraObject) elseif STRFV < 255 then STRFV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRFR = math.random(255) STRFG = math.random(255) STRFB = math.random(255) STRFV = math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton and MenuLROption == 1 then Save_Storage("STRFRed", tostring(STRFR)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 2 then Save_Storage("STRFGreen", tostring(STRFG)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 3 then Save_Storage("STRFBlue", tostring(STRFB)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 4 then Save_Storage("STRFVisible", tostring(STRFV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "RectColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRRR < 255 then STRRR = STRRR + 1 play_sound(Next_Page, CameraObject) elseif STRRR > 0 then STRRR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRRR > 0 then STRRR = STRRR - 1 play_sound(Next_Page, CameraObject) elseif STRRR < 255 then STRRR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRRG < 255 then STRRG = STRRG + 1 play_sound(Next_Page, CameraObject) elseif STRRG > 0 then STRRG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRRG > 0 then STRRG = STRRG - 1 play_sound(Next_Page, CameraObject) elseif STRRG < 255 then STRRG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRRB < 255 then STRRB = STRRB + 1 play_sound(Next_Page, CameraObject) elseif STRRB > 0 then STRRB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRRB > 0 then STRRB = STRRB - 1 play_sound(Next_Page, CameraObject) elseif STRRB < 255 then STRRB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRRV < 255 then STRRV = STRRV + 1 play_sound(Next_Page, CameraObject) elseif STRRV > 0 then STRRV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRRV > 0 then STRRV = STRRV - 1 play_sound(Next_Page, CameraObject) elseif STRRV < 255 then STRRV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRRR = math.random(255) STRRG = math.random(255) STRRB = math.random(255) STRRV = math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton and MenuLROption == 1 then Save_Storage("STRRRed", tostring(STRRR)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 2 then Save_Storage("STRRGreen", tostring(STRRG)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 3 then Save_Storage("STRRBlue", tostring(STRRB)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 4 then Save_Storage("STRRVisible", tostring(STRRV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "MenuColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRMenuR < 255 then STRMenuR = STRMenuR + 1 play_sound(Next_Page, CameraObject) elseif STRMenuR > 0 then STRMenuR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRMenuR > 0 then STRMenuR = STRMenuR - 1 play_sound(Next_Page, CameraObject) elseif STRMenuR < 255 then STRMenuR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRMenuG < 255 then STRMenuG = STRMenuG + 1 play_sound(Next_Page, CameraObject) elseif STRMenuG > 0 then STRMenuG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRMenuG > 0 then STRMenuG = STRMenuG - 1 play_sound(Next_Page, CameraObject) elseif STRMenuG < 255 then STRMenuG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRMenuB < 255 then STRMenuB = STRMenuB + 1 play_sound(Next_Page, CameraObject) elseif STRMenuB > 0 then STRMenuB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRMenuB > 0 then STRMenuB = STRMenuB - 1 play_sound(Next_Page, CameraObject) elseif STRMenuB < 255 then STRMenuB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRMenuV < 255 then STRMenuV = STRMenuV + 1 play_sound(Next_Page, CameraObject) elseif STRMenuV > 0 then STRMenuV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRMenuV > 0 then STRMenuV = STRMenuV - 1 play_sound(Next_Page, CameraObject) elseif STRMenuV < 255 then STRMenuV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRMenuR = math.random(255) STRMenuG = math.random(255) STRMenuB = math.random(255) STRMenuV = math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton and MenuLROption == 1 then Save_Storage("STRMenuRed", tostring(STRMenuR)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 2 then Save_Storage("STRMenuGreen", tostring(STRMenuG)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 3 then Save_Storage("STRMenuBlue", tostring(STRMenuB)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 4 then Save_Storage("STRMenuVisible", tostring(STRMenuV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "FontPosition" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 1 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if CXPos < 255 then CXPos = CXPos + 1 play_sound(Next_Page, CameraObject) elseif CXPos > -255 then CXPos = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if CXPos > -255 then CXPos = CXPos - 1 play_sound(Next_Page, CameraObject) elseif CXPos < 255 then CXPos = 0 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if CYPos < 100 then CYPos = CYPos + 1 play_sound(Next_Page, CameraObject) elseif CYPos > -255 then CYPos = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if CYPos > -255 then CYPos = CYPos - 1 play_sound(Next_Page, CameraObject) elseif CYPos < 100 then CYPos = 0 play_sound(Next_Page, CameraObject) end end

if YButton then CXPos = math.random(255) - 255 CYPos = math.random(255) - 255 play_sound(castle_warp2, CameraObject) end
if AButton and MenuLROption == 1 then Save_Storage("STRXPos", tostring(CXPos)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuLROption == 2 then Save_Storage("STRYPos", tostring(CYPos)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "MenuBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRMBinds1 < 17 then STRMBinds1 = STRMBinds1 + 1 play_sound(Next_Page, CameraObject) elseif STRMBinds1 > 1 then STRMBinds1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRMBinds1 > 1 then STRMBinds1 = STRMBinds1 - 1 play_sound(Next_Page, CameraObject) elseif STRMBinds1 < 17 then STRMBinds1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRMBinds2 < 17 then STRMBinds2 = STRMBinds2 + 1 play_sound(Next_Page, CameraObject) elseif STRMBinds2 > 1 then STRMBinds2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRMBinds2 > 1 then STRMBinds2 = STRMBinds2 - 1 play_sound(Next_Page, CameraObject) elseif STRMBinds2 < 17 then STRMBinds2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRMBinds3 < 17 then STRMBinds3 = STRMBinds3 + 1 play_sound(Next_Page, CameraObject) elseif STRMBinds3 > 1 then STRMBinds3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRMBinds3 > 1 then STRMBinds3 = STRMBinds3 - 1 play_sound(Next_Page, CameraObject) elseif STRMBinds3 < 17 then STRMBinds3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRMBinds1 = math.random(17) STRMBinds2 = math.random(17) STRMBinds3 = math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRMenuBindsFS == false then
Save_Storage("STRMenuBinds1", tostring(STRMBinds1)) Save_Storage("STRMenuBinds2", tostring(STRMBinds2)) Save_Storage("STRMenuBinds3", tostring(STRMBinds3)) play_sound(Star_Appear, CameraObject)
end
if AButton and STRMenuBindsFS == true then play_sound(Camera_Buzz, CameraObject) 
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "RulesBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRRBinds1 < 17 then STRRBinds1 = STRRBinds1 + 1 play_sound(Next_Page, CameraObject) elseif STRRBinds1 > 1 then STRRBinds1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRRBinds1 > 1 then STRRBinds1 = STRRBinds1 - 1 play_sound(Next_Page, CameraObject) elseif STRRBinds1 < 17 then STRRBinds1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRRBinds2 < 17 then STRRBinds2 = STRRBinds2 + 1 play_sound(Next_Page, CameraObject) elseif STRRBinds2 > 1 then STRRBinds2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRRBinds2 > 1 then STRRBinds2 = STRRBinds2 - 1 play_sound(Next_Page, CameraObject) elseif STRRBinds2 < 17 then STRRBinds2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRRBinds3 < 17 then STRRBinds3 = STRRBinds3 + 1 play_sound(Next_Page, CameraObject) elseif STRRBinds3 > 1 then STRRBinds3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRRBinds3 > 1 then STRRBinds3 = STRRBinds3 - 1 play_sound(Next_Page, CameraObject) elseif STRRBinds3 < 17 then STRRBinds3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRRBinds1 = math.random(17) STRRBinds2 = math.random(17) STRRBinds3 = math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRRulesBindsFS == false then
Save_Storage("STRRulesBinds1", tostring(STRRBinds1)) Save_Storage("STRRulesBinds2", tostring(STRRBinds2)) Save_Storage("STRRulesBinds3", tostring(STRRBinds3)) play_sound(Star_Appear, CameraObject)
end
if AButton and STRRulesBindsFS == true then play_sound(Camera_Buzz, CameraObject) 
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "EraseSettings" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject) 
if MenuPageLRDisplay == 1 then
STRFontsTable[STRFontTMNumber].str_font_id = "Normal" STRFontsTable[STRFontCDNumber].str_font_id = "Normal" STRFontsTable[STRFontGONumber].str_font_id = "Normal"
Save_Storage("STRFontTM", STRFontsTable[STRFontTMNumber].str_font_id)
Save_Storage("STRFontCD", STRFontsTable[STRFontCDNumber].str_font_id)
Save_Storage("STRFontGO", STRFontsTable[STRFontGONumber].str_font_id)
elseif MenuPageLRDisplay == 2 then
STRFanfareTable[STRFanfareNumber].str_fanfare_id = "RaceFanfare" STRCountdownTable[STRCountdownNumber].str_countdown_id = "ChangeSelect" STRGoTable[STRGoNumber].str_go_id = "GunShot"
Save_Storage("STRFanfare", STRFanfareTable[STRFanfareNumber].str_fanfare_id)
Save_Storage("STRCountdown", STRCountdownTable[STRCountdownNumber].str_countdown_id)
Save_Storage("STRGo", STRGoTable[STRGoNumber].str_go_id)
elseif MenuPageLRDisplay == 3 then
STRFR, STRFB, STRFG, STRFV = 255, 255, 255, 255 STRRR, STRRB, STRRG, STRRV = 0, 0, 0, 128 STRMenuR, STRMenuB, STRMenuG, STRMenuV = 0, 0, 0, 128 CXPos, CYPos = 0, 0
Save_Storage("STRFRed", tostring(STRFR))
Save_Storage("STRFBlue", tostring(STRFB))
Save_Storage("STRFGreen", tostring(STRFG))
Save_Storage("STRFVisible", tostring(STRFV))
Save_Storage("STRRRed", tostring(STRRR))
Save_Storage("STRRBlue", tostring(STRRB))
Save_Storage("STRRGreen", tostring(STRRG))
Save_Storage("STRRVisible", tostring(STRRV))
Save_Storage("STRMenuRed", tostring(STRMenuR))
Save_Storage("STRMenuBlue", tostring(STRMenuB))
Save_Storage("STRMenuGreen", tostring(STRMenuG))
Save_Storage("STRMenuVisible", tostring(STRMenuV))
Save_Storage("STRXPos", tostring(CXPos))
Save_Storage("STRYPos", tostring(CYPos))
elseif MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
STRCustomColors = "Enabled" STRRenderType = "Behind" STRHelper = "Enabled" STRMenuButtons = "Both" STRRules = "Enabled"
STRMBinds1, STRMBinds2, STRMBinds3, STRRBinds1, STRRBinds2, STRRBinds3 = 6, 7, 10, 6, 7, 11
Save_Storage("STRCColors", tostring(STRCustomColors))
Save_Storage("STRRType", tostring(STRRenderType)) 
Save_Storage("STRHelperDisplay", tostring(STRHelper))
Save_Storage("STRMButtons", tostring(STRMenuButtons)) 
Save_Storage("STRRulesDisplay", tostring(STRRules)) 
Save_Storage("STRMenuBinds1", tostring(STRMBinds1))
Save_Storage("STRMenuBinds2", tostring(STRMBinds2)) 
Save_Storage("STRMenuBinds3", tostring(STRMBinds3)) 
Save_Storage("STRRulesBinds1", tostring(STRRBinds1))
Save_Storage("STRRulesBinds2", tostring(STRRBinds2)) 
Save_Storage("STRRulesBinds3", tostring(STRRBinds3))
elseif MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
STRRDisplay = "Start" STRMenuWarpType = "Start" STRBestTimeOption = "Saves"
Save_Storage("STRRequireDisplay", tostring(STRRDisplay))
Save_Storage("STRMenuWType", tostring(STRMenuWarpType))
Save_Storage("STRBestTimeType", tostring(STRBestTimeOption))
end
end

if BButton then MenuSelectedOption = "Main" play_sound(File_Select, CameraObject) end
end

if MenuSelectedOption == "BestTime" and MenuButtonsDeplay == 0 then
if (STRBestTimeNumber > 6479999) then STRBestTimeNumber = 0 elseif (STRBestTimeNumber < -0) then STRBestTimeNumber = 6479999 end

if (MDGUpStick or DpadUp) and STRBestTimeOption == "Enabled" then 
if STRBestTimeNumber < 6479999 then STRBestTimeNumber = STRBestTimeNumber + STRBTNLimit play_sound(Next_Page, CameraObject) 
elseif STRBestTimeNumber > 2 then STRBestTimeNumber = STRBestTimeNumber - 6479999 play_sound(Next_Page, CameraObject) end
elseif (MDGUpStick or DpadUp) and STRBestTimeOption ~= "Enabled" then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGDownStick or DpadDown) and STRBestTimeOption == "Enabled" then 
if STRBestTimeNumber > 0 then STRBestTimeNumber = STRBestTimeNumber - STRBTNLimit play_sound(Next_Page, CameraObject)
elseif STRBestTimeNumber < 2 then STRBestTimeNumber = STRBestTimeNumber + 6479999 play_sound(Next_Page, CameraObject) end
elseif (MDGDownStick or DpadDown) and STRBestTimeOption ~= "Enabled" then play_sound(Camera_Buzz, CameraObject) 
end

if RTrigger and STRBestTimeOption == "Enabled" then play_sound(Next_Page, CameraObject) 
if STRBTNLimit == 1 then STRBTNLimit = 30 elseif STRBTNLimit == 30 then STRBTNLimit = 1800 elseif STRBTNLimit == 1800 then STRBTNLimit = 108000 elseif STRBTNLimit == 108000 then STRBTNLimit = 1 end
end

if LTrigger and STRBestTimeOption == "Enabled" then play_sound(Next_Page, CameraObject) 
if STRBTNLimit == 1 then STRBTNLimit = 108000 elseif STRBTNLimit == 108000 then STRBTNLimit = 1800 elseif STRBTNLimit == 1800 then STRBTNLimit = 30 elseif STRBTNLimit == 30 then STRBTNLimit = 1 end
end

if (LTrigger or RTrigger) and STRBestTimeOption ~= "Enabled" then play_sound(Camera_Buzz, CameraObject) end 

if AButton then 
if STRBestTimeOption == "Disabled" then STRBestTimeOption = "Enabled" elseif STRBestTimeOption == "Enabled" then STRBestTimeOption = "Saves" STRBestTimeNumber = 0 
elseif STRBestTimeOption == "Saves" then STRBestTimeOption = "Disabled" end Save_Storage("STRBestTimeType", tostring(STRBestTimeOption)) play_sound(Star_Appear, CameraObject) end

if YButton and STRBestTimeOption == "Enabled" then STRBestTimeNumber = math.random(6479999) play_sound(castle_warp2, CameraObject) 
elseif YButton and STRBestTimeOption ~= "Enabled" then play_sound(Camera_Buzz, CameraObject) end

if XButton and STRBestTimeOption ~= "Disabled" then STRBestTimeNumber = 0 play_sound(Next_Page, CameraObject) 
elseif XButton and STRBestTimeOption == "Disabled" then play_sound(Camera_Buzz, CameraObject) end

if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

end
if STRMenuTitleName == "MDConfigVH" and MenuButtonsDeplay == 0 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 3 then MenuUDOption = MenuUDOption + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 3 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuUDOption == 1 then STRMenuTitleName = "MDSettings" MenuLROption = 0 MenuUDOption = 0 MenuViewHostCheck = true play_sound(Appear_Message, CameraObject) end
if AButton and MenuUDOption == 2 then STRMenuTitleName = "MDServer" MenuLROption = 0 MenuUDOption = 0 MenuViewHostCheck = true play_sound(Appear_Message, CameraObject) end
if AButton and MenuUDOption == 3 then STRMenuTitleName = "MDLobby" MenuLROption = 0 MenuUDOption = 0 MenuViewHostCheck = true play_sound(Appear_Message, CameraObject) end

if BButton then STRMenuTitleName = "MDCSettings" MenuLROption = 1 MenuUDOption = 4 MenuPageLRDisplay = 4 MenuPageUDDisplay = 2 play_sound(Disappear_Message, CameraObject) end
end
end
end