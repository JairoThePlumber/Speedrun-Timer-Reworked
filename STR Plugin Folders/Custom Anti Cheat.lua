-- name: STR Official Custom Anti Cheat
-- incompatible:
-- description: The Official Speedrun Timer Anti Cheat

function custom_anti_cheat()
if _G.SpeedrunTimerReworked then
_G.STRApi.custom_anticheat("All Runs", "Popup and Stop Timer", nil, m.numStars <= 70 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
	end
end

hook_event(HOOK_UPDATE, custom_anti_cheat)

