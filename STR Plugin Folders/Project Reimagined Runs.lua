
Project_Reimagined = false

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Project Reimagined") then
        Project_Reimagined = true
    end
end

if not Project_Reimagined then return end

local function project_reimagined_position()
if _G.SpeedrunTimerReworked then
if Project_Reimagined then
_G.STRApi.Set_Custom_Romhack_Position(true, 983, 141, 508, LEVEL_CASTLE_GROUNDS, 5, 0, "Force Area", "No Lock", "Disable", "Custom Runs")
		end
	end
end

function project_reimagined_runs()
if _G.SpeedrunTimerReworked then
if Project_Reimagined then
	if OmmEnabled then
	_G.STRApi.add_custom_run(1, "0 Stars")
	_G.STRApi.add_custom_run(2, "12 Stars")
	_G.STRApi.add_custom_run(3, "20 Stars")
	_G.STRApi.add_custom_run(4, "100 Stars")
	_G.STRApi.add_custom_run(5, "156 Stars")
	_G.STRApi.add_custom_run(6, "170 Stars")
	_G.STRApi.add_custom_run(7, "210 Stars")
	else
	_G.STRApi.add_custom_run(1, "12 Stars")
	_G.STRApi.add_custom_run(2, "20 Stars")
	_G.STRApi.add_custom_run(3, "100 Stars")
	_G.STRApi.add_custom_run(4, "156 Stars")
	_G.STRApi.add_custom_run(5, "170 Stars")
	_G.STRApi.add_custom_run(6, "210 Stars")
			end
		end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function project_reimagined_mario_update(m)
if _G.SpeedrunTimerReworked then
if Project_Reimagined then
	if OmmEnabled then
	_G.STRApi.custom_romhack_runs(1, gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(2, m.numStars >= 12 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(3, m.numStars >= 20 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(4, m.numStars >= 100 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(5, m.numStars >= 156 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(6, m.numStars >= 170)
	_G.STRApi.custom_romhack_runs(7, m.numStars >= 210 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gNetworkPlayers[0].currAreaIndex == 2)
	else
	_G.STRApi.custom_romhack_runs(1, m.numStars >= 12 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(2, m.numStars >= 20 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(3, m.numStars >= 100 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(4, m.numStars >= 156 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 4)
	_G.STRApi.custom_romhack_runs(5, m.numStars >= 170)
	_G.STRApi.custom_romhack_runs(6, m.numStars >= 210 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gNetworkPlayers[0].currAreaIndex == 2)
		end
		end
	end
end

local function project_reimagined_rules()
if _G.SpeedrunTimerReworked then
if Project_Reimagined then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
if OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("0 Star: Grab 0 Stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Defeat Bowser while collecting 0 Power Stars.", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(This is only for Multiplayer/OMM Rebirth)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("12 Star: Grab 12 stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 12 Power Stars to defeat Bowser.", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(The Wing Cap is required to reach Bowser)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("20 Star: Grab 20 stars", -70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 20 Power Stars to Defeat Bowser", -70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(LBLJ are Banned)", -70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 100 Power Stars and defeat Bowser.", 70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all Barrier skips are banned.)", 70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("156 Star: Get 156 Stars", -70, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 156 Power Stars and defeat Bowser.", -70, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all Barrier skips are also banned.)", -70, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("170 Star: Get 170 Stars", 70, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect every Power Star in the game.", 70, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 70, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("210 Star: Get 210 Stars", 0, -90, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect every Power Star AND Amber Star in the game and defeat Bowser 4", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can go to the Level Select to find Amber Stars Easier", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [0|12|20|100|156|170|210]", 0, -22, FONT_NORMAL, 0.3, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("12 Star: Grab 12 stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 12 Power Stars to defeat Bowser.", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(The Wing Cap is required to reach Bowser)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("20 Star: Grab 20 stars", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 20 Power Stars to Defeat Bowser", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(LBLJ are Banned)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", -70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 100 Power Stars and defeat Bowser.", -70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all Barrier skips are banned.)", -70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("156 Star: Get 156 Stars", 70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 156 Power Stars and defeat Bowser.", 70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all Barrier skips are also banned.)", 70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("170 Star: Get 170 Stars", 0, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect every Power Star in the game.", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("210 Star: Get 210 Stars", 0, -90, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect every Power Star AND Amber Star in the game and defeat Bowser 4", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("You can go to the Level Select to find Amber Stars Easier", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [12|20|100|156|170|210]", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, project_reimagined_position)
hook_event(HOOK_ON_HUD_RENDER, project_reimagined_runs)
hook_event(HOOK_MARIO_UPDATE, project_reimagined_mario_update)
hook_event(HOOK_ON_HUD_RENDER, project_reimagined_rules)

