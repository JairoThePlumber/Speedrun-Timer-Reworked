-- name: Sonic Adventure 64 DX Runs

local function sonic_adventure_64_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Sonic Adventure 64 DX") then
_G.STRApi.Set_Custom_Romhack_Position(true, -20140, 675, -25901, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
		end
	end
	end
end

local function sonic_adventure_64_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Sonic Adventure 64 DX") then
	_G.STRApi.custom_romhack_runs(1, nil, "1 Star")
	_G.STRApi.custom_romhack_runs(2, nil, "3 Stars")
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function sonic_adventure_64_interaction(m, o, interactType)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Sonic Adventure 64 DX") then
   _G.STRApi.custom_romhack_runs(1, gNetworkPlayers[0].currLevelNum == LEVEL_BOB and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 0 << 24)
		end
	end
end

local function sonic_adventure_64_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Sonic Adventure 64 DX") then
   _G.STRApi.custom_romhack_runs(2, m.numStars >= 3)
		end
	end
end


local function sonic_adventure_64_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Sonic Adventure 64 DX") then
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

_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 Star", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Defeat King Whomp and Grab the Star", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("3 Star: Get 3 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 3 Stars in this Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [1|3]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, sonic_adventure_64_position)
hook_event(HOOK_MARIO_UPDATE, sonic_adventure_64_runs)
hook_event(HOOK_MARIO_UPDATE, sonic_adventure_64_mario_update)
hook_event(HOOK_ON_INTERACT, sonic_adventure_64_interaction)
hook_event(HOOK_ON_HUD_RENDER, sonic_adventure_64_rules)

