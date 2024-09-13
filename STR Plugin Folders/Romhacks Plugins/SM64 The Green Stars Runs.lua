-- name: SM64: The Green Stars Runs

The_Green_Stars = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("SM64: The Green Stars") then
        The_Green_Stars = true
    end
end

if not The_Green_Stars then return end

local function green_stars_position()
if _G.SpeedrunTimerReworked then
if The_Green_Stars then
_G.STRApi.Set_Custom_Romhack_Position(true, -1500, -509, 2102, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
		end
	end
end

local function green_stars_rules()
if _G.SpeedrunTimerReworked then
if The_Green_Stars then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(BLJs or Clipping is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("131 Star: Get 131 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 131 Stars and then beat Bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This romhack is a decent one, so you not gotta waste too much time on it", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, green_stars_position)
hook_event(HOOK_ON_HUD_RENDER, green_stars_rules)

