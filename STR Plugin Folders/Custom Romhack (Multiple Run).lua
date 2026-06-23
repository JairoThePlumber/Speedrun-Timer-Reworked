
-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis plugin doesn't work without STR Mod.\n\nI suggest you go turn on STR before trying it", 5)
	return 
end

Selected_Romhack = "None" -- You can rename it, if you want
-- This is only needed if you didn't want to put the file in the folder
for romhack in pairs(gActiveMods) do if gActiveMods[romhack].name:find("Test") then Selected_Romhack = "Test" end end
if Selected_Romhack == "None" return end

-- These are examples on the slots
_G.STRApi.add_run_slot(Selected_Romhack, 1, "Mario Update Star")
_G.STRApi.add_run_slot(Selected_Romhack, 2, "Interaction Star")
_G.STRApi.add_run_slot(Selected_Romhack, 3, "Update Star")

function str_run_mario_update(m) if _G.STREnabled and Selected_Romhack == "Test" then _G.STRApi.add_plugin_slot(1, m.numStars == 70) end end
function str_run_interaction(m, o, type) if _G.STREnabled and Selected_Romhack == "Test" then _G.STRApi.add_plugin_slot(2, get_id_from_behavior(o.behavior) == id_bhvGrandStar) end end
function str_run_update() if _G.STREnabled and Selected_Romhack == "Test" then _G.STRApi.add_plugin_slot(3, gNetworkPlayers[0].currLevelNum == LEVEL_ENDING) end end

-- You will need these hook for it to work
hook_event(HOOK_UPDATE, str_run_update)
hook_event(HOOK_MARIO_UPDATE, str_run_mario_update)
hook_event(HOOK_ON_INTERACT, str_run_interaction)

