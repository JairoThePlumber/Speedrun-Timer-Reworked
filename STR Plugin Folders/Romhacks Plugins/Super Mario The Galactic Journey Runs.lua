-- name: The Galactic Journey Runs

The_Galactic_Journey = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("The Galactic Journey") then
        The_Galactic_Journey = true
    end
end

if not The_Galactic_Journey then return end

local function galactic_journey_position()
if _G.SpeedrunTimerReworked then
if The_Galactic_Journey then
_G.STRApi.Set_Custom_Romhack_Position(true, -343, 944, 1154, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
		end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function galactic_journey_interaction(m, o, interactType)
if _G.SpeedrunTimerReworked then
if The_Galactic_Journey then
	if (interactType == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_TOTWC) then
	   	_G.STRApi.set_beated_game(true)
		end
	end
	end
end


local function galactic_journey_rules()
if _G.SpeedrunTimerReworked then
if The_Galactic_Journey then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("12 Star: Get 12 Stars", 0, -190, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Do alot of BLJ to skip the doors", 0, -180, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -170, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("24 Star: Get 24 Stars", 0, -157, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("12 star door cannot be bypassed", 0, -147, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -137, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("44 Star: Get 44 Stars", 0, -123, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("12 and 42 star doors cannot be bypassed.", 0, -113, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(BLJs are allowed but only at the 87 star door, and Mips Clip is Banned)", 0, -102, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("87 Star: Get 87 Stars", 0, -90, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped (so BLJs are Banned)", 0, -80, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("102 Star: Get 102 Stars", 0, -67, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -57, FONT_NORMAL, 0.25, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("44 Star: Get 44 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("12 and 42 star doors cannot be bypassed.", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Wall Jumps over the 87 Star Door is Allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("87 Star: Get 87 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Jumping over the 87 Star Door is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("102 Star: Get 102 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 102 Stars and then beat King Bob-omb", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
end
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, galactic_journey_position)
hook_event(HOOK_ON_INTERACT, galactic_journey_interaction)
hook_event(HOOK_ON_HUD_RENDER, galactic_journey_rules)

