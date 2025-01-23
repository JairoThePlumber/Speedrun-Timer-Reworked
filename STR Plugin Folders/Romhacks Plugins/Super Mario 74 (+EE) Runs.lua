-- name: Super Mario 74 Runs

Super_Mario_74 = false 
Super_Mario_74_Extreme_Edition = false 

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("Super Mario 74") and gActiveMods[romhack].name:find("(+EE)") and gNetworkPlayers[0].currAreaIndex == 1 then
        Super_Mario_74 = true
	elseif gActiveMods[romhack].name:find("Super Mario 74") and gActiveMods[romhack].name:find("(+EE)") and gNetworkPlayers[0].currAreaIndex == 2 then
		Super_Mario_74_Extreme_Edition = true
    end
end

if not (Super_Mario_74 or Super_Mario_74_Extreme_Edition) then return end

local function sm74_position()
if _G.SpeedrunTimerReworked then
for romhacks in pairs(gActiveMods) do
if Super_Mario_74 then
_G.STRApi.Set_Custom_Romhack_Position(true, -6558, -578, 6464, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
_G.STRApi.set_backup_slot(false)

elseif Super_Mario_74_Extreme_Edition then
_G.STRApi.Set_Custom_Romhack_Position(true, 5481, -922, 6320, LEVEL_CASTLE_COURTYARD, 2, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
_G.STRApi.set_backup_slot(true)
		end
	end
	end
end


local function sm74_rules()
if _G.SpeedrunTimerReworked then
if (Super_Mario_74 or Super_Mario_74_Extreme_Edition) then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules

_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")

if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
if Super_Mario_74 then
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Do alot of BLJ to skip the star doors", -70, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("10 Star: Get 10 Stars", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 10 stars and then beat bowser", 70, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 70, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("50 Star: Get 50 Stars", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 50 stars and then beat bowser", 0, -137, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -127, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("110 Star: Get 110 Stars", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -103, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping is Banned)", 0, -93, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 151 Stars and then beat bowser", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("If you want to try SM74EE, you can do that by the /swap command", 0, -22, FONT_NORMAL, 0.3, "#000000")
elseif Super_Mario_74_Extreme_Edition then
_G.STRApi.Display_Custom_Rules_Text("0 Star: Get 0 Stars", -70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Do alot of BLJ to skip the star doors", -70, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", -70, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("10 Star: Get 10 Stars", 70, -180, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 10 stars and then beat bowser", 70, -170, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 70, -160, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("50 Star: Get 50 Stars", 0, -147, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 50 stars and then beat bowser", 0, -137, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -127, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("125 Star: Get 125 Stars", 0, -113, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -103, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping is Banned)", 0, -93, FONT_NORMAL, 0.3, "#000000")

_G.STRApi.Display_Custom_Rules_Text("157 Star: Get 157 Stars", 0, -80, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 157 Stars and then beat bowser", 0, -70, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("If you want to go back to SM74, you can do that by the /swap command to go back", 0, -22, FONT_NORMAL, 0.3, "#000000")
end

elseif OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These rules are for OMM Rebirth, To avoid confusion of what run to do", 0, -22, FONT_NORMAL, 0.3, "#000000")
if Super_Mario_74 then

_G.STRApi.Display_Custom_Rules_Text("50 Star: Get 50 Stars", 0, -190, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get at least 50 stars and then beat bowser", 0, -175, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -160, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("110 Star: Get 110 Stars", 0, -140, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -125, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping is Banned)", 0, -110, FONT_NORMAL, 0.4, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -90, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 151 Stars and then beat bowser", 0, -75, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -60, FONT_NORMAL, 0.4, "#000000")
elseif Super_Mario_74_Extreme_Edition then
_G.STRApi.Display_Custom_Rules_Text("110 Star: Get 110 Stars", 0, -180, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("All Star Doors can't be skipped", 0, -160, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(Clipping is Banned)", 0, -140, FONT_NORMAL, 0.5, "#000000")

_G.STRApi.Display_Custom_Rules_Text("151 Star: Get 151 Stars", 0, -110, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Grab All 151 Stars and then beat bowser", 0, -90, FONT_NORMAL, 0.5, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are allowed)", 0, -70, FONT_NORMAL, 0.5, "#000000")
	end
end

_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, sm74_position)
hook_event(HOOK_ON_HUD_RENDER, sm74_rules)

