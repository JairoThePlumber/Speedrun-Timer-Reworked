
-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

Selected_Romhack = false -- <- You can Rename It, if you want

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Test") then
        Selected_Romhack = true
    end
end

if not Selected_Romhack return end

_G.STRApi.add_run_slot(1, "Mario Update Star")
_G.STRApi.add_run_slot(2, "Interaction Star")
_G.STRApi.add_run_slot(3, "Update Star")

function str_run_mario_update(m)
	if _G.STREnabled and Selected_Romhack == true then
	 _G.STRApi.add_plugin_slot(1, m.numStars == 70)
	end
end

function str_run_interaction(m, o, type)
	if _G.STREnabled and Selected_Romhack == true then
	 _G.STRApi.add_plugin_slot(2, get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	end
end

function str_run_update()
	if _G.STREnabled and Selected_Romhack == true then
	 _G.STRApi.add_plugin_slot(3, gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_UPDATE, str_run_update)
hook_event(HOOK_MARIO_UPDATE, str_run_mario_update)
hook_event(HOOK_ON_INTERACT, str_run_interaction)

