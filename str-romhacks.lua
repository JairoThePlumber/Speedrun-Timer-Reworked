RH_Name = "None"
CRH_Name = "None"
RH_Run_Name = "None"

for RM in pairs(gActiveMods) do
    if gActiveMods[RM].name:find("\\#ff38cd\\Beat \\#ff38cd\\Block \\#ff38cd\\Beatdown") then RH_Name = "Beat Block Beatdown"
	elseif gActiveMods[RM].name:find("Despair Mario's Gambit") then RH_Name = "Despair Mario's Gambit"
	elseif gActiveMods[RM].name:find("Eternal Realm") then RH_Name = "Eternal Realm"
	elseif gActiveMods[RM].name:find("Green Star Revenge 1") then RH_Name = "Green Star Revenge 1"
	elseif gActiveMods[RM].name:find("Katze Stuck in the Toilet 64") then RH_Name = "Katze Stuck in the Toilet 64"
	elseif gActiveMods[RM].name:find("King Boo's Revenge 2") then RH_Name = "King Boo's Revenge 2"
	elseif gActiveMods[RM].name:find("Lug's Delightful Dioramas") and not gActiveMods[RM].name:find("Green Comet") then RH_Name = "Lug's Delightful Dioramas"
	elseif gActiveMods[RM].name:find("Lug's Delightful Dioramas") and gActiveMods[RM].name:find("Green Comet") then RH_Name = "Lug's Delightful Dioramas (Green Comet)"
	elseif gActiveMods[RM].name:find("\\#66ff82\\Luigi \\#ffffff\\& \\#ff66fa\\The Violet Stars") then RH_Name = "Luigi & The Violet Stars"
	elseif gActiveMods[RM].name:find("\\#074916\\Luigi and the Forest Ruins\\#ffffff\\") then RH_Name = "Luigi and the Forest Ruins"
	elseif (gActiveMods[RM].name:find("Luigi's Mansion 64") and not gActiveMods[RM].name:find(".5")) then RH_Name = "Luigi's Mansion 64"
	elseif (gActiveMods[RM].name:find("Luigi's Mansion 64") and gActiveMods[RM].name:find(".5")) then RH_Name = "Luigi's Mansion 64.5"
	elseif gActiveMods[RM].name:find("\\#fc2819\\Mario \\#3ffc19\\In The \\#19fcea\\Colorful Lands") then RH_Name = "Mario In The Colorful Lands"
	elseif (gActiveMods[RM].name:find("Mario's Treasure Dome") and gActiveMods[RM].name:find("The Revival")) then RH_Name = "Mario's Treasure Dome: The Revival"
	elseif gActiveMods[RM].name:find("Only Up 64") then RH_Name = "Only Up 64"
	elseif (gActiveMods[RM].name:find("\\#ffffff\\Shining Stars") and gActiveMods[RM].name:find("2 Mirror Madness")) then RH_Name = "Shining Stars 2: Mirror Madness"
	elseif (gActiveMods[RM].name:find("\\#ffffff\\Shining Stars") and not gActiveMods[RM].name:find("2 Mirror Madness")) then RH_Name = "Shining Stars"
	elseif gActiveMods[RM].name:find("Super Mario 64 \\#ff0000\\Extra") then RH_Name = "Super Mario 64 Extra"
	elseif gActiveMods[RM].name:find("Royal Legacy") then RH_Name = "SM64: Royal Legacy"
	elseif gActiveMods[RM].name:find("SM64: The Green Stars") then RH_Name = "SM64: The Green Stars"
	elseif gActiveMods[RM].name:find("Twisted Adventures") then RH_Name = "SM64: Twisted Adventures"
	elseif gActiveMods[RM].name:find("Sonic Adventure 64 DX") then RH_Name = "Sonic Adventure 64 DX"
	elseif gActiveMods[RM].name:find("Star Revenge 1: Star Takeover") then RH_Name = "Star Revenge 1: Star Takeover"
	elseif (gActiveMods[RM].name:find("Star Revenge 1.3") and gActiveMods[RM].name:find("- Redone")) then RH_Name = "Star Revenge 1.3 Redone"
	elseif gActiveMods[RM].name:find("Star Takeover Redone") then RH_Name = "Star Revenge 1.5: Star Takeover Redone"
	elseif gActiveMods[RM].name:find("Star Revenge 2: Night of Doom") then RH_Name = "Star Revenge 2: Night of Doom"
	elseif (gActiveMods[RM].name:find("Star Revenge 3") and gActiveMods[RM].name:find("Mario on An Saoire 64")) then RH_Name = "Star Revenge 3: Mario on An Saoire 64"
	elseif (gActiveMods[RM].name:find("Star Revenge 4") and gActiveMods[RM].name:find("The Kedama Takeover 64")) then RH_Name = "Star Revenge 4: The Kedama Takeover 64"
	elseif (gActiveMods[RM].name:find("Star Revenge 6") and gActiveMods[RM].name:find(".5")) then RH_Name = "Star Revenge 6.5"
	elseif gActiveMods[RM].name:find("Super Bell Thrill") then RH_Name = "Super Bell Thrill"
	elseif gActiveMods[RM].name:find("SM 64 Hidden Stars") then RH_Name = "SM64: Hidden Stars"
	elseif gActiveMods[RM].name:find("Super Mario 64 Into Bowser's Castle") then RH_Name = "SM64: Into Bowser's Castle"
	elseif gActiveMods[RM].name:find("Super Mario 64 Moonshine") then RH_Name = "SM64: Moonshine"
	elseif gActiveMods[RM].name:find("SM64 Paradise Island") then RH_Name = "SM64: Paradise Island"
	elseif gActiveMods[RM].name:find("pink star") then RH_Name = "SM64: Peach and the Pink Star"
	elseif gActiveMods[RM].name:find("SM64 \\#0f52ba\\Sapphire\\#ffffff\\") then RH_Name = "SM64 Sapphire"
	elseif gActiveMods[RM].name:find("SM64 \\#0f52ba\\Sapphire \\#00FF00\\Green Comet\\dcdcdc\\") then RH_Name = "SM64 Sapphire Green Comet"
	elseif gActiveMods[RM].name:find("\\#ff2b1c\\The \\#636363\\Mushroom \\#ffb742\\Cup") then RH_Name = "SM64: The Mushroom Cup"
	elseif gActiveMods[RM].name:find("The Underworld") then RH_Name = "SM64: The Underworld"
	elseif gActiveMods[RM].name:find("Super Mario 64 Trouble Town") then RH_Name = "SM64: Trouble Town"
	elseif gActiveMods[RM].name:find("Super Mario 74") and gActiveMods[RM].name:find("(+EE)") then RH_Name = "Super Mario 74"
	elseif gActiveMods[RM].name:find("Ten Years After") then RH_Name = "SM74: Ten Years After"
	elseif gActiveMods[RM].name:find("Super Mario and the Marvel Adventure") then RH_Name = "Super Mario and the Marvel Adventure"
	elseif gActiveMods[RM].name:find("Super Mario Rainbow Road") then RH_Name = "Super Mario Rainbow Road"
	elseif (gActiveMods[RM].name:find("Star Road") and not gActiveMods[RM].name:find("The Replica Comet")) then RH_Name = "Star Road"
	elseif (gActiveMods[RM].name:find("Star Road") and gActiveMods[RM].name:find("The Replica Comet")) then RH_Name = "Star Road: The Replica Comet"
	elseif gActiveMods[RM].name:find("The Galactic Journey") then RH_Name = "Super Mario The Galactic Journey"
	elseif gActiveMods[RM].name:find("The Power Star Journey") then RH_Name = "Super Mario The Power Star Journey"
	elseif gActiveMods[RM].name:find("Super Retro Land") then RH_Name = "Super Retro Land"
	elseif gActiveMods[RM].name:find("The Phantom's Call") then RH_Name = "The Phantom's Call"
	elseif (gActiveMods[RM].name:find("Thousand") and gActiveMods[RM].name:find("Year Door 64")) then RH_Name = "Thousand Year Door 64"
	elseif gActiveMods[RM].name:find("\\#0c33c2\\Ztar Attack \\#c20c0c\\2") then RH_Name = "Ztar Attack 2"
	elseif gActiveMods[RM].name:find("Roblox 64") then RH_Name = "Roblox 64"
	elseif gActiveMods[RM].name:find("The Green Comet") then RH_Name = "SM64: The Green Comet" 
	elseif gActiveMods[RM].name:find("Return To Retroland") then RH_Name = "Return To Retroland" 
	elseif gActiveMods[RM].name:find("\\#7a5b1b\\Somari \\#aee1fe\\64: \\#fe8c0f\\DASH!") then RH_Name = "Somari 64: DASH!"
	elseif gActiveMods[RM].name:find("\\#1775FF\\Super \\#EC1905\\Mario \\#00FF8C\\Fallen \\#B700B7\\Stars") then RH_Name = "Super Mario Fallen Stars"
	elseif gActiveMods[RM].name:find("Super \\#00278B\\Banjo-") and gActiveMods[RM].name:find("\\#FF1A0F\\Kazooie 64\\#FFFFFF\\ REDUX") then RH_Name = "Super Banjo Kazooie 64 Redux"
	elseif gActiveMods[RM].name:find("\\#383bfc\\Star Revenge 4.5: \\#ffed24\\The Kedama Takeover Redone") then RH_Name = "Star Revenge 4.5: The Kedama Takeover Redone"
	elseif gActiveMods[RM].name:find("\\#00FFFF\\Star Revenge \\#0033FF\\5 \\#0062FF\\Neo Blue Realm") then RH_Name = "Star Revenge 5: Neo Blue Realm"
	elseif gActiveMods[RM].name:find("\\#0A8DFF\\Super Mario \\#FFFF00\\8MB\\#FFCD00\\") then RH_Name = "Super Mario 8MB"
	elseif gActiveMods[RM].name:find("Super Mario Star") then RH_Name = "Super Mario Star"
	elseif gActiveMods[RM].name:find("\\#905028\\Goomba's Easter Egg Hunt") then RH_Name = "Goomba's Easter Egg Hunt"
    end
end

krb2timer = 21
function str_romhack_hook_update()
if RH_Name ~= "None" or CRH_Name ~= "None" then
STRGST.AddRomhack = true
end 
if (RH_Name == "Green Star Revenge 1" or RH_Name == "SM64: Royal Legacy" or RH_Name == "Thousand Year Door 64") then
if OmmEnabled then
_G.OmmApi.omm_disable_feature("trueNonStop", true)
end
end

 -- Only Grand Star
if (RH_Name == "Green Star Revenge 1" or RH_Name == "Luigi & The Violet Stars" or (RH_Name == "Luigi's Mansion 64" or RH_Name == "Luigi's Mansion 64.5")
or RH_Name == "Shining Stars" or RH_Name == "SM64: The Green Stars" or RH_Name == "SM64: Twisted Adventures" or RH_Name == "Star Revenge 1.3 Redone"
or RH_Name == "Star Revenge 1.5: Star Takeover Redone" or RH_Name == "Star Revenge 2: Night of Doom" or RH_Name == "SM64: Into Bowser's Castle"
or RH_Name == "SM64: The Underworld" or RH_Name == "Super Mario 74" or RH_Name == "SM74: Ten Years After" or RH_Name == "Super Mario The Power Star Journey"
or RH_Name == "Star Revenge 4.5: The Kedama Takeover Redone" or RH_Name == "Super Mario Star") then
STRGST.GrandStar = true
end

-- Only End Picture
if (RH_Name == "Despair Mario's Gambit" or RH_Name == "Katze Stuck in the Toilet 64" or RH_Name == "Lug's Delightful Dioramas (Green Comet)"
or RH_Name == "Luigi and the Forest Ruins" or RH_Name == "Super Mario 64 Extra" or RH_Name == "Star Revenge 1: Star Takeover"
or RH_Name == "SM64: Hidden Stars" or (RH_Name == "SM64 Sapphire" or RH_Name == "SM64 Sapphire Green Comet") or RH_Name == "Super Retro Land"
or RH_Name == "The Phantom's Call" or RH_Name == "Thousand Year Door 64" or RH_Name == "Star Revenge 5: Neo Blue Realm") then
STRGST.CakeEnding = true
end

-- Only Grand Star and End Picture (Incase if a Romhack gets a Update)
if (RH_Name == "Mario In The Colorful Lands" or RH_Name == "Mario's Treasure Dome: The Revival" or RH_Name == "Shining Stars 2: Mirror Madness" or RH_Name == "SM64: Royal Legacy"
or RH_Name == "Star Revenge 4: The Kedama Takeover 64" or RH_Name == "SM64: Paradise Island" or RH_Name == "SM64: Peach and the Pink Star" or RH_Name == "SM64: The Mushroom Cup") then
STRGST.GrandStar = true STRGST.CakeEnding = true
end

if STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then
if RH_Name == "King Boo's Revenge 2" then
STRGST.AddRomhack = true
if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and gMarioStates[0].pos.y > 11000 and gMarioStates[0].pos.y < 11600 and gMarioStates[0].action == ACT_DISAPPEARED then
	krb2timer = krb2timer - 1
end
	if krb2timer < 2 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS then	
	warp_to_start_level() -- <- this to prevent you softlock on the pipe (despite that was supposed to do that)
	end
	
	if gNetworkPlayers[0].currLevelNum ~= LEVEL_BITS then	
	krb2timer = 21 
	end
	
	if gNetworkPlayers[0].currLevelNum == LEVEL_BITS and gMarioStates[0].action == ACT_DISAPPEARED and gMarioStates[0].pos.y > 11000 and gMarioStates[0].pos.y < 11600 and krb2timer < 2 then
	STRGST.STRGameState = "Finished"
		end
	end
end

-- Custom Colors Support
if RH_Name == "Despair Mario's Gambit" then
STRNumbers = true STRWords = true STRQuotes = false

elseif RH_Name == "Luigi and the Forest Ruins" then
STRNumbers = true STRWords = false STRQuotes = false

elseif (RH_Name == "Luigi's Mansion 64" or RH_Name == "Luigi's Mansion 64.5") then
STRNumbers = true STRWords = true STRQuotes = true

elseif (RH_Name == "SM64 Sapphire" or RH_Name == "SM64 Sapphire Green Comet") then
STRNumbers = false STRWords = true STRQuotes = false
end

-- Custom Run Names
if STRGST.GrandStar == true and STRGST.CakeEnding == false then
RH_Run_Name = "Grand Star"
elseif STRGST.GrandStar == false and STRGST.CakeEnding == true then
RH_Run_Name = "Cake Ending"
elseif STRGST.GrandStar == true and STRGST.CakeEnding == true then
RH_Run_Name = "Grand Star and Cake Ending"
elseif RH_Name == "Beat Block Beatdown" or RH_Name == "King Boo's Revenge 2" then
RH_Run_Name = "Enter The Last Pipe"
elseif RH_Name == "Eternal Realm" then
RH_Run_Name = "Bowser's Key 1"
elseif RH_Name == "SM64: Trouble Town" then
RH_Run_Name = "30 Stars"
elseif RH_Name == "Return To Retroland" then
RH_Run_Name = "5 Stars"
elseif RH_Name == "Somari 64: DASH!" then
RH_Run_Name = "Mips Star 1"
elseif RH_Name == "Super Mario Fallen Stars" then
RH_Run_Name = "24 Stars"
elseif RH_Name == "Super Banjo Kazooie 64 Redux" then
RH_Run_Name = "18 Stars"
elseif RH_Name == "Only Up 64" or RH_Name == "Roblox 64" then
RH_Run_Name = "1 Star"
elseif RH_Name == "Star Revenge 6.5" then
RH_Run_Name = "Red Coin Star in The Castle"
elseif RH_Name == "Super Mario and the Marvel Adventure" then
RH_Run_Name = "Star in White Void"
elseif RH_Name == "Super Mario The Galactic Journey" then
RH_Run_Name = "Star After Beating King Bob-omb"
elseif RH_Name == "Super Mario 8MB" then
RH_Run_Name = "12 Stars"
elseif RH_Name == "Goomba's Easter Egg Hunt" then
RH_Run_Name = "20 Easter Eggs"
end

-- Save Check
if RH_Name == "SM64: The Green Comet" then
STRGST.SFSWingCap = "No Erase"
STRGST.SFSMetalCap = "No Erase"
STRGST.SFSVanishCap = "No Erase"
STRGST.SFSDDDMovedBack = "No Erase"
STRGST.SFSMoatDrain = "No Erase"
STRGST.SFS50StarDoor = "No Erase"
STRGST.SFSBasementDoor = "No Erase"
STRGST.SFSBTIDWDoor = "No Erase"
STRGST.SFSBITFSDoor = "No Erase"
STRGST.SFSCCMDoor = "No Erase"
STRGST.SFSJRBDoor = "No Erase"
STRGST.SFSPSSDoor = "No Erase"
STRGST.SFSUpstairsDoor = "No Erase"
STRGST.SFSWFDoor = "No Erase"
STRGST.SFSKeys = "No Erase"
elseif RH_Name == "Super Banjo Kazooie 64 Redux" then
STRGST.SFSWingCap = "No Erase"
end

-- Star Road Plugin
if RH_Name == "Star Road" or RH_Name == "Star Road: The Replica Comet" then
_G.STRApi.add_plugin_slot(1, gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
_G.STRApi.add_plugin_slot(2, gMarioStates[0].numStars >= 20 and save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0)
_G.STRApi.add_plugin_slot(3, gMarioStates[0].numStars >= 65 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
_G.STRApi.add_plugin_slot(4, gMarioStates[0].numStars >= 80 and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
_G.STRApi.add_plugin_slot(5, gMarioStates[0].numStars >= 130)
elseif RH_Name == "Star Road: The Replica Comet" then
_G.STRApi.add_plugin_slot(6, gMarioStates[0].numStars >= 150)
end
end

function str_romhack_mario_update(m)
if STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then
if (RH_Name == "Beat Block Beatdown" and m.action == ACT_SPAWN_SPIN_AIRBORNE and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE_GROUNDS and gNetworkPlayers[0].currAreaIndex == 1) 
or (RH_Name == "Eternal Realm" and save_file_get_flags() & SAVE_FLAG_HAVE_KEY_1 ~= 0) 
or (RH_Name == "SM64: Trouble Town" and m.numStars >= 30)
or (RH_Name == "Return To Retroland" and m.numStars >= 5) 
or (RH_Name == "Somari 64: DASH!" and m.numStars >= 6 and save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0) 
or (RH_Name == "Super Mario Fallen Stars" and m.numStars >= 24)
or (RH_Name == "Super Banjo Kazooie 64 Redux" and m.numStars >= 18) 
or (RH_Name == "Super Mario 8MB" and m.numStars >= 12)
or (RH_Name == "Goomba's Easter Egg Hunt" and m.numStars >= 20) then
STRGST.STRGameState = "Finished"
end

if RH_Name == "Lug's Delightful Dioramas" then
_G.STRApi.add_plugin_slot(1, m.numStars >= 64 and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
_G.STRApi.add_plugin_slot(2, m.numStars >= 74)
elseif RH_Name == "Sonic Adventure 64 DX" then
_G.STRApi.add_plugin_slot(2, m.numStars >= 3)
elseif RH_Name == "Star Revenge 3: Mario on An Saoire 64" then
_G.STRApi.add_plugin_slot(1, m.numStars >= 1 and gNetworkPlayers[0].currLevelNum == LEVEL_BITFS)
_G.STRApi.add_plugin_slot(2, m.numStars >= 36 and gNetworkPlayers[0].currLevelNum == LEVEL_BITFS)
_G.STRApi.add_plugin_slot(3, m.numStars >= 65)
elseif RH_Name == "Star Revenge 3: Mario on An Saoire 64" then
_G.STRApi.add_plugin_slot(2, m.numStars >= 7)
elseif RH_Name == "SM64: Moonshine" then
_G.STRApi.add_plugin_slot(2, m.numStars >= 50)
elseif RH_Name == "Super Mario Rainbow Road" then
_G.STRApi.add_plugin_slot(2, m.numStars >= 60)
elseif RH_Name ==  "Ztar Attack 2" then
_G.STRApi.add_plugin_slot(1, save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0)
_G.STRApi.add_plugin_slot(2, (save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0))
_G.STRApi.add_plugin_slot(3, m.numStars >= 81 and save_file_get_flags() & SAVE_FLAG_HAVE_WING_CAP ~= 0)
_G.STRApi.add_plugin_slot(4, m.numStars >= 91 and save_file_get_flags() & SAVE_FLAG_COLLECTED_MIPS_STAR_1 ~= 0)
elseif RH_Name == "SM64: The Green Comet" then
if not OmmEnabled then
_G.STRApi.add_plugin_slot(1, m.numStars >= 121)
_G.STRApi.add_plugin_slot(2, m.numStars >= 145)
else
_G.STRApi.add_plugin_slot(2, m.numStars >= 121)
_G.STRApi.add_plugin_slot(3, m.numStars >= 145)
end
end
end
end

function str_romhack_interact(m, o, type)
if STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 then 
if ((RH_Name == "Only Up 64" or RH_Name == "Roblox 64") and type == INTERACT_STAR_OR_KEY) 
or (RH_Name == "Star Revenge 6.5" and type == INTERACT_STAR_OR_KEY and o.oBehParams == 5 << 24 and gNetworkPlayers[0].currLevelNum == LEVEL_CASTLE)
or (RH_Name == "Super Mario and the Marvel Adventure" and type == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING)
or (RH_Name == "Super Mario The Galactic Journey" and type == INTERACT_STAR_OR_KEY and gNetworkPlayers[0].currLevelNum == LEVEL_TOTWC) then
STRGST.STRGameState = "Finished"
end

if (RH_Name == "Sonic Adventure 64 DX" or RH_Name == "Super Bell Thrill") then
_G.STRApi.add_plugin_slot(1, gNetworkPlayers[0].currLevelNum == LEVEL_BOB and type == INTERACT_STAR_OR_KEY and o.oBehParams == 0 << 24)
elseif RH_Name == "SM64: Moonshine" then
_G.STRApi.add_plugin_slot(1, m.numStars >= 31 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_BITS)
elseif RH_Name == "Super Mario Rainbow Road" then
_G.STRApi.add_plugin_slot(1, m.numStars >= 54 and get_id_from_behavior(o.behavior) == id_bhvStar and gNetworkPlayers[0].currLevelNum == LEVEL_SA)
elseif RH_Name ==  "Ztar Attack 2" then
_G.STRApi.add_plugin_slot(5, ((save_file_get_flags() & (SAVE_FLAG_HAVE_KEY_1 and SAVE_FLAG_HAVE_KEY_2 and SAVE_FLAG_HAVE_METAL_CAP and SAVE_FLAG_HAVE_VANISH_CAP and SAVE_FLAG_HAVE_WING_CAP) ~= 0) 
and gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and interactType == INTERACT_STAR_OR_KEY and o.oBehParams == 2 << 24))
elseif RH_Name == "SM64: The Green Comet" and OmmEnabled then
_G.STRApi.add_plugin_slot(1, gNetworkPlayers[0].currLevelNum == LEVEL_ENDING and gNetworkPlayers[0].currAreaIndex == 2 and type == INTERACT_STAR_OR_KEY)
end
end
end

function romhack_rules()
if STRMenuDisplay == false and RH_Name ~= "None" and CRH_Name == "None" then
	Size = 0.75
	Height = 32 * Size
	Width = 0 * Size
	X = (S_Width() - Width) / 2.0
	Y = (S_Height() - Height) / 2.0
	
	if RH_Name == "Beat Block Beatdown" then
	shadow_text("Any%", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with any Amount of Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("5 Star", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with All 5 Stars", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Despair Mario's Gambit" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Clip through Doors and Enter the Pipe", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("53 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 53 Stars and Enter the Pipe", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 53 Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 120 Stars and Enter the Pipe", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("53 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 53 Stars and Enter the Pipe", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 53 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 120 Stars and Enter the Pipe", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Eternal Realm" then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Clip through the Door and Grab the Key", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Make sure you get the WC and VC Before Doing This Run", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("25 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 25 Stars and Grab the Key", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("47 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 47 Stars and Grab the Key", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Green Star Revenge 1" then
	if not OmmEnabled then
	shadow_text("0 Green Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Skip both 8 and 30 Star doors by BLJs", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("1 Green Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect one Star in DDD after doing SBLJ", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("16 Green Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Stars and then Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("SBLJs are Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Green Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("BLJs/MIPS Clip are Banned", X - 70 , Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("133 Green Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 133 Stars", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("70 Green Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("MIPS Clip/Switching Moveset are Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("90 Green Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Only Collect 6 Stars in Each Main Level", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Castle Secret and 100 Coins Stars are Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("133 Green Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 133 Stars", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Katze Stuck in the Toilet 64" then
	if not OmmEnabled then
	shadow_text("0 Burgers", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Clip Through Doors and Enter the Warp", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("30 Burgers", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Burgers and Enter the Warp", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("40 Burgers", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 40 Burgers and Enter the Warp", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("30 Burgers", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Burgers and Enter the Warp", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("40 Burgers", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 40 Burgers and Enter the Warp", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "King Boo's Revenge 2" then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Clip Through Doors and Reach to the Pipe", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("110 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("182 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 182 Stars and Reach to the Pipe", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Lug's Delightful Dioramas" then
	shadow_text("64 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 64 Stars in this Romhack", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("74 Star", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 74 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Lug's Delightful Dioramas (Green Comet)" then
	shadow_text("Any%", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with any Amount of Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("80 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with All 80 Stars", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name ==  "Luigi & The Violet Stars" then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 1 Star and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("66 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("136 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 136 Stars and Reach to the Pipe", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Luigi and the Forest Ruins" then
	shadow_text("21 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 21 stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("40 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 40 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Luigi's Mansion 64" then
	shadow_text("100 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 100 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("111 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 111 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("118 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 118 Stars (Including Shiverside Station)", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Luigi's Mansion 64.5" then
	shadow_text("111 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 111 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Mario In The Colorful Lands" then
	shadow_text("50 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 50 stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("93 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 93 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Mario's Treasure Dome: The Revival" then
	shadow_text("Any%", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with any Amount of Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("125 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with All 125 Stars", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Only Up 64" or RH_Name == "Roblox 64" then
	shadow_text("1 Star", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Reach to the Top and Grab the Star", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Shining Stars: 2 Mirror Madness" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 155, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 155, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("10 Stars", X, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 10 Stars and Beat Bowser", X, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 10 Star Door is Banned", X, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("15 Stars", X - 155, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 15 Stars and Beat Bowser", X - 155, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping 10 and 15 Star Doors is Banned", X - 155, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("69 Stars", X, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 69 Stars and Beat Bowser", X, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping 10, 15 and 69 Star Doors is Banned", X, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("90 Stars", X - 155, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors cannot be Bypassed.", X - 155, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Star Doors is Banned", X - 155, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("122 Stars", X, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 122 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70 , Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("10 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 10 Stars and Beat Bowser", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 10 Star Door is Banned", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("15 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 15 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping 10 and 15 Star Doors is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("69 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 69 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping 10, 15 and 69 Star Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("90 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors cannot be Bypassed.", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Star Doors is Banned", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("122 Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 122 Stars and Beat Bowser", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70 , Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Shining Stars" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("121 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 121 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("151 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("121 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 121 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("151 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif (RH_Name == "Super Mario 64 Extra" or RH_Name == "SM64 Sapphire Green Comet" or RH_Name == "SM64: Trouble Town" 
	or (RH_Name == "The Phantom's Call" and not OmmEnabled)) or (RH_Name == "SM64: Peach and the Pink Star" and OmmEnabled) then
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 30 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Royal Legacy" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 30 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 30 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do with OMM Rebirth.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "SM64: The Green Stars" then
	shadow_text("80 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 80 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("131 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 131 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Twisted Adventures" then
	shadow_text("75 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 75 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("115 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 115 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("151 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Sonic Adventure 64 DX" then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Defeat King Whomp and Grab the Star", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("3 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 3 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 1: Star Takeover" then
	shadow_text("91 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 91 Stars and Enter the Pipe", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("101 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 101 Stars and Enter the Pipe", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 1.3 Redone" then
	shadow_text("106 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 106 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do?", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 1.5: Star Takeover Redone" then
	shadow_text("66 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 66 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("BLJs is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("125 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 125 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 2: Night of Doom" then
	shadow_text("90 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 90 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Clipping is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("160 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 160 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 3: Mario on An Saoire 64" then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 1 Star and Beat Wiggler", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("36 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 36 Stars and Beat Wiggler", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("65 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 65 Stars and Beat Wiggler", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 4: The Kedama Takeover 64" then
	if not OmmEnabled then
	shadow_text("35 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 35 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 35 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("97 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 97 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Star Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("100 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 100 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("0 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("35 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 35 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 35 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("97 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 97 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Star Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("100 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 100 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Star Revenge 6.5" then
	if not OmmEnabled then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 1 Star in the Castle", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 70 Star in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("70 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 70 Star in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do with OMM Rebirth.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Super Bell Thrill" then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text('Collect The "First" Star in this Romhack', X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("7 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 7 Star in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Hidden Stars" then
	shadow_text("0 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("10 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 10 Stars and Enter the Pipe", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Red Switch is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("56 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 97 Stars and Enter the Pipe", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Star Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("112 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 112 Stars and Enter the Pipe", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Into Bowser's Castle" then
	shadow_text("30 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 30 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 70 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Star Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 120 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Moonshine" then
	shadow_text("31 Moons", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 31 Moons in this Romhack", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("50 Moons", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 50 Moons in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: Paradise Island" then
	shadow_text("30 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Stars in this Romhack", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("50 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 50 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif (RH_Name == "SM64: Peach and the Pink Star" and not OmmEnabled) or RH_Name == "SM64 Sapphire" then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 30 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: The Mushroom Cup" then
	if not OmmEnabled then
	shadow_text("16 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Star and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("100 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 100 Stars and Go to the Shrine", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Doors is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("130 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 130 Stars and Go to the Shrine", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("0 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect The Shrine Stars for the Shrine Ending", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Clipping Out of Bounds is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("16 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Star and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Rooms is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("100 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 100 Stars and Go to the Shrine", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Doors is Banned", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("130 Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 130 Stars and Go to the Shrine", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70 , Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "SM64: The Underworld" then
	shadow_text("Grand Star", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Defeat Shitilizer and Grab The Grand Star", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Mario 74" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("10 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 10 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 10 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("50 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 50 Star and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 10 and 50 Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	if gNetworkPlayers[0].currAreaIndex == 1 then
	shadow_text("110 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 110 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Doors is Banned", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("151 Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70 , Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif gNetworkPlayers[0].currAreaIndex == 2 then
	shadow_text("125 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 125 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Doors is Banned", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("157 Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 157 Stars and Beat Bowser", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70 , Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	else
	if gNetworkPlayers[0].currAreaIndex == 1 then
	shadow_text("50 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 50 Star and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 10 and 50 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("110 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 110 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("151 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif gNetworkPlayers[0].currAreaIndex == 2 then
	shadow_text("125 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 125 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Doors is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("157 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 151 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	end
	elseif RH_Name == "SM74: Ten Years After" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 120 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("155 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 155 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("120 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 120 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("155 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 155 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Super Mario and the Marvel Adventure" then
	if not OmmEnabled then
	shadow_text("46 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 46 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("51 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 51 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("26 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect at least 26 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("46 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 46 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Getting to Bowser Early is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("51 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 51 Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Super Mario Rainbow Road" then
	shadow_text("54 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 54 Stars in this Romhack", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("60 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 60 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif (RH_Name == "Star Road" or RH_Name == "Star Road: The Replica Comet") then
	shadow_text("Any%", X - 155, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with any Amount of Stars", X - 155, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("80 Stars", X - 155, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 155, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 80 Star Door is Banned", X - 155, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("130 Stars", X - 155, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 130 Stars", X - 155, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("20 Stars", X, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Defeat the Plants and Grab the Key", X, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Clipping Out of Bounds is Banned", X, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("65 Stars", X, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Take the Cannon and Clip through the Door", X, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Castle Skip Except 80 Star Door Skip is Banned", X, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	if RH_Name == "Star Road: The Replica Comet" then
	shadow_text("150 Stars", X, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 130 Stars + 20 Extras", X, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X , Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Super Mario The Galactic Journey" then
	if not OmmEnabled then
	shadow_text("12 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 12 Stars and Beat King Bob-omb", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("24 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 24 Stars and Beat King Bob-omb", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 12 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("44 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 44 Stars and then King Bob-omb", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 12 and 42 Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("87 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("BLJs are Banned", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("102 Stars", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 102 Stars", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("44 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 24 Stars and Beat King Bob-omb", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The 12 and 42 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("87 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Climbing over the 87 Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("102 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 102 Stars", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Super Mario The Power Star Journey" then
	shadow_text("80 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect at least 80 Stars and Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("97 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 97 Stars and Beat Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Collecting 100 Coin Stars is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("101 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 97 Stars Including 100 Coin Stars and Beat Bowser", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Retro Land" then
	if not OmmEnabled then
	shadow_text("4 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 4 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game without Collecting Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("4 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 4 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "The Phantom's Call" and OmmEnabled then
	shadow_text("Any%", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat the Game with any Amount of Stars", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 30 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Thousand Year Door 64" then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("BLJ on a Pillar and Enter the Teleporter", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("30 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Stars and Enter the Teleporter", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 30 Star Door is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("80 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 80 Stars and Enter the Teleporter", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("30 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 30 Stars and Enter the Teleporter", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping the 30 Star Door is Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("80 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 80 Stars and Enter the Teleporter", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Ztar Attack 2" then
	shadow_text("Any%", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat Bowser as Quickly as Possible", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("Warpless Any%", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat Bowser while going through the game's 5 Main Worlds", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Form of World Skips and Warps are Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("81 Time Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect all the Time Stars between World 1 and 5 and Defeat Bowser.", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Form of World Skips and Warps are Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("91 Time Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 91 Time Stars", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any and all Skips and Warps are allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("All Bosses", X - 70, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Defeat All Bosses in Each Main Worlds", X - 70, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "SM64: The Green Comet" then
	if not OmmEnabled then
	shadow_text("121 Green Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 121 Green Stars in this Romhack", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("145 Green Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 24 More Green Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("You need to Collect All Main 121 Stars First", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("1 Green Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Cappy Jump Under The Pipe to Enter the Grandstar Trials", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("121 Green Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 121 Green Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Entering The Pipe Early is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("145 Green Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 24 More Green Stars in this Romhack", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("You need to Collect All Main 121 Stars First", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Somari 64: DASH!" then
	shadow_text("6 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 5 Stars and then Collect Mips Star", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Mario Fallen Stars" then
	shadow_text("24 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 24 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Banjo Kazooie 64 Redux" then
	shadow_text("18 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 18 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 4.5: The Kedama Takeover Redone" then
	shadow_text("50 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 50 Stars and Beat Rainbow Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping Star Doors are Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("100 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 100 Stars and Beat Rainbow Bowser", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Star Revenge 5: Neo Blue Realm" then
	shadow_text("1 Star", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Clip Through The Gate and Get The Blue Realm Ending", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("31 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 31 Stars and Get The Koopa Race Ending", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Skipping The Koopa Race is Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 70 Stars in this Romhack", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Mario 8MB" then
	shadow_text("12 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 12 Stars in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	elseif RH_Name == "Super Mario Star" then
	if not OmmEnabled then
	shadow_text("16 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Stars and then Beat Bowser", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("BLJs/MIPS Clip are Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("102 Green Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 102 Stars", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("70 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("BLJs/MIPS Clip are Banned", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("102 Green Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 102 Stars", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	elseif RH_Name == "Goomba's Easter Egg Hunt" then
	shadow_text("20 Easter Eggs", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect All 20 Easter Eggs in this Romhack", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("This is the Only Run you can do.", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 14, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	end
end

local function str_romhack_mods_loaded(m)
if STRMenuDisplay == false and RH_Name ~= "None" and CRH_Name == "None" then
if RH_Name == "Lug's Delightful Dioramas" then
_G.STRApi.add_run_slot(nil, 1, "64 Stars")
_G.STRApi.add_run_slot(nil, 2, "74 Stars")
elseif RH_Name == "Sonic Adventure 64 DX" then
_G.STRApi.add_run_slot(nil, 1, "1 Star")
_G.STRApi.add_run_slot(nil, 2, "3 Stars")
elseif RH_Name == "Star Revenge 3: Mario on An Saoire 64" then
_G.STRApi.add_run_slot(nil, 1, "1 Star")
_G.STRApi.add_run_slot(nil, 2, "36 Stars")
_G.STRApi.add_run_slot(nil, 3, "65 Stars")
elseif RH_Name == "Super Bell Thrill" then
_G.STRApi.add_run_slot(nil, 1, "1 Star")
_G.STRApi.add_run_slot(nil, 2, "7 Stars")
elseif RH_Name == "SM64: Moonshine" then
_G.STRApi.add_run_slot(nil, 1, "31 Stars")
_G.STRApi.add_run_slot(nil, 2, "50 Stars")
elseif RH_Name == "Super Mario Rainbow Road" then
_G.STRApi.add_run_slot(nil, 1, "54 Stars")
_G.STRApi.add_run_slot(nil, 2, "60 Stars")
elseif RH_Name == "Star Road" or RH_Name == "Star Road: The Replica Comet" then
_G.STRApi.add_run_slot(nil, 1, "Any%")
_G.STRApi.add_run_slot(nil, 2, "20 Stars")
_G.STRApi.add_run_slot(nil, 3, "65 Stars")
_G.STRApi.add_run_slot(nil, 4, "80 Stars")
_G.STRApi.add_run_slot(nil, 5, "130 Stars")
elseif RH_Name == "Star Road: The Replica Comet" then
_G.STRApi.add_run_slot(nil, 6, "150 Stars")
elseif RH_Name == "Ztar Attack 2" then
_G.STRApi.add_run_slot(nil, 1, "Any%")
_G.STRApi.add_run_slot(nil, 2, "Warpless Any%")
_G.STRApi.add_run_slot(nil, 3, "81 Time Stars")
_G.STRApi.add_run_slot(nil, 4, "91 Time Stars")
_G.STRApi.add_run_slot(nil, 5, "All Bosses")
elseif RH_Name == "SM64: The Green Comet" then
if not OmmEnabled then
_G.STRApi.add_run_slot(nil, 1, "121 Green Stars")
_G.STRApi.add_run_slot(nil, 2, "145 Green Stars")
else
_G.STRApi.add_run_slot(nil, 1, "1 Green Star")
_G.STRApi.add_run_slot(nil, 2, "121 Green Stars")
_G.STRApi.add_run_slot(nil, 3, "145 Green Stars")
end
end
end
end

hook_event(HOOK_ON_MODS_LOADED, str_romhack_mods_loaded)

