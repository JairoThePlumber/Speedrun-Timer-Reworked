-- name: Eternal Realm Runs

Eternal_Realm = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Eternal Realm") then
        Eternal_Realm = true
    end
end

if not Eternal_Realm then return end

local function eternal_realm_position(m)
if _G.SpeedrunTimerReworked then
if Eternal_Realm then
_G.STRApi.Set_Custom_Romhack_Position(true, -784, -1741, 2590, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
		end
	end
end
	
local function eternal_realm_mario_update(m)
if _G.SpeedrunTimerReworked then
if Eternal_Realm then 
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then
	  _G.STRApi.set_beated_game(true)
			end
		end
	end
end


local function eternal_realm_rules()
if _G.SpeedrunTimerReworked then
if Eternal_Realm then
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
_G.STRApi.Display_Custom_Rules_Text("Clip Through the Door and grab the key", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Make Sure you get WC and VC before doing so)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("25 Star: Get 25 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 25 and grab the key", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping the 25 Star Door is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("47 Star: Get 47 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 47 Stars and grab the key", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")


_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("The Timer Stops once someone touch the Key", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, eternal_realm_position)
hook_event(HOOK_MARIO_UPDATE, eternal_realm_mario_update)
hook_event(HOOK_ON_HUD_RENDER, eternal_realm_rules)

