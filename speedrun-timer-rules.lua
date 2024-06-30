if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Rules Mod (made by Kaje)

-- text-related options
-- sets font, scale (of text) and color for all texts;

DisplayCustomRules = false
DisableBuiltinRules = false
set_placement = false
switched = true
hasConfirmed = false

function code_for_rules(m)
	if DisableBuiltinRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed = true	
			end
		end
	if gGlobalSyncTable.Intermission then
	switched = false
	if (hasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmed = true
			end
		end
	if Rules_Display == 0 then
		switched = false
		if (hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmed = true
			end
		end
	end
	if gGlobalSyncTable.Intermission then return end
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & U_JPAD) ~= 0)) and Rules_Display == 1 then
       switched = true
	elseif not (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & U_JPAD) ~= 0)) and hasConfirmed == true then
       switched = false
		end
	end
end

function code_for_custom_rules(m)
	if not DisplayCustomRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed = true	
			end
		end
	if (gGlobalSyncTable.Intermission) then
	switched = false
	if (hasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmed = true
			end
		end
	if Rules_Display == 0 then
		switched = false
		if (hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmed = true
			end
		end
	end
	if gGlobalSyncTable.Intermission then return end
	if (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & U_JPAD) ~= 0)) and Rules_Display == 1 then
       switched = true
	elseif not (((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & U_JPAD) ~= 0)) and hasConfirmed == true then
       switched = false
		end
	end
end

function displayrules(m)
	if (openmenu or openstrmenu) then return end
	
	normaltexts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -223,
            globalFont,
            scale - 0.6,
            color
        }
	}
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -223,
            globalFont,
            scale - 0.6,
            color
        }
	}
	
	oktext = {
		{
            "Rules:",
            0,
            -203,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "These are the rules of what to do in a speedrun",
            0,
            -40,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            -31,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "Press A to proceed,",
            0,
            -13,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "OK",
            -2,
            -5,
            FONT_MENU,
            scale - 0.7,
            "#ff0000"
        }
	}

	-- Super Mario 64
    sm64texts = {
        {
            "0 Star: Get 0 Stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
			"Skip both 8 and 30 Star doors by BLJs",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "1 Star: Get 1 Star",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
			"Get one Star in DDD after doing Mips Clip",
			 70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are Allowed)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "16 Star: Get 16 Stars",
            -70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect 16 Stars and then Beat Bowser",
            -70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(SBLJs are banned)",
            -70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "31 Star: Get 31 Stars",
			 70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "30 star door cannot be bypassed",
             70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(SBLJ and MIPS clip are banned)",
             70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "45 Star: Get 45 Stars",
            -70,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Skip the 50 star door with BLJs",
            -70,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            -70,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            70,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Castle star doors cannot be bypassed.",
            70,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            70,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "70 Star: Get 70 Stars",
            -70,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "BLJs and MIPS clip are banned",
            -70,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "90 Star: Get 90 Stars",
            70,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Only Collect 6 Main Stars in Each Main Level",
            70,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "120 Star: Get 120 Stars",
            0,
            -67,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All glitches allowed",
            0,
            -57,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "So Be Prepared, Get Ready and Start Speedrunning!",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 (OMM Rebirth)
	sm64ommtexts = {
        {
            "16 Star: Get 16 Stars",
            0,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect 16 Stars and then beat Bowser",
            0,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(You're ONLY allowed to Switch Movesets in the Upper Floor)",
            0,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "70 Star: Get 70 Stars",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(MIPS clip and Switching Moveset to Classic is banned)",
            0,
            -127,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "90 Star: Get 90 Stars",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab All 6 Stars in Each Main Levels",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Any Secret Courses Stars and 100 Coin Stars are Banned)",
            0,
            -93,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect All 120 Stars and Beat Bowser",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario Star Road
	srtexts = {
        {
            "Any%: Grab Any stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Beat the Game with any amount of stars",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "20 Star: Grab 20 stars",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Defeat the Plants and Grab the Key",
             70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Clipping Out of Bounds is Banned)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "65 Star: Get 65 Stars",
            0,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Take the Cannon and clip through star door",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "80 Star: Get 80 Stars",
            0,
            -120,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "You can't passed the 80 Star door",
            0,
            -110,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(BLJs are Banned)",
            0,
            -100,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "130 Star: Get 130 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Make sure get All Stars and All Replica Stars",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "Here's are the Runs: [Any|20|65|80|130]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario Star Road: The Replica Comet
	srtrctexts = {
        {
            "Any%: Grab Any stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Beat the Game with any amount of stars",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "20 Star: Grab 20 stars",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Defeat the Plants and Grab the Key",
             70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Clipping Out of Bounds is Banned)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "65 Star: Get 65 Stars",
            -70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Take the Cannon and clip through star door",
            -70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "80 Star: Get 80 Stars",
            70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "You can't passed the 80 Star door",
            70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(BLJs are Banned)",
            70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "130 Star: Get 130 Stars",
            0,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Make sure get All Stars and 10 Replica Stars",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "150 Star: Get 150 Stars",
            0,
            -85,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "This is a Exclusive Run only for this romhack",
            0,
            -75,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"Make sure get All Stars and All Replica Stars",
            0,
            -65,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed In Replica Comet)",
            0,
            -55,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "Here's are the Runs: [Any|20|65|80|130|150]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 74
	sm74texts = {
        {
            "0 Star: Get 0 Stars",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "10 Star: Get 10 Stars",
            70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 10 stars and then beat bowser",
            70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            70,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -127,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -93,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "If you want to try SM74EE, you can do that by the /swap command",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 74 (OMM Rebirth)
	sm74ommtexts = {
        {
		
            "50 Star: Get 50 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Bomb Clip is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 74 Extreme Edition
	sm74eetexts = {
        {
            "0 Star: Get 0 Stars",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "10 Star: Get 10 Stars",
            70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 10 stars and then beat bowser",
            70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            70,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -127,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "125 Star: Get 125 Stars",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Clipping is Banned)",
            0,
            -93,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "157 Star: Get 157 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab All 157 Stars and then beat bowser",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "If you want to go back to SM74, you can do that by the /swap command to go back",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 74 Extreme Edition (OMM Rebirth)
	sm74eeommtexts = {
		{
            "125 Star: Get 125 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Clipping are banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
            "157 Star: Get 157 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 157 Stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
		    "(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 74: Ten Years After
	sm74tyatexts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "120 Star: Get 120 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "155 Star: Get 155 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 155 Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The Areas looks similar to Sm74 and Sm74ee, so you might get used to it",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        },
    }
	
	-- Super Mario 74: Ten Years After (OMM Rebirth)
	sm74tyaommtexts = {
		{
            "120 Star: Get 120 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Clipping are banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
            "155 Star: Get 155 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 155 Stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
		    "(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Moonshine
	sm64mstexts = {
        {
		
		    "31 Moon: Get 31 Moons",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Collect 31 Moons in this Romhack",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"50 Moon: Get 50 Moons",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 50 Moons in this Romhack",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "Here's are the Runs: [31|50]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        },
    }
	
	-- King Boo's Revenge 2
	kbr2texts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Clip through the doors to enter",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Clipping Through doors is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "182 Star: Get 182 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 182 Stars and then beat the Ice Bully",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "This romhack is really tough, so good luck speedrunning",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Lug's Delightful Dioramas and LDD: Green Comet
	lugddtexts = {
        {
		
            "64 Star: Get 64 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "LDD: Collect 64 Stars in this Romhack",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "74 Star: Get 74 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "LDD: Collect All 74 Stars in this Romhack",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Any%: Get Any Green Stars",
            0,
            -95,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Green Comet: Collect any amount of stars you can get.",
            0,
            -83,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"80 Star: Get 80 Green Stars",
            0,
            -69,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"Green Comet: Collect All 80 Stars in this romhack",
            0,
            -57,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "For LDD: The Runs: [64|74], For LDDGG: stops on the chair in sweet delight",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: The Green Stars
	sm64tgstexts = {
        {
            "80 Star: Get 80 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(BLJs or Clipping is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "131 Star: Get 131 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 131 Stars and then beat Bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "This romhack is a decent one, so you not gotta waste too much time on it",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Sapphire
	sapphiretexts = {
        {
		
		    "0 Star: Get 0 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Skip the 30 Star door",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"30 Star: Get 30 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 30 Stars From This Romhack",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Sapphire Green Comet
	sapphiregctexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab All 30 Stars from this Romhack",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"(All Glitches are Allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- The Phantom's Call
	tpctexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Press The Button and Stop the Penguin",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- The Phantom's Call (OMM Rebirth)
	tpcommtexts = {
        {
            "Any%: Get Any Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Collect Any Amount the Stars you can Get",
            0,
            -160,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -140,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -110,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Grab All 30 Stars in this Romhack",
            0,
            -90,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 1: Star Takeover
	sr1texts = {
        {
            "91 Star: Get 91 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Get 91 Stars and then enter the Pipe",
            0,
            -160,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(Clipping is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "101 Star: Get 101 Stars",
            0,
            -110,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Get all 101 Stars and then enter the pipe",
            0,
            -90,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone is at the End Picture inside ???",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 2: Night of Doom
	sr2texts = {
        {
            "90 Star: Get 90 Stars",
            0,
			-180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Grab 90 Stars and then beat bowser",
            0,
            -160,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(Clipping is Banned)",
            0,
			-140,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "160 Star: Get 160 Stars",
            0,
            -110,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Grab 160 Stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "This romhack is pretty difficult so good luck, especially for bowser",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 6.5
	sr65texts = {
        {
		
		    "1 Star: Get 1 Star",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"70 Star: Get 70 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Enter the 69 Door to get the last Star",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone touch the Castle star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 6.5 (OMM Rebirth)
	sr65ommtexts = {
        {
		
		    "70 Stars: Get 70 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
			"Enter the 69 Door to get the last Star",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- SM64 - Twisted Adventures
	sm64tatexts = {
        {
		
            "75 Star: Get 75 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 75 Stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "115 Star: Get 115 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 115 Stars and then beat bowser",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping Doors is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 151 Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "This romhack is pretty difficult so good luck, especially for bowser",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Luigi's Mansion 64
	lm64texts = {
        {
		
            "100 Star: Get 100 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 100 Stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "111 Star: Get 111 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 111 Stars and then beat bowser",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "118 Star: Get 118 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 118 Stars (Including Shiverside Station)",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Luigi's Mansion 64.5
	lm65texts = {
        {
		
            "111 Star: Get 111 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab All 111 Stars and Beat Bowser",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
        {
            "(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Paradise Island
	sm64pitexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Grab 30 Stars and don't skip the 30 Star door",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"50 Star: Get 50 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab 50 Stars and then Beat Bowser",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Ztar Attack 2
	za2texts = {
		{
            "Any%: Get Any Time Stars",
            0,
            -190,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
			"Beat Bowser as quickly as possible",
            0,
            -180,
            globalFont,
            scale - 0.75,
            color
        },
		{
		
			"(Any and all skips allowed)",
            0,
            -170,
            globalFont,
            scale - 0.75,
            color
        },
		{
            "Warpless Any%: Get Any Time Stars Warpless",
            0,
            -157,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
		    "Beat Bowser while going through the game's 5 Main Worlds",
            0,
            -147,
            globalFont,
            scale - 0.75,
            color
        },
		{
		
			"(Any form of World skips and Warps are banned)",
            0,
            -137,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
            "81 Time Star: Get 81 Time Stars",
            0,
            -123,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
		    "Collect all the Time Stars between World 1 and 5 and Defeat Bowser.",
            0,
            -113,
            globalFont,
            scale - 0.75,
            color
        },
		{
		
		    "(Any form of World skips and Warps are banned)",
            0,
            -102,
            globalFont,
            scale - 0.75,
            color
        },
        {
            "91 Time Star: Get 91 Time Stars",
            0,
            -90,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
		    "(Any and all Skips and Warps are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.75,
            color
        },
		{
		
		    "All Bosses: Defeat every boss",
            0,
            -67,
            globalFont,
            scale - 0.75,
            color
        },
        {
		
		    "(Any and all skips allowed)",
            0,
            -57,
            globalFont,
            scale - 0.75,
            color
        },
		{
            "Here's are the Runs: [Any|Warpless|81|91|Bosses]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: Peach and The Pink Star
	patpstexts = {
        {
		
		    "0 Star: Get 0 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Skip the 30 Star door",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"30 Star: Get 30 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 30 Stars and Beat Bowser",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: Peach and The Pink Star (OMM Rebirth)
	patpsommtexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
			"Grab All 30 Stars and Beat Bowser",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: Hidden Stars
	sm64hstexts = {
        {
		
            "10 Star: Get 10 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 10 stars, Grab the Wing Cap and enter the pipe",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "56 Star: Get 56 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 56 Stars and enter the pipe inside the castle at castle grounds",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "112 Star: Get 112 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 112 Stars and enter the pipe inside the castle at castle grounds",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: Hidden Stars (OMM Rebirth)
	sm64hsommtexts = {
        {
            "0 Stars: Get 0 Stars",
            0,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Clip inside the castle's roof and enter the pipe",
            0,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "10 Star: Get 10 Stars",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 10 stars, Grab the Wing Cap and enter the pipe",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -127,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "Grab 56 Stars and enter the pipe inside the castle at castle grounds",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -93,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "112 Star: Get 112 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab All 112 Stars and enter the pipe inside the castle at castle grounds",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario The Galactic Journey 
	tgjtexts = {
		{
            "12 Star: Get 12 Stars",
            0,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
			"Do alot of BLJ to skip the doors",
            0,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "24 Star: Get 24 Stars",
            0,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "12 star door cannot be bypassed",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All glitches allowed)",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "44 Star: Get 44 Stars",
            0,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "12 and 42 star doors cannot be bypassed.",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(BLJs are allowed but only at the 87 star door, and Mips Clip is Banned)",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "87 Star: Get 87 Stars",
            0,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Star Doors can't be skipped (so BLJs are Banned)",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "102 Star: Get 102 Stars",
            0,
            -67,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All glitches Allowed",
            0,
            -57,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "Good Luck on Fighting King Bob-omb tho",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario The Galactic Journey (OMM Rebirth)
	tgjommtexts = {
        {
		
            "44 Star: Get 44 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "12 and 42 star doors cannot be bypassed.",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Wall Jumps over the 87 Star Door is Allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "87 Star: Get 87 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Jumping over the 87 Star Door is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "102 Star: Get 102 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 102 Stars and then beat King Bob-omb",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 1.5: Star Takeover Redone
	sr1redonetexts = {
        {
            "66 Star: Get 66 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Get 66 Stars and then Beat Bowser",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "125 Star: Get 125 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Get 125 Stars and then Beat Bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Luigi and the Forest Ruins
	frtexts = {
        {
		
		    "21 Star: Get 21 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Collect 21 stars and then beat bowser",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"40 Star: Get 40 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab all 40 Stars and then beat bowser",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stops once someone touching the star in the courtyard",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Thousand-Year Door 64 
	tyd64texts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "BLJ on a Pillar and then enter the warp",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "30 Star: Get 30 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 30 Stars and then enter the warp",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 30 Star door is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "80 Star: Get 80 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 80 Stars and then Enter the Warp",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Thousand-Year Door 64 (OMM Rebirth)
	tyd64ommtexts = {
        {
            "30 Star: Get 30 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab 30 Stars and then enter the warp",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Skipping the 30 Star door is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "80 Star: Get 80 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 80 Stars and then Enter the Warp",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64: The Mushroom Cup
	tmctexts = {
        {
		
            "16 Star: Get 16 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get 16 Stars and Beat Bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "100 Star: Get 100 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 100 and get the Shrine Ending",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(You need to collect the Shrine Star after getting 99 Stars)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "130 Star: Get 130 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 130 Stars and get the Shrine Ending",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "This Romhack has two different endings but you can only choose one",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        },
    }
	
	-- Super Mario 64: The Mushroom Cup (OMM Rebirth)
	tmcommtexts = {
        {
            "0 Star: Get 0 Stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Climb up with 0 Stars and Defeat Bowser",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "1 Star: Get 1 star",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab the Red Coin Star and enter the Shrine",
             70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "16 Star: Get 16 Stars",
            0,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get 16 Stars and Beat Bowser",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(BLJs are Banned)",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "100 Star: Get 100 Stars",
            0,
            -121,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "You need to collect the Shrine Star after getting 99 Stars",
            0,
            -111,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed, I guess)",
            0,
            -101,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "130 Star: Get 130 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab All 130 Stars and get the Shrine Ending",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Eternal Realm
	ertexts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Clip Through the Door and grab the key",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Make Sure you get WC and VC before doing so)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "25 Star: Get 25 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 25 and grab the key",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 25 Star Door is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "47 Star: Get 47 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 47 Stars and grab the key",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The Timer Stops once someone touch the Key",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Despair Mario's Gambit 
	dmgtexts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Clip Through the Doors and then enter the pipe",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "53 Star: Get 53 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 53 stars and then enter the pipe",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 53 Star Door is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 120 Stars and then enter the pipe",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Despair Mario's Gambit (OMM Rebirth)
	dmgommtexts = {
        {
            "53 Star: Get 53 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab 53 stars and then enter the pipe",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Skipping the 53 Star Door is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 120 Stars and then enter the pipe",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Retro Land 
	srltexts = {
        {
		
		    "4 Star: Get 4 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab all 4 Stars and then Grab The Key",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"You Need the key to open Mario's House",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Retro Land (OMM Rebirth)
	srlommtexts = {
        {
            "0 Star: Get 0 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab the key and then enter the bed",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "4 Stars: Get 4 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab all 4 Stars and then enter the bed",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Katze Stuck in the Toilet 64 
	katze64texts = {
        {
		
            "0 Burger: Get 0 Burgers",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Clip Through the Doors and then enter the warp",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "30 Burger: Get 30 Burgers",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 30 burgers and then enter the warp",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 30 Burger door is Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "40 Burger: Get 40 Burgers",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 40 burgers and then enter the warp",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Katze Stuck in the Toilet 64 (OMM Rebirth)
	katze64ommtexts = {
        {
            "30 Burger: Get 30 Burgers",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab 30 burgers and then enter the warp",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Skipping the 30 burger door is Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "40 Burger: Get 40 Burgers",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 40 burgers and then enter the warp",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario The Power Star Journey
	psjtexts = {
        {
		
            "80 Star: Get 80 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 80 stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "97 Star: Get 97 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Collect 97 Stars and then beat bowser",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Avoid Collecting 100 Coin Stars)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "101 Star: Get 101 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab 97 Stars Including 100 Coin Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Shining Stars
	ss1texts = {
        {
		
            "0 Star: Get 0 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 0 stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "121 Star: Get 121 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Collect 121 Stars and then beat bowser",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the Star Doors are Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Shining Stars (OMM Rebirth)
	ss1ommtexts = {
		{
            "121 Star: Get 121 Stars",
            0,
            -180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Collect 121 Stars and then beat bowser",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(Skipping the Star Doors are Banned)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
            "151 Star: Get 151 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
		    "(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Shining Stars 2 Mirror Madness
	ss2texts = {
        {
            "0 Star: Grab 0 Stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 0 stars and then beat bowser",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "10 Star: Grab 10 stars",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 10 stars and then battle bowser",
             70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip the 10 Star Door)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "15 Star: Get 15 Stars",
            -70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 15 stars and then battle bowser",
            -70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip 10 and 15 Star Doors)",
            -70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "69 Star: Get 69 Stars",
            70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 69 stars and then battle bowser",
            70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip the Star Doors)",
            70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "90 Star: Get 90 Stars",
            0,
            -121,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 90 stars and then battle bowser",
            0,
            -111,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Skipping all star door is banned)",
            0,
            -101,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "122 Star: Get 122 Stars",
            0,
            -85,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab all 122 stars and then battle bowser",
            0,
            -75,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"You can use a star display if you don't know where the stars are",
            0,
            -65,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -55,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "This Romhack has two different ways to finish the run but you can only choose one",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Shining Stars 2 Mirror Madness (OMM Rebirth)
	ss2ommtexts = {
        {
            "10 Star: Grab 10 stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 10 stars and then battle bowser",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip the 10 Star Door)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "15 Star: Get 15 Stars",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 15 stars and then battle bowser",
             70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip 10 and 15 Star Doors)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "69 Star: Get 69 Stars",
            0,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 69 stars and then battle bowser",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Don't Skip the Star Doors)",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "90 Star: Get 90 Stars",
            0,
            -121,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab 90 stars and then battle bowser",
            0,
            -111,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Skipping all star door is banned)",
            0,
            -101,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "122 Star: Get 122 Stars",
            0,
            -85,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Grab all 122 stars and then battle bowser",
            0,
            -75,
            globalFont,
            scale - 0.7,
            color
        },
		{
			"You can use a star display if you don't know where the stars are",
            0,
            -65,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -55,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Mario's Treasure Dome - The Revival
	mtdtexts = {
        {
		
		    "Any%: Get Any% Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Beat the Game with any amount of stars",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"125 Star: Get 125 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab all 125 Stars and beat bowser",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "This Romhack Doesn't have a speedrun category, so this is what I got",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
	}
	
	-- Luigi & The Violet Stars
	latvstexts = {
        {
		
            "1 Star: Get 1 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 1 stars and then beat bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "66 Star: Get 66 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Finding ways to clip is banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "136 Star: Get 136 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 136 Stars and then beat bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "This Romhack breaks the warp command, so it's will be disabled",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- SM64 Royal Legacy
	sm64rltexts = {
        {
            "0 Star: Get 0 Stars",
            0,
			-180,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "BLJ To the Star Door and Beat Bowser",
            0,
            -160,
            globalFont,
            scale - 0.5,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -140,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -110,
            globalFont,
            scale - 0.5,
            color
        },
        {
		
		    "Grab All 30 Stars and then Beat Bowser",
            0,
            -90,
            globalFont,
            scale - 0.5,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -70,
            globalFont,
            scale - 0.5,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- SM64 Royal Legacy (OMM Rebirth)
    sm64rlommtexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab All 30 Stars and then Beat Bowser",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- SM64 Extra
	sm64extratexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab All 30 Stars in this romhack",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone is at the End Picture",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 3 - Mario on An Saoire 64
	sr3texts = {
        {
		
            "1 Star: Get 1 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 1 stars and then beat Wiggler",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "36 Star: Get 36 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 36 stars and then beat Wiggler",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Clipping to the 35 Door is banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "65 Star: Get 65 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 65 Stars and that's it",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "Here's are the Runs: [1|36|65]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 4 - The Kedama Takeover 64
	sr4texts = {
        {
		
            "35 Star: Get 35 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 35 stars and then beat Bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 35 Door is Banned)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "97 Star: Get 97 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get 97 Stars and then enter the pipe",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Getting The Cap Levels Stars are Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "100 Star: Get 100 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 100 Stars and then Enter the pipe",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "This Romhack has two different endings but you can only choose one",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 4 - The Kedama Takeover 64 (OMM Rebirth)
	sr4ommtexts = {
        {
            "0 Star: Get 0 Stars",
            0,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Just Beat Bowser with Zero Stars",
            0,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "35 Star: Get 35 Stars",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get at least 35 stars and then beat Bowser",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Skipping the 35 Door is Banned)",
            0,
            -127,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "97 Star: Get 97 Stars",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Get 97 Stars and then enter the pipe",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(Getting The Cap Levels Stars are Banned)",
            0,
            -93,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "100 Star: Get 100 Stars",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect All 100 Stars and then enter the pipe",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Trouble Town
	sm64tttexts = {
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab All 30 Stars in this romhack",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"There's only one run for this romhack",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop after collecting 30 Stars",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Star Revenge 1.3 - Redone 1.3
	sr13redonetexts = {
        {
		
		    "106 Star: Get 106 Stars",
            0,
            -170,
            globalFont,
            scale - 0.3,
            color
        },
        {
		
		    "Grab all 106 Stars and enter the door",
            0,
            -140,
            globalFont,
            scale - 0.3,
            color
        },
		{
			"The Runs are the same thing, so I pick one",
            0,
            -110,
            globalFont,
            scale - 0.3,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -80,
            globalFont,
            scale - 0.3,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario 64 Into Bowser's Castle
	sm64ibctexts = {
        {
		
            "30 Star: Get 30 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 30 stars and then beat Bowser",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "70 Star: Get 70 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 70 stars and then beat Bowser",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Skipping the 70 Star Door is banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 120 Stars and then beat Bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "The timer will stop once someone touch the Grand Star",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Green Star Revenge 1
	gsr1texts = {
        {
            "0 Green Star: Get 0 Green Stars",
            -70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
			"Skip both 8 and 30 Star doors by BLJs",
            -70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            -70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "1 Green Star: Get 1 Green Star",
			 70,
            -190,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
			"Get one Green Star in DDD after doing Mips Clip",
			 70,
            -180,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(All Glitches are Allowed)",
             70,
            -170,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "16 Green Star: Get 16 Green Stars",
            -70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect 16 Green Stars and then Beat Bowser",
            -70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(SBLJs are banned)",
            -70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "31 Green Star: Get 31 Green Stars",
			 70,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "30 star door cannot be bypassed",
             70,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(SBLJ and MIPS clip are banned)",
             70,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "45 Green Star: Get 45 Green Stars",
            -70,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Skip the 50 star door with BLJs",
            -70,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            -70,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
            "50 Green Star: Get 50 Green Stars",
            70,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Castle star doors cannot be bypassed.",
            70,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            70,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "70 Green Star: Get 70 Green Stars",
            -70,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "BLJs and MIPS clip are banned",
            -70,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "90 Green Star: Get 90 Green Stars",
            70,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Only Collect 6 Main Green Stars in Each Main Level",
            70,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "133 Green Star: Get 133 Green Stars",
            0,
            -67,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All glitches allowed",
            0,
            -57,
            globalFont,
            scale - 0.7,
            color
        },
		{
            "This Romhack Doesn't have a speedrun category, so I use SM64 Rules Instead",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Green Star Revenge 1 (OMM Rebirth)
	gsr1ommtexts = {
        {
		
            "70 Green Star: Get 70 Green Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(MIPS clip, BLJ and Switching Moveset to Classic is banned)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "90 Green Star: Get 90 Green Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 6 Green Stars in Each Main Levels",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Any Secret Courses Stars and 100 Coin Stars are Banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "133 Green Star: Get 133 Green Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Collect All 133 Stars and Beat Bowser",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario and the Marvel Adventure
	smatmatexts = {
        {
		
		    "46 Star: Get 46 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Collect 46 Stars and then Beat Bowser",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"51 Star: Get 51 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 51 Stars and then Beat Bowser",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "The timer will stop once someone grab the star in the end level",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario and the Marvel Adventure (OMM Rebirth)
	smatmaommtexts = {
        {
		
            "26 Star: Get 26 Stars",
            0,
            -190,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 26 stars and then grab the star",
            0,
            -175,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -160,
            globalFont,
            scale - 0.6,
            color
        },
        {
            "46 Star: Get 46 Stars",
            0,
            -140,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Get at least 46 stars and then grab the star",
            0,
            -125,
            globalFont,
            scale - 0.6,
            color
        },
		{
		
			"(Cappy jump to Bowser is banned)",
            0,
            -110,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "51 Star: Get 51 Stars",
            0,
            -90,
            globalFont,
            scale - 0.6,
            color
        },
        {
		
		    "Grab All 51 Stars and that's it",
            0,
            -75,
            globalFont,
            scale - 0.6,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale - 0.6,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        }
    }
	
	-- Super Mario Rainbow Road
	smrrtexts = {
        {
		
		    "54 Star: Get 54 Stars",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Collect 54 Stars in this Romhack",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"60 Star: Get 60 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 60 Stars in this Romhack",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "Here's are the Runs: [54|60]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        },
    }
	
	-- Sonic Adventure 64 DX
	sa64texts = {
        {
		
		    "1 Star: Get 1 Star",
            0,
            -180,
            globalFont,
            scale - 0.4,
            color
        },
        {
		
		    "Defeat King Whomp and Grab the Star",
            0,
            -155,
            globalFont,
            scale - 0.4,
            color
        },
		{
			"3 Star: Get 3 Stars",
            0,
            -130,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"Grab All 3 Stars in this Romhack",
            0,
            -105,
            globalFont,
            scale - 0.4,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            -80,
            globalFont,
            scale - 0.4,
            color
        },
		{
            "Here's are the Runs: [1|3]",
            0,
            -22,
            globalFont,
            scale - 0.7,
            color
        },
    }

    -----------------------------------------
    -- Main code:
	if not obj_get_first_with_behavior_id(id_bhvActSelector) and not DisableBuiltinRules then
	SM64Rules = true
	for sm64_rules in pairs(gActiveMods) do
	if gActiveMods[sm64_rules].incompatible ~= nil and gActiveMods[sm64_rules].incompatible:find("romhack") then
	SM64Rules = false
		end
	end
	if (switched == true) then
	-- render the rectangle.
       renderRect(190, 120, FONT_MENU, 320, 240, "#ffffff")
		if not OmmEnabled then
        for _, v in ipairs(normaltexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
        for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
        for _, v in ipairs(oktext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
	end
	if SM64Rules then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm64texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm64ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	for romhack_rules in pairs(gActiveMods) do
	if (gActiveMods[romhack_rules].name:find("Star Road") and not gActiveMods[romhack_rules].name:find("The Replica Comet")) then
	if (switched == true) then
        -- print all texts
        for _, v in ipairs(srtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("Star Road: The Replica Comet") then
	if (switched == true) then
        -- print all texts
        for _, v in ipairs(srtrctexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Super Mario 74") and gActiveMods[romhack_rules].name:find("(+EE)")) and gNetworkPlayers[0].currAreaIndex == 1 then
	if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
			m.pos.x = -6558
			m.pos.y = -578
			m.pos.z = 6464
        end
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm74texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm74ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Super Mario 74") and gActiveMods[romhack_rules].name:find("(+EE)")) and gNetworkPlayers[0].currAreaIndex == 2 then
	if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
			m.pos.x = 5481
			m.pos.y = -922
			m.pos.z = 6320
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm74eetexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm74eeommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
        end
	end
	if gActiveMods[romhack_rules].name:find("Ten Years After") then
	if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
        	m.pos.x = -5097
			m.pos.y = -157
			m.pos.z = 6235
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm74tyatexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm74tyaommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end	
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Mario 64 Moonshine") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 5
			m.pos.y = -2794
			m.pos.z = 2082
        end

        -- print all texts
        for _, v in ipairs(sm64mstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("King Boo's Revenge 2") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 7710
			m.pos.y = 1575
			m.pos.z = 6682
        end

        -- print all texts
        for _, v in ipairs(kbr2texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("Lug's Delightful Dioramas") or gActiveMods[romhack_rules].name:find("Lug's Delightful Dioramas Green Comet") then
	if (switched == true) then
        -- print all texts
        for _, v in ipairs(lugddtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("SM64: The Green Stars") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(sm64tgstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(sapphiretexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("SM64 \\#0f52ba\\Sapphire \\#00FF00\\Green Comet\\dcdcdc\\") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(sapphiregctexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("The Phantom's Call") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(tpctexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(tpcommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Star Revenge 1: Star Takeover") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
			m.pos.x = 8120
			m.pos.y = -1991
			m.pos.z = -9473
        end

        -- print all texts
        for _, v in ipairs(sr1texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("Star Revenge 2: Night of Doom") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 5843
			m.pos.y = -936
			m.pos.z = 3985
        end

        -- print all texts
        for _, v in ipairs(sr2texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Star Revenge 6") and gActiveMods[romhack_rules].name:find(".5")) then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -14341
			m.pos.y = -552
			m.pos.z = -9602
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sr65texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sr65ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Twisted Adventures") then
    if (switched == true) then

        -- print all texts
        for _, v in ipairs(sm64tatexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Luigi's Mansion 64") and not gActiveMods[romhack_rules].name:find(".5")) then
    if (switched == true) then

        -- print all texts
        for _, v in ipairs(lm64texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Luigi's Mansion 64") and gActiveMods[romhack_rules].name:find(".5")) then 
    if (switched == true) then

        -- print all texts
        for _, v in ipairs(lm65texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("SM64 Paradise Island") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 3255
			m.pos.y = 190
			m.pos.z = -4806
        end

        -- print all texts
        for _, v in ipairs(sm64pitexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -1226
			m.pos.y = -1823
			m.pos.z = 515
        end

        -- print all texts
        for _, v in ipairs(za2texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
	end
	if gActiveMods[romhack_rules].name:find("pink star") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
        	m.pos.x = -426
			m.pos.y = 1243
			m.pos.z = -161
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(patpstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(patpsommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("SM 64 Hidden Stars") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm64hstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm64hsommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("The Galactic Journey") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(tgjtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(tgjommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Star Takeover Redone") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
        	m.pos.x = -3782
			m.pos.y = -2537
			m.pos.z = -2770
        end

        -- print all texts
        for _, v in ipairs(sr1redonetexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
        	m.pos.x = -4268
			m.pos.y = -0
			m.pos.z = 5461
        end

        -- print all texts
        for _, v in ipairs(frtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
	end
	if gActiveMods[romhack_rules].name:find("Thousand") and gActiveMods[romhack_rules].name:find("Year Door 64") then
    if (switched == true) then
        if (hasConfirmed == false) and Rules_Display == 1 then
			m.pos.x = -1722
			m.pos.y = 120
			m.pos.z = -4331
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(tyd64texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		-- print all texts
		if OmmEnabled then
        for _, v in ipairs(tyd64ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
        end
    end
	if gActiveMods[romhack_rules].name:find("\\#ff2b1c\\The \\#636363\\Mushroom \\#ffb742\\Cup") then
    if (switched == true) then

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(tmctexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		-- print all texts
		if OmmEnabled then
        for _, v in ipairs(tmcommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
        end
    end
	if gActiveMods[romhack_rules].name:find("Eternal Realm") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(ertexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
    end
	if gActiveMods[romhack_rules].name:find("Despair Mario's Gambit") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(dmgtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(dmgommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Retro Land") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(srltexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(srlommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Katze Stuck in the Toilet 64") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(katze64texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(katze64ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("The Power Star Journey") then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 1094
			m.pos.y = -2371
			m.pos.z = 3489
        end

        -- print all texts
        for _, v in ipairs(psjtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("\\#ffffff\\Shining Stars") and not gActiveMods[romhack_rules].name:find("2 Mirror Madness")) then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -469
			m.pos.y = -1776
			m.pos.z = 7135
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(ss1texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
        for _, v in ipairs(ss1ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
        end
	end
	if (gActiveMods[romhack_rules].name:find("\\#ffffff\\Shining Stars") and gActiveMods[romhack_rules].name:find("2 Mirror Madness")) then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -4323
			m.pos.y = -1170
			m.pos.z = -4375
        end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(ss2texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
        for _, v in ipairs(ss2ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
        end
	end
	if (gActiveMods[romhack_rules].name:find("Mario's Treasure Dome") and gActiveMods[romhack_rules].name:find("The Revival")) then
    if (switched == true) then

        -- print all texts
        for _, v in ipairs(mtdtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("\\#66ff82\\Luigi \\#ffffff\\& \\#ff66fa\\The Violet Stars") then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 104
			m.pos.y = -3772
			m.pos.z = 5000
        end

        -- print all texts
        for _, v in ipairs(latvstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("Royal Legacy") then
    if (switched == true) then

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sm64rltexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(sm64rlommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Mario 64 \\#ff0000\\Extra") then
    if (switched == true) then

        -- print all texts
        for _, v in ipairs(sm64extratexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Star Revenge 3") and gActiveMods[romhack_rules].name:find("Mario on An Saoire 64")) then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 9756
			m.pos.y = -1120
			m.pos.z = -4534
        end
        -- print all texts
        for _, v in ipairs(sr3texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if (gActiveMods[romhack_rules].name:find("Star Revenge 4") and gActiveMods[romhack_rules].name:find("The Kedama Takeover 64")) then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -6171
			m.pos.y = 1579
			m.pos.z = 3906
        end
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(sr4texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		 -- print all texts
		 if OmmEnabled then
        for _, v in ipairs(sr4ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Mario 64 Trouble Town") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(sm64tttexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	
	if (gActiveMods[romhack_rules].name:find("Star Revenge 1.3") and gActiveMods[romhack_rules].name:find("Redone 1.3")) then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = 6422
			m.pos.y = -995
			m.pos.z = 4707
        end
        -- print all texts
        for _, v in ipairs(sr13redonetexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	
	if gActiveMods[romhack_rules].name:find("Super Mario 64 Into Bowser's Castle") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(sm64ibctexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	
	if gActiveMods[romhack_rules].name:find("Green Star Revenge 1") then
	if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(gsr1texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(gsr1ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Mario and the Marvel Adventure") then
    if (switched == true) then
        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(smatmatexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		 -- print all texts
		 if OmmEnabled then
        for _, v in ipairs(smatmaommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		end
	end
	if gActiveMods[romhack_rules].name:find("Super Mario Rainbow Road") then
    if (switched == true) then
        -- print all texts
        for _, v in ipairs(smrrtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	if gActiveMods[romhack_rules].name:find("Sonic Adventure 64 DX") then
    if (switched == true) then
		if (hasConfirmed == false) and Rules_Display == 1 then
            m.pos.x = -20140
			m.pos.y = 675
			m.pos.z = -25901
        end
        -- print all texts
        for _, v in ipairs(sa64texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	
		end
	end
end