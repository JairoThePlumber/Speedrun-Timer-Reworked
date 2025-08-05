
-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

Selected_Romhack = "None" -- You can rename It, if you want

for romhack in pairs(gActiveMods) do -- This is not needed if you put it in the romhack folder
	if gActiveMods[romhack].name:find("Test") then
        Selected_Romhack = "Test"
    end
end

if Selected_Romhack == "None" return end -- This is not needed if you put it in the romhack folder

_G.STRApi.add_romhack_name(Selected_Romhack, "70 Stars") -- change "Selected_Romhack" to (Romhack Name), if you put it in the romhack folder

hook_event(HOOK_MARIO_UPDATE, 
function () if _G.STREnabled and Selected_Romhack == "Test" then -- you can remove "and Selected_Romhack == "Test"" if it in the romhack folder
add_single_run("70 Stars", gMarioStates[0].numStars >= 70)
	end 
end) -- This is needed for the Function to work

