-- name: SM64 Hidden Stars Runs

Hidden_Stars = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("SM 64 Hidden Stars") then
        Hidden_Stars = true
    end
end

if not Hidden_Stars then return end

local function hidden_stars_position()
if _G.SpeedrunTimerReworked then
if Hidden_Stars then
_G.STRApi.Set_Custom_Romhack_Position(true, -1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
		end
	end
end


local function hidden_stars_rules()
if _G.SpeedrunTimerReworked then
if Hidden_Stars then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone is at the End Picture", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("10 Star: Get 10 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 10 stars, Grab the Wing Cap and enter the pipe", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("56 Star: Get 56 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 56 Stars and enter the pipe inside the castle at castle grounds", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("112 Star: Get 112 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 112 Stars and enter the pipe inside the castle at castle grounds", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Clip inside the castle's roof and enter the pipe", 0, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("10 Star: Get 10 Stars", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 10 stars, Grab the Wing Cap and enter the pipe", 0, -137, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -127, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("56 Star: Get 56 Stars", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 56 Stars and enter the pipe inside the castle at castle grounds", 0, -103, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -93, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("112 Star: Get 112 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 112 Stars and enter the pipe inside the castle at castle grounds", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")
		end
_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, hidden_stars_position)
hook_event(HOOK_ON_HUD_RENDER, hidden_stars_rules)

