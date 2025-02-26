-- name: Super Mario 64 Runs

if Romhack_Is_Enabled then return end

Romhack_Is_Enabled = false

for romhacks in pairs(gActiveMods) do
    if (gActiveMods[romhacks].incompatible ~= nil and gActiveMods[romhacks].incompatible:find("romhack")) then
        Romhack_Is_Enabled = true
		djui_popup_create("\\#ff0000\\This Plugin is only for SM64, it's doesn't work for Romhacks", 2)
		break
    end
end

-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	speedrun_timer_check = true
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

-- These are the Custom Runs but this is Optional tho, but it's you're choice
-- These are examples, you can change them whatever you like

-- Here's are the Api For Making Run Commands (Optional)
-- This will check if you're making a run command
function custom_runs(m)
if _G.SpeedrunTimerReworked and Romhack_Is_Enabled == false then
	if not OmmEnabled then
	_G.STRApi.add_custom_slot(1, "0 Stars")
	_G.STRApi.add_custom_slot(2, "1 Star")
	_G.STRApi.add_custom_slot(3, "16 Stars")
	_G.STRApi.add_custom_slot(4, "31 Stars")
	_G.STRApi.add_custom_slot(5, "45 Stars")
	_G.STRApi.add_custom_slot(6, "50 Stars")
	_G.STRApi.add_custom_slot(7, "70 Stars")
	_G.STRApi.add_custom_slot(8, "90 Stars")
	_G.STRApi.add_custom_slot(9, "120 Stars")
	else
	_G.STRApi.add_custom_slot(1, "16 Stars")
	_G.STRApi.add_custom_slot(2, "70 Stars")
	_G.STRApi.add_custom_slot(3, "90 Stars")
	_G.STRApi.add_custom_slot(4, "120 Stars")
	end
    end
end

function update_plugin(m)
if _G.SpeedrunTimerReworked and Romhack_Is_Enabled == false then
	if not OmmEnabled then
	_G.STRApi.custom_plugin_slots(1, "Enabled", "Stop Timer: Stars", 0, 0, "Grand Star", "Behavior Types")
	_G.STRApi.custom_plugin_slots(2, "Enabled", "Stop Timer: Stars", 1, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(3, "Enabled", "Stop Timer: Stars", 16, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(4, "Enabled", "Stop Timer: Stars", 31, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(5, "Enabled", "Stop Timer: Stars", 45, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(6, "Enabled", "Stop Timer: Stars", 50, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(7, "Enabled", "Stop Timer: Stars", 70, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(8, "Enabled", "Stop Timer: Stars", 90, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(9, "Enabled", "Stop Timer: Stars", 120, 0, "Grand Star", "Star Limit + Behavior Types")
	else
	_G.STRApi.custom_plugin_slots(1, "Enabled", "Stop Timer: Stars", 16, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(2, "Enabled", "Stop Timer: Stars", 70, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(3, "Enabled", "Stop Timer: Stars", 90, 0, "Grand Star", "Star Limit + Behavior Types")
	_G.STRApi.custom_plugin_slots(4, "Enabled", "Stop Timer: Stars", 120, 0, "Grand Star", "Star Limit + Behavior Types")
	end
    end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_ON_MODS_LOADED, custom_runs)
hook_event(HOOK_UPDATE, update_plugin)

