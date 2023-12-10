if gamemodes_is_checked or notallowedmods or no_cheats then return end

SM64Rules = false

function speedrun_rules_display()
	Rules_Display = not Rules_Display
	mod_storage_save("Rules_Display", tostring(Rules_Display))
	if Rules_Display then
		djui_popup_create("Rules Display is now Enabled", 1)
	else
		djui_popup_create("Rules Display is now Disabled", 1)
	end
	return true
end

function SM64_rules(m)
SM64Rules = true
for sm64_rules in pairs(gActiveMods) do
if (gActiveMods[sm64_rules].incompatible ~= nil and gActiveMods[sm64_rules].incompatible:find("romhack")) then
SM64Rules = false
	end
	end
end

-- Rules Mod (made by Kaje)

-- false: Window won't close when mouse hovers over the OK button, only Buttons work
-- true: Window will close when mouse hovers over the OK button, alternatively buttons work too
CLOSE_ON_MOUSE_HOVER = false

-- text-related options
-- sets font, scale (of text) and color for all texts;
globalFont = FONT_NORMAL
scale = 1.4
color = "#000000"

-- credits
creditscale = 1
creditcolor = "#FFFFFF"

local creditsswitched = false
local creditshasConfirmed = false

buttonispressed = 0

-- -700, -230, 230, 700

function displaycredits(m)
	
	if not creditsswitched then return end

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]

	versiontext = {
		{
            "Speedrun Timer Reworked V1.1",
            800,
            -430,
            globalFont,
            creditscale,
            creditcolor
		},
		{
            "Press A to proceed,",
            0,
            440,
            globalFont,
            creditscale,
            creditcolor
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
	}
	whatsnewtexts = {
		{
            "What's New?",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "Added Eight Romhacks",
            0,
            -100,
            globalFont,
            creditscale + 2,
            creditcolor
        },
        {
		
			'Added a "Extras" Command',
            0,
            100,
            globalFont,
            creditscale + 2,
            creditcolor
        },
		{
		
			'Added Controls to the Info display',
            0,
            300,
            globalFont,
            creditscale + 2,
            creditcolor
        },
		{
            "Right D-Pad: Credits",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: Controls",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
	}
	
    creditstexts = {
		{
            "Credits",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "Original Mod By EmeraldLockdown",
            0,
            -300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
        {
		
			"Mod By JairoThePlumber",
            0,
            -200,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Star Road Postions by Mr.Needlemouse",
            0,
            -100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Sm64 Rules by Sunk",
            0,
            0,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Rules Mod by Kaje",
            0,
            100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Update Chat Command Choice by Vanilla and Squishy",
            0,
            200,
            globalFont,
			creditscale + 0.5,
            creditcolor
        },
		{
		
			"Bingo Mod by Blocky and Skeltan",
            0,
            300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"And Everyone Who help Test This Mod",
            0,
            400,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
            "Right D-Pad: Changes",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: What's New?",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
    }
	
	changestexts = {
		{
            "Changes",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "Removed /str controls since controls is now display on /str_config info",
            0,
            -300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
        {
		
			"Changes 90 stars to 91 stars for Ztar Attack 2",
            0,
            -200,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Now you can set the timer to Casual or Single",
            0,
            -100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Now the info display can loop now",
            0,
            0,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Save Function For Buttons Set to off by Default",
            0,
             100,
            globalFont,
			creditscale + 0.5,
            creditcolor
        },
		{
		
			"Super Mario 64: The Underworld and Only Up won't have rules display",
			0,
             200,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Removed Some Unnecessary Code",
            0,
             300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Change /set stars to commands to /set runs to",
            0,
             400,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
            "Right D-Pad: PlayTesters",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: Credits",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
    }
	
    playtesterstexts = {
		{
            "PlayTesters",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "BeanMKW",
            -230,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Key'sArts",
            -230,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Vanilla",
            -230,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"DT_Ryan",
            -230,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Mayo",
            -230,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"LeoHaha",
            -230,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"DeathHawk789",
            -230,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Player",
            -230,
			0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Issac",
            -230,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"ColbyRayz!",
            -230,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"JoseGera1012",
            -230,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Blazingmo6",
            -230,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"octi",
            -230,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"LightWolf12745",
            -230,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Mr.Pear",
            -230,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"jrb64",
            -230,
			400,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "SONIC12649S",
			230,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Mongulus",
            230,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"dav",
            230,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"YUSUKE",
            230,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SomeIdot",
            230,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"LuisJoanXD",
            230,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"prople",
            230,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"littlefox2125",
            230,
			0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"",
            230,
			400,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Right D-Pad: Compatible Romhacks",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: Changes",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
    }
	
	romhackstexts = {
		{
            "Compatible Romhacks",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "Star Road",
            -230,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Star Road: The Replica Comet",
            -230,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 74",
            -230,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 74: Extreme Edition",
            -230,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 74: Ten Years After",
            -230,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64 Moonshine",
            -230,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"King Boo's Revenge 2",
            -230,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Lug's Delightful Dioramas",
            -230,
			0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Lug's Delightful Dioramas: Green Comet",
            -230,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: The Green Stars",
            -230,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64 Sapphire",
            -230,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"The Phantom's Call",
            -230,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 1: Star Takeover",
            -230,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 2: Night of Doom",
            -230,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 6.5",
            -230,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SM64 - Twisted Adventures",
            -230,
			400,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Luigi's Mansion 64",
			 230,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Luigi's Mansion 64.5 [EM + SPM]",
             230,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SM64 Paradise Island",
             230,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Ztar Attack 2",
             230,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: Hidden Stars",
             230,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: The Galactic Journey",
             230,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 1.5: Star Takeover Redone",
             230,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Luigi and the Forest Ruins",
             230,
            0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Only Up 64 (New)",
             230,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Thousand Year Door 64 (New)",
            230,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SM64: The Mushroom Cup (New)",
            230,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Eternal Realm (New)",
            230,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Despair Mario's Gambit (New)",
            230,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Retro Land (New)",
            230,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: The Underworld (New)",
            230,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Katze Stuck in the Toilet 64 (New)",
            230,
			400,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Right D-Pad: Fixed Bugs",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: PlayTesters",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
    }
	
	fixedtexts = {
		{
            "Fixed Bugs",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
		{
            "No Bugs were Reported",
            0,
            70,
            globalFont,
            creditscale + 1,
            creditcolor
        },
		{
            "Right D-Pad: Controls",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Left D-Pad: Compatible Romhacks",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
    }
	
	controlstexts = {
	{
            "Controls",
            0,
            -370,
            globalFont,
            creditscale + 1,
            creditcolor
        },
        {
            "Command Controls:",
            -400,
            -330,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"/str start speedrun/timer",
            -650,
            -280,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Start The Speedrun)",
            -650,
            -230,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str start intro",
            -650,
            -180,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Starts with an Intro)",
            -650,
            -130,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str stop timer",
            -650,
             -80,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Stop the Timer)",
            -650,
             -30,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str stop speedrun",
            -650,
			  20,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Stop the Speedrun)",
            -650,
			  70,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str restart timer",
            -650,
			 120,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Restart the Timer 'only for a backup savefile')",
            -650,
			 170,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str restart speedrun",
            -650,
			 220,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Restart the Speedrun 'only for a backup savefile')",
            -630,
			 270,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str countdown 0-50",
            -200,
            -280,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Changes the countdown from 0 to 50)",
            -200,
            -230,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str options buttons/commands",
            -200,
            -180,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(changes the options of how you start the run)",
            -200,
            -130,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"/str extras casual/speedrun",
            -200,
            -80,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(making the timer start automatically once changing it)",
            -200,
            -30,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Buttons Controls:",
            500,
            -330,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"X Button:",
            500,
            -280,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Start the Speedrun)",
            500,
            -230,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Y Button:",
            500,
            -180,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Restarting the Speedrun)",
            500,
            -130,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Z + D-Pad Down + Start Button:",
            500,
            -80,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "(Starts the an Intro)",
            500,
            -30,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
		    "L Trigger:",
            500,
            20,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"(Stopped the timer, but you can cancel it by pressing X)",
            500,
			70,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Right D-Pad: What's New?",
            800,
            520,
            globalFont,
            creditscale,
            creditcolor
        },
        {
            "Left D-Pad: Fixed Bugs",
            -800,
            520,
            globalFont,
            creditscale,
            creditcolor
        }
	}


    -----------------------------------------
    -- Main code:
    if (creditsswitched == true) then
        if (creditshasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
		
		-- render the rectangle.
        renderRect(190, 120, FONT_MENU, 2000, 2000, "#000000")
		
		-- print all texts
        for _, v in ipairs(versiontext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		if buttonispressed == 0 then
		for _, v in ipairs(whatsnewtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 1 then
		for _, v in ipairs(creditstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 2 then
		for _, v in ipairs(changestexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 3 then
		for _, v in ipairs(playtesterstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 4 then
		for _, v in ipairs(romhackstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 5 then
		for _, v in ipairs(fixedtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 6 then
		for _, v in ipairs(controlstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                creditsswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (creditshasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    creditshasConfirmed = true
                end
            end
        end
		
		if (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 0 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 1 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 2 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 3 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 4 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 5 then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & R_JPAD) ~= 0 and buttonispressed == 6 then
			buttonispressed = buttonispressed - 6
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
			
		if (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 0 then
			buttonispressed = buttonispressed + 6
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)	
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 1 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 2 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 3 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 4 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 5 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 6 then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            creditsswitched = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (creditshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                creditshasConfirmed = true	
			end
		end
	if gGlobalSyncTable.startIntro then
		if gGlobalSyncTable.warptointro then 
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			gGlobalSyncTable.warptointro = false
			creditsswitched = false
		if (creditshasConfirmed == false) then
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			creditshasConfirmed = true
		end
		end
	end
	end
end

local switched = true
local hasConfirmed = false
function displayrules(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "0 Stars: Get 0 Stars",
            -300,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
			"Skip both 8 and 30 Star doors by BLJs",
            -300,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            -300,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "1 Star: Get 1 Star",
            300,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
			"Get one Star in DDD after skipping the 30 star door",
            300,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            300,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "16 Star: Get 16 Stars",
            -300,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect 16 Stars and then Beat Bowser",
            -300,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(SBLJs are banned)",
            -300,
            -60,
            globalFont,
            scale,
            color
        },
		{
            "31 Star: Get 31 Stars",
            300,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "30 star door cannot be bypassed",
            300,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(SBLJ and MIPS clip are banned)",
            300,
            -60,
            globalFont,
            scale,
            color
        },
		{
		
            "45 Star: Get 45 Stars",
            -300,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "Skip the 50 star door with BLJs",
            -300,
            40,
            globalFont,
            scale,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            -300,
            80,
            globalFont,
            scale,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            300,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "Castle star doors cannot be bypassed.",
            300,
            40,
            globalFont,
            scale,
            color
        },
		{
		
		    "(LBLJ, SBLJ and MIPS clip are Banned)",
            300,
            80,
            globalFont,
            scale,
            color
        },
        {
            "70 Star: Get 70 Stars",
            -300,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "BLJs and MIPS clip are banned",
            -300,
            180,
            globalFont,
            scale,
            color
        },
		{
            "90 Star: Get 90 Stars",
            300,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Only Collect 6 Main Stars in Each Main Level",
            300,
            180,
            globalFont,
            scale,
            color
        },
		{
		
		    "120 Star: Get 120 Stars",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
		
		    "All glitches allowed",
            0,
            280,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            330,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            370,
            globalFont,
            scale,
            color
        },
		{
            "So make sure you're ready to start the speedrun, and No cheating as well!",
            0,
            410,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "16 Star: Get 16 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect 16 Stars and then beat Bowser",
            0,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(You're ONLY allowed to Switch Moveset to Classic in the Castle Upstairs)",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "70 Star: Get 70 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(MIPS clip and Switching Moveset to Classic is banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "90 Star: Get 90 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 6 Stars in Each Main Levels",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(Any Secret Courses Stars and 100 Coin Stars are Banned)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            150,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect All 120 Stars and Beat Bowser",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            250,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:	
	if SM64Rules and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched == true) then
        if (hasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1300, 1100, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmed = true
                end
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
				Rules_is_closed_for_intro = true
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun then
		switched = false
		if (hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmed = true
			end
		end
	if gGlobalSyncTable.startIntro then
		if gGlobalSyncTable.warptointro then 
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			gGlobalSyncTable.warptointro = false
			switched = false
		if (hasConfirmed == false) then
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			hasConfirmed = true
			end
			end
		end
		
	if not Rules_Display then
		switched = false
		if (hasConfirmed == false) then
            set_mario_action(m, ACT_IDLE, 0)
            hasConfirmed = true	
			end
		end
	
	if not Rules_Display or Rules_is_closed_for_intro then
	if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
			end
		end
		end
	end
	
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed == true then
       switched = false
	   end
	end
end


local srswitched = true
local srhasConfirmed = false
function displayrules_starroad(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "Any Stars: Grab any stars",
            -400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab how many stars you can get and then battle bowser",
            -400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -400,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "20 Stars: Grab 20 stars",
			 380,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "After Getting 20 Stars, Defeat the plants and grab the key",
             380,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(Clipping Out of Bounds is Banned)",
             380,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "80 Star: Get 80 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "You can't passed the 80 Star door",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs are Banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "130 Star: Get 130 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "Make sure get all stars and replica stars",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "150 Star: Get 150 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "This is for the Replica Comet, so you only use this for that romhack",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
			"Make sure get all stars and replica stars",
            0,
            220,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed In Replica Comet)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "For SR: /set run to [any|20|80|130], For SRTRC: /set run to [any|20|80|130|150]",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sr_only in pairs(gActiveMods) do
	if gActiveMods[sr_only].name:find("Star Road") or gActiveMods[sr_only].name:find("Star Road: The Replica Comet") then
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (srswitched == true) then
        if (srhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1530, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                srswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (srhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    srhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            srswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and srhasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (srhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                srhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	srswitched = false
	if (srhasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		srhasConfirmed = true	
		gGlobalSyncTable.warptointro = false
			end
			end
	if not Rules_Display then
		srswitched = false
		if (srhasConfirmed == false) then
            set_mario_action(m, ACT_IDLE, 0)
            srhasConfirmed = true	
			end
			end
		end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       srswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and srhasConfirmed == true then
       srswitched = false
	   end
	end
	end
end

local switched74 = true
local hasConfirmed74 = false
function displayrules_74(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "0 Stars: Get 0 Stars",
            -400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            -400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -400,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "10 Star: Get 10 Stars",
            400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 10 stars and then beat bowser",
            400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            400,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            220,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            300,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            340,
            globalFont,
            scale,
            color
        },
		{
            "If you want to try SM74EE, you can do that by the /swap command",
            0,
            380,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Bomb Clip is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 151 Stars and then beat bowser",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sm74only in pairs(gActiveMods) do
	if (gActiveMods[sm74only].name:find("Super Mario 74") and gActiveMods[sm74only].name:find("(+EE)")) and gNetworkPlayers[0].currAreaIndex == 1 then
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched74 == true) then
        if (hasConfirmed74 == false) and Rules_Display then
			m.pos.x = -6558
			m.pos.y = -578
			m.pos.z = 6464
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1450, 1000, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switched74 = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmed74 == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmed74 = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switched74 = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74 == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmed74 == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74 = true	
			end
			end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		switched74 = false
		if (hasConfirmed74 == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmed74 = true
			end
		end
	if not Rules_Display then
		switched74 = false
		if (hasConfirmed74 == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmed74 = true	
			end
			end
		end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switched74 = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74 == true then
       switched74 = false
	   end
	end
	end
end

local switched74ee = true
local hasConfirmed74ee = false
function displayrules_74ee(m)
   
    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "0 Stars: Get 0 Stars",
            -400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            -400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -400,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "10 Star: Get 10 Stars",
            400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 10 stars and then beat bowser",
            400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            400,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "50 Star: Get 50 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 50 stars and then beat bowser",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "125 Star: Get 125 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(Clipping is Banned)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "157 Star: Get 157 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 157 Stars and then beat bowser",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            220,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            300,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            340,
            globalFont,
            scale,
            color
        },
		{
            "If you want to go back to SM74, you can do that by the /swap command to go back",
            0,
            380,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "125 Star: Get 125 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(Clipping are banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
		{
		
            "157 Star: Get 157 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 157 Stars and then beat bowser",
            0,
            60,
            globalFont,
            scale,
            color
        },
		{
		
		    "(All Glitches are allowed)",
            0,
            100,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            180,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            220,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            360,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            400,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sm74eeonly in pairs(gActiveMods) do
	if (gActiveMods[sm74eeonly].name:find("Super Mario 74") and gActiveMods[sm74eeonly].name:find("(+EE)")) and gNetworkPlayers[0].currAreaIndex == 2 then
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched74ee == true) then
        if (hasConfirmed74ee == false) and Rules_Display then
			m.pos.x = 5481
			m.pos.y = -922
			m.pos.z = 6320
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1450, 1000, "#ffffff")
		end
		
		if OmmEnabled then
		renderRect(190, 120, FONT_MENU, 1000, 800, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switched74ee = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmed74ee == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmed74ee = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switched74ee = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74ee == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmed74ee == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74ee = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	switched74ee = false
	if (hasConfirmed74ee == false) then
		set_mario_action(m, ACT_IDLE, 0)
		hasConfirmed74ee = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		switched74ee = false
		if (hasConfirmed74ee == false) then
            set_mario_action(m, ACT_IDLE, 0)
            hasConfirmed74ee = true	
			end
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switched74ee = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74ee == true then
       switched74ee = false
	   end
	end
	end
end

local switched74ty = true
local hasConfirmed74ty = false
function displayrules_74ty(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Star: Get 0 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            0,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -180,
            globalFont,
            scale,
            color
        },
        {
            "120 Star: Get 120 Stars",
            0,
            -100,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -50,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
		
		    "155 Star: Get 155 Stars",
            0,
            90,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 155 Stars and then beat bowser",
            0,
            140,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            290,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            330,
            globalFont,
            scale,
            color
        },
		{
            "The Areas looks similar to Sm74 and Sm74ee, so you might get used to it",
            0,
            370,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "120 Star: Get 120 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Stars doors can't be skipped",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(Clipping are banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
		{
		
            "155 Star: Get 155 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 155 Stars and then beat bowser",
            0,
            60,
            globalFont,
            scale,
            color
        },
		{
		
		    "(All Glitches are allowed)",
            0,
            100,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            180,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            220,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            360,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            400,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sm74tyonly in pairs(gActiveMods) do
	if gActiveMods[sm74tyonly].name:find("Ten Years After") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switched74ty == true) then
        if (hasConfirmed74ty == false) and Rules_Display then
        	m.pos.x = -5097
			m.pos.y = -157
			m.pos.z = 6235
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")
		end

		if OmmEnabled then
		renderRect(190, 120, FONT_MENU, 1000, 800, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switched74ty = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmed74ty == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmed74ty = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switched74ty = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74ty == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmed74ty == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74ty = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	switched74ty = false
	if (hasConfirmed74ty == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmed74ty = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		switched74ty = false
		if (hasConfirmed74ty == false) then
            set_mario_action(m, ACT_IDLE, 0)
            hasConfirmed74ty = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switched74ty = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmed74ty == true then
       switched74ty = false
	   end
	end
	end
end

local msswitched = true
local mshasConfirmed = false
function displayrules_ms(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "31 Moon: Get 31 Moons",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect 31 Moons in this Romhack",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"50 Moon: Get 50 Moons",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Grab All 50 Moons in this Romhack",
            0,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            60,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "don't worry, the timer stop on a star in moonshine",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for msonly in pairs(gActiveMods) do
	if gActiveMods[msonly].name:find("Super Mario 64 Moonshine") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (msswitched == true) then
        if (mshasConfirmed == false) and Rules_Display then
            m.pos.x = 5
			m.pos.y = -2794
			m.pos.z = 2082
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                msswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (mshasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    mshasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            msswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and mshasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (mshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                mshasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	msswitched = false
	if (mshasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        mshasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		msswitched = false
		if (mshasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			mshasConfirmed = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       msswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and mshasConfirmed == true then
       msswitched = false
	   end
	end
	end
end

local switchedkbr2 = true
local hasConfirmedkbr2 = false
function displayrules_kbr2(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Star: Get 0 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Clip through the doors to enter",
            0,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -180,
            globalFont,
            scale,
            color
        },
        {
            "110 Star: Get 110 Stars",
            0,
            -100,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -50,
            globalFont,
            scale,
            color
        },
		{
		
			"(Clipping Through doors is Banned)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
		
		    "182 Star: Get 182 Stars",
            0,
            90,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 182 Stars and then beat the Ice Bully",
            0,
            140,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            290,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            330,
            globalFont,
            scale,
            color
        },
		{
            "This romhack is really tough, so good luck speedrunning",
            0,
            370,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for kbr2only in pairs(gActiveMods) do
	if gActiveMods[kbr2only].name:find("King Boo's Revenge 2") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switchedkbr2 == true) then
        if (hasConfirmedkbr2 == false) and Rules_Display then
            m.pos.x = 7710
			m.pos.y = 1575
			m.pos.z = 6682
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switchedkbr2 = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmedkbr2 == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmedkbr2 = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switchedkbr2 = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedkbr2 == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmedkbr2 == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedkbr2 = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	switchedkbr2 = false
	if (hasConfirmedkbr2 == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmedkbr2 = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		switchedkbr2 = false
		if (hasConfirmedkbr2 == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmedkbr2 = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switchedkbr2 = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedkbr2 == true then
       switchedkbr2 = false
	   end
	end
	end
end

local lugswitched = true
local lughasConfirmed = false
function displayrules_lug(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "64 Star: Get 64 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Timer will Stops at 64 stars. (if you're using Green Comet then you go to the chair)",
            0,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -180,
            globalFont,
            scale,
            color
        },
        {
            "74 Star: Get 74 Stars",
            0,
            -100,
            globalFont,
            scale,
            color
        },
        {
		
		    "Timer will Stops at 74 stars. (if you're using Green Comet then you go to the chair)",
            0,
            -50,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
		
		    "80 Green Star: Get 80 Green Stars",
            0,
            90,
            globalFont,
            scale,
            color
        },
        {
		
		    "This is for the Green Comet Version, so you only use this for that romhack",
            0,
            140,
            globalFont,
            scale,
            color
        },
		{
			"Make sure get all green stars and don't go to the chair without 80 Green Stars",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed In Greem Comet)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "For LDD: /set run to [64|74], For LDDGG: stops on the chair in sweet delight",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for lugdd_only in pairs(gActiveMods) do
	if gActiveMods[lugdd_only].name:find("Lug's Delightful Dioramas") or gActiveMods[lugdd_only].name:find("Lug's Delightful Dioramas Green Comet") then
	if not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (lugswitched == true) then
        if (lughasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                lugswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (lughasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    lughasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            lugswitched = false
			if not (m.controller.buttonDown & L_TRIG) ~= 0 and lughasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (lughasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                lughasConfirmed = true	
			end
		end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	lugswitched = false
	if (lughasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        lughasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		lugswitched = false
			if (lughasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			lughasConfirmed = true	
			end
			end
		end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       lugswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and lughasConfirmed == true then
       lugswitched = false
	   end
	end
	end
end

local gsswitched = true
local gshasConfirmed = false
function displayrules_green_star(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
            "80 Star: Get 80 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
		
		    "131 Star: Get 131 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 131 Stars and then beat Bowser",
            0,
            60,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            100,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            180,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            220,
            globalFont,
            scale,
            color
        },
		{
            "This romhack is a decent one, so you not gotta waste too much time on it",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            360,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            400,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for gsonly in pairs(gActiveMods) do
	if gActiveMods[gsonly].name:find("SM64: The Green Stars") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (gsswitched == true) then
        if (gshasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                gsswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (gshasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    gshasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            gsswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and gshasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (gshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                gshasConfirmed = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	gsswitched = false
	if (gshasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        gshasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
	gsswitched = false
		if (gshasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			gshasConfirmed = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       gsswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and gshasConfirmed == true then
       gsswitched = false
	   end
	end
	end
end

local switchedsapphire = true
local hasConfirmedsapphire = false
function displayrules_sapphire(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "0 Star: Get 0 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Skip the 30 Star door",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"30 Star: Get 30 Stars",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Grab 30 Stars and don't skip the 30 Star door",
            0,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            60,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "thankfully the timer stops at the grand star",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sapphireonly in pairs(gActiveMods) do
	if gActiveMods[sapphireonly].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switchedsapphire == true) then
        if (hasConfirmedsapphire == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switchedsapphire = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmedsapphire == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmedsapphire = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switchedsapphire = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedsapphire == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmedsapphire == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedsapphire = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	switchedsapphire = false
	if (hasConfirmedsapphire == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmedsapphire = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
	switchedsapphire = false
	if (hasConfirmedsapphire == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmedsapphire = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       switchedsapphire = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedsapphire == true then
       switchedsapphire = false
	   end
	end
	end
end

local tpcswitched = true
local tpchasConfirmed = false
function displayrules_tpc(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "30 Stars: Get 30 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Press The Button and Stop the Penguin",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"there's only one run for this romhack",
            0,
            -40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
		{
            "This is the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "The timer will stop on the fade out in the courtyard",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "Any%: Get Any Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Press The Button and Enter the Warp inside the boxes",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "30 Star: Get 30 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 30 Stars and then Enter the Warp inside the boxes",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "The timer will stop on the fade out in the courtyard",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for tpconly in pairs(gActiveMods) do
	if gActiveMods[tpconly].name:find("The Phantom's Call") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (tpcswitched == true) then
        if (tpchasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")
		end

        if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                tpcswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (tpchasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    tpchasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            tpcswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and tpchasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (tpchasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                tpchasConfirmed = true	
			end
			end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	tpcswitched = false
	if (tpchasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        tpchasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		tpcswitched = false
		if (tpchasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			tpchasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       tpcswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and tpchasConfirmed == true then
       tpcswitched = false
	   end
	end
	end
end

local stoswitched = true
local stohasConfirmed = false
function displayrules_star_takeover(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "91 Star: Get 91 Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get 91 Stars and then enter the Pipe in ???",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "101 Star: Get 101 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Enter the 99 and 100 doors and grab their stars, then enter the pipe",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "The timer will stop on the second pipe next to the sign",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sto_only in pairs(gActiveMods) do
	if gActiveMods[sto_only].name:find("Star Revenge 1: Star Takeover") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (stoswitched == true) then
        if (stohasConfirmed == false) and Rules_Display then
			m.pos.x = 8120
			m.pos.y = -1991
			m.pos.z = -9473
		if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                stoswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (stohasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    stohasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            stoswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and stohasConfirmed == false then
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (stohasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                stohasConfirmed = true	
			end
			end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	stoswitched = false
	if (stohasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        stohasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		stoswitched = false
		if (stohasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			stohasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       stoswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and stohasConfirmed == true then
       stoswitched = false
	   end
	end
	end
end

local nodswitched = true
local nodhasConfirmed = false
function displayrules_night_of_doom(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-290,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -210,
            globalFont,
            scale,
            color
        },
        {
            "90 Star: Get 90 Stars",
            0,
			-130,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 90 Stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJ are Banned)",
            0,
			-50,
            globalFont,
            scale,
            color
        },
        {
		
		    "160 Star: Get 160 Stars",
            0,
            40,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 160 Stars and then beat bowser",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            190,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            230,
            globalFont,
            scale,
            color
        },
		{
            "This romhack is pretty difficult so good luck, especially for bowser",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            340,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            400,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for nod_only in pairs(gActiveMods) do
	if gActiveMods[nod_only].name:find("Star Revenge 2: Night of Doom") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (nodswitched == true) then
        if (nodhasConfirmed == false) and Rules_Display then
            m.pos.x = 5843
			m.pos.y = -936
			m.pos.z = 3985
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                nodswitched = false
                if not (m.controller.buttonDown & L_TRIG) ~= 0 and nodhasConfirmed == false then
				play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
				end
                if (nodhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    nodhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            nodswitched = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (nodhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                nodhasConfirmed = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	nodswitched = false
	if (nodhasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        nodhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		nodswitched = false
		if (nodhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			nodhasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       nodswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and nodhasConfirmed == true then
       nodswitched = false
	   end
	end
	end
end

local sr65switched = true
local sr65hasConfirmed = false
function displayrules_sr65(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "1 Star: Get 1 Star",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Do alot of BLJ to skip the star doors",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"70 Star: Get 70 Stars",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Enter the 69 Door to get the last Star",
            0,
            30,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            130,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            170,
            globalFont,
            scale,
            color
        },
		{
            "The Timer will stop on the star inside main castle",
            0,
            210,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            280,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "70 Stars: Get 70 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
			"Enter the 69 Door to get the last Star",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"there's only one run for this romhack, If you using OMM Rebirth",
            0,
            -40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
		{
            "This is the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for sr65only in pairs(gActiveMods) do
	if gActiveMods[sr65only].name:find("Star Revenge 6.5") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (sr65switched == true) then
        if (sr65hasConfirmed == false) and Rules_Display then
            m.pos.x = -14341
			m.pos.y = -552
			m.pos.z = -9602
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 900, 800, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                sr65switched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (sr65hasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    sr65hasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            sr65switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and sr65hasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (sr65hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                sr65hasConfirmed = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	sr65switched = false
	if (sr65hasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        sr65hasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		sr65switched = false
		if (sr65hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			sr65hasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       sr65switched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and sr65hasConfirmed == true then
       sr65switched = false
	   end
	end
	end
end

local taswitched = true
local tahasConfirmed = false
function displayrules_ta(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "75 Star: Get 75 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 75 Stars and then beat bowser",
            0,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -180,
            globalFont,
            scale,
            color
        },
        {
            "115 Star: Get 115 Stars",
            0,
            -100,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 115 Stars and then beat bowser",
            0,
            -50,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
		
		    "151 Star: Get 151 Stars",
            0,
            90,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 151 Stars and then beat bowser",
            0,
            140,
            globalFont,
            scale,
            color
        },
		{
			"It's was meant to be 152 stars but if you want to do that, you can",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "This romhack is pretty difficult so good luck, especially for bowser",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for ta_only in pairs(gActiveMods) do
	if gActiveMods[ta_only].name:find("Twisted Adventures") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (taswitched == true) then
        if (tahasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                taswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (tahasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    tahasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            taswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and tahasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (tahasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                tahasConfirmed = true	
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	taswitched = false
	if (tahasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        tahasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		taswitched = false
		if (tahasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			tahasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       taswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and tahasConfirmed == true then
       taswitched = false
	   end
	end
	end
end

local lmswitched = true
local lmhasConfirmed = false
function displayrules_lm64(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "100 Star: Get 100 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 100 Stars and then beat bowser",
            0,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -180,
            globalFont,
            scale,
            color
        },
        {
            "111 Star: Get 111 Stars",
            0,
            -100,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 111 Stars and then beat bowser",
            0,
            -50,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are also allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
		
		    "118 Star: Get 118 Stars",
            0,
            90,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 118 Stars and then beat bowser",
            0,
            140,
            globalFont,
            scale,
            color
        },
		{
			"You need to enter Shiverside Station before heading to Bowser",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "Thankfully, the timer stops at the grand star",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for lm_only in pairs(gActiveMods) do
	if gActiveMods[lm_only].name:find("Luigi's Mansion 64") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if not Rules_Display or Rules_is_closed_for_intro then
	if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
		end
		end
	end
    if (lmswitched == true) then
        if (lmhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                lmswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (lmhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    lmhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            lmswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and lmhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (lmhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                lmhasConfirmed = true
				Rules_is_closed_for_intro = true
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun then
	lmswitched = false
	if (lmhasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        lmhasConfirmed = true
			end
			end
if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
	lmswitched = false
	if (lmhasConfirmed == false) then
        set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
        lmhasConfirmed = true
			end
		end
	end
	if not Rules_Display then
		lmswitched = false
		if (lmhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			lmhasConfirmed = true
			end
		end
		for no_lm65 in pairs(gActiveMods) do
		if gActiveMods[no_lm65].name:find("Luigi's Mansion 64.5") then
			lm65switched = false
		end
		end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       lmswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and lmhasConfirmed == true then
       lmswitched = false
	   end
	end
	end
end

local lm65switched = true
local lm65hasConfirmed = false
function displayrules_lm65(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
         {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "111 Star: Get 111 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab all 111 stars",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"apparently, there's only one run for this romhack",
            0,
            -40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "These rules still apply for both Easy and Super Players",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for lm65_only in pairs(gActiveMods) do
	if gActiveMods[lm65_only].name:find("Luigi's Mansion 64.5") and not obj_get_first_with_behavior_id(id_bhvActSelector) then 
	if not Rules_Display or Rules_is_closed_for_intro then
	if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
		end
		end
	end
    if (lm65switched == true) then
        if (lm65hasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                lm65switched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (lm65hasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    lm65hasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            lm65switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and lm65hasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (lm65hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                lm65hasConfirmed = true	
				Rules_is_closed_for_intro = true
			end
			end	
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun then
	lm65switched = false
	if (lm65hasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        lm65hasConfirmed = true
			end
			end
	if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
	lm65switched = false
	if (lm65hasConfirmed == false) then
        set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		lm65hasConfirmed = true
				end
			end
		end
	if not Rules_Display then
		lm65switched = false
		if (lm65hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			lm65hasConfirmed = true
			end
		end
		for no_lm64 in pairs(gActiveMods) do
		if gActiveMods[no_lm64].name:find("Luigi's Mansion 64") then
			lmswitched = false
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       lm65switched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and lm65hasConfirmed == true then
       lm65switched = false
	   end
	end
	end
end

local PIswitched = true
local PIhasConfirmed = false
function displayrules_paradise_island(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 30 Stars and don't skip the 30 Star door",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"50 Star: Get 50 Stars",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Grab 50 Stars and then Beat Bowser",
            0,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            60,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "thankfully the timer stops at the grand star",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for paradiseonly in pairs(gActiveMods) do
	if gActiveMods[paradiseonly].name:find("SM64 Paradise Island") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (PIswitched == true) then
        if (PIhasConfirmed == false) and Rules_Display then
            m.pos.x = 3255
			m.pos.y = 190
			m.pos.z = -4806
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                PIswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (PIhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    PIhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            PIswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and PIhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (PIhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                PIhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	PIswitched = false
	if (PIhasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        PIhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		PIswitched = false
		if (PIhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			PIhasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       PIswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and PIhasConfirmed == true then
       PIswitched = false
	   end
	end
	end
end

local ZA2switched = true
local ZA2hasConfirmed = false
function displayrules_ztar_attack_2(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
         {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
		{
            "Any%: Get Any Time Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
			"Beat Bowser as quickly as possible",
            0,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(Any and all skips allowed)",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "Warpless Any%: Get Any Time Stars Warpless",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Beat Bowser while going through the game's 5 Main Worlds",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(Any form of World skips and Warps are banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
		
            "81 Time Star: Get 81 Time Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect all the Time Stars between World 1 and 5 and Defeat Bowser.",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
		    "(Any form of World skips and Warps are banned)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
            "91 Time Star: Get 91 Time Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "(Any and all Skips and Warps are allowed)",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
		
		    "All Bosses: Defeat every boss",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
		
		    "(Any and all skips allowed)",
            0,
            280,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            330,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            370,
            globalFont,
            scale,
            color
        },
		{
            "if you want to set up the time stars, type /set run to [any|warpless|81|91|bosses]",
            0,
            410,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for ZA2only in pairs(gActiveMods) do
	if gActiveMods[ZA2only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (ZA2switched == true) then
        if (ZA2hasConfirmed == false) and Rules_Display then
            m.pos.x = -1226
			m.pos.y = -1823
			m.pos.z = 515
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1200, 1000, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                ZA2switched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (ZA2hasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    ZA2hasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            ZA2switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and ZA2hasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (ZA2hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                ZA2hasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	ZA2switched = false
	if (ZA2hasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        ZA2hasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		ZA2switched = false
		if (ZA2hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			ZA2hasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       ZA2switched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and ZA2hasConfirmed == true then
       ZA2switched = false
	   end
	end
	end
end

local switchedpinkstar = true
local hasConfirmedpinkstar = false
function displayrules_pink_star(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "0 Star: Get 0 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Skip the 30 Star door",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"30 Star: Get 30 Stars",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Grab All 30 Star Door and Beat Bowser",
            0,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            60,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "thankfully the timer stops at the grand star",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "30 Star: Get 30 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
			"Grab All 30 Star Door and Beat Bowser",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"there's only one run for this romhack, If you using OMM Rebirth",
            0,
            -40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
		{
            "This is the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for pinkstar_only in pairs(gActiveMods) do
	if gActiveMods[pinkstar_only].name:find("pink star") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (switchedpinkstar == true) then
        if (hasConfirmedpinkstar == false) and Rules_Display then
        	m.pos.x = -426
			m.pos.y = 1243
			m.pos.z = -161
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 900, 800, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                switchedpinkstar = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (hasConfirmedpinkstar == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    hasConfirmedpinkstar = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            switchedpinkstar = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedpinkstar == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (hasConfirmedpinkstar == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedpinkstar = true	
			end
			end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	switchedpinkstar = false
	if (hasConfirmedpinkstar == false) then
        set_mario_action(m, ACT_IDLE, 0)
        hasConfirmedpinkstar = true	
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		switchedpinkstar = false
		if (hasConfirmedpinkstar == false) then
			set_mario_action(m, ACT_IDLE, 0)
			hasConfirmedpinkstar = true	
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       PIswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and hasConfirmedpinkstar == true then
       PIswitched = false
	   end
	end
	end
end

local HSswitched = true
local HShasConfirmed = false
function displayrules_hidden_stars(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
		{
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "10 Star: Get 10 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 10 stars, Grab the Wing Cap and enter the pipe",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "56 Star: Get 56 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 56 Stars and enter the pipe inside the castle at castle grounds",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "112 Star: Get 112 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 112 Stars and enter the pipe inside the castle at castle grounds",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "Thankfully the timer stops when entering the pipe",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "0 Stars: Get 0 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Clip inside the castle's roof and enter the pipe",
            0,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "10 Star: Get 10 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get at least 10 stars, Grab the Wing Cap and enter the pipe",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "Grab 56 Stars and enter the pipe inside the castle at castle grounds",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "112 Star: Get 112 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 112 Stars and enter the pipe inside the castle at castle grounds",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            220,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            300,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            340,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            380,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for hs_only in pairs(gActiveMods) do
	if gActiveMods[hs_only].name:find("SM 64 Hidden Stars") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
	if not Rules_Display or Rules_is_closed_for_intro then
	if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
		end
		end
	end	
    if (HSswitched == true) then
        if (HShasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")
		end
		
		if OmmEnabled then
		renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                HSswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (HShasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    HShasConfirmed = true
                end
            end
        end
		
		if not Rules_Display then
		HSswitched = false
		if (HShasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			HShasConfirmed = true
			end
		end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            HSswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and HShasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (HShasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                HShasConfirmed = true	
				Rules_is_closed_for_intro = true
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun then
	HSswitched = false
	if (HShasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		HShasConfirmed = true
				end
			end
if gGlobalSyncTable.startIntro then
	if gGlobalSyncTable.warptointro then 
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		gGlobalSyncTable.warptointro = false
		HSswitched = false
	if (HShasConfirmed == false) then
		set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
		HShasConfirmed = true
			end
			end
		end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       HSswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and HShasConfirmed == true then
       HSswitched = false
	   end
	end
	end
end

local GJswitched = true
local GJhasConfirmed = false
function displayrules_galactic_journey(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
		{
            "12 Star: Get 12 Stars",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
			"Do alot of BLJ to skip the doors",
            0,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All glitches allowed)",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "24 Star: Get 24 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "12 star door cannot be bypassed",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(All glitches allowed)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
		
            "44 Star: Get 44 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "12 and 42 star doors cannot be bypassed.",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
		    "(BLJs are allowed but only at the 87 star door, and Mips Clip is Banned)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
            "87 Star: Get 87 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "all door cannot be bypassed (so BLJs are Banned)",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
		
		    "102 Star: Get 102 Stars",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
		
		    "All glitches allowed",
            0,
            280,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            330,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            370,
            globalFont,
            scale,
            color
        },
		{
            "Good Luck on King Bob-omb tho",
            0,
            410,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "44 Star: Get 44 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "12 and 42 star doors cannot be bypassed.",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(Wall Jumps over the 87 Star Door is Allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "87 Star: Get 87 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "All Star Doors can't be skipped",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Wall Jumps over the 87 Star Door is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "102 Star: Get 102 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 102 Stars and then beat King Bob-omb",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for GJ_only in pairs(gActiveMods) do
	if gActiveMods[GJ_only].name:find("The Galactic Journey") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (GJswitched == true) then
        if (GJhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1100, 1000, "#ffffff")
		end
		
		if OmmEnabled then
		renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                GJswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (GJhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    GJhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            GJswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and GJhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (GJhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                GJhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	GJswitched = false
	if (GJhasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		GJhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		GJswitched = false
		if (GJhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			GJhasConfirmed = true
			end
			end
		end
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then return end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       GJswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and GJhasConfirmed == true then
       GJswitched = false
	   end
	end
	end
end

local storswitched = true
local storhasConfirmed = false
function displayrules_star_takeover_redone(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "66 Star: Get 66 Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get 66 Stars and then Beat Bowser",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs is Banned)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "125 Star: Get 125 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get 125 Stars and then Beat Bowser",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "don't worry, the timer stops on the Grand Star",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for stor_only in pairs(gActiveMods) do
	if gActiveMods[stor_only].name:find("Star Takeover Redone") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (storswitched == true) then
        if (storhasConfirmed == false) and Rules_Display then
        	m.pos.x = -3782
			m.pos.y = -2537
			m.pos.z = -2770
        if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                storswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (storhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    storhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            storswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and storhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (storhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                storhasConfirmed = true	
			end
			end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	storswitched = false
	if (storhasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        storhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		storswitched = false
		if (storhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			storhasConfirmed = true
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       storswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and storhasConfirmed == true then
       storswitched = false
	   end
	end
	end
end

local FRswitched = true
local FRhasConfirmed = false
function displayrules_forest_ruins(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]

	texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "21 Star: Get 0 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect 21 stars and then beat bowser",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"40 Star: Get 40 Stars",
            0,
            -20,
            globalFont,
            scale,
            color
        },
		{
		
			"Grab all 40 Stars and then beat bowser",
            0,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are Allowed for both)",
            0,
            60,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "The timer stops after touching the star in the courtyard",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for FRonly in pairs(gActiveMods) do
	if gActiveMods[FRonly].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (FRswitched == true) then
        if (FRhasConfirmed == false) and Rules_Display then
        	m.pos.x = -4268
			m.pos.y = -0
			m.pos.z = 5461
		if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")

        -- print all texts
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                FRswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (FRhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    FRhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            FRswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and FRhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (FRhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                FRhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	FRswitched = false
	if (FRhasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		FRhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		FRswitched = false
		if (FRhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			FRhasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       FRswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and FRhasConfirmed == true then
       FRswitched = false
	   end
	end
	end
end

local TYD64switched = true
local TYD64hasConfirmed = false
function displayrules_thousand_year_door_64(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Star: Get 0 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "BLJ on a Pillar and then enter the warp",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "30 Star: Get 30 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 30 Stars and then enter the warp",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 30 Star door is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "80 Star: Get 80 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 80 Stars and then Enter the Warp inside the 30 star door",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "the Timer will Stops on the end picture",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "30 Star: Get 30 Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 30 Stars and then enter the warp",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 30 Star door is Banned)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "80 Star: Get 80 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 80 Stars and then Enter the Warp inside the 30 star door",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for TYD64only in pairs(gActiveMods) do
	if gActiveMods[TYD64only].name:find("Thousand") and gActiveMods[TYD64only].name:find("Year Door 64") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (TYD64switched == true) then
        if (TYD64hasConfirmed == false) and Rules_Display then
			m.pos.x = -1722
			m.pos.y = 120
			m.pos.z = -4331
		if m.action ~= ACT_READING_NPC_DIALOG then
			set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
			end
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		-- print all texts
		if OmmEnabled then
        for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                TYD64switched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (TYD64hasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    TYD64hasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            TYD64switched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and TYD64hasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (TYD64hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                TYD64hasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	TYD64switched = false
	if (TYD64hasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		TYD64hasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		TYD64switched = false
		if (TYD64hasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			TYD64hasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       TYD64switched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and TYD64hasConfirmed == true then
       TYD64switched = false
	   end
	end
	end
end

local TMCswitched = true
local TMChasConfirmed = false
function displayrules_the_mushroom_cup(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "16 Star: Get 16 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get 16 Stars and Beat Bowser",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "100 Star: Get 100 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 100 and get the Shrine Ending",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(You need to collect the Shrine Star after getting 99 Stars)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "130 Star: Get 130 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 130 Stars and get the Shrine Ending",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "This Romhack has two ending, which is interesting",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
            "0 Star: Get 0 Stars",
            -400,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Climb You're way to Bowser and Grab the Grand Star",
            -400,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            -400,
            -200,
            globalFont,
            scale,
            color
        },
		{
            "1 Star: Get 1 star",
			 380,
            -280,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab a Star in Shrine of the Mushroom and enter the Shrine",
             380,
            -240,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
             380,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
            "16 Star: Get 16 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Get 16 Stars and Beat Bowser",
            0,
            -100,
            globalFont,
            scale,
            color
        },
		{
		
			"(BLJs are Banned)",
            0,
            -60,
            globalFont,
            scale,
            color
        },
        {
            "100 Star: Get 100 Stars",
            0,
            0,
            globalFont,
            scale,
            color
        },
        {
		
		    "You need to collect the Shrine Star after getting 99 Stars",
            0,
            40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed, I guess)",
            0,
            80,
            globalFont,
            scale,
            color
        },
        {
		
		    "130 Star: Get 130 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 130 Stars and get the Shrine Ending",
            0,
            180,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            220,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for TMConly in pairs(gActiveMods) do
	if gActiveMods[TMConly].name:find("\\#ff2b1c\\The \\#636363\\Mushroom \\#ffb742\\Cup") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (TMCswitched == true) then
        if (TMChasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1550, 1000, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		-- print all texts
		if OmmEnabled then
        for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                TMCswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (TMChasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    TMChasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            TMCswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and TMChasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (TMChasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                TMChasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	TMCswitched = false
	if (TMChasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		TMChasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		TMCswitched = false
		if (TMChasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			TMChasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       TMCswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and TMChasConfirmed == true then
       TMCswitched = false
	   end
	end
	end
end

local ERswitched = true
local ERhasConfirmed = false
function displayrules_eternal_realm(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Star: Get 0 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Clip Through the Door and grab the key",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(Make Sure you get WC and VC before doing so)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "25 Star: Get 25 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 25 and grab the key",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 25 Star Door is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "47 Star: Get 47 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 47 Stars and grab the key",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "The Timer Stops once the key is collected",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for ERonly in pairs(gActiveMods) do
	if gActiveMods[ERonly].name:find("Eternal Realm") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (ERswitched == true) then
        if (ERhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")

        -- print all texts
		
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                ERswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (ERhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    ERhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            ERswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and ERhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (ERhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                ERhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	ERswitched = false
	if (ERhasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		ERhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		ERswitched = false
		if (ERhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			ERhasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       ERswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and ERhasConfirmed == true then
       ERswitched = false
	   end
	end
	end
end

local DMGswitched = true
local DMGhasConfirmed = false
function displayrules_despair_mario_gambit(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Star: Get 0 Stars",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Clip Through the Doors and then enter the pipe",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "53 Star: Get 53 Stars",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 53 stars and then enter the pipe",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 53 Star Door is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 120 Stars and then enter the pipe",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "The Timer Stops once entering the end picture",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "53 Star: Get 53 Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 53 stars and then enter the pipe",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 53 Star Door is Banned)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "120 Star: Get 120 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 120 Stars and then enter the pipe",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for DMGonly in pairs(gActiveMods) do
	if gActiveMods[DMGonly].name:find("Despair Mario's Gambit") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (DMGswitched == true) then
        if (DMGhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                DMGswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (DMGhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    DMGhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            DMGswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and DMGhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (DMGhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                DMGhasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	DMGswitched = false
	if (DMGhasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		DMGhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		DMGswitched = false
		if (DMGhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			DMGhasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       DMGswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and DMGhasConfirmed == true then
       DMGswitched = false
	   end
	end
	end
end

local SRLswitched = true
local SRLhasConfirmed = false
function displayrules_super_retro_land(m)

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
			-280,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "4 Stars: Get 4 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab all 4 Stars and then Grab The Key",
            0,
            -90,
            globalFont,
            scale,
            color
        },
		{
			"You Need the key to open Mario's House Door to enter the bed",
            0,
            -40,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            10,
            globalFont,
            scale,
            color
        },
		{
            "This is the rules of what to do in a speedrun",
            0,
            120,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            160,
            globalFont,
            scale,
            color
        },
		{
            "The timer will stop once entering the bed",
            0,
            200,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            270,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            360,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "0 Stars: Get 0 Stars",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab the key and then enter the bed",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "4 Stars: Get 4 Stars",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab all 4 Stars and then enter the bed",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for SRLonly in pairs(gActiveMods) do
	if gActiveMods[SRLonly].name:find("Super Retro Land") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (SRLswitched == true) then
        if (SRLhasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 790, 800, "#ffffff")
		end

        if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end

        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                SRLswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (SRLhasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    SRLhasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            SRLswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and SRLhasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (SRLhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                SRLhasConfirmed = true	
			end
			end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	SRLswitched = false
	if (SRLhasConfirmed == false) then
        set_mario_action(m, ACT_IDLE, 0)
        SRLhasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		SRLswitched = false
		if (SRLhasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			SRLhasConfirmed = true
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       SRLswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and SRLhasConfirmed == true then
       SRLswitched = false
	   end
	end
	end
end

local Katzeswitched = true
local KatzehasConfirmed = false
function displayrules_katze_64(m)
    hostnum = network_local_index_from_global(0)
    host = gNetworkPlayers[hostnum]

    -- texts are written inside here.
    --[[ format: 
    {
        string, 
        x, 
        y, 
        font, 
        scale, 
        color (color in "#xxxxxx" format pls)
    }
--]]
    texts = {
        {
            "Hello, Welcome to the Speedrun server!",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
            "0 Burger: Get 0 Burgers",
            0,
            -250,
            globalFont,
            scale,
            color
        },
        {
		
		    "Clip Through the Doors and then enter the warp",
            0,
            -200,
            globalFont,
            scale,
            color
        },
		{
		
			"(All Glitches are allowed)",
            0,
            -150,
            globalFont,
            scale,
            color
        },
        {
            "30 Burger: Get 30 Burgers",
            0,
            -50,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 30 burgers and then enter the warp",
            0,
            0,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 30 burger door is Banned)",
            0,
            50,
            globalFont,
            scale,
            color
        },
        {
		
		    "40 Burger: Get 40 Burgers",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 40 burgers and then enter the warp",
            0,
            200,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            260,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            360,
            globalFont,
            scale,
            color
        },
		{
            "The Timer Stops once entering the end picture",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            460,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            500,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }
	
	ommtexts = {
        {
            "Hello, Welcome to the OMM Rebirth Speedrun server!",
            0,
			-360,
            globalFont,
            scale,
            color
        },
        {
            "Rules:",
            0,
            -280,
            globalFont,
            scale,
            color
        },
        {
            "30 Burger: Get 30 Burgers",
            0,
            -200,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab 30 burgers and then enter the warp",
            0,
            -150,
            globalFont,
            scale,
            color
        },
		{
		
			"(Skipping the 30 burger door is Banned)",
            0,
            -90,
            globalFont,
            scale,
            color
        },
        {
		
		    "40 Burger: Get 40 Burgers",
            0,
            20,
            globalFont,
            scale,
            color
        },
        {
		
		    "Grab All 40 burgers and then enter the warp",
            0,
            80,
            globalFont,
            scale,
            color
        },
		{
			"(All Glitches are allowed)",
            0,
            140,
            globalFont,
            scale,
            color
        },
        {
            "These are the rules of what to do in a speedrun",
            0,
            240,
            globalFont,
            scale,
            color
        },
        {
            "Breaking the rules will result the run as a invalid",
            0,
            280,
            globalFont,
            scale,
            color
        },
		{
            "These rules are for OMM Rebirth, To avoid confusion of what run to do",
            0,
            320,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            430,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            480,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
	for Katzeonly in pairs(gActiveMods) do
	if gActiveMods[Katzeonly].name:find("Katze Stuck in the Toilet 64") and not obj_get_first_with_behavior_id(id_bhvActSelector) then
    if (Katzeswitched == true) then
        if (KatzehasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
		if not OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 1000, "#ffffff")
		end
		
		if OmmEnabled then
        renderRect(190, 120, FONT_MENU, 1000, 950, "#ffffff")
		end

        -- print all texts
		if not OmmEnabled then
        for _, v in ipairs(texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if OmmEnabled then
		for _, v in ipairs(ommtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
        -- get relative coordinates of OK text
        local xd = returnX("OK", scale, globalFont)
        local yd = returnY("OK", scale, globalFont) + 360

        -- get mouse_x and mouse_y coordinates
        local mousex = djui_hud_get_mouse_x()
        local mousey = djui_hud_get_mouse_y()

        -- calculate distance between button and mouse
        -- if player presses D_PAD Down or (if mouse_hover is activated) hovers over the OK text,
        -- the window closes.
        local dist = math.sqrt(((xd - mousex) ^ 2) + (((yd + 40) - mousey) ^ 2))
        if (CLOSE_ON_MOUSE_HOVER) then
            if (dist < 40) then
                Katzeswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (KatzehasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    KatzehasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            Katzeswitched = false
            if not (m.controller.buttonDown & L_TRIG) ~= 0 and KatzehasConfirmed == false then
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
            if (KatzehasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                KatzehasConfirmed = true	
			end
		end
if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	Katzeswitched = false
	if (KatzehasConfirmed == false) then
		set_mario_action(m, ACT_IDLE, 0)
		KatzehasConfirmed = true
		gGlobalSyncTable.warptointro = false
			end
		end
	if not Rules_Display then
		Katzeswitched = false
		if (KatzehasConfirmed == false) then
			set_mario_action(m, ACT_IDLE, 0)
			KatzehasConfirmed = true	
			end
			end
		end
	if (m.controller.buttonDown & L_TRIG) ~= 0 and Rules_Display then
       Katzeswitched = true
	elseif not (m.controller.buttonDown & L_TRIG) ~= 0 and KatzehasConfirmed == true then
       Katzeswitched = false
	   end
	end
	end
end

function displaycredits2()
    if (creditsswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    creditsswitched = true
	creditshasConfirmed = false
	return true
end