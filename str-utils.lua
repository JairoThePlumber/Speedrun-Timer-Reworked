-- Shortred Functions
STRGST = gGlobalSyncTable
S_Width = djui_hud_get_screen_width
S_Height = djui_hud_get_screen_height
Hud_Color = djui_hud_set_color
Hud_Text = djui_hud_print_text
Hud_Rect = djui_hud_render_rect
Hud_Measure = djui_hud_measure_text
Hud_Tile_Tex = djui_hud_render_texture_tile
Hud_Texture = djui_hud_render_texture
Texture = get_texture_info
STR_Save = mod_storage_save
STR_Load = mod_storage_load
STR_Remove = mod_storage_remove
STR_Clear = mod_storage_clear

-- Global Saves
STRGST.STRFinishGameWarp = STR_Load("STRFGWarp") or "Enabled"
STRGST.STRForceLevelType = STR_Load("STRFLType") or "Levels"
STRGST.STRWarpType = STR_Load("STRWType") or "Start"
STRGST.STRForceSpot = STR_Load("STRFSpot") or "Start"
STRGST.STRBSFOption = STR_Load("STRBackupOption") or "Disabled"
STRGST.CasualGM = STR_Load("STRCasualOption") or "Disabled"

STRGST.STRCDNumber = tonumber(STR_Load("STRCDNum")) or 3
STRGST.STRGameMode = tonumber(STR_Load("STRGM")) or 1
STRGST.STRStartingType = tonumber(STR_Load("STRSType")) or 1

-- Global Functions
STRGST.STRGameState = "Lobby"
STRGST.VanillaCG = false
STRGST.EraseSave = false
STRGST.SwitchIntro = false
STRGST.STRBackupSF = false
STRGST.STRSFUpdater = false
STRGST.STRPluginsCheck = false
STRGST.STRLocationPlugin = false
STRGST.InteractionCheck = false
STRGST.GrandStar = false
STRGST.CakeEnding = false
STRGST.AddRomhack = false
STRGST.SavedBestTime = false
STRGST.WNRCheck = false
STRGST.STRCakeEndingCheck = false

STRGST.SFSMipsStar1 = true
STRGST.SFSMipsStar2 = true
STRGST.SFSToadStar1 = true
STRGST.SFSToadStar2 = true
STRGST.SFSToadStar3 = true
STRGST.SFSWingCap = true
STRGST.SFSMetalCap = true
STRGST.SFSVanishCap = true
STRGST.SFS50StarDoor = true
STRGST.SFSBasementDoor = true
STRGST.SFSUpstairsDoor = true
STRGST.SFSBITDWDoor = true
STRGST.SFSBITFSDoor = true
STRGST.SFSWFDoor = true
STRGST.SFSPSSDoor = true
STRGST.SFSJRBDoor = true
STRGST.SFSCCMDoor = true
STRGST.SFSKey1 = true
STRGST.SFSKey2 = true
STRGST.SFSDDDMovedBack = true
STRGST.SFSMoatDrain = true
STRGST.SFSCapGround = true
STRGST.SFSCapKlepto = true
STRGST.SFSCapUkiki = true
STRGST.SFSCapBlizzard = true

for warpnoderandom in pairs(gActiveMods) do
    if gActiveMods[warpnoderandom].name:find("Warp Node Randomizer") then
        STRGST.WNRCheck = true
		break
    end
end

-- Global Number Functions
STRGST.STRGlobalTimer = 0
STRGST.STRStartingWarp = 0
STRGST.STRIntermission = 5
STRGST.STRSecondsDelay = 0
STRGST.STRCountdown = STRGST.STRCDNumber

STRGST.STRGoText = 0
STRGST.STRFinishText = 12
STRGST.STRWarpCountdown = 6
STRGST.STREraseSaveCD = 4

STRGST.STRIntroAction = 5
STRGST.STRCDSounds = 0
STRGST.STRSetLives = 0
STRGST.STRUpdater = 0
STRGST.STRLevelUpdater = 0
STRGST.STRSpotUpdater = 0
STRGST.STRSavLevelUpdater = 0
STRGST.STRSavSpotUpdater = 0
if STRGST.WNRCheck == true then
STRGST.WarpNodeRandomierDeplay = 0
else
STRGST.WarpNodeRandomierDeplay = 90
end

STRGST.STRLevelID = 0
STRGST.STRCourseID = 0
STRGST.STRAreaID = 0
STRGST.STRActID = 0
STRGST.STRXPos = 0
STRGST.STRYPos = 0
STRGST.STRZPos = 0

STRGST.STRSavLevelID = 0
STRGST.STRSavCourseID = 0
STRGST.STRSavAreaID = 0
STRGST.STRSavActID = 0
STRGST.STRSavXPos = 0
STRGST.STRSavYPos = 0
STRGST.STRSavZPos = 0

GSTRT = STRGST.STRGlobalTimer / 30
GSTRH = math.floor(GSTRT / 3600)
GSTRM = math.floor((GSTRT % 3600) / 60)
GSTRS = math.floor(GSTRT % 60)
GSTRMS = math.floor((GSTRT * 1000) % 1000)

STRGST.STRSSWarp = 3
STRGST.STRSSType = 1
STRGST.STRSSLevelID = 1
STRGST.STRSSAreaID = 1
STRGST.STRSSActID = 1
STRGST.STRSSSetStars = 1
STRGST.STRSSCollectedStar = STRGST.STRSSSetStars
STRGST.STRSSText = 300

STRGST.STRRunsTypes = 1
STRGST.STRPluginsTypes = 0
STRGST.STRPluginsSaved = 1

STRGST.STRLFLimit = 1
STRGST.STRLFID = 1
STRGST.STRLFBehavior = 5
STRGST.STRLFStars = 3

STRGST.STRLFLevel = 1
STRGST.STRLFArea = 1
STRGST.STRLFAct = 1
STRGST.STRLFLevels = 1

STRGST.STRLFAction = 1
STRGST.STRLFTimer = STRGST.STRLFSetTimer
STRGST.STRLFSetTimer = 1
STRGST.STRLFActions = 1

STRGST.STRLFXPos = 0
STRGST.STRLFYPos = 0
STRGST.STRLFZPos = 0
STRGST.STRLFEXPos = 0
STRGST.STRLFEYPos = 0
STRGST.STRLFEZPos = 0
STRGST.STRLFPositions = 1

STRGMOption = STRGST.STRGameMode
STRSTOption = STRGST.STRStartingType

gServerSettings.skipIntro = 1

-- Local Saves
STRMenuButtons = STR_Load("STRMButtons") or "All"
STRCustomColors = STR_Load("STRCColors") or "Enabled"
STRLocationSpot = STR_Load("STRLSpot") or "Ground"
STRRenderType = STR_Load("STRRType") or "Behind"
STRRules = STR_Load("STRRulesDisplay") or "Enabled"
STRHelper = STR_Load("STRHelperDisplay") or "Enabled"
STRRDisplay = STR_Load("STRRequireDisplay") or "Start"
STRMenuWarpType = STR_Load("STRMenuWType") or "Start"
STRBestTimeOption = STR_Load("STRBestTimeType") or "Saves"
STRShowCDFont = STR_Load("STRShowCountdown") or "Disabled"
STRShowGoFont = STR_Load("STRShowGo") or "Disabled"

-- Local Functions
STRMenuDisplay = false
STRMenuPauseFlag = false
STRMenuWarp = false
STRRunSlotAdded = false
if STRHelper == "Enabled" then
STRHelperOpen = true
elseif STRHelper == "Disabled" then
STRHelperOpen = false
end
STRRulesOpen = false
STRCustomRules = false
STRPlaySound = false

STRNumbers = false
STRWords = false
STRQuotes = false

STRMenuBindsFS = false
STRRulesBindsFS = false
STRSingleBindsFS = false

STRFlagFailSafe = false

if network_is_server() then
STRMenuTitleName = "MDMain"
else
STRMenuTitleName = "MDConfig"
end
MenuSelectedOption = "Main"
MenuViewHostCheck = false
FreezePlayer = false
MenuSaveUpdate = false
SaveFlagsUpdate = false

-- Local Number Functions
STRFTMNumber = 1
STRFCDNumber = 1
STRFGONumber = 1

STRSFFNumber = 1
STRSCDNumber = 1
STRSGONumber = 1

STRLoadSaveUpdater = 0
STRSettingsTimer = 150
STRBestTimeNumber = 0
STRBTNLimit = 30
STRHelperTimer = 10
STRHelperHide = 255

MenuPageLRDisplay = 1
MenuPageUDDisplay = 1
MenuLROption = 1
MenuUDOption = 1
MStickX = 0
MStickY = 0
MBPress = 0
MBDown = 0
MenuUpDelay = 0
MenuDownDelay = 0
MenuLeftDelay = 0
MenuRightDelay = 0
DPUpDelay = 0
DPDownDelay = 0
DPLeftDelay = 0
DPRightDelay = 0
MenuOptionDeplay = 10
MenuButtonsDeplay = 10
MenuSwitchDeplay = 0

STRSSLevelMenu = 1
STRSSAreaMenu = 1
STRSSActMenu = 1
STRSSStarMenu = 1
STRSSTypeMenu = 1

-- Save File Packet Numbers
STR_Packet_Data = 1

-- Global Tables
STRPluginRuns = {}

STRGameModeTable = {
	[1] = "Speedrun",
	[2] = "Practice",
	[3] = "Casual",
	[4] = "Single",
}

STRStartingTypeTable = {
	[1] = "Both",
	[2] = "Intermission",
	[3] = "Countdown",
	[4] = "None",
}

STRSSTypeTable = {
	[1]  = {SSName = "Amount Limit", 	Todo = ": Collect "},
	[2]  = {SSName = "Star ID", 		Todo = ": Collect Star "},
	[3]  = {SSName = "Key 1", 			Todo = ": Collect The First Key"},
	[4]  = {SSName = "Key 2", 			Todo = ": Collect The Second Key"},
	[5]  = {SSName = "Grand Star", 		Todo = ": Collect The Grand Star"},
	[6]  = {SSName = "Bowser Arenas", 	Todo = ": Go Thought The Level"},
	[7]  = {SSName = "Cake Ending", 	Todo = ": Reach to the Cake Ending"},
	[8]  = {SSName = "Red Switch", 		Todo = ": Press The Wing Cap Switch"},
	[9]  = {SSName = "Blue Switch", 	Todo = ": Press The Vanish Cap Switch"},
	[10] = {SSName = "Green Switch", 	Todo = ": Press The Metal Cap Switch"},
}

STRRunsTypeTable = {
	[1]  = "Stars",
	[2]  = "Levels",
	[3]  = "Actions",
	[4]  = "Positions",
	[5]  = "Stars + Levels",
	[6]  = "Stars + Actions",
	[7]  = "Stars + Positions",
	[8]  = "Levels + Actions",
	[9]  = "Levels + Positions",
	[10] = "Actions + Positions",
	[11] = "Stars + Levels + Actions",
	[12] = "Stars + Levels + Positions",
	[13] = "Stars + Actions + Positions",
	[14] = "Levels + Actions + Positions",
	[15] = "Stars + Levels + Actions + Positions",
}

STRLFS = {
	[1] = "Star Limit",
	[2] = "Star ID",
	[3] = "Behavior",
	[4] = "Star Limit + Star ID",
	[5] = "Star Limit + Behavior",
	[6] = "Star ID + Behavior",
}

STRLFL = {
	[1] = "Level",
	[2] = "Area",
	[3] = "Act",
	[4] = "Level + Area",
	[5] = "Level + Act",
	[6] = "Full Level",
}

STRLFA = {
	[1] = "Action ID",
	[2] = "Action ID + Timer",
}

STRLFP = {
	[1]  = "X Pos",
	[2]  = "Y Pos",
	[3]  = "Z Pos",
	[4]  = "X Pos + Y Pos",
	[5]  = "X Pos + Z Pos",
	[6]  = "Y Pos + Z Pos",
	[7]  = "All Position",
	[8]  = "Box X Pos",
	[9]  = "Box Y Pos",
	[10] = "Box Z Pos",
	[11] = "Box X Pos + Box Y Pos",
	[12] = "Box X Pos + Box Z Pos",
	[13] = "Box Y Pos + Box Z Pos",
	[14] = "All Box Position",
}

STRLFB = {
	[1]  = {Type = "Normal Star", 	  ID = id_bhvStar,                                                                         				Interact = true},
	[2]  = {Type = "Spawn Star", 	  ID = id_bhvSpawnedStar,                                                                  				Interact = true},
	[3]  = {Type = "Coordinate Star", ID = id_bhvStarSpawnCoordinates,                                                         				Interact = true},
	[4]  = {Type = "100 Coins Star",  ID = id_bhvSpawnedStarNoLevelExit,                                                       				Interact = true},
	[5]  = {Type = "Grand Star",      ID = id_bhvGrandStar,                                                                    				Interact = true},
	[6]  = {Type = "Key 1",           ID = SAVE_FLAG_HAVE_KEY_1,                                                               				Interact = false},
	[7]  = {Type = "Key 2",           ID = SAVE_FLAG_HAVE_KEY_2,                                                               				Interact = false},
	[8]  = {Type = "Red Switch",      ID = SAVE_FLAG_HAVE_WING_CAP,                                                            				Interact = false},
	[9]  = {Type = "Blue Switch",     ID = SAVE_FLAG_HAVE_VANISH_CAP,                                                          				Interact = false},
	[10] = {Type = "Green Switch",    ID = SAVE_FLAG_HAVE_METAL_CAP,                                                           				Interact = false},
	[11] = {Type = "Mips 1",          ID = SAVE_FLAG_COLLECTED_MIPS_STAR_1,                                                    				Interact = false},
	[12] = {Type = "Mips 2",          ID = SAVE_FLAG_COLLECTED_MIPS_STAR_2,                                                    				Interact = false},
	[13] = {Type = "Toad 1",          ID = SAVE_FLAG_COLLECTED_TOAD_STAR_1,                                                    				Interact = false},
	[14] = {Type = "Toad 2",          ID = SAVE_FLAG_COLLECTED_TOAD_STAR_2,                                                    				Interact = false},
	[15] = {Type = "Toad 3",          ID = SAVE_FLAG_COLLECTED_TOAD_STAR_3,                                                    				Interact = false},
	[16] = {Type = "All Switches",    ID = SAVE_FLAG_HAVE_WING_CAP | SAVE_FLAG_HAVE_VANISH_CAP | SAVE_FLAG_HAVE_METAL_CAP, 					Interact = false},
}

STRLevels = {
	[1]  = {STRLID = LEVEL_CASTLE_GROUNDS,   STRLN = "Castle Grounds"},
	[2]  = {STRLID = LEVEL_CASTLE,     		 STRLN = "Castle"},
	[3]  = {STRLID = LEVEL_CASTLE_COURTYARD, STRLN = "Castle Courtyard"},
	
	-- Main Levels
	[4]  = {STRLID = LEVEL_BOB,      		 STRLN = "Bob-omb BattleField"},
	[5]  = {STRLID = LEVEL_WF,      		 STRLN = "Whomp's Fortress"},
	[6]  = {STRLID = LEVEL_JRB,      		 STRLN = "Jolly Roger Bay"},
	[7]  = {STRLID = LEVEL_CCM,      		 STRLN = "Cool Cool Mountain"},
	[8]  = {STRLID = LEVEL_BBH,      		 STRLN = "Big Boo's Haunt"},
	[9]  = {STRLID = LEVEL_HMC,      		 STRLN = "Hazy Maze Cave"},
	[10] = {STRLID = LEVEL_LLL,      		 STRLN = "Lethal Lava Land"},
	[11] = {STRLID = LEVEL_SSL,      		 STRLN = "Shifting Sand Land"},
	[12] = {STRLID = LEVEL_DDD,      		 STRLN = "Dire Dire Docks"},
	[13] = {STRLID = LEVEL_SL,      		 STRLN = "Snowman's Land"},
	[14] = {STRLID = LEVEL_WDW,      		 STRLN = "Wet Dry World"},
	[15] = {STRLID = LEVEL_TTM,      		 STRLN = "Tall Tall Mountain"},
	[16] = {STRLID = LEVEL_THI,      		 STRLN = "Tiny Huge Island"},
	[17] = {STRLID = LEVEL_TTC,      		 STRLN = "Tick Tock Clock"},
	[18] = {STRLID = LEVEL_RR,      		 STRLN = "Rainbow Ride"},
	
	-- Bowser's Levels
	[19] = {STRLID = LEVEL_BITDW,      		 STRLN = "Bowser in the Dark World"},
	[20] = {STRLID = LEVEL_BITFS,      		 STRLN = "Bowser in the Fire Sea"},
	[21] = {STRLID = LEVEL_BITS,      		 STRLN = "Bowser in the Sky"},
	
	-- Secret Levels
	[22] = {STRLID = LEVEL_PSS,      		 STRLN = "Princess's Secret Slide"},
	[23] = {STRLID = LEVEL_COTMC,      		 STRLN = "Cavern of the Metal Cap"},
	[24] = {STRLID = LEVEL_TOTWC,      		 STRLN = "Tower of the Wing Cap"},
	[25] = {STRLID = LEVEL_VCUTM,      		 STRLN = "Vanish Cap Under the Moat"},
	[26] = {STRLID = LEVEL_WMOTR,      		 STRLN = "Wing Mario over the Rainbow"},
	[27] = {STRLID = LEVEL_SA,      		 STRLN = "Secret Aquarium"},
	[28] = {STRLID = LEVEL_ENDING,      	 STRLN = "Cake Ending/End Picture"},
	[29] = {STRLID = 50,					 STRLN = "Course None"}, -- LEVEL_NONE
	
	-- Extra Levels
	[30] = {STRLID = LEVEL_UNKNOWN_1,      	 STRLN = "Level Unknown 1"},
	[31] = {STRLID = LEVEL_UNKNOWN_2,      	 STRLN = "Level Unknown 2"},
	[32] = {STRLID = LEVEL_UNKNOWN_3,      	 STRLN = "Level Unknown 3"},
	[33] = {STRLID = LEVEL_UNKNOWN_35,       STRLN = "Level Unknown 35"},
	[34] = {STRLID = LEVEL_UNKNOWN_37,       STRLN = "Level Unknown 37"},
	[35] = {STRLID = LEVEL_UNKNOWN_38,       STRLN = "Level Unknown 38"},
}

STRActions = {
    [1] = {A_Name = "Disappeared", 				A_ID = ACT_DISAPPEARED},
	[2] = {A_Name = "Spawn No Spin Airborne",	A_ID = ACT_SPAWN_NO_SPIN_AIRBORNE},
	[3] = {A_Name = "Spawn No Spin Landing",	A_ID = ACT_SPAWN_NO_SPIN_LANDING},
	[4] = {A_Name = "Spawn Spin Airborne",		A_ID = ACT_SPAWN_SPIN_AIRBORNE},
	[5] = {A_Name = "Spawn Spin Landing",		A_ID = ACT_SPAWN_SPIN_LANDING},
	[6] = {A_Name = "Star Dance Exit",			A_ID = ACT_STAR_DANCE_EXIT},
	[7] = {A_Name = "Star Dance No Exit",		A_ID = ACT_STAR_DANCE_NO_EXIT},
	[8] = {A_Name = "Star Dance Water Exit",	A_ID = ACT_STAR_DANCE_WATER},
}

-- Local Tables
STRFontsTable = {
    [1] = {str_font_id = "Normal", 		str_font_name = "Super Mario 64 Text"},
	[2] = {str_font_id = "Aliased", 	str_font_name = "Coopdx Aliased Text"},
	[3] = {str_font_id = "Hud", 		str_font_name = "Super Mario 64"},
	[4] = {str_font_id = "Romhack", 	str_font_name = "Super Mario 64 (Romhack)"},
	[5] = {str_font_id = "Menu", 		str_font_name = "Coopdx Menu Font"},
	[6] = {str_font_id = "Special", 	str_font_name = "Coopdx Special Font"},
}

STRFanfareTable = {
	[1] = {str_fanfare_id = "RaceFanfare", str_fanfare_name = "Race Fanfare", str_fanfare_sound = nil},
}

STRCountdownTable = {
	[1] = {str_countdown_id = "ChangeSelect", str_countdown_name = "Change Select", str_countdown_sound = SOUND_MENU_CHANGE_SELECT},
	[2] = {str_countdown_id = "ReversePause", str_countdown_name = "Reverse Pause", str_countdown_sound = SOUND_MENU_REVERSE_PAUSE},
	[3] = {str_countdown_id = "ShortStar", 	  str_countdown_name = "Short Star", 	str_countdown_sound = SOUND_GENERAL_SHORT_STAR},
	[4] = {str_countdown_id = "SwitchTick",   str_countdown_name = "Switch Tick",   str_countdown_sound = SOUND_GENERAL2_SWITCH_TICK_FAST},
	[5] = {str_countdown_id = "StarSound", 	  str_countdown_name = "Star Sound", 	str_countdown_sound = SOUND_MENU_STAR_SOUND},
}

STRGoTable = {
	[1] = {str_go_id = "GunShot", str_go_name = "Race Gun Shot", str_go_sound = SOUND_GENERAL_RACE_GUN_SHOT},
}

STRButtonBinds = {
	[1]  = {name = "None", 		   button = nil},
	[2]  = {name = "A", 		   button = A_BUTTON},
	[3]  = {name = "B", 	       button = B_BUTTON},
	[4]  = {name = "X", 		   button = X_BUTTON},
	[5]  = {name = "Y",      	   button = Y_BUTTON},
	[6]  = {name = "L",      	   button = L_TRIG},
	[7]  = {name = "R",      	   button = R_TRIG},
	[8]  = {name = "Z",      	   button = Z_TRIG},
	[9]  = {name = "Start",        button = START_BUTTON},
	[10] = {name = "DpadU",        button = U_JPAD},
	[11] = {name = "DpadD",        button = D_JPAD},
	[12] = {name = "DpadL",        button = L_JPAD},
	[13] = {name = "DpadR",        button = R_JPAD},
	[14] = {name = "CStickU",      button = U_CBUTTONS},
	[15] = {name = "CStickD",      button = D_CBUTTONS},
	[16] = {name = "CStickL",      button = L_CBUTTONS},
	[17] = {name = "CStickR",      button = R_CBUTTONS},
}

STRFontColors = {STRFR = 255, STRFG = 255, STRFB = 255, STRFV = 255}
STRRectColors = {STRRR = 0, STRRG = 0, STRRB = 0, STRRV = 128}
STRMenuColors = {STRMR = 0, STRMG = 0, STRMB = 0, STRMV = 128}
STRFontPosition = {STRCX = 0, STRCY = 0}
STRMenuBinds = {MBind1 = 6, MBind2 = 7, MBind3 = 10}
STRRuleBinds = {RBind1 = 6, RBind2 = 7, RBind3 = 11}
STRSingleBinds = {SBind1 = 6, SBind2 = 1, SBind3 = 1}

STRSFlagsUpdater = {Mips1 = true, Mips2 = true, Toad1 = true, Toad2 = true, Toad3 = true, WC = true, MC = true, VC = true, D50 = true, BM = true, US = true, 
BDW = true, BFS = true, WF = true, PSS = true, JRB = true, CCM = true, Key1 = true, Key2 = true, DDD = true, MD = true, CG = true, CK = true, CU = true, CMB = true}

STRSFlagsSaveUpdater = {Mips1 = true, Mips2 = true, Toad1 = true, Toad2 = true, Toad3 = true, WC = true, MC = true, VC = true, D50 = true, BM = true, US = true, 
BDW = true, BFS = true, WF = true, PSS = true, JRB = true, CCM = true, Key1 = true, Key2 = true, DDD = true, MD = true, CG = true, CK = true, CU = true, CMB = true}

-- Save Functions (Thanks to Squishy)
function str_load_saves()
	local STRSavFontTM = STR_Load("STRFontTM")
	local STRSavFontCD = STR_Load("STRFontCD")
	local STRSavFontGO = STR_Load("STRFontGO")
	local STRSavFanfare = STR_Load("STRFanfare")
	local STRSavCountdown = STR_Load("STRCountdown")
	local STRSavGo = STR_Load("STRGo")
	local STRSavFC = STR_Load("STRFColors")
	local STRSavRC = STR_Load("STRRColors")
	local STRSavMC = STR_Load("STRMColors")
	local STRSavFP = STR_Load("STRFPosition")
	local STRSavMB = STR_Load("STRMBinds")
	local STRSavRB = STR_Load("STRRBinds")
	local STRSavSB = STR_Load("STRSBinds")
	
	if STRSavFontTM == nil or STRSavFontTM == "" then STR_Save("STRFontTM", STRFontsTable[1].str_font_id) STRSavFontTM = STRFontsTable[1].str_font_id end
    if STRSavFontTM ~= nil and STRSavFontTM ~= STRFontsTable[1].str_font_id then for i = 2, #STRFontsTable do if STRFontsTable[i].str_font_id == STRSavFontTM then STRFTMNumber = i end end end
	
	if STRSavFontCD == nil or STRSavFontCD == "" then STR_Save("STRFontCD", STRFontsTable[1].str_font_id) STRSavFontCD = STRFontsTable[1].str_font_id end
    if STRSavFontCD ~= nil and STRSavFontCD ~= STRFontsTable[1].str_font_id then for i = 2, #STRFontsTable do if STRFontsTable[i].str_font_id == STRSavFontCD then STRFCDNumber = i end end end
	
	if STRSavFontGO == nil or STRSavFontGO == "" then STR_Save("STRFontGO", STRFontsTable[1].str_font_id) STRSavFontGO = STRFontsTable[1].str_font_id end
    if STRSavFontGO ~= nil and STRSavFontGO ~= STRFontsTable[1].str_font_id then for i = 2, #STRFontsTable do if STRFontsTable[i].str_font_id == STRSavFontGO then STRFGONumber = i end end end
	
	if STRSavFanfare == nil or STRSavFanfare == "" then STR_Save("STRFanfare", STRFanfareTable[1].str_fanfare_id) STRSavFanfare = STRFanfareTable[1].str_fanfare_id end
    if STRSavFanfare ~= nil and STRSavFanfare ~= STRFanfareTable[1].str_fanfare_id then for i = 2, #STRFanfareTable do if STRFanfareTable[i].str_fanfare_id == STRSavFanfare then STRSFFNumber = i end end end
	
	if STRSavCountdown == nil or STRSavCountdown == "" then STR_Save("STRCountdown", STRCountdownTable[1].str_countdown_id) STRSavCountdown = STRCountdownTable[1].str_countdown_id end
    if STRSavCountdown ~= nil and STRSavCountdown ~= STRCountdownTable[1].str_countdown_id then for i = 2, #STRCountdownTable do if STRCountdownTable[i].str_countdown_id == STRSavCountdown then STRSCDNumber = i end end end
	
	if STRSavGo == nil or STRSavGo == "" then STR_Save("STRGo", STRGoTable[1].str_go_id) STRSavGo = STRGoTable[1].str_go_id end
    if STRSavGo ~= nil and STRSavGo ~= STRGoTable[1].str_go_id then for i = 2, #STRGoTable do if STRGoTable[i].str_go_id == STRSavGo then STRSGONumber = i end end end
	
	if STRSavFC ~= nil and STRSavFC ~= "" then local FCColor = str_split_table(STRSavFC, "_")
    STRFontColors = {STRFR = tonumber(FCColor[1]), STRFG = tonumber(FCColor[2]), STRFB = tonumber(FCColor[3]), STRFV = tonumber(FCColor[4])}
    else STR_Save("STRFColors", "255_255_255_255") end
	
	if STRSavRC ~= nil and STRSavRC ~= "" then local RCColor = str_split_table(STRSavRC, "_")
    STRRectColors = {STRRR = tonumber(RCColor[1]), STRRG = tonumber(RCColor[2]), STRRB = tonumber(RCColor[3]), STRRV = tonumber(RCColor[4])}
    else STR_Save("STRRColors", "0_0_0_128") end
	
	if STRSavMC ~= nil and STRSavMC ~= "" then local MCColor = str_split_table(STRSavMC, "_")
    STRMenuColors = {STRMR = tonumber(MCColor[1]), STRMG = tonumber(MCColor[2]), STRMB = tonumber(MCColor[3]), STRMV = tonumber(MCColor[4])}
    else STR_Save("STRMColors", "0_0_0_128") end
	
	if STRSavFP ~= nil and STRSavFP ~= "" then local FPNumbers = str_split_table(STRSavFP, "_")
    STRFontPosition = {STRCX = tonumber(FPNumbers[1]), STRCY = tonumber(FPNumbers[2])}
    else STR_Save("STRFPosition", "0_0") end
	
	if STRSavMB ~= nil and STRSavMB ~= "" then local MenuBinds = str_split_table(STRSavMB, "_")
    STRMenuBinds = {MBind1 = tonumber(MenuBinds[1]), MBind2 = tonumber(MenuBinds[2]), MBind3 = tonumber(MenuBinds[3])}
    else STR_Save("STRMBinds", "6_7_10") end
	
	if STRSavRB ~= nil and STRSavRB ~= "" then local RulesBinds = str_split_table(STRSavRB, "_")
    STRRuleBinds = {RBind1 = tonumber(RulesBinds[1]), RBind2 = tonumber(RulesBinds[2]), RBind3 = tonumber(RulesBinds[3])}
    else STR_Save("STRRBinds", "6_7_11") end
	
	if STRSavSB ~= nil and STRSavSB ~= "" then local SingleBinds = str_split_table(STRSavSB, "_")
    STRSingleBinds = {SBind1 = tonumber(SingleBinds[1]), SBind2 = tonumber(SingleBinds[2]), SBind3 = tonumber(SingleBinds[3])}
    else STR_Save("STRSBinds", "6_1_1") end
end

function str_clear_saves()
STR_Clear()
if network_is_server() then
STRGST.STRFinishGameWarp = "Enabled"
STRGST.STRForceLevelType = "Levels"
STRGST.STRWarpType = "Start"
STRGST.STRForceSpot = "Start"
STRGST.STRBSFOption = "Disabled"
STRGST.CasualGM = "Disabled"
STRGST.STRCDNumber = 3
STRGST.STRGameMode = 1
STRGST.STRStartingType = 1
end
	
STRMenuButtons = "All"
STRCustomColors = "Enabled"
STRLocationSpot = "Ground"
STRRenderType = "Behind"
STRRules = "Enabled"
STRHelper = "Enabled"
STRRDisplay = "Start"
STRMenuWarpType = "Start"
STRBestTimeOption = "Saves"
STRShowCDFont = "Disabled"
STRShowGoFont = "Disabled"
STRFTMNumber, STRFCDNumber, STRFGONumber = 1, 1, 1
STRSFFNumber, STRSCDNumber, STRSGONumber = 1, 1, 1
STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV = 255, 255, 255, 255
STRRectColors.STRRR, STRRectColors.STRRG, STRRectColors.STRRB, STRRectColors.STRRV = 0, 0, 0, 128
STRMenuColors.STRMR, STRMenuColors.STRMG, STRMenuColors.STRMB, STRMenuColors.STRMV = 0, 0, 0, 128
STRFontPosition.STRCX, STRFontPosition.STRCY = 0, 0
STRMenuBinds.MBind1, STRMenuBinds.MBind2, STRMenuBinds.MBind3 = 6, 7, 10
STRRuleBinds.RBind1, STRRuleBinds.RBind2, STRRuleBinds.RBind3 = 6, 7, 11
STRSingleBinds.SBind1, STRSingleBinds.SBind2, STRSingleBinds.SBind3 = 6, 1, 1
end

function str_remove_saves()
if MenuPageLRDisplay == 1 then
STRFTMNumber, STRFCDNumber, STRFGONumber = 1, 1, 1 STRShowCDFont = "Disabled" STRShowGoFont = "Disabled"
STR_Remove("STRFontTM")
STR_Remove("STRFontCD")
STR_Remove("STRFontGO")
STR_Remove("STRShowCountdown")
STR_Remove("STRShowGo")
elseif MenuPageLRDisplay == 2 then
STRSFFNumber, STRSCDNumber, STRSGONumber = 1, 1, 1
STR_Remove("STRFanfare")
STR_Remove("STRCountdown")
STR_Remove("STRGo")
elseif MenuPageLRDisplay == 3 then
STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV = 255, 255, 255, 255
STRRectColors.STRRR, STRRectColors.STRRG, STRRectColors.STRRB, STRRectColors.STRRV = 0, 0, 0, 128
STRMenuColors.STRMR, STRMenuColors.STRMG, STRMenuColors.STRMB, STRMenuColors.STRMV = 0, 0, 0, 128
STRFontPosition.STRCX, STRFontPosition.STRCY = 0, 0
STR_Remove("STRFColors")
STR_Remove("STRRColors")
STR_Remove("STRMColors")
STR_Remove("STRFPosition")
elseif MenuPageLRDisplay == 4 and MenuPageUDDisplay == 1 then 
STRMenuButtons = "All"
STRCustomColors = "Enabled"
STRRenderType = "Behind"
STRRules = "Enabled"
STRHelper = "Enabled"
STRMenuBinds.MBind1, STRMenuBinds.MBind2, STRMenuBinds.MBind3 = 6, 7, 10
STRRuleBinds.RBind1, STRRuleBinds.RBind2, STRRuleBinds.RBind3 = 6, 7, 11
STR_Remove("STRCColors")
STR_Remove("STRRType") 
STR_Remove("STRHelperDisplay")
STR_Remove("STRMButtons") 
STR_Remove("STRRulesDisplay") 
STR_Remove("STRMBinds") 
STR_Remove("STRRBinds") 
elseif MenuPageLRDisplay == 4 and MenuPageUDDisplay == 2 then 
STRRDisplay = "Start"
STRMenuWarpType = "Start"
STRBestTimeOption = "Saves"
STR_Remove("STRRequireDisplay")
STR_Remove("STRMenuWType")
STR_Remove("STRBestTimeType")
end
end

-- Set Texts
function normal_text(text, x, y, scale, r, g, b, v)
    Hud_Color(r, g, b, v);
    Hud_Text(text, x, y, scale);
end

function shadow_text(text, x, y, scale, px, py, r, g, b, v)
    Hud_Color(0, 0, 0, v);
    Hud_Text(text, x + px, y + py, scale);

    Hud_Color(r, g, b, v);
    Hud_Text(text, x, y, scale);
end

function render_rect(x, y, w, h, r, g, b, a)
    Hud_Color(r, g, b, a);
    Hud_Rect(x, y, w, h);
end

function rules_text(text, x, y, scale, px, py, r, g, b, v)
    Hud_Color(0, 0, 0, v);
    Hud_Text(text, x + px, y + py, scale);

    Hud_Color(r, g, b, v);
    Hud_Text(text, x, y, scale);
end

function menu_shadow_text(text, x, y, scale, px, py, r, g, b, v, func)
    Hud_Color(0, 0, 0, v);
    Hud_Text(text, x + px, y + py, scale);
	
	if func then
    Hud_Color(r, g, b, v);
	else
	Hud_Color(180, 180, 180, 255);
	end
    Hud_Text(text, x, y, scale);
end

function color_shadow_text(text, x, y, scale, px, py, r, g, b, v, r2, g2, b2, v2, func)
    Hud_Color(0, 0, 0, v);
    Hud_Text(text, x + px, y + py, scale);
	
	if func then
    Hud_Color(r, g, b, v);
	else
	Hud_Color(r2, g2, b2, v2);
	end
    Hud_Text(text, x, y, scale);
end

function menu_shadow_lock_text(text, swx, shy, texh, scale, px, py, r, g, b, v, func)
    local Width = Hud_Measure(text) * scale
    local Height = texh * scale

    local x = (S_Width() - Width) / swx
    local y = (S_Height() - Height) / shy
	
	local px = x + swx
    local py = y + shy

    Hud_Color(0, 0, 0, v);
    Hud_Text(text, px, py, scale);
	
	if func then
    Hud_Color(r, g, b, v);
	else
	Hud_Color(255, 255, 255, 255);
	end
    Hud_Text(text, x, y, scale);
end

function hide_shadow_text(text, x, y, scale, px, py, r, g, b, v, func)
	if func then
    Hud_Color(0, 0, 0, v);
    Hud_Text(text, x + px, y + py, scale);
	
    Hud_Color(r, g, b, v);
    Hud_Text(text, x, y, scale);
	end
end

function custom_normal_text(text, x, y, scale)
	if STRCustomColors == "Enabled" then
	Hud_Color(STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV);
	else
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_shadow_text(text, x, y, scale, px, py)
    Hud_Color(0, 0, 0, STRFontColors.STRFV);
    Hud_Text(text, x + px, y + py, scale);

    if STRCustomColors == "Enabled" then
	Hud_Color(STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV);
	else
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_romhack_text(text, x, y, scale, colors)
	if STRNumbers == true and colors == "Numbers" and STRCustomColors == "Enabled" then
	Hud_Color(STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV);
	elseif STRNumbers == false and colors == "Numbers" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
	
	if STRWords == true and colors == "Words" and STRCustomColors == "Enabled" then
	Hud_Color(STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV);
	elseif STRWords == false and colors == "Words" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
	
	if STRQuotes == true and colors == "Quotes" and STRCustomColors == "Enabled" then
	Hud_Color(STRFontColors.STRFR, STRFontColors.STRFG, STRFontColors.STRFB, STRFontColors.STRFV);
	elseif STRQuotes == false and colors == "Quotes" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
	
	if STRCustomColors == "Disabled" then
	Hud_Color(255, 255, 255, STRFontColors.STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_render_rect(x, y, w, h)
	if STRCustomColors == "Enabled" then
	Hud_Color(STRRectColors.STRRR, STRRectColors.STRRG, STRRectColors.STRRB, STRRectColors.STRRV);
	else
	Hud_Color(0, 0, 0, STRRectColors.STRRV);
	end
    Hud_Rect(x, y, w, h);
end

-- Functions
function str_global_time()
GSTRT = STRGST.STRGlobalTimer / 30
GSTRH = math.floor(GSTRT / 3600)
GSTRM = math.floor((GSTRT % 3600) / 60)
GSTRS = math.floor(GSTRT % 60)
GSTRMS = math.floor((GSTRT * 1000) % 1000)
end
-- Code From EmilyEmmi
function str_reset_save()
	file = get_current_save_file_num() - 1
	for course = 0, 25 do
	save_file_remove_star_flags(file, course - 1, 0xFF)
	end
	m = gMarioStates[0]

	if STRGST.SFSMipsStar1 == true then save_file_clear_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_1) else save_file_set_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_1) end
	if STRGST.SFSMipsStar2 == true then save_file_clear_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_2) else save_file_set_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_2) end
	if STRGST.SFSToadStar1 == true then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_1) else save_file_set_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_1) end
	if STRGST.SFSToadStar2 == true then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_2) else save_file_set_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_2) end
	if STRGST.SFSToadStar3 == true then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_3) else save_file_set_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_3) end
	if STRGST.SFSWingCap == true then save_file_clear_flags(SAVE_FLAG_HAVE_WING_CAP) end
	if STRGST.SFSMetalCap == true then save_file_clear_flags(SAVE_FLAG_HAVE_METAL_CAP) end
	if STRGST.SFSVanishCap == true then save_file_clear_flags(SAVE_FLAG_HAVE_VANISH_CAP) end
	if STRGST.SFS50StarDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_50_STAR_DOOR) end
	if STRGST.SFSBasementDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BASEMENT_DOOR) end
	if STRGST.SFSUpstairsDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR) end
	if STRGST.SFSBITDWDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BITDW_DOOR) end
	if STRGST.SFSBITFSDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BITFS_DOOR) end
	if STRGST.SFSWFDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_WF_DOOR) end
	if STRGST.SFSPSSDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_PSS_DOOR) end
	if STRGST.SFSJRBDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_JRB_DOOR) end
	if STRGST.SFSCCMDoor == true then save_file_clear_flags(SAVE_FLAG_UNLOCKED_CCM_DOOR) end
	if STRGST.SFSKey1 == true then save_file_clear_flags(SAVE_FLAG_HAVE_KEY_1) else save_file_set_flags(SAVE_FLAG_HAVE_KEY_1) end
	if STRGST.SFSKey2 == true then save_file_clear_flags(SAVE_FLAG_HAVE_KEY_2) else save_file_set_flags(SAVE_FLAG_HAVE_KEY_2) end
	if STRGST.SFSDDDMovedBack == true then save_file_clear_flags(SAVE_FLAG_DDD_MOVED_BACK) else save_file_set_flags(SAVE_FLAG_DDD_MOVED_BACK) end
	if STRGST.SFSMoatDrain == true then save_file_clear_flags(SAVE_FLAG_MOAT_DRAINED) else save_file_set_flags(SAVE_FLAG_MOAT_DRAINED) end
	if STRGST.SFSCapGround == true then save_file_clear_flags(SAVE_FLAG_CAP_ON_GROUND) m.cap = m.cap & ~SAVE_FLAG_CAP_ON_GROUND end
	if STRGST.SFSCapKlepto == true then save_file_clear_flags(SAVE_FLAG_CAP_ON_KLEPTO) m.cap = m.cap & ~SAVE_FLAG_CAP_ON_KLEPTO end
	if STRGST.SFSCapUkiki == true then save_file_clear_flags(SAVE_FLAG_CAP_ON_UKIKI) m.cap = m.cap & ~SAVE_FLAG_CAP_ON_UKIKI end
	if STRGST.SFSCapBlizzard == true then save_file_clear_flags(SAVE_FLAG_CAP_ON_MR_BLIZZARD) m.cap = m.cap & ~SAVE_FLAG_CAP_ON_MR_BLIZZARD end
	
	save_file_do_save(file, 1)
    update_all_mario_stars()
end

function str_save_flag()
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0 then  STRGST.SFSMipsStar1 = false STRSFlagsUpdater.Mips1 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0 then  STRGST.SFSMipsStar2 = false STRSFlagsUpdater.Mips2 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0 then  STRGST.SFSToadStar1 = false STRSFlagsUpdater.Toad1 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0 then  STRGST.SFSToadStar2 = false STRSFlagsUpdater.Toad2 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0 then  STRGST.SFSToadStar3 = false STRSFlagsUpdater.Toad3 = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then 		  STRGST.SFSWingCap = false STRSFlagsUpdater.WC = false end 
	if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then 		  STRGST.SFSMetalCap = false STRSFlagsUpdater.MC = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then 		  STRGST.SFSVanishCap = false STRSFlagsUpdater.VC = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_50_STAR_DOOR ~= 0 then  STRGST.SFS50StarDoor = false STRSFlagsUpdater.D50 = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BASEMENT_DOOR ~= 0 then STRGST.SFSBasementDoor = false STRSFlagsUpdater.BM = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR ~= 0 then STRGST.SFSUpstairsDoor = false STRSFlagsUpdater.US = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITDW_DOOR ~= 0 then 	  STRGST.SFSBITDWDoor = false STRSFlagsUpdater.BDW = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITFS_DOOR ~= 0 then 	  STRGST.SFSBITFSDoor = false STRSFlagsUpdater.BFS = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_WF_DOOR ~= 0 then 	  STRGST.SFSWFDoor = false STRSFlagsUpdater.WF = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_PSS_DOOR ~= 0 then 	  STRGST.SFSPSSDoor = false STRSFlagsUpdater.PSS = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_JRB_DOOR ~= 0 then 	  STRGST.SFSJRBDoor = false STRSFlagsUpdater.JRB = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_CCM_DOOR ~= 0 then 	  STRGST.SFSCCMDoor = false STRSFlagsUpdater.CCM = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then 			  STRGST.SFSKey1 = false STRSFlagsUpdater.Key1 = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0 then 			  STRGST.SFSKey2 = false STRSFlagsUpdater.Key2 = false end
	if save_file_get_flags() & SAVE_FLAG_DDD_MOVED_BACK ~= 0 then 		  STRGST.SFSDDDMovedBack = false STRSFlagsUpdater.DDD = false end
	if save_file_get_flags() & SAVE_FLAG_MOAT_DRAINED ~= 0 then 		  STRGST.SFSMoatDrain = false STRSFlagsUpdater.MD = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_GROUND ~= 0 then		  STRGST.SFSCapGround = false STRSFlagsUpdater.CG = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_KLEPTO ~= 0 then 		  STRGST.SFSCapKlepto = false STRSFlagsUpdater.CK = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_UKIKI ~= 0 then 		  STRGST.SFSCapUkiki = false STRSFlagsUpdater.CU = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_MR_BLIZZARD ~= 0 then 	  STRGST.SFSCapBlizzard = false STRSFlagsUpdater.CMB = false end
end

function str_save_flag_saved()
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0 then  STRSFlagsSaveUpdater.Mips1 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 0 then  STRSFlagsSaveUpdater.Mips2 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 0 then  STRSFlagsSaveUpdater.Toad1 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 0 then  STRSFlagsSaveUpdater.Toad2 = false end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 0 then  STRSFlagsSaveUpdater.Toad3 = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then 		  STRSFlagsSaveUpdater.WC = false end 
	if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then 		  STRSFlagsSaveUpdater.MC = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then 		  STRSFlagsSaveUpdater.VC = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_50_STAR_DOOR ~= 0 then  STRSFlagsSaveUpdater.D50 = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BASEMENT_DOOR ~= 0 then STRSFlagsSaveUpdater.BM = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR ~= 0 then STRSFlagsSaveUpdater.US = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITDW_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.BDW = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITFS_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.BFS = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_WF_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.WF = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_PSS_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.PSS = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_JRB_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.JRB = false end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_CCM_DOOR ~= 0 then 	  STRSFlagsSaveUpdater.CCM = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then 			  STRSFlagsSaveUpdater.Key1 = false end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0 then 			  STRSFlagsSaveUpdater.Key2 = false end
	if save_file_get_flags() & SAVE_FLAG_DDD_MOVED_BACK ~= 0 then 		  STRSFlagsSaveUpdater.DDD = false end
	if save_file_get_flags() & SAVE_FLAG_MOAT_DRAINED ~= 0 then 		  STRSFlagsSaveUpdater.MD = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_GROUND ~= 0 then		  STRSFlagsSaveUpdater.CG = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_KLEPTO ~= 0 then 		  STRSFlagsSaveUpdater.CK = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_UKIKI ~= 0 then 		  STRSFlagsSaveUpdater.CU = false end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_MR_BLIZZARD ~= 0 then 	  STRSFlagsSaveUpdater.CMB = false end
end

function str_save_flag_prev()
	STRFlagFailSafe = true
	STRSFlagsUpdater.Mips1, STRGST.SFSMipsStar1 = STRSFlagsSaveUpdater.Mips1, STRSFlagsSaveUpdater.Mips1
	STRSFlagsUpdater.Mips2, STRGST.SFSMipsStar2 = STRSFlagsSaveUpdater.Mips2, STRSFlagsSaveUpdater.Mips2
	STRSFlagsUpdater.Toad1, STRGST.SFSToadStar1 = STRSFlagsSaveUpdater.Toad1, STRSFlagsSaveUpdater.Toad1
	STRSFlagsUpdater.Toad2, STRGST.SFSToadStar2 = STRSFlagsSaveUpdater.Toad2, STRSFlagsSaveUpdater.Toad2
	STRSFlagsUpdater.Toad3, STRGST.SFSToadStar3 = STRSFlagsSaveUpdater.Toad3, STRSFlagsSaveUpdater.Toad3
	STRSFlagsUpdater.WC, STRGST.SFSWingCap = STRSFlagsSaveUpdater.WC, STRSFlagsSaveUpdater.WC
	STRSFlagsUpdater.MC, STRGST.SFSMetalCap = STRSFlagsSaveUpdater.MC, STRSFlagsSaveUpdater.MC
	STRSFlagsUpdater.VC, STRGST.SFSVanishCap = STRSFlagsSaveUpdater.VC, STRSFlagsSaveUpdater.VC
	STRSFlagsUpdater.D50, STRGST.SFS50StarDoor = STRSFlagsSaveUpdater.D50, STRSFlagsSaveUpdater.D50
	STRSFlagsUpdater.BM, STRGST.SFSBasementDoor = STRSFlagsSaveUpdater.BM, STRSFlagsSaveUpdater.BM
	STRSFlagsUpdater.US, STRGST.SFSUpstairsDoor = STRSFlagsSaveUpdater.US, STRSFlagsSaveUpdater.US
	STRSFlagsUpdater.BDW, STRGST.SFSBITDWDoor = STRSFlagsSaveUpdater.BDW, STRSFlagsSaveUpdater.BDW
	STRSFlagsUpdater.BFS, STRGST.SFSBITFSDoor = STRSFlagsSaveUpdater.BFS, STRSFlagsSaveUpdater.BFS
	STRSFlagsUpdater.WF, STRGST.SFSWFDoor = STRSFlagsSaveUpdater.WF, STRSFlagsSaveUpdater.WF
	STRSFlagsUpdater.PSS, STRGST.SFSPSSDoor = STRSFlagsSaveUpdater.PSS, STRSFlagsSaveUpdater.PSS
	STRSFlagsUpdater.JRB, STRGST.SFSJRBDoor = STRSFlagsSaveUpdater.JRB, STRSFlagsSaveUpdater.JRB
	STRSFlagsUpdater.CCM, STRGST.SFSCCMDoor = STRSFlagsSaveUpdater.CCM, STRSFlagsSaveUpdater.CCM
	STRSFlagsUpdater.Key1, STRGST.SFSKey1 = STRSFlagsSaveUpdater.Key1, STRSFlagsSaveUpdater.Key1
	STRSFlagsUpdater.Key2, STRGST.SFSKey2 = STRSFlagsSaveUpdater.Key2, STRSFlagsSaveUpdater.Key2
	STRSFlagsUpdater.DDD, STRGST.SFSDDDMovedBack = STRSFlagsSaveUpdater.DDD, STRSFlagsSaveUpdater.DDD
	STRSFlagsUpdater.MD, STRGST.SFSMoatDrain = STRSFlagsSaveUpdater.MD, STRSFlagsSaveUpdater.MD
	STRSFlagsUpdater.CG, STRGST.SFSCapGround = STRSFlagsSaveUpdater.CG, STRSFlagsSaveUpdater.CG
	STRSFlagsUpdater.CK, STRGST.SFSCapKlepto = STRSFlagsSaveUpdater.CK, STRSFlagsSaveUpdater.CK
	STRSFlagsUpdater.CU, STRGST.SFSCapUkiki = STRSFlagsSaveUpdater.CU, STRSFlagsSaveUpdater.CU
	STRSFlagsUpdater.CMB, STRGST.SFSCapBlizzard = STRSFlagsSaveUpdater.CMB, STRSFlagsSaveUpdater.CMB
end

function str_save_flag_failsafe()
	STRFlagFailSafe = false
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 1 then  STRSFlagsUpdater.Mips1 = true end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_2 ~= 1 then  STRSFlagsUpdater.Mips2 = true end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_1 ~= 1 then  STRSFlagsUpdater.Toad1 = true end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_2 ~= 1 then  STRSFlagsUpdater.Toad2 = true end
	if save_file_get_flags() & SAVE_FLAG_COLLECTED_TOAD_STAR_3 ~= 1 then  STRSFlagsUpdater.Toad3 = true end
	if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 1 then 		  STRSFlagsUpdater.WC = true end
	if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 1 then 		  STRSFlagsUpdater.MC = true end
	if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 1 then 		  STRSFlagsUpdater.VC = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_50_STAR_DOOR ~= 1 then  STRSFlagsUpdater.D50 = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BASEMENT_DOOR ~= 1 then STRSFlagsUpdater.BM = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR ~= 1 then STRSFlagsUpdater.US = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITDW_DOOR ~= 1 then 	  STRSFlagsUpdater.BDW = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_BITFS_DOOR ~= 1 then 	  STRSFlagsUpdater.BFS = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_WF_DOOR ~= 1 then 	  STRSFlagsUpdater.WF = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_PSS_DOOR ~= 1 then 	  STRSFlagsUpdater.PSS = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_JRB_DOOR ~= 1 then 	  STRSFlagsUpdater.JRB = true end
	if save_file_get_flags() & SAVE_FLAG_UNLOCKED_CCM_DOOR ~= 1 then 	  STRSFlagsUpdater.CCM = true end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 1 then 			  STRSFlagsUpdater.Key1 = true end
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 1 then 			  STRSFlagsUpdater.Key2 = true end
	if save_file_get_flags() & SAVE_FLAG_DDD_MOVED_BACK ~= 1 then 		  STRSFlagsUpdater.DDD = true end
	if save_file_get_flags() & SAVE_FLAG_MOAT_DRAINED ~= 1 then 		  STRSFlagsUpdater.MD = true end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_GROUND ~= 1 then		  STRSFlagsUpdater.CG = true end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_KLEPTO ~= 1 then 		  STRSFlagsUpdater.CK = true end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_UKIKI ~= 1 then 		  STRSFlagsUpdater.CU = true end
	if save_file_get_flags() & SAVE_FLAG_CAP_ON_MR_BLIZZARD ~= 1 then 	  STRSFlagsUpdater.CMB = true end
end

-- Code From Pipocalio
function str_button_combo(controller, ...)
    local mask = 0

    --- Combine all the button constants from the variadic args into a bitmask using the bitwise OR operator.
    for _, v in next, {...} do
        mask = mask | v
    end

    -- If none of our buttons were pressed, it's clear that the combo is NOT being pressed, so we return.
    -- This also prevents the function from returning true every frame.
    if controller.buttonPressed & mask == 0 then
        return
    end

    -- Then, if ALL the buttons are either being pressed or held, we return true
    return (controller.buttonDown & mask) | (controller.buttonPressed & mask) == mask
end

-- Split String Code
function str_split_table(string, SAText)
    if SAText == nil then
        SAText = " "
    end
    local result = {}
    for match in string:gmatch(string.format("[^%s]+", SAText)) do
        table.insert(result, match)
    end
    return result
end

function str_erase_save()
	if STRGST.STREraseSaveCD < 1 and STRGST.EraseSave == true then
	str_reset_save()
	save_file_reload(0)
	network_send(true, {Update = STR_Packet_Data})
	elseif STRGST.STREraseSaveCD > 1 and STRGST.EraseSave == true and STRFlagFailSafe == true then
	str_save_flag()
	end
end

function str_sounds()
	if network_is_server() then 
	if STRGST.STRCountdown > 1.93 and STRGST.STRSecondsDelay > 60 and STRGST.STRIntermission <= 0 and STRGST.STRStartingType == 1 then
		STRGST.STRCDSounds = STRGST.STRCDSounds + 1
	if STRGST.STRCDSounds > 29 then 
		STRGST.STRCDSounds = 0
		end
	end
	
	if STRGST.STRCountdown > 1.93 and STRGST.STRSecondsDelay > 0 and STRGST.STRStartingType == 3 then
		STRGST.STRCDSounds = STRGST.STRCDSounds + 1
	if STRGST.STRCDSounds > 29 then 
		STRGST.STRCDSounds = 0
		end
	end
		
	if STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay > 60 and STRGST.STRSecondsDelay < 91 and STRGST.STRIntermission <= 0 and STRGST.STRStartingType == 1 then
		STRGST.STRCDSounds = STRGST.STRCDSounds + 1
	if STRGST.STRCDSounds > 29 then 
		STRGST.STRCDSounds = 0
		end
	end
	
	if STRGST.STRCountdown == 1 and STRGST.STRSecondsDelay > 0 and STRGST.STRSecondsDelay < 31 and STRGST.STRStartingType == 3 then
		STRGST.STRCDSounds = STRGST.STRCDSounds + 1
	if STRGST.STRCDSounds > 29 then 
		STRGST.STRCDSounds = 0
			end
		end
	end
	
	if (STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay == 3 and (STRGST.STRStartingType == 1 or STRGST.STRStartingType == 2)) and STRSFFNumber == 1 then
		play_race_fanfare()
	end
	
	if STRGST.STRCDSounds == 29 and STRSCDNumber < 6 then
		play_sound(STRCountdownTable[STRSCDNumber].str_countdown_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	if STRGST.STRGlobalTimer == 2 and STRSGONumber == 1 and STRGST.STRGameMode ~= 4 then
		play_sound(STRGoTable[STRSGONumber].str_go_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
end

function str_level_updater()
	if not network_is_server() then return end
	GroundSpot = ((gMarioStates[0].action & ACT_FLAG_AIR) == 0 and STRLocationSpot == "Ground")
	AirSpot = (STRLocationSpot == "Air")
	
	if STRGST.STRSpotUpdater <= 5 and (GroundSpot or AirSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRSpotUpdater = STRGST.STRSpotUpdater + 1
	if not STRGST.STRLocationPlugin then
	STRGST.STRXPos = gMarioStates[0].pos.x
	STRGST.STRYPos = gMarioStates[0].pos.y
	STRGST.STRZPos = gMarioStates[0].pos.z
	end
	end
	
	if STRGST.STRSavSpotUpdater <= 5 and (GroundSpot or AirSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRSavSpotUpdater = STRGST.STRSavSpotUpdater + 1
	if not STRGST.STRLocationPlugin then
	STRGST.STRSavXPos = gMarioStates[0].pos.x
	STRGST.STRSavYPos = gMarioStates[0].pos.y
	STRGST.STRSavZPos = gMarioStates[0].pos.z
	end
	end
	
	if STRGST.STRLevelUpdater < 5 and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRLevelUpdater = STRGST.STRLevelUpdater + 1
	if not STRGST.STRLocationPlugin then
	STRGST.STRCourseID = gNetworkPlayers[0].currCourseNum
	STRGST.STRLevelID = gNetworkPlayers[0].currLevelNum
	STRGST.STRAreaID = gNetworkPlayers[0].currAreaIndex
	STRGST.STRActID = gNetworkPlayers[0].currActNum
	end
	end

	if STRGST.STRSavLevelUpdater < 5 and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRSavLevelUpdater = STRGST.STRSavLevelUpdater + 1
	if not STRGST.STRLocationPlugin then
	STRGST.STRSavCourseID = gNetworkPlayers[0].currCourseNum
	STRGST.STRSavLevelID = gNetworkPlayers[0].currLevelNum
	STRGST.STRSavAreaID = gNetworkPlayers[0].currAreaIndex
	STRGST.STRSavActID = gNetworkPlayers[0].currActNum
	end
	end
end

function str_updater_function()
	if STRGST.WarpNodeRandomierDeplay < 90 and STRGST.WNRCheck == true then
	STRGST.WarpNodeRandomierDeplay = STRGST.WarpNodeRandomierDeplay + 1
	end
	CountdownDisplayFunc = ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 88 and STRGST.STRSecondsDelay < 120 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 88 and STRGST.STRSecondsDelay < 119 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing"))
	
	GoDisplayFunc = (STRGST.STRGlobalTimer >= 2 and STRGST.STRGoText < 28)
	CountdownSwitchFunc = (STRGST.STRCountdown >= 1.01 or STRGST.STRCountdown == 1)
	
	saveflag, m, NP = save_file_get_flags(), gMarioStates[0], gNetworkPlayers[0]
	StarsFunctions = ((STRGST.STRLFStars == 1 and m.numStars >= STRGST.STRLFLimit)
	or (STRGST.STRLFStars == 3 and (saveflag & STRLFB[STRGST.STRLFBehavior].ID) ~= 0 and STRLFB[STRGST.STRLFBehavior].Interact == false) 
	or (STRGST.STRLFStars == 5 and (saveflag & STRLFB[STRGST.STRLFBehavior].ID) ~= 0 and STRLFB[STRGST.STRLFBehavior].Interact == false and m.numStars >= STRGST.STRLFLimit))
	
	LevelsFunctions = ((STRGST.STRLFLevels == 1 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID)
	or (STRGST.STRLFLevels == 2 and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 3 and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 4 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea) 
	or (STRGST.STRLFLevels == 5 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currActNum == STRGST.STRLFAct)
	or (STRGST.STRLFLevels == 6 and NP.currLevelNum == STRLevels[STRGST.STRLFLevel].STRLID and NP.currAreaIndex == STRGST.STRLFArea and NP.currActNum == STRGST.STRLFAct))
	
	ActionsTimerFunctions = (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer > 0 and network_is_server())
	ActionsFunctions = ((STRGST.STRLFActions == 1 and m.action == STRActions[STRGST.STRLFAction].A_ID)
	or (STRGST.STRLFActions == 2 and m.action == STRActions[STRGST.STRLFAction].A_ID and STRGST.STRLFTimer <= 0))
	
	PositionsFunctions = ((STRGST.STRLFPositions == 1 and m.pos.x == STRGST.STRLFXPos) 
	or (STRGST.STRLFPositions == 2 and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 3 and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 4 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos) 
	or (STRGST.STRLFPositions == 5 and m.pos.x == STRGST.STRLFXPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 6 and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos) 
	or (STRGST.STRLFPositions == 7 and m.pos.x == STRGST.STRLFXPos and m.pos.y == STRGST.STRLFYPos and m.pos.z == STRGST.STRLFZPos)
	or (STRGST.STRLFPositions == 8 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos)
	or (STRGST.STRLFPositions == 9 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos) 
	or (STRGST.STRLFPositions == 10 and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos)
	or (STRGST.STRLFPositions == 11 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEXPos) 
	or (STRGST.STRLFPositions == 12 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEYPos)
	or (STRGST.STRLFPositions == 13 and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFEZPos) 
	or (STRGST.STRLFPositions == 14 and m.pos.x <= STRGST.STRLFXPos and m.pos.x >= STRGST.STRLFEXPos and m.pos.y <= STRGST.STRLFYPos and m.pos.y >= STRGST.STRLFEYPos and m.pos.z <= STRGST.STRLFZPos and m.pos.z >= STRGST.STRLFZPos))
	
	ShowCDFont = (STRShowCDFont == "Enabled" and STRGST.STRGameState == "Lobby")
	ShowGoFont = (STRShowGoFont == "Enabled" and STRGST.STRGameState == "Lobby")
	
	if STRShowCDFont == "Enabled" and STRShowGoFont == "Enabled" then
	STRShowCDFont = "Disabled"
	STRShowGoFont = "Disabled"
	STR_Save("STRShowCountdown", STRShowCDFont)
	STR_Save("STRShowGo", STRShowGoFont)
	end
	
	if STRGST.STRUpdater < 10 and network_is_server() then STRGST.STRUpdater = STRGST.STRUpdater + 1 end	
	
	if STRLoadSaveUpdater < 3 then STRLoadSaveUpdater = STRLoadSaveUpdater + 1 end	
	
	if STRLoadSaveUpdater > 0 and STRLoadSaveUpdater < 2 then str_load_saves() str_save_flag() str_save_flag_saved() end
	
	if STRGST.STRUpdater < 3 then STRGST.STRSetLives = gMarioStates[0].numLives end
	
	if STRGST.STRGameState == "Started" and STRSettingsTimer >= 1 then STRSettingsTimer = STRSettingsTimer - 1 end
	
	if STRGST.STREraseSaveCD >= 1 and STRGST.EraseSave == true and network_is_server() then
	STRGST.STREraseSaveCD = STRGST.STREraseSaveCD - 1 / 30
	elseif STRGST.STREraseSaveCD <= 1 and STRGST.EraseSave == true then
	STRGST.EraseSave = false
	STRGST.STREraseSaveCD = 4
	end
	
	if STRGST.EraseSave == true and STRGST.STREraseSaveCD < 4 then warp_to_start_level() end
	
	if STRGST.STRGameState == "Finished" and STRGST.STRGameMode == 4 and STRGST.STRSSText >= 1 and network_is_server() then STRGST.STRSSText = STRGST.STRSSText - 1 end
	
	if (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Finished" or STRGST.STRGameState == "Paused") and GoDisplayFunc and network_is_server() then STRGST.STRGoText = STRGST.STRGoText + 1 end
	
	if STRGST.STRGameMode ~= 4 then
	if ((STRGST.STRGameState == "Preparing") or (STRGST.STRGlobalTimer <= 1 and STRGST.STRGameState == "Started")) and STRGST.STRStartingWarp < 3 and network_is_server() then
	STRGST.STRStartingWarp = STRGST.STRStartingWarp + 1
	end
	end
	
	if STRGST.STRGameState == "Resetting" or STRGST.STRGameState == "Finish_Lobby" then
	if STRGST.STRGameState == "Resetting" then STRGST.STRGlobalTimer = 0 STRGST.STRGoText = 0 end
	STRGST.STRGameState = "Lobby"
	STRGST.STRStartingWarp = 0
	STRGST.STRIntermission = 5
	STRGST.STRSecondsDelay = 0
	STRGST.STRCountdown = STRGST.STRCDNumber
	STRGST.STRFinishText = 12
	STRGST.STRIntroAction = 5
	STRSettingsTimer = 150
	STRGST.SavedBestTime = false
	end
end

function str_menu_description(m)
	if STRMenuButtons == "Buttons" then
	update_chat_command_description('str_menu', "[\\#FF0000\\Commands Only\\#FFFFFF\\]")
	elseif (STRMenuButtons == "Commands" or STRMenuButtons == "Both" or STRMenuButtons == "All") then
	update_chat_command_description('str_menu', "Display The Menu")
	end
end

function str_menu_command()
	if STRMenuButtons == "Buttons" then
	djui_chat_message_create("\\#FF0000\\This Command Works when having Commands Enabled") 
	return true
	elseif (STRMenuButtons == "Commands" or STRMenuButtons == "Both" or STRMenuButtons == "All") then
	STRMenuDisplay = true 
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	return true
	end
end


hook_chat_command("str_menu", "Display The Menu", str_menu_command)

if (STRMenuButtons == "Menu" or STRMenuButtons == "All") then
function STRMenuButton()
	if gMarioStates[0].action ~= ACT_EXIT_LAND_SAVE_DIALOG then
	STRMenuDisplay = true 
	game_unpause()
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	return not djui_hud_is_pause_menu_created()
end

if network_is_server() then
hook_mod_menu_button("Main Menu", STRMenuButton)
else
hook_mod_menu_button("Config Menu", STRMenuButton)
end
end

