-- name: Lug's Delightful Dioramas Runs

Lug_Delightful_Dioramas = false 
Lug_Delightful_Dioramas_Green_Comet = false 

for romhack in pairs(gActiveMods) do
	if (gActiveMods[romhack].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhack].name:find("Green Comet")) then
        Lug_Delightful_Dioramas = true
	elseif (gActiveMods[romhack].name:find("Lug's Delightful Dioramas") and gActiveMods[romhack].name:find("Green Comet")) then
		Lug_Delightful_Dioramas_Green_Comet = true
    end
end

if not (Lug_Delightful_Dioramas or Lug_Delightful_Dioramas_Green_Comet) then return end

local function delightful_dioramas_position()
if _G.SpeedrunTimerReworked then
if Lug_Delightful_Dioramas then
_G.STRApi.Set_Custom_Romhack_Position(true, -200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- Lug's Delightful Dioramas Green Comet
elseif Lug_Delightful_Dioramas_Green_Comet then
_G.STRApi.Set_Custom_Romhack_Position(true, -200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
		end
	end
end

local function delightful_dioramas_runs()
if _G.SpeedrunTimerReworked then
	if Lug_Delightful_Dioramas then
	_G.STRApi.custom_romhack_runs(1, "64 Stars")
	_G.STRApi.custom_romhack_runs(2, "74 Stars")
		end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it

local function delightful_dioramas_mario_update(m)
if _G.SpeedrunTimerReworked then
	if Lug_Delightful_Dioramas then 
	_G.STRApi.custom_romhack_runs("64 Stars", m.numStars >= 64 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
	_G.STRApi.custom_romhack_runs("74 Stars", m.numStars >= 74)
		end
	end
end


local function delightful_dioramas_rules()
if _G.SpeedrunTimerReworked then
if (Lug_Delightful_Dioramas or Lug_Delightful_Dioramas_Green_Comet) then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("64 Star: Get 64 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("LDD: Collect 64 Stars in this Romhack", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("74 Star: Get 74 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
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

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, delightful_dioramas_position)
hook_event(HOOK_ON_MODS_LOADED, delightful_dioramas_runs)
hook_event(HOOK_MARIO_UPDATE, delightful_dioramas_mario_update)
hook_event(HOOK_ON_HUD_RENDER, delightful_dioramas_rules)

