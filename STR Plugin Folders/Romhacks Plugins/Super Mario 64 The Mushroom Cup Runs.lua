-- name: The Mushroom Cup Runs

The_Mushroom_Cup = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#ff2b1c\\The \\#636363\\Mushroom \\#ffb742\\Cup") then
        The_Mushroom_Cup = true
    end
end

if not The_Mushroom_Cup then return end

local function mushroom_cup_position()
if _G.SpeedrunTimerReworked then
if The_Mushroom_Cup then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, 28, 0, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
		end
	end
end

local function mushroom_cup_rules()
if _G.SpeedrunTimerReworked then
if The_Mushroom_Cup then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This Romhack has two different endings but you can only choose one", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("16 Star: Get 16 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 16 Stars and Beat Bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 100 and get the Shrine Ending", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(You need to collect the Shrine Star after getting 99 Stars)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("130 Star: Get 130 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 130 Stars and get the Shrine Ending", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Climb up with 0 Stars and Defeat Bowser", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 star", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab the Red Coin Star and enter the Shrine", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping Out of Bounds is Banned)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("16 Star: Get 16 Stars", 0, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 16 Stars and Beat Bowser", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 0, -120, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 100 and get the Shrine Ending", 0, -110, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(You need to collect the Shrine Star after getting 99 Stars)", 0, -100, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("130 Star: Get 130 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 130 Stars and get the Shrine Ending", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, mushroom_cup_position)
hook_event(HOOK_ON_HUD_RENDER, mushroom_cup_rules)

