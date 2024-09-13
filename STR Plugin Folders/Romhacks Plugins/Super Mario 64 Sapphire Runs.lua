-- name: SM64 Sapphire Runs

SM64_Sapphire = false 
SM64_Sapphire_Green_Comet = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("SM64 \\#0f52ba\\Sapphire") then
        SM64_Sapphire = true
	elseif gActiveMods[romhack].name:find("SM64 \\#0f52ba\\Sapphire \\#00FF00\\Green Comet\\dcdcdc\\") then
		SM64_Sapphire_Green_Comet = true
    end
end

if not (SM64_Sapphire or SM64_Sapphire_Green_Comet) then return end

local function sapphire_position()
if _G.SpeedrunTimerReworked then
if (SM64_Sapphire or SM64_Sapphire_Green_Comet) then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, -0, 650, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
_G.STRApi.set_custom_color_on_RH_Fonts("Number No Colors", "Words Colors", "Single Quote No Colors", "Double Quotes No Colors")
		end
	end
end

local function sapphire_rules()
if _G.SpeedrunTimerReworked then
if (SM64_Sapphire or SM64_Sapphire_Green_Comet) then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if SM64_Sapphire then
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Skip the 30 Star door", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 30 Stars From This Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")

elseif SM64_Sapphire_Green_Comet then
_G.STRApi.Display_Custom_Rules_Text("30 Star: Get 30 Stars", 0, -170, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 30 Stars from this Romhack", 0, -140, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("There's only one run for this romhack", 0, -110, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -80, FONT_NORMAL, 0.7, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone is at the End Picture", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, sapphire_position)
hook_event(HOOK_ON_HUD_RENDER, sapphire_rules)

