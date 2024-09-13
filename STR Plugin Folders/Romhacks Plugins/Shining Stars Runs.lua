-- name: Shining Stars Runs

Shining_Stars_1 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#ffffff\\Shining Stars") and not gActiveMods[romhack].name:find("2 Mirror Madness") then
        Shining_Stars_1 = true
    end
end

if not Shining_Stars_1 then return end

local function shining_stars_1_position()
if _G.SpeedrunTimerReworked then
if Shining_Stars_1 then
_G.STRApi.Set_Custom_Romhack_Position(true, -469, -1776, 7135, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "Lock", "Level Warp", "Grand Star")
		end
	end
end

local function shining_stars_1_rules()
if _G.SpeedrunTimerReworked then
if Shining_Stars_1 then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 0 stars and then beat bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("121 Star: Get 121 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 121 Stars and then beat bowser", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the Star Doors are Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 151 Stars and then beat bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("121 Star: Get 121 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 121 Stars and then beat bowser", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Star door is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 151 Stars and then beat bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")
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
hook_event(HOOK_MARIO_UPDATE, shining_stars_1_position)
hook_event(HOOK_ON_HUD_RENDER, shining_stars_1_rules)

