-- name: Beat Block Beatdown Runs

Beat_Block_Beatdown = false

for romhack in pairs(gActiveMods) do
	if gActiveMods[romhack].name:find("\\#ff38cd\\Beat \\#ff38cd\\Block \\#ff38cd\\Beatdown") then
        Beat_Block_Beatdown = true
    end
end

if not Beat_Block_Beatdown then return end

function beat_block_beatdown_position(m)
if _G.SpeedrunTimerReworked then
if Beat_Block_Beatdown then
_G.STRApi.Set_Custom_Romhack_Position(true, 0, 0, 0, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Disable", "None")
		end
	end
end

function beat_block_beatdown_mario_update(m)
if _G.SpeedrunTimerReworked then
if Beat_Block_Beatdown then 
	if m.action == ACT_SPAWN_SPIN_AIRBORNE and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 1 then
	 _G.STRApi.set_beated_game(true)
		end
	end
	end
end

function beat_block_beatdown_rules()
if _G.SpeedrunTimerReworked then
if Beat_Block_Beatdown then
-- This display the borderline
_G.STRApi.Display_Custom_Rules_Romhack(190, 120, FONT_MENU, 320, 240, "#ffffff")
-- This is a example if you want to add OMM Rebirth rules
if not OmmEnabled then
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
else
_G.STRApi.Display_Custom_Rules_Text("Hello, Welcome to the OMM Speedrun server!", 0, -223, FONT_NORMAL, 0.4, "#000000")
end
_G.STRApi.Display_Custom_Rules_Text("Rules:", 0, -203, FONT_NORMAL, 0.4, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Any%: Grab Any Stars", 0, -180, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text('Beat the Game with any amount of stars', 0, -155, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("5 Star: Get 5 Stars", 0, -130, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Get All 5 Stars in this Romhack", 0, -105, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("(All Glitches are Allowed for both)", 0, -80, FONT_NORMAL, 0.6, "#000000")
_G.STRApi.Display_Custom_Rules_Text("These are the rules of what to do in a speedrun", 0, -40, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Breaking the rules will result the run as a invalid", 0, -31, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Here's are the Runs: [Any|5]", 0, -22, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("Press A to proceed,", 0, -13, FONT_NORMAL, 0.3, "#000000")
_G.STRApi.Display_Custom_Rules_Text("OK", 0, -5, FONT_MENU, 0.3, "#ff0000")
		end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_MARIO_UPDATE, beat_block_beatdown_position)
hook_event(HOOK_MARIO_UPDATE, beat_block_beatdown_mario_update)
hook_event(HOOK_ON_HUD_RENDER, beat_block_beatdown_rules)

