-- name: Lug's Delightful Dioramas Runs

local function delightful_dioramas_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhacks].name:find("Green Comet") then
_G.STRApi.Set_Custom_Romhack_Position(true, -200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- Lug's Delightful Dioramas Green Comet
elseif gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and gActiveMods[romhacks].name:find("Green Comet") then
_G.STRApi.Set_Custom_Romhack_Position(true, -200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
		end
	end
	end
end

local function delightful_dioramas_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Lug's Delightful Dioramas") and not gActiveMods[speedruncheck].name:find("Green Comet") then
	_G.STRApi.custom_romhack_runs(1, nil, "64 Stars")
	_G.STRApi.custom_romhack_runs(2, nil, "74 Stars")
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it

local function delightful_dioramas_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhacks_stars_only].name:find("Green Comet") then
	_G.STRApi.custom_romhack_runs(1, m.numStars >= 64 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
	_G.STRApi.custom_romhack_runs(2, m.numStars >= 74)
		end
	end
end


local function delightful_dioramas_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Lug's Delightful Dioramas") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text( "64 Star: Get 64 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("LDD: Collect 64 Stars in this Romhack", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text( "74 Star: Get 74 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("LDD: Collect All 74 Stars in this Romhack", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are also allowed)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Any%: Get Any Green Stars", 0, -95, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Green Comet: Collect any amount of stars you can get.", 0, -83, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Green Stars", 0, -69, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Green Comet: Collect All 80 Stars in this romhack", 0, -57, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("For LDD: The Runs: [64|74], For LDDGG: stops on the chair in sweet delight", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, delightful_dioramas_position)
hook_event(HOOK_MARIO_UPDATE, delightful_dioramas_runs)
hook_event(HOOK_MARIO_UPDATE, delightful_dioramas_mario_update)
hook_event(HOOK_ON_HUD_RENDER, delightful_dioramas_rules)

