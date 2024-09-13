-- name: Star Revenge 6.5 Runs

Star_Revenge_6_5 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Star Revenge 6") and gActiveMods[romhack].name:find(".5") then
        Star_Revenge_6_5 = true
    end
end

if not Star_Revenge_6_5 then return end

local function star_revenge_6_5_position()
if _G.SpeedrunTimerReworked then
if Star_Revenge_6_5 then
_G.STRApi.Set_Custom_Romhack_Position(true, -14341, -552, -9602, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
		end
	end
end

local function star_revenge_6_5_interaction(m, o, interactType)
if _G.SpeedrunTimerReworked then
if Star_Revenge_6_5 then
if (interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 5 << 24 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE) then
       _G.STRApi.set_beated_game(true)
		end
	end
	end
end


local function star_revenge_6_5_rules()
if _G.SpeedrunTimerReworked then
if Star_Revenge_6_5 then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("1 Star: Get 1 Star", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Do alot of BLJ to skip the star doors", 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("70 Star: Get 70 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Enter the 69 Door to get the last Star", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The timer will stop once someone touch the Castle star", 0, -22, FONT_NORMAL, 0.3, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("70 Star: Get 70 Stars", 0, -170, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Enter the 69 Door to get the last Star", 0, -140, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("There's only one run for this romhack", 0, -110, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -80, FONT_NORMAL, 0.7, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")
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
hook_event(HOOK_MARIO_UPDATE, star_revenge_6_5_position)
hook_event(HOOK_ON_INTERACT, star_revenge_6_5_interaction)
hook_event(HOOK_ON_HUD_RENDER, star_revenge_6_5_rules)

