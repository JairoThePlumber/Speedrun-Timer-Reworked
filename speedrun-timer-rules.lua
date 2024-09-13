if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Rules Mod (made by Kaje)

-- text-related options
-- sets font, scale (of text) and color for all texts;

DisplayCustomRules = false
DisplayBuiltinRules = true
switched = true
hasConfirmed = false

function code_for_displaying_rules(m)
	if not (DisplayBuiltinRules or DisplayCustomRules) then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if (switched == true) then
        if (MenuInputCheck & A_BUTTON) ~= 0 then
            switched = false
			hasConfirmed = true
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
	if gGlobalSyncTable.Intermission then
	switched = false
	hasConfirmed = true
	end
	if Rules_Display == 0 then
		switched = false
		hasConfirmed = true
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
            -5,
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
		
			"Get 1 star in DDD after doing SBLJ",
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
            0,
            -157,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect 16 Stars and then Beat Bowser",
            0,
            -147,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
			"(SBLJs are banned)",
            0,
            -137,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
            "70 Star: Get 70 Stars",
            0,
            -123,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "All Star Doors Cannot Be Skipped",
            0,
            -113,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "(BLJs and MIPS clip are banned)",
            0,
            -103,
            globalFont,
            scale - 0.7,
            color
        },
        {
            "120 Star: Get 120 Stars",
            0,
            -90,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "Collect Every Single Star in the Game",
            0,
            -80,
            globalFont,
            scale - 0.7,
            color
        },
		{
		
		    "Including The Sercet Stars and Bowser Stars",
            0,
            -70,
            globalFont,
            scale - 0.7,
            color
        },
        {
		
		    "(All Glitches are Allowed)",
            0,
            -60,
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

    -----------------------------------------
    -- Main code:
	if not DisplayBuiltinRules then return end
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
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
	end
end