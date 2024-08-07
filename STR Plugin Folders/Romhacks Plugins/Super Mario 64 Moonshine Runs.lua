-- name: Super Mario 64 Moonshine Runs

local function moonshine_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Super Mario 64 Moonshine") then
_G.STRApi.Set_Custom_Romhack_Position(true, 5, -2794, 2082, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
		end
	end
	end
end

local function moonshine_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Super Mario 64 Moonshine") then
	_G.STRApi.custom_romhack_runs(1, nil, "31 Stars")
	_G.STRApi.custom_romhack_runs(2, nil, "50 Stars")
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function moonshine_interaction(m, o)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Super Mario 64 Moonshine") then
   _G.STRApi.custom_romhack_runs(1, m.numStars >= 31 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
		end
	end
end

local function moonshine_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Super Mario 64 Moonshine") then
   _G.STRApi.custom_romhack_runs(2, m.numStars >= 50)
		end
	end
end


local function moonshine_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Super Mario 64 Moonshine") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(5, -2794, 2082, true)
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("31 Moon: Get 31 Moons", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 31 Moons in this Romhack", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("50 Moon: Get 50 Moons", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 50 Moons in this Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [31|50]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, moonshine_position)
hook_event(HOOK_MARIO_UPDATE, moonshine_runs)
hook_event(HOOK_MARIO_UPDATE, moonshine_mario_update)
hook_event(HOOK_ON_INTERACT, moonshine_interaction)
hook_event(HOOK_ON_HUD_RENDER, moonshine_rules)

