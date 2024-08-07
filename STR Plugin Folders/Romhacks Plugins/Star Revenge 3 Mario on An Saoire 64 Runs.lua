-- name: Star Revenge 3: Mario on An Saoire 64 Runs

local function star_revenge_3_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Star Revenge 3") and gActiveMods[romhacks].name:find("Mario on An Saoire 64") then
_G.STRApi.Set_Custom_Romhack_Position(true, 9756, -1120, -4534, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
		end
	end
	end
end

local function star_revenge_3_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Star Revenge 3") and gActiveMods[speedruncheck].name:find("Mario on An Saoire 64") then
	_G.STRApi.custom_romhack_runs(1, nil, "1 Star")
	_G.STRApi.custom_romhack_runs(2, nil, "36 Stars")
	_G.STRApi.custom_romhack_runs(3, nil, "65 Stars")
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function star_revenge_3_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Star Revenge 3") and gActiveMods[romhacks_stars_only].name:find("Mario on An Saoire 64") then
   _G.STRApi.custom_romhack_runs(1, m.numStars >= 1 and gNetworkPlayers[0].currLevelNum == LEVEL_BITFS)
   _G.STRApi.custom_romhack_runs(2, m.numStars >= 36 and gNetworkPlayers[0].currLevelNum == LEVEL_BITFS)
   _G.STRApi.custom_romhack_runs(3, m.numStars >= 65)
		end
	end
end

local function star_revenge_3_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Star Revenge 3") and gActiveMods[custom_romhack_rules].name:find("Mario on An Saoire 64") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(9756, -1120, -4534, true)
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 1 stars and then beat Wiggler", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("36 Star: Get 36 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 36 stars and then beat Wiggler", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping to the 35 Door is banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("65 Star: Get 65 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 65 Stars and that's it", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [1|36|65]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, star_revenge_3_position)
hook_event(HOOK_MARIO_UPDATE, star_revenge_3_runs)
hook_event(HOOK_MARIO_UPDATE, star_revenge_3_mario_update)
hook_event(HOOK_ON_HUD_RENDER, star_revenge_3_rules)

