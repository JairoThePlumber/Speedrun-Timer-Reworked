
-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	speedrun_timer_check = true
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

Selected_Romhack = false -- <- You can Rename It, if you want

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Test") then
        Selected_Romhack = true
    end
end

if not Selected_Romhack return end

function custom_romhack_position()
if _G.SpeedrunTimerReworked then
if Selected_Romhack == true then
	_G.STRApi.Enable_Custom_Rules()
	_G.STRApi.custom_plugin_slots(1, "Enabled", "Stop Timer: Stars", 70, 0, "None", "Star Limit")
	_G.STRApi.custom_plugin_slots(2, "Enabled", "Stop Timer: Levels", 28, 1, 0, "Level Location")
	_G.STRApi.custom_plugin_slots(3, "Enabled", "Stop Timer: Actions", 7, 0, "Only Actions")
	_G.STRApi.custom_plugin_slots(4, "Enabled", "Stop Timer: Positions", 0, 0, 0, 0, 0, 0, "X Position Area")
		end
	end
end

function custom_speedrun_check()
if _G.SpeedrunTimerReworked then
if Selected_Romhack == true then
	_G.STRApi.add_custom_run(1, "Stars Function")
	_G.STRApi.add_custom_run(2, "Levels Function")
	_G.STRApi.add_custom_run(3, "Actions Function")
	_G.STRApi.add_custom_run(4, "Position Function")
		end
    end
end

function display_custom_rules()
if _G.SpeedrunTimerReworked then
if Selected_Romhack == true then
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff") -- <- Default Box Size
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end
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

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_UPDATE, custom_romhack_position)
hook_event(HOOK_ON_HUD_RENDER, display_custom_rules)
hook_event(HOOK_ON_MODS_LOADED, custom_speedrun_check)

