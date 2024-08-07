-- name: Only Up 64 Runs

local function only_up_64_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if gActiveMods[romhacks].name:find("Only Up 64") then
_G.STRApi.Set_Custom_Romhack_Position(false, 5706, -16259, -5594, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Area", "No Lock", "Level Warp", "None")
		end
	end
	end
end

local function only_up_64_interaction()
for only_up_interaction_only in pairs(gActiveMods) do
if gActiveMods[only_up_interaction_only].name:find("Only Up 64") then
   if gMarioStates[0].action == ACT_SPAWN_SPIN_AIRBORNE then
	if gMarioStates[0].pos.y < 1900 and gMarioStates[0].pos.y > -100 then
         _G.STRApi.set_beated_game(true)
		end
		end
	end
    end
end

hook_event(HOOK_UPDATE, only_up_64_interaction)
hook_event(HOOK_MARIO_UPDATE, only_up_64_position)

