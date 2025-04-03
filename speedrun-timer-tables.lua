if gamemodes_is_checked or notallowedmods or no_cheats then return end

gGlobalSyncTable.SSLevels = 1
gGlobalSyncTable.LFLevels = 1
gGlobalSyncTable.LFActions = 1
gGlobalSyncTable.MSTableNumbers = 0
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
MilliSecondsNumberTable = {
	[0] = 000,
    [1] = 033,
	[2] = 066,
	[3] = 099,
	[4] = 100,
	[5] = 133,
	[6] = 166,
	[7] = 199,
	[8] = 200,
	[9] = 233,
	[10] = 266,
	[11] = 299,
	[12] = 300,
	[13] = 333,
	[14] = 366,
	[15] = 399,
	[16] = 400,
	[17] = 433,
	[18] = 466,
	[19] = 499,
	[20] = 500,
	[21] = 533,
	[22] = 566,
	[23] = 599,
	[24] = 600,
	[25] = 633,
	[26] = 666,
	[27] = 699,
	[28] = 700,
	[29] = 733,
	[30] = 766,
	[31] = 799,
	[32] = 800,
	[33] = 833,
	[34] = 866,
	[35] = 899,
	[36] = 900,
	[37] = 933,
	[38] = 966,
	[39] = 999,
}

FontTable = {
    [1] = {
        name = "Normal",
        longname = "Super Mario 64 Text"
    },
	[2] = {
        name = "Aliased",
        longname = "Coopdx Aliased Text"
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
        longname = "Coopdx Menu Font"
    },
	[6] = {
        name = "Special",
        longname = "Coopdx Special Font"

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
		action_name = "Spawn No Spin Airborne",
		action_id = ACT_SPAWN_NO_SPIN_AIRBORNE
    },
	[3] = {
		action_name = "Spawn No Spin Landing",
		action_id = ACT_SPAWN_NO_SPIN_LANDING
    },
	[4] = {
		action_name = "Spawn Spin Airborne",
		action_id = ACT_SPAWN_SPIN_AIRBORNE
    },
	[5] = {
		action_name = "Spawn Spin Landing",
		action_id = ACT_SPAWN_SPIN_LANDING
    },
	[6] = {
		action_name = "Star Dance Exit",
		action_id = ACT_STAR_DANCE_EXIT
    },
	[7] = {
		action_name = "Star Dance No Exit",
		action_id = ACT_STAR_DANCE_NO_EXIT
    },
	[8] = {
		action_name = "Star Dance Water Exit",
		action_id = ACT_STAR_DANCE_WATER
    },
}

StartingLevelsTable = {
	-- Hud Levels
    [LEVEL_CASTLE_GROUNDS] = "Castle Grounds",
	[LEVEL_CASTLE] = "Castle",
	[LEVEL_CASTLE_COURTYARD] = "Castle Courtyard",
	
	-- Main Levels
	[LEVEL_BOB] = "Bob-omb BattleField",
	[LEVEL_WF] = "Whomp's Fortress",
	[LEVEL_JRB] = "Jolly Roger Bay",
	[LEVEL_CCM] = "Cool Cool Mountain",
	[LEVEL_BBH] = "Big Boo's Haunt",
	[LEVEL_HMC] = "Hazy Maze Cave",
	[LEVEL_LLL] = "Lethal Lava Land",
	[LEVEL_SSL] = "Shifting Sand Land",
	[LEVEL_DDD] = "Dire Dire Docks",
	[LEVEL_SL] = "Snowman's Land",
	[LEVEL_WDW] = "Wet Dry World",
	[LEVEL_TTM] = "Tall Tall Mountain",
	[LEVEL_THI] = "Tiny Huge Island",
	[LEVEL_TTC] = "Tick Tock Clock",
	[LEVEL_RR] = "Rainbow Ride",
	
	-- Secret Levels
	[LEVEL_PSS] = "Princess's Secret Slide",
	[LEVEL_SA] = "Secret Aquarium",
	[LEVEL_WMOTR] = "Wing Mario over the Rainbow",
	[LEVEL_TOTWC] = "Tower of the Wing Cap",
	[LEVEL_VCUTM] = "Cavern of the Metal Cap",
	
	-- Bowser's Levels
	[LEVEL_BITDW] = "Bowser in the Dark World",
	[LEVEL_BITFS] = "Bowser in the Fire Sea",
	[LEVEL_BITS] = "Bowser in the Sky",
	
	-- Ending Level
	[LEVEL_ENDING] = "Cake Ending/End Picture",
	
	-- Extra Levels (Every Level Besides Level None is Unused)
	[50] = "Course None", -- LEVEL_NONE Number ID
	[LEVEL_UNKNOWN_1] = "Level Unknown 1",
	[LEVEL_UNKNOWN_2] = "Level Unknown 2",
	[LEVEL_UNKNOWN_3] = "Level Unknown 3",
	[LEVEL_UNKNOWN_35] = "Level Unknown 35",
	[LEVEL_UNKNOWN_37] = "Level Unknown 37",
	[LEVEL_UNKNOWN_38] = "Level Unknown 38"
}

SingleStarsLevelsTable = {
    [1] = {
        SSlevelname = "Castle Grounds",
        SSlevelid = LEVEL_CASTLE_GROUNDS
    },
	[2] = {
        SSlevelname = "Castle",
        SSlevelid = LEVEL_CASTLE
    },
	[3] = {
        SSlevelname = "Castle Courtyard",
        SSlevelid = LEVEL_CASTLE_COURTYARD
    },
	[4] = {
        SSlevelname = "Bob-omb BattleField",
        SSlevelid = LEVEL_BOB
    },
	[5] = {
        SSlevelname = "Whomp's Fortress",
        SSlevelid = LEVEL_WF
    },
	[6] = {
        SSlevelname = "Jolly Roger Bay",
        SSlevelid = LEVEL_JRB
    },
	[7] = {
        SSlevelname = "Cool Cool Mountain",
        SSlevelid = LEVEL_CCM
    },
	[8] = {
        SSlevelname = "Big Boo's Haunt",
        SSlevelid = LEVEL_BBH
    },
	[9] = {
        SSlevelname = "Hazy Maze Cave",
        SSlevelid = LEVEL_HMC
    },
	[10] = {
        SSlevelname = "Lethal Lava Land",
        SSlevelid = LEVEL_LLL
    },
	[11] = {
        SSlevelname = "Shifting Sand Land",
        SSlevelid = LEVEL_SSL
    },
	[12] = {
        SSlevelname = "Dire Dire Docks",
        SSlevelid = LEVEL_DDD
    },
	[13] = {
        SSlevelname = "Snowman's Land",
        SSlevelid = LEVEL_SL
    },
	[14] = {
        SSlevelname = "Wet Dry World",
        SSlevelid = LEVEL_WDW
    },
	[15] = {
        SSlevelname = "Tall Tall Mountain",
        SSlevelid = LEVEL_TTM
    },
	[16] = {
        SSlevelname = "Tiny Huge Island",
        SSlevelid = LEVEL_THI
    },
	[17] = {
        SSlevelname = "Tick Tock Clock",
        SSlevelid = LEVEL_TTC
    },
	[18] = {
        SSlevelname = "Rainbow Ride",
        SSlevelid = LEVEL_RR
    },
	[19] = {
        SSlevelname = "Princess's Secret Slide",
        SSlevelid = LEVEL_PSS
    },
	[20] = {
        SSlevelname = "Secret Aquarium",
        SSlevelid = LEVEL_SA
    },
	[21] = {
        SSlevelname = "Wing Mario over the Rainbow",
        SSlevelid = LEVEL_WMOTR
    },
	[22] = {
        SSlevelname = "Tower of the Wing Cap",
        SSlevelid = LEVEL_TOTWC
    },
	[23] = {
        SSlevelname = "Cavern of the Metal Cap",
        SSlevelid = LEVEL_COTMC
    },
	[24] = {
        SSlevelname = "Vanish Cap Under the Moat",
        SSlevelid = LEVEL_VCUTM
    },
	[25] = {
        SSlevelname = "Bowser in the Dark World",
        SSlevelid = LEVEL_BITDW
    },
	[26] = {
        SSlevelname = "Bowser in the Fire Sea",
        SSlevelid = LEVEL_BITFS
    },
	[27] = {
        SSlevelname = "Bowser in the Sky",
        SSlevelid = LEVEL_BITS
    },
	[28] = {
        SSlevelname = "Cake Ending/End Picture",
        SSlevelid = LEVEL_ENDING
    },
}

LevelFunctionTable = {
    [1] = {
        LFlevelname = "Grounds",
        LFlevelid = LEVEL_CASTLE_GROUNDS
    },
	[2] = {
        LFlevelname = "Castle",
        LFlevelid = LEVEL_CASTLE
    },
	[3] = {
        LFlevelname = "Courtyard",
        LFlevelid = LEVEL_CASTLE_COURTYARD
    },
	[4] = {
        LFlevelname = "BOB",
        LFlevelid = LEVEL_BOB
    },
	[5] = {
        LFlevelname = "WF",
        LFlevelid = LEVEL_WF
    },
	[6] = {
        LFlevelname = "JRB",
        LFlevelid = LEVEL_JRB
    },
	[7] = {
		LFlevelname = "CCM",
        LFlevelid = LEVEL_CCM
    },
	[8] = {
		LFlevelname = "BBH",
        LFlevelid = LEVEL_BBH
    },
	[9] = {
		LFlevelname = "HMC",
        LFlevelid = LEVEL_HMC
    },
	[10] = {
		LFlevelname = "LLL",
        LFlevelid = LEVEL_LLL
    },
	[11] = {
		LFlevelname = "SSL",
        LFlevelid = LEVEL_SSL
    },
	[12] = {
		LFlevelname = "DDD",
        LFlevelid = LEVEL_DDD
    },
	[13] = {
        LFlevelname = "SL",
        LFlevelid = LEVEL_SL
    },
	[14] = {
        LFlevelname = "WDW",
        LFlevelid = LEVEL_WDW
    },
	[15] = {
        LFlevelname = "TTM",
        LFlevelid = LEVEL_TTM
    },
	[16] = {
        LFlevelname = "THI",
        LFlevelid = LEVEL_THI
    },
	[17] = {
        LFlevelname = "TTC",
        LFlevelid = LEVEL_TTC
    },
	[18] = {
        LFlevelname = "RR",
        LFlevelid = LEVEL_RR
    },
	[19] = {
        LFlevelname = "PSS",
        LFlevelid = LEVEL_PSS
    },
	[20] = {
        LFlevelname = "SA",
        LFlevelid = LEVEL_SA
    },
	[21] = {
        LFlevelname = "WMOTR",
        LFlevelid = LEVEL_WMOTR
    },
	[22] = {
        LFlevelname = "TOTWC",
        LFlevelid = LEVEL_TOTWC
    },
	[23] = {
        LFlevelname = "COTMC",
        LFlevelid = LEVEL_COTMC
    },
	[24] = {
        LFlevelname = "VCUTM",
        LFlevelid = LEVEL_VCUTM
    },
	[25] = {
        LFlevelname = "BITDW",
        LFlevelid = LEVEL_BITDW
    },
	[26] = {
        LFlevelname = "BITFS",
        LFlevelid = LEVEL_BITFS
    },
	[27] = {
        LFlevelname = "BITS",
        LFlevelid = LEVEL_BITS
    },
	[28] = {
        LFlevelname = "END",
        LFlevelid = LEVEL_ENDING
    },
}