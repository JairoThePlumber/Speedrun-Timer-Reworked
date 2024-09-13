-- name: Only Up 64 Runs

Only_Up_64 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Only Up 64") then
        Only_Up_64 = true
    end
end

if not Only_Up_64 then return end

local function only_up_64_position()
if _G.SpeedrunTimerReworked then
if Only_Up_64 then
_G.STRApi.Set_Custom_Romhack_Position(false, 5706, -16259, -5594, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Area", "No Lock", "Level Warp", "None")
		end
	end
end

local function only_up_64_interaction()
if _G.SpeedrunTimerReworked then
if Only_Up_64 then
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

