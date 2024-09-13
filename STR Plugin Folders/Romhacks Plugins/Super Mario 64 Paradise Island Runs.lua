-- name: SM64 Paradise Island Runs

Paradise_Island = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("SM64 Paradise Island") then
        Paradise_Island = true
    end
end

if not Paradise_Island then return end

local function paradise_island_position()
if _G.SpeedrunTimerReworked then
if Paradise_Island then
_G.STRApi.Set_Custom_Romhack_Position(true, 3255, 190, -4806, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
		end
	end
end

local function paradise_island_rules()
if _G.SpeedrunTimerReworked then
if Paradise_Island then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 30 Stars and don't skip the 30 Star door", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("50 Star: Get 50 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 50 Stars and then Beat Bowser", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, paradise_island_position)
hook_event(HOOK_ON_HUD_RENDER, paradise_island_rules)

