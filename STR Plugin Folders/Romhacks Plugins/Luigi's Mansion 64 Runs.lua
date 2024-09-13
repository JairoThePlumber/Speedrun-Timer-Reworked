-- name: Luigi's Mansion 64 Runs

Luigi_Mansion_64 = false 
Luigi_Mansion_64_5 = false 

for romhack in pairs(gActiveMods) do
	if (gActiveMods[romhack].name:find("Luigi's Mansion 64") and not gActiveMods[romhack].name:find(".5")) then
        Luigi_Mansion_64 = true
	elseif (gActiveMods[romhack].name:find("Luigi's Mansion 64") and gActiveMods[romhack].name:find(".5")) then
		Luigi_Mansion_64_5 = true
    end
end

if not (Luigi_Mansion_64 or Luigi_Mansion_64_5) then return end

local function luigi_mansion_64_position()
if _G.SpeedrunTimerReworked then
if Luigi_Mansion_64 or Luigi_Mansion_64_5 then
_G.STRApi.Set_Custom_Romhack_Position(true, -1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
_G.STRApi.set_custom_color_on_RH_Fonts("Number Colors", "Words Colors", "Single Quote Colors", "Double Quotes Colors")
		end
	end
end

local function luigi_mansion_64_rules()
if _G.SpeedrunTimerReworked then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if Luigi_Mansion_64 then
_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 100 Stars and then beat bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("111 Star: Get 111 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 111 Stars and then beat bowser", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("118 Star: Get 118 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 118 Stars (Including Shiverside Station)", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
end

if Luigi_Mansion_64_5 then
_G.STRApi.Display_Custom_Rules_Text("111 Star: Get 111 Stars", 0, -170, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 111 Stars and then beat bowser", 0, -140, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("There's only one run for this romhack", 0, -110, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -80, FONT_NORMAL, 0.7, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Grand Star", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, luigi_mansion_64_position)
hook_event(HOOK_ON_HUD_RENDER, luigi_mansion_64_rules)

