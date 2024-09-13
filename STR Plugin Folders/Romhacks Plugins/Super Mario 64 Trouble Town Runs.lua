-- name: Super Mario 64 Trouble Town Runs

Trouble_Town = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Super Mario 64 Trouble Town") then
        Trouble_Town = true
    end
end

if not Trouble_Town then return end

local function trouble_town_position()
if _G.SpeedrunTimerReworked then
if Trouble_Town then
_G.STRApi.Set_Custom_Romhack_Position(true, 9756, -1120, -4534, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
		end
	end
end

local function trouble_town_mario_update(m)
if _G.SpeedrunTimerReworked then
if Trouble_Town then
   if m.numStars >= 30 then
       _G.STRApi.set_beated_game(true)
		end
	end
	end
end


local function trouble_town_rules()
if _G.SpeedrunTimerReworked then
if Trouble_Town then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -170, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 30 Stars in this romhack", 0, -140, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("There's only one run for this romhack", 0, -110, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -80, FONT_NORMAL, 0.7, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop after collecting 30 Stars", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, trouble_town_position)
hook_event(HOOK_MARIO_UPDATE, trouble_town_mario_update)
hook_event(HOOK_ON_HUD_RENDER, trouble_town_rules)

