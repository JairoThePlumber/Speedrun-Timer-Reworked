-- name: Luigi & The Violet Stars Runs

Luigi_and_the_Violet_Stars = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#66ff82\\Luigi \\#ffffff\\& \\#ff66fa\\The Violet Stars") then
        Luigi_and_the_Violet_Stars = true
    end
end


if not Luigi_and_the_Violet_Stars then return end

local function violet_stars_position()
if _G.SpeedrunTimerReworked then
_G.STRApi.Set_Custom_Romhack_Position(true, 104, -3772, 5000, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Start Warp", "Grand Star")
	end
end

local function violet_stars_rules()
if _G.SpeedrunTimerReworked then
if Luigi_and_the_Violet_Stars then return end
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 1 stars and then beat bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("66 Star: Get 66 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Star door is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("136 Star: Get 136 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 136 Stars and then beat bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This Romhack breaks the warp option, so it's will be disabled", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, violet_stars_position)
hook_event(HOOK_ON_HUD_RENDER, violet_stars_rules)



