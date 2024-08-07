-- name: Royal Legacy Runs

local function royal_legacy_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Royal Legacy") then
_G.STRApi.Set_Custom_Romhack_Position(true, 1050, -0, -500, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end
		end
	end
	end
end

local function royal_legacy_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Royal Legacy") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(-426, 1243, -161, true)
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("BLJ To the Star Door and Beat Bowser", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping are banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 30 Stars and then Beat Bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -170, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 30 Stars and then Beat Bowser", 0, -140, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("There's only one run for this romhack", 0, -110, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -80, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, royal_legacy_position)
hook_event(HOOK_ON_HUD_RENDER, royal_legacy_rules)

