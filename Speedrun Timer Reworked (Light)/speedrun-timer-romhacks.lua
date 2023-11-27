if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Star Road
gGlobalSyncTable.starany = false
gGlobalSyncTable.star20 = false
gGlobalSyncTable.star80 = false
gGlobalSyncTable.star130 = false
gGlobalSyncTable.star150 = false

-- Lug's Dioramas Delightful
gGlobalSyncTable.star64 = false
gGlobalSyncTable.star74 = false

-- Ztar Attack 2
gGlobalSyncTable.timestarany = false
gGlobalSyncTable.timestarwarplessany = false
gGlobalSyncTable.timestar81 = false
gGlobalSyncTable.timestar90 = false
gGlobalSyncTable.timestarallbosses = false

-- Warpless Functions
gGlobalSyncTable.enterW1 = false
gGlobalSyncTable.enterW2 = false
gGlobalSyncTable.enterW3 = false
gGlobalSyncTable.enterW4 = false
gGlobalSyncTable.enterW5 = false
gGlobalSyncTable.allworlds = false

-- All Bosses Functions
gGlobalSyncTable.wigglerboss = false
gGlobalSyncTable.eyerockboss = false
gGlobalSyncTable.kingbobombboss = false
gGlobalSyncTable.kingwhompboss = false
gGlobalSyncTable.bowserboss = false
gGlobalSyncTable.ztarboss = false
gGlobalSyncTable.allbossesdefeated = false

-- Other Functions
gGlobalSyncTable.EndPicture = true
gGlobalSyncTable.CompatibleRomhacks = false
gGlobalSyncTable.RomhacksWarning = false
gGlobalSyncTable.TeamsCheck = false
krb2timer = 21
Rules_is_closed_for_intro = false
gGlobalSyncTable.savefile = false
gGlobalSyncTable.SM74savefile = false
gGlobalSyncTable.SM74EEsavefile = false

-- This makes sure that you have to put a run before starting the speedrun
function on_romhack_speedrun_check(m)
for speedruncheck in pairs(gActiveMods) do
	if gActiveMods[speedruncheck].name:find("Star Road") or gActiveMods[speedruncheck].name:find("Star Road: The Replica Comet") then
    StarRoad_Check = false
	elseif gGlobalSyncTable.starany or gGlobalSyncTable.star20 or gGlobalSyncTable.star80 or gGlobalSyncTable.star130 or gGlobalSyncTable.star150 then
	StarRoad_Check = true
	end
	
	if gActiveMods[speedruncheck].name:find("Project Reimagined") then
    ProjectReimagined_Check = false
	elseif gGlobalSyncTable.star100 or gGlobalSyncTable.star170 or gGlobalSyncTable.PRchallenges or gGlobalSyncTable.PRDS then
	ProjectReimagined_Check = true
	end
	
	if (gActiveMods[speedruncheck].name:find("Lug's Delightful Dioramas") and not gActiveMods[speedruncheck].name:find("Green Comet")) then
    Lugs_Delightful_Dioramas_Check = false
	elseif gGlobalSyncTable.star64 or gGlobalSyncTable.star74 then
	Lugs_Delightful_Dioramas_Check = true
	end
	
	if gActiveMods[speedruncheck].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    Ztar_Attack_2_Check = false
	elseif gGlobalSyncTable.timestarany or gGlobalSyncTable.timestarwarplessany or gGlobalSyncTable.timestar81 or gGlobalSyncTable.timestar90 or gGlobalSyncTable.timestarallbosses then
	Ztar_Attack_2_Check = true
	end
    end
end

-- pretty much how the timer stop when touching the grand star (only works for fighting final bowser)
function on_romhack_interact(m, o, intee, interacted)
for romhacksgrandstar in pairs(gActiveMods) do
	if gActiveMods[romhacksgrandstar].incompatible ~= nil and gActiveMods[romhacksgrandstar].incompatible:find("romhack") then
    if get_id_from_behavior(o.behavior) == id_bhvGrandStar then
        gGlobalSyncTable.beatedGame = true
		end
		end
    end
end

-- stops when someone enter the end picture
function on_romhack_interact_end_picture()
for romhacksendpicture in pairs(gActiveMods) do
	if gActiveMods[romhacksendpicture].incompatible ~= nil and gActiveMods[romhacksendpicture].incompatible:find("romhack") then
	if gGlobalSyncTable.EndPicture then
    if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
        gGlobalSyncTable.beatedGame = true
		end
		end
	end
    end
end

-- this checks if one of the teams finish the run
function on_teams_update(m)
	if SpeedrunTeams then
	if gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#f90303\\Red Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
	elseif gGlobalSyncTable.beatedGame and gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.notags and not gGlobalSyncTable.TeamsCheck then
	djui_popup_create_global('\\#3903ff\\Blue Team \\#FFFF00\\Wins!!\\#FFFFFF\\', 2)
	gGlobalSyncTable.TeamsCheck = true
		end
	end
end

-- This should fixed the teams command for SM74
function save_files_no_teams_sm74(m)
if not SpeedrunTeams then
for sm74_savefile in pairs(gActiveMods) do
if gActiveMods[sm74_savefile].name:find("Super Mario 74") and gNetworkPlayers[0].currAreaIndex ~= 2 and not gActiveMods[sm74_savefile].name:find("Ten Years After") then
gGlobalSyncTable.SM74savefile = true
gGlobalSyncTable.SM74EEsavefile = false
gGlobalSyncTable.savefile = false
if gGlobalSyncTable.SM74savefile then
	save_file_set_using_backup_slot(false)
	end
end

if gActiveMods[sm74_savefile].name:find("Super Mario 74") and gNetworkPlayers[0].currAreaIndex ~= 1 then
	gGlobalSyncTable.SM74savefile = false
	gGlobalSyncTable.SM74EEsavefile = true
	gGlobalSyncTable.savefile = false
	if gGlobalSyncTable.SM74EEsavefile then
	save_file_set_using_backup_slot(true)
	else
	save_file_set_using_backup_slot(true)	
		end
		end
	end
	end
end

-- stops on a star in moonshine
function on_moonshine_interact(m, o, intee, interacted)
for moonshine_interaction_only in pairs(gActiveMods) do
if gActiveMods[moonshine_interaction_only].name:find("Super Mario 64 Moonshine") then
    if get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_BITS then
	   gGlobalSyncTable.beatedGame = true
		end
	end
    end
end

-- stops on when entering a pipe
function on_king_boo_interact()
for king_boo_interaction_only in pairs(gActiveMods) do
if gActiveMods[king_boo_interaction_only].name:find("King Boo's Revenge 2") then
	if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and gMarioStates[0].action == ACT_DISAPPEARED then
	if gMarioStates[0].pos.y > 11000 and gMarioStates[0].pos.y < 11600 then
	if krb2timer == 0 then
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

-- meants to stop on the star when collecting the 8 red coins star in the main castle
function on_star_revenge6_interact(m, o, interactType)
for star_revenge6_interaction_only in pairs(gActiveMods) do
if gActiveMods[star_revenge6_interaction_only].name:find("Star Revenge 6.5") then
	if interactType == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE then
	   gGlobalSyncTable.beatedGame = true
		end
	end
    end
end

-- stops on the star in the galactic altar
function on_galactic_journey_interact(m, o, interactType)
for galactic_journey_interaction_only in pairs(gActiveMods) do
if gActiveMods[galactic_journey_interaction_only].name:find("The Galactic Journey") then
    if interactType == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_TOTWC then
        gGlobalSyncTable.beatedGame = true
		end
	end
    end
end

-- These are some romhacks that are compatible with the speedrun timer
function romhack_positions(m)
-- Super Mario 64
if gGlobalSyncTable.SuperMario64 then
Set_SM64_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0)
end

for romhacks in pairs(gActiveMods) do
-- Super Mario Star Road and Star Road: The Replica Comet
if gActiveMods[romhacks].name:find("Star Road") or gActiveMods[romhacks].name:find("Star Road: The Replica Comet") then
Set_Romhack_Position(-6797, 1851, 2710, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- Super Mario 74
elseif gActiveMods[romhacks].name:find("Super Mario 74") and gNetworkPlayers[0].currAreaIndex ~= 2 and not gActiveMods[romhacks].name:find("Ten Years After") then
Set_Romhack_Position(-6558, -578, 6464, LEVEL_CASTLE_COURTYARD, 1, 0, false, true)

-- Super Mario 74: Extreme Edition
elseif gActiveMods[romhacks].name:find("Super Mario 74") and gNetworkPlayers[0].currAreaIndex ~= 1 then
Set_Romhack_Position(5481, -922, 6320, LEVEL_CASTLE_COURTYARD, 2, 0, false, true)

-- Super Mario 74: 10 years After
elseif gActiveMods[romhacks].name:find("Ten Years After") then
Set_Romhack_Position(-5097, -157, 6235, LEVEL_CASTLE_COURTYARD, 1, 0, false, true)

-- Super Mario 64 Moonshine
elseif gActiveMods[romhacks].name:find("Super Mario 64 Moonshine") then
Set_Romhack_Position(5, -2794, 2082, LEVEL_CASTLE, 1, 0, false, true)

-- King Boo's Revenge 2
elseif gActiveMods[romhacks].name:find("King Boo's Revenge 2") then
Set_Romhack_Position(7710, 1575, 6682, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)
if OmmEnabled then
_G.OmmApi.omm_force_setting_value("stars", 0)
end

-- Lug's Delightful Dioramas
elseif gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and not gActiveMods[romhacks].name:find("Green Comet") then
Set_Romhack_Position(-200, 64, -991, LEVEL_CASTLE, 1, 0, false, true)

-- Lug's Delightful Dioramas Green Comet
elseif gActiveMods[romhacks].name:find("Lug's Delightful Dioramas") and gActiveMods[romhacks].name:find("Green Comet") then
Set_Romhack_Position(-200, 64, -991, LEVEL_CASTLE, 1, 0, true, true)

-- Super Mario 64: The Green Stars
elseif gActiveMods[romhacks].name:find("SM64: The Green Stars") then
Set_Romhack_Position(-1500, -509, 2102, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- Super Mario 64 Sapphire
elseif gActiveMods[romhacks].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") then
Set_Romhack_Position(0, -0, 650, LEVEL_CASTLE, 1, 0, true, true)

-- The Phantom's Call
elseif gActiveMods[romhacks].name:find("The Phantom's Call") then
Set_Romhack_Position(147, -727, -395, LEVEL_CASTLE_GROUNDS, 1, 0, true, true)

-- Star Revenge 1: Star Takeover
elseif gActiveMods[romhacks].name:find("Star Revenge 1: Star Takeover") then
Set_Romhack_Position(8120, -1991, -9473, LEVEL_CASTLE_COURTYARD, 1, 0, true, true)
if OmmEnabled then
_G.OmmApi.omm_force_setting_value("stars", 0)
end

-- Star Revenge 2: Night of Doom
elseif gActiveMods[romhacks].name:find("Star Revenge 2: Night of Doom") then
Set_Romhack_Position(5843, -936, 3985, LEVEL_CASTLE_COURTYARD, 1, 0, false, true)

-- Star Revenge 6.5
elseif gActiveMods[romhacks].name:find("Star Revenge 6.5") then
Set_Romhack_Position(-14341, -552, -9602, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- SM64 - Twisted Adventures
elseif gActiveMods[romhacks].name:find("Twisted Adventures") then
Set_Romhack_Position(2255, -1215, -695, LEVEL_CASTLE_COURTYARD, 1, 0, false, true)

-- Luigi's Mansion 64 and Luigi's Mansion 64.5
elseif gActiveMods[romhacks].name:find("Luigi's Mansion 64") or gActiveMods[romhacks].name:find("Luigi's Mansion 64.5") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- SM64 Paradise Island
elseif gActiveMods[romhacks].name:find("SM64 Paradise Island") then
Set_Romhack_Position(3255, 190, -4806, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- Ztar Attack 2
elseif gActiveMods[romhacks].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
Set_Romhack_Position(-1226, -1823, 515, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)
if OmmEnabled then
_G.OmmApi.omm_force_setting_value("stars", 0)
end

-- SM64 Peach and The Pink Star
elseif gActiveMods[romhacks].name:find("pink star") then
Set_Romhack_Position(-426, 1243, -161, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)

-- Super Mario 64: Hidden Stars
elseif gActiveMods[romhacks].name:find("SM 64 Hidden Stars") then
Set_Romhack_Position(-1328, 260, 4664, LEVEL_CASTLE_GROUNDS, 1, 0, true, true)

-- Super Mario The Galactic Journey
elseif gActiveMods[romhacks].name:find("The Galactic Journey") then
Set_Romhack_Position(-343, 944, 1154, LEVEL_CASTLE_GROUNDS, 1, 0, false, true)
if OmmEnabled then
_G.OmmApi.omm_force_setting_value("stars", 0)
end

-- Star Revenge 1.5: Star Takeover Redone
elseif gActiveMods[romhacks].name:find("Star Takeover Redone") then
Set_Romhack_Position(-3782, 2537, 2770, LEVEL_CASTLE_COURTYARD, 1, 0, false, true)

-- Luigi and the Forest Ruins
elseif gActiveMods[romhacks].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then
Set_Romhack_Position(-6400, 371, 392, LEVEL_CASTLE_GROUNDS, 1, 0, true, true)
if OmmEnabled then
_G.OmmApi.omm_force_setting_value("stars", 0)
end
		end
	end
end

-- This is for romhack that isn't compatible yet, so this will set the positions to the start position
function unsupported_romhacks(m)
for unsupportedromhacks in pairs(gActiveMods) do
	if gActiveMods[unsupportedromhacks].incompatible ~= nil and gActiveMods[unsupportedromhacks].incompatible:find("romhack") then
	gGlobalSyncTable.startingpoint = false
	if gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false and not gGlobalSyncTable.RomhacksWarning then
	gGlobalSyncTable.RomhacksWarning = true
	djui_popup_create("\\#ff0000\\Warning:\nThere's some Romhacks that won't stop the timer or will stop, but isn't complete.\nBe aware of those and report them if it happens!", 4)
	end
	if gGlobalSyncTable.CompatibleRomhacks == false and gGlobalSyncTable.SuperMario64 == false then
	if gGlobalSyncTable.startspeedruntime > 0 then
	vec3f_copy(gMarioStates[0].pos, gMarioStates[0].spawnInfo.startPos)
			end
			end
		end
	end
end

-- This can detects of how many stars that you can get for Star Road to stop the timer
function star_road_stars(m)
for star_road_stars_only in pairs(gActiveMods) do
if gActiveMods[star_road_stars_only].name:find("Star Road") or gActiveMods[star_road_stars_only].name:find("Star Road: The Replica Comet") then
    if gGlobalSyncTable.starany and StarRoad_Check then
       if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.star20 and StarRoad_Check then
       if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.star80 and StarRoad_Check then
       if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	   if m.numStars > 79 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.star130 and StarRoad_Check then
		if m.numStars > 129 and gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.star150 and StarRoad_Check then
		if m.numStars > 149 and gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
end

-- Command that you only need for Star Road
function on_star_road_stars_command(msg)
	if string.lower(msg) == 'any' then
		gGlobalSyncTable.starany = true
		gGlobalSyncTable.star20 = false
		gGlobalSyncTable.star80 = false
		gGlobalSyncTable.star130 = false
		gGlobalSyncTable.star150 = false
		djui_popup_create_global('Any Stars Run', 1)
		return true
	elseif string.lower(msg) == '20' then
		gGlobalSyncTable.starany = false
		gGlobalSyncTable.star20 = true
		gGlobalSyncTable.star80 = false
		gGlobalSyncTable.star130 = false
		gGlobalSyncTable.star150 = false
		djui_popup_create_global('20 Stars Run', 1)
		return true
    elseif string.lower(msg) == '80' then
        gGlobalSyncTable.starany = false
		gGlobalSyncTable.star20 = false
		gGlobalSyncTable.star80 = true
		gGlobalSyncTable.star130 = false
		gGlobalSyncTable.star150 = false
        djui_popup_create_global('80 Stars Run', 1)
        return true
    elseif string.lower(msg) == '130' then
        gGlobalSyncTable.starany = false
		gGlobalSyncTable.star20 = false
		gGlobalSyncTable.star80 = false
		gGlobalSyncTable.star130 = true
		gGlobalSyncTable.star150 = false
		djui_popup_create_global('130 Stars Run', 1)
        return true
	elseif string.lower(msg) == '150' then
        gGlobalSyncTable.starany = false
		gGlobalSyncTable.star20 = false
		gGlobalSyncTable.star80 = false
		gGlobalSyncTable.star130 = false
		gGlobalSyncTable.star150 = true
		djui_popup_create_global('150 Stars Run', 1)
        return true
	end
   return false
end

-- This command only appear when setting if you have Star Road
for star_road_only in pairs(gActiveMods) do
if network_is_server() and gActiveMods[star_road_only].name:find("Star Road") then
hook_chat_command('set stars to', "[any|20|80|130|150] to stop the timer on what star you going to get", on_star_road_stars_command)
	end
end

-- This can detects of how many stars that you can get for Lug's Delightful Dioramas to stop the timer
function ldd_stars(m)
for ldd_stars_only in pairs(gActiveMods) do
if (gActiveMods[ldd_stars_only].name:find("Lug's Delightful Dioramas") and not gActiveMods[ldd_stars_only].name:find("Green Comet")) then
	if gGlobalSyncTable.star64 and Lugs_Delightful_Dioramas_Check then
       if m.numStars > 63 and gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if gNetworkPlayers[0].currLevelNum == LEVEL_BITS then
	   gGlobalSyncTable.beatedGame = true
			end
			end
		end
	end
	if gGlobalSyncTable.star74 and Lugs_Delightful_Dioramas_Check then
		if m.numStars > 73 and gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
end

-- Command that you only need for Lug's Delightful Dioramas
function on_ldd_stars_command(msg)
    if string.lower(msg) == '64' then
		djui_popup_create_global('64 Stars Run', 1)
		gGlobalSyncTable.star64 = true
		gGlobalSyncTable.star74 = false
        return true
    elseif string.lower(msg) == '74' then
        djui_popup_create_global('74 Stars Run', 1)
		gGlobalSyncTable.star64 = false
		gGlobalSyncTable.star74 = true
        return true
	end
   return false
end

-- This command only appear when setting if you have Lug's Delightful Dioramas
for ldd_only in pairs(gActiveMods) do
if network_is_server() and (gActiveMods[ldd_only].name:find("Lug's Delightful Dioramas") and not gActiveMods[ldd_only].name:find("Green Comet")) then
hook_chat_command('set stars to', "[64|74] to stop the timer on what stars you going to get", on_ldd_stars_command)
	end
end

-- This can detects of how many stars that you can get for Ztak Attack 2 to stop the timer
function ztar_attack_2_stars(m)
for ztar_attack_2_stars_only in pairs(gActiveMods) do
if gActiveMods[ztar_attack_2_stars_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
    if gGlobalSyncTable.timestarany and Ztar_Attack_2_Check then
      if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	   if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
		gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.timestarwarplessany and Ztar_Attack_2_Check then
		if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then
		gGlobalSyncTable.enterW1 = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0 then
		gGlobalSyncTable.enterW2 = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then
		gGlobalSyncTable.enterW3 = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then
		gGlobalSyncTable.enterW4 = true
		end
		if gNetworkPlayers[0].currLevelNum == LEVEL_BOWSER_3 and m.action == ACT_DISAPPEARED then
		gGlobalSyncTable.enterW5 = true
		end
		if gGlobalSyncTable.enterW1 and gGlobalSyncTable.enterW2 and gGlobalSyncTable.enterW3 and gGlobalSyncTable.enterW4 and gGlobalSyncTable.enterW5 then
		gGlobalSyncTable.allworlds = true
			end
		end
		if gNetworkPlayers[0].currLevelNum == LEVEL_PSS and gGlobalSyncTable.allworlds then
		if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
		gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.timestar81 and Ztar_Attack_2_Check then
	if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
	if m.numStars > 80 and save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
	gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.timestar90 and Ztar_Attack_2_Check then
	 if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0 then
	   gGlobalSyncTable.beatedGame = true
			end
		end
	end
	if gGlobalSyncTable.timestarallbosses and Ztar_Attack_2_Check then
		if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0 then 
		gGlobalSyncTable.wigglerboss = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_KEY_2 ~= 0 then 
		gGlobalSyncTable.eyerockboss = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_METAL_CAP ~= 0 then 
		gGlobalSyncTable.kingbobombboss = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_VANISH_CAP ~= 0 then 
		gGlobalSyncTable.kingwhompboss = true
		end
		if save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0 then
		gGlobalSyncTable.bowserboss = true
		end
		if gGlobalSyncTable.wigglerboss and gGlobalSyncTable.eyerockboss and gGlobalSyncTable.kingbobombboss 
		and gGlobalSyncTable.kingwhompboss and gGlobalSyncTable.bowserboss and gGlobalSyncTable.ztarboss then
		gGlobalSyncTable.allbossesdefeated = true
		end
		end
		end
	end
	end
end

function ztar_attack_2_stars_2(m, o, interactType)
for ztar_attack_2_stars2_only in pairs(gActiveMods) do
if gActiveMods[ztar_attack_2_stars2_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
	if gGlobalSyncTable.timestarallbosses and Ztar_Attack_2_Check then
		if gGlobalSyncTable.startTimer or gGlobalSyncTable.restartSpeedrun or gGlobalSyncTable.startIntro then
		if gNetworkPlayers[0].currLevelNum == LEVEL_TOTWC then
		if interactType == INTERACT_STAR_OR_KEY then
		gGlobalSyncTable.ztarboss = true
				end
			end
		end
	if gGlobalSyncTable.allbossesdefeated then
	if gNetworkPlayers[0].currLevelNum == LEVEL_ENDING then
	if interactType == INTERACT_STAR_OR_KEY then
	   gGlobalSyncTable.beatedGame = true
			end
			end
		end
		end
	end
	end
end 

-- Command that you only need for Ztak Attack 2
function on_ztar_attack_2_stars_command(msg)
	if string.lower(msg) == 'any' then
		gGlobalSyncTable.timestarany = true
		gGlobalSyncTable.timestarwarplessany = false
		gGlobalSyncTable.timestar81 = false
		gGlobalSyncTable.timestar90 = false
		gGlobalSyncTable.timestarallbosses = false
		djui_popup_create_global('Any% Run', 1)
		return true
    elseif string.lower(msg) == 'warpless' then
        gGlobalSyncTable.timestarany = false
		gGlobalSyncTable.timestarwarplessany = true
		gGlobalSyncTable.timestar81 = false
		gGlobalSyncTable.timestar90 = false
		gGlobalSyncTable.timestarallbosses = false
        djui_popup_create_global('Warpless Any% Run', 1)
        return true
    elseif string.lower(msg) == '81' then
        gGlobalSyncTable.timestarany = false
		gGlobalSyncTable.timestarwarplessany = false
		gGlobalSyncTable.timestar81 = true
		gGlobalSyncTable.timestar90 = false
		gGlobalSyncTable.timestarallbosses = false
		djui_popup_create_global('81 Stars Run', 1)
        return true
	elseif string.lower(msg) == '90' then
        gGlobalSyncTable.timestarany = false
		gGlobalSyncTable.timestarwarplessany = false
		gGlobalSyncTable.timestar81 = false
		gGlobalSyncTable.timestar90 = true
		gGlobalSyncTable.timestarallbosses = false
		djui_popup_create_global('90 Stars Run', 1)
		return true
	elseif string.lower(msg) == 'bosses' or string.lower(msg) == 'all bosses' then
        gGlobalSyncTable.timestarany = false
		gGlobalSyncTable.timestarwarplessany = false
		gGlobalSyncTable.timestar81 = false
		gGlobalSyncTable.timestar90 = false
		gGlobalSyncTable.timestarallbosses = true
		djui_popup_create_global('All Bosses Run', 1)
        return true
	end
   return false
end

-- This command only appear when setting if you have Ztak Attack 2
for ztar_attack_2_only in pairs(gActiveMods) do
if network_is_server() and gActiveMods[ztar_attack_2_only].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
hook_chat_command('set time stars to', "[Any|Warpless|81|90|Bosses] to stop the timer on what time stars you going to get", on_ztar_attack_2_stars_command)
	end
end

-- This updates the description of the runs in star road
function reworked_description_star_road(m)
for star_road_description_stars in pairs(gActiveMods) do
if gActiveMods[star_road_description_stars].name:find("Star Road") or gActiveMods[star_road_description_stars].name:find("Star Road: The Replica Comet") then
	if not network_is_server() then return end
	if gGlobalSyncTable.starany then
	SRStarAny_Name = '\\#00ff00\\any\\#FFFFFF\\'
	else
	SRStarAny_Name = '\\#ff0000\\any\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.star20 then
	SRStar20_Name = '\\#00ff00\\20\\#FFFFFF\\'
	else
	SRStar20_Name = '\\#ff0000\\20\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.star80 then
	SRStar80_Name = '\\#00ff00\\80\\#FFFFFF\\'
	else
	SRStar80_Name = '\\#ff0000\\80\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.star130 then
	SRStar130_Name = '\\#00ff00\\130\\#FFFFFF\\'
	else
	SRStar130_Name = '\\#ff0000\\130\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.star150 then
	SRStar150_Name = '\\#00ff00\\150\\#FFFFFF\\'
	else
	SRStar150_Name = '\\#ff0000\\150\\#FFFFFF\\'
	end
	
	
	update_chat_command_description('set stars to', "[" .. SRStarAny_Name .. "|" .. SRStar20_Name .. "|" .. SRStar80_Name .. "|" .. SRStar130_Name .. "|" .. SRStar150_Name .. "] to stop the timer on what star you going to get")
		end
	end
end

-- This updates the description of the runs in lug's delightful dioramas
function reworked_description_ldd(m)
for ldd_description_stars in pairs(gActiveMods) do
if (gActiveMods[ldd_description_stars].name:find("Lug's Delightful Dioramas") and not gActiveMods[ldd_description_stars].name:find("Green Comet")) then
	if not network_is_server() then return end
	if gGlobalSyncTable.star64 then
	LDDStar64_Name = '\\#00ff00\\64\\#FFFFFF\\'
	else
	LDDStar64_Name = '\\#ff0000\\64\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.star74 then
	LDDStar74_Name = '\\#00ff00\\74\\#FFFFFF\\'
	else
	LDDStar74_Name = '\\#ff0000\\74\\#FFFFFF\\'
	end
	
	update_chat_command_description('set stars to', "[" .. LDDStar64_Name .. "|" .. LDDStar74_Name .. "] to stop the timer on what stars you going to get")
		end
	end
end

-- This updates the description of the runs in ztar attack 2
function reworked_description_ztar_attack_2(m)
for ztar_attack_2_description_stars in pairs(gActiveMods) do
if gActiveMods[ztar_attack_2_description_stars].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then
	if not network_is_server() then return end
	if gGlobalSyncTable.timestarany then
	ZA2Any_Name = '\\#00ff00\\Any\\#FFFFFF\\'
	else
	ZA2Any_Name = '\\#ff0000\\Any\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.timestarwarplessany then
	ZA2Warpless_Name = '\\#00ff00\\Warpless\\#FFFFFF\\'
	else
	ZA2Warpless_Name = '\\#ff0000\\Warpless\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.timestar81 then
	ZA2Star81_Name = '\\#00ff00\\81\\#FFFFFF\\'
	else
	ZA2Star81_Name = '\\#ff0000\\80\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.timestar90 then
	ZA2Star90_Name = '\\#00ff00\\91\\#FFFFFF\\'
	else
	ZA2Star90_Name = '\\#ff0000\\91\\#FFFFFF\\'
	end
	
	if gGlobalSyncTable.timestarallbosses then
	ZA2Bosses_Name = '\\#00ff00\\Bosses\\#FFFFFF\\'
	else
	ZA2Bosses_Name = '\\#ff0000\\Bosses\\#FFFFFF\\'
	end
	
	update_chat_command_description('set time stars to', "[" .. ZA2Any_Name .. "|" .. ZA2Warpless_Name .. "|" .. ZA2Star81_Name .. "|" .. ZA2Star90_Name .. "|" .. ZA2Bosses_Name .. "] to stop the timer on what time stars you going to get")
		end
	end
end
