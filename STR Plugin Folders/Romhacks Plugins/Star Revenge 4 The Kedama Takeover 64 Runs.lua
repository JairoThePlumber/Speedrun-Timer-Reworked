-- name: Star Revenge 4: The Kedama Takeover 64 Runs

Star_Revenge_4 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Star Revenge 4") and gActiveMods[romhack].name:find("The Kedama Takeover 64") then
        Star_Revenge_4 = true
    end
end

if not Star_Revenge_4 then return end

local function star_revenge_4_position()
if _G.SpeedrunTimerReworked then
if Star_Revenge_4 then 
_G.STRApi.Set_Custom_Romhack_Position(true, -6171, 1579, 3906, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
		end
	end
end

local function star_revenge_4_rules()
if _G.SpeedrunTimerReworked then
if Star_Revenge_4 then 
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [1|36|65]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("35 Star: Get 35 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 35 stars and then beat Bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 35 Door is Banned)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("97 Star: Get 97 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 97 Stars and then enter the pipe", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Getting The Cap Levels Stars are Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 100 Stars and then Enter the pipe", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Just Beat Bowser with Zero Stars", 0, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("35 Star: Get 35 Stars", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 35 stars and then beat Bowser", 0, -137, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 35 Door is Banned)", 0, -127, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("97 Star: Get 97 Stars", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get 97 Stars and then enter the pipe", 0, -103, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Getting The Cap Levels Stars are Banned)", 0, -93, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("100 Star: Get 100 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 100 Stars and then Enter the pipe", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, star_revenge_4_position)
hook_event(HOOK_ON_HUD_RENDER, star_revenge_4_rules)

