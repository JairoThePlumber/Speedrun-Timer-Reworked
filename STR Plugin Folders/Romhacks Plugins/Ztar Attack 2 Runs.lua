-- name: Ztar Attack 2 Runs

local function ztar_attack_2_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
_G.STRApi.Set_Custom_Romhack_Position(true, -1226, -1823, 515, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
_G.STRApi.set_custom_lives(true, 10)
		end
	end
	end
end

local function ztar_attack_2_runs(m)
if _G.SpeedrunTimerReworked then
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
	_G.STRApi.custom_romhack_runs(1, nil, "Any%")
	_G.STRApi.custom_romhack_runs(2, nil, "Warpless Any%")
	_G.STRApi.custom_romhack_runs(3, nil, "81 Time Stars")
	_G.STRApi.custom_romhack_runs(4, nil, "91 Time Stars")
	_G.STRApi.custom_romhack_runs(5, nil, "All Bosses")
		end
    end
	end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
local function ztar_attack_2_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
   _G.STRApi.custom_romhack_runs(1, save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0)
   _G.STRApi.custom_romhack_runs(2, (save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0))
   _G.STRApi.custom_romhack_runs(3, m.numStars >= 81 and save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0)
   _G.STRApi.custom_romhack_runs(4, m.numStars >= 91 and save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0)
		end
	end
end

local function ztar_attack_2_interaction(m, o, interactType)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
   _G.STRApi.custom_romhack_runs(5, ((save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0) 
	and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 2 << 24))
		end
	end
end

local function ztar_attack_2_rules()
if _G.SpeedrunTimerReworked then
for custom_romhack_rules in pairs(gActiveMods) do
if gActiveMods[custom_romhack_rules].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
_G.STRApi.Display_Custom_Rules_Romhack_Function(-1226, -1823, 515, true)
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Any%: Get Any Time Stars", 0, -190, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Beat Bowser as quickly as possible", 0, -180, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all skips allowed)", 0, -170, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("Warpless Any%: Get Any Time Stars Warpless", 0, -157, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Beat Bowser while going through the game's 5 Main Worlds", 0, -147, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any form of World skips and Warps are banned)", 0, -137, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("81 Time Star: Get 81 Time Stars", 0, -123, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect all the Time Stars between World 1 and 5 and Defeat Bowser.", 0, -113, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any form of World skips and Warps are banned)", 0, -102, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("91 Time Star: Get 91 Time Stars", 0, -90, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all Skips and Warps are allowed)", 0, -80, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("All Bosses: Defeat every boss", 0, -67, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Any and all skips allowed)", 0, -57, FONT_NORMAL, 0.25, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [Any|Warpless|81|91|Bosses]", 0, -22, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.25, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.25, "#ff0000")
		end
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, ztar_attack_2_position)
hook_event(HOOK_MARIO_UPDATE, ztar_attack_2_runs)
hook_event(HOOK_MARIO_UPDATE, ztar_attack_2_mario_update)
hook_event(HOOK_ON_INTERACT, ztar_attack_2_interaction)
hook_event(HOOK_ON_HUD_RENDER, ztar_attack_2_rules)

