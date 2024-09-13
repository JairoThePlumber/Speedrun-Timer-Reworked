-- name: Twisted Adventures Runs

Twisted_Adventures = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Twisted Adventures") then
        Twisted_Adventures = true
    end
end

if not Twisted_Adventures then return end

local function twisted_adventures_position()
if _G.SpeedrunTimerReworked then
if Twisted_Adventures then
_G.STRApi.Set_Custom_Romhack_Position(true, -5097, -157, 6235, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
		end
	end
end

local function twisted_adventures_rules()
if _G.SpeedrunTimerReworked then
if Twisted_Adventures then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("75 Star: Get 75 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 75 Stars and then beat bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("115 Star: Get 115 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 115 Stars and then beat bowser", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Skipping Doors is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab 151 Stars and then beat bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("This romhack is pretty difficult so good luck, especially for bowser", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, twisted_adventures_position)
hook_event(HOOK_ON_HUD_RENDER, twisted_adventures_rules)

