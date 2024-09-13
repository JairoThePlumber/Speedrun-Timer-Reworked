-- name: King Boo's Revenge 2 Runs

King_Boo_Revenge_2 = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("King Boo's Revenge 2") then
        King_Boo_Revenge_2 = true
    end
end

if not King_Boo_Revenge_2 then return end

krb2timer = 21
local function king_boo_revenge_2_position()
if _G.SpeedrunTimerReworked then
if King_Boo_Revenge_2 then
_G.STRApi.Set_Custom_Romhack_Position(true, 7710, 1575, 6682, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end
	end
	end
end

local function krb2_timer_check()
local m = gMarioStates[0]
if _G.SpeedrunTimerReworked then
if King_Boo_Revenge_2 then
if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and m.pos.y > 11000 and m.pos.y < 11600 and m.action == ACT_DISAPPEARED then
	krb2timer = krb2timer - 1
end
	if krb2timer < 2 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS then	
	warp_to_start_level() -- <- this to prevent you softlock on the pipe (despite that was supposed to do that)
	end
	
	if gNetworkPlayers[0].currLevelNum ~= LEVEL_BITS then	
	krb2timer = 21 
		end
	end
	end
end

local function king_boo_revenge_2_interaction()
if _G.SpeedrunTimerReworked then
if King_Boo_Revenge_2 then
	if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and gMarioStates[0].action == ACT_DISAPPEARED then
	if gMarioStates[0].pos.y > 11000 and gMarioStates[0].pos.y < 11600 then
	if krb2timer < 2 then
	   _G.STRApi.set_beated_game(true)
	    end
		end
		end
    end
	end
end

local function king_boo_revenge_2_rules()
if _G.SpeedrunTimerReworked then
if King_Boo_Revenge_2 then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Clip through the doors to enter", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("110 Star: Get 110 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping Through doors is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("182 Star: Get 182 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 182 Stars and then beat the Ice Bully", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This romhack is really tough, so good luck speedrunning", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, king_boo_revenge_2_position)
hook_event(HOOK_ON_HUD_RENDER, king_boo_revenge_2_rules)
hook_event(HOOK_UPDATE, king_boo_revenge_2_interaction)
hook_event(HOOK_UPDATE, krb2_timer_check)

