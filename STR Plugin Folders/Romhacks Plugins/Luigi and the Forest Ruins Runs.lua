-- name: Luigi and the Forest Ruins Runs

Luigi_and_the_Forest_Ruins = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then
        Luigi_and_the_Forest_Ruins = true
    end
end

if Luigi_and_the_Forest_Ruins then return end

local function forest_ruins_position()
if _G.SpeedrunTimerReworked then
if Luigi_and_the_Forest_Ruins then
_G.STRApi.Set_Custom_Romhack_Position(true, -6400, 371, 392, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
_G.STRApi.set_custom_color_on_RH_Fonts("Number Colors", "Words No Colors", "Single Quote No Colors", "Double Quotes No Colors")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
		end
	end
end

local function forest_ruins_rules()
if _G.SpeedrunTimerReworked then
if Luigi_and_the_Forest_Ruins then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("21 Star: Get 21 Stars", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Collect 21 stars and then beat bowser", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("40 Star: Get 40 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab all 40 Stars and then beat bowser", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stops once someone touching the star in the courtyard", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, forest_ruins_position)
hook_event(HOOK_ON_HUD_RENDER, forest_ruins_rules)

