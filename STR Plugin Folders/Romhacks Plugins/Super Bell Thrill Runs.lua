-- name: Super Bell Thrill Runs

Super_Bell_Thrill = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Super Bell Thrill") then
        Super_Bell_Thrill = true
    end
end

if not Super_Bell_Thrill then return end

local function super_bell_thrill_position()
if _G.SpeedrunTimerReworked then
if Super_Bell_Thrill then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, 100, 0, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Disable", "Custom Runs")
_G.STRApi.set_teams(false)
		end
	end
end

-- These are the Custom Runs but this is Optional tho, but it's you're choice
-- Here's are the Api For Making Run Commands (Optional)
-- This will check if you're making a run command
-- _G.STRApi.set_run_check(true/false) <- This checks if you have a run commend
local function super_bell_thrill_runs()
if _G.SpeedrunTimerReworked then
if Super_Bell_Thrill then
	_G.STRApi.custom_romhack_runs(1, "1 Star")
	_G.STRApi.custom_romhack_runs(2, "7 Stars")
		end
    end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function super_bell_thrill_mario_update(m)
if _G.SpeedrunTimerReworked then
if Super_Bell_Thrill then
	 _G.STRApi.custom_romhack_runs("7 Stars", m.numStars >= 7)
		end
	end
end

local function super_bell_thrill_interaction(m, o, interactType)
if _G.SpeedrunTimerReworked then
if Super_Bell_Thrill then
	 _G.STRApi.custom_romhack_runs("1 Star", gNetworkPlayers[0].currLevelNum == LEVEL_BOB and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 0 << 24)
		end
	end
end

local function super_bell_thrill_rules()
if _G.SpeedrunTimerReworked then
if Super_Bell_Thrill then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end
-- You can move the text here or where OMM Rebirth is, so I don't have to make a plugin for Only OMM Rebirth
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 Star", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text('Get The "First" Star in this Romhack', 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("7 Star: Get 7 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get All Stars in this Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [1|7]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, super_bell_thrill_position)
hook_event(HOOK_ON_HUD_RENDER, super_bell_thrill_rules)
hook_event(HOOK_ON_MODS_LOADED, super_bell_thrill_runs)
hook_event(HOOK_MARIO_UPDATE, super_bell_thrill_mario_update)
hook_event(HOOK_ON_INTERACT, super_bell_thrill_interaction)

