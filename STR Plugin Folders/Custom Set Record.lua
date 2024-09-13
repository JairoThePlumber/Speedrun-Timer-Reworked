-- name: STR Official Custom Set Record
-- incompatible:
-- description: The Official Speedrun Timer Custom Sounds Plugins

-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	speedrun_timer_check = true
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

function custom_set_record()
if _G.SpeedrunTimerReworked then
_G.STRApi.set_time_record(0, 10, 0, 0)
	end
end

hook_event(HOOK_UPDATE, custom_set_record)

