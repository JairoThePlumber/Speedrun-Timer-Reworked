if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Romhack Runs
gGlobalSyncTable.StarRoadRuns = 0
gGlobalSyncTable.MoonShineRuns = 0
gGlobalSyncTable.DelightfulDioramasRuns = 0
gGlobalSyncTable.ZtarAttack2Runs = 0
gGlobalSyncTable.StarRevenge3Runs = 0
gGlobalSyncTable.RainbowRoadRuns = 0
gGlobalSyncTable.SonicAdventure64Runs = 0
Romhack_Runs_Check = 0
krb2timer = 21

-- Main Functions
gGlobalSyncTable.RunsSlots = 0
gGlobalSyncTable.GrandStar = false
gGlobalSyncTable.EndPicture = true
gGlobalSyncTable.CompatibleRomhacks = false
gGlobalSyncTable.RomhacksWarning = false
gGlobalSyncTable.TeamsCheck = false
DisableCommands = true
Romhack_Runs_Option = false
gGlobalSyncTable.SM74EEsavefile = false

-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
function on_romhack_interact(m, o, interactType)
for romhacksgrandstar in pairs(gActiveMods) do
	if gActiveMods[romhacksgrandstar].incompatible ~= nil and gActiveMods[romhacksgrandstar].incompatible:find("romhack") then
	if gGlobalSyncTable.GrandStar then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar and gGlobalSyncTable.RunsSlots == 0 then
        gGlobalSyncTable.beatedGame = true
		end
		end
	end
    end
end

-- stops when someone enter the end picture
function on_romhack_interact_end_picture()
for romhacksendpicture in pairs(gActiveMods) do
	if gActiveMods[romhacksendpicture].incompatible ~= nil and gActiveMods[romhacksendpicture].incompatible:find("romhack") then
	if gGlobalSyncTable.EndPicture then
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gGlobalSyncTable.RunsSlots == 0 then
        gGlobalSyncTable.beatedGame = true
		end
		end
	end
    end
end

-- this checks if one of the teams finish the run
function on_teams_update(m)
	if gGlobalSyncTable.SpeedrunTeams then
	if gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#f90303\\Red Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
	elseif gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#3903ff\\Blue Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
		end
	end
end

-- This should fixed the teams command for SM74EE
function save_files_no_teams_sm74ee(m)
if not gGlobalSyncTable.SpeedrunTeams then
for sm74_savefile in pairs(gActiveMods) do
if gActiveMods[sm74_savefile].name:find("Super Mario 74") and gActiveMods[sm74_savefile].name:find("(+EE)") and gNetworkPlayers[0].currAreaIndex ~= 1 then
	gGlobalSyncTable.SM74EEsavefile = true
	gGlobalSyncTable.NormalSaveFile = false
	if gGlobalSyncTable.SM74EEsavefile then
	save_file_set_using_backup_slot(true)
	m.numStars = save_file_get_total_star_count(get_current_save_file_num() - 1, COURSE_MIN - 1, COURSE_MAX - 1)
	else
	save_file_set_using_backup_slot(false)
		end
		end
	end
	end
end

-- This is for romhack that isn't compatible, so this will set the positions to the start position
function unsupported_romhacks(m)
for unsupportedromhacks in pairs(gActiveMods) do
	if gActiveMods[unsupportedromhacks].incompatible ~= nil and gActiveMods[unsupportedromhacks].incompatible:find("romhack") then
	if gGlobalSyncTable.CompatibleRomhacks == false and not gGlobalSyncTable.RomhacksWarning then
	gGlobalSyncTable.RomhacksWarning = true
	djui_popup_create("\\#ff0000\\\nWarning:\nThere's some Romhacks that won't stop the timer or will stop, but isn't complete.\nBe aware of those and report them if it happens!", 5)
	end
	if (gGlobalSyncTable.CompatibleRomhacks == false) then
	switched = false
	if gNetworkPlayers[0].currAreaIndex == 1 then
	Set_Warp_For_Incompatible_Romhacks(1, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 2 then
	Set_Warp_For_Incompatible_Romhacks(2, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 3 then
	Set_Warp_For_Incompatible_Romhacks(3, 0)
	elseif gNetworkPlayers[0].currAreaIndex == 4 then
	Set_Warp_For_Incompatible_Romhacks(4, 0)
				end
			end
		end
	end
end

-- This makes sure that you have to put a run before starting the speedrun
function on_romhack_speedrun_check(m)
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Star Road") or gActiveMods[speedruncheck].name:find("Star Road: The Replica Comet") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "Any%"
	RunsSlotsName2 = "20 Stars"
	RunsSlotsName3 = "65 Stars"
	RunsSlotsName4 = "80 Stars"
	RunsSlotsName5 = "130 Stars"
	
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.StarRoadRuns = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.StarRoadRuns = 2
	elseif gGlobalSyncTable.RunsSlots == 3 then
	gGlobalSyncTable.StarRoadRuns = 3
	elseif gGlobalSyncTable.RunsSlots == 4 then
	gGlobalSyncTable.StarRoadRuns = 4
	elseif gGlobalSyncTable.RunsSlots == 5 then
	gGlobalSyncTable.StarRoadRuns = 5
	end
	
	if gActiveMods[speedruncheck].name:find("Star Road: The Replica Comet") then
	RunsSlotsName6 = "150 Star"
	if gGlobalSyncTable.RunsSlots == 6 then
	gGlobalSyncTable.StarRoadRuns = 6
	end
	end
	
	elseif gGlobalSyncTable.StarRoadRuns >= 1 then
	Romhack_Runs_Check = 1
	end
	
	if gActiveMods[speedruncheck].name:find("Super Mario 64 Moonshine") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "31 Stars"
	RunsSlotsName2 = "50 Stars"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.MoonShineRuns = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.MoonShineRuns = 2
	end
	elseif gGlobalSyncTable.MoonShineRuns >= 1 then
	Romhack_Runs_Check = 2
	end
	
	if (gActiveMods[speedruncheck].name:find("Lug's Delightful Dioramas") and not gActiveMods[speedruncheck].name:find("Green Comet")) then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "64 Stars"
	RunsSlotsName2 = "74 Stars"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.DelightfulDioramasRuns = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.DelightfulDioramasRuns = 2
	end
	elseif gGlobalSyncTable.DelightfulDioramasRuns >= 1 then
	Romhack_Runs_Check = 3
	end
	
	if gActiveMods[speedruncheck].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "Any%"
	RunsSlotsName2 = "Warpless Any%"
	RunsSlotsName3 = "81 Time Stars"
	RunsSlotsName4 = "91 Time Stars"
	RunsSlotsName5 = "All Bosses"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.ZtarAttack2Runs = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.ZtarAttack2Runs = 2
	elseif gGlobalSyncTable.RunsSlots == 3 then
	gGlobalSyncTable.ZtarAttack2Runs = 3
	elseif gGlobalSyncTable.RunsSlots == 4 then
	gGlobalSyncTable.ZtarAttack2Runs = 4
	elseif gGlobalSyncTable.RunsSlots == 5 then
	gGlobalSyncTable.ZtarAttack2Runs = 5
	end
	elseif gGlobalSyncTable.ZtarAttack2Runs >= 1 then
	Romhack_Runs_Check = 4
	end
	
	if gActiveMods[speedruncheck].name:find("Star Revenge 3") and gActiveMods[speedruncheck].name:find("Mario on An Saoire 64") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "1 Star"
	RunsSlotsName2 = "36 Stars"
	RunsSlotsName3 = "65 Stars"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.StarRevenge3Runs = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.StarRevenge3Runs = 2
	elseif gGlobalSyncTable.RunsSlots == 3 then
	gGlobalSyncTable.StarRevenge3Runs = 3
	end
	elseif gGlobalSyncTable.StarRevenge3Runs >= 1 then
	Romhack_Runs_Check = 5
	end
	
	if gActiveMods[speedruncheck].name:find("Super Mario Rainbow Road") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "54 Stars"
	RunsSlotsName2 = "60 Stars"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.RainbowRoadRuns = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.RainbowRoadRuns = 2
	end
	elseif gGlobalSyncTable.RainbowRoadRuns >= 1 then
	Romhack_Runs_Check = 6
	end
	if gActiveMods[speedruncheck].name:find("Sonic Adventure 64 DX") then
    Romhack_Runs_Check = -1
	RunsSlotsName1 = "1 Star"
	RunsSlotsName2 = "3 Stars"
	if gGlobalSyncTable.RunsSlots == 1 then
	gGlobalSyncTable.SonicAdventure64Runs = 1
	elseif gGlobalSyncTable.RunsSlots == 2 then
	gGlobalSyncTable.SonicAdventure64Runs = 2
	end
	elseif gGlobalSyncTable.SonicAdventure64Runs >= 1 then
	Romhack_Runs_Check = 7
		end
	end
end

-- stops on when entering a pipe
function on_king_boo_interact()
for king_boo_interaction_only in pairs(gActiveMods) do
if gActiveMods[king_boo_interaction_only].name:find("King Boo's Revenge 2") then
	if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and gMarioStates[0].action == ACT_DISAPPEARED then
	if gMarioStates[0].pos.y > 11000 and gMarioStates[0].pos.y < 11600 then
	if krb2timer <= 0 then
	   gGlobalSyncTable.beatedGame = true
		end
		end
		end
    end
	end
end

-- timer for krb2 when entering the pipe
function krb2_timer_check()
local m = gMarioStates[0]
for king_boo_timer_only in pairs(gActiveMods) do
if gActiveMods[king_boo_timer_only].name:find("King Boo's Revenge 2") then
if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and m.pos.y > 11000 and m.pos.y < 11600 and m.action == ACT_DISAPPEARED then
	krb2timer = krb2timer - 1
elseif gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3 then
	krb2timer = 21
			end
		end
	end
end

-- stops on the ending level of only up
function on_only_up_64_interact()
for only_up_interaction_only in pairs(gActiveMods) do
if gActiveMods[only_up_interaction_only].name:find("Only Up 64") then
   if gMarioStates[0].action == ACT_SPAWN_SPIN_AIRBORNE then
	if gMarioStates[0].pos.y < 1900 and gMarioStates[0].pos.y > -100 then
        gGlobalSyncTable.beatedGame = true
		end
		end
	end
    end
end

-- These are some romhacks that are compatible with the speedrun timer
function romhack_positions(m)
-- Super Mario 64
if gGlobalSyncTable.SuperMario64 == true then
Set_SM64_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0)
end

for romhacks in pairs(gActiveMods) do
-- Super Mario Star Road and Star Road: The Replica Comet
if gActiveMods[romhacks].name:find("Star Road") or gActiveMods[romhacks].name:find("Star Road: The Replica Comet") then
Set_Romhack_Position(-6797, 1831, 2710, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- Super Mario 74
elseif gActiveMods[romhacks].name:find("Super Mario 74") and gActiveMods[romhacks].name:find("(+EE)") and gNetworkPlayers[0].currAreaIndex ~= 2 then
Set_Romhack_Position(-6558, -578, 6464, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Super Mario 74: Extreme Edition
elseif gActiveMods[romhacks].name:find("Super Mario 74") and gActiveMods[romhacks].name:find("(+EE)") and gNetworkPlayers[0].currAreaIndex ~= 1 then
Set_Romhack_Position(5481, -922, 6320, LEVEL_CASTLE_COURTYARD, 2, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Super Mario 74: Ten Years After
elseif gActiveMods[romhacks].name:find("Ten Years After") then
Set_Romhack_Position(-5097, -157, 6235, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Super Mario 64 Moonshine
elseif gActiveMods[romhacks].name:find("Super Mario 64 Moonshine") then
Set_Romhack_Position(5, -2794, 2082, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- King Boo's Revenge 2
elseif gActiveMods[romhacks].name:find("King Boo's Revenge 2") then
Set_Romhack_Position(7710, 1575, 6682, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Lug's Delightful Dioramas
elseif gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhacks].name:find("Green Comet") then
Set_Romhack_Position(-200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- Lug's Delightful Dioramas Green Comet
elseif gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and gActiveMods[romhacks].name:find("Green Comet") then
Set_Romhack_Position(-200, 64, -991, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- Super Mario 64: The Green Stars
elseif gActiveMods[romhacks].name:find("SM64: The Green Stars") then
Set_Romhack_Position(-1500, -509, 2102, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Super Mario 64 Sapphire and Super Mario 64 Sapphire Green Comet
elseif gActiveMods[romhacks].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") or gActiveMods[romhacks].name:find("SM64 \\#0f52ba\\Sapphire \\#00FF00\\Green Comet\\dcdcdc\\") then
Set_Romhack_Position(0, -0, 650, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- The Phantom's Call
elseif gActiveMods[romhacks].name:find("The Phantom's Call") then
Set_Romhack_Position(147, -727, -395, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- Star Revenge 1: Star Takeover
elseif gActiveMods[romhacks].name:find("Star Revenge 1: Star Takeover") then
Set_Romhack_Position(8120, -1991, -9473, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Star Revenge 2: Night of Doom
elseif gActiveMods[romhacks].name:find("Star Revenge 2: Night of Doom") then
Set_Romhack_Position(5843, -936, 3985, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Star Revenge 6.5
elseif (gActiveMods[romhacks].name:find("Star Revenge 6") and gActiveMods[romhacks].name:find(".5")) then
Set_Romhack_Position(-14341, -552, -9602, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")

-- SM64 - Twisted Adventures
elseif gActiveMods[romhacks].name:find("Twisted Adventures") then
Set_Romhack_Position(2255, -1215, -695, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Luigi's Mansion 64 and Luigi's Mansion 64.5
elseif gActiveMods[romhacks].name:find("Luigi's Mansion 64") or gActiveMods[romhacks].name:find("Luigi's Mansion 64.5") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Super Mario 64 Paradise Island
elseif gActiveMods[romhacks].name:find("SM64 Paradise Island") then
Set_Romhack_Position(3255, 190, -4806, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Ztar Attack 2
elseif gActiveMods[romhacks].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
Set_Romhack_Position(-1226, -1823, 515, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
gGlobalSyncTable.custom_lives = true

-- SM64 Peach and The Pink Star
elseif gActiveMods[romhacks].name:find("pink star") then
Set_Romhack_Position(-426, 1243, -161, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Start Warp", "Grand Star")

-- Super Mario 64: Hidden Stars
elseif gActiveMods[romhacks].name:find("SM 64 Hidden Stars") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- Super Mario The Galactic Journey
elseif gActiveMods[romhacks].name:find("The Galactic Journey") then
Set_Romhack_Position(-343, 944, 1154, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Star Revenge 1.5: Star Takeover Redone
elseif gActiveMods[romhacks].name:find("Star Takeover Redone") then
Set_Romhack_Position(-3782, -2537, -2770, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Luigi and the Forest Ruins
elseif gActiveMods[romhacks].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then
Set_Romhack_Position(-6400, 371, 392, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Only Up 64
elseif gActiveMods[romhacks].name:find("Only Up 64") then
Set_Romhack_Position(5706, -16259, -5594, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Area", "No Lock", "Level Warp", "None")

-- Thousand-Year Door 64 
elseif gActiveMods[romhacks].name:find("Thousand") and gActiveMods[romhacks].name:find("Year Door 64") then
Set_Romhack_Position(-1722, 120, -4331, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end

-- Super Mario 64: The Mushroom Cup
elseif gActiveMods[romhacks].name:find("\\#ff2b1c\\The \\#636363\\Mushroom \\#ffb742\\Cup") then
Set_Romhack_Position(0, 28, 0, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")

-- Eternal Realm
elseif gActiveMods[romhacks].name:find("Eternal Realm") then
Set_Romhack_Position(-784, -1741, 2590, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")

-- Despair Mario's Gambit 
elseif gActiveMods[romhacks].name:find("Despair Mario's Gambit") then
Set_Romhack_Position(-1727, 112, -710, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- Super Retro Land 
elseif gActiveMods[romhacks].name:find("Super Retro Land") then
Set_Romhack_Position(1364, -333, -1313, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")

-- Super Mario 64: The Underworld
elseif gActiveMods[romhacks].name:find("The Underworld") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "Lock", "Disable", "Grand Star")
DisableTeams = true

-- Katze Stuck in the Toilet 64 
elseif gActiveMods[romhacks].name:find("Katze Stuck in the Toilet 64") then
Set_Romhack_Position(0, 2000, 0, LEVEL_CASTLE_GROUNDS, 2, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Super Mario The Power Star Journey
elseif gActiveMods[romhacks].name:find("The Power Star Journey") then
Set_Romhack_Position(1094, -2371, 3489, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Shining Stars
elseif gActiveMods[romhacks].name:find("\\#ffffff\\Shining Stars") and not gActiveMods[romhacks].name:find("2 Mirror Madness") then
Set_Romhack_Position(-469, -1776, 7135, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "Lock", "Level Warp", "Grand Star")

-- Shining Stars 2 Mirror Madness
elseif gActiveMods[romhacks].name:find("\\#ffffff\\Shining Stars 2 Mirror Madness") then
Set_Romhack_Position(-4323, -1170, -4375, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")

-- Mario's Treasure Dome - The Revival
elseif gActiveMods[romhacks].name:find("Mario's Treasure Dome") and gActiveMods[romhacks].name:find("The Revival") then
Set_Romhack_Position(-489, -557, 2480, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")

-- Luigi & The Violet Stars
elseif gActiveMods[romhacks].name:find("\\#66ff82\\Luigi \\#ffffff\\& \\#ff66fa\\The Violet Stars") then
Set_Romhack_Position(104, -3772, 5000, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Start Warp", "Grand Star")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- SM64 Royal Legacy
elseif gActiveMods[romhacks].name:find("Royal Legacy") then
Set_Romhack_Position(1050, -0, -500, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end

-- SM64 Extra
elseif gActiveMods[romhacks].name:find("Super Mario 64 \\#ff0000\\Extra") then
Set_Romhack_Position(-11576, 689, 10706, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Star Revenge 3 - Mario on An Saoire 64
elseif gActiveMods[romhacks].name:find("Star Revenge 3") and gActiveMods[romhacks].name:find("Mario on An Saoire 64") then
Set_Romhack_Position(9756, -1120, -4534, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Star Revenge 4 - The Kedama Takeover 64
elseif gActiveMods[romhacks].name:find("Star Revenge 4") and gActiveMods[romhacks].name:find("The Kedama Takeover 64") then
Set_Romhack_Position(-6171, 1579, 3906, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star and End Picture")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Super Mario 64 Trouble Town
elseif gActiveMods[romhacks].name:find("Super Mario 64 Trouble Town") then
Set_Romhack_Position(9756, -1120, -4534, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "None")

-- Star Revenge 1.3 - Redone 1.3
elseif gActiveMods[romhacks].name:find("Star Revenge 1.3") and gActiveMods[romhacks].name:find("Redone 1.3") then
Set_Romhack_Position(6422, -995, 4707, LEVEL_CASTLE_COURTYARD, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
if OmmEnabled then
_G.OmmApi.omm_force_setting("stars", 0)
end

-- Super Mario 64 Into Bowser's Castle
elseif gActiveMods[romhacks].name:find("Super Mario 64 Into Bowser's Castle") then
Set_Romhack_Position(0, -0, 0, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")

-- Green Star Revenge 1
elseif gActiveMods[romhacks].name:find("Green Star Revenge 1") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Grand Star")
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end

-- Super Mario and the Marvel Adventure
elseif gActiveMods[romhacks].name:find("Super Mario and the Marvel Adventure") then
Set_Romhack_Position(-4630, -1309, 1000, LEVEL_CASTLE, 1, 0, "Force Level", "No Lock", "Level Warp", "None")

-- Super Mario Rainbow Road
elseif gActiveMods[romhacks].name:find("Super Mario Rainbow Road") then
Set_Romhack_Position(-243, -768, 4858, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")

-- Sonic Adventure 64 DX 
elseif gActiveMods[romhacks].name:find("Sonic Adventure 64 DX") then
Set_Romhack_Position(-20140, 675, -25901, LEVEL_CASTLE_GROUNDS, 1, 0, "Force Level", "No Lock", "Level Warp", "Custom Runs")
		end
	end
end

-- These are how the command set the function
function romhack_stars_mario_update(m)
for romhacks_stars_only in pairs(gActiveMods) do
if gActiveMods[romhacks_stars_only].name:find("Star Road") or gActiveMods[romhacks_stars_only].name:find("Star Road: The Replica Comet") then
     if ((gGlobalSyncTable.StarRoadRuns == 1 or (gGlobalSyncTable.StarRoadRuns == 3 and m.numStars >= 65) or (gGlobalSyncTable.StarRoadRuns == 4 and m.numStars >= 80))
	and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
	or (gGlobalSyncTable.StarRoadRuns == 2 and m.numStars >= 20 and save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)
	or (gGlobalSyncTable.StarRoadRuns == 5 and m.numStars >= 130) 
	or (gGlobalSyncTable.StarRoadRuns == 6 and m.numStars >= 150) then
	    gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("Super Mario 64 Moonshine") then
	if (gGlobalSyncTable.MoonShineRuns == 2 and m.numStars >= 50) then
	    gGlobalSyncTable.beatedGame = true
			end
		end
	if (gActiveMods[romhacks_stars_only].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhacks_stars_only].name:find("Green Comet")) then
	if (gGlobalSyncTable.DelightfulDioramasRuns == 1 and m.numStars >= 64 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS) 
	or (gGlobalSyncTable.DelightfulDioramasRuns == 2 and m.numStars >= 74) then
	    gGlobalSyncTable.beatedGame = true
			end
		end
	if gActiveMods[romhacks_stars_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    if (gGlobalSyncTable.ZtarAttack2Runs == 1 and save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0)
	or (gGlobalSyncTable.ZtarAttack2Runs == 2 and (save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0))
	or (gGlobalSyncTable.ZtarAttack2Runs == 3 and m.numStars >= 81 and save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0) 
	or (gGlobalSyncTable.ZtarAttack2Runs == 4 and m.numStars >= 91 and save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0) then
		gGlobalSyncTable.beatedGame = true
		end
	end
	if (gActiveMods[romhacks_stars_only].name:find("Star Revenge 3") and gActiveMods[romhacks_stars_only].name:find("Mario on An Saoire 64")) then
	if (((gGlobalSyncTable.StarRevenge3Runs == 1 and m.numStars >= 1) or (gGlobalSyncTable.StarRevenge3Runs == 2 and m.numStars >= 36)) and gNetworkPlayers[0].currLevelNum == LEVEL_BITFS) 
	or (gGlobalSyncTable.StarRevenge3Runs == 3 and m.numStars >= 65) then
	    gGlobalSyncTable.beatedGame = true
		end
	end
	
	if gActiveMods[romhacks_stars_only].name:find("Super Mario Rainbow Road") then
	if (gGlobalSyncTable.RainbowRoadRuns == 2 and m.numStars >= 60) then
	   gGlobalSyncTable.beatedGame = true
	    end
	end
	
	if gActiveMods[romhacks_stars_only].name:find("Sonic Adventure 64 DX") then
    if (gGlobalSyncTable.SonicAdventure64Runs == 2 and m.numStars >= 3) then
		gGlobalSyncTable.beatedGame = true
		end
	end
	
	if gActiveMods[romhacks_stars_only].name:find("Eternal Realm") then
	if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then
	 gGlobalSyncTable.beatedGame = true
		end
	end
	
	if gActiveMods[romhacks_stars_only].name:find("Super Mario 64 Trouble Town") then
	if m.numStars >= 30 then
        gGlobalSyncTable.beatedGame = true
		end
	end
	end
end

function romhack_stars_interaction(m, o, interactType)
for romhacks_stars_only in pairs(gActiveMods) do
	if gActiveMods[romhacks_stars_only].name:find("Super Mario 64 Moonshine") then
	if (gGlobalSyncTable.MoonShineRuns == 1 and m.numStars >= 31 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_BITS) then
	   gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    if (gGlobalSyncTable.ZtarAttack2Runs == 5 and (save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0) 
	and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 2 << 24) then
		gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("Super Mario Rainbow Road") then
	if (gGlobalSyncTable.RainbowRoadRuns == 1 and m.numStars >= 54 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_SA) then
	   gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("Sonic Adventure 64 DX") then
    if (gGlobalSyncTable.SonicAdventure64Runs == 1 and gNetworkPlayers[0].currLevelNum == LEVEL_BOB and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 0 << 24) then
		gGlobalSyncTable.beatedGame = true
		end
	end
    if (gActiveMods[romhacks_stars_only].name:find("Star Revenge 6") and gActiveMods[romhacks_stars_only].name:find(".5")) then
	if (interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 5 << 24 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE) then
		gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("The Galactic Journey") then
	if (interactType == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_TOTWC) then
	   	gGlobalSyncTable.beatedGame = true
		end
	end
	if gActiveMods[romhacks_stars_only].name:find("Super Mario and the Marvel Adventure") then
    if (interactType == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING) then
        gGlobalSyncTable.beatedGame = true
			end
		end
	end
end