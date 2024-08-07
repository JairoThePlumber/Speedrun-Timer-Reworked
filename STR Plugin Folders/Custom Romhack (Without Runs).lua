
function custom_romhack_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Super Bell Thrill") then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, 100, 0, LEVEL_CASTLE_COURTYARD, 1, 0, false, false, false, true)
_G.STRApi.set_teams(false)
		end
	end
	end
end

hook_event(HOOK_UPDATE, custom_romhack_position)

function display_custom_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Super Bell Thrill") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack_Function(0, 100, 0, true)
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
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_ON_HUD_RENDER, display_custom_rules)

