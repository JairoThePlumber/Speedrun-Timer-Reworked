if gamemodes_is_checked or notallowedmods or no_cheats then return end

gGlobalSyncTable.RunsSlots = 0
gGlobalSyncTable.GrandStar = true
gGlobalSyncTable.EndPicture = true
gGlobalSyncTable.CompatibleRomhacks = false
gGlobalSyncTable.RomhacksWarning = false
gGlobalSyncTable.TeamsCheck = false
DisableCommands = true
Romhack_Runs_Option = false
Disable_Custom_Warps = false
gGlobalSyncTable.SM74EEsavefile = false

function Romhack_Mario_Update_Functions(m)
-- this checks if one of the teams finish the run
	if gGlobalSyncTable.SpeedrunTeams then
	if gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#f90303\\Red Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
	elseif gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#3903ff\\Blue Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
		end
	end
	
-- This should fixed the teams option for SM74EE
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

-- Super Mario 64
if gGlobalSyncTable.SuperMario64 == true then
Set_SM64_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0)
	end
end

function Romhack_Update_Functions(m)
	-- stops when someone enter the end picture
	for romhacksendpicture in pairs(gActiveMods) do
	if gActiveMods[romhacksendpicture].incompatible ~= nil and gActiveMods[romhacksendpicture].incompatible:find("romhack") then
	if gGlobalSyncTable.EndPicture then
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gGlobalSyncTable.RunsSlots == 0 then
        gGlobalSyncTable.beatedGame = true
		end
		end
	end
    end
	
	-- This is for romhack that isn't compatible, so this will set the positions to the start position
	for unsupportedromhacks in pairs(gActiveMods) do
	if gActiveMods[unsupportedromhacks].incompatible ~= nil and gActiveMods[unsupportedromhacks].incompatible:find("romhack") then
	if gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false and not gGlobalSyncTable.RomhacksWarning then
	gGlobalSyncTable.RomhacksWarning = true
	djui_popup_create("\\#ff0000\\\nWarning:\nThere's some Romhacks that won't stop the timer or will stop, but isn't complete.\nBe aware of those and report them if it happens!", 5)
	end
	if (gGlobalSyncTable.CompatibleRomhacks == false) then
	switched = false
	hasConfirmed = true
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

function Romhack_Interact_Functions(m, o, interactType)
	-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
	if gGlobalSyncTable.SuperMario64 == true and gGlobalSyncTable.RunsSlots == 0 then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
        gGlobalSyncTable.beatedGame = true
		end
    end
	
	-- pretty much how the timer stop when touching the grand star (only works for romhacks)
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