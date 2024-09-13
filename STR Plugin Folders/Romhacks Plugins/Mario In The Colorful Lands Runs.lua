-- name: Mario In The Colorful Lands Runs

Mario_In_The_Colorful_Lands = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#fc2819\\Mario \\#3ffc19\\In The \\#19fcea\\Colorful Lands") then
        Mario_In_The_Colorful_Lands = true
    end
end

if not Mario_In_The_Colorful_Lands then return end

function colorful_lands_position(m)
if _G.SpeedrunTimerReworked then
if Mario_In_The_Colorful_Lands then
_G.STRApi.Set_Custom_Romhack_Position(true, 5046, -1, -10718, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
		end
	end
end


function colorful_lands_rules()
if _G.SpeedrunTimerReworked then
if Mario_In_The_Colorful_Lands then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("50 Star: Get 50 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 50 Stars and then Beat Bowser", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the Door is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("93 Star: Get 93 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 93 Stars and then Beat Bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone is at the End Picture", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, colorful_lands_position)
hook_event(HOOK_ON_HUD_RENDER, colorful_lands_rules)
