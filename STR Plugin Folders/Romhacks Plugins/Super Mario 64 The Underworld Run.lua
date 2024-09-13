-- name: The Underworld Runs

The_Underworld = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("The Underworld") then
        The_Underworld = true
    end
end

if not The_Underworld then return end

local function underworld_position()
if _G.SpeedrunTimerReworked then
if The_Underworld then 
_G.STRApi.Set_Custom_Romhack_Position(false, -1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "Lock", "Disable", "Grand Star")
_G.STRApi.set_teams(false)
		end
	end
end

hook_event(HOOK_MARIO_UPDATE, underworld_position)

