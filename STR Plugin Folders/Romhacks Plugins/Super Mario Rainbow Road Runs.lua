-- name: Super Mario Rainbow Road Runs

Rainbow_Road = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Super Mario Rainbow Road") then
        Rainbow_Road = true
    end
end

if not Rainbow_Road then return end

local function rainbow_road_position()
if _G.SpeedrunTimerReworked then
if Rainbow_Road then
_G.STRApi.Set_Custom_Romhack_Position(true, -243, -768, 4858, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
		end
	end
end

local function rainbow_road_runs()
if _G.SpeedrunTimerReworked then
if Rainbow_Road then
	_G.STRApi.custom_romhack_runs(1, "54 Stars")
	_G.STRApi.custom_romhack_runs(2, "60 Stars")
		end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function rainbow_road_interaction(m, o)
if _G.SpeedrunTimerReworked then
if Rainbow_Road then
   _G.STRApi.custom_romhack_runs(1, m.numStars >= 54 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_SA)
		end
	end
end

local function rainbow_road_mario_update(m)
if _G.SpeedrunTimerReworked then
if Rainbow_Road then
   _G.STRApi.custom_romhack_runs(2, m.numStars >= 60)
		end
	end
end


local function rainbow_road_rules()
if _G.SpeedrunTimerReworked then
if Rainbow_Road then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("54 Star: Get 54 Stars", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 54 Stars in this Romhack", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("60 Star: Get 60 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 60 Stars in this Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [54|60]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, rainbow_road_position)
hook_event(HOOK_ON_MODS_LOADED, rainbow_road_runs)
hook_event(HOOK_MARIO_UPDATE, rainbow_road_mario_update)
hook_event(HOOK_ON_INTERACT, rainbow_road_interaction)
hook_event(HOOK_ON_HUD_RENDER, rainbow_road_rules)

