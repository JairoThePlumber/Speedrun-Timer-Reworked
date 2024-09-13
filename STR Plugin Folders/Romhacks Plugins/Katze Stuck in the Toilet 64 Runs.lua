-- name: Katze Stuck in the Toilet 64 Runs

Katze_Stuck_in_the_Toilet = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Katze Stuck in the Toilet 64") then
        Katze_Stuck_in_the_Toilet = true
    end
end


if not Katze_Stuck_in_the_Toilet then return end

local function katze_64_position()
if _G.SpeedrunTimerReworked then
if Katze_Stuck_in_the_Toilet then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, 2000, 0, LEVEL_CASTLE_GROUNDS, 2, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
		end
	end
end

local function katze_64_rules()
if _G.SpeedrunTimerReworked then
if Katze_Stuck_in_the_Toilet then 
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone is at the End Picture", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("0 Burger: Get 0 Burgers", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Clip Through the Doors and then enter the warp", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("30 Burger: Get 30 Burgers", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 30 burgers and then enter the warp", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Burger door is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("40 Burger: Get 40 Burgers", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 40 burgers and then enter the warp", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("30 Burger: Get 30 Burgers", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 30 burgers and then enter the warp", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 30 Burger door is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("40 Burger: Get 40 Burgers", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 40 burgers and then enter the warp", 0, -90, FONT_NORMAL, 0.5, "#000000")
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
hook_event(HOOK_MARIO_UPDATE, katze_64_position)
hook_event(HOOK_ON_HUD_RENDER, katze_64_rules)

