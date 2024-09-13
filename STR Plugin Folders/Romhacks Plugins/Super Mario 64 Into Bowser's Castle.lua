-- name: Super Mario 64 Into Bowser's Castle Runs

Into_Bowser_Castle = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Super Mario 64 Into Bowser's Castle") then
        Into_Bowser_Castle = true
    end
end

if not Into_Bowser_Castle then return end

local function into_bowsers_castle_position()
if _G.SpeedrunTimerReworked then
if Into_Bowser_Castle then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, -0, 0, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
		end
	end
end

local function into_bowsers_castle_rules()
if _G.SpeedrunTimerReworked then
if Into_Bowser_Castle then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 30 stars and then beat Bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("70 Star: Get 70 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 70 stars and then beat Bowser", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 70 Star Door is banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("120 Star: Get 120 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 120 Stars and then beat Bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, into_bowsers_castle_position)
hook_event(HOOK_ON_HUD_RENDER, into_bowsers_castle_rules)

