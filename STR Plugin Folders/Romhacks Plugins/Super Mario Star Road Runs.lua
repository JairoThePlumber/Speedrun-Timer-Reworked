-- name: Star Road Runs

local function star_road_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Star Road") or gActiveMods[romhacks].name:find("Star Road: The Replica Comet") then
_G.STRApi.Set_Custom_Romhack_Position(true, -6797, 1831, 2710, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
		end
	end
	end
end

local function star_road_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Star Road") or gActiveMods[speedruncheck].name:find("Star Road: The Replica Comet") then
	_G.STRApi.custom_romhack_runs(1, nil, "Any%")
	_G.STRApi.custom_romhack_runs(2, nil, "20 Stars")
	_G.STRApi.custom_romhack_runs(3, nil, "65 Stars")
	_G.STRApi.custom_romhack_runs(4, nil, "80 Stars")
	_G.STRApi.custom_romhack_runs(5, nil, "130 Stars")
	if gActiveMods[speedruncheck].name:find("Star Road: The Replica Comet") then
	_G.STRApi.custom_romhack_runs(6, nil, "150 Stars")
	end
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function star_road_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Star Road") or gActiveMods[romhacks_stars_only].name:find("Star Road: The Replica Comet") then
   _G.STRApi.custom_romhack_runs(1, gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
   _G.STRApi.custom_romhack_runs(2, m.numStars >= 20 and save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)
   _G.STRApi.custom_romhack_runs(3, m.numStars >= 65 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
   _G.STRApi.custom_romhack_runs(4,m.numStars >= 80 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
   _G.STRApi.custom_romhack_runs(5, m.numStars >= 130)
   if gActiveMods[romhacks_stars_only].name:find("Star Road: The Replica Comet") then
   _G.STRApi.custom_romhack_runs(6, m.numStars >= 150)
			end
		end
	end
end

local function star_road_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Star Road") or gActiveMods[custom_romhack_rules].name:find("Star Road: The Replica Comet") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
if gActiveMods[custom_romhack_rules].name:find("Star Road") and not gActiveMods[custom_romhack_rules].name:find("The Replica Comet") then
_G.STRApi.Display_Custom_Rules_Text("Any%: Grab Any stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Beat the Game with any amount of stars", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("20 Star: Grab 20 stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Defeat the Plants and Grab the Key", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping Out of Bounds is Banned)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("65 Star: Get 65 Stars", 0, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Take the Cannon and clip through star door", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Stars", 0, -120, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can't passed the 80 Star door", 0, -110, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(BLJs are Banned)", 0, -100, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("130 Star: Get 130 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Make sure get All Stars and All Replica Stars", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [Any|20|65|80|130]", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

if gActiveMods[custom_romhack_rules].name:find("Star Road") and gActiveMods[custom_romhack_rules].name:find("The Replica Comet") then
_G.STRApi.Display_Custom_Rules_Text("Any%: Grab Any stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Beat the Game with any amount of stars", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("20 Star: Grab 20 stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Defeat the Plants and Grab the Key", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping Out of Bounds is Banned)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("65 Star: Get 65 Stars", 70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Take the Cannon and clip through star door", 70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Stars", -70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can't passed the 80 Star door", -70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(BLJs are Banned)", -70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("130 Star: Get 130 Stars", 0, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Make sure get All Stars and 10 Replica Stars", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("150 Star: Get 150 Stars", 0, -85, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This is a Exclusive Run only for this romhack", 0, -75, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Make sure get All Stars and All Replica Stars", 0, -65, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -55, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [Any|20|65|80|130|150]", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, star_road_position)
hook_event(HOOK_MARIO_UPDATE, star_road_runs)
hook_event(HOOK_MARIO_UPDATE, star_road_mario_update)
hook_event(HOOK_ON_HUD_RENDER, star_road_rules)

