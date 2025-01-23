if gamemodes_is_checked or notallowedmods or no_cheats then return end

gGlobalSyncTable.LevelsDefault = 1
gGlobalSyncTable.LFLevels = 1
gGlobalSyncTable.LFActions = 1
gGlobalSyncTable.StartingLevelsDefault = tonumber(mod_storage_load("StartingLevels")) or 1
RunDefault = 1
AntiCheatDefault = 1
RunTable = {}
AntiCheatTable = {}
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
	[6] = {
        name = "Nametags",
        longname = "Coop Nametags Font"

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

ActionsTable = {
    [1] = {
		action_name = "Disappeared",
		action_id = ACT_DISAPPEARED
    },
	[2] = {
		action_name = "No Spin Air",
		action_id = ACT_SPAWN_NO_SPIN_AIRBORNE
    },
	[3] = {
		action_name = "No Spin Land",
		action_id = ACT_SPAWN_NO_SPIN_LANDING
    },
	[4] = {
		action_name = "Spawn Spin Air",
		action_id = ACT_SPAWN_SPIN_AIRBORNE
    },
	[5] = {
		action_name = "Spawn Spin land",
		action_id = ACT_SPAWN_SPIN_LANDING
    },
	[6] = {
		action_name = "Star Exit",
		action_id = ACT_STAR_DANCE_EXIT
    },
	[7] = {
		action_name = "Star No Exit",
		action_id = ACT_STAR_DANCE_NO_EXIT
    },
	[8] = {
		action_name = "Star Water Exit",
		action_id = ACT_STAR_DANCE_WATER
    },
}

LevelsTable = {
    [1] = {
        levelname = "Castle Grounds",
        levelid = LEVEL_CASTLE_GROUNDS
    },
	[2] = {
        levelname = "Castle",
        levelid = LEVEL_CASTLE
    },
	[3] = {
        levelname = "Castle Courtyard",
        levelid = LEVEL_CASTLE_COURTYARD
    },
	[4] = {
        levelname = "Bob-omb BattleField",
        levelid = LEVEL_BOB
    },
	[5] = {
        levelname = "Whomp's Fortress",
        levelid = LEVEL_WF
    },
	[6] = {
        levelname = "Jolly Roger Bay",
        levelid = LEVEL_JRB
    },
	[7] = {
        levelname = "Cool Cool Mountain",
        levelid = LEVEL_CCM
    },
	[8] = {
        levelname = "Big Boo's Haunt",
        levelid = LEVEL_BBH
    },
	[9] = {
        levelname = "Hazy Maze Cave",
        levelid = LEVEL_HMC
    },
	[10] = {
        levelname = "Lethal Lava Land",
        levelid = LEVEL_LLL
    },
	[11] = {
        levelname = "Shifting Sand Land",
        levelid = LEVEL_SSL
    },
	[12] = {
        levelname = "Dire Dire Docks",
        levelid = LEVEL_DDD
    },
	[13] = {
        levelname = "Snowman's Land",
        levelid = LEVEL_SL
    },
	[14] = {
        levelname = "Wet Dry World",
        levelid = LEVEL_WDW
    },
	[15] = {
        levelname = "Tall Tall Mountain",
        levelid = LEVEL_TTM
    },
	[16] = {
        levelname = "Tiny Huge Island",
        levelid = LEVEL_THI
    },
	[17] = {
        levelname = "Tick Tock Clock",
        levelid = LEVEL_TTC
    },
	[18] = {
        levelname = "Rainbow Ride",
        levelid = LEVEL_RR
    },
	[19] = {
        levelname = "Princess's Secret Slide",
        levelid = LEVEL_PSS
    },
	[20] = {
        levelname = "Secret Aquarium",
        levelid = LEVEL_SA
    },
	[21] = {
        levelname = "Wing Mario over the Rainbow",
        levelid = LEVEL_WMOTR
    },
	[22] = {
        levelname = "Tower of the Wing Cap",
        levelid = LEVEL_TOTWC
    },
	[23] = {
        levelname = "Cavern of the Metal Cap",
        levelid = LEVEL_COTMC
    },
	[24] = {
        levelname = "Vanish Cap Under the Moat",
        levelid = LEVEL_VCUTM
    },
	[25] = {
        levelname = "Bowser in the Dark World",
        levelid = LEVEL_BITDW
    },
	[26] = {
        levelname = "Bowser in the Fire Sea",
        levelid = LEVEL_BITFS
    },
	[27] = {
        levelname = "Bowser in the Sky",
        levelid = LEVEL_BITS
    },
	[28] = {
        levelname = "Cake Ending/End Picture",
        levelid = LEVEL_ENDING
    },
}

StartingLevelTable = {
    [1] = {
        leveldisplay = "CastleGrounds",
        levelid = LEVEL_CASTLE_GROUNDS
    },
	[2] = {
        leveldisplay = "Castle",
        levelid = LEVEL_CASTLE
    },
	[3] = {
        leveldisplay = "CastleCourtyard",
        levelid = LEVEL_CASTLE_COURTYARD
    },
	[4] = {
        leveldisplay = "BOB",
        levelid = LEVEL_BOB
    },
	[5] = {
        leveldisplay = "WF",
        levelid = LEVEL_WF
    },
	[6] = {
        leveldisplay = "JRB",
        levelid = LEVEL_JRB
    },
	[7] = {
		leveldisplay = "CCM",
        levelid = LEVEL_CCM
    },
	[8] = {
		leveldisplay = "BBH",
        levelid = LEVEL_BBH
    },
	[9] = {
		leveldisplay = "HMC",
        levelid = LEVEL_HMC
    },
	[10] = {
		leveldisplay = "LLL",
        levelid = LEVEL_LLL
    },
	[11] = {
		leveldisplay = "SSL",
        levelid = LEVEL_SSL
    },
	[12] = {
		leveldisplay = "DDD",
        levelid = LEVEL_DDD
    },
	[13] = {
        leveldisplay = "SL",
        levelid = LEVEL_SL
    },
	[14] = {
        leveldisplay = "WDW",
        levelid = LEVEL_WDW
    },
	[15] = {
        leveldisplay = "TTM",
        levelid = LEVEL_TTM
    },
	[16] = {
        leveldisplay = "THI",
        levelid = LEVEL_THI
    },
	[17] = {
        leveldisplay = "TTC",
        levelid = LEVEL_TTC
    },
	[18] = {
        leveldisplay = "RR",
        levelid = LEVEL_RR
    },
	[19] = {
        leveldisplay = "PSS",
        levelid = LEVEL_PSS
    },
	[20] = {
        leveldisplay = "SA",
        levelid = LEVEL_SA
    },
	[21] = {
        leveldisplay = "WMOTR",
        levelid = LEVEL_WMOTR
    },
	[22] = {
        leveldisplay = "TOTWC",
        levelid = LEVEL_TOTWC
    },
	[23] = {
        leveldisplay = "COTMC",
        levelid = LEVEL_COTMC
    },
	[24] = {
        leveldisplay = "VCUTM",
        levelid = LEVEL_VCUTM
    },
	[25] = {
        leveldisplay = "BITDW",
        levelid = LEVEL_BITDW
    },
	[26] = {
        leveldisplay = "BITFS",
        levelid = LEVEL_BITFS
    },
	[27] = {
        leveldisplay = "BITS",
        levelid = LEVEL_BITS
    },
}

LevelFunctionTable = {
    [1] = {
        levelname = "Grounds",
        levelid = LEVEL_CASTLE_GROUNDS
    },
	[2] = {
        levelname = "Castle",
        levelid = LEVEL_CASTLE
    },
	[3] = {
        levelname = "Courtyard",
        levelid = LEVEL_CASTLE_COURTYARD
    },
	[4] = {
        levelname = "BOB",
        levelid = LEVEL_BOB
    },
	[5] = {
        levelname = "WF",
        levelid = LEVEL_WF
    },
	[6] = {
        levelname = "JRB",
        levelid = LEVEL_JRB
    },
	[7] = {
		levelname = "CCM",
        levelid = LEVEL_CCM
    },
	[8] = {
		levelname = "BBH",
        levelid = LEVEL_BBH
    },
	[9] = {
		levelname = "HMC",
        levelid = LEVEL_HMC
    },
	[10] = {
		levelname = "LLL",
        levelid = LEVEL_LLL
    },
	[11] = {
		levelname = "SSL",
        levelid = LEVEL_SSL
    },
	[12] = {
		levelname = "DDD",
        levelid = LEVEL_DDD
    },
	[13] = {
        levelname = "SL",
        levelid = LEVEL_SL
    },
	[14] = {
        levelname = "WDW",
        levelid = LEVEL_WDW
    },
	[15] = {
        levelname = "TTM",
        levelid = LEVEL_TTM
    },
	[16] = {
        levelname = "THI",
        levelid = LEVEL_THI
    },
	[17] = {
        levelname = "TTC",
        levelid = LEVEL_TTC
    },
	[18] = {
        levelname = "RR",
        levelid = LEVEL_RR
    },
	[19] = {
        levelname = "PSS",
        levelid = LEVEL_PSS
    },
	[20] = {
        levelname = "SA",
        levelid = LEVEL_SA
    },
	[21] = {
        levelname = "WMOTR",
        levelid = LEVEL_WMOTR
    },
	[22] = {
        levelname = "TOTWC",
        levelid = LEVEL_TOTWC
    },
	[23] = {
        levelname = "COTMC",
        levelid = LEVEL_COTMC
    },
	[24] = {
        levelname = "VCUTM",
        levelid = LEVEL_VCUTM
    },
	[25] = {
        levelname = "BITDW",
        levelid = LEVEL_BITDW
    },
	[26] = {
        levelname = "BITFS",
        levelid = LEVEL_BITFS
    },
	[27] = {
        levelname = "BITS",
        levelid = LEVEL_BITS
    },
	[28] = {
        levelname = "END",
        levelid = LEVEL_ENDING
    },
}