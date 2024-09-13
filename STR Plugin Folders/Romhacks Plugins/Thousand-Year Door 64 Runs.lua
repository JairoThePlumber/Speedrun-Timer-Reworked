-- name: Thousand Year Door 64 Runs

Thousand_Year_Door_64 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Thousand") and gActiveMods[romhack].name:find("Year Door 64") then
        Thousand_Year_Door_64 = true
    end
end

if not Thousand_Year_Door_64 then return end

local function thousand_year_door_64_position()
if _G.SpeedrunTimerReworked then
if Thousand_Year_Door_64 then
_G.STRApi.Set_Custom_Romhack_Position(true, -1722, 120, -4331, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end
		end
	end
end


local function thousand_year_door_64_rules()
if _G.SpeedrunTimerReworked then
if Thousand_Year_Door_64 then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("BLJ on a Pillar and then enter the warp", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 30 Stars and then enter the warp", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Star door is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 80 Stars and then Enter the Warp", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone is at the End Picture", 0, -22, FONT_NORMAL, 0.3, "#000000")

else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 30 Stars and then enter the warp", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Star door is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("80 Star: Get 80 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 80 Stars and then Enter the Warp", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, thousand_year_door_64_position)
hook_event(HOOK_ON_HUD_RENDER, thousand_year_door_64_rules)

