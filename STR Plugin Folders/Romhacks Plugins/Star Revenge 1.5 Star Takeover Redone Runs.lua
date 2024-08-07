-- name: Star Takeover Redone Runs

local function star_takeover_1_5_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Star Takeover Redone") then
_G.STRApi.Set_Custom_Romhack_Position(true, -3782, -2537, -2770, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
		end
	end
	end
end

local function star_takeover_1_5_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Star Takeover Redone") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(-3782, -2537, -2770, true)
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("66 Star: Get 66 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 66 Stars and then Beat Bowser", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(BLJs is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("125 Star: Get 125 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 125 Stars and then Beat Bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")


_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, star_takeover_1_5_position)
hook_event(HOOK_ON_HUD_RENDER, star_takeover_1_5_rules)

