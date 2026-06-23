
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
MGRSize = 10000
MGRW = 5 * MGRSize
MGRH = 3 * MGRSize
MGRX = (S_Width() - MGRW) / 2.0
MGRY = (S_Height() - MGRH) / 2.0
render_rect(MGRX, MGRY, MGRW, MGRH, STRMenuColors.STRMR, STRMenuColors.STRMG, STRMenuColors.STRMB, STRMenuColors.STRMV)

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
CSMenu = "" if charSelectExists then CSMenu = " | (Z) CS Menu" end
if network_is_server() and STRMenuTitleName == "MDMain" then SDJM = "(X) Config Menu | (R) DJUI Menu" .. CSMenu
elseif network_is_server() and STRMenuTitleName == "MDConfig" then SDJM = "(X) Main Menu | (R) DJUI Menu" .. CSMenu 
else SDJM = "(R) DJUI Menu" .. CSMenu end
local SDJMX = (S_Width() - Hud_Measure(SDJM) * 0.35) / 2.0
shadow_text(SDJM, SDJMX, MDGY - 70, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255) 

local STRVersion = "Speedrun Timer Reworked V2.2" local STRVX = (S_Width() - Hud_Measure(STRVersion) * 0.25) / 2.0
shadow_text(STRVersion, STRVX, MDGY - 85, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255) 
end

if STRMenuTitleName == "MDMain" then
if STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 and STRGST.STRGameMode ~= 4 then StartText = "Start" elseif STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then StartText = "Pause"
elseif STRGST.STRGameState == "Paused" and STRGST.STRGameMode ~= 4 then StartText = "Continue" elseif STRGST.STRGameMode == 4 then StartText = "Stars" 
elseif (STRGST.STRGameState == "Finished" or (STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby")) then StartText = "Finish" elseif STRGST.STRGameState == "Preparing" then StartText = "Wait" end
if STRGST.SwitchIntro == true then IntroText = "Enabled " else IntroText = "Disabled" end
CSMY = 0 if charSelectExists and not charSelect.are_movesets_restricted() then CSMY = -15 end
local IntroMenuFunc = MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameMode == 1 and STRGST.VanillaCG == true and STRGST.STRGameState == "Lobby"

local GSWidth = Hud_Measure(StartText) * MDGSize local GSX = (S_Width() - GSWidth) / 2.0
menu_shadow_text(StartText, GSX - 94, MDGY - 30 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 1 and MenuUDOption == 1)
hide_shadow_text("(Y) Intro:", MDGX - 117, MDGY - 35 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, IntroMenuFunc)
hide_shadow_text(IntroText, MDGX - 89, MDGY - 35 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, IntroMenuFunc)
menu_shadow_text("Restart", MDGX - 32, MDGY - 30 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 2 and MenuUDOption == 1)
hide_shadow_text("(Y) Stop Timer", MDGX - 23, MDGY - 35 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGameMode == 3 and STRGST.CasualGM == "Enabled")
menu_shadow_text("Savefile", MDGX + 63, MDGY - 40 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 3 and MenuUDOption == 1)
menu_shadow_text("Settings", MDGX + 61, MDGY - 20 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 3 and MenuUDOption == 1)
menu_shadow_text("Settings", MDGX - 125, MDGY + 20 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 1 and MenuUDOption == 2)
menu_shadow_text("Server", MDGX - 27, MDGY + 10 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 2 and MenuUDOption == 2)
menu_shadow_text("Settings", MDGX - 35, MDGY + 30 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 2 and MenuUDOption == 2)
menu_shadow_text("Runs Config", MDGX + 52, MDGY + 20 + CSMY, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 3 and MenuUDOption == 2)

if (STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby") or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes == 0 and STRGST.STRPluginsCheck == false) or STRGST.STRGameState == "Preparing" 
or STRGST.STRGameState == "Finished" or STRGST.InteractionCheck == true then
menu_shadow_text(StartText, GSX - 94, MDGY - 30 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 1 and MenuUDOption == 1)
end

if (STRGST.STRGlobalTimer == 0 and STRGST.STRGameState == "Lobby") or STRGST.STRGameState == "Preparing" then
menu_shadow_text("Restart", MDGX - 32, MDGY - 30 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 2 and MenuUDOption == 1)
end

if STRGST.STRGameState ~= "Lobby" then
menu_shadow_text("Settings", MDGX - 125, MDGY + 20 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 1 and MenuUDOption == 2)
menu_shadow_text("Savefile", MDGX + 63, MDGY - 40 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 3 and MenuUDOption == 1)
menu_shadow_text("Settings", MDGX + 61, MDGY - 20 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 3 and MenuUDOption == 1)
end

if STRGST.STRGameMode == 4 then
menu_shadow_text("Restart", MDGX - 32, MDGY - 30 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 2 and MenuUDOption == 1)
menu_shadow_text("Runs Config", MDGX + 52, MDGY + 20 + CSMY, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuLROption == 3 and MenuUDOption == 2)
end

local CSMessage = "- For Character Select Users -" local CSMX = (S_Width() - Hud_Measure(CSMessage) * 0.25) / 2.0
hide_shadow_text(CSMessage, CSMX, MDGY + 55 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, charSelectExists and not charSelect.are_movesets_restricted())
local CSRMessage = 'Turn on "Restrict Moveset" in the CS Options, for your Run to be Vaild' local CSRMX = (S_Width() - Hud_Measure(CSRMessage) * 0.25) / 2.0
hide_shadow_text(CSRMessage, CSRMX, MDGY + 65 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, charSelectExists and not charSelect.are_movesets_restricted())
local CSR2Message = "The Moveset is Only Allowed to be used for Fun" local CSRMX = (S_Width() - Hud_Measure(CSR2Message) * 0.25) / 2.0
hide_shadow_text(CSR2Message, CSRMX, MDGY + 75 + CSMY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, charSelectExists and not charSelect.are_movesets_restricted())
end
if STRMenuTitleName == "MDSave" then
if STRGST.SFSMipsStar1 == true then MS1R, MS1G, MS1B = 0, 180, 0 MS1R2, MS1G2, MS1B2 = 0, 255, 0 else MS1R, MS1G, MS1B = 180, 0, 0 MS1R2, MS1G2, MS1B2 = 255, 0, 0 end
if STRGST.SFSMipsStar2 == true then MS2R, MS2G, MS2B = 0, 180, 0 MS2R2, MS2G2, MS2B2 = 0, 255, 0 else MS2R, MS2G, MS2B = 180, 0, 0 MS2R2, MS2G2, MS2B2 = 255, 0, 0 end
if STRGST.SFSToadStar1 == true then TS1R, TS1G, TS1B = 0, 180, 0 TS1R2, TS1G2, TS1B2 = 0, 255, 0 else TS1R, TS1G, TS1B = 180, 0, 0 TS1R2, TS1G2, TS1B2 = 255, 0, 0 end
if STRGST.SFSToadStar2 == true then TS2R, TS2G, TS2B = 0, 180, 0 TS2R2, TS2G2, TS2B2 = 0, 255, 0 else TS2R, TS2G, TS2B = 180, 0, 0 TS2R2, TS2G2, TS2B2 = 255, 0, 0 end
if STRGST.SFSToadStar3 == true then TS3R, TS3G, TS3B = 0, 180, 0 TS3R2, TS3G2, TS3B2 = 0, 255, 0 else TS3R, TS3G, TS3B = 180, 0, 0 TS3R2, TS3G2, TS3B2 = 255, 0, 0 end
if STRGST.SFSWingCap == true then WCR, WCG, WCB = 0, 180, 0 WCR2, WCG2, WCB2 = 0, 255, 0 else WCR, WCG, WCB = 180, 0, 0 WCR2, WCG2, WCB2 = 255, 0, 0 end
if STRGST.SFSMetalCap == true then MCR, MCG, MCB = 0, 180, 0 MCR2, MCG2, MCB2 = 0, 255, 0 else MCR, MCG, MCB = 180, 0, 0 MCR2, MCG2, MCB2 = 255, 0, 0 end
if STRGST.SFSVanishCap == true then VCR, VCG, VCB = 0, 180, 0 VCR2, VCG2, VCB2 = 0, 255, 0 else VCR, VCG, VCB = 180, 0, 0 VCR2, VCG2, VCB2 = 255, 0, 0 end
if STRGST.SFS50StarDoor == true then D50R, D50G, D50B = 0, 180, 0 D50R2, D50G2, D50B2 = 0, 255, 0 else D50R, D50G, D50B = 180, 0, 0 D50R2, D50G2, D50B2 = 255, 0, 0 end
if STRGST.SFSBasementDoor == true then BMDR, BMDG, BMDB = 0, 180, 0 BMDR2, BMDG2, BMDB2 = 0, 255, 0 else BMDR, BMDG, BMDB = 180, 0, 0 BMDR2, BMDG2, BMDB2 = 255, 0, 0 end
if STRGST.SFSUpstairsDoor == true then USDR, USDG, USDB = 0, 180, 0 USDR2, USDG2, USDB2 = 0, 255, 0 else USDR, USDG, USDB = 180, 0, 0 USDR2, USDG2, USDB2 = 255, 0, 0 end
if STRGST.SFSBITDWDoor == true then BDWR, BDWG, BDWB = 0, 180, 0 BDWR2, BDWG2, BDWB2 = 0, 255, 0 else BDWR, BDWG, BDWB = 180, 0, 0 BDWR2, BDWG2, BDWB2 = 255, 0, 0 end
if STRGST.SFSBITFSDoor == true then BFSR, BFSG, BFSB = 0, 180, 0 BFSR2, BFSG2, BFSB2 = 0, 255, 0 else BFSR, BFSG, BFSB = 180, 0, 0 BFSR2, BFSG2, BFSB2 = 255, 0, 0 end
if STRGST.SFSWFDoor == true then WFR, WFG, WFB = 0, 180, 0 WFR2, WFG2, WFB2 = 0, 255, 0 else WFR, WFG, WFB = 180, 0, 0 WFR2, WFG2, WFB2 = 255, 0, 0 end
if STRGST.SFSPSSDoor == true then PSSR, PSSG, PSSB = 0, 180, 0 PSSR2, PSSG2, PSSB2 = 0, 255, 0 else PSSR, PSSG, PSSB = 180, 0, 0 PSSR2, PSSG2, PSSB2 = 255, 0, 0 end
if STRGST.SFSJRBDoor == true then JRBR, JRBG, JRBB = 0, 180, 0 JRBR2, JRBG2, JRBB2 = 0, 255, 0 else JRBR, JRBG, JRBB = 180, 0, 0 JRBR2, JRBG2, JRBB2 = 255, 0, 0 end
if STRGST.SFSCCMDoor == true then CCMR, CCMG, CCMB = 0, 180, 0 CCMR2, CCMG2, CCMB2 = 0, 255, 0 else CCMR, CCMG, CCMB = 180, 0, 0 CCMR2, CCMG2, CCMB2 = 255, 0, 0 end
if STRGST.SFSKey1 == true then K1R, K1G, K1B = 0, 180, 0 K1R2, K1G2, K1B2 = 0, 255, 0 else K1R, K1G, K1B = 180, 0, 0 K1R2, K1G2, K1B2 = 255, 0, 0 end
if STRGST.SFSKey2 == true then K2R, K2G, K2B = 0, 180, 0 K2R2, K2G2, K2B2 = 0, 255, 0 else K2R, K2G, K2B = 180, 0, 0 K2R2, K2G2, K2B2 = 255, 0, 0 end
if STRGST.SFSDDDMovedBack == true then DDDR, DDDG, DDDB = 0, 180, 0 DDDR2, DDDG2, DDDB2 = 0, 255, 0 else DDDR, DDDG, DDDB = 180, 0, 0 DDDR2, DDDG2, DDDB2 = 255, 0, 0 end
if STRGST.SFSMoatDrain == true then CMDR, CMDG, CMDB = 0, 180, 0 CMDR2, CMDG2, CMDB2 = 0, 255, 0 else CMDR, CMDG, CMDB = 180, 0, 0 CMDR2, CMDG2, CMDB2 = 255, 0, 0 end
if STRGST.SFSCapGround == true then CGR, CGG, CGB = 0, 180, 0 CGR2, CGG2, CGB2 = 0, 255, 0 else CGR, CGG, CGB = 180, 0, 0 CGR2, CGG2, CGB2 = 255, 0, 0 end
if STRGST.SFSCapKlepto == true then CKR, CKG, CKB = 0, 180, 0 CKR2, CKG2, CKB2 = 0, 255, 0 else CKR, CKG, CKB = 180, 0, 0 CKR2, CKG2, CKB2 = 255, 0, 0 end
if STRGST.SFSCapUkiki == true then CUR, CUG, CUB = 0, 180, 0 CUR2, CUG2, CUB2 = 0, 255, 0 else CUR, CUG, CUB = 180, 0, 0 CUR2, CUG2, CUB2 = 255, 0, 0 end
if STRGST.SFSCapBlizzard == true then CBR, CBG, CBB = 0, 180, 0 CBR2, CBG2, CBB2 = 0, 255, 0 else CBR, CBG, CBB = 180, 0, 0 CBR2, CBG2, CBB2 = 255, 0, 0 end

menu_shadow_text("- Mips Stars -", MDGX - 85, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("- Toad Stars -", MDGX - 85, MDGY - 35, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("- Cap Switches -", MDGX - 90, MDGY, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("- Star Doors -", MDGX + 20, MDGY - 85, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("- Bowser Keys -", MDGX + 18, MDGY - 35, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("- Extras -", MDGX + 27, MDGY, MDGSize - 0.35, 1.00, 1.00, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 2 and MenuSelectedOption == "Main")

if (MenuSelectedOption ~= "MipsStars" or (MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "MipsStars")) then shadow_text("S1", MDGX - 73, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, MS1R, MS1G, MS1B, 255)
else menu_shadow_text("S1", MDGX - 73, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, MS1R2, MS1G2, MS1B2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "MipsStars") end

if (MenuSelectedOption ~= "MipsStars" or (MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "MipsStars")) then shadow_text("S2", MDGX - 50, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, MS2R, MS2G, MS2B, 255)
else menu_shadow_text("S2", MDGX - 50, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, MS2R2, MS2G2, MS2B2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "MipsStars") end

if (MenuSelectedOption ~= "ToadStars" or (MenuUDOption == 1 and MenuLROption ~= 1 and MenuSelectedOption == "ToadStars")) then shadow_text("S1", MDGX - 82, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS1R, TS1G, TS1B, 255)
else menu_shadow_text("S1", MDGX - 82, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS1R2, TS1G2, TS1B2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "ToadStars") end

if (MenuSelectedOption ~= "ToadStars" or (MenuUDOption == 1 and MenuLROption ~= 2 and MenuSelectedOption == "ToadStars")) then shadow_text("S2", MDGX - 62, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS2R, TS2G, TS2B, 255)
else menu_shadow_text("S2", MDGX - 62, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS2R2, TS2G2, TS2B2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "ToadStars") end

if (MenuSelectedOption ~= "ToadStars" or (MenuUDOption == 1 and MenuLROption ~= 3 and MenuSelectedOption == "ToadStars")) then shadow_text("S3", MDGX - 42, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS3R, TS3G, TS3B, 255)
else menu_shadow_text("S3", MDGX - 42, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, TS3R2, TS3G2, TS3B2, 255, MenuUDOption == 1 and MenuLROption == 3 and MenuSelectedOption == "ToadStars") end

if (MenuSelectedOption ~= "CapSwitches" or (MenuUDOption == 1 and MenuLROption ~= 1 and MenuSelectedOption == "CapSwitches")) then shadow_text("WC", MDGX - 82, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, WCR, WCG, WCB, 255)
else menu_shadow_text("WC", MDGX - 82, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, WCR2, WCG2, WCB2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "CapSwitches") end

if (MenuSelectedOption ~= "CapSwitches" or (MenuUDOption == 1 and MenuLROption ~= 2 and MenuSelectedOption == "CapSwitches")) then shadow_text("MC", MDGX - 62, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, MCR, MCG, MCB, 255)
else menu_shadow_text("MC", MDGX - 62, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, MCR2, MCG2, MCB2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "CapSwitches") end

if (MenuSelectedOption ~= "CapSwitches" or (MenuUDOption == 1 and MenuLROption ~= 3 and MenuSelectedOption == "CapSwitches")) then shadow_text("VC", MDGX - 42, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, VCR, VCG, VCB, 255)
else menu_shadow_text("VC", MDGX - 42, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, VCR2, VCG2, VCB2, 255, MenuUDOption == 1 and MenuLROption == 3 and MenuSelectedOption == "CapSwitches") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 2 and MenuLROption ~= 1) or (MenuUDOption ~= 1)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("50", MDGX + 11, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, D50R, D50G, D50B, 255) else 
menu_shadow_text("50", MDGX + 11, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, D50R2, D50G2, D50B2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 2 and MenuLROption ~= 2) or (MenuUDOption ~= 1)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("BM", MDGX + 26, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BMDR, BMDG, BMDB, 255) else 
menu_shadow_text("BM", MDGX + 26, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BMDR2, BMDG2, BMDB2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 2 and MenuLROption ~= 3) or (MenuUDOption ~= 1)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("US", MDGX + 41, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, USDR, USDG, USDB, 255) else 
menu_shadow_text("US", MDGX + 41, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, USDR2, USDG2, USDB2, 255, MenuUDOption == 1 and MenuLROption == 3 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 2 and MenuLROption ~= 4) or (MenuUDOption ~= 1)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("BDW", MDGX + 55, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BDWR, BDWG, BDWB, 255) else 
menu_shadow_text("BDW", MDGX + 55, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BDWR2, BDWG2, BDWB2, 255, MenuUDOption == 1 and MenuLROption == 4 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 2 and MenuLROption ~= 5) or (MenuUDOption ~= 1)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("BFS", MDGX + 75, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BFSR, BFSG, BFSB, 255) else 
menu_shadow_text("BFS", MDGX + 75, MDGY - 70, MDGSize - 0.35, 1.00, 1.00, BFSR2, BFSG2, BFSB2, 255, MenuUDOption == 1 and MenuLROption == 5 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 1 and MenuLROption ~= 1) or (MenuUDOption ~= 2)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("WF", MDGX + 15, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, WFR, WFG, WFB, 255) else 
menu_shadow_text("WF", MDGX + 15, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, WFR2, WFG2, WFB2, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 1 and MenuLROption ~= 2) or (MenuUDOption ~= 2)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("PSS", MDGX + 30, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, PSSR, PSSG, PSSB, 255) else 
menu_shadow_text("PSS", MDGX + 30, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, PSSR2, PSSG2, PSSB2, 255, MenuUDOption == 2 and MenuLROption == 2 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 1 and MenuLROption ~= 3) or (MenuUDOption ~= 2)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("JRB", MDGX + 50, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, JRBR, JRBG, JRBB, 255) else 
menu_shadow_text("JRB", MDGX + 50, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, JRBR2, JRBG2, JRBB2, 255, MenuUDOption == 2 and MenuLROption == 3 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "StarDoors" or (((MenuUDOption ~= 1 and MenuLROption ~= 4) or (MenuUDOption ~= 2)) and MenuSelectedOption == "StarDoors")) then 
shadow_text("CCM", MDGX + 70, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, CCMR, CCMG, CCMB, 255) else 
menu_shadow_text("CCM", MDGX + 70, MDGY - 55, MDGSize - 0.35, 1.00, 1.00, CCMR2, CCMG2, CCMB2, 255, MenuUDOption == 2 and MenuLROption == 4 and MenuSelectedOption == "StarDoors") end

if (MenuSelectedOption ~= "BowserKeys" or (MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "BowserKeys")) then shadow_text("Key 1", MDGX + 22, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, K1R, K1G, K1B, 255)
else menu_shadow_text("Key 1", MDGX + 22, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, K1R2, K1G2, K1B2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "BowserKeys") end

if (MenuSelectedOption ~= "BowserKeys" or (MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "BowserKeys")) then shadow_text("Key 2", MDGX + 55, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, K2R, K2G, K2B, 255)
else menu_shadow_text("Key 2", MDGX + 55, MDGY - 20, MDGSize - 0.35, 1.00, 1.00, K2R2, K2G2, K2B2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "BowserKeys") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 2 and MenuLROption ~= 1) or (MenuUDOption ~= 1)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("DDDM", MDGX + 15, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, DDDR, DDDG, DDDB, 255) else 
menu_shadow_text("DDDM", MDGX + 15, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, DDDR2, DDDG2, DDDB2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "SFExtras") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 2 and MenuLROption ~= 2) or (MenuUDOption ~= 1)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("Moat", MDGX + 40, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, CMDR, CMDG, CMDB, 255) else 
menu_shadow_text("Moat", MDGX + 40, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, CMDR2, CMDG2, CMDB2, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "SFExtras") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 2 and MenuLROption ~= 3) or (MenuUDOption ~= 1)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("CapG", MDGX + 65, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, CGR, CGG, CGB, 255) else 
menu_shadow_text("CapG", MDGX + 65, MDGY + 15, MDGSize - 0.35, 1.00, 1.00, CGR2, CGG2, CGB2, 255, MenuUDOption == 1 and MenuLROption == 3 and MenuSelectedOption == "SFExtras") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 1 and MenuLROption ~= 1) or (MenuUDOption ~= 2)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("CapK", MDGX + 15, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CKR, CKG, CKB, 255) else 
menu_shadow_text("CapK", MDGX + 15, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CKR2, CKG2, CKB2, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "SFExtras") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 1 and MenuLROption ~= 2) or (MenuUDOption ~= 2)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("CapU", MDGX + 40, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CUR, CUG, CUB, 255) else 
menu_shadow_text("CapU", MDGX + 40, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CUR2, CUG2, CUB2, 255, MenuUDOption == 2 and MenuLROption == 2 and MenuSelectedOption == "SFExtras") end

if (MenuSelectedOption ~= "SFExtras" or (((MenuUDOption ~= 1 and MenuLROption ~= 3) or (MenuUDOption ~= 2)) and MenuSelectedOption == "SFExtras")) then 
shadow_text("CapB", MDGX + 65, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CBR, CBG, CBB, 255) else 
menu_shadow_text("CapB", MDGX + 65, MDGY + 30, MDGSize - 0.35, 1.00, 1.00, CBR2, CBG2, CBB2, 255, MenuUDOption == 2 and MenuLROption == 3 and MenuSelectedOption == "SFExtras") end

if STRFlagFailSafe == true then SFFSText = "- (X) Disable Save Flags Failsafe -" else SFFSText = "- (X) Enable Save Flags Failsafe -" end
local SFFSX = (S_Width() - Hud_Measure(SFFSText) * 0.25) / 2.0

local ResetSaveText = "- (Z) Erase Save File -"
local RUSureText = "Are you sure you want to Erase your Save Data?"
local ROButtonText = "(A) Reset | (B) Back"
local ResetSX = (S_Width() - Hud_Measure(ResetSaveText) * 0.35) / 2.0
local RUSureX = (S_Width() - Hud_Measure(RUSureText) * 0.25) / 2.0
local ROButtonX = (S_Width() - Hud_Measure(ROButtonText) * 0.25) / 2.0

hide_shadow_text(SFFSText, SFFSX, MDGY + 45, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuSelectedOption == "Main")
menu_shadow_text(ResetSaveText, ResetSX, MDGY + 54, MDGSize - 0.40, 1.05, 1.05, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
hide_shadow_text(RUSureText, RUSureX, MDGY + 66, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
hide_shadow_text(ROButtonText, ROButtonX, MDGY + 76, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSave")
end
if STRMenuTitleName == "MDSettings" then
if STRGMOption == 1 then GType = "Normal" elseif STRGMOption == 2 then GType = "Practice" elseif STRGMOption == 3 then GType = "Casual" elseif STRGMOption == 4 then GType = "Single Stars" end
if STRSTOption == 1 then SOType = "Both" elseif STRSTOption == 2 then SOType = "Intermission" elseif STRSTOption == 3 then SOType = "Countdown" elseif STRSTOption == 4 then SOType = "None" end
if not network_is_server() then
if STRGST.STRGameMode == 1 then GType = "Normal" elseif STRGST.STRGameMode == 2 then GType = "Practice" elseif STRGST.STRGameMode == 3 then GType = "Casual" elseif STRGST.STRGameMode == 4 then GType = "Single Stars" end
if STRGST.STRStartingType == 1 then SOType = "Both" elseif STRGST.STRStartingType == 2 then SOType = "Intermission"
elseif STRGST.STRStartingType == 3 then SOType = "Countdown" elseif STRGST.STRStartingType == 4 then SOType = "None" end
end
local GMWidth = Hud_Measure(GType) * MDGSize local GMX = (S_Width() - GMWidth) / 2.0
local SOTWidth = Hud_Measure(SOType) * MDGSize local SOTX = (S_Width() - SOTWidth) / 2.0
local CDNWidth = Hud_Measure(tostring(STRGST.STRCDNumber)) * MDGSize local CDNX = (S_Width() - CDNWidth) / 2.0
local FGWWidth = Hud_Measure(STRGST.STRFinishGameWarp) * MDGSize local FGWX = (S_Width() - FGWWidth) / 2.0
if STRGST.STRBSFOption == "Disabled" then BackupText = "Off" elseif STRGST.STRBSFOption == "Enabled" and STRGST.STRBackupSF == false then BackupText = "On (Normal)"
elseif STRGST.STRBSFOption == "Enabled" and STRGST.STRBackupSF == true then BackupText = "On (Backup)" end
local BSWidth = Hud_Measure(BackupText) * MDGSize local BSX = (S_Width() - BSWidth) / 2.0

menu_shadow_text("Gamemode Type: ", MDGX - 130, MDGY - 70, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1)
menu_shadow_text("Starting Option:", MDGX - 130, MDGY - 40, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2)
menu_shadow_text("Countdown Number:", MDGX - 130, MDGY - 10, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3)
menu_shadow_text("Finish Run Warp:", MDGX - 130, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4)
menu_shadow_text("Backup Save:", MDGX - 130, MDGY + 50, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 5)
menu_shadow_text(GType, GMX + 87, MDGY - 70, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1)
menu_shadow_text(SOType, SOTX + 86, MDGY - 40, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2)
menu_shadow_text(tostring(STRGST.STRCDNumber), CDNX + 86, MDGY - 10, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3)
menu_shadow_text(STRGST.STRFinishGameWarp, FGWX + 86, MDGY + 20, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4)
hide_shadow_text("(Y) Switch Files", MDGX + 65, MDGY + 43, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuUDOption == 5 and STRGST.STRBSFOption == "Enabled" and STRGST.STRGameState == "Lobby")
menu_shadow_text(BackupText, BSX + 85, MDGY + 50, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 5)

if STRGST.InteractionCheck == true then
menu_shadow_text(GType, GMX + 87, MDGY - 70, MDGSize, 1.25, 1.25, 255, 0, 0, 255, MenuUDOption == 1)
end
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

menu_shadow_text("Players Interact:", MDGX - 110, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 1)
menu_shadow_text("PVP Mode:", MDGX - 110, MDGY - 43, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 1)
menu_shadow_text("Bouncy Level Bounds:", MDGX - 110, MDGY - 11, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 1)
menu_shadow_text("Bubble On Death:", MDGX - 110, MDGY + 21, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuLROption == 1)
menu_shadow_text("Max Players:", MDGX - 110, MDGY + 52, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text("Knockback Strength:", MDGX + 20, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("On Star Collection:", MDGX + 20, MDGY - 43, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 2)
menu_shadow_text("Nametags: ", MDGX + 20, MDGY - 11, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 2)
menu_shadow_text("Pause Anywhere:", MDGX + 20, MDGY + 21, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuLROption == 2)

menu_shadow_text(PIFunc, MDGX - 110, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 1)
menu_shadow_text(PVPFunc, MDGX - 110, MDGY - 28, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 1)
menu_shadow_text(BLFunc, MDGX - 110, MDGY + 4, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 1)
menu_shadow_text(BDFunc, MDGX - 110, MDGY + 36, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 4 and MenuLROption == 1)
menu_shadow_text(tostring(gServerSettings.maxPlayers), MDGX - 110, MDGY + 66, MDGSize - 0.40, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "MaxPlayers")

menu_shadow_text(KBFunc, MDGX + 20, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuLROption == 2 )
menu_shadow_text(SCFunc, MDGX + 20, MDGY - 28, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuLROption == 2)
menu_shadow_text(NTFunc, MDGX + 20, MDGY + 4, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuLROption == 2)
menu_shadow_text(PAFunc, MDGX + 20, MDGY + 36, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 4 and MenuLROption == 2)
end
if STRMenuTitleName == "MDRuns" then
if STRGST.AddRomhack == true then LSA = 0 LSB = 0 else LSA = 255 LSB = 255 end
if STRRunSlotAdded == false then RSA = 0 RSB = 0 else RSA = 255 RSB = 255 end
menu_shadow_text("- Lobby Settings -", MDGX - 90, MDGY - 70, MDGSize + 0.20, 1.50, 1.50, 255, 255, 255, 255, MenuUDOption == 1)
menu_shadow_text("- Level Settings -", MDGX - 89, MDGY - 25, MDGSize + 0.20, 1.50, 1.50, 255, LSA, LSB, 255, MenuUDOption == 2)
menu_shadow_text("- Run Slot Plugins -", MDGX - 65, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, RSA, RSB, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
if STRGST.STRPluginsCheck == true then PluginText = "(A) Disabled Plugin, (Stick/Dpad) Select Slot" else PluginText = "(A) Enabled Plugin" end
local PTX = (S_Width() - Hud_Measure(PluginText) * 0.25) / 2.0
hide_shadow_text(PluginText, PTX, MDGY + 57, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "MDRunSlot")

if STRGST.STRPluginsCheck == false and #STRPluginRuns == 0 then RPCText = "No Plugins" RPCColor = 0
elseif #STRPluginRuns ~= 1 and STRGST.STRPluginsCheck == false then RPCText = "Available Slots (" .. #STRPluginRuns .. ")" RPCColor = 255
elseif #STRPluginRuns == 1 and STRGST.STRPluginsCheck == false then RPCText = "Available Slot (" .. #STRPluginRuns .. ")" RPCColor = 255
else RPCText = STRPluginRuns[STRGST.STRPluginsTypes].PluginName RPCColor = 255 end
if (MenuUDOption == 3 and MenuSelectedOption == "MDRunSlot") or (STRGST.STRPluginsCheck == false and #STRPluginRuns == 0) then RPC2Color = 0 else RPC2Color = 255 end
local RPCX = (S_Width() - Hud_Measure(RPCText) * 0.45) / 2.0
shadow_text(RPCText, RPCX, MDGY + 42, MDGSize - 0.30, 1.05, 1.05, 255, RPCColor, RPC2Color, 255)
end

if STRMenuTitleName == "MDLobby" then
if STRGST.InteractionCheck == true then LIText = "Enabled" else LIText = "Disabled" end
if MenuViewHostCheck == true then
shadow_text("Interaction:", MDGX - 65, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 180, 180, 180, 255)
shadow_text("Forced Type:", MDGX - 65, MDGY - 55, MDGSize - 0.30, 1.05, 1.05, 180, 180, 180, 255)
shadow_text("Warp Settings:", MDGX - 65, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 180, 180, 180, 255)
shadow_text("Position Settings:", MDGX - 65, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 180, 180, 180, 255)

shadow_text(LIText, MDGX + 25, MDGY - 72, MDGSize - 0.40, 0.95, 0.95, 180, 180, 180, 255)
shadow_text(STRGST.STRForceLevelType, MDGX + 25, MDGY - 52, MDGSize - 0.40, 0.95, 0.95, 180, 180, 180, 255)
shadow_text(STRGST.STRWarpType, MDGX + 25, MDGY - 32, MDGSize - 0.40, 0.95, 0.95, 180, 180, 180, 255)
shadow_text(STRGST.STRForceSpot, MDGX + 25, MDGY - 12, MDGSize - 0.40, 0.95, 0.95, 180, 180, 180, 255)
end
FullLevel = "Location - (".. get_level_name(STRGST.STRCourseID, STRGST.STRLevelID, STRGST.STRAreaID)..", "..STRGST.STRAreaID ..", ".. STRGST.STRActID  ..")" local MDCLLX = (S_Width() - Hud_Measure(FullLevel) * 0.25) / 2.0
FullPosition = "Position - (".. tostring(math.floor(STRGST.STRXPos))..", "..tostring(math.floor(STRGST.STRYPos))..", ".. tostring(math.floor(STRGST.STRZPos)) ..")" 
local MDCLPX = (S_Width() - Hud_Measure(FullPosition) * 0.25) / 2.0
shadow_text(FullLevel, MDCLLX, MDGY + 29, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text(FullPosition, MDCLPX, MDGY + 45, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
if MenuViewHostCheck == false then
if STRGST.STRGameState == "Lobby" then LobbyColor1, LobbyColor2 = 255, 255 else LobbyColor1, LobbyColor2 = 0, 0 end
menu_shadow_text("Interaction:", MDGX - 140, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Update Location:", MDGX - 140, MDGY - 55, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Forced Type:", MDGX - 140, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Warp Settings:", MDGX - 140, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Position Settings:", MDGX - 140, MDGY + 5, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text(LIText, MDGX - 50, MDGY - 72, MDGSize - 0.40, 0.95, 0.95, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRLocationSpot, MDGX - 50, MDGY - 52, MDGSize - 0.40, 0.95, 0.95, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceLevelType, MDGX - 50, MDGY - 32, MDGSize - 0.40, 0.95, 0.95, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRWarpType, MDGX - 50, MDGY - 12, MDGSize - 0.40, 0.95, 0.95, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 4 and MenuLROption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRGST.STRForceSpot, MDGX - 50, MDGY + 8, MDGSize - 0.40, 0.95, 0.95, 255, LobbyColor1, LobbyColor2, 255, MenuUDOption == 5 and MenuLROption == 1 and MenuSelectedOption == "Main")

menu_shadow_text("- Custom Location -", MDGX + 30, MDGY - 75, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(A) New Location", MDGX + 52, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, LobbyColor1, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(B) New Position", MDGX + 52, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, LobbyColor1, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(Y) Warp Position", MDGX + 51, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, LobbyColor1, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(L/R) Lock Player", MDGX + 51, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, LobbyColor1, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("(X) Reset Everything", MDGX + 47, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, LobbyColor1, 0, 255, MenuLROption == 2 and MenuSelectedOption == "Main")

local ResetSaveText = "- (Z) Reset Saved Settings -"
local RUSureText = "Are you sure you want to Reset your Settings?"
local ROButtonText = "(A) Reset | (B) Back"
local ResetSX = (S_Width() - Hud_Measure(ResetSaveText) * 0.45) / 2.0
local RUSureX = (S_Width() - Hud_Measure(RUSureText) * 0.25) / 2.0
local ROButtonX = (S_Width() - Hud_Measure(ROButtonText) * 0.25) / 2.0

menu_shadow_text(ResetSaveText, ResetSX, MDGY + 57, MDGSize - 0.30, 1.05, 1.05, 255, LobbyColor1, LobbyColor2, 255, MenuSelectedOption == "EraseLobby")
hide_shadow_text(RUSureText, RUSureX, MDGY + 72, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseLobby")
hide_shadow_text(ROButtonText, ROButtonX, MDGY + 81, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseLobby")
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
menu_shadow_text("Star Limit:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Star ID:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Behavior Types:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Stars Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

menu_shadow_text(tostring(STRGST.STRLFLimit), MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFID), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFB[STRGST.STRLFBehavior].Type, MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFS[STRGST.STRLFStars], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 2 then
menu_shadow_text("Level Location:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Level Area Num:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Level Act Num:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Levels Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")

menu_shadow_text(STRLevels[STRGST.STRLFLevel].STRLN, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFArea), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFAct), MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFL[STRGST.STRLFLevels], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 3 then
menu_shadow_text("Mario Action:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Action Timer:", MDGX - 130, MDGY - 25, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Action Functions:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

menu_shadow_text(STRActions[STRGST.STRLFAction].A_Name, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFSetTimer), MDGX - 5, MDGY - 20, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFA[STRGST.STRLFActions], MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
end

if MenuPageLRDisplay == 4 then
menu_shadow_text("X Position:", MDGX - 130, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Y Position:", MDGX - 130, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Z Position:", MDGX - 130, MDGY - 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("X Box Position:", MDGX - 130, MDGY - 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Y Box Position:", MDGX - 130, MDGY, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
menu_shadow_text("Z Box Position:", MDGX - 130, MDGY + 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 6 and MenuSelectedOption == "Main")
menu_shadow_text("Position Functions:", MDGX - 130, MDGY + 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 7 and MenuSelectedOption == "Main")

menu_shadow_text(tostring(STRGST.STRLFXPos), MDGX - 5, MDGY - 60, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFYPos), MDGX - 5, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFZPos), MDGX - 5, MDGY - 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEXPos), MDGX - 5, MDGY - 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEYPos), MDGX - 5, MDGY, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRGST.STRLFEZPos), MDGX - 5, MDGY + 15, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 6 and MenuSelectedOption == "Main")
menu_shadow_text(STRLFP[STRGST.STRLFPositions], MDGX - 5, MDGY + 30, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 7 and MenuSelectedOption == "Main")
end

menu_shadow_text("Requirement Type:", MDGX - 130, MDGY + 55, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuSelectedOption == "RunTypes")
menu_shadow_text(STRRunsTypeTable[STRGST.STRRunsTypes], MDGX - 5, MDGY + 62, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuSelectedOption == "RunTypes")
end

if STRMenuTitleName == "MDSingle" then
if MenuLROption == 1 then SBLF = "Left" elseif MenuLROption == 2 then SBLF = "Middle" elseif MenuLROption == 3 then SBLF = "Right" end 
if MenuSelectedOption == "SingleBinds" then MDSSOption = "(A) Save | (B) Exit | (Y) Randomize Buttons"
else MDSSOption = "(A) Start | (B) Exit | (X) Change Binds | (Y) Stop Run"
end
local MDSSX = (S_Width() - Hud_Measure(MDSSOption) * 0.25) / 2.0
shadow_text(MDSSOption, MDSSX, MDGY + 75, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

if MenuSelectedOption == "SingleBinds" then
WarpBindsText = "Warp Binds:  " .. STRButtonBinds[STRSingleBinds.SBind1].name .. " + " .. STRButtonBinds[STRSingleBinds.SBind2].name .. " + " .. STRButtonBinds[STRSingleBinds.SBind3].name .. " (" .. SBLF .. ")"
else
WarpBindsText = "Warp Binds:  " .. STRButtonBinds[STRSingleBinds.SBind1].name .. " + " .. STRButtonBinds[STRSingleBinds.SBind2].name .. " + " .. STRButtonBinds[STRSingleBinds.SBind3].name
end
local MDSSBX = (S_Width() - Hud_Measure(WarpBindsText) * 0.25) / 2.0
menu_shadow_text(WarpBindsText, MDSSBX, MDGY - 80, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuSelectedOption == "SingleBinds")

if MenuSelectedOption == "SingleBinds" then SBX = 56 else SBX = 53 end
menu_shadow_text("Levels:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Areas:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Acts:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Amount/Star ID:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Set Function:", MDGX - 130, MDGY + 50, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

menu_shadow_text(STRLevels[STRSSLevelMenu].STRLN, MDGX - 5, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRSSAreaMenu), MDGX - 5, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRSSActMenu), MDGX - 5, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(tostring(STRSSStarMenu), MDGX - 5, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(STRSSTypeTable[STRSSTypeMenu].SSName, MDGX - 5, MDGY + 55, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")
end

if STRMenuTitleName == "MDConfig" then
menu_shadow_text("Info", MDGX - 105, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 1)
menu_shadow_text("How To Play", MDGX - 45, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 2)
menu_shadow_text("Settings", MDGX + 60, MDGY - 3, MDGSize, 1.25, 1.25, 255, 255, 255, 255, MenuLROption == 3)
end
if STRMenuTitleName == "MDInfo" then
if MenuPageLRDisplay == 1 then MDInfoTitle = "What's new?"
elseif MenuPageLRDisplay == 2 then MDInfoTitle = "Credits"
elseif MenuPageLRDisplay == 3 then MDInfoTitle = "Changelog"
elseif MenuPageLRDisplay == 4 then MDInfoTitle = "Romhacks, Total: 90"
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
shadow_text("! Revamped the Savefile Settings Menu", MDGX - 90, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("~ Revert Best Time displaying color again", MDGX - 90, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added a Character Select menu hotkey", MDGX - 90, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added 21 Romhacks", MDGX - 90, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added a Option menu button", MDGX - 90, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Redone The Finish Warp when someone is at the Cake Ending", MDGX - 90, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("+ Added Cap Save Flags for Savefile Settings", MDGX - 90, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("x Removed Switching CS Moveset, because it doesn't work Anymore", MDGX - 90, MDGY + 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Now you can stop the timer in Casual Mode", MDGX - 90, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Now you can display the Countdown and Go/Start Font", MDGX - 90, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Adjusted alot of Fonts Positions", MDGX - 90, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! Made alot of changes that are small/big", MDGX - 90, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! (Host) Now Settings is locked once you start a Run", MDGX - 90, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! (Host) Now Single Stars doesn't change until you select one", MDGX - 90, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("! (Host) Now some text will display red when a option isn't Available", MDGX - 90, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
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
shadow_text("Super Mario 64: Sapphire", MDGX - Left, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("The Phantom's Call", MDGX - Left, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 1: Star Takeover", MDGX - Left, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 2: Night of Doom", MDGX - Left, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 6.5", MDGX - Left, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Twisted Adventures", MDGX - Left, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

shadow_text("Luigi's Mansion 64", MDGX - Right, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Luigi's Mansion 64.5", MDGX - Right, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Paradise Island", MDGX - Right, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
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
shadow_text("SM64 Sapphire: Green Comet", MDGX - Left, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Royal Legacy", MDGX - Left, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64 Extra", MDGX - Left, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 3: Mario on An Saoire 64", MDGX - Left, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 4: The Kedama Takeover 64", MDGX - Left, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64: Trouble Town", MDGX - Left, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 1.3: Redone", MDGX - Left, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64: Into Bowser's Castle", MDGX - Left, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

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
shadow_text("SM64: Openworld Quest", MDGX - Left, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Organ of Matrias", MDGX - Left, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 8: Scepter of Hope", MDGX - Left, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario on Indigo Island", MDGX - Left, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 3.9: Dreamish Block Beats", MDGX - Left, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario: King Bob-omb's Revenge", MDGX - Left, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Tomatobird8's Classic Pack 64", MDGX - Left, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario 64: The Nostalgia Trip", MDGX - Left, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: A New Journey", MDGX - Left, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Ultra Mario 64 Demo", MDGX - Left, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Astra", MDGX - Left, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)

shadow_text("Mechanical Madness 2", MDGX - Right, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mechanical Madness 3", MDGX - Right, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Star Revenge 2 Act 1: To The Moon", MDGX - Right, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario and the Magic Wand", MDGX - Right, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Bros. 3D", MDGX - Right, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Openworld Edition", MDGX - Right, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Little Worlds", MDGX - Right, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Little Comets", MDGX - Right, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Revenge of the Others", MDGX - Right, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario and the Floating Isles", MDGX - Right, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Mario and the Floating Isles 2", MDGX - Right, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Mystery Bowser Worlds", MDGX - Right, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario Mystic Isles", MDGX - Right, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("SM64: Surge of Starlight", MDGX - Right, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Super Mario New Star", MDGX - Right, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
end
elseif MenuPageLRDisplay == 5 then
shadow_text("Fixed Best Time Color breaks when joining", MDGX - 75, MDGY - 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Softlock Warp can be used when a run started", MDGX - 75, MDGY - 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Cap not on the players head when clearing save", MDGX - 75, MDGY - 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text('Fixed Exclamation Boxes that sets stars Id to 1', MDGX - 75, MDGY - 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Some Romhack Rules error mistakes", MDGX - 75, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text('Fixed set_custom_colors get disabled when "Custom" is used', MDGX - 75, MDGY - 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Some Fonts get it's position overwritten from another", MDGX - 75, MDGY - 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Incorrect Color when having one Custom and Normal Font", MDGX - 75, MDGY - 0, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed Some Custom Fonts Y position after 10 hours has passed", MDGX - 75, MDGY + 10, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("Fixed SM64 Hud that is different from other Fonts", MDGX - 75, MDGY + 20, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text('Fixed Alot of Issues that were notice when updating', MDGX - 75, MDGY + 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text('(Host) Fixed being able to use the settings when starting a run', MDGX - 75, MDGY + 40, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("(Host) Fixed Being in the settings menu once starting Casual Mode", MDGX - 75, MDGY + 50, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("(Rare) Fixed Best Time not updating when resetting and finishing", MDGX - 75, MDGY + 60, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
shadow_text("(Rare) Fixed Fonts that causes a error when randomizing the fonts", MDGX - 75, MDGY + 70, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
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
MDCSRExtra = ""
if MenuPageLRDisplay == 1 and STRGST.STRGameState == "Lobby" then
if MenuUDOption == 2 and STRShowCDFont == "Enabled" and STRShowGoFont == "Disabled" then MDCSRExtra = " | (X) Hide Countdown Font"
elseif MenuUDOption == 2 and STRShowCDFont == "Disabled" and STRShowGoFont == "Disabled" then MDCSRExtra = " | (X) Show Countdown Font"
elseif MenuUDOption == 3 and STRShowGoFont == "Enabled" and STRShowCDFont == "Disabled" then MDCSRExtra = " | (X) Hide Go Font"
elseif MenuUDOption == 3 and STRShowGoFont == "Disabled" and STRShowCDFont == "Disabled" then MDCSRExtra = " | (X) Show Go Font"
end
elseif MenuPageLRDisplay == 2 then MDCSRExtra = " | (X) Play Sound"
elseif MenuPageLRDisplay == 3 then if (MenuSelectedOption ~= "Main" and not MenuSelectedOption == "EraseSettings") then MDCSRExtra = " | (Y) Randomize Settings" end
elseif MenuPageLRDisplay == 4 then if STRGST.STRGameState == "Lobby" then MDCSRExtra = " | (Y) Softlock Warp Help" end
end

if (MenuPageLRDisplay == 1 or MenuPageLRDisplay == 2) then MDCSRText = " | (Y) Randomize Settings" .. MDCSRExtra
elseif (MenuPageLRDisplay == 3 or MenuPageLRDisplay == 4 or MenuSelectedOption == "EraseSettings") then MDCSRText = "" .. MDCSRExtra end

if MenuSelectedOption ~= "ClearStorage" then
MDCSROption = "(A) Select | (B) Exit | (L/R Trig) Menu Page: " .. MenuPageLRDisplay .. "/4" .. MDCSRText
else
MDCSROption = "You really want to clear All your Save Storages? (A) Yes | (B) No"
end
local MDCSROX = (S_Width() - Hud_Measure(MDCSROption) * 0.25) / 2.0
if MenuSelectedOption ~= "ClearStorage" then 
shadow_text(MDCSROption, MDCSROX, MDGY + 48, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255)
else
shadow_text(MDCSROption, MDCSROX, MDGY + 48, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255)
end
if MenuPageLRDisplay == 1 then MDCSTitle = "Fonts"
elseif MenuPageLRDisplay == 2 then MDCSTitle = "Sounds"
elseif MenuPageLRDisplay == 3 then MDCSTitle = "Colors"
elseif MenuPageLRDisplay == 4 then MDCSTitle = "Extras"
end
local MDCSX = (S_Width() - Hud_Measure(MDCSTitle) * 0.35) / 2.0
shadow_text(MDCSTitle, MDCSX, MDGY - 85, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255)

local ResetSaveText = "- (Z) Reset Saved Settings -"
local RUSureText = "Are you sure you want to Reset your Settings?"
local ROButtonText = "(A) Reset | (B) Back"
local ResetSX = (S_Width() - Hud_Measure(ResetSaveText) * 0.45) / 2.0
local RUSureX = (S_Width() - Hud_Measure(RUSureText) * 0.25) / 2.0
local ROButtonX = (S_Width() - Hud_Measure(ROButtonText) * 0.25) / 2.0

menu_shadow_text(ResetSaveText, ResetSX, MDGY + 57, MDGSize - 0.30, 1.05, 1.05, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")
hide_shadow_text(RUSureText, RUSureX, MDGY + 72, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")
hide_shadow_text(ROButtonText, ROButtonX, MDGY + 81, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuSelectedOption == "EraseSettings")

if MenuPageLRDisplay == 1 then
local FontTText = "- Timer -" local FontCDText = "- Countdown -" local FontGOText = "- Go/Start -"
local FTMTTX = (S_Width() - Hud_Measure(FontTText) * 0.45) / 2.0
local FCDTTX = (S_Width() - Hud_Measure(FontCDText) * 0.45) / 2.0
local FGOTTX = (S_Width() - Hud_Measure(FontGOText) * 0.45) / 2.0
menu_shadow_text(FontTText, FTMTTX, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(FontCDText, FCDTTX, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(FontGOText, FGOTTX, MDGY + 10, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

local FontPluginTText = "Built-in Timer" local FontPluginCDText = "Built-in Countdown" local FontPluginGOText = "Built-in Go/Start"
if STRFTMNumber > 6 then FontPluginTText = "Custom Timer Plugin" else FontPluginTText = "Built-in Timer" end
if STRFCDNumber > 6 then FontPluginCDText = "Custom Countdown Plugin" else FontPluginCDText = "Built-in Countdown" end
if STRFGONumber > 6 then FontPluginGOText = "Custom Go/Start Plugin" else FontPluginGOText = "Built-in Go/Start" end

local FTMPTX = (S_Width() - Hud_Measure(FontPluginTText) * 0.25) / 2.0
local FCDPTX = (S_Width() - Hud_Measure(FontPluginCDText) * 0.25) / 2.0
local FGOPTX = (S_Width() - Hud_Measure(FontPluginGOText) * 0.25) / 2.0
menu_shadow_text(FontPluginTText, FTMPTX, MDGY - 54, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(FontPluginCDText, FCDPTX, MDGY - 14, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(FontPluginGOText, FGOPTX, MDGY + 26, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

local FTMText = STRFontsTable[STRFTMNumber].str_font_name local FCDText = STRFontsTable[STRFCDNumber].str_font_name local FGOText = STRFontsTable[STRFGONumber].str_font_name
local FTMNX = (S_Width() - Hud_Measure(FTMText) * 0.35) / 2.0 local FCDNX = (S_Width() - Hud_Measure(FCDText) * 0.35) / 2.0 local FGONX = (S_Width() - Hud_Measure(FGOText) * 0.35) / 2.0

menu_shadow_text(FTMText, FTMNX, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(FCDText, FCDNX, MDGY - 5, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(FGOText, FGONX, MDGY + 35, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
end
if MenuPageLRDisplay == 2 then
local SoundFText = "- Fanfare -" local SoundCDText = "- Countdown -" local SoundtGOText = "- Go/Start -"
local FTMTTX = (S_Width() - Hud_Measure(SoundFText) * 0.45) / 2.0
local FCDTTX = (S_Width() - Hud_Measure(SoundCDText) * 0.45) / 2.0
local FGOTTX = (S_Width() - Hud_Measure(SoundtGOText) * 0.45) / 2.0
menu_shadow_text(SoundFText, FTMTTX, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(SoundCDText, FCDTTX, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(SoundtGOText, FGOTTX, MDGY + 10, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

local SoundPluginFText = "Built-in Fanfare" local SoundPluginCDText = "Built-in Countdown" local SoundPluginGOText = "Built-in Go/Start"
if STRSFFNumber ~= 1 then SoundPluginFText = "Custom Fanfare Plugin" else SoundPluginFText = "Built-in Fanfare" end
if STRSCDNumber > 5 then SoundPluginCDText = "Custom Countdown Plugin" else SoundPluginCDText = "Built-in Countdown" end
if STRSGONumber ~= 1 then SoundPluginGOText = "Custom Go/Start Plugin" else SoundPluginGOText = "Built-in Go/Start" end

local FTMPTX = (S_Width() - Hud_Measure(SoundPluginFText) * 0.25) / 2.0
local FCDPTX = (S_Width() - Hud_Measure(SoundPluginCDText) * 0.25) / 2.0
local FGOPTX = (S_Width() - Hud_Measure(SoundPluginGOText) * 0.25) / 2.0
menu_shadow_text(SoundPluginFText, FTMPTX, MDGY - 54, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(SoundPluginCDText, FCDPTX, MDGY - 14, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(SoundPluginGOText, FGOPTX, MDGY + 26, MDGSize - 0.50, 0.50, 0.50, 255, 255, 0, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

local SFFText = STRFanfareTable[STRSFFNumber].str_fanfare_name local SCDText = STRCountdownTable[STRSCDNumber].str_countdown_name local SGOText = STRGoTable[STRSGONumber].str_go_name
local SFFNX = (S_Width() - Hud_Measure(SFFText) * 0.35) / 2.0 local SCDNX = (S_Width() - Hud_Measure(SCDText) * 0.35) / 2.0 local SGONX = (S_Width() - Hud_Measure(SGOText) * 0.35) / 2.0

menu_shadow_text(SFFText, SFFNX, MDGY - 45, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(SCDText, SCDNX, MDGY - 5, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(SGOText, SGONX, MDGY + 35, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")

end
if MenuPageLRDisplay == 3 then
menu_shadow_text("Font Colors:", MDGX - 130, MDGY - 70, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Rect Colors:", MDGX - 130, MDGY - 40, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Menu Colors:", MDGX - 130, MDGY - 10, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Timer Pos:", MDGX - 130, MDGY + 20, MDGSize - 0.10, 1.25, 1.25, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
if MenuLROption == 1 then RCSet = 255 GCSet = 0 BCSet = 0 elseif MenuLROption == 2 then RCSet = 0 GCSet = 255 BCSet = 0
elseif MenuLROption == 3 then RCSet = 0 GCSet = 0 BCSet = 255 elseif MenuLROption == 4 then RCSet = 255 GCSet = 255 BCSet = 255
end
if MenuSelectedOption == "FontColors" then
if MenuLROption == 1 then FColorText = " - Red" elseif MenuLROption == 2 then FColorText = " - Green" elseif MenuLROption == 3 then FColorText = " - Blue" elseif MenuLROption == 4 then FColorText = " - Visable" end
else FColorText = "" end

if MenuSelectedOption == "RectColors" then
if MenuLROption == 1 then RColorText = " - Red" elseif MenuLROption == 2 then RColorText = " - Green" elseif MenuLROption == 3 then RColorText = " - Blue" elseif MenuLROption == 4 then RColorText = " - Visable" end
else RColorText = "" end

if MenuSelectedOption == "MenuColors" then
if MenuLROption == 1 then MColorText = " - Red" elseif MenuLROption == 2 then MColorText = " - Green" elseif MenuLROption == 3 then MColorText = " - Blue" elseif MenuLROption == 4 then MColorText = " - Visable" end
else MColorText = "" end
local FCDisplay = "(" .. STRFontColors.STRFR .. ", " .. STRFontColors.STRFG .. ", " .. STRFontColors.STRFB .. ", " .. STRFontColors.STRFV .. ")"
local RCDisplay = "(" .. STRRectColors.STRRR .. ", " .. STRRectColors.STRRG .. ", " .. STRRectColors.STRRB .. ", " .. STRRectColors.STRRV .. ")"
local MCDisplay = "(" .. STRMenuColors.STRMR .. ", " .. STRMenuColors.STRMG .. ", " .. STRMenuColors.STRMB .. ", " .. STRMenuColors.STRMV .. ")"
menu_shadow_text(FCDisplay .. FColorText, MDGX - 40, MDGY - 65, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 1 and MenuSelectedOption == "FontColors")
menu_shadow_text(RCDisplay .. RColorText, MDGX - 40, MDGY - 35, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 2 and MenuSelectedOption == "RectColors")
menu_shadow_text(MCDisplay .. MColorText, MDGX - 40, MDGY - 5, MDGSize - 0.30, 1.05, 1.05, RCSet, GCSet, BCSet, 255, MenuUDOption == 3 and MenuSelectedOption == "MenuColors")
local PosXYDisplay = "(" .. STRFontPosition.STRCX .. ", " .. STRFontPosition.STRCY .. ")"
if MenuLROption == 1 and MenuUDOption == 4 and MenuSelectedOption == "FontPosition" then
menu_shadow_text(PosXYDisplay .. " - XPos", MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
elseif MenuLROption == 2 and MenuUDOption == 4 then
menu_shadow_text(PosXYDisplay .. " - YPos", MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
else
menu_shadow_text(PosXYDisplay, MDGX - 40, MDGY + 25, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "FontPosition")
end
end
if MenuPageLRDisplay == 4 then
if MenuPageUDDisplay == 1 then
menu_shadow_text("Custom Colors:", MDGX - 130, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Font Render:", MDGX - 130, MDGY - 50, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Helper Display:", MDGX - 130, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("Menu Config:", MDGX - 130, MDGY + 0, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("Rules Display:", MDGX - 130, MDGY + 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

menu_shadow_text(STRCustomColors, MDGX - 15, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRRenderType, MDGX - 15, MDGY - 50, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(STRHelper, MDGX - 15, MDGY - 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text(STRMenuButtons, MDGX - 15, MDGY + 0, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text(STRRules, MDGX - 15, MDGY + 30, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

if MenuSelectedOption == "MenuBinds" then MBC = 0 else MBC = 255 end
if MenuSelectedOption == "RulesBinds" then RBC = 0 else RBC = 255 end
if MenuUDOption == 4 then MRBY = 15 elseif MenuUDOption == 5 then MRBY = -15 else MRBY = 15 end
if MenuLROption == 1 then MBLF = "Left" elseif MenuLROption == 2 then MBLF = "Middle" elseif MenuLROption == 3 then MBLF = "Right" end 

if MenuSelectedOption == "Main" then
hide_shadow_text("(X) Change Binds", MDGX - 15, MDGY - MRBY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, (MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both" or STRMenuButtons == "All")) 
or (MenuUDOption == 5 and STRRules == "Enabled"))
else 
hide_shadow_text("(A) Save | (Y) Randomize Buttons | (L/R) " .. MBLF, MDGX - 15, MDGY - MRBY, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, 
(MenuSelectedOption == "MenuBinds" or MenuSelectedOption == "RulesBinds") and ((STRMenuButtons == "Buttons" or STRMenuButtons == "Both" or STRMenuButtons == "All") or STRRules == "Enabled"))
end

hide_shadow_text(STRButtonBinds[STRMenuBinds.MBind1].name .. " + " .. STRButtonBinds[STRMenuBinds.MBind2].name .. " + " .. STRButtonBinds[STRMenuBinds.MBind3].name, MDGX - 15, MDGY - 7, MDGSize - 0.50, 0.50, 0.50, 255, 255, MBC, 255, 
MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both" or STRMenuButtons == "All"))

hide_shadow_text(STRButtonBinds[STRRuleBinds.RBind1].name .. " + " .. STRButtonBinds[STRRuleBinds.RBind2].name .. " + " .. STRButtonBinds[STRRuleBinds.RBind3].name, MDGX - 15, MDGY + 23, MDGSize - 0.50, 0.50, 0.50, 255, 255, RBC, 255, 
MenuUDOption == 5 and STRRules == "Enabled")
end

if MenuPageUDDisplay == 2 then
BTTotal = STRBestTimeNumber / 30 BTHours = math.floor(BTTotal / 3600) BTMinutes = math.floor((BTTotal % 3600) / 60) BTSeconds = math.floor(BTTotal % 60) BTMilliSeconds = math.floor((BTTotal * 1000) % 1000)
BestTimeText = string.format('%01d:%02d:%02d.%03d', BTHours, BTMinutes, BTSeconds, BTMilliSeconds)
if STRBestTimeOption == "Enabled" then BTOText = "(A) Enabled" elseif STRBestTimeOption == "Disabled" then BTOText = "(A) Disabled"  elseif STRBestTimeOption == "Saves" then BTOText = "(A) Saves After Run" end
if STRBTNLimit == 1 then BTNLText = "Millisecond" elseif STRBTNLimit == 30 then BTNLText = "Second" elseif STRBTNLimit == 1800 then BTNLText = "Minute" elseif STRBTNLimit == 108000 then BTNLText = "Hour" end
local VHOX = (S_Width() - Hud_Measure("- View Host Settings -") * 0.35) / 2.0
local CSSX = (S_Width() - Hud_Measure("- Clear Save Storage -") * 0.35) / 2.0

menu_shadow_text("Display Requirements:", MDGX - 130, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text("Warp Settings:", MDGX - 130, MDGY - 45, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text("Best Time Settings: ", MDGX - 130, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "Main")
menu_shadow_text("- View Host Settings -", VHOX, MDGY + 7, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 4 and MenuSelectedOption == "Main")
menu_shadow_text("- Clear Save Storage -", CSSX, MDGY + 27, MDGSize - 0.40, 0.95, 0.95, 255, 255, 255, 255, MenuUDOption == 5 and MenuSelectedOption == "Main")

menu_shadow_text(STRRDisplay, MDGX - 15, MDGY - 70, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 1 and MenuSelectedOption == "Main")
menu_shadow_text(STRMenuWarpType, MDGX - 15, MDGY - 45, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 2 and MenuSelectedOption == "Main")
menu_shadow_text(BestTimeText, MDGX - 15, MDGY - 15, MDGSize - 0.30, 1.05, 1.05, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
hide_shadow_text(BTOText .. " | (Y) Randomize Time | (X) Reset Time", MDGX - 15, MDGY - 30, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
hide_shadow_text("(U/D) + " .. BTNLText .. " | (L/R Trig) Change Seconds", MDGX - 15, MDGY - 22, MDGSize - 0.50, 0.50, 0.50, 255, 255, 255, 255, MenuUDOption == 3 and MenuSelectedOption == "BestTime")
end
end
end
if STRMenuTitleName == "MDConfigVH" then
local VHHSWidth = Hud_Measure("- Host Settings -") * MDGSize local VHHSX = (S_Width() - VHHSWidth) / 2.0
local VHSSWidth = Hud_Measure("- Server Settings -") * MDGSize local VHSSX = (S_Width() - VHSSWidth) / 2.0
local VHLSWidth = Hud_Measure("- Lobby Settings -") * MDGSize local VHLSX = (S_Width() - VHLSWidth) / 2.0

menu_shadow_text("- Host Settings -", VHHSX - 18, MDGY - 70, MDGSize + 0.20, 1.50, 1.50, 255, 255, 255, 255, MenuUDOption == 1)
menu_shadow_text("- Server Settings -", VHSSX - 18, MDGY - 20, MDGSize + 0.20, 1.50, 1.50, 255, 255, 255, 255, MenuUDOption == 2)
menu_shadow_text("- Lobby Settings -", VHLSX - 18, MDGY + 30, MDGSize + 0.20, 1.50, 1.50, 255, 255, 255, 255, MenuUDOption == 3)
end
end
end

function str_menu_update()
	if (STRMenuButtons == "Buttons" or STRMenuButtons == "Both" or STRMenuButtons == "All") then 
	if str_button_combo(gControllers[0], STRButtonBinds[STRMenuBinds.MBind1].button, STRButtonBinds[STRMenuBinds.MBind2].button, STRButtonBinds[STRMenuBinds.MBind3].button) then
	STRMenuDisplay = true 
	STRRulesOpen = false
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) 
	end
	end
	 
	if charSelectExists then 
	if charSelect.is_menu_open() and (STRRulesOpen == true or STRMenuDisplay == true) then STRRulesOpen = false STRMenuDisplay = false play_sound(SOUND_MENU_HAND_DISAPPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject) end
	end
	
	if gMarioStates[0].action == ACT_EXIT_LAND_SAVE_DIALOG and (STRRulesOpen == true or STRMenuDisplay == true) then STRMenuDisplay = false STRRulesOpen = false end

	if STRMenuDisplay == false and MenuSwitchDeplay >= 1 then MenuSwitchDeplay = MenuSwitchDeplay - 1 end
	if STRMenuDisplay == true and MenuSwitchDeplay <= 4 then MenuSwitchDeplay = MenuSwitchDeplay + 1 MenuButtonsDeplay = 100 end
	
	if STRMenuDisplay == true and (is_game_paused() and gMarioStates[0].action ~= ACT_EXIT_LAND_SAVE_DIALOG) then
	game_unpause()
	end
	
	if STRMenuDisplay == true then
	if MenuOptionDeplay >= 1 then MenuOptionDeplay = MenuOptionDeplay - 1 end
	if DPUpDelay <= 4 then DPUpDelay = DPUpDelay + 1 end
	if DPDownDelay <= 4 then DPDownDelay = DPDownDelay + 1 end
	if DPLeftDelay <= 4 then DPLeftDelay = DPLeftDelay + 1 end
	if DPRightDelay <= 4 then DPRightDelay = DPRightDelay + 1 end
	end
	
	-- FailSafe on Buttons
	MBDpadNum1 = (STRMenuBinds.MBind1 == 10 or STRMenuBinds.MBind1 == 11 or STRMenuBinds.MBind1 == 12 or STRMenuBinds.MBind1 == 13)
	MBDpadNum2 = (STRMenuBinds.MBind2 == 10 or STRMenuBinds.MBind2 == 11 or STRMenuBinds.MBind2 == 12 or STRMenuBinds.MBind2 == 13)
	MBDpadNum3 = (STRMenuBinds.MBind3 == 10 or STRMenuBinds.MBind3 == 11 or STRMenuBinds.MBind3 == 12 or STRMenuBinds.MBind3 == 13)
	MBCStickNum1 = (STRMenuBinds.MBind1 == 14 or STRMenuBinds.MBind1 == 15 or STRMenuBinds.MBind1 == 16 or STRMenuBinds.MBind1 == 17)
	MBCStickNum2 = (STRMenuBinds.MBind2 == 14 or STRMenuBinds.MBind2 == 15 or STRMenuBinds.MBind2 == 16 or STRMenuBinds.MBind2 == 17)
	MBCStickNum3 = (STRMenuBinds.MBind3 == 14 or STRMenuBinds.MBind3 == 15 or STRMenuBinds.MBind3 == 16 or STRMenuBinds.MBind3 == 17)
	RBDpadNum1 = (STRRuleBinds.RBind1 == 10 or STRRuleBinds.RBind1 == 11 or STRRuleBinds.RBind1 == 12 or STRRuleBinds.RBind1 == 13)
	RBDpadNum2 = (STRRuleBinds.RBind2 == 10 or STRRuleBinds.RBind2 == 11 or STRRuleBinds.RBind2 == 12 or STRRuleBinds.RBind2 == 13)
	RBDpadNum3 = (STRRuleBinds.RBind3 == 10 or STRRuleBinds.RBind3 == 11 or STRRuleBinds.RBind3 == 12 or STRRuleBinds.RBind3 == 13)
	RBCStickNum1 = (STRRuleBinds.RBind1 == 14 or STRRuleBinds.RBind1 == 15 or STRRuleBinds.RBind1 == 16 or STRRuleBinds.RBind1 == 17)
	RBCStickNum2 = (STRRuleBinds.RBind2 == 14 or STRRuleBinds.RBind2 == 15 or STRRuleBinds.RBind2 == 16 or STRRuleBinds.RBind2 == 17)
	RBCStickNum3 = (STRRuleBinds.RBind3 == 14 or STRRuleBinds.RBind3 == 15 or STRRuleBinds.RBind3 == 16 or STRRuleBinds.RBind3 == 17)
	SBDpadNum1 = (STRSingleBinds.SBind1 == 10 or STRSingleBinds.SBind1 == 11 or STRSingleBinds.SBind1 == 12 or STRSingleBinds.SBind1 == 13)
	SBDpadNum2 = (STRSingleBinds.SBind2 == 10 or STRSingleBinds.SBind2 == 11 or STRSingleBinds.SBind2 == 12 or STRSingleBinds.SBind2 == 13)
	SBDpadNum3 = (STRSingleBinds.SBind3 == 10 or STRSingleBinds.SBind3 == 11 or STRSingleBinds.SBind3 == 12 or STRSingleBinds.SBind3 == 13)
	SBCStickNum1 = (STRSingleBinds.SBind1 == 14 or STRSingleBinds.SBind1 == 15 or STRSingleBinds.SBind1 == 16 or STRSingleBinds.SBind1 == 17)
	SBCStickNum2 = (STRSingleBinds.SBind2 == 14 or STRSingleBinds.SBind2 == 15 or STRSingleBinds.SBind2 == 16 or STRSingleBinds.SBind2 == 17)
	SBCStickNum3 = (STRSingleBinds.SBind3 == 14 or STRSingleBinds.SBind3 == 15 or STRSingleBinds.SBind3 == 16 or STRSingleBinds.SBind3 == 17)
	
	if (STRMenuBinds.MBind1 == 1 and STRMenuBinds.MBind2 == 1 and STRMenuBinds.MBind3 == 1) 
	or (MBDpadNum1 and MBDpadNum2 and MBDpadNum3) or (MBCStickNum1 and MBCStickNum2 and MBCStickNum3)
	or (MBDpadNum1 and MBDpadNum2) or (MBDpadNum2 and MBDpadNum3) or (MBDpadNum1 and MBDpadNum3) 
	or (MBCStickNum1 and MBCStickNum2) or (MBCStickNum2 and MBCStickNum3) or (MBCStickNum1 and MBCStickNum3) then
	STRMenuBindsFS = true
	else
	STRMenuBindsFS = false
	end
	if (STRRuleBinds.RBind1 == 1 and STRRuleBinds.RBind2 == 1 and STRRuleBinds.RBind3 == 1) 
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
	Short_Star = SOUND_GENERAL_SHORT_STAR
	
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

if STRGST.STRGameMode == 1 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 and STRGST.InteractionCheck == false
and ((#STRPluginRuns == 0 and STRGST.STRPluginsTypes == 0) or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes ~= 0 and STRGST.STRPluginsCheck == true)) then
STRMenuDisplay = false
if STRGST.VanillaCG == true and STRGST.SwitchIntro == true then STRGST.STRGameState = "Started" else STRGST.STRGameState = "Preparing" end
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" end
elseif AButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby") 
or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes == 0 and STRGST.STRPluginsCheck == false) or STRGST.STRGameState == "Preparing" or STRGST.STRGameState == "Finished"
or (STRGST.STRGameState == "Lobby" and STRGST.InteractionCheck == true)) then 
play_sound(Camera_Buzz, CameraObject) 
end
if YButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 and STRGST.VanillaCG == true and STRGST.STRGameState == "Lobby" then play_sound(File_Select, CameraObject)
if STRGST.SwitchIntro == false then STRGST.SwitchIntro = true elseif STRGST.SwitchIntro == true then STRGST.SwitchIntro = false end
elseif YButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 and STRGST.VanillaCG == true and STRGST.STRGameState ~= "Lobby")) then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 2 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 and STRGST.InteractionCheck == false
and ((#STRPluginRuns == 0 and STRGST.STRPluginsTypes == 0) or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes ~= 0 and STRGST.STRPluginsCheck == true)) then
STRMenuDisplay = false STRGST.STRGameState = "Started"
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" STRMenuDisplay = false end
elseif AButton and ((MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and STRGST.STRGameState == "Lobby") or (#STRPluginRuns ~= 0 and STRGST.STRPluginsTypes == 0 and STRGST.STRPluginsCheck == false) 
or STRGST.STRGameState == "Finished" or (STRGST.STRGameState == "Lobby" and STRGST.InteractionCheck == true)) then 
play_sound(Camera_Buzz, CameraObject) 
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 3 then
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" and STRGST.STRGlobalTimer == 0 then
STRMenuDisplay = false STRGST.STRGameState = "Started" STRGST.CasualGM = "Enabled"
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGlobalTimer ~= 0 and (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Paused") then
play_sound(File_Select, CameraObject)
if STRGST.STRGameState ~= "Paused" then STRGST.STRGameState = "Paused" elseif STRGST.STRGameState == "Paused" then STRGST.STRGameState = "Started" STRMenuDisplay = false end
elseif AButton and STRGST.STRGameState == "Finished" then 
play_sound(Camera_Buzz, CameraObject) 
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" play_sound(castle_warp, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end

if YButton and MenuLROption == 2 and MenuUDOption == 1 and (STRGST.STRGlobalTimer ~= 0 or STRGST.STRGameState == "Finished") then STRGST.STRGameState = "Resetting" STRGST.CasualGM = "Disabled" play_sound(castle_warp, CameraObject)
elseif YButton and MenuLROption == 2 and MenuUDOption == 1 and STRGST.STRGlobalTimer == 0 then play_sound(Camera_Buzz, CameraObject) end
end

if STRGST.STRGameMode == 4 then
if AButton and MenuLROption == 2 and MenuUDOption == 1 then play_sound(Camera_Buzz, CameraObject) end
end
if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRGST.STRGameMode == 4 then STRMenuTitleName = "MDSingle" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end

if AButton and MenuLROption == 3 and MenuUDOption == 1 and STRGST.STRGameState == "Lobby" then STRMenuTitleName = "MDSave" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuLROption == 3 and MenuUDOption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
if AButton and MenuLROption == 1 and MenuUDOption == 2 and STRGST.STRGameState == "Lobby" then STRMenuTitleName = "MDSettings" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuLROption == 1 and MenuUDOption == 2 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
if AButton and MenuLROption == 2 and MenuUDOption == 2 then STRMenuTitleName = "MDServer" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject) end
if AButton and MenuLROption == 3 and MenuUDOption == 2 and STRGST.STRGameMode ~= 4 then STRMenuTitleName = "MDRuns" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Appear_Message, CameraObject)
elseif AButton and MenuLROption == 3 and MenuUDOption == 2 and STRGST.STRGameMode == 4 then play_sound(Camera_Buzz, CameraObject) end
if network_is_server() then
if XButton then STRMenuTitleName = "MDConfig" MenuLROption = 1 MenuUDOption = 1 MenuButtonsDeplay = 10 play_sound(Reverse_Pause, CameraObject) end
if RTrigger then MenuButtonsDeplay = 100 djui_open_pause_menu() end
if charSelectExists then if ZTrigger then MenuButtonsDeplay = 100 charSelect.set_menu_open() end end
end
end
end

if STRMenuTitleName == "MDSave" and MenuButtonsDeplay == 0 then
if MenuSelectedOption == "Main" then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 3 then MenuUDOption = MenuUDOption + 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 3 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 2 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuUDOption == 1 and MenuLROption == 1 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "MipsStars" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end
if AButton and MenuUDOption == 2 and MenuLROption == 1 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "ToadStars" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end
if AButton and MenuUDOption == 3 and MenuLROption == 1 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "CapSwitches" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end

if AButton and MenuUDOption == 1 and MenuLROption == 2 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "StarDoors" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end
if AButton and MenuUDOption == 2 and MenuLROption == 2 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "BowserKeys" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end
if AButton and MenuUDOption == 3 and MenuLROption == 2 and MenuSelectedOption == "Main" then 
if MenuSelectedOption == "Main" then MenuSelectedOption = "SFExtras" end play_sound(Read_Sign, CameraObject) MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 end

if XButton and MenuSelectedOption == "Main" then 
if STRFlagFailSafe == true then str_save_flag_failsafe() elseif STRFlagFailSafe == false then STRFlagFailSafe = true str_save_flag_prev() end play_sound(Short_Star, CameraObject)
elseif XButton and MenuSelectedOption ~= "Main" then play_sound(Camera_Buzz, CameraObject)
end
if ZTrigger and MenuSelectedOption == "Main" then MenuSelectedOption = "EraseSave" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) end
end
if XButton and MenuSelectedOption ~= "Main" then play_sound(Camera_Buzz, CameraObject) end
if ZTrigger and MenuSelectedOption ~= "Main" then play_sound(Camera_Buzz, CameraObject) end

if MenuSelectedOption == "MipsStars" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuLROption == 1 and STRSFlagsUpdater.Mips1 == true then
if STRGST.SFSMipsStar1 == false then STRGST.SFSMipsStar1 = true
elseif STRGST.SFSMipsStar1 == true then STRGST.SFSMipsStar1 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and STRSFlagsUpdater.Mips1 == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and STRSFlagsUpdater.Mips2 == true then
if STRGST.SFSMipsStar2 == false then STRGST.SFSMipsStar2 = true
elseif STRGST.SFSMipsStar2 == true then STRGST.SFSMipsStar2 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and STRSFlagsUpdater.Mips2 == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 1 MenuLROption = 1 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if MenuSelectedOption == "ToadStars" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuLROption == 1 and STRSFlagsUpdater.Toad1 == true then
if STRGST.SFSToadStar1 == false then STRGST.SFSToadStar1 = true
elseif STRGST.SFSToadStar1 == true then STRGST.SFSToadStar1 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and STRSFlagsUpdater.Mips2 == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and STRSFlagsUpdater.Toad2 == true then
if STRGST.SFSToadStar2 == false then STRGST.SFSToadStar2 = true
elseif STRGST.SFSToadStar2 == true then STRGST.SFSToadStar2 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and STRSFlagsUpdater.Toad2 == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 3 and STRSFlagsUpdater.Toad3 == true then
if STRGST.SFSToadStar3 == false then STRGST.SFSToadStar3 = true
elseif STRGST.SFSToadStar3 == true then STRGST.SFSToadStar3 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and STRSFlagsUpdater.Toad3 == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 2 MenuLROption = 1 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if MenuSelectedOption == "CapSwitches" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuLROption == 1 and STRSFlagsUpdater.WC == true then
if STRGST.SFSWingCap == false then STRGST.SFSWingCap = true
elseif STRGST.SFSWingCap == true then STRGST.SFSWingCap = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and STRSFlagsUpdater.WC == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and STRSFlagsUpdater.MC == true then
if STRGST.SFSMetalCap == false then STRGST.SFSMetalCap = true
elseif STRGST.SFSMetalCap == true then STRGST.SFSMetalCap = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and STRSFlagsUpdater.MC == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 3 and STRSFlagsUpdater.VC == true then
if STRGST.SFSVanishCap == false then STRGST.SFSVanishCap = true
elseif STRGST.SFSVanishCap == true then STRGST.SFSVanishCap = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and STRSFlagsUpdater.VC == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 3 MenuLROption = 1 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if MenuSelectedOption == "StarDoors" and MenuButtonsDeplay == 0 then
if MenuLROption ~= 5 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 2 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 2 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) end
end
end

if MenuLROption == 5 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuLROption = 4 MenuUDOption = 2 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 2 then MenuLROption = 4 MenuUDOption = 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 2 then MenuLROption = 4 MenuUDOption = 2 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuLROption = 4 MenuUDOption = 2 play_sound(Next_Page, CameraObject) end
end
end

if MenuUDOption == 1 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 5 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 5 play_sound(Next_Page, CameraObject) end
end
end

if MenuUDOption == 2 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end
end
end

if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRSFlagsUpdater.D50 == true then
if STRGST.SFS50StarDoor == false then STRGST.SFS50StarDoor = true
elseif STRGST.SFS50StarDoor == true then STRGST.SFS50StarDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and STRSFlagsUpdater.D50 == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and STRSFlagsUpdater.BM == true then
if STRGST.SFSBasementDoor == false then STRGST.SFSBasementDoor = true
elseif STRGST.SFSBasementDoor == true then STRGST.SFSBasementDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRSFlagsUpdater.BM == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 3 and MenuUDOption == 1 and STRSFlagsUpdater.US == true then
if STRGST.SFSUpstairsDoor == false then STRGST.SFSUpstairsDoor = true
elseif STRGST.SFSUpstairsDoor == true then STRGST.SFSUpstairsDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and MenuUDOption == 1 and STRSFlagsUpdater.US == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 4 and MenuUDOption == 1 and STRSFlagsUpdater.BDW == true then
if STRGST.SFSBITDWDoor == false then STRGST.SFSBITDWDoor = true
elseif STRGST.SFSBITDWDoor == true then STRGST.SFSBITDWDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 4 and MenuUDOption == 1 and STRSFlagsUpdater.BDW == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 5 and MenuUDOption == 1 and STRSFlagsUpdater.BFS == true then
if STRGST.SFSBITFSDoor == false then STRGST.SFSBITFSDoor = true
elseif STRGST.SFSBITFSDoor == true then STRGST.SFSBITFSDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 5 and MenuUDOption == 1 and STRSFlagsUpdater.BFS == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 1 and MenuUDOption == 2 and STRSFlagsUpdater.WF == true then
if STRGST.SFSWFDoor == false then STRGST.SFSWFDoor = true
elseif STRGST.SFSWFDoor == true then STRGST.SFSWFDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and MenuUDOption == 2 and STRSFlagsUpdater.WF == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and MenuUDOption == 2 and STRSFlagsUpdater.PSS == true then
if STRGST.SFSPSSDoor == false then STRGST.SFSPSSDoor = true
elseif STRGST.SFSPSSDoor == true then STRGST.SFSPSSDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and MenuUDOption == 2 and STRSFlagsUpdater.PSS == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 3 and MenuUDOption == 2 and STRSFlagsUpdater.JRB == true then
if STRGST.SFSJRBDoor == false then STRGST.SFSJRBDoor = true
elseif STRGST.SFSJRBDoor == true then STRGST.SFSJRBDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and MenuUDOption == 2 and STRSFlagsUpdater.JRB == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 4 and MenuUDOption == 2 and STRSFlagsUpdater.CCM == true then
if STRGST.SFSCCMDoor == false then STRGST.SFSCCMDoor = true
elseif STRGST.SFSCCMDoor == true then STRGST.SFSCCMDoor = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 4 and MenuUDOption == 2 and STRSFlagsUpdater.CCM == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 1 MenuLROption = 2 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if MenuSelectedOption == "BowserKeys" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if AButton and MenuLROption == 1 and STRSFlagsUpdater.Key1 == true then
if STRGST.SFSKey1 == false then STRGST.SFSKey1 = true
elseif STRGST.SFSKey1 == true then STRGST.SFSKey1 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and STRSFlagsUpdater.Key1 == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and STRSFlagsUpdater.Key2 == true then
if STRGST.SFSKey2 == false then STRGST.SFSKey2 = true
elseif STRGST.SFSKey2 == true then STRGST.SFSKey2 = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and STRSFlagsUpdater.Key2 == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 2 MenuLROption = 2 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
end

if MenuSelectedOption == "SFExtras" and MenuButtonsDeplay == 0 then
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

if AButton and MenuLROption == 1 and MenuUDOption == 1 and STRSFlagsUpdater.DDD == true then
if STRGST.SFSDDDMovedBack == false then STRGST.SFSDDDMovedBack = true
elseif STRGST.SFSDDDMovedBack == true then STRGST.SFSDDDMovedBack = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and MenuUDOption == 1 and STRSFlagsUpdater.DDD == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and MenuUDOption == 1 and STRSFlagsUpdater.MD == true then
if STRGST.SFSMoatDrain == false then STRGST.SFSMoatDrain = true
elseif STRGST.SFSMoatDrain == true then STRGST.SFSMoatDrain = false end play_sound(Change_Select, CameraObject)
elseif AButton and MenuLROption == 2 and MenuUDOption == 1 and STRSFlagsUpdater.MD == false then play_sound(Camera_Buzz, CameraObject) 
end

if AButton and MenuLROption == 3 and MenuUDOption == 1 and STRSFlagsUpdater.CG == true then
if STRGST.SFSCapGround == false then STRGST.SFSCapGround = true
elseif STRGST.SFSCapGround == true then STRGST.SFSCapGround = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and MenuUDOption == 1 and STRSFlagsUpdater.CG == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 1 and MenuUDOption == 2 and STRSFlagsUpdater.CK == true then
if STRGST.SFSCapKlepto == false then STRGST.SFSCapKlepto = true
elseif STRGST.SFSCapKlepto == true then STRGST.SFSCapKlepto = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 1 and MenuUDOption == 2 and STRSFlagsUpdater.CK == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 2 and MenuUDOption == 2 and STRSFlagsUpdater.CU == true then
if STRGST.SFSCapUkiki == false then STRGST.SFSCapUkiki = true
elseif STRGST.SFSCapUkiki == true then STRGST.SFSCapUkiki = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 2 and MenuUDOption == 2 and STRSFlagsUpdater.CU == false then play_sound(Camera_Buzz, CameraObject)
end

if AButton and MenuLROption == 3 and MenuUDOption == 2 and STRSFlagsUpdater.CMB == true then
if STRGST.SFSCapBlizzard == false then STRGST.SFSCapBlizzard = true
elseif STRGST.SFSCapBlizzard == true then STRGST.SFSCapBlizzard = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuLROption == 3 and MenuUDOption == 2 and STRSFlagsUpdater.CMB == false then play_sound(Camera_Buzz, CameraObject)
end

if BButton then MenuSelectedOption = "Main" MenuUDOption = 3 MenuLROption = 2 MenuButtonsDeplay = 10 play_sound(Exit_Sign, CameraObject) end
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
if (MDGRightStick or DpadRight) then  
if STRGMOption < 4 then STRGMOption = STRGMOption + 1 play_sound(Next_Page, CameraObject) 
elseif STRGMOption > 3 then STRGMOption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and STRGST.STRGameState == "Lobby" then  
if STRGMOption > 1 then STRGMOption = STRGMOption - 1 play_sound(Next_Page, CameraObject) 
elseif STRGMOption < 2 then STRGMOption = 4 play_sound(Next_Page, CameraObject) end
end
end

if MenuUDOption == 2 then
if (MDGRightStick or DpadRight) then 
if STRSTOption < 4 then STRSTOption = STRSTOption + 1 play_sound(Next_Page, CameraObject) 
elseif STRSTOption > 3 then STRSTOption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if STRSTOption > 1 then STRSTOption = STRSTOption - 1 play_sound(Next_Page, CameraObject)
elseif STRSTOption < 2 then STRSTOption = 4 play_sound(Next_Page, CameraObject) end
end
end

if MenuUDOption == 3 then
if (MDGRightStick or DpadRight) then 
if STRGST.STRCDNumber < 99 then STRGST.STRCDNumber = STRGST.STRCDNumber + 1 play_sound(Next_Page, CameraObject) 
elseif STRGST.STRCDNumber > 3 then STRGST.STRCDNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if STRGST.STRCDNumber > 1 then STRGST.STRCDNumber = STRGST.STRCDNumber - 1 play_sound(Next_Page, CameraObject)
elseif STRGST.STRCDNumber < 2 then STRGST.STRCDNumber = 99 play_sound(Next_Page, CameraObject) end
end

if AButton then STR_Save("STRCDNum", tostring(STRGST.STRCDNumber)) play_sound(Star_Appear, CameraObject) STRGST.STRCountdown = STRGST.STRCDNumber end
end

if AButton and MenuUDOption == 1 and STRGST.InteractionCheck == false then STRGST.STRGameMode = STRGMOption STR_Save("STRGM", tostring(STRGST.STRGameMode)) play_sound(Star_Appear, CameraObject)
STRGST.STRGameState = "Resetting"
if AButton and MenuUDOption == 1 and STRGST.STRGameMode == 3 then STRGST.CasualGM = "Enabled" STRMenuDisplay = false STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 1
elseif AButton and MenuUDOption == 1 and STRGST.STRGameMode ~= 3 then STRGST.CasualGM = "Disabled" end
elseif AButton and MenuUDOption == 1 and STRGST.InteractionCheck == true then play_sound(Camera_Buzz, CameraObject)
STR_Save("STRCasualOption", tostring(STRGST.CasualGM)) end

if AButton and MenuUDOption == 2 then STRGST.STRStartingType = STRSTOption STR_Save("STRSType", tostring(STRGST.STRStartingType)) play_sound(Star_Appear, CameraObject) end

if AButton and MenuUDOption == 4 then 
if STRGST.STRFinishGameWarp == "Disabled" then STRGST.STRFinishGameWarp = "Enabled" elseif STRGST.STRFinishGameWarp == "Enabled" then STRGST.STRFinishGameWarp = "Disabled" end
STR_Save("STRFGWarp", tostring(STRGST.STRFinishGameWarp)) play_sound(Star_Appear, CameraObject) 
end

if AButton and MenuUDOption == 5 then 
if STRGST.STRBSFOption == "Disabled" then STRGST.STRBSFOption = "Enabled" elseif STRGST.STRBSFOption == "Enabled" then STRGST.STRBSFOption = "Disabled" end
STR_Save("STRBackupOption", tostring(STRGST.STRBSFOption)) play_sound(Star_Appear, CameraObject) end

if YButton and MenuUDOption == 5 and STRGST.STRBSFOption == "Enabled" then 
if STRGST.STRBackupSF == false then STRGST.STRBackupSF = true STRGST.STRSFUpdater = false 
elseif STRGST.STRBackupSF == true then STRGST.STRBackupSF = false STRGST.STRSFUpdater = false end play_sound(Change_Select, CameraObject) 
elseif YButton and MenuUDOption == 5 and STRGST.STRBSFOption == "Disabled" then play_sound(Camera_Buzz, CameraObject) end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 2 play_sound(Disappear_Message, CameraObject) end
end

if STRMenuTitleName == "MDSettings" and MenuViewHostCheck == true then 
if BButton then STRMenuTitleName = "MDConfigVH" MenuUDOption = 1 MenuButtonsDeplay = 10 MenuViewHostCheck = false play_sound(Disappear_Message, CameraObject) end end

if STRMenuTitleName == "MDServer" and MenuButtonsDeplay == 0 and MenuViewHostCheck == false then
if MenuSelectedOption == "Main" then

if MenuLROption == 1 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 4 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 4 play_sound(Next_Page, CameraObject) end
end
end

if MenuLROption == 2 then
if (MDGUpStick or DpadUp) then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 4 then MenuUDOption = MenuUDOption + 3 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) then 
if MenuUDOption < 4 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 3 play_sound(Next_Page, CameraObject) end
end
end

if (MDGRightStick or DpadRight) then 
if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) then 
if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end
end

if MenuUDOption == 5 and MenuLROption == 2 then
MenuUDOption = 4
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
elseif AButton and STRGST.STRGameState ~= "Lobby"then play_sound(Camera_Buzz, CameraObject) end

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
if STRGST.InteractionCheck == false then STRGST.InteractionCheck = true 
elseif STRGST.InteractionCheck == true then STRGST.InteractionCheck = false end play_sound(Change_Select, CameraObject) 
elseif AButton and MenuUDOption == 1 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if MenuLROption == 2 then
if AButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRLevelUpdater = 3 play_sound(Change_Select, CameraObject) 
elseif AButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if BButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRSpotUpdater = 3 play_sound(Change_Select, CameraObject)
elseif BButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if YButton and STRGST.STRGameState == "Lobby" then 
STRGST.STRSpotUpdater = 3 if STRGST.STRWarpType == "Level" then warp_to_level(STRGST.STRLevelID, STRGST.STRAreaID, STRGST.STRActID) else warp_to_start_level() end
elseif YButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
end

if (RTrigger or LTrigger) and STRGST.STRGameState == "Lobby" and FreezePlayer == false then 
FreezePlayer = true play_sound(Change_Select, CameraObject)
elseif (RTrigger or LTrigger) and STRGST.STRGameState == "Lobby" and FreezePlayer == true then 
FreezePlayer = false play_sound(Change_Select, CameraObject)
elseif (RTrigger or LTrigger) and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) 
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
if STRLocationSpot == "Ground" then STRLocationSpot = "Air" elseif STRLocationSpot == "Air" then STRLocationSpot = "Ground" end 
STR_Save("STRLSpot", tostring(STRLocationSpot)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 2 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 3 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRForceLevelType == "Levels" then STRGST.STRForceLevelType = "Areas" elseif STRGST.STRForceLevelType == "Areas" then STRGST.STRForceLevelType = "Acts"
elseif STRGST.STRForceLevelType == "Acts" then STRGST.STRForceLevelType = "All" elseif STRGST.STRForceLevelType == "All" then STRGST.STRForceLevelType = "Levels" end 
STR_Save("STRFLType", tostring(STRGST.STRForceLevelType)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 3 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 4 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRWarpType == "Level" then STRGST.STRWarpType = "Start" elseif STRGST.STRWarpType == "Start" then STRGST.STRWarpType = "None"
elseif STRGST.STRWarpType == "None" then STRGST.STRWarpType = "Level" end STR_Save("STRWType", tostring(STRGST.STRWarpType)) play_sound(Star_Appear, CameraObject)
elseif AButton and MenuUDOption == 4 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if AButton and MenuUDOption == 5 and MenuLROption == 1 and STRGST.STRGameState == "Lobby" then 
if STRGST.STRForceSpot == "All" then STRGST.STRForceSpot = "Lobby" elseif STRGST.STRForceSpot == "Lobby" then STRGST.STRForceSpot = "Start" elseif STRGST.STRForceSpot == "Start" then STRGST.STRForceSpot = "Controller" 
elseif STRGST.STRForceSpot == "Controller" then STRGST.STRForceSpot = "TimeStop" elseif STRGST.STRForceSpot == "TimeStop" then STRGST.STRForceSpot = "None" elseif STRGST.STRForceSpot == "None" then STRGST.STRForceSpot = "All" end
STR_Save("STRFSpot", tostring(STRGST.STRForceSpot)) play_sound(Star_Appear, CameraObject) 
elseif AButton and MenuUDOption == 5 and MenuLROption == 1 and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if ZTrigger and STRGST.STRGameState == "Lobby" then MenuSelectedOption = "EraseLobby" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) 
elseif ZTrigger and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end

if BButton and MenuLROption == 1 then STRMenuTitleName = "MDRuns" MenuLROption = 1 MenuUDOption = 1 play_sound(Disappear_Message, CameraObject) end
end

if MenuSelectedOption == "EraseLobby" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject)
STRLocationSpot = "Ground" 
STRGST.STRForceLevelType = "Levels"
STRGST.STRWarpType = "Start"
STRGST.STRForceSpot = "Start"
STR_Remove("STRLSpot")
STR_Remove("STRFLType")
STR_Remove("STRWType")
STR_Remove("STRFSpot")
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
if STRSSLevelMenu < 35 then STRSSLevelMenu = STRSSLevelMenu + 1 play_sound(Next_Page, CameraObject) elseif STRSSLevelMenu > 2 then STRSSLevelMenu = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRSSLevelMenu > 1 then STRSSLevelMenu = STRSSLevelMenu - 1 play_sound(Next_Page, CameraObject) elseif STRSSLevelMenu < 2 then STRSSLevelMenu = 35 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRSSAreaMenu < 16 then STRSSAreaMenu = STRSSAreaMenu + 1 play_sound(Next_Page, CameraObject) elseif STRSSAreaMenu > 2 then STRSSAreaMenu = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRSSAreaMenu > 1 then STRSSAreaMenu = STRSSAreaMenu - 1 play_sound(Next_Page, CameraObject) elseif STRSSAreaMenu < 2 then STRSSAreaMenu = 16 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRSSActMenu < 8 then STRSSActMenu = STRSSActMenu + 1 play_sound(Next_Page, CameraObject) elseif STRSSActMenu > 2 then STRSSActMenu = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRSSActMenu > 1 then STRSSActMenu = STRSSActMenu - 1 play_sound(Next_Page, CameraObject) elseif STRSSActMenu < 2 then STRSSActMenu = 8 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 4 then 
if STRSSStarMenu < 999 then STRSSStarMenu = STRSSStarMenu + 1 play_sound(Next_Page, CameraObject) elseif STRSSStarMenu > 2 then STRSSStarMenu = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 4 then 
if STRSSStarMenu > 1 then STRSSStarMenu = STRSSStarMenu - 1 play_sound(Next_Page, CameraObject) elseif STRSSStarMenu < 2 then STRSSStarMenu = 999 play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 5 then 
if STRSSTypeMenu < 10 then STRSSTypeMenu = STRSSTypeMenu + 1 play_sound(Next_Page, CameraObject) elseif STRSSTypeMenu > 2 then STRSSTypeMenu = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 5 then 
if STRSSTypeMenu > 1 then STRSSTypeMenu = STRSSTypeMenu - 1 play_sound(Next_Page, CameraObject) elseif STRSSTypeMenu < 2 then STRSSTypeMenu = 10 play_sound(Next_Page, CameraObject) end
end

if AButton then STRGST.STRGameState = "Started" STRGST.STRSSWarp = 3 STRGST.STRSSText = 300 STRMenuDisplay = false
STRGST.STRSSLevelID = STRSSLevelMenu STRGST.STRSSAreaID = STRSSAreaMenu STRGST.STRSSActID = STRSSActMenu STRGST.STRSSSetStars = STRSSStarMenu STRGST.STRSSType = STRSSTypeMenu
STRGST.STRSSCollectedStar = STRGST.STRSSSetStars STRGST.STRGlobalTimer = 0 
end

if BButton then STRMenuTitleName = "MDMain" MenuLROption = 1 MenuUDOption = 1 play_sound(Disappear_Message, CameraObject) end
end

if MenuSelectedOption == "SingleBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRSingleBinds.SBind1 < 17 then STRSingleBinds.SBind1 = STRSingleBinds.SBind1 + 1 play_sound(Next_Page, CameraObject)
elseif STRSingleBinds.SBind1 > 1 then STRSingleBinds.SBind1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRSingleBinds.SBind1 > 1 then STRSingleBinds.SBind1 = STRSingleBinds.SBind1 - 1 play_sound(Next_Page, CameraObject) 
elseif STRSingleBinds.SBind1 < 17 then STRSingleBinds.SBind1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRSingleBinds.SBind2 < 17 then STRSingleBinds.SBind2 = STRSingleBinds.SBind2 + 1 play_sound(Next_Page, CameraObject) 
elseif STRSingleBinds.SBind2 > 1 then STRSingleBinds.SBind2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRSingleBinds.SBind2 > 1 then STRSingleBinds.SBind2 = STRSingleBinds.SBind2 - 1 play_sound(Next_Page, CameraObject) 
elseif STRSingleBinds.SBind2 < 17 then STRSingleBinds.SBind2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRSingleBinds.SBind3 < 17 then STRSingleBinds.SBind3 = STRSingleBinds.SBind3 + 1 play_sound(Next_Page, CameraObject) 
elseif STRSingleBinds.SBind3 > 1 then STRSingleBinds.SBind3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRSingleBinds.SBind3 > 1 then STRSingleBinds.SBind3 = STRSingleBinds.SBind3 - 1 play_sound(Next_Page, CameraObject) 
elseif STRSingleBinds.SBind3 < 17 then STRSingleBinds.SBind3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRSingleBinds.SBind1 = math.random(17) STRSingleBinds.SBind2 = math.random(17) STRSingleBinds.SBind3 = math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRSingleBindsFS == false then
STR_Save("STRSBinds", string.format("%d_%d_%d", STRMenuBinds.MBind1, STRMenuBinds.MBind2, STRMenuBinds.MBind3)) play_sound(Star_Appear, CameraObject)
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
if charSelectExists then if ZTrigger then MenuButtonsDeplay = 100 charSelect.set_menu_open() end end
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

if BButton then STRMenuTitleName = "MDConfig" MenuLROption = 1 MenuUDOption = 1 MenuPageLRDisplay = 1 MenuPageUDDisplay = 1 play_sound(Disappear_Message, CameraObject) end
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
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 5 then MenuUDOption = MenuUDOption + 5 MenuPageUDDisplay = 2 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 5 MenuPageUDDisplay = 2 play_sound(Next_Page, CameraObject) end
end

if (MDGUpStick or DpadUp) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if MenuUDOption > 1 then MenuUDOption = MenuUDOption - 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption < 4 then MenuUDOption = MenuUDOption + 4 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGDownStick or DpadDown) and MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if MenuUDOption < 5 then MenuUDOption = MenuUDOption + 1 play_sound(Next_Page, CameraObject) elseif MenuUDOption > 1 then MenuUDOption = MenuUDOption - 4 MenuPageUDDisplay = 1 play_sound(Next_Page, CameraObject) end
end

if MenuPageLRDisplay == 1 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 then 
if STRFTMNumber < #STRFontsTable then STRFTMNumber = STRFTMNumber + 1 play_sound(Next_Page, CameraObject) 
elseif STRFTMNumber > 2 then STRFTMNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 then 
if STRFTMNumber > 1 then STRFTMNumber = STRFTMNumber - 1 play_sound(Next_Page, CameraObject) 
elseif STRFTMNumber < 2 then STRFTMNumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRFCDNumber < #STRFontsTable then STRFCDNumber = STRFCDNumber + 1 play_sound(Next_Page, CameraObject) 
elseif STRFCDNumber > 2 then STRFCDNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRFCDNumber > 1 then STRFCDNumber = STRFCDNumber - 1 play_sound(Next_Page, CameraObject) 
elseif STRFCDNumber < 2 then STRFCDNumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 then 
if STRFGONumber < #STRFontsTable then STRFGONumber = STRFGONumber + 1 play_sound(Next_Page, CameraObject) elseif STRFGONumber > 2 then STRFGONumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 then 
if STRFGONumber > 1 then STRFGONumber = STRFGONumber - 1 play_sound(Next_Page, CameraObject) elseif STRFGONumber < 2 then STRFGONumber = #STRFontsTable play_sound(Next_Page, CameraObject) end
end

if YButton then STRFTMNumber = math.random(#STRFontsTable) STRFCDNumber = math.random(#STRFontsTable) STRFGONumber = math.random(#STRFontsTable) play_sound(castle_warp2, CameraObject) end
if AButton then play_sound(Star_Appear, CameraObject) 
STR_Save("STRFontTM", STRFontsTable[STRFTMNumber].str_font_id) 
STR_Save("STRFontCD", STRFontsTable[STRFCDNumber].str_font_id)
STR_Save("STRFontGO", STRFontsTable[STRFGONumber].str_font_id)
end

if XButton and MenuUDOption == 2 and STRGST.STRGameState == "Lobby" and STRShowGoFont == "Disabled" then 
if STRShowCDFont == "Disabled" then STRShowCDFont = "Enabled" elseif STRShowCDFont == "Enabled" then STRShowCDFont = "Disabled" end STR_Save("STRShowCountdown", STRShowCDFont) play_sound(Star_Appear, CameraObject)
elseif XButton and MenuUDOption == 2 and (STRGST.STRGameState ~= "Lobby" or STRShowGoFont == "Enabled") then play_sound(Camera_Buzz, CameraObject) end

if XButton and MenuUDOption == 3 and STRGST.STRGameState == "Lobby" and STRShowCDFont == "Disabled" then 
if STRShowGoFont == "Disabled" then STRShowGoFont = "Enabled" elseif STRShowGoFont == "Enabled" then STRShowGoFont = "Disabled" end STR_Save("STRShowGo", STRShowGoFont) play_sound(Star_Appear, CameraObject)
elseif XButton and MenuUDOption == 3 and (STRGST.STRGameState ~= "Lobby" or STRShowCDFont == "Enabled") then play_sound(Camera_Buzz, CameraObject) end
end

if MenuPageLRDisplay == 2 then
if (MDGRightStick or DpadRight) and MenuUDOption == 1 and #STRFanfareTable ~= 1 then 
if STRSFFNumber < #STRFanfareTable then STRSFFNumber = STRSFFNumber + 1 play_sound(Next_Page, CameraObject) elseif STRSFFNumber > 2 then STRSFFNumber = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and MenuUDOption == 1 and #STRFanfareTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 1 and #STRFanfareTable ~= 1 then 
if STRSFFNumber > 1 then STRSFFNumber = STRSFFNumber - 1 play_sound(Next_Page, CameraObject) elseif STRSFFNumber < 2 then STRSFFNumber = #STRFanfareTable play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and MenuUDOption == 1 and #STRFanfareTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGRightStick or DpadRight) and MenuUDOption == 2 then 
if STRSCDNumber < #STRCountdownTable then STRSCDNumber = STRSCDNumber + 1 play_sound(Next_Page, CameraObject) 
elseif STRSCDNumber > 2 then STRSCDNumber = 1 play_sound(Next_Page, CameraObject) end
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 2 then 
if STRSCDNumber > 1 then STRSCDNumber = STRSCDNumber - 1 play_sound(Next_Page, CameraObject) 
elseif STRSCDNumber < 2 then STRSCDNumber = #STRCountdownTable play_sound(Next_Page, CameraObject) end
end

if (MDGRightStick or DpadRight) and MenuUDOption == 3 and #STRGoTable ~= 1 then 
if STRSGONumber < #STRGoTable then STRSGONumber = STRSGONumber + 1 play_sound(Next_Page, CameraObject) elseif STRSGONumber > 2 then STRSGONumber = 1 play_sound(Next_Page, CameraObject) end
elseif (MDGRightStick or DpadRight) and MenuUDOption == 3 and #STRGoTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if (MDGLeftStick or DpadLeft) and MenuUDOption == 3 and #STRGoTable ~= 1 then 
if STRSGONumber > 1 then STRSGONumber = STRSGONumber - 1 play_sound(Next_Page, CameraObject) elseif STRSGONumber < 2 then STRSGONumber = #STRGoTable play_sound(Next_Page, CameraObject) end
elseif (MDGLeftStick or DpadLeft) and MenuUDOption == 3 and #STRGoTable == 1 then play_sound(Camera_Buzz, CameraObject) 
end

if XButton and MenuUDOption == 1 then 
if STRSFFNumber == 1 then play_race_fanfare() elseif STRSFFNumber ~= 1 then STRPlaySound = true end end
if XButton and MenuUDOption == 2 then
if STRSCDNumber < 6 then play_sound(STRCountdownTable[STRSCDNumber].str_countdown_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject) elseif STRSCDNumber > 5 then STRPlaySound = true end end
if XButton and MenuUDOption == 3 then 
if STRSGONumber == 1 then play_sound(STRGoTable[STRSGONumber].str_go_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject) elseif STRSGONumber ~= 1 then STRPlaySound = true end end

if YButton then STRSFFNumber = math.random(#STRFanfareTable) STRSCDNumber = math.random(#STRCountdownTable) STRSGONumber = math.random(#STRGoTable) play_sound(castle_warp2, CameraObject) end
if AButton then play_sound(Star_Appear, CameraObject)
STR_Save("STRFanfare", STRFanfareTable[STRSFFNumber].str_fanfare_id) 
STR_Save("STRCountdown", STRCountdownTable[STRSCDNumber].str_countdown_id) 
STR_Save("STRGo", STRGoTable[STRSGONumber].str_go_id)
end
end
if ZTrigger then MenuSelectedOption = "EraseSettings" MenuButtonsDeplay = 10 play_sound(Camera_Buzz, CameraObject) end
if BButton then STRMenuTitleName = "MDConfig" MenuLROption = 3 MenuUDOption = 1 MenuPageLRDisplay = 1 MenuPageUDDisplay = 1 play_sound(Disappear_Message, CameraObject) end

if MenuPageLRDisplay == 3 then
if YButton and MenuSelectedOption == "Main" then play_sound(Camera_Buzz, CameraObject) end
if AButton and MenuUDOption == 1 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "FontColors" end
if AButton and MenuUDOption == 2 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "RectColors" end
if AButton and MenuUDOption == 3 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "MenuColors" end
if AButton and MenuUDOption == 4 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "FontPosition" end
end
if MenuPageLRDisplay == 4 then 
if YButton and STRGST.STRGameState == "Lobby" then
if STRMenuWarpType ~= "None" then STRMenuWarp = true play_sound(castle_warp, CameraObject) end
elseif YButton and STRGST.STRGameState ~= "Lobby" then play_sound(Camera_Buzz, CameraObject) end
end

if MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
if AButton and MenuUDOption == 1 then 
if STRCustomColors == "Enabled" then STRCustomColors = "Disabled" elseif STRCustomColors == "Disabled" then STRCustomColors = "Enabled" end
STR_Save("STRCColors", tostring(STRCustomColors)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then 
if STRRenderType == "Behind" then STRRenderType = "Front" elseif STRRenderType == "Front" then STRRenderType = "Behind" end
STR_Save("STRRType", tostring(STRRenderType)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then 
if STRHelper == "Enabled" then STRHelper = "Disabled" elseif STRHelper == "Disabled" then STRHelper = "Enabled" end
STR_Save("STRHelperDisplay", tostring(STRHelper)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 4 then 
if STRMenuButtons == "Buttons" then STRMenuButtons = "Commands" elseif STRMenuButtons == "Commands" then STRMenuButtons = "Menu" 
elseif STRMenuButtons == "Menu" then STRMenuButtons = "Both" elseif STRMenuButtons == "Both" then STRMenuButtons = "All" elseif STRMenuButtons == "All" then STRMenuButtons = "Buttons" end
STR_Save("STRMButtons", tostring(STRMenuButtons)) play_sound(Star_Appear, CameraObject) end
if XButton and MenuUDOption == 4 and (STRMenuButtons == "Buttons" or STRMenuButtons == "Both" or STRMenuButtons == "All") then 
MenuSelectedOption = "MenuBinds" play_sound(Read_Sign, CameraObject) end
if AButton and MenuUDOption == 5 then 
if STRRules == "Enabled" then STRRules = "Disabled" elseif STRRules == "Disabled" then STRRules = "Enabled" end
STR_Save("STRRulesDisplay", tostring(STRRules)) play_sound(Star_Appear, CameraObject) end
if XButton and MenuUDOption == 5 and STRRules == "Enabled" then 
MenuSelectedOption = "RulesBinds" play_sound(Read_Sign, CameraObject) end
end

if MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
if AButton and MenuUDOption == 1 then 
if STRRDisplay == "Start" then STRRDisplay = "SS_Lobby" elseif STRRDisplay == "SS_Lobby" then STRRDisplay = "SS_Start" elseif STRRDisplay == "SS_Start" then STRRDisplay = "None" 
elseif STRRDisplay == "None" then STRRDisplay = "Lobby" elseif STRRDisplay == "Lobby" then STRRDisplay = "Start" end
STR_Save("STRRequireDisplay", tostring(STRRDisplay)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 2 then 
if STRMenuWarpType == "Level" then STRMenuWarpType = "Start" elseif STRMenuWarpType == "Start" then STRMenuWarpType = "None"
elseif STRMenuWarpType == "None" then STRMenuWarpType = "Level" end STR_Save("STRMenuWType", tostring(STRMenuWarpType)) play_sound(Star_Appear, CameraObject) end
if AButton and MenuUDOption == 3 then play_sound(Read_Sign, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "BestTime" end
if AButton and MenuUDOption == 4 then play_sound(Appear_Message, CameraObject) MenuButtonsDeplay = 10 MenuUDOption = 1 STRMenuTitleName = "MDConfigVH" end
if AButton and MenuUDOption == 5 then play_sound(Camera_Buzz, CameraObject) MenuButtonsDeplay = 10 MenuSelectedOption = "ClearStorage" end
end
end
if MenuSelectedOption == "ClearStorage" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" str_clear_saves() MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject) end

if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(File_Select, CameraObject) end
end

if MenuSelectedOption == "FontColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRFontColors.STRFR < 255 then STRFontColors.STRFR = STRFontColors.STRFR + 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFR > 0 then STRFontColors.STRFR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRFontColors.STRFR > 0 then STRFontColors.STRFR = STRFontColors.STRFR - 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFR < 255 then STRFontColors.STRFR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRFontColors.STRFG < 255 then STRFontColors.STRFG = STRFontColors.STRFG + 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFG > 0 then STRFontColors.STRFG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRFontColors.STRFG > 0 then STRFontColors.STRFG = STRFontColors.STRFG - 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFG < 255 then STRFontColors.STRFG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRFontColors.STRFB < 255 then STRFontColors.STRFB = STRFontColors.STRFB + 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFB > 0 then STRFontColors.STRFB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRFontColors.STRFB > 0 then STRFontColors.STRFB = STRFontColors.STRFB - 1 play_sound(Next_Page, CameraObject) 
elseif STRFontColors.STRFB < 255 then STRFontColors.STRFB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRFontColors.STRFV < 255 then STRFontColors.STRFV = STRFontColors.STRFV + 1 play_sound(Next_Page, CameraObject)
elseif STRFontColors.STRFV > 0 then STRFontColors.STRFV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRFontColors.STRFV > 0 then STRFontColors.STRFV = STRFontColors.STRFV - 1 play_sound(Next_Page, CameraObject)
elseif STRFontColors.STRFV < 255 then STRFontColors.STRFV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV = math.random(255), math.random(255), math.random(255), math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton then STR_Save("STRFColors", string.format("%d_%d_%d_%d", STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "RectColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRRectColors.STRRR < 255 then STRRectColors.STRRR = STRRectColors.STRRR + 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRR > 0 then STRRectColors.STRRR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRRectColors.STRRR > 0 then STRRectColors.STRRR = STRRectColors.STRRR - 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRR < 255 then STRRectColors.STRRR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRRectColors.STRRG < 255 then STRRectColors.STRRG = STRRectColors.STRRG + 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRG > 0 then STRRectColors.STRRG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRRectColors.STRRG > 0 then STRRectColors.STRRG = STRRectColors.STRRG - 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRG < 255 then STRRectColors.STRRG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRRectColors.STRRB < 255 then STRRectColors.STRRB = STRRectColors.STRRB + 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRB > 0 then STRRectColors.STRRB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRRectColors.STRRB > 0 then STRRectColors.STRRB = STRRectColors.STRRB - 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRB < 255 then STRRectColors.STRRB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRRectColors.STRRV < 255 then STRRectColors.STRRV = STRRectColors.STRRV + 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRV > 0 then STRRectColors.STRRV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRRectColors.STRRV > 0 then STRRectColors.STRRV = STRRectColors.STRRV - 1 play_sound(Next_Page, CameraObject) 
elseif STRRectColors.STRRV < 255 then STRRectColors.STRRV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRRectColors.STRRR, STRRectColors.STRRG, STRRectColors.STRRB, STRRectColors.STRRV = math.random(255), math.random(255), math.random(255), math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton then STR_Save("STRRColors", string.format("%d_%d_%d_%d", STRRectColors.STRRR, STRRectColors.STRRG, STRRectColors.STRRB, STRRectColors.STRRV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "MenuColors" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 4 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 2 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 4 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRMenuColors.STRMR < 255 then STRMenuColors.STRMR = STRMenuColors.STRMR + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMR > 0 then STRMenuColors.STRMR = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRMenuColors.STRMR > 0 then STRMenuColors.STRMR = STRMenuColors.STRMR - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMR < 255 then STRMenuColors.STRMR = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRMenuColors.STRMG < 255 then STRMenuColors.STRMG = STRMenuColors.STRMG + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMG > 0 then STRMenuColors.STRMG = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRMenuColors.STRMG > 0 then STRMenuColors.STRMG = STRMenuColors.STRMG - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMG < 255 then STRMenuColors.STRMG = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRMenuColors.STRMB < 255 then STRMenuColors.STRMB = STRMenuColors.STRMB + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMB > 0 then STRMenuColors.STRMB = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRMenuColors.STRMB > 0 then STRMenuColors.STRMB = STRMenuColors.STRMB - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMB < 255 then STRMenuColors.STRMB = 255 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 4 then if STRMenuColors.STRMV < 255 then STRMenuColors.STRMV = STRMenuColors.STRMV + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMV > 0 then STRMenuColors.STRMV = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 4 then if STRMenuColors.STRMV > 0 then STRMenuColors.STRMV = STRMenuColors.STRMV - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuColors.STRMV < 255 then STRMenuColors.STRMV = 255 play_sound(Next_Page, CameraObject) end end

if YButton then STRMenuColors.STRMR, STRMenuColors.STRMG, STRMenuColors.STRMB, STRMenuColors.STRMV = math.random(255), math.random(255), math.random(255), math.random(255) play_sound(castle_warp2, CameraObject) end
if AButton then STR_Save("STRMColors", string.format("%d_%d_%d_%d", STRMenuColors.STRMR, STRMenuColors.STRMG, STRMenuColors.STRMB, STRMenuColors.STRMV)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "FontPosition" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 2 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 1 then MenuLROption = 2 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRFontPosition.STRCX < 255 then STRFontPosition.STRCX = STRFontPosition.STRCX + 1 play_sound(Next_Page, CameraObject) 
elseif STRFontPosition.STRCX > -255 then STRFontPosition.STRCX = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRFontPosition.STRCX > -255 then STRFontPosition.STRCX = STRFontPosition.STRCX - 1 play_sound(Next_Page, CameraObject) 
elseif STRFontPosition.STRCX < 255 then STRFontPosition.STRCX = 0 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRFontPosition.STRCY < 100 then STRFontPosition.STRCY = STRFontPosition.STRCY + 1 play_sound(Next_Page, CameraObject) 
elseif STRFontPosition.STRCY > -255 then STRFontPosition.STRCY = 0 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRFontPosition.STRCY > -255 then STRFontPosition.STRCY = STRFontPosition.STRCY - 1 play_sound(Next_Page, CameraObject) 
elseif STRFontPosition.STRCY < 100 then STRFontPosition.STRCY = 0 play_sound(Next_Page, CameraObject) end end

if YButton then STRFontPosition.STRCX, STRFontPosition.STRCY = math.random(255) - 255, math.random(255) - 255 play_sound(castle_warp2, CameraObject) end
if AButton then STR_Save("STRFPosition", string.format("%d_%d", STRFontPosition.STRCX, STRFontPosition.STRCY)) play_sound(Star_Appear, CameraObject) end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "MenuBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRMenuBinds.MBind1 < 17 then STRMenuBinds.MBind1 = STRMenuBinds.MBind1 + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuBinds.MBind1 > 1 then STRMenuBinds.MBind1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRMenuBinds.MBind1 > 1 then STRMenuBinds.MBind1 = STRMenuBinds.MBind1 - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuBinds.MBind1 < 17 then STRMenuBinds.MBind1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRMenuBinds.MBind2 < 17 then STRMenuBinds.MBind2 = STRMenuBinds.MBind2 + 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuBinds.MBind2 > 1 then STRMenuBinds.MBind2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRMenuBinds.MBind2 > 1 then STRMenuBinds.MBind2 = STRMenuBinds.MBind2 - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuBinds.MBind2 < 17 then STRMenuBinds.MBind2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRMenuBinds.MBind3 < 17 then STRMenuBinds.MBind3 = STRMenuBinds.MBind3 + 1 play_sound(Next_Page, CameraObject)
elseif STRMenuBinds.MBind3 > 1 then STRMenuBinds.MBind3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRMenuBinds.MBind3 > 1 then STRMenuBinds.MBind3 = STRMenuBinds.MBind3 - 1 play_sound(Next_Page, CameraObject) 
elseif STRMenuBinds.MBind3 < 17 then STRMenuBinds.MBind3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRMenuBinds.MBind1, STRMenuBinds.MBind2, STRMenuBinds.MBind3 = math.random(17), math.random(17), math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRMenuBindsFS == false then
STR_Save("STRMBinds", string.format("%d_%d_%d", STRMenuBinds.MBind1, STRMenuBinds.MBind2, STRMenuBinds.MBind3))
end
if AButton and STRMenuBindsFS == true then play_sound(Camera_Buzz, CameraObject) 
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "RulesBinds" and MenuButtonsDeplay == 0 then
if (MDGRightStick or DpadRight) then if MenuLROption < 3 then MenuLROption = MenuLROption + 1 play_sound(Next_Page, CameraObject) elseif MenuLROption > 1 then MenuLROption = 1 play_sound(Next_Page, CameraObject) end end
if (MDGLeftStick or DpadLeft) then if MenuLROption > 1 then MenuLROption = MenuLROption - 1 play_sound(Next_Page, CameraObject) elseif MenuLROption < 2 then MenuLROption = 3 play_sound(Next_Page, CameraObject) end end

if (MDGUpStick or DpadUp) and MenuLROption == 1 then if STRRuleBinds.RBind1 < 17 then STRRuleBinds.RBind1 = STRRuleBinds.RBind1 + 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind1 > 1 then STRRuleBinds.RBind1 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 1 then if STRRuleBinds.RBind1 > 1 then STRRuleBinds.RBind1 = STRRuleBinds.RBind1 - 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind1 < 17 then STRRuleBinds.RBind1 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 2 then if STRRuleBinds.RBind2 < 17 then STRRuleBinds.RBind2 = STRRuleBinds.RBind2 + 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind2 > 1 then STRRuleBinds.RBind2 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 2 then if STRRuleBinds.RBind2 > 1 then STRRuleBinds.RBind2 = STRRuleBinds.RBind2 - 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind2 < 17 then STRRuleBinds.RBind2 = 17 play_sound(Next_Page, CameraObject) end end
if (MDGUpStick or DpadUp) and MenuLROption == 3 then if STRRuleBinds.RBind3 < 17 then STRRuleBinds.RBind3 = STRRuleBinds.RBind3 + 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind3 > 1 then STRRuleBinds.RBind3 = 1 play_sound(Next_Page, CameraObject) end end
if (MDGDownStick or DpadDown) and MenuLROption == 3 then if STRRuleBinds.RBind3 > 1 then STRRuleBinds.RBind3 = STRRuleBinds.RBind3 - 1 play_sound(Next_Page, CameraObject) 
elseif STRRuleBinds.RBind3 < 17 then STRRuleBinds.RBind3 = 17 play_sound(Next_Page, CameraObject) end end

if YButton then STRRuleBinds.RBind1, STRRuleBinds.RBind2, STRRuleBinds.RBind3 = math.random(17), math.random(17), math.random(17) play_sound(castle_warp2, CameraObject) end
if AButton and STRRulesBindsFS == false then
STR_Save("STRRBinds", string.format("%d_%d_%d", STRRuleBinds.RBind1, STRRuleBinds.RBind2, STRRuleBinds.RBind3))
end
if AButton and STRRulesBindsFS == true then play_sound(Camera_Buzz, CameraObject) 
end
if BButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 MenuLROption = 1 play_sound(Exit_Sign, CameraObject) end
end
if MenuSelectedOption == "EraseSettings" and MenuButtonsDeplay == 0 then
if AButton then MenuSelectedOption = "Main" MenuButtonsDeplay = 10 play_sound(Bowser_Laugh, CameraObject) 
str_remove_saves()
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
elseif STRBestTimeOption == "Saves" then STRBestTimeOption = "Disabled" end STR_Save("STRBestTimeType", tostring(STRBestTimeOption)) play_sound(Star_Appear, CameraObject) end

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