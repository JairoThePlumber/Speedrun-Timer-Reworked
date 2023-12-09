if gamemodes_is_checked or notallowedmods or no_cheats then return end

gamemodes_is_checked = false
moveset_is_check = false
other_moveset_mods = false
notallowedmods = false
indicatormods = false
no_cheats = false

for cheats_is_on in pairs(gActiveMods) do
    if gActiveMods[cheats_is_on].name:find("Cheats") then
        no_cheats = true
		djui_popup_create("\\#ff0000\\Cheats is not allowed! Rehost the Server without Cheats!", 2)
		break
    end
end

for moveset_is_on in pairs(gActiveMods) do
    if (gActiveMods[moveset_is_on].incompatible ~= nil and gActiveMods[moveset_is_on].incompatible:find("moveset")) then
        moveset_is_check = true
    end
end

for other_moveset_mods_is_on in pairs(gActiveMods) do
    if gActiveMods[other_moveset_mods_is_on].name:find("\\#ff5c26\\Yuyake Kasarion") or gActiveMods[other_moveset_mods_is_on].name:find("Sonic Character: \\#4084d9\\Rebooted") 
	or gActiveMods[other_moveset_mods_is_on].name:find("\\#ff9400\\Pasta \\#330062\\Castle ") or gActiveMods[other_moveset_mods_is_on].name:find("\\#ff6b91\\Veph the Dolphin-Fox") 
	or gActiveMods[other_moveset_mods_is_on].name:find("Minecraft") or gActiveMods[other_moveset_mods_is_on].name:find("Mari0") or gActiveMods[other_moveset_mods_is_on].name:find("Smash Brothers")
	or gActiveMods[other_moveset_mods_is_on].name:find("Yoshi moveset") or gActiveMods[other_moveset_mods_is_on].name:find("\\#FFFF00\\Lum\\#00FFFF\\oves") 
	or gActiveMods[other_moveset_mods_is_on].name:find("\\#de04fa\\Milne the Crystal Fox") or gActiveMods[other_moveset_mods_is_on].name:find("\\#ad5fb7\\Hat Kid") 
	or gActiveMods[other_moveset_mods_is_on].name:find("\\#c0e36f\\Boyo!\\#c0e36f\\") or gActiveMods[other_moveset_mods_is_on].name:find("Sonic Character") 
	or gActiveMods[other_moveset_mods_is_on].name:find("Only Up 64 Plugin") then
        other_moveset_mods = true
    end
end

for gamemodes_is_on in pairs(gActiveMods) do
	if (gActiveMods[gamemodes_is_on].name:find("Super Mario Kart 64")) or (gActiveMods[gamemodes_is_on].name:find("Red/Green Light")) then
		gamemodes_is_checked = true
        djui_popup_create("\\#ff0000\\".. gActiveMods[gamemodes_is_on].name .. " \\#ff0000\\is also not Compatible for Speedrun Timer Reworked", 2)
	break
end
	
    if (gActiveMods[gamemodes_is_on].incompatible ~= nil and gActiveMods[gamemodes_is_on].incompatible:find("gamemode")) and not 
	(gActiveMods[gamemodes_is_on].name:find("Personal Star Counter") or gActiveMods[gamemodes_is_on].name:find("Verbose Notifications")) then
            gamemodes_is_checked = true
            djui_popup_create("\\#ff0000\\".. gActiveMods[gamemodes_is_on].name .. " \\#ff0000\\is not Compatible for Speedrun Timer Reworked", 2)
		break
	end
end

for indicator_mods_is_on in pairs(gActiveMods) do
	if gActiveMods[indicator_mods_is_on].name:find("Indicator") or gActiveMods[indicator_mods_is_on].name:find("Personal Star Counter") then
       indicatormods = true
    end
end

-- These are the mods that are not allowed in a speedrun
for no_allowed_mods in pairs(gActiveMods) do
if gActiveMods[no_allowed_mods].name:find("Wega Jumpscare") or gActiveMods[no_allowed_mods].name:find("Random Wega Jumpscare") 
   or gActiveMods[no_allowed_mods].name:find("Object Spawner") or gActiveMods[no_allowed_mods].name:find("Faster Bubble Speed V4")
   or gActiveMods[no_allowed_mods].name:find("Anti-Instakills v1.0.3") or gActiveMods[no_allowed_mods].name:find("Instakills")
   or gActiveMods[no_allowed_mods].name:find("Remove Star Spawn Cutscenes") or gActiveMods[no_allowed_mods].name:find("Faster Swimming")
   or gActiveMods[no_allowed_mods].name:find("Death Crash") or gActiveMods[no_allowed_mods].name:find("Random Objects") 
   or gActiveMods[no_allowed_mods].name:find("Clones") or gActiveMods[no_allowed_mods].name:find("Falling Bombs")
   or gActiveMods[no_allowed_mods].name:find("Door Bust") or gActiveMods[no_allowed_mods].name:find("Complete Save")
   or gActiveMods[no_allowed_mods].name:find("WIND") or gActiveMods[no_allowed_mods].name:find("Savestates")
   or gActiveMods[no_allowed_mods].name:find("Save and Load Position") then
	djui_popup_create("\\#ff0000\\".. gActiveMods[no_allowed_mods].name .. " \\#ff0000\\is not Allowed For Speedrunning, Please Remove it!", 2)
	notallowedmods = true
    end
end