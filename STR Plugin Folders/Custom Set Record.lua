-- name: STR Official Custom Set Record
-- incompatible:
-- description: The Official Speedrun Timer Custom Sounds Plugins

function custom_set_record()
if _G.SpeedrunTimerReworked then
_G.STRApi.set_time_record(0, 10, 0, 0)
	end
end

hook_event(HOOK_UPDATE, custom_set_record)

