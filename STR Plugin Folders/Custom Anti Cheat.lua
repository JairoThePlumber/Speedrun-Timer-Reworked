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
_G.STRApi.custom_anticheat(1, "Popup and Stop Timer", gMarioStates[0].numStars <= 70 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
_G.STRApi.custom_anticheat(2, "Popup", gMarioStates[0].numStars <= 30 and gNetworkPlayers[0].currLevelNum == LEVEL_DDD)
_G.STRApi.custom_anticheat(3, "Stop Timer", gMarioStates[0].forwardVel < -100)
_G.STRApi.custom_anticheat(4, "Popup and Stop Timer", gMarioStates[0].numStars <= 8 and gNetworkPlayers[0].currLevelNum == LEVEL_BITDW)
	end
end

hook_event(HOOK_UPDATE, custom_anti_cheat)


function str_anti_cheats(m)
if _G.SpeedrunTimerReworked then
	_G.STRApi.add_anti_cheat(1, "Going To Bowser Early")
	_G.STRApi.add_anti_cheat(2, "Skipping To DDD Early (Popup Warning)")
	_G.STRApi.add_anti_cheat(3, "No BLJ Allowed (Timer Stop)")
	_G.STRApi.add_anti_cheat(4, "No LBLJ")
    end
end

hook_event(HOOK_ON_MODS_LOADED, str_anti_cheats)
