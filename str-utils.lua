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
Save_Storage = mod_storage_save
Save_Numbers = mod_storage_save_number
Load_Storage = mod_storage_load

-- Global Saves
STRGST.STRFinishGameWarp = mod_storage_load("STRFGWarp") or "Enabled"
STRGST.STRForceLevelType = mod_storage_load("STRFLType") or "Levels"
STRGST.STRWarpType = mod_storage_load("STRWType") or "Start"
STRGST.STRForceSpot = mod_storage_load("STRFSpot") or "Start"
STRGST.STRBSFOption = mod_storage_load("STRBackupOption") or "Disabled"
STRGST.CasualGM = mod_storage_load("STRCasualOption") or "Disabled"

STRGST.STRCDNumber = tonumber(mod_storage_load("STRCDNum")) or 3
STRGST.STRGameMode = tonumber(mod_storage_load("STRGM")) or 1
STRGST.STRStartingType = tonumber(mod_storage_load("STRSType")) or 1

-- Global Functions
STRGST.STRGameState = "Lobby"
STRGST.STRStartingWarp = 0
STRGST.VanillaCG = false
STRGST.EraseSave = false
STRGST.SwitchIntro = false
STRGST.STRBackupSF = false
STRGST.STRSFUpdater = false
STRGST.STRPluginsCheck = false
STRGST.EnabledInteraction = true
STRGST.GrandStar = false
STRGST.CakeEnding = false
STRGST.AddRomhack = false
STRGST.DisableCSMoveset = true
STRGST.SavedBestTime = false
STRGST.WNRCheck = false

STRGST.SFSMipsStar1 = "Erase"
STRGST.SFSMipsStar2 = "Erase"
STRGST.SFSToadStar1 = "Erase"
STRGST.SFSToadStar2 = "Erase"
STRGST.SFSToadStar3 = "Erase"
STRGST.SFSWingCap = "Erase"
STRGST.SFSMetalCap = "Erase"
STRGST.SFSVanishCap = "Erase"
STRGST.SFSDDDMovedBack = "Erase"
STRGST.SFSMoatDrain = "Erase"
STRGST.SFS50StarDoor = "Erase"
STRGST.SFSBasementDoor = "Erase"
STRGST.SFSBTIDWDoor = "Erase"
STRGST.SFSBITFSDoor = "Erase"
STRGST.SFSCCMDoor = "Erase"
STRGST.SFSJRBDoor = "Erase"
STRGST.SFSPSSDoor = "Erase"
STRGST.SFSUpstairsDoor = "Erase"
STRGST.SFSWFDoor = "Erase"
STRGST.SFSKeys = "Erase"

for warpnoderandom in pairs(gActiveMods) do
    if gActiveMods[warpnoderandom].name:find("Warp Node Randomizer") then
        STRGST.WNRCheck = true
		break
    end
end

-- Global Number Functions
STRGST.STRGlobalTimer = 0
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
STRGST.STRLFSetTimer = 0
STRGST.STRLFActions = 1

STRGST.STRLFXPos = 0
STRGST.STRLFYPos = 0
STRGST.STRLFZPos = 0
STRGST.STRLFEXPos = 0
STRGST.STRLFEYPos = 0
STRGST.STRLFEZPos = 0
STRGST.STRLFPositions = 1

-- Local Saves
STRMenuButtons = mod_storage_load("STRMButtons") or "Both"
STRCustomColors = mod_storage_load("STRCColors") or "Enabled"
STRLocationSpot = mod_storage_load("STRLSpot") or "Ground"
STRRenderType = mod_storage_load("STRRType") or "Behind"
STRRules = mod_storage_load("STRRulesDisplay") or "Enabled"
STRHelper = mod_storage_load("STRHelperDisplay") or "Enabled"
STRRDisplay = mod_storage_load("STRRequireDisplay") or "Start"
STRMenuWarpType = mod_storage_load("STRMenuWType") or "Start"
STRBestTimeOption = mod_storage_load("STRBestTimeType") or "Saves"

STRMBinds1 = tonumber(Load_Storage("STRMenuBinds1")) or 6
STRMBinds2 = tonumber(Load_Storage("STRMenuBinds2")) or 7
STRMBinds3 = tonumber(Load_Storage("STRMenuBinds3")) or 10

STRRBinds1 = tonumber(Load_Storage("STRRulesBinds1")) or 6
STRRBinds2 = tonumber(Load_Storage("STRRulesBinds2")) or 7
STRRBinds3 = tonumber(Load_Storage("STRRulesBinds3")) or 11

STRSBinds1 = tonumber(Load_Storage("STRSingleBinds1")) or 6
STRSBinds2 = tonumber(Load_Storage("STRSingleBinds2")) or 1
STRSBinds3 = tonumber(Load_Storage("STRSingleBinds3")) or 1

STRFR = tonumber(Load_Storage("STRFRed")) or 255
STRFB = tonumber(Load_Storage("STRFBlue")) or 255
STRFG = tonumber(Load_Storage("STRFGreen")) or 255
STRFV = tonumber(Load_Storage("STRFVisible")) or 255

STRRR = tonumber(Load_Storage("STRRRed")) or 0
STRRB = tonumber(Load_Storage("STRRBlue")) or 0
STRRG = tonumber(Load_Storage("STRRGreen")) or 0
STRRV = tonumber(Load_Storage("STRRVisible")) or 128

CXPos = tonumber(mod_storage_load("STRXPos")) or 0
CYPos = tonumber(mod_storage_load("STRYPos")) or 0

STRMenuR = tonumber(Load_Storage("STRMenuRed")) or 0
STRMenuB = tonumber(Load_Storage("STRMenuBlue")) or 0
STRMenuG = tonumber(Load_Storage("STRMenuGreen")) or 0
STRMenuV = tonumber(Load_Storage("STRMenuVisible")) or 128

-- Local Functions
STRMenuDisplay = false
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

if network_is_server() then
STRMenuTitleName = "MDMain"
else
STRMenuTitleName = "MDConfig"
end
MenuSelectedOption = "Main"
MenuViewHostCheck = false

-- Local Number Functions
STRLoadSaveUpdater = 0
STRSettingsTimer = 150
STRBestTimeNumber = 0
STRBTNLimit = 30
STRHelperTimer = 10
STRHelperHide = 255

STRFontTMNumber = 1
STRFontCDNumber = 1
STRFontGONumber = 1

STRFanfareNumber = 1
STRCountdownNumber = 1
STRGoNumber = 1

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
	[16] = {Type = "All Switches",    ID = SAVE_FLAG_HAVE_WING_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_METAL_CAP, 				Interact = false},
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

-- Save Functions (Thanks to Squishy)
function load_saves()
	STRSavFontTM = Load_Storage("STRFontTM")
	STRSavFontCD = Load_Storage("STRFontCD")
	STRSavFontGO = Load_Storage("STRFontGO")
	
	STRSavFanfare = Load_Storage("STRFanfare")
	STRSavCountdown = Load_Storage("STRCountdown")
	STRSavGo = Load_Storage("STRGo")
	
    if STRSavFontTM == nil or STRSavFontTM == "" then
        Save_Storage("STRFontTM", "Normal")
        STRSavFontTM = "Normal"
    end
    if STRSavFontTM ~= nil and STRSavFontTM ~= "Normal" then
        for i = 2, #STRFontsTable do
            if STRFontsTable[i].str_font_id == STRSavFontTM then
                STRFontTMNumber = i
			end
		end
	end
	
	if STRSavFontCD == nil or STRSavFontCD == "" then
        Save_Storage("STRFontCD", "Normal")
        STRSavFontCD = "Normal"
    end
    if STRSavFontCD ~= nil and STRSavFontCD ~= "Normal" then
        for i = 2, #STRFontsTable do
            if STRFontsTable[i].str_font_id == STRSavFontCD then
                STRFontCDNumber = i
			end
		end
	end
	
	if STRSavFontGO == nil or STRSavFontGO == "" then
        Save_Storage("STRFontGO", "Normal")
        STRSavFontGO = "Normal"
    end
    if STRSavFontGO ~= nil and STRSavFontGO ~= "Normal" then
        for i = 2, #STRFontsTable do
            if STRFontsTable[i].str_font_id == STRSavFontGO then
                STRFontGONumber = i
			end
		end
	end
	
	if STRSavFanfare == nil or STRSavFanfare == "" then
        Save_Storage("STRFanfare", "RaceFanfare")
        STRSavFanfare = "RaceFanfare"
    end
    if STRSavFanfare ~= nil and STRSavFanfare ~= "RaceFanfare" then
        for i = 2, #STRFanfareTable do
            if STRFanfareTable[i].str_fanfare_id == STRSavFanfare then
                STRFanfareNumber = i
			end
		end
	end
	
	if STRSavCountdown == nil or STRSavCountdown == "" then
        Save_Storage("STRCountdown", "ChangeSelect")
        STRSavCountdown = "ChangeSelect"
    end
    if STRSavCountdown ~= nil and STRSavCountdown ~= "ChangeSelect" then
        for i = 2, #STRCountdownTable do
            if STRCountdownTable[i].str_countdown_id == STRSavCountdown then
                STRCountdownNumber = i
			end
		end
	end
	
	if STRSavGo == nil or STRSavGo == "" then
        Save_Storage("STRGo", "GunShot")
        STRSavGo = "GunShot"
    end
    if STRSavGo ~= nil and STRSavGo ~= "GunShot" then
        for i = 2, #STRGoTable do
            if STRGoTable[i].str_go_id == STRSavGo then
                STRGoNumber = i
			end
		end
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
	Hud_Color(STRFR, STRFG, STRFB, STRFV);
	else
	Hud_Color(255, 255, 255, STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_shadow_text(text, x, y, scale, px, py)
    Hud_Color(0, 0, 0, STRFV);
    Hud_Text(text, x + px, y + py, scale);

    if STRCustomColors == "Enabled" then
	Hud_Color(STRFR, STRFG, STRFB, STRFV);
	else
	Hud_Color(255, 255, 255, STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_romhack_text(text, x, y, scale, colors)
	if STRNumbers == true and colors == "Numbers" and STRCustomColors == "Enabled" then
	Hud_Color(STRFR, STRFG, STRFB, STRFV);
	elseif STRNumbers == false and colors == "Numbers" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFV);
	end
	
	if STRWords == true and colors == "Words" and STRCustomColors == "Enabled" then
	Hud_Color(STRFR, STRFG, STRFB, STRFV);
	elseif STRWords == false and colors == "Words" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFV);
	end
	
	if STRQuotes == true and colors == "Quotes" and STRCustomColors == "Enabled" then
	Hud_Color(STRFR, STRFG, STRFB, STRFV);
	elseif STRQuotes == false and colors == "Quotes" and STRCustomColors == "Enabled" then
	Hud_Color(255, 255, 255, STRFV);
	end
	
	if STRCustomColors == "Disabled" then
	Hud_Color(255, 255, 255, STRFV);
	end
    Hud_Text(text, x, y, scale);
end

function custom_render_rect(x, y, w, h)
	if STRCustomColors == "Enabled" then
	Hud_Color(STRRR, STRRG, STRRB, STRRV);
	else
	Hud_Color(0, 0, 0, STRRV);
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

	if STRGST.SFSMipsStar1 == "Erase" then save_file_clear_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_1) end
	if STRGST.SFSMipsStar2 == "Erase" then save_file_clear_flags(SAVE_FLAG_COLLECTED_MIPS_STAR_2) end
	if STRGST.SFSToadStar1 == "Erase" then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_1) end
	if STRGST.SFSToadStar2 == "Erase" then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_2) end
	if STRGST.SFSToadStar3 == "Erase" then save_file_clear_flags(SAVE_FLAG_COLLECTED_TOAD_STAR_3) end
	if STRGST.SFSWingCap == "Erase" then save_file_clear_flags(SAVE_FLAG_HAVE_WING_CAP) end
	if STRGST.SFSMetalCap == "Erase" then save_file_clear_flags(SAVE_FLAG_HAVE_METAL_CAP) end
	if STRGST.SFSVanishCap == "Erase" then save_file_clear_flags(SAVE_FLAG_HAVE_VANISH_CAP) end
	if STRGST.SFSDDDMovedBack == "Erase" then save_file_clear_flags(SAVE_FLAG_DDD_MOVED_BACK) end
	if STRGST.SFSMoatDrain == "Erase" then save_file_clear_flags(SAVE_FLAG_MOAT_DRAINED) end
	if STRGST.SFS50StarDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_50_STAR_DOOR) end
	if STRGST.SFSBasementDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BASEMENT_DOOR) end
	if STRGST.SFSBTIDWDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BITDW_DOOR) end
	if STRGST.SFSBITFSDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_BITFS_DOOR) end
	if STRGST.SFSCCMDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_CCM_DOOR) end
	if STRGST.SFSJRBDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_JRB_DOOR) end
	if STRGST.SFSPSSDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_PSS_DOOR) end
	if STRGST.SFSUpstairsDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_UPSTAIRS_DOOR) end
	if STRGST.SFSWFDoor == "Erase" then save_file_clear_flags(SAVE_FLAG_UNLOCKED_WF_DOOR) end
	if STRGST.SFSKeys == "Erase" then save_file_clear_flags(SAVE_FLAG_HAVE_KEY_1 | SAVE_FLAG_HAVE_KEY_2) end
	save_file_do_save(file, 1)
    update_all_mario_stars()
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

function str_erase_save()
	if STRGST.STREraseSaveCD < 1 and STRGST.EraseSave == true then
	str_reset_save()
	save_file_reload(0)
	network_send(true, {Update = STR_Packet_Data})
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
	
	if (STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay == 3 and (STRGST.STRStartingType == 1 or STRGST.STRStartingType == 2)) and STRFanfareNumber == 1 then
		play_race_fanfare()
	end
	
	if STRGST.STRCDSounds == 29 and STRCountdownNumber < 6 then
		play_sound(STRCountdownTable[STRCountdownNumber].str_countdown_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	if STRGST.STRGlobalTimer == 2 and STRGoNumber == 1 and STRGST.STRGameMode ~= 4 then
		play_sound(STRGoTable[STRGoNumber].str_go_sound, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
end

function str_level_updater()
	if not network_is_server() then return end
	LocationSpot = ((STRLocationSpot == "Anywhere" and gMarioStates[0].action & ACT_FLAG_AIR ~= 0) or ((gMarioStates[0].action & ACT_FLAG_AIR) == 0 and STRLocationSpot == "Ground"))
	InstantSpot = (STRLocationSpot == "FrameSpot")
	
	if STRGST.STRSpotUpdater < 5 and (LocationSpot or InstantSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
        STRGST.STRSpotUpdater = STRGST.STRSpotUpdater + 1
    end	
	
	if STRGST.STRSavSpotUpdater < 5 and (LocationSpot or InstantSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
        STRGST.STRSavSpotUpdater = STRGST.STRSavSpotUpdater + 1
    end	
	
	if STRGST.STRSavLevelUpdater < 5 and network_is_server() and STRGST.WarpNodeRandomierDeplay > 89 then
        STRGST.STRSavLevelUpdater = STRGST.STRSavLevelUpdater + 1
	end	
	
	if (STRGST.STRSpotUpdater < 5 and LocationSpot) or (STRGST.STRSpotUpdater < 2 and InstantSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRXPos = gMarioStates[0].pos.x
	STRGST.STRYPos = gMarioStates[0].pos.y
	STRGST.STRZPos = gMarioStates[0].pos.z
	end
	
	if (STRGST.STRSavSpotUpdater < 5 and LocationSpot) or (STRGST.STRSavSpotUpdater < 2 and InstantSpot) and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRSavXPos = gMarioStates[0].pos.x
	STRGST.STRSavYPos = gMarioStates[0].pos.y
	STRGST.STRSavZPos = gMarioStates[0].pos.z
	end
	
	if STRGST.STRLevelUpdater < 5 and network_is_server() and STRGST.WarpNodeRandomierDeplay > 89 then
        STRGST.STRLevelUpdater = STRGST.STRLevelUpdater + 1
	end	
	
	if STRGST.STRLevelUpdater < 5 and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRLevelID = gNetworkPlayers[0].currLevelNum
	STRGST.STRCourseID = gNetworkPlayers[0].currCourseNum
	STRGST.STRAreaID = gNetworkPlayers[0].currAreaIndex
	STRGST.STRActID = gNetworkPlayers[0].currActNum
	end

	if STRGST.STRSavLevelUpdater < 5 and STRGST.WarpNodeRandomierDeplay > 89 then
	STRGST.STRSavLevelID = gNetworkPlayers[0].currLevelNum
	STRGST.STRSavCourseID = gNetworkPlayers[0].currCourseNum
	STRGST.STRSavAreaID = gNetworkPlayers[0].currAreaIndex
	STRGST.STRSavActID = gNetworkPlayers[0].currActNum
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
	
	saveflag, m, Star, NP = save_file_get_flags(), gMarioStates[0], INTERACT_STAR_OR_KEY, gNetworkPlayers[0]
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

	if STRGST.STRUpdater < 10 and network_is_server() then
        STRGST.STRUpdater = STRGST.STRUpdater + 1
    end	
	
	if STRLoadSaveUpdater < 3 then
        STRLoadSaveUpdater = STRLoadSaveUpdater + 1
    end	
	
	if STRLoadSaveUpdater > 0 and STRLoadSaveUpdater < 2 then
	load_saves()
	end
	
	if STRGST.STRUpdater < 3 then
	STRGST.STRSetLives = gMarioStates[0].numLives
	end
	
	if STRGST.STRGameState == "Started" and STRSettingsTimer >= 1 then
	STRSettingsTimer = STRSettingsTimer - 1
	end
	
	if STRGST.STREraseSaveCD >= 1 and STRGST.EraseSave == true and network_is_server() then
	STRGST.STREraseSaveCD = STRGST.STREraseSaveCD - 1 / 30
	elseif STRGST.STREraseSaveCD <= 1 and STRGST.EraseSave == true then
	STRGST.EraseSave = false
	STRGST.STREraseSaveCD = 4
	end
	
	if STRGST.EraseSave == true and STRGST.STREraseSaveCD < 4 then
	warp_to_start_level()
	end
	
	if STRGST.STRGameState == "Finished" and STRGST.STRGameMode == 4 and STRGST.STRSSText >= 1 and network_is_server() then
	STRGST.STRSSText = STRGST.STRSSText - 1
	end
	
	if (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Finished" or STRGST.STRGameState == "Paused") and GoDisplayFunc and network_is_server() then
	STRGST.STRGoText = STRGST.STRGoText + 1
	end
	
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
	elseif (STRMenuButtons == "Commands" or STRMenuButtons == "Both") then
	update_chat_command_description('str_menu', "Display The Menu")
	end
end

function str_menu_command()
	if STRMenuButtons == "Buttons" then
	djui_chat_message_create("\\#FF0000\\This Command Works when having Commands Enabled") 
	return true
	elseif (STRMenuButtons == "Commands" or STRMenuButtons == "Both") then
	STRMenuDisplay = true 
	play_sound(SOUND_MENU_HAND_APPEAR, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	return true
	end
end


hook_chat_command("str_menu", "Display The Menu", str_menu_command)
