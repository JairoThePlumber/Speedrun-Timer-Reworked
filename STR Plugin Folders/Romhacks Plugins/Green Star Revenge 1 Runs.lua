-- name: Green Star Revenge 1 Runs

local function green_star_revenge_1_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Green Star Revenge 1") then
_G.STRApi.Set_Custom_Romhack_Position(true, -1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end
		end
	end
	end
end

local function green_star_revenge_1_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("Green Star Revenge 1") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Green Star: Get 0 Green Stars", -70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Skip both 8 and 30 Star doors by BLJs", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", -70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("1 Green Star: Get 1 Green Star", 70, -190, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get one Green Star in DDD after doing Mips Clip", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 70, -170, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("16 Green Star: Get 16 Green Stars", -70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 16 Green Stars and then Beat Bowser", -70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(SBLJs are banned)", -70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("31 Green Star: Get 31 Green Stars", 70, -157, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("30 star door cannot be bypassed", 70, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(SBLJ and MIPS clip are banned)", 70, -137, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("45 Green Star: Get 45 Green Stars", -70, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Skip the 50 star door with BLJs", -70, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(LBLJ, SBLJ and MIPS clip are Banned)", -70, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("50 Green Star: Get 50 Green Stars", 70, -123, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Castle star doors cannot be bypassed.", 70, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(LBLJ, SBLJ and MIPS clip are Banned)", 70, -103, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("70 Green Star: Get 70 Green Stars", -70, -90, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("BLJs and MIPS clip are banned", -70, -80, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("90 Green Star: Get 90 Green Stars", 70, -90, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Only Collect 6 Main Green Stars in Each Main Level", 70, -80, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("133 Green Star: Get 133 Green Stars", 0, -67, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All glitches allowed", 0, -57, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("This Romhack Doesn't have a speedrun category, so I use SM64 Rules Instead", 0, -22, FONT_NORMAL, 0.3, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("70 Green Star: Get 70 Green Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Stars doors can't be skipped", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(MIPS clip, BLJ and Switching Moveset to Classic is banned)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("90 Green Star: Get 90 Green Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 6 Green Stars in Each Main Levels", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any Secret Courses Stars and 100 Coin Stars are Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("133 Green Star: Get 133 Green Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect All 133 Stars and Beat Bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, green_star_revenge_1_position)
hook_event(HOOK_ON_HUD_RENDER, green_star_revenge_1_rules)

