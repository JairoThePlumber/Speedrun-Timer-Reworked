-- name: STR Official Custom Anti Cheat
-- incompatible:
-- description: The Official Speedrun Timer Anti Cheat

-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	speedrun_timer_check = true
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

function custom_anti_cheat()
if _G.SpeedrunTimerReworked then
_G.STRApi.custom_anticheat("All Runs", "Popup and Stop Timer", nil, gMarioStates[0].numStars <= 70 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
	end
end

hook_event(HOOK_UPDATE, custom_anti_cheat)

