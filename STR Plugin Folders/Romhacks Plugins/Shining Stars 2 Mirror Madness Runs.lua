-- name: Shining Stars: 2 Mirror Madness Runs

local function shining_stars_2_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("\\#ffffff\\Shining Stars") and gActiveMods[romhacks].name:find("2 Mirror Madness") then
_G.STRApi.Set_Custom_Romhack_Position(true, -4323, -1170, -4375, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
		end
	end
	end
end

local function shining_stars_2_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("\\#ffffff\\Shining Stars") and gActiveMods[custom_romhack_rules].name:find("2 Mirror Madness") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(-4323, -1170, -4375, true)
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This Romhack has two different ways to finish the run but you can only choose one", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Star: Grab 0 Stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 0 stars and then beat bowser", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("10 Star: Grab 10 stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 10 stars and then battle bowser", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip the 10 Star Door)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("15 Star: Get 15 Stars", 70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 15 stars and then battle bowser", 70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip 10 and 15 Star Doors)", 70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("69 Star: Get 69 Stars", -70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 69 stars and then battle bowser", -70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip the Star Doors)", -70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("90 Star: Get 90 Stars", 0, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can't passed the 80 Star door", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping all star door is banned)", 0, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("122 Star: Get 122 Stars", 0, -85, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab all 122 stars and then battle bowser", 0, -75, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You Can use a star display if you don't know where the stars are", 0, -65, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -55, FONT_NORMAL, 0.3, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("10 Star: Grab 10 stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 10 stars and then battle bowser", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip the 10 Star Door)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("15 Star: Get 15 Stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 15 stars and then battle bowser", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip 10 and 15 Star Doors)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("69 Star: Get 69 Stars", 0, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 69 stars and then battle bowser", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Don't Skip the Star Doors)", 0, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("90 Star: Get 90 Stars", 0, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can't passed the 80 Star door", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping all star door is banned)", 0, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("122 Star: Get 122 Stars", 0, -85, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab all 122 stars and then battle bowser", 0, -75, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can use a star display if you don't know where the stars are", 0, -65, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -55, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, shining_stars_2_position)
hook_event(HOOK_ON_HUD_RENDER, shining_stars_2_rules)

