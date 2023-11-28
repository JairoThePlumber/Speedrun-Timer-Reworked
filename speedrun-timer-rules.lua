if gamemodes_is_checked or notallowedmods or no_cheats then return end

SM64Rulesonly = false
SM64Rules = false
Rules_is_closed_for_intro = false

if mod_storage_load("Rules_Display") == nil or mod_storage_load("Rules_Display") == "true" then
	Rules_Display = true
else
	Rules_Display = false
end

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
SM64Rulesonly = true
for sm64_rules in pairs(gActiveMods) do
if (gActiveMods[sm64_rules].incompatible ~= nil and gActiveMods[sm64_rules].incompatible:find("romhack")) then
SM64Rulesonly = false
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
            "Speedrun Timer Reworked V1.0.0",
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
            "A New Name for this Mod",
            0,
            -300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
        {
		
			"Added Custom Fonts (More Coming Soon)",
            0,
            -200,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added Stars Commands for ZA2",
            0,
            -100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added a Saving Function",
            0,
            0,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added A Version Display on the top right in /str_config info",
            0,
            100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added Teams (Thanks to Blocky)",
            0,
            200,
            globalFont,
			creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added a Warp Command",
            0,
            300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Added Compatible and Incompatible Mods",
            0,
            400,
            globalFont,
            creditscale + 0.5,
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
		
			"Anti-BLJ by mjcox24",
            0,
            100,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Rules Mod by Kaje",
            0,
            200,
            globalFont,
			creditscale + 0.5,
            creditcolor
        },
		{
		
			"Update Chat Command Choice by Vanilla and Squishy",
            0,
            300,
            globalFont,
            creditscale + 0.5,
            creditcolor
        },
		{
		
			"Bingo Mod by Blocky and Skeltan",
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
            "Revamp The Commands, so now it's stacks to each other",
            0,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Made it so rules Kinda appear if you're not in act select (unless you spam the A Button)",
            0,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Now Romhacks that ends with a end picture now stop the timer",
            0,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Better Countdown Command (Now you can put to 0 - 50 instead of 0 - 30)",
            0,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Better Buttons Command (so now it's enables if you're not using a moveset mod)",
            0,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"Other Moveset Mods like Pasta Castle or Sonic Character: Reworked are Compatible",
            0,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Every Romhack Now has it's own Speedrun Rules instead of only SM64 (You can ask me to correct the stars to collect)",
            0,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Better Stop Timer Command (so it's doesn't share with beated game function)",
            0,
			0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Rules Closes itself when the speedrun starts",
            0,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Made it so now Lives won't change after dying if the timer didn't start",
            0,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"When Having OMM Rebirth, KRB2, SR1, ZA2, LATFR and TGJ will now set to classic to prevent softlocks for those levels",
            0,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Now you need to have 0 stars before starting",
            0,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Removed Stars Commands for LDD:GG and Removed AntiBLJ 50 Command",
            0,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Now you won't go to a different level until you start the speedrun (to avoid people cheating)",
            0,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Now Stars Commands now shows what you choose without having to check again",
            0,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Rules can now be toggle by doing /str_config rules",
            0,
			400,
            globalFont,
            creditscale,
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
		
			"Super Mario 64: The Green Stars (New)",
            -230,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64 Sapphire (New)",
            -230,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"The Phantom's Call (New)",
            -230,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 1: Star Takeover (New)",
            -230,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 2: Night of Doom (New)",
            -230,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 6.5 (New)",
            -230,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SM64 - Twisted Adventures (New)",
            -230,
			400,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            "Luigi's Mansion 64 (New)",
			 230,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Luigi's Mansion 64.5 [EM + SPM] (New)",
             230,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"SM64 Paradise Island (New)",
             230,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Ztar Attack 2 (New)",
             230,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: Hidden Stars (New)",
             230,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"Super Mario 64: The Galactic Journey (New)",
             250,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Star Revenge 1.5: Star Takeover Redone (New)",
             250,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Luigi and the Forest Ruins (New)",
             250,
            -0,
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
            "Fixed description from getting cutoff",
            0,
            -350,
            globalFont,
            creditscale,
            creditcolor
        },
        {
		
			"Fixed Better Interaction System (For Real This Time)",
            0,
            -300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed SM74 and SM74EE Position",
            0,
            -250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed fall damage from a great height when the countdown starts, Somehow?",
            0,
            -200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Start Intro Command",
            0,
            -150,
            globalFont,
			creditscale,
            creditcolor
        },
		{
		
			"Fixed Restart Position",
            0,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Countdown Sounds For other players",
            0,
            -50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed SM74 Ten Year After Position",
            0,
			0,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Health Check (Thanks to Vanilla for Pointing it out)",
            0,
			50,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Restart Speedrun Command",
            0,
			100,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Countdown Sounds being shared with the buttons commands",
            0,
			150,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Beated Game Function (So it's fully stops when a run finishes)",
            0,
			200,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Start Timer Button (So Now it's doesn't interrupt the Restart Button)",
            0,
			250,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Star Road Command That Doesn't hide from other players who isn't the host",
            0,
			300,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed SM64 Rules getting overlapped by other rules",
            0,
			350,
            globalFont,
            creditscale,
            creditcolor
        },
		{
		
			"Fixed Other Bugs That weren't noticeable",
            0,
			400,
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
		end
			
		if (m.controller.buttonPressed & L_JPAD) ~= 0 and buttonispressed == 1 then
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

local controlsswitched = false
local controlshasConfirmed = false
function displaycontrols(m)
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
            "Controls For Commands and Buttons",
            0,
            -400,
            globalFont,
            scale,
            color
        },
        {
            "Command Controls:",
            -400,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
			"/str start speedrun/timer",
            -650,
            -280,
            globalFont,
            scale,
            color
        },
		{
		
			"(Start The Speedrun)",
            -650,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"/str start intro",
            -650,
            -180,
            globalFont,
            scale,
            color
        },
		{
		
			"(Starts with an Intro)",
            -650,
            -130,
            globalFont,
            scale,
            color
        },
		{
		
			"/str stop timer",
            -650,
             -80,
            globalFont,
            scale,
            color
        },
		{
		
			"(Stop the Timer)",
            -650,
             -30,
            globalFont,
            scale,
            color
        },
		{
		
			"/str stop speedrun",
            -650,
			  20,
            globalFont,
            scale,
            color
        },
		{
		
			"(Stop the Speedrun)",
            -650,
			  70,
            globalFont,
            scale,
            color
        },
		{
		
			"/str restart timer",
            -650,
			 120,
            globalFont,
            scale,
            color
        },
		{
		
			"(Restart the Timer 'only for a backup savefile')",
            -650,
			 170,
            globalFont,
            scale,
            color
        },
		{
		
			"/str restart speedrun",
            -650,
			 220,
            globalFont,
            scale,
            color
        },
		{
		
			"(Restart the Speedrun 'only for a backup savefile')",
            -630,
			 270,
            globalFont,
            scale,
            color
        },
		{
		
			"/str countdown 0-50",
            -200,
            -280,
            globalFont,
            scale,
            color
        },
		{
		
			"(Changes the countdown from 0 to 50)",
            -200,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"/str options buttons/commands",
            -200,
            -180,
            globalFont,
            scale,
            color
        },
		{
		
			"(changes the options of how you start the run)",
            -200,
            -130,
            globalFont,
            scale,
            color
        },
		{
		
			"/str controls",
            -200,
             -80,
            globalFont,
            scale,
            color
        },
		{
		
			"(It's displays the controls that is showing now)",
            -200,
             -30,
            globalFont,
            scale,
            color
        },
		{
            "Buttons Controls:",
            500,
            -330,
            globalFont,
            scale,
            color
        },
        {
		
			"X Button:",
            500,
            -280,
            globalFont,
            scale,
            color
        },
		{
		
			"(Start the Speedrun)",
            500,
            -230,
            globalFont,
            scale,
            color
        },
		{
		
			"Y Button:",
            500,
            -180,
            globalFont,
            scale,
            color
        },
		{
		
			"(Restarting the Speedrun)",
            500,
            -130,
            globalFont,
            scale,
            color
        },
		{
            "Z + D-Pad Down + Start Button:",
            500,
            -80,
            globalFont,
            scale,
            color
        },
		{
            "(Starts the an Intro)",
            500,
            -30,
            globalFont,
            scale,
            color
        },
        {
		
		    "L Trigger:",
            500,
            20,
            globalFont,
            scale,
            color
        },
		{
		
			"(Stopped the timer, but you can cancel it by pressing X)",
            500,
			70,
            globalFont,
            scale,
            color
        },
        {
            "Press A to proceed,",
            0,
            400,
            globalFont,
            scale,
            color
        },
        {
            "OK",
            0,
            440,
            FONT_MENU,
            scale,
            "#ff0000"
        }
    }

    -----------------------------------------
    -- Main code:
    if (controlsswitched == true) then
        if (controlshasConfirmed == false) then
            set_mario_action(m, ACT_READING_AUTOMATIC_DIALOG, 0)
        end
        -- render the rectangle.
        renderRect(190, 120, FONT_MENU, 2000, 2000, "#ffffff")

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
                controlsswitched = false
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
                if (controlshasConfirmed == false) then
                    set_mario_action(m, ACT_IDLE, 0)
                    controlshasConfirmed = true
                end
            end
        end

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 then
            controlsswitched = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (controlshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                controlshasConfirmed = true	
			end
		end
	if gGlobalSyncTable.startIntro then
		if gGlobalSyncTable.warptointro then 
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			gGlobalSyncTable.warptointro = false
			controlsswitched = false
		if (controlshasConfirmed == false) then
			set_mario_action(m, ACT_INTRO_CUTSCENE, 0)
			controlshasConfirmed = true
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
	if SM64Rules and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed = true	
				Rules_is_closed_for_intro = true
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		switched = false
		if (hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
				hasConfirmed = true
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
            "For SR: /set stars to [any|80|130], For SRTRC: /set stars to [any|80|130|150]",
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
	if gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (srhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                srhasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		srswitched = false
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
	if (gActiveMods[sm74only].name:find("Super Mario 74") and gActiveMods[sm74only].name:find("(+EE)")) and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD and gNetworkPlayers[0].currAreaIndex == 1 then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmed74 == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74 = true	
			end
		elseif not gNetworkPlayers[0].currAreaIndex == 1 then
		switched74 = false
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
	if (gActiveMods[sm74eeonly].name:find("Super Mario 74") and gActiveMods[sm74eeonly].name:find("(+EE)")) and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD and gNetworkPlayers[0].currAreaIndex == 2 then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmed74ee == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74ee = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		switched74ee = false
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
	if gActiveMods[sm74tyonly].name:find("Ten Years After") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmed74ty == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmed74ty = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		switched74ty = false
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
		
		    "31 Star: Get 31 Stars",
            0,
            -140,
            globalFont,
            scale,
            color
        },
        {
		
		    "Collect 31 Stars in this Romhack",
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
		
			"Grab All 50 Stars in this Romhack",
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
	if gActiveMods[msonly].name:find("Super Mario 64 Moonshine") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (mshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                mshasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE then
		msswitched = false
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
	if gActiveMods[kbr2only].name:find("King Boo's Revenge 2") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmedkbr2 == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedkbr2 = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		switchedkbr2 = false
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
		
		    "80 Star: Get 80 Stars",
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
            "For LDD: /set stars to [64|74], For LDDGG: stops on the chair in sweet delight",
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
	if gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE then
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

        if (m.controller.buttonPressed & A_BUTTON) ~= 0 or gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE then
            lugswitched = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
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
	if gActiveMods[gsonly].name:find("SM64: The Green Stars") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (gshasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                gshasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		gsswitched = false
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
	if gActiveMods[sapphireonly].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmedsapphire == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedsapphire = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE then
		switchedsapphire = false
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
	if gActiveMods[tpconly].name:find("The Phantom's Call") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (tpchasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                tpchasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		tpcswitched = false
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
	if gActiveMods[sto_only].name:find("Star Revenge 1: Star Takeover") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (stohasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                stohasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		stoswitched = false
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
	if gActiveMods[nod_only].name:find("Star Revenge 2: Night of Doom") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
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
                play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
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
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		nodswitched = false
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
	if gActiveMods[sr65only].name:find("Star Revenge 6.5") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (sr65hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                sr65hasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		sr65switched = false
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
	if gActiveMods[ta_only].name:find("Twisted Adventures") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (tahasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                tahasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		taswitched = false
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
	if gActiveMods[lm_only].name:find("Luigi's Mansion 64") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (lmhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                lmhasConfirmed = true
				Rules_is_closed_for_intro = true
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		lmswitched = false
		if (lmhasConfirmed == false) then
            set_mario_action(m, ACT_IDLE, 0)
            lmhasConfirmed = true	
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
	if gActiveMods[lm65_only].name:find("Luigi's Mansion 64.5") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then 
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (lm65hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                lm65hasConfirmed = true	
				Rules_is_closed_for_intro = true
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		lm65switched = false
		if (lm65hasConfirmed == false) then
            set_mario_action(m, ACT_IDLE, 0)
            lm65hasConfirmed = true
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
	if gActiveMods[paradiseonly].name:find("SM64 Paradise Island") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (PIhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                PIhasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		PIswitched = false
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
            "Any%: Get Any Stars",
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
            "Warpless Any%: Get Any Stars Warpless",
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
		
            "81 Star: Get 81 Stars",
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
            "90 Star: Get 90 Stars",
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
            "if you want to set up the time stars, type /set time stars to [any|warpless|81|90|bosses]",
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
	if gActiveMods[ZA2only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (ZA2hasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                ZA2hasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		ZA2switched = false
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
	if gActiveMods[pinkstar_only].name:find("pink star") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (hasConfirmedpinkstar == false) then
                set_mario_action(m, ACT_IDLE, 0)
                hasConfirmedpinkstar = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		switchedpinkstar = false
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
	if gActiveMods[hs_only].name:find("SM 64 Hidden Stars") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (HShasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                HShasConfirmed = true	
				Rules_is_closed_for_intro = true
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		HSswitched = false
		if (HShasConfirmed == false) then
            set_mario_action(m, ACT_IDLE, 0)
            HShasConfirmed = true	
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
	if gActiveMods[GJ_only].name:find("The Galactic Journey") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (GJhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                GJhasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		GJswitched = false
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
	if gActiveMods[stor_only].name:find("Star Takeover Redone") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_COURTYARD then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (storhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                storhasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_COURTYARD then
		storswitched = false
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
		
		    "21 Star: Get 21 Stars",
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
	if gActiveMods[FRonly].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS then
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
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (FRhasConfirmed == false) then
                set_mario_action(m, ACT_IDLE, 0)
                FRhasConfirmed = true	
			end
		elseif gNetworkPlayers[0].currLevelNum ~= LEVEL_CASTLE_GROUNDS then
		FRswitched = false
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

function displaycontrols2()
    if (controlsswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    controlsswitched = true
	return true
end

function displayrules2()
    if (switched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switched = true
    return true
end

function displayrules2_starroad()
    if (srswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    srswitched = true
    return true
end

function displayrules2_74()
    if (switched74) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switched74 = true
    return true
end

function displayrules2_74ee()
    if (switched74ee) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switched74ee = true
    return true
end

function displayrules2_74ty()
    if (switched74ty) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switched74ty = true
    return true
end

function displayrules2_ms()
    if (msswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    msswitched = true
    return true
end

function displayrules2_kbr2()
    if (switchedkbr2) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switchedkbr2 = true
    return true
end

function displayrules2_lug()
    if (lugswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    lugswitched = true
    return true
end

function displayrules2_green_stars()
    if (gsswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    gsswitched = true
    return true
end

function displayrules2_sapphire()
    if (switchedsapphire) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switchedsapphire = true
    return true
end

function displayrules2_tpc()
    if (tpcswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    tpcswitched = true
    return true
end

function displayrules2_star_takeover()
    if (stoswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    stoswitched = true
    return true
end

function displayrules2_night_of_doom()
    if (nodswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    nodswitched = true
    return true
end

function displayrules2_sr65()
    if (sr65switched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    sr65switched = true
    return true
end

function displayrules2_ta()
    if (taswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    taswitched = true
    return true
end

function displayrules2_lm64()
    if (lmswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    lmswitched = true
    return true
end

function displayrules2_lm65()
    if (lm65switched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    lm65switched = true
    return true
end

function displayrules2_paradise_island()
    if (PIswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    PIswitched = true
    return true
end

function displayrules2_ztar_attack_2()
    if (ZA2switched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    ZA2switched = true
    return true
end

function displayrules2_pink_star()
    if (switchedpinkstar) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    switchedpinkstar = true
    return true
end

function displayrules2_hidden_stars()
    if (HSswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    HSswitched = true
    return true
end

function displayrules2_galactic_journey()
    if (GJswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    GJswitched = true
    return true
end

function displayrules2_star_takeover_redone()
    if (storswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    storswitched = true
    return true
end

function displayrules2_forest_ruins()
    if (FRswitched) then
        djui_chat_message_create("The window has already been opened. Please close it first.")
        return true
    end
    FRswitched = true
    return true
end

if not SM64Rulesonly and Rules_Display then
hook_chat_command("sm64 rules", "displays the rules of this server", displayrules2)
end

for star_road_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[star_road_rules].name:find("Star Road") or gActiveMods[star_road_rules].name:find("Star Road: The Replica Comet") then
hook_chat_command("star road rules", "displays star road rules of this server", displayrules2_starroad)
	end
end

for sm74_rules in pairs(gActiveMods) do
if Rules_Display and (gActiveMods[sm74_rules].name:find("Super Mario 74") and not gActiveMods[sm74_rules].name:find("Ten Years After")) then
hook_chat_command("sm74 rules", "displays super mario 74 rules of this server", displayrules2_74)
	end
end

for sm74ee_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[sm74ee_rules].name:find("Super Mario 74") and gNetworkPlayers[0].currAreaIndex ~= 1 then
hook_chat_command("sm74ee rules", "displays super mario 74 extreme edition rules of this server", displayrules2_74ee)
	end
end

for sm74ty_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[sm74ty_rules].name:find("Ten Years After") then
hook_chat_command("sm74ty rules", "displays super mario 74 ten years after rules of this server", displayrules2_74ty)
	end
end

for moonshine_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[moonshine_rules].name:find("Super Mario 64 Moonshine") then
hook_chat_command("moonshine rules", "displays super mario 64 moonshine rules of this server", displayrules2_ms)
	end
end

for kbr2_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[kbr2_rules].name:find("King Boo's Revenge 2") then
hook_chat_command("kbr2 rules", "displays king boo's revenge 2 rules of this server", displayrules2_kbr2)
	end
end

for lug_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[lug_rules].name:find("Lug's Delightful Dioramas") or gActiveMods[lug_rules].name:find("Lug's Delightful Dioramas Green Comet") then
hook_chat_command("lug rules", "displays lug's delightful dioramas rules of this server", displayrules2_lug)
	end
end

for green_stars_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[green_stars_rules].name:find("SM64: The Green Stars") then
hook_chat_command("green stars rules", "displays super mario 64 the green stars of this server", displayrules2_green_stars)
	end
end

for sapphire_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[sapphire_rules].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") then
hook_chat_command("sapphire rules", "displays super mario 64 sapphire rules of this server", displayrules2_ms)
	end
end

for phantom_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[phantom_rules].name:find("The Phantom's Call") then
hook_chat_command("phantom rules", "displays phantom's call rules of this server", displayrules2_tpc)
	end
end

for star_takeover_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[star_takeover_rules].name:find("Star Revenge 1: Star Takeover") then
hook_chat_command("star takeover rules", "displays SR1: Star Takeover rules of this server", displayrules2_star_takeover)
	end
end

for night_of_doom_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[night_of_doom_rules].name:find("Star Revenge 2: Night of Doom") then
hook_chat_command("night of doom rules", "displays SR2: Night of Doom rules of this server", displayrules2_night_of_doom)
	end
end

for sr65_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[sr65_rules].name:find("Star Revenge 6.5") then
hook_chat_command("sr6.5 rules", "displays star revenge 6.5 rules of this server", displayrules2_sr65)
	end
end

for ta_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[ta_rules].name:find("Twisted Adventures") then
hook_chat_command("ta rules", "displays sm64 twisted adventures rules of this server", displayrules2_ta)
	end
end

for lm64_rules in pairs(gActiveMods) do
if Rules_Display and (gActiveMods[lm64_rules].name:find("Luigi's Mansion 64") and not gActiveMods[lm64_rules].name:find("Luigi's Mansion 64.5")) then
hook_chat_command("lm64 rules", "displays luigi's mansion 64 rules of this server", displayrules2_lm64)
	end
end

for lm65_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[lm65_rules].name:find("Luigi's Mansion 64.5") then
hook_chat_command("lm64.5 rules", "displays luigi's mansion 64 (easy and super players) rules of this server", displayrules2_lm65)
	end
end

for paradise_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[paradise_rules].name:find("SM64 Paradise Island") then
hook_chat_command("PI rules", "displays sm64 paradise island rules of this server", displayrules2_paradise_island)
	end
end

for ztar_attack_2_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[ztar_attack_2_rules].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
hook_chat_command("ztar attack 2 rules", "displays Ztar Attack 2 rules of this server", displayrules2_ztar_attack_2)
	end
end

for pink_stars_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[pink_stars_rules].name:find("pink star") then
hook_chat_command("pink stars rules", "displays SM64 Peach and the pink star rules of this server", displayrules2_pink_star)
	end
end

for hidden_stars_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[hidden_stars_rules].name:find("SM 64 Hidden Stars") then
hook_chat_command("hidden stars rules", "displays SM 64 Hidden Stars rules of this server", displayrules2_pink_star)
	end
end

for galactic_journey_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[galactic_journey_rules].name:find("The Galactic Journey") then
hook_chat_command("galactic journey rules", "displays Super Mario The Galactic Journey rules of this server", displayrules2_galactic_journey)
	end
end

for star_takeover_redone_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[star_takeover_redone_rules].name:find("Star Takeover Redone") then
hook_chat_command("star takeover redone rules", "displays SR1: Star Takeover Redone rules of this server", displayrules2_star_takeover_redone)
	end
end

for forest_ruins_rules in pairs(gActiveMods) do
if Rules_Display and gActiveMods[forest_ruins_rules].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then
hook_chat_command("forest ruins rules", "displays Luigi and the Forest Ruins rules of this server", displayrules2_forest_ruins)
	end
end