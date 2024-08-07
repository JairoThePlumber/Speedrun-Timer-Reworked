-- name: STR Official Custom Sounds
-- incompatible:
-- description: The Official Speedrun Timer Custom Sounds Plugins

-- Here's are the Api For setting the custom sounds
-- You need this to avoid the numbers from going up, since idk how to make it stop without hook event
text_display = false

function custom_sounds(m)
if _G.SpeedrunTimerReworked then
if text_display == false then
_G.STRApi.set_custom_fanfare_name("MKDD", "Mario Kart: Double Dash!!")
_G.STRApi.set_custom_countdown_name("MKDD", "Mario Kart: Double Dash!!")
_G.STRApi.set_custom_go_name("MKDD", "Mario Kart: Double Dash!!")
text_display = true
end
_G.STRApi.set_custom_fanfare("MKDD", "MKDD Fanfare.ogg")
_G.STRApi.set_custom_countdown("MKDD", "MKDD Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MKDD", "MKDD GO.ogg")
	end
end

hook_event(HOOK_MARIO_UPDATE, custom_sounds)
