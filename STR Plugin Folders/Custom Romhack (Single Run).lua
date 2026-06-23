
-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis plugin doesn't work without STR Mod.\n\nI suggest you go turn on STR before trying it", 5)
	return 
end

Selected_Romhack = "None" -- You can rename it, if you want
-- This is only needed if you didn't want to put the file in the folder
for romhack in pairs(gActiveMods) do if gActiveMods[romhack].name:find("Test") then Selected_Romhack = "Test" end end
if Selected_Romhack == "None" return end

-- These are examples on the single slot
_G.STRApi.add_romhack_name(Selected_Romhack, "70 Stars")
hook_event(HOOK_MARIO_UPDATE, 
function () if _G.STREnabled and Selected_Romhack == "Test" then 
_G.STRApi.add_single_run("70 Stars", gMarioStates[0].numStars >= 70)
	end 
end) -- You will need this hook for it to work

