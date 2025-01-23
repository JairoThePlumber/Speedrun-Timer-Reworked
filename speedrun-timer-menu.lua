if gamemodes_is_checked or notallowedmods or no_cheats then return end

-- Both Menus
globalFont = FONT_NORMAL
hudFont = FONT_CUSTOM_HUD
yhudposition = -228 
yhudposition2 = 228 
scale = 1
color = "#000000"
creditscale = 1
creditcolor = "#FFFFFF"
ArrowPositionUp = -90
ArrowPositionLRUp = -131
ArrowPositionDown = 0
ArrowPositionLRDown = 0
ArrowPositionLeft = 0
ArrowPositionUDLeft = 0
ArrowPositionRight = 0
ArrowPositionUDRight = 0
MenuInputCheck = 0
MenuStickX = 0
MenuStickY = 0
SwitchingMenus = 1
DisableTeams = false
DelayCheck = 0
Secondstopress = 10
StickTimerRight = 5
StickTimerLeft = 5
StickTimerUp = 5
StickTimerDown = 5
DpadTimerRight = 3
DpadTimerLeft = 3
DpadTimerUp = 3
DpadTimerDown = 3

-- Str Menu
MainOptions = 1
StartText = "Start"
GrayColor = "#FFFFFF"
RunsColor = "#FFFFFF"
RunPositionColor = "#FFFFFF"
CDNumbers = 5
StrOption = 0
SelectedExtra = 0
ExtraOptionUD = 1
ExtraOptionLR = 1
RunsOptions = 1
RunsMenus = 0
RunsSPSelected = 0
RunsSPLRMovement = 0
RunsSPUDMovement = 0
RunsLFSelected = 0
RunsLFLRMovement = 0
RunsLFUDMovement = 0
RunsLFPages = 0
GamemodeText = "Normal"
StartingText = "Both"
TeamsText = "Disabled"
PositionColors = "#FFFFFF"
LevelFunctionsColors = "#FFFFFF"
AntiCheatsMenuColors = "#FFFFFF"
gGlobalSyncTable.SavedRunName = "None"
StartingLevelText = "None"
ForcedSettingText = "None"
WarpSettingText = "None"
RunsName = ""
RunsSlotColor = "#FFFFFF"
AntiCheatName = ""
SingleStarsUDMovement = 1
DisableIntro = false
openstrmenu = false
IntroText = "Press R to Enabled Intro"
BackupSlotText = "Disabled"

-- Config menu
Fonts_names = ""
Fanfare_names = ""
Countdown_names = ""
Go_names = ""
Switch_Color_text = ""
commandmenuname = "Buttons Toggle"
SetColorCheck = "#FFFFFF"
SetSlotColorCheck = "#FFFFFF"
ChangeTimerColor = "#FFFFFF"
ChangeRulesColor = "#FFFFFF"
ChangeHelperColor = "#FFFFFF"
TeamColor = "#7a7a7a"
TeamOptionColor = "#7a7a7a"
WarpColor = "#FFFFFF"
DisplayFontSettings = "#7a7a7a"
buttonispressed = 0
MenuOptions = 1
SettingsOptions = 1
Menus = 1
SelectFont = 1
FontSettings = 0
FontMenuOptions = 1
ExtraFont = 0
ColorOptions = 1
SwitchColorOptions = 0
PositionsMenuOptions = 1
SoundsSettings = 1
PlayersText = "Press A to Select, Press B to Close the Menu"
openmenu = false

save_func = 0

-- This is also From Character Select (Thanks to Squishy)
function Saving_Function(m)
	if save_func == 1 then
	DefaultName = load_fonts()
	FanfareName = load_custom_fanfare()
	CountdownName = load_custom_countdown()
	GoName = load_custom_go()
	if gGlobalSyncTable.GamemodeSetting == "Casual" and network_is_server() then
	gGlobalSyncTable.CasualTimer = true
	gGlobalSyncTable.RunStarting = true
	end
	end
	
	if save_func < 2 then
        save_func = save_func + 1
    end
	
	if gGlobalSyncTable.ResetSaveCheck == true then
	if gGlobalSyncTable.ResetSave >= 1 and network_is_server() then
	gGlobalSyncTable.ResetSave = gGlobalSyncTable.ResetSave - 1
	end
	str_packetreceive()
	end
	
	if gGlobalSyncTable.ResetSave <= 1 then
	gGlobalSyncTable.ResetSaveCheck = false
	gGlobalSyncTable.ResetSave = 10
	end
	
	if gGlobalSyncTable.ResettingTimer == true and gGlobalSyncTable.GamemodeSetting == "Normal" then
	if gGlobalSyncTable.ResetTimer >= 1 and network_is_server() then
	gGlobalSyncTable.ResetTimer = gGlobalSyncTable.ResetTimer - 1
	end
	gGlobalSyncTable.SingleStarsMode = false
	gGlobalSyncTable.Intermission = false
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.timer_popup = false
	gGlobalSyncTable.RunStarting = false
	gGlobalSyncTable.anti_cheat = false
	gGlobalSyncTable.EnabledIntro = false
	gGlobalSyncTable.IntroCheck = 0
	gGlobalSyncTable.startglobaltimer = 0
	gGlobalSyncTable.startcountdown = 0
	gGlobalSyncTable.GoTimer = 0
	gGlobalSyncTable.Intercountdown = 6
	warp_to_start_level()
	set_warp_check = false
	freeze_check = false
	FreezePlayers = false
	incompatible_warp = false
	gGlobalSyncTable.countdown_display_check = 31
	startTimerbutton = false
	gGlobalSyncTable.TeamsCheck = false
	if CDNumbers ~= nil then
		CDNumbers = clamp(CDNumbers, 0, 50)
		gGlobalSyncTable.timercountdown = CDNumbers * 30 + 60 
	end
	if not gGlobalSyncTable.set_countdown_numbers then
	gGlobalSyncTable.timercountdown = 5 * 30
	end
	end
	
	if gGlobalSyncTable.ResettingTimer == true and gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
	if gGlobalSyncTable.ResetTimer >= 1 and network_is_server() then
	gGlobalSyncTable.ResetTimer = gGlobalSyncTable.ResetTimer - 1
	end
	gGlobalSyncTable.SingleStarsMode = false
	gGlobalSyncTable.Intermission = false
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.timer_popup = false
	gGlobalSyncTable.RunStarting = false
	gGlobalSyncTable.anti_cheat = false
	gGlobalSyncTable.EnabledIntro = false
	gGlobalSyncTable.IntroCheck = 0
	gGlobalSyncTable.startglobaltimer = 0
	gGlobalSyncTable.startcountdown = 0
	gGlobalSyncTable.GoTimer = 0
	gGlobalSyncTable.Intercountdown = 6
	gGlobalSyncTable.timercountdown = 0
	startTimerbutton = false
	set_warp_check = false
	gGlobalSyncTable.TeamsCheck = false
	warp_to_start_level()
	end
	
	if gGlobalSyncTable.ResettingTimer == true and gGlobalSyncTable.GamemodeSetting == "Casual" then
	if gGlobalSyncTable.ResetTimer >= 1 and network_is_server() then
	gGlobalSyncTable.ResetTimer = gGlobalSyncTable.ResetTimer - 1
	end
	gGlobalSyncTable.SingleStarsMode = false
	gGlobalSyncTable.Intermission = false
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.timer_popup = false
	gGlobalSyncTable.anti_cheat = false
	gGlobalSyncTable.EnabledIntro = false
	gGlobalSyncTable.IntroCheck = 0
	gGlobalSyncTable.startglobaltimer = 0
	gGlobalSyncTable.startcountdown = 0
	gGlobalSyncTable.GoTimer = 0
	gGlobalSyncTable.Intercountdown = 6
	warp_to_start_level()
	set_warp_check = false
	freeze_check = false
	FreezePlayers = false
	incompatible_warp = false
	gGlobalSyncTable.countdown_display_check = 31
	startTimerbutton = false
	gGlobalSyncTable.TeamsCheck = false
	if CDNumbers ~= nil then
		CDNumbers = clamp(CDNumbers, 0, 50)
		gGlobalSyncTable.timercountdown = CDNumbers * 30 + 60 
	end
	if not gGlobalSyncTable.set_countdown_numbers then
	gGlobalSyncTable.timercountdown = 5 * 30
	end
	end
	
	if gGlobalSyncTable.ResettingTimer == true and gGlobalSyncTable.GamemodeSetting == "SingleStars" then
	if gGlobalSyncTable.ResetTimer >= 1 and network_is_server() then
	gGlobalSyncTable.ResetTimer = gGlobalSyncTable.ResetTimer - 1
	end
	gGlobalSyncTable.SingleStarsMode = false
	gGlobalSyncTable.Intermission = false
	gGlobalSyncTable.startTimer = false
	gGlobalSyncTable.beatedGame = false
	gGlobalSyncTable.RunStarting = false
	gGlobalSyncTable.timer_popup = false
	gGlobalSyncTable.anti_cheat = false
	gGlobalSyncTable.EnabledIntro = false
	gGlobalSyncTable.IntroCheck = 0
	gGlobalSyncTable.startglobaltimer = 0
	gGlobalSyncTable.startcountdown = 0
	gGlobalSyncTable.GoTimer = 0
	gGlobalSyncTable.Intercountdown = 6
	warp_to_start_level()
	set_warp_check = false
	freeze_check = false
	FreezePlayers = false
	incompatible_warp = false
	gGlobalSyncTable.countdown_display_check = 31
	startTimerbutton = false
	end
	
	if gGlobalSyncTable.ResetTimer == 0 then
	gGlobalSyncTable.ResettingTimer = false
	gGlobalSyncTable.ResetTimer = 5
	end
end

function SwitchingMenusCheck(m)
	-- This is to the prevent the menu to softlock someone while being in the menu
	if gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
	if (m.action == ACT_EXIT_LAND_SAVE_DIALOG 
	or m.action == ACT_EXIT_AIRBORNE
	or m.action == ACT_FALLING_DEATH_EXIT
	or m.action == ACT_DEATH_EXIT 
	or m.action == ACT_DEATH_EXIT_LAND
	or m.action == ACT_SPECIAL_DEATH_EXIT 
	or m.action == ACT_SPECIAL_EXIT_AIRBORNE
	or m.action == ACT_STAR_DANCE_EXIT 
	or m.action == ACT_STAR_DANCE_NO_EXIT
	or m.action == ACT_STAR_DANCE_WATER
	or m.action == ACT_FALL_AFTER_STAR_GRAB
	or (_G.OmmEnabled and m.action == _G.OmmApi["ACT_OMM_STAR_DANCE"])) then
	openmenu = false
	openstrmenu = false
	end
	end
	
	if Secondstopress == 0 then
	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchingMenus == 1 and StrOption == 0 and network_is_server() then
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
        openstrmenu = false
        openmenu = true	
		SwitchingMenus = 2
		Secondstopress = 10
		end
	end
	
	if Secondstopress == 0 then
	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchingMenus == 2 and Menus == 1 and network_is_server() then
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
        openmenu = false
		openstrmenu = true
		SwitchingMenus = 1
		Secondstopress = 10
		end
	end
	
	if (openmenu or openstrmenu) then 
	if not (m.controller.rawStickX < 129 and m.controller.rawStickX > 110) then
	StickTimerRight = 0
	else
	if (m.controller.rawStickX < 129 and m.controller.rawStickX > 110) and StickTimerRight >= 1 then
		StickTimerRight = StickTimerRight - 1
		else
		StickTimerRight = 5
		end
	end
	
	if not (m.controller.rawStickX < -110 and m.controller.rawStickX > -129) then
	StickTimerLeft = 0
	else
	if (m.controller.rawStickX < -110 and m.controller.rawStickX > -129) and StickTimerLeft >= 1 then
		StickTimerLeft = StickTimerLeft - 1
		else
		StickTimerLeft = 5
		end
	end
	
	if not (m.controller.rawStickY < 129 and m.controller.rawStickY > 110) then
	StickTimerDown = 0
	else
	if (m.controller.rawStickY < 129 and m.controller.rawStickY > 110) and StickTimerDown >= 1 then
		StickTimerDown = StickTimerDown - 1
		else
		StickTimerDown = 5
		end
	end
	
	if not (m.controller.rawStickY < -110 and m.controller.rawStickY > -129) then
	StickTimerUp = 0
	else
	if (m.controller.rawStickY < -110 and m.controller.rawStickY > -129) and StickTimerUp >= 1 then
		StickTimerUp = StickTimerUp - 1
		else
		StickTimerUp = 5
		end
	end
	
		if (MenuInputCheck & U_JPAD) ~= 0 then
		DpadTimerUp = 0
		end
		if (MenuInputCheck & D_JPAD) ~= 0 then
		DpadTimerDown = 0
		end
		if (MenuInputCheck & L_JPAD) ~= 0 then
		DpadTimerLeft = 0
		end
		if (MenuInputCheck & R_JPAD) ~= 0 then
		DpadTimerRight = 0
		end
	
		if DpadTimerRight <= 2 then
		DpadTimerRight = DpadTimerRight + 1
		end
		
		if DpadTimerLeft <= 2 then
		DpadTimerLeft = DpadTimerLeft + 1
		end
		
		if DpadTimerUp <= 2 then
		DpadTimerUp = DpadTimerUp + 1
		end
		
		if DpadTimerDown <= 2 then
		DpadTimerDown = DpadTimerDown + 1
		end
		switched = false
		hasConfirmed = true
	end
	
	if (openmenu or openstrmenu) then return end
	if CommandMenuOption == "Buttons" then
	if network_is_server() then
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_JPAD) ~= 0) then
		openstrmenu = true
		openmenu = false
		SwitchingMenus = 1
		MenuOptions = 1
	elseif ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & L_JPAD) ~= 0) then
		openmenu = true
		openstrmenu = false
		SwitchingMenus = 2
		end
	end
	
	if not network_is_server() then
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & L_JPAD) ~= 0) then
		openmenu = true
		end
	end
	end
end

function displaystrmenu(m)
	if not openstrmenu then return end

	if gGlobalSyncTable.CustomPlugin == "Enabled" and Romhack_Runs_Option == true then
	EnablePluginRuns = true
	end
	
	if DisableTeams == true then
	TeamOptionColor = "#7a7a7a"
	elseif DisableTeams == false then
	TeamOptionColor = "#FFFFFF"
	end
	
	if MenuOptionSetting == "Buttons" then
	GrayColor = "#7a7a7a"
	elseif MenuOptionSetting == "Menu" then
	GrayColor = "#FFFFFF"
	end
	
	if Romhack_Runs_Option == true and gGlobalSyncTable.CustomPlugin == "Enabled" then
	RunsColor = "#FFFFFF"
	elseif Romhack_Runs_Option == false and gGlobalSyncTable.CustomPlugin == "Enabled" then
	RunsColor = "#7a7a7a"
	elseif Romhack_Runs_Option == false and gGlobalSyncTable.CustomPlugin == "Disabled" then
	RunsColor = "#7a7a7a"
	elseif gGlobalSyncTable.CustomPlugin == "Disabled" then
	RunsColor = "#7a7a7a"
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" then
	GamemodeText = "Normal"
	elseif gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
	GamemodeText = "Practice"
	elseif gGlobalSyncTable.GamemodeSetting == "Casual" then
	GamemodeText = "Casual"
	elseif gGlobalSyncTable.GamemodeSetting == "SingleStars" then
	GamemodeText = "Single Stars"
	end
	
	if gGlobalSyncTable.AntiCheatOption == true then
	AntiCheatsMenuColors = "#FFFFFF"
	else
	AntiCheatsMenuColors = "#7a7a7a"
	end
	
	if gGlobalSyncTable.backupslot == true then
	BackupSlotText = "Enabled"
	else
	BackupSlotText = "Disabled"
	end
	
	if gGlobalSyncTable.SPForcedSettings == "ForcedLevel" then
	ForcedSettingText = "Forced Level"
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedArea" then
	ForcedSettingText = "Forced Area"
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedAct" then
	ForcedSettingText = "Forced Act"
	elseif gGlobalSyncTable.SPForcedSettings == "ForcedNone" then
	ForcedSettingText = "Forced None"
	end
	
	if gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
	WarpSettingText = "Level Warp"
	elseif gGlobalSyncTable.SPWarpSettings == "StartWarp" then
	WarpSettingText = "Start Warp"
	elseif gGlobalSyncTable.SPWarpSettings == "NoWarps" then
	WarpSettingText = "No Warps"
	end
	
	if gGlobalSyncTable.StartingSettings == "Both" then
	StartingText = "Both"
	elseif gGlobalSyncTable.StartingSettings == "Intermission" then
	StartingText = "Intermission"
	elseif gGlobalSyncTable.StartingSettings == "Countdown" then
	StartingText = "Countdown"
	elseif gGlobalSyncTable.StartingSettings == "None" then
	StartingText = "None"
	end
	
	if gGlobalSyncTable.GamemodeSetting == "Normal" then
	if gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.EnabledIntro == false and gGlobalSyncTable.IntroSettings == "Enabled" then
	StartText = "Start"
	IntroText = "Press R to Enabled Intro"
	elseif gGlobalSyncTable.startglobaltimer == 0 and gGlobalSyncTable.EnabledIntro == true and gGlobalSyncTable.IntroSettings == "Enabled" then
	StartText = "Intro"
	IntroText = "Press R to Disabled Intro"
	end
	if gGlobalSyncTable.startglobaltimer == 0 then
	StartText = "Start"
	end
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if gGlobalSyncTable.startTimer == false then
	StartText = "Resume"
	elseif gGlobalSyncTable.startTimer == true then
	StartText = "Pause"
			end
		end
	end
	
	if gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
	if gGlobalSyncTable.startglobaltimer == 0 then
	StartText = "Start"
	end
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if gGlobalSyncTable.startTimer == false then
	StartText = "Resume"
	elseif gGlobalSyncTable.startTimer == true then
	StartText = "Pause"
			end
		end
	end
	
	if gGlobalSyncTable.CustomPlugin == "Enabled" then
	RunPositionColor = "#00FF00"
	PositionColors = "#7a7a7a"
	LevelFunctionsColors = "#7a7a7a"
	else
	RunPositionColor = "#FF0000"
	PositionColors = "#FFFFFF"
	LevelFunctionsColors = "#FFFFFF"
	end
	
	if gGlobalSyncTable.SpeedrunTeams == true then
	TeamsText = "Enabled"
	elseif gGlobalSyncTable.SpeedrunTeams == false then
	TeamsText = "Disabled"
	end
	
		if StrOption == 0 then
		if MainOptions == 1 then
		ArrowPositionUp = -93
		ArrowPositionLRUp = -110
		elseif MainOptions == 2 then
		ArrowPositionUp = -93
		ArrowPositionLRUp = -60
		elseif MainOptions == 3 then
		ArrowPositionUp = -93
		ArrowPositionLRUp = 0
		elseif MainOptions == 4 then
		ArrowPositionUp = -93
		ArrowPositionLRUp = 60
		elseif MainOptions == 5 then
		ArrowPositionUp = -93
		ArrowPositionLRUp = 110
			end
		end
		
		if StrOption == 1 then
		if ExtraOptionUD == 1 then
		ArrowPositionUDRight = -140
		ArrowPositionUDLeft = -140
		ArrowPositionUp = -118
		if ExtraOptionLR == 1 then
		ArrowPositionLRUp = -141
		elseif ExtraOptionLR == 2 then
		ArrowPositionLRUp = -81
		elseif ExtraOptionLR == 3 then
		ArrowPositionLRUp = 0
		elseif ExtraOptionLR == 4 then
		ArrowPositionLRUp = 82
		elseif ExtraOptionLR == 5 then
		ArrowPositionLRUp = 145
		end
		if SelectedExtra == 1 then
		ArrowPositionLeft = -160
		ArrowPositionRight = -127
		elseif SelectedExtra == 2 then
		ArrowPositionLeft = -63
		ArrowPositionRight = -15
		elseif SelectedExtra == 3 then
		ArrowPositionLeft = -40
		ArrowPositionRight = 33
		elseif SelectedExtra == 4 then
		ArrowPositionLeft = 47
		ArrowPositionRight = 110
			end
		end
		
		if ExtraOptionUD == 2 then
		ArrowPositionUDRight = -90
		ArrowPositionUDLeft = -90
		ArrowPositionUp = -70
		if ExtraOptionLR == 3 then
		ArrowPositionLRUp = 0
		elseif ExtraOptionLR == 5 then
		ArrowPositionLRUp = 145
		end
		if SelectedExtra == 3 then
		ArrowPositionLeft = -35
		ArrowPositionRight = 28
			end
		end
	end
	
	if StrOption == 2 then
	if RunsMenus == 0 then
		if RunsOptions == 1 then 
		ArrowPositionUDLeft = -190
		ArrowPositionUDRight = -190
		ArrowPositionLeft = 55
		ArrowPositionRight = -64
		elseif RunsOptions == 2 then 
		ArrowPositionUDLeft = -160
		ArrowPositionUDRight = -160
		ArrowPositionLeft = 47
		ArrowPositionRight = -56
		elseif RunsOptions == 3 then 
		ArrowPositionUDLeft = -130
		ArrowPositionUDRight = -130
		ArrowPositionLeft = 38
		ArrowPositionRight = -46
		elseif RunsOptions == 4 then 
		ArrowPositionUDLeft = -100
		ArrowPositionUDRight = -100
		ArrowPositionLeft = 68
		ArrowPositionRight = -76
		elseif RunsOptions == 5 then 
		ArrowPositionUDLeft = -70
		ArrowPositionUDRight = -70
		ArrowPositionLeft = 56
		ArrowPositionRight = -65
		end
	end
		
	if RunsMenus == 1 then
	if RunsSPUDMovement == 1 then
		ArrowPositionUp = -164
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -177
		ArrowPositionUDRight = -177
		ArrowPositionLeft = -30
		ArrowPositionRight = 28
	elseif RunsSPUDMovement == 2 and RunsSPLRMovement == 1 then
		ArrowPositionUp = -127
		ArrowPositionLRUp = -80
		ArrowPositionUDLeft = -142
		ArrowPositionUDRight = -142
		ArrowPositionLeft = -112
		ArrowPositionRight = -52
	elseif RunsSPUDMovement == 3 and RunsSPLRMovement == 1 then
		ArrowPositionUp = -87
		ArrowPositionLRUp = -80
		ArrowPositionUDLeft = -102
		ArrowPositionUDRight = -102
		ArrowPositionLeft = -112
		ArrowPositionRight = -52
	elseif RunsSPUDMovement == 4 and RunsSPLRMovement == 1 then
		ArrowPositionUp = -47
		ArrowPositionLRUp = -80
		ArrowPositionUDLeft = -62
		ArrowPositionUDRight = -62
		ArrowPositionLeft = -112
		ArrowPositionRight = -52
	elseif RunsSPUDMovement == 2 and RunsSPLRMovement == 2 then
		ArrowPositionUp = -127
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -142
		ArrowPositionUDRight = -142
		ArrowPositionLeft = -30
		ArrowPositionRight = 28
	elseif RunsSPUDMovement == 3 and RunsSPLRMovement == 2 then
		ArrowPositionUp = -87
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -102
		ArrowPositionUDRight = -102
		ArrowPositionLeft = -30
		ArrowPositionRight = 28
	elseif RunsSPUDMovement == 4 and RunsSPLRMovement == 2 then
		ArrowPositionUp = -47
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -62
		ArrowPositionUDRight = -62
		ArrowPositionLeft = -30
		ArrowPositionRight = 28
	elseif RunsSPUDMovement == 2 and RunsSPLRMovement == 3 then
		ArrowPositionUp = -127
		ArrowPositionLRUp = 80
		ArrowPositionUDLeft = -142
		ArrowPositionUDRight = -142
		ArrowPositionLeft = 52
		ArrowPositionRight = 106
	elseif RunsSPUDMovement == 3 and RunsSPLRMovement == 3 then
		ArrowPositionUp = -87
		ArrowPositionLRUp = 80
		ArrowPositionUDLeft = -102
		ArrowPositionUDRight = -102
		ArrowPositionLeft = 52
		ArrowPositionRight = 106
	elseif RunsSPUDMovement == 4 and RunsSPLRMovement == 3 then
		ArrowPositionUp = -47
		ArrowPositionLRUp = 80
		ArrowPositionUDLeft = -62
		ArrowPositionUDRight = -62
		ArrowPositionLeft = 52
		ArrowPositionRight = 106
			end
		end
	if RunsMenus == 2 then
	if RunsLFPages == 1 then
	if RunsLFUDMovement == 1 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = -123
		ArrowPositionRight = -82
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = -25
		ArrowPositionRight = 20
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = 49
		ArrowPositionRight = 143
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -152
		ArrowPositionRight = -56
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -50
		ArrowPositionRight = 43
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = 48
		ArrowPositionRight = 145
		end
	end
	
	if RunsLFPages == 2 then
	if RunsLFUDMovement == 1 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = -135
		ArrowPositionRight = -72
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = -25
		ArrowPositionRight = 20
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = 80
		ArrowPositionRight = 115
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -152
		ArrowPositionRight = -56
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -50
		ArrowPositionRight = 43
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = 48
		ArrowPositionRight = 145
		end
	end
	
	if RunsLFPages == 3 then
	if RunsLFUDMovement == 1 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = -60
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = -112
		ArrowPositionRight = -15
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -130
		ArrowPositionLRUp = 60
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		ArrowPositionLeft = 25
		ArrowPositionRight = 90
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -148
		ArrowPositionRight = -60
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = -52
		ArrowPositionRight = 45
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -65
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -90
		ArrowPositionUDRight = -90
		ArrowPositionLeft = 50
		ArrowPositionRight = 141
		end
	end
	
	if RunsLFPages == 4 then
	if RunsLFUDMovement == 1 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -161
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -182
		ArrowPositionUDRight = -182
		ArrowPositionLeft = -130
		ArrowPositionRight = -77
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -161
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -182
		ArrowPositionUDRight = -182
		ArrowPositionLeft = -30
		ArrowPositionRight = 25
	elseif RunsLFUDMovement == 1 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -161
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -182
		ArrowPositionUDRight = -182
		ArrowPositionLeft = 67
		ArrowPositionRight = 128
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -111
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -132
		ArrowPositionUDRight = -132
		ArrowPositionLeft = -130
		ArrowPositionRight = -77
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -111
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -132
		ArrowPositionUDRight = -132
		ArrowPositionLeft = -30
		ArrowPositionRight = 25
	elseif RunsLFUDMovement == 2 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -111
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -132
		ArrowPositionUDRight = -132
		ArrowPositionLeft = 67
		ArrowPositionRight = 128
	elseif RunsLFUDMovement == 3 and RunsLFLRMovement == 1 then
		ArrowPositionUp = -61
		ArrowPositionLRUp = -100
		ArrowPositionUDLeft = -82
		ArrowPositionUDRight = -82
		ArrowPositionLeft = -150
		ArrowPositionRight = -57
	elseif RunsLFUDMovement == 3 and RunsLFLRMovement == 2 then
		ArrowPositionUp = -61
		ArrowPositionLRUp = 0
		ArrowPositionUDLeft = -82
		ArrowPositionUDRight = -82
		ArrowPositionLeft = -42
		ArrowPositionRight = 33
	elseif RunsLFUDMovement == 3 and RunsLFLRMovement == 3 then
		ArrowPositionUp = -61
		ArrowPositionLRUp = 100
		ArrowPositionUDLeft = -82
		ArrowPositionUDRight = -82
		ArrowPositionLeft = 49
		ArrowPositionRight = 143
		end
	end
	
		end
	end
	
	if StrOption == 3 then
		ArrowPositionLeft = 63
		ArrowPositionRight = -65
		if SingleStarsUDMovement == 1 then 
		ArrowPositionUDLeft = -187
		ArrowPositionUDRight = -187
		elseif SingleStarsUDMovement == 2 then 
		ArrowPositionUDLeft = -157
		ArrowPositionUDRight = -157
		elseif SingleStarsUDMovement == 3 then 
		ArrowPositionUDLeft = -127
		ArrowPositionUDRight = -127
		elseif SingleStarsUDMovement == 4 then 
		ArrowPositionUDLeft = -97
		ArrowPositionUDRight = -97
		elseif SingleStarsUDMovement == 5 then 
		ArrowPositionUDLeft = -67
		ArrowPositionUDRight = -67
		end
	end
	
	if StrOption == 2 and RunsMenus == 4 then
	if RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber == RunTable[RunDefault].RunsSlotNumber then
		 RunsName = "" .. RunTable[RunDefault].RunsSlotName .." Run"
	end
	if RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber ~= gGlobalSyncTable.PluginsRunsSlots then 
		RunsSlotColor = "#FFFFFF"
	elseif RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber == gGlobalSyncTable.PluginsRunsSlots then 
		RunsSlotColor = "#00FF00"
		gGlobalSyncTable.SavedRunName = RunTable[RunDefault].RunsSlotName
		end
	end
	
	if StrOption == 2 and RunsMenus == 3 then
	if AntiCheatTable[AntiCheatDefault].AntiCheatName == AntiCheatTable[AntiCheatDefault].AntiCheatName and AntiCheatTable[AntiCheatDefault].AntiCheatNumber == AntiCheatTable[AntiCheatDefault].AntiCheatNumber then
		 AntiCheatName = AntiCheatTable[AntiCheatDefault].AntiCheatName
	end
	if AntiCheatTable[AntiCheatDefault].AntiCheatName == AntiCheatTable[AntiCheatDefault].AntiCheatName and AntiCheatTable[AntiCheatDefault].AntiCheatNumber ~= gGlobalSyncTable.AntiCheatsSlots then 
		AntiCheatsColors = "#FFFFFF"
	elseif AntiCheatTable[AntiCheatDefault].AntiCheatName == AntiCheatTable[AntiCheatDefault].AntiCheatName and AntiCheatTable[AntiCheatDefault].AntiCheatNumber == gGlobalSyncTable.AntiCheatsSlots then 
		AntiCheatsColors = "#00FF00"
		gGlobalSyncTable.SavedRunName = AntiCheatTable[AntiCheatDefault].AntiCheatName
		end
	end

	maintitletext = {
		{
            "SPEEDRUN TIMER REWORKED MENU",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Close the Menu, Press Y to Open the Config Menu",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	extratitletext = {
		{
            "EXTRAS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Close the Menu, Press Y to Open the Config Menu",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	runsmenutext = {
		{
            "RUNS MENU",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Exit",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	runsmenubuttons = {
		{
            "Down: Next Option",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Up: Previous Option",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	MainMenuTexts = {
		{
            StartText,
            -110,
            -113,
            globalFont,
            creditscale - 0.5,
            GrayColor
        },
		{
            "Restart",
            -60,
            -113,
            globalFont,
            creditscale - 0.5,
            GrayColor
        },
		{
            "Reset Save",
            -0,
            -113,
            globalFont,
            creditscale - 0.5,
            GrayColor
        },
		{
            "Extras",
             60,
            -113,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Runs",
             110,
            -113,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	EnableIntroTexts = {
		{
            IntroText,
            -110,
            -70,
            globalFont,
            creditscale - 0.8,
            creditcolor
        },
	}
	
	ExtraMenuText = {
		{
            "Countdown:",
            -140,
            -153,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Timer Controls:",
            -80,
            -153,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Starting Options:",
            -0,
            -153,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Gamemode:",
             82,
            -153,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Teams:",
             145,
            -153,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	ExtraMenuNumbers = {
		{
            "(" .. CDNumbers .. ")",
            -140,
            -133,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            MenuOptionSetting,
            -80,
            -133,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            StartingText,
            0,
            -133,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            GamemodeText,
             82,
            -133,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            TeamsText,
             145,
            -133,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	ExtraMenu2Text = {
		{
            "Intro Settings:",
            -0,
            -103,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Backup Slot:",
            145,
            -103,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	ExtraMenu2Numbers = {
		{
            gGlobalSyncTable.IntroSettings,
            0,
            -83,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            BackupSlotText,
            145,
            -83,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	menubuttons = {
		{
            "Right: Next Option",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Option",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	Arrow_Up = {
		{
            "^",
            ArrowPositionLRUp,
            ArrowPositionUp,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Down = {
		{
            "v",
            ArrowPositionLRDown,
            ArrowPositionDown,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Left = {
		{
            "<",
            ArrowPositionLeft,
            ArrowPositionUDLeft,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Right = {
		{
            ">",
            ArrowPositionRight,
            ArrowPositionUDRight,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	RunsOptionsText = {
		{
            "Starting Position",
            0,
            -185,
            globalFont,
            creditscale - 0.5,
            PositionColors	
        },
		{
            "Levels Functions",
            0,
            -155,
            globalFont,
            creditscale - 0.5,
            LevelFunctionsColors	
        },
		{
            "Anti-Cheat",
            0,
            -125,
            globalFont,
            creditscale - 0.5,
			AntiCheatsMenuColors
        },
		{
            "Custom Starting Plugins",
            0,
            -95,
            globalFont,
            creditscale - 0.5,
			RunPositionColor
        },
		{
            "Custom Run Plugins",
            0,
            -65,
            globalFont,
            creditscale - 0.5,
			RunsColor
        }
	}
	
	Set_SP_Title = {
		{
            "STARTING POSITIONS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select Setting",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	StartingPositionText = {
		{
            "Position Settings:",
            -0,
            -190,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "X Position:",
            -80,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Y Position:",
            -0,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Z Position:",
             80,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Starting Level:",
            -80,
            -115,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Starting Area:",
            -0,
            -115,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Starting Act:",
             80,
            -115,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Forced Settings:",
            -80,
            -75,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Warp Settings:",
            -0,
            -75,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Position Lock:",
             80,
            -75,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	StartingPositionNumbers = {
		{
            gGlobalSyncTable.SPPositionSettings,
            -0,
            -175,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SPXPosition .. "",
            -80,
            -140,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SPYPosition .. "",
            -0,
            -140,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SPZPosition .. "",
             80,
            -140,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].leveldisplay,
            -80,
            -100,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SPStartingAreas .. "",
            -0,
            -100,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
           "" .. gGlobalSyncTable.SPStartingActs .. "",
             80,
            -100,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            ForcedSettingText,
            -80,
            -60,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            WarpSettingText,
            -0,
            -60,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            gGlobalSyncTable.SPLockPosition,
             80,
            -60,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Set_Level_Functions_Title = {
		{
            "LEVELS FUNCTIONS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select Function",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	levelfunctionsbuttons = {
		{
            "R Trigger: Next Page",
            70,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "L Trigger: Previous Page",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	LevelsFunctionStars = {
		{
            "Stars Limit:",
            -100,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Specific Star ID:",
            -0,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Star Types:",
			 100,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Combined Stars:",
             -100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Enabled Stars:",
             0,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Stop Timer Stars:",
             100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		
		{
            "" .. gGlobalSyncTable.LRStarLimit .. "",
            -100,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRStarID .. "",
            -0,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRStarTypes,
			 100,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRCombinedStars,
             -100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LREnabledStars,
             0,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRStopTimerStars,
             100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	LevelsFunctionLevels = {
		{
            "Levels Name:",
            -100,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Level Area Num:",
            -0,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Level Act Num:",
			 100,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Combined Levels:",
             -100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Enabled Levels:",
             0,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Stop Timer Levels:",
             100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		
		{
            LevelFunctionTable[gGlobalSyncTable.LFLevels].levelname,
            -100,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRLevelArea .. "",
            -0,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRLevelAct .. "",
			 100,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRCombinedLevels,
             -100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LREnabledLevels,
             0,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRStopTimerLevels,
             100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	LevelsFunctionActions = {
		{
            "Mario Action:",
            -60,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Action Timer:",
            60,
            -175,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Combined Actions:",
             -100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Enabled Actions:",
             0,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Stop Timer Actions:",
             100,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		
		{
            ActionsTable[gGlobalSyncTable.LFActions].action_name,
            -60,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRLevelActionTimerSave .. "",
            60,
            -150,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRCombinedActions,
            -100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LREnabledActions,
             0,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            gGlobalSyncTable.LRStopTimerActions,
             100,
            -85,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	LevelsFunctionPositionBox = {
		{
            "X Position:",
            -100,
            -195,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Y Position:",
            -0,
            -195,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Z Position:",
			 100,
            -195,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "X Position Extra:",
            -100,
            -145,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Y Position Extra:",
             0,
            -145,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Z Position Extra:",
             100,
            -145,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Combined Position Box:",
            -100,
            -95,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Enabled Position Box:",
             0,
            -95,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "Stop Timer Position Box:",
             100,
            -95,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBXPosition .. "",
            -100,
            -175,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBYPosition .. "",
            -0,
            -175,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBZPosition .. "",
			 100,
            -175,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBXPositionExtra .. "",
            -100,
            -125,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBYPositionExtra .. "",
             0,
            -125,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.LRPBZPositionExtra .. "",
             100,
            -125,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            gGlobalSyncTable.LRCombinedPositionBox,
            -100,
            -75,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            gGlobalSyncTable.LREnabledPositionBox,
             0,
            -75,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
            gGlobalSyncTable.LRStopTimerPositionBox,
             100,
            -75,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
	}
	
	Set_AntiCheat_Title = {
		{
            "ANTICHEAT",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Save, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Apply",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	AntiCheatFunctionText = {
		{
            AntiCheatName,
            0,
            -120,
            globalFont,
            creditscale - 0.2,
            AntiCheatsColors
        }
	}
	
	AntiCheatButtons = {
		{
            "Right: Next Cheat",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Cheat",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	Set_Plugins_Title = {
		{
            "CUSTOM PLUGINS RUNS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Exit",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select Run",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	RunSlotText = {
		{
            RunsName,
            0,
            -120,
            globalFont,
            creditscale - 0.2,
            RunsSlotColor
        }
	}
	
	Pluginsbuttons = {
		{
            "Right: Next Run",
            52,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Run",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	singlestarstitletext = {
		{
            "SINGLE STARS MENU",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Start The Level, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Select Level",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	singlestarsoptions = {
		{
            "Levels:",
            0,
            -200,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Areas:",
            0,
            -170,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Acts:",
            0,
            -140,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Amount of Stars/One Star Id:",
            0,
            -110,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Stop Timer By:",
            0,
            -80,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	singlestarsnames = {
		{
            LevelsTable[gGlobalSyncTable.LevelsDefault].levelname,
            0,
            -185,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SingleStarsAreaID .. "",
            0,
            -155,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SingleStarsActID .. "",
            0,
            -125,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "" .. gGlobalSyncTable.SingleStarsStarNumbers .. "",
            0,
            -95,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            gGlobalSyncTable.SingleStarsStopTimer,
            0,
            -65,
            globalFont,
            creditscale - 0.75,
            creditcolor
        }
	}
	
	singlestarsbuttons = {
		{
            "Right: Next Option",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Option",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	Small_Arrow_Up = {
		{
            "^",
            ArrowPositionLRUp,
            ArrowPositionUp,
            FONT_MENU,
            creditscale - 0.8,
            creditcolor
        }
	}
	
	Small_Arrow_Left = {
		{
            "<",
            ArrowPositionLeft,
            ArrowPositionUDLeft,
            FONT_MENU,
            creditscale - 0.8,
            creditcolor
        }
	}
	
	Small_Arrow_Right = {
		{
            ">",
            ArrowPositionRight,
            ArrowPositionUDRight,
            FONT_MENU,
            creditscale - 0.8,
            creditcolor
        }
	}

	if (openstrmenu == true) then
		renderRect(190, 120, FONT_MENU, 10000, 240, "#000000") 
		if StrOption == 0 and StrOption ~= 3 then
		for _, v in ipairs(maintitletext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(MainMenuTexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		
		if gGlobalSyncTable.IntroSettings == "Enabled" and MainOptions == 1 then 
		for _, v in ipairs(EnableIntroTexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		end
		
		if StrOption == 1 then
		for _, v in ipairs(extratitletext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(ExtraMenuNumbers) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(ExtraMenu2Numbers) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(ExtraMenuText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(ExtraMenu2Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		if SelectedExtra == 0 then
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if SelectedExtra ~= 0 then
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
        end
		if StrOption == 2 then
		
		if RunsMenus == 0 then
		for _, v in ipairs(runsmenutext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(RunsOptionsText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runsmenubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
		end
		
		end
		
		if RunsMenus == 1 then
		for _, v in ipairs(Set_SP_Title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(StartingPositionText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(StartingPositionNumbers) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
		end
		
		if RunsSPSelected == 0 then
		for _, v in ipairs(Small_Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if RunsSPSelected ~= 0 then
		for _, v in ipairs(Small_Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Small_Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
			
		end
		
		if RunsMenus == 2 then
		for _, v in ipairs(Set_Level_Functions_Title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(levelfunctionsbuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
		end
		
		if RunsLFPages == 1 then
		for _, v in ipairs(LevelsFunctionStars) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		end
		
		if RunsLFPages == 2 then
		for _, v in ipairs(LevelsFunctionLevels) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		end
		
		if RunsLFPages == 3 then
		for _, v in ipairs(LevelsFunctionActions) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		end
		
		if RunsLFPages == 4 then
		for _, v in ipairs(LevelsFunctionPositionBox) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		end
		
		if RunsLFSelected == 0 then
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if RunsLFSelected ~= 0 then
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
			
		end
		
		if RunsMenus == 3 then
		for _, v in ipairs(Set_AntiCheat_Title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(AntiCheatFunctionText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(AntiCheatButtons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
			end
		end
		
		if RunsMenus == 4 then
		for _, v in ipairs(Set_Plugins_Title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(RunSlotText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Pluginsbuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
			end
		end
		
		end
		
		if StrOption == 3 then
		for _, v in ipairs(singlestarstitletext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(singlestarsoptions) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(singlestarsnames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(singlestarsbuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
		end
			
		for _, v in ipairs(Small_Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Small_Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
			
		end
		
		
		if Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		
		if StrOption == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MainOptions > 4 then
			MainOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			MainOptions = MainOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MainOptions < 2 then
			MainOptions = 5
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			MainOptions = MainOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if Secondstopress == 0 then 
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 0 then
            openstrmenu = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions <= 3 and MenuOptionSetting == "Buttons" then
        djui_popup_create("\\#ff0000\\That Option is Disabled when having button controls", 2)
		Secondstopress = 10
		end
			
		if MenuOptionSetting == "Menu" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.beatedGame and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
        djui_popup_create("\\#ff0000\\The Run is Finished, You can Either Rehost or Restart The Speedrun", 2)
		Secondstopress = 10
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.GamemodeSetting == "Casual" then
        djui_popup_create("\\#ff0000\\You have to Disable the Causal Option if you want to do a speedrun", 2)
		Secondstopress = 10 
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and (MainOptions == 1 or MainOptions == 2) and gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer == 0 then
		djui_popup_create("\\#ff0000\\Wait Until The Countdown Ends!", 2)
		Secondstopress = 10 
		end
		
		if gGlobalSyncTable.GamemodeSetting == "Normal" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and (EnablePluginRuns == false and Romhack_Runs_Option == true) and gGlobalSyncTable.startglobaltimer == 0 then
		djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
		Secondstopress = 10
		end
		
		if (MenuInputCheck & R_TRIG) ~= 0 and MainOptions == 1 and gGlobalSyncTable.EnabledIntro == false and gGlobalSyncTable.IntroSettings == "Enabled" then
		gGlobalSyncTable.EnabledIntro = true
		Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & R_TRIG) ~= 0 and MainOptions == 1 and gGlobalSyncTable.EnabledIntro == true and gGlobalSyncTable.IntroSettings == "Enabled" then
		gGlobalSyncTable.EnabledIntro = false
		Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (gGlobalSyncTable.StartingSettings == "Both" or gGlobalSyncTable.StartingSettings == "Intermission") and gGlobalSyncTable.EnabledIntro == false then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Paused!", 2)
		gGlobalSyncTable.startTimer = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer == false and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.startTimer = true
		openstrmenu = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and not gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		Secondstopress = 10 
		gGlobalSyncTable.Intermission = true
		gGlobalSyncTable.RunStarting = true
		openstrmenu = false
			end
		end
		if (gGlobalSyncTable.StartingSettings == "Countdown" or gGlobalSyncTable.StartingSettings == "None") and gGlobalSyncTable.EnabledIntro == false then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Paused!", 2)
		gGlobalSyncTable.startTimer = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer == false and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.startTimer = true
		DelayCheck = 5
		openstrmenu = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		Secondstopress = 10 
		DelayCheck = 5
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.RunStarting = true
		openstrmenu = false
			end
		end
		if gGlobalSyncTable.EnabledIntro == true and gGlobalSyncTable.IntroSettings == "Enabled" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Paused!", 2)
		gGlobalSyncTable.startTimer = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer == false and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.startTimer = true
		DelayCheck = 5
		openstrmenu = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		Secondstopress = 10 
		DelayCheck = 5
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.RunStarting = true
		openstrmenu = false
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		djui_popup_create("\\#ff0000\\This Option only works if you already Start a Speedrun", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.beatedGame then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer ~= 0 then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		end
		end
		
		if gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Paused!", 2)
		gGlobalSyncTable.startTimer = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startTimer == false and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.startTimer = true
		DelayCheck = 5
		openstrmenu = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		Secondstopress = 10 
		DelayCheck = 5
		gGlobalSyncTable.startTimer = true
		gGlobalSyncTable.RunStarting = true
		openstrmenu = false
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		djui_popup_create("\\#ff0000\\This Option only works if you already Start a Speedrun", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.beatedGame then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer ~= 0 then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		end
		end
		
		if gGlobalSyncTable.GamemodeSetting == "Casual" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		djui_popup_create("\\#ff0000\\This Option only works if you already Start a Speedrun", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.beatedGame then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer ~= 0 then
		Secondstopress = 10
		gGlobalSyncTable.startglobaltimer = 0
		gGlobalSyncTable.TeamsCheck = false
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
		end

		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 1 and StrOption == 1 then
		if gGlobalSyncTable.startTimer then
		Secondstopress = 10 
		djui_popup_create("\\#ff0000\\This Command is Disabled when a Speedrun is Starting", 2)
		else
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 1
		CountdownMovement = 1
		Secondstopress = 10
			end
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 then
		gGlobalSyncTable.ResetSaveCheck = true
		Secondstopress = 10 
		djui_popup_create_global("\\#ff0000\\The Save File Has Erased!", 2)
		end
			
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 4 and StrOption == 0 then
		StrOption = 1
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption ~= 2 and gGlobalSyncTable.GamemodeSetting == "SingleStars" then
		djui_popup_create("\\#ff0000\\This Option is Disable for Single Stars", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption ~= 2 and gGlobalSyncTable.GamemodeSetting ~= "SingleStars" then
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
        StrOption = 2
		Secondstopress = 10
		end
		end
		
		if gGlobalSyncTable.GamemodeSetting == "SingleStars" then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and Secondstopress == 0 then
		Secondstopress = 10
		StrOption = 3
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and Secondstopress == 0 then
		djui_popup_create("\\#ff0000\\This Option is Disabled for Single Stars Gamemode", 2)
		Secondstopress = 10
		end
		end
		
		end
		
		if StrOption == 1 then
		
		if SelectedExtra == 0 and ExtraOptionUD == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and ExtraOptionLR > 4 then
			ExtraOptionLR = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			ExtraOptionLR = ExtraOptionLR + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and ExtraOptionLR < 2 then
			ExtraOptionLR = 5
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			ExtraOptionLR = ExtraOptionLR - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SelectedExtra == 0 and (ExtraOptionLR == 3 or ExtraOptionLR == 5) then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and ExtraOptionUD == 1 then
			ExtraOptionUD = 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			ExtraOptionUD = ExtraOptionUD - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and ExtraOptionUD == 2 then
			ExtraOptionUD = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			ExtraOptionUD = ExtraOptionUD + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 1 and Secondstopress == 0 and SelectedExtra == 0 then
		if gGlobalSyncTable.GamemodeSetting ~= "Normal" or (gGlobalSyncTable.StartingSettings == "None" or gGlobalSyncTable.StartingSettings == "Intermission") then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is disable if you have the Countdown disable or if the gamemode isn't set to normal", 2)
		elseif gGlobalSyncTable.startTimer then
		Secondstopress = 10 
		djui_popup_create("\\#ff0000\\This Command is Disabled when a Speedrun is Starting", 2)
		else
		Secondstopress = 10
		SelectedExtra = 1
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 2 and Secondstopress == 0 and SelectedExtra == 0 then
		if moveset_is_check or other_moveset_mods or gGlobalSyncTable.GamemodeSetting == "SingleStars" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disabled for Moveset Mods, To Prevent Mods From Breaking", 2)
		else
		Secondstopress = 10
		SelectedExtra = 2
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 3 and ExtraOptionUD == 1 and Secondstopress == 0 and SelectedExtra == 0 then
		if gGlobalSyncTable.GamemodeSetting ~= "Normal" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable for Any Gamemode Besides the Normal One", 2)
		else
		Secondstopress = 10
		SelectedExtra = 3
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 3 and ExtraOptionUD == 2 and Secondstopress == 0 then
		if gGlobalSyncTable.GamemodeSetting ~= "Normal" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable for Any Gamemode Besides the Normal One", 2)
		end
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 3 and ExtraOptionUD == 2 and Secondstopress == 0 and DisableIntro == true then
		djui_popup_create("\\#ff0000\\This Option is Disable for When a Romhack is Used", 2)
		Secondstopress = 10 
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 3 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.IntroSettings == "Disabled" then
		gGlobalSyncTable.IntroSettings = "Enabled"
		mod_storage_save("IntroOption", tostring(gGlobalSyncTable.IntroSettings))
		Secondstopress = 10 
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 3 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.IntroSettings == "Enabled" then
		gGlobalSyncTable.IntroSettings = "Disabled"
		mod_storage_save("IntroOption", tostring(gGlobalSyncTable.IntroSettings))
		Secondstopress = 10 
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 4 and Secondstopress == 0 and SelectedExtra == 0 then
		Secondstopress = 10
		SelectedExtra = 4
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 1 and Secondstopress == 0 and gGlobalSyncTable.GamemodeSetting ~= "Normal" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable for Any Gamemode Besides the Normal One", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 1 and Secondstopress == 0 and gGlobalSyncTable.SpeedrunTeams == false then
		djui_popup_create("Speedrun in Teams is Enabled", 1)
		gGlobalSyncTable.SpeedrunTeams = true
		Secondstopress = 10 
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 1 and Secondstopress == 0 and gGlobalSyncTable.SpeedrunTeams == true then
		djui_popup_create("Speedrun in Teams is Disabled", 1)
		gGlobalSyncTable.SpeedrunTeams = false
		Secondstopress = 10 
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and BackupSlotPluginCheck == true then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable Because For Some Romhack with a Backup Slot could be used", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.GamemodeSetting == "SingleStars" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable for Single Stars", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.RunStarting == true then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable When a Speedrun is Starting", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.SpeedrunTeams == true then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disable When Teams Are On", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.backupslot == false then
		djui_popup_create_global("Switching To The Backup Save File", 1)
		gGlobalSyncTable.backupslot = true
		Secondstopress = 10 
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 5 and ExtraOptionUD == 2 and Secondstopress == 0 and gGlobalSyncTable.backupslot == true then
		djui_popup_create_global("Switching Back To The Normal Save File", 1)
		gGlobalSyncTable.backupslot = false
		Secondstopress = 10 
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and SelectedExtra == 0 and Secondstopress == 0 then
		StrOption = 0
		Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if SelectedExtra == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and CDNumbers > 49 then
			CDNumbers = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			CDNumbers = CDNumbers + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and CDNumbers < 1 then
			CDNumbers = 50
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			CDNumbers = CDNumbers - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if Secondstopress == 0 then 
		if (MenuInputCheck & A_BUTTON) ~= 0 and ExtraOptionLR == 1 and StrOption == 1 then
			Secondstopress = 10
			 if CDNumbers ~= nil then
				CDNumbers = clamp(CDNumbers, 0, 50)
				if CDNumbers == 0 then
				djui_popup_create_global("No Countdown \n(That's Pretty Much it)", 2)
				elseif CDNumbers == 1 then
				djui_popup_create_global("Countdown set to " .. CDNumbers .. "\n(Which is Short.)", 2)
				elseif CDNumbers == 5 then
				djui_popup_create_global("Countdown set to Default\n(".. CDNumbers.. " Seconds)", 2)
				elseif CDNumbers < 29 then
				djui_popup_create_global("Countdown set to " .. CDNumbers .. " Seconds", 2)
				elseif CDNumbers > 29 and CDNumbers < 40 then
				djui_popup_create_global("\\#FFFF00\\Countdown set to " .. CDNumbers .. " Seconds\n(Lower than the Max Countdown)", 2)
				elseif CDNumbers > 39 and CDNumbers < 50 then
				djui_popup_create_global("\\#FFA500\\Countdown set to " .. CDNumbers .. " Seconds\n(Getting Close to the Max Countdown)", 2)
				elseif CDNumbers == 49 then
				djui_popup_create_global("\\#FFA500\\Countdown set to " .. CDNumbers .. " Seconds\n(Almost to the Max Countdown)", 2)
				elseif CDNumbers > 49 then
				djui_popup_create_global("\\#FF0000\\Countdown set to " .. CDNumbers .. " Seconds\n(The Max Countdown)", 2)
			end
				gGlobalSyncTable.timercountdown = CDNumbers * 30 + 60 
				gGlobalSyncTable.set_countdown_numbers = true
				end
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and SelectedExtra == 1 and Secondstopress == 0 then
		Secondstopress = 10
		SelectedExtra = 0
		ExtraOptionLR = 1
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if SelectedExtra == 2 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MenuOptionSetting == "Buttons" then
			MenuOptionSetting = "Menu"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MenuOptionSetting == "Menu" then
			MenuOptionSetting = "Buttons"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MenuOptionSetting == "Menu" then
			MenuOptionSetting = "Buttons"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MenuOptionSetting == "Buttons" then
			MenuOptionSetting = "Menu"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		if MenuOptionSetting == "Menu" then
		djui_popup_create("Menu Config! The Modern Settings of the Speedrun Timer", 2)
		elseif MenuOptionSetting == "Buttons" then
		djui_popup_create("Button Config! The Original Settings of the Speedrun Timer", 2)
		end
		mod_storage_save("MenuOption", tostring(MenuOptionSetting))
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and SelectedExtra == 2 and Secondstopress == 0 then
		Secondstopress = 10
		SelectedExtra = 0
		ExtraOptionLR = 2
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if SelectedExtra == 3 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.StartingSettings == "None" then
			gGlobalSyncTable.StartingSettings = "Both"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.StartingSettings == "Both" then
			gGlobalSyncTable.StartingSettings = "Intermission"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.StartingSettings == "Intermission" then
			gGlobalSyncTable.StartingSettings = "Countdown"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.StartingSettings == "Countdown" then
			gGlobalSyncTable.StartingSettings = "None"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.StartingSettings == "None" then
			gGlobalSyncTable.StartingSettings = "Countdown"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.StartingSettings == "Countdown" then
			gGlobalSyncTable.StartingSettings = "Intermission"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.StartingSettings == "Intermission" then
			gGlobalSyncTable.StartingSettings = "Both"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.StartingSettings == "Both" then
			gGlobalSyncTable.StartingSettings = "None"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("StartingOption", tostring(gGlobalSyncTable.StartingSettings))
		if gGlobalSyncTable.StartingSettings == "Both" then
		djui_popup_create("Normal Starting Option:\nStarting with Both Intermission and Countdown", 3)
		elseif gGlobalSyncTable.StartingSettings == "Intermission" then
		djui_popup_create("Intermission Starting Option:\nStarting with only the Intermission", 3)
		elseif gGlobalSyncTable.StartingSettings == "Countdown" then
		djui_popup_create("Original Starting Option:\nStarting with only the Countdown", 3)
		elseif gGlobalSyncTable.StartingSettings == "None" then
		djui_popup_create("No Starting Option:\nStarting without Intermission and Countdown", 3)
			end
		end
			
		if (MenuInputCheck & B_BUTTON) ~= 0 and SelectedExtra == 3 and Secondstopress == 0 then
		Secondstopress = 10
		SelectedExtra = 0
		ExtraOptionLR = 3
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if SelectedExtra == 4 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.GamemodeSetting == "SingleStars" then
			gGlobalSyncTable.GamemodeSetting = "Normal"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.GamemodeSetting == "Normal" then
			gGlobalSyncTable.GamemodeSetting = "PracticeRun"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
			gGlobalSyncTable.GamemodeSetting = "Casual"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.GamemodeSetting == "Casual" then
			gGlobalSyncTable.GamemodeSetting = "SingleStars"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.GamemodeSetting == "Normal" then
			gGlobalSyncTable.GamemodeSetting = "SingleStars"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.GamemodeSetting == "SingleStars" then
			gGlobalSyncTable.GamemodeSetting = "Casual"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.GamemodeSetting == "Casual" then
			gGlobalSyncTable.GamemodeSetting = "PracticeRun"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
			gGlobalSyncTable.GamemodeSetting = "Normal"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("GameModes", tostring(gGlobalSyncTable.GamemodeSetting))
		if gGlobalSyncTable.GamemodeSetting == "Normal" then
		gGlobalSyncTable.CasualTimer = false
		gGlobalSyncTable.ResettingTimer = true
		Secondstopress = 10 
		djui_popup_create("Speedrun Mode: \nThe Main Speedrun Timer Gamemode for Normal and Pro Speedrunners", 3)
		elseif gGlobalSyncTable.GamemodeSetting == "PracticeRun" then
		gGlobalSyncTable.CasualTimer = false
		gGlobalSyncTable.ResettingTimer = true
		Secondstopress = 10 
		djui_popup_create("Practice Mode: \nThe Easiest Way to Practice The Speedrun Before Starting", 3)
		elseif gGlobalSyncTable.GamemodeSetting == "Casual" then
		gGlobalSyncTable.CasualTimer = true
		gGlobalSyncTable.ResettingTimer = true
		Secondstopress = 10
		djui_popup_create("Casual Mode: \nA Causal Timer that Start everytime you Host, Perfect For Casual Players", 3)
		elseif gGlobalSyncTable.GamemodeSetting == "SingleStars" then
		gGlobalSyncTable.CasualTimer = false
		gGlobalSyncTable.ResettingTimer = true
		Secondstopress = 10
		djui_popup_create("Single Stars Mode: \nCollect 1 to 7 Stars to Stop the Timer In Each Different Levels", 3)
		end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and SelectedExtra == 4 and Secondstopress == 0 then
		Secondstopress = 10
		SelectedExtra = 0
		ExtraOptionLR = 4
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		end
	end
		
	if StrOption == 2 then

		if Secondstopress == 0 then
		
		if RunsMenus == 0 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RunsOptions < 2 then
			RunsOptions = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RunsOptions = RunsOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RunsOptions > 4 then
			RunsOptions = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RunsOptions = RunsOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions <= 2 and gGlobalSyncTable.CustomPlugin == "Enabled" then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disabled when having Custom Plugins Turn On", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 1 and gGlobalSyncTable.CustomPlugin == "Disabled" then
			RunsMenus = 1
			RunsSPLRMovement = 1
			RunsSPUDMovement = 1
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 2 and gGlobalSyncTable.CustomPlugin == "Disabled" then
			RunsMenus = 2
			RunsLFPages = 1
			RunsLFLRMovement = 1
			RunsLFUDMovement = 1
			RunsLFSelected = 0
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 3 and gGlobalSyncTable.AntiCheatOption == false then
			Secondstopress = 10
			play_sound(SOUND_MENU_CAMERA_BUZZ, m.marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 3 and gGlobalSyncTable.AntiCheatOption == true then
			RunsMenus = 3
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 4 and gGlobalSyncTable.CustomPlugin == "Disabled" then
		gGlobalSyncTable.CustomPlugin = "Enabled"
		Secondstopress = 10
		mod_storage_save("PositionPlugin", tostring(gGlobalSyncTable.CustomPlugin))
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 4 and gGlobalSyncTable.CustomPlugin == "Enabled" then
		gGlobalSyncTable.CustomPlugin = "Disabled"
		Secondstopress = 10
		mod_storage_save("PositionPlugin", tostring(gGlobalSyncTable.CustomPlugin))
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsOptions == 5 then
		if Romhack_Runs_Option == true and gGlobalSyncTable.CustomPlugin == "Enabled" then
			RunsMenus = 4
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
			else
			Secondstopress = 10
			play_sound(SOUND_MENU_CAMERA_BUZZ, m.marioObj.header.gfx.cameraToObject)
		end
		end
			
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
        StrOption = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if RunsMenus == 1 and RunsSPSelected == 0 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RunsSPUDMovement < 2 then
			RunsSPUDMovement = 4
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RunsSPUDMovement = RunsSPUDMovement - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RunsSPUDMovement > 3 then
			RunsSPUDMovement = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RunsSPUDMovement = RunsSPUDMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and RunsSPUDMovement == 1 then
		Secondstopress = 10
		play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and RunsSPLRMovement > 2 then
			RunsSPLRMovement = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			RunsSPLRMovement = RunsSPLRMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and RunsSPUDMovement == 1 then
		Secondstopress = 10
		play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and RunsSPLRMovement < 2 then
			RunsSPLRMovement = 3
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			RunsSPLRMovement = RunsSPLRMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 1 then
        RunsSPSelected = 1
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 2 and RunsSPLRMovement == 1 then
        RunsSPSelected = 2
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 2 and RunsSPLRMovement == 2 then
        RunsSPSelected = 3
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 2 and RunsSPLRMovement == 3 then
        RunsSPSelected = 4
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 3 and RunsSPLRMovement == 1 then
        RunsSPSelected = 5
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 3 and RunsSPLRMovement == 2 then
        RunsSPSelected = 6
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 3 and RunsSPLRMovement == 3 then
        RunsSPSelected = 7
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 4 and RunsSPLRMovement == 1 then
        RunsSPSelected = 8
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 4 and RunsSPLRMovement == 2 then
        RunsSPSelected = 9
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPUDMovement == 4 and RunsSPLRMovement == 3 then
        RunsSPSelected = 10
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
        RunsMenus = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 and RunsSPSelected ~= 0 then
        RunsSPSelected = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if RunsSPSelected == 1 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPPositionSettings == "Enabled" then
			gGlobalSyncTable.SPPositionSettings = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPPositionSettings == "Disabled" then
			gGlobalSyncTable.SPPositionSettings = "Enabled"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPPositionSettings == "Disabled" then
			gGlobalSyncTable.SPPositionSettings = "Enabled"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPPositionSettings == "Enabled" then
			gGlobalSyncTable.SPPositionSettings = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You ".. gGlobalSyncTable.SPPositionSettings .. " The Position Settings\n\nSaving Setting...", 3)
		mod_storage_save("PositionSettings", tostring(gGlobalSyncTable.SPPositionSettings))
		end
		
		end
		
		if RunsSPSelected == 2 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.SPXPosition > 18000 then
			gGlobalSyncTable.SPXPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.SPXPosition = gGlobalSyncTable.SPXPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.SPXPosition < -18000 then
			gGlobalSyncTable.SPXPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.SPXPosition = gGlobalSyncTable.SPXPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPXPosition < -18000 then
			gGlobalSyncTable.SPXPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SPXPosition = gGlobalSyncTable.SPXPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPXPosition > 18000 then
			gGlobalSyncTable.SPXPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SPXPosition = gGlobalSyncTable.SPXPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Set X Position to ".. gGlobalSyncTable.SPXPosition .. "\n\nSaving Setting...", 3)
		mod_storage_save("XPosition", tostring(gGlobalSyncTable.SPXPosition))
		end
		
		end
		
		if RunsSPSelected == 3 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.SPYPosition > 18000 then
			gGlobalSyncTable.SPYPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.SPYPosition = gGlobalSyncTable.SPYPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.SPYPosition < -18000 then
			gGlobalSyncTable.SPYPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.SPYPosition = gGlobalSyncTable.SPYPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPYPosition < -18000 then
			gGlobalSyncTable.SPYPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SPYPosition = gGlobalSyncTable.SPYPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPYPosition > 18000 then
			gGlobalSyncTable.SPYPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SPYPosition = gGlobalSyncTable.SPYPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Set Y Position to ".. gGlobalSyncTable.SPYPosition .. "\n\nSaving Setting...", 3)
		mod_storage_save("YPosition", tostring(gGlobalSyncTable.SPYPosition))
		end
		
		end
		
		if RunsSPSelected == 4 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.SPZPosition > 18000 then
			gGlobalSyncTable.SPZPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.SPZPosition = gGlobalSyncTable.SPZPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.SPZPosition < -18000 then
			gGlobalSyncTable.SPZPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.SPZPosition = gGlobalSyncTable.SPZPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPZPosition < -18000 then
			gGlobalSyncTable.SPZPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SPZPosition = gGlobalSyncTable.SPZPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPZPosition > 18000 then
			gGlobalSyncTable.SPZPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SPZPosition = gGlobalSyncTable.SPZPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Set Z Position to ".. gGlobalSyncTable.SPZPosition .. "\n\nSaving Setting...", 3)
		mod_storage_save("ZPosition", tostring(gGlobalSyncTable.SPZPosition))
		end
		
		end
		
		if RunsSPSelected == 5 then
		
		if #StartingLevelTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.StartingLevelsDefault > #StartingLevelTable - 1 then
			gGlobalSyncTable.StartingLevelsDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.StartingLevelsDefault = gGlobalSyncTable.StartingLevelsDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.StartingLevelsDefault < 2 then
			gGlobalSyncTable.StartingLevelsDefault = #StartingLevelTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.StartingLevelsDefault = gGlobalSyncTable.StartingLevelsDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("StartingLevels", tostring(gGlobalSyncTable.StartingLevelsDefault))
		djui_popup_create("You Selected ".. StartingLevelTable[gGlobalSyncTable.StartingLevelsDefault].leveldisplay .. " As Your Starting Position Settings\n\nSaving Setting...", 3)
		end
		
		end
		
		if RunsSPSelected == 6 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPStartingAreas > 15 then
			gGlobalSyncTable.SPStartingAreas = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SPStartingAreas = gGlobalSyncTable.SPStartingAreas + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPStartingAreas < 2 then
			gGlobalSyncTable.SPStartingAreas = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SPStartingAreas = gGlobalSyncTable.SPStartingAreas - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Set Area Number to ".. gGlobalSyncTable.SPStartingAreas .. "\n\nSaving Setting...", 3)
		mod_storage_save("StartingAreas", tostring(gGlobalSyncTable.SPStartingAreas))
		end
		
		end
		
		if RunsSPSelected == 7 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPStartingActs > 5 then
			gGlobalSyncTable.SPStartingActs = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SPStartingActs = gGlobalSyncTable.SPStartingActs + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPStartingActs < 1 then
			gGlobalSyncTable.SPStartingActs = 6
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SPStartingActs = gGlobalSyncTable.SPStartingActs - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Set Act Number to ".. gGlobalSyncTable.SPStartingActs .. "\n\nSaving Setting...", 3)
		mod_storage_save("StartingActs", tostring(gGlobalSyncTable.SPStartingActs))
		end
		
		end
		
		if RunsSPSelected == 8 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedLevel" then
			gGlobalSyncTable.SPForcedSettings = "ForcedArea"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedArea" then
			gGlobalSyncTable.SPForcedSettings = "ForcedAct"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedAct" then
			gGlobalSyncTable.SPForcedSettings = "ForcedLevel"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedAct" then
			gGlobalSyncTable.SPForcedSettings = "ForcedArea"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedArea" then
			gGlobalSyncTable.SPForcedSettings = "ForcedLevel"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPForcedSettings == "ForcedLevel" then
			gGlobalSyncTable.SPForcedSettings = "ForcedAct"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Selected ".. ForcedSettingText .. " As Your Forced Option Settings\n\nSaving Setting...", 3)
		mod_storage_save("ForcedSettings", tostring(gGlobalSyncTable.SPForcedSettings))
		end
		
		end
		
		if RunsSPSelected == 9 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
			gGlobalSyncTable.SPWarpSettings = "StartWarp"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPWarpSettings == "StartWarp" then
			gGlobalSyncTable.SPWarpSettings = "NoWarps"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPWarpSettings == "NoWarps" then
			gGlobalSyncTable.SPWarpSettings = "LevelWarp"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPWarpSettings == "NoWarps" then
			gGlobalSyncTable.SPWarpSettings = "StartWarp"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPWarpSettings == "StartWarp" then
			gGlobalSyncTable.SPWarpSettings = "LevelWarp"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPWarpSettings == "LevelWarp" then
			gGlobalSyncTable.SPWarpSettings = "NoWarps"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You Selected ".. WarpSettingText .. " As Your Warp Option Settings\n\nSaving Setting...", 3)
		mod_storage_save("WarpSettings", tostring(gGlobalSyncTable.SPWarpSettings))
		end

		end
		
		if RunsSPSelected == 10 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPLockPosition == "Enabled" then
			gGlobalSyncTable.SPLockPosition = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SPLockPosition == "Disabled" then
			gGlobalSyncTable.SPLockPosition = "Enabled"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPLockPosition == "Disabled" then
			gGlobalSyncTable.SPLockPosition = "Enabled"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SPLockPosition == "Enabled" then
			gGlobalSyncTable.SPLockPosition = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("You ".. gGlobalSyncTable.SPLockPosition .. " The Lock Position Settings\n\nSaving Setting...", 3)
		mod_storage_save("PositionSettings", tostring(gGlobalSyncTable.SPLockPosition))
		end
		
		end
		
		
		if RunsMenus == 2 then
		
		if RunsLFSelected == 0 then
		
		if (MenuInputCheck & R_TRIG) ~= 0 and Secondstopress == 0 and RunsLFPages > 3 then
			RunsLFPages = 1
			RunsLFLRMovement = 1
			RunsLFUDMovement = 1
			Secondstopress = 10
            play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & R_TRIG) ~= 0 and Secondstopress == 0 then
			RunsLFPages = RunsLFPages + 1
			RunsLFLRMovement = 1
			RunsLFUDMovement = 1
			Secondstopress = 10
            play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & L_TRIG) ~= 0 and Secondstopress == 0 and RunsLFPages < 2 then
			RunsLFPages = 4
			RunsLFLRMovement = 1
			RunsLFUDMovement = 1
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & L_TRIG) ~= 0 and Secondstopress == 0 then
			RunsLFPages = RunsLFPages - 1
			RunsLFLRMovement = 1
			RunsLFUDMovement = 1
			Secondstopress = 10
            play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if RunsLFPages == 1 or RunsLFPages == 2 or (RunsLFPages == 3 and RunsLFUDMovement == 2) or RunsLFPages == 4 then	
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and RunsLFLRMovement > 2 then
			RunsLFLRMovement = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			RunsLFLRMovement = RunsLFLRMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and RunsLFLRMovement < 2 then
			RunsLFLRMovement = 3
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			RunsLFLRMovement = RunsLFLRMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		end
		
		if (RunsLFPages == 3 and RunsLFLRMovement == 3 and RunsLFUDMovement == 2) then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RunsLFLRMovement = 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 3 and RunsLFUDMovement == 1 then	
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and RunsLFLRMovement > 1 then
			RunsLFLRMovement = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			RunsLFLRMovement = RunsLFLRMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and RunsLFLRMovement < 2 then
			RunsLFLRMovement = 2
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			RunsLFLRMovement = RunsLFLRMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFPages == 1 or RunsLFPages == 2 or RunsLFPages == 3 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RunsLFUDMovement < 2 then
			RunsLFUDMovement = 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RunsLFUDMovement = RunsLFUDMovement - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RunsLFUDMovement > 1 then
			RunsLFUDMovement = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RunsLFUDMovement = RunsLFUDMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 4 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RunsLFUDMovement < 2 then
			RunsLFUDMovement = 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RunsLFUDMovement = RunsLFUDMovement - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RunsLFUDMovement > 2 then
			RunsLFUDMovement = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RunsLFUDMovement = RunsLFUDMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 1 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 1
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 2
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 3
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 4
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 5
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 6
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 2 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 7
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 8
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 9
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 10
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 11
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 12
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 3 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 13
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 14
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 15
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 16
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 17
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 18
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		if RunsLFPages == 4 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 19
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 20
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 1 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 21
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 22
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 23
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 2 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 24
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 3 and RunsLFLRMovement == 1 and RunsLFSelected == 0 then
        RunsLFSelected = 25
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 3 and RunsLFLRMovement == 2 and RunsLFSelected == 0 then
        RunsLFSelected = 26
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFUDMovement == 3 and RunsLFLRMovement == 3 and RunsLFSelected == 0 then
        RunsLFSelected = 27
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
		
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFSelected == 0 then
        RunsMenus = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 and RunsLFSelected ~= 0 then
        RunsLFSelected = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end 
		
		end
		
		if RunsLFSelected == 1 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarLimit > 998 then
			gGlobalSyncTable.LRStarLimit = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRStarLimit = gGlobalSyncTable.LRStarLimit + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarLimit < 1 then
			gGlobalSyncTable.LRStarLimit = 999
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRStarLimit = gGlobalSyncTable.LRStarLimit - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 2 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarID > 15 then
			gGlobalSyncTable.LRStarID = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRStarID = gGlobalSyncTable.LRStarID + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarID < 2 then
			gGlobalSyncTable.LRStarID = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRStarID = gGlobalSyncTable.LRStarID - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 3 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Grand Star" then
			gGlobalSyncTable.LRStarTypes = "Key 1"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Key 1" then
			gGlobalSyncTable.LRStarTypes = "Key 2"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Key 2" then
			gGlobalSyncTable.LRStarTypes = "Red Switch"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Red Switch" then
			gGlobalSyncTable.LRStarTypes = "Blue Switch"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Blue Switch" then
			gGlobalSyncTable.LRStarTypes = "Green Switch"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Green Switch" then
			gGlobalSyncTable.LRStarTypes = "Normal Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Normal Star" then
			gGlobalSyncTable.LRStarTypes = "Spawn Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Spawn Star" then
			gGlobalSyncTable.LRStarTypes = "Coordinate Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Coordinate Star" then
			gGlobalSyncTable.LRStarTypes = "100 Coins Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "100 Coins Star" then
			gGlobalSyncTable.LRStarTypes = "Mips 1"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Mips 1" then
			gGlobalSyncTable.LRStarTypes = "Mips 2"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Mips 2" then
			gGlobalSyncTable.LRStarTypes = "Toad 1"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 1" then
			gGlobalSyncTable.LRStarTypes = "Toad 2"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 2" then
			gGlobalSyncTable.LRStarTypes = "Toad 3"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 3" then
			gGlobalSyncTable.LRStarTypes = "Grand Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 3" then
			gGlobalSyncTable.LRStarTypes = "Toad 2"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 2" then
			gGlobalSyncTable.LRStarTypes = "Toad 1"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Toad 1" then
			gGlobalSyncTable.LRStarTypes = "Mips 2"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Mips 2" then
			gGlobalSyncTable.LRStarTypes = "Mips 1"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Mips 1" then
			gGlobalSyncTable.LRStarTypes = "100 Coins Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "100 Coins Star" then
			gGlobalSyncTable.LRStarTypes = "Coordinate Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Coordinate Star" then
			gGlobalSyncTable.LRStarTypes = "Spawn Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Spawn Star" then
			gGlobalSyncTable.LRStarTypes = "Normal Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Normal Star" then
			gGlobalSyncTable.LRStarTypes = "Green Switch"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Green Switch" then
			gGlobalSyncTable.LRStarTypes = "Blue Switch"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Blue Switch" then
			gGlobalSyncTable.LRStarTypes = "Red Switch"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Red Switch" then
			gGlobalSyncTable.LRStarTypes = "Key 2"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Key 2" then
			gGlobalSyncTable.LRStarTypes = "Key 1"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Key 1" then
			gGlobalSyncTable.LRStarTypes = "Grand Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStarTypes == "Grand Star" then
			gGlobalSyncTable.LRStarTypes = "Toad 3"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 4 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star Limit" then
			gGlobalSyncTable.LRCombinedStars = "Star ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star ID" then
			gGlobalSyncTable.LRCombinedStars = "Behavior Types"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Behavior Types" then
			gGlobalSyncTable.LRCombinedStars = "Star Behavior"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star Behavior" then
			gGlobalSyncTable.LRCombinedStars = "Star L + ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star L + ID" then
			gGlobalSyncTable.LRCombinedStars = "Star L + B"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star L + B" then
			gGlobalSyncTable.LRCombinedStars = "Star B + ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Star B + ID" then
			gGlobalSyncTable.LRCombinedStars = "Behavior + Limit"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" then
			gGlobalSyncTable.LRCombinedStars = "Star Limit"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Behavior + Limit" then
			gGlobalSyncTable.LRCombinedStars = "Star B + ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star B + ID" then
			gGlobalSyncTable.LRCombinedStars = "Star L + B"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star L + B" then
			gGlobalSyncTable.LRCombinedStars = "Star L + ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star L + ID" then
			gGlobalSyncTable.LRCombinedStars = "Star Behavior"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star Behavior" then
			gGlobalSyncTable.LRCombinedStars = "Behavior Types"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Behavior Types" then
			gGlobalSyncTable.LRCombinedStars = "Star ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star ID" then
			gGlobalSyncTable.LRCombinedStars = "Star Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedStars == "Star Limit" then
			gGlobalSyncTable.LRCombinedStars = "Behavior + Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 5 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledStars == "Stop Timer" then
			gGlobalSyncTable.LREnabledStars = "Combined Stars"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledStars == "Combined Stars" then
			gGlobalSyncTable.LREnabledStars = "Disabled"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledStars == "Disabled" then
			gGlobalSyncTable.LREnabledStars = "Stop Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledStars == "Disabled" then
			gGlobalSyncTable.LREnabledStars = "Combined Stars"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledStars == "Combined Stars" then
			gGlobalSyncTable.LREnabledStars = "Stop Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledStars == "Stop Timer" then
			gGlobalSyncTable.LREnabledStars = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 6 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star Limit" then
			gGlobalSyncTable.LRStopTimerStars = "Star ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star ID" then
			gGlobalSyncTable.LRStopTimerStars = "Behavior Types"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" then
			gGlobalSyncTable.LRStopTimerStars = "Star Behavior"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" then
			gGlobalSyncTable.LRStopTimerStars = "Star L + ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star L + ID" then
			gGlobalSyncTable.LRStopTimerStars = "Star L + B"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star L + B" then
			gGlobalSyncTable.LRStopTimerStars = "Star B + ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star B + ID" then
			gGlobalSyncTable.LRStopTimerStars = "Behavior + Limit"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerStars == "Behavior + Limit" then
			gGlobalSyncTable.LRStopTimerStars = "Star Limit"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Behavior + Limit" then
			gGlobalSyncTable.LRStopTimerStars = "Star B + ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star B + ID" then
			gGlobalSyncTable.LRStopTimerStars = "Star L + B"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star L + B" then
			gGlobalSyncTable.LRStopTimerStars = "Star L + ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star L + ID" then
			gGlobalSyncTable.LRStopTimerStars = "Star Behavior"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star Behavior" then
			gGlobalSyncTable.LRStopTimerStars = "Behavior Types"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Behavior Types" then
			gGlobalSyncTable.LRStopTimerStars = "Star ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star ID" then
			gGlobalSyncTable.LRStopTimerStars = "Star Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerStars == "Star Limit" then
			gGlobalSyncTable.LRStopTimerStars = "Behavior + Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 7 then
		
		if #LevelFunctionTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LFLevels > #LevelFunctionTable - 1 then
			gGlobalSyncTable.LFLevels = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LFLevels = gGlobalSyncTable.LFLevels + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LFLevels < 2 then
			gGlobalSyncTable.LFLevels = #LevelFunctionTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LFLevels = gGlobalSyncTable.LFLevels - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		end
		
		if RunsLFSelected == 8 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRLevelArea > 15 then
			gGlobalSyncTable.LRLevelArea = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRLevelArea = gGlobalSyncTable.LRLevelArea + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRLevelArea < 2 then
			gGlobalSyncTable.LRLevelArea = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRLevelArea = gGlobalSyncTable.LRLevelArea - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 9 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRLevelAct > 7 then
			gGlobalSyncTable.LRLevelAct = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRLevelAct = gGlobalSyncTable.LRLevelAct + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRLevelAct < 1 then
			gGlobalSyncTable.LRLevelAct = 8
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRLevelAct = gGlobalSyncTable.LRLevelAct - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 10 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level Location" then
			gGlobalSyncTable.LRCombinedLevels = "Area Number"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "Area Number" then
			gGlobalSyncTable.LRCombinedLevels = "Act Number"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "Act Number" then
			gGlobalSyncTable.LRCombinedLevels = "Level + Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level + Area" then
			gGlobalSyncTable.LRCombinedLevels = "Level + Act"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level + Act" then
			gGlobalSyncTable.LRCombinedLevels = "All Options"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedLevels == "All Options" then
			gGlobalSyncTable.LRCombinedLevels = "Level Location"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "All Options" then
			gGlobalSyncTable.LRCombinedLevels = "Level + Act"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level + Act" then
			gGlobalSyncTable.LRCombinedLevels = "Level + Area"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level + Area" then
			gGlobalSyncTable.LRCombinedLevels = "Act Number"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "Act Number" then
			gGlobalSyncTable.LRCombinedLevels = "Area Number"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "Area Number" then
			gGlobalSyncTable.LRCombinedLevels = "Level Location"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedLevels == "Level Location" then
			gGlobalSyncTable.LRCombinedLevels = "All Options"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 11 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledLevels == "Stop Timer" then
			gGlobalSyncTable.LREnabledLevels = "Combined Levels"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledLevels == "Combined Levels" then
			gGlobalSyncTable.LREnabledLevels = "Disabled"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledLevels == "Disabled" then
			gGlobalSyncTable.LREnabledLevels = "Stop Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledLevels == "Disabled" then
			gGlobalSyncTable.LREnabledLevels = "Combined Levels"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledLevels == "Combined Levels" then
			gGlobalSyncTable.LREnabledLevels = "Stop Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledLevels == "Stop Timer" then
			gGlobalSyncTable.LREnabledLevels = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 12 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level Location" then
			gGlobalSyncTable.LRStopTimerLevels = "Area Number"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Area Number" then
			gGlobalSyncTable.LRStopTimerLevels = "Act Number"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Act Number" then
			gGlobalSyncTable.LRStopTimerLevels = "Level + Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level + Area" then
			gGlobalSyncTable.LRStopTimerLevels = "Level + Act"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level + Act" then
			gGlobalSyncTable.LRStopTimerLevels = "All Options"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerLevels == "All Options" then
			gGlobalSyncTable.LRStopTimerLevels = "Level Location"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "All Options" then
			gGlobalSyncTable.LRStopTimerLevels = "Level + Act"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level + Act" then
			gGlobalSyncTable.LRStopTimerLevels = "Level + Area"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level + Area" then
			gGlobalSyncTable.LRStopTimerLevels = "Act Number"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Act Number" then
			gGlobalSyncTable.LRStopTimerLevels = "Area Number"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Area Number" then
			gGlobalSyncTable.LRStopTimerLevels = "Level Location"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerLevels == "Level Location" then
			gGlobalSyncTable.LRStopTimerLevels = "All Options"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 13 then
		
		if #ActionsTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LFActions > #ActionsTable - 1 then
			gGlobalSyncTable.LFActions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LFActions = gGlobalSyncTable.LFActions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LFActions < 2 then
			gGlobalSyncTable.LFActions = #ActionsTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LFActions = gGlobalSyncTable.LFActions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		end
		
		if RunsLFSelected == 14 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRLevelActionTimerSave > 998 then
			gGlobalSyncTable.LRLevelActionTimerSave = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRLevelActionTimerSave = gGlobalSyncTable.LRLevelActionTimerSave + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRLevelActionTimerSave < 1 then
			gGlobalSyncTable.LRLevelActionTimerSave = 999
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRLevelActionTimerSave = gGlobalSyncTable.LRLevelActionTimerSave - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 15 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedActions == "Only Actions" then
			gGlobalSyncTable.LRCombinedActions = "Action + Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
			gGlobalSyncTable.LRCombinedActions = "Only Actions"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedActions == "Action + Timer" then
			gGlobalSyncTable.LRCombinedActions = "Only Actions"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedActions == "Only Actions" then
			gGlobalSyncTable.LRCombinedActions = "Action + Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 16 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledActions == "Stop Timer" then
			gGlobalSyncTable.LREnabledActions = "Combined Actions"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledActions == "Combined Actions" then
			gGlobalSyncTable.LREnabledActions = "Disabled"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledActions == "Disabled" then
			gGlobalSyncTable.LREnabledActions = "Stop Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledActions == "Disabled" then
			gGlobalSyncTable.LREnabledActions = "Combined Actions"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledActions == "Combined Actions" then
			gGlobalSyncTable.LREnabledActions = "Stop Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledActions == "Stop Timer" then
			gGlobalSyncTable.LREnabledActions = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 17 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerActions == "Only Actions" then
			gGlobalSyncTable.LRStopTimerActions = "Action + Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerActions == "Action + Timer" then
			gGlobalSyncTable.LRStopTimerActions = "Only Actions"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerActions == "Action + Timer" then
			gGlobalSyncTable.LRStopTimerActions = "Only Actions"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerActions == "Only Actions" then
			gGlobalSyncTable.LRStopTimerActions = "Action + Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 18 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBXPosition > 18000 then
			gGlobalSyncTable.LRPBXPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBXPosition = gGlobalSyncTable.LRPBXPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBXPosition < -18000 then
			gGlobalSyncTable.LRPBXPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBXPosition = gGlobalSyncTable.LRPBXPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBXPosition < -18000 then
			gGlobalSyncTable.LRPBXPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBXPosition = gGlobalSyncTable.LRPBXPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBXPosition > 18000 then
			gGlobalSyncTable.LRPBXPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBXPosition = gGlobalSyncTable.LRPBXPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 19 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBYPosition > 18000 then
			gGlobalSyncTable.LRPBYPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBYPosition = gGlobalSyncTable.LRPBYPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBYPosition < -18000 then
			gGlobalSyncTable.LRPBYPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBYPosition = gGlobalSyncTable.LRPBYPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBYPosition < -18000 then
			gGlobalSyncTable.LRPBYPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBYPosition = gGlobalSyncTable.LRPBYPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBYPosition > 18000 then
			gGlobalSyncTable.LRPBYPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBYPosition = gGlobalSyncTable.LRPBYPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 20 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBZPosition > 18000 then
			gGlobalSyncTable.LRPBZPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBZPosition = gGlobalSyncTable.LRPBZPosition + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBZPosition < -18000 then
			gGlobalSyncTable.LRPBZPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBZPosition = gGlobalSyncTable.LRPBZPosition - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBZPosition < -18000 then
			gGlobalSyncTable.LRPBZPosition = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBZPosition = gGlobalSyncTable.LRPBZPosition + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBZPosition > 18000 then
			gGlobalSyncTable.LRPBZPosition = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBZPosition = gGlobalSyncTable.LRPBZPosition - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 21 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBXPositionExtra > 18000 then
			gGlobalSyncTable.LRPBXPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBXPositionExtra = gGlobalSyncTable.LRPBXPositionExtra + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBXPositionExtra < -18000 then
			gGlobalSyncTable.LRPBXPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBXPositionExtra = gGlobalSyncTable.LRPBXPositionExtra - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBXPositionExtra < -18000 then
			gGlobalSyncTable.LRPBXPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBXPositionExtra = gGlobalSyncTable.LRPBXPositionExtra + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBXPositionExtra > 18000 then
			gGlobalSyncTable.LRPBXPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBXPositionExtra = gGlobalSyncTable.LRPBXPositionExtra - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 22 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBYPositionExtra > 18000 then
			gGlobalSyncTable.LRPBYPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBYPositionExtra = gGlobalSyncTable.LRPBYPositionExtra + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBYPositionExtra < -18000 then
			gGlobalSyncTable.LRPBYPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBYPositionExtra = gGlobalSyncTable.LRPBYPositionExtra - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBYPositionExtra < -18000 then
			gGlobalSyncTable.LRPBYPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBYPositionExtra = gGlobalSyncTable.LRPBYPositionExtra + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBYPositionExtra > 18000 then
			gGlobalSyncTable.LRPBYPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBYPositionExtra = gGlobalSyncTable.LRPBYPositionExtra - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 23 then
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and gGlobalSyncTable.LRPBZPositionExtra > 18000 then
			gGlobalSyncTable.LRPBZPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			gGlobalSyncTable.LRPBZPositionExtra = gGlobalSyncTable.LRPBZPositionExtra + 100	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and gGlobalSyncTable.LRPBZPositionExtra < -18000 then
			gGlobalSyncTable.LRPBZPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			gGlobalSyncTable.LRPBZPositionExtra = gGlobalSyncTable.LRPBZPositionExtra - 100
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRPBZPositionExtra < -18000 then
			gGlobalSyncTable.LRPBZPositionExtra = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LRPBZPositionExtra = gGlobalSyncTable.LRPBZPositionExtra + 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRPBZPositionExtra > 18000 then
			gGlobalSyncTable.LRPBZPositionExtra = 0
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LRPBZPositionExtra = gGlobalSyncTable.LRPBZPositionExtra - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 24 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "All Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "All Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "All Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "All Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "All Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y + Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X + Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X + Y Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Z Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "X Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X Position Box" then
			gGlobalSyncTable.LRCombinedPositionBox = "Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Z Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "Y Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "X Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRCombinedPositionBox == "X Position Area" then
			gGlobalSyncTable.LRCombinedPositionBox = "All Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 25 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Stop Timer" then
			gGlobalSyncTable.LREnabledPositionBox = "Combined PBox"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox" then
			gGlobalSyncTable.LREnabledPositionBox = "Disabled"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Disabled" then
			gGlobalSyncTable.LREnabledPositionBox = "Stop Timer"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Disabled" then
			gGlobalSyncTable.LREnabledPositionBox = "Combined PBox"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Combined PBox" then
			gGlobalSyncTable.LREnabledPositionBox = "Stop Timer"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LREnabledPositionBox == "Stop Timer" then
			gGlobalSyncTable.LREnabledPositionBox = "Disabled"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsLFSelected == 26 then
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "All Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "All Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "All Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "All Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "All Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "All Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "All Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y + Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X + Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X + Y Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Z Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X Position Box" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Z Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Z Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "Y Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "Y Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "X Position Area"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LRStopTimerPositionBox == "X Position Area" then
			gGlobalSyncTable.LRStopTimerPositionBox = "All Position Box"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		end
		
		if RunsMenus == 3 then

		if #AntiCheatTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and AntiCheatDefault > #AntiCheatTable - 1 then
			AntiCheatDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			AntiCheatDefault = AntiCheatDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and AntiCheatDefault < 2 then
			AntiCheatDefault = #AntiCheatTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			AntiCheatDefault = AntiCheatDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if #AntiCheatTable == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
            play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.AntiCheatsSlots ~= AntiCheatTable[AntiCheatDefault].AntiCheatNumber then
			Secondstopress = 10
			djui_popup_create_global("A Anti-Cheat Has Been Chosen:\n" .. AntiCheatName .. '', 2)
			gGlobalSyncTable.AntiCheatsSlots = AntiCheatTable[AntiCheatDefault].AntiCheatNumber
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.AntiCheatsSlots == AntiCheatTable[AntiCheatDefault].AntiCheatNumber then
			Secondstopress = 10
			gGlobalSyncTable.AntiCheatsSlots = 0
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
			
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
        RunsMenus = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		
		if RunsMenus == 4 then

		if #RunTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and RunDefault > #RunTable - 1 then
			RunDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			RunDefault = RunDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and RunDefault < 2 then
			RunDefault = #RunTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			RunDefault = RunDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if #RunTable == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
            play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.PluginsRunsSlots ~= RunTable[RunDefault].RunsSlotNumber then
			Secondstopress = 10
			gGlobalSyncTable.PluginsRunsSlots = RunTable[RunDefault].RunsSlotNumber
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.PluginsRunsSlots == RunTable[RunDefault].RunsSlotNumber then
			Secondstopress = 10
			gGlobalSyncTable.PluginsRunsSlots = 0
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
			
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
        RunsMenus = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		end
	end
	
		if gGlobalSyncTable.GamemodeSetting == "SingleStars" and StrOption == 3 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and Secondstopress == 0 then
		Secondstopress = 10
		gGlobalSyncTable.SingleStarsMode = true
		gGlobalSyncTable.SingleStarsWarp = 4
		gGlobalSyncTable.SingleStarsTextChange = 150
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.SingleStarsCollectedStar = gGlobalSyncTable.SingleStarsStarNumbers
		openstrmenu = false
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and SingleStarsUDMovement < 2 then
			SingleStarsUDMovement = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			SingleStarsUDMovement = SingleStarsUDMovement - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and SingleStarsUDMovement > 4 then
			SingleStarsUDMovement = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			SingleStarsUDMovement = SingleStarsUDMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if SingleStarsUDMovement == 1 and #LevelsTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.LevelsDefault > #LevelsTable - 1 then
			gGlobalSyncTable.LevelsDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.LevelsDefault = gGlobalSyncTable.LevelsDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.LevelsDefault < 2 then
			gGlobalSyncTable.LevelsDefault = #LevelsTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.LevelsDefault = gGlobalSyncTable.LevelsDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SingleStarsUDMovement == 2 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsAreaID > 15 then
			gGlobalSyncTable.SingleStarsAreaID = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SingleStarsAreaID = gGlobalSyncTable.SingleStarsAreaID + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsAreaID < 2 then
			gGlobalSyncTable.SingleStarsAreaID = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SingleStarsAreaID = gGlobalSyncTable.SingleStarsAreaID - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SingleStarsUDMovement == 3 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsActID > 15 then
			gGlobalSyncTable.SingleStarsActID = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SingleStarsActID = gGlobalSyncTable.SingleStarsActID + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsActID < 2 then
			gGlobalSyncTable.SingleStarsActID = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SingleStarsActID = gGlobalSyncTable.SingleStarsActID - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SingleStarsUDMovement == 4 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStarNumbers > 15 then
			gGlobalSyncTable.SingleStarsStarNumbers = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			gGlobalSyncTable.SingleStarsStarNumbers = gGlobalSyncTable.SingleStarsStarNumbers + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStarNumbers < 2 then
			gGlobalSyncTable.SingleStarsStarNumbers = 16
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			gGlobalSyncTable.SingleStarsStarNumbers = gGlobalSyncTable.SingleStarsStarNumbers - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SingleStarsUDMovement == 5 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Grand Star" then
			gGlobalSyncTable.SingleStarsStopTimer = "Amount Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" then
			gGlobalSyncTable.SingleStarsStopTimer = "Star ID"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Star ID" then
			gGlobalSyncTable.SingleStarsStopTimer = "Key 1/2"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Key 1/2" then
			gGlobalSyncTable.SingleStarsStopTimer = "Bowser Arenas"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Bowser Arenas" then
			gGlobalSyncTable.SingleStarsStopTimer = "Cake Ending"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" then
			gGlobalSyncTable.SingleStarsStopTimer = "Cap Switches"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" then
			gGlobalSyncTable.SingleStarsStopTimer = "Grand Star"
			 play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Grand Star" then
			gGlobalSyncTable.SingleStarsStopTimer = "Cap Switches"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Cap Switches" then
			gGlobalSyncTable.SingleStarsStopTimer = "Cake Ending"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Cake Ending" then
			gGlobalSyncTable.SingleStarsStopTimer = "Bowser Arenas"
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Bowser Arenas" then
			gGlobalSyncTable.SingleStarsStopTimer = "Key 1/2"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Key 1/2" then
			gGlobalSyncTable.SingleStarsStopTimer = "Star ID"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Star ID" then
			gGlobalSyncTable.SingleStarsStopTimer = "Amount Limit"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and gGlobalSyncTable.SingleStarsStopTimer == "Amount Limit" then
			gGlobalSyncTable.SingleStarsStopTimer = "Grand Star"
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
		StrOption = 0
		Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
	
		if Secondstopress == 0 then
		if (MenuInputCheck & START_BUTTON) ~= 0 then
            openstrmenu = false
			MainOptions = 1
			StrOption = 0
			ArrowsMovement = 0
			ExtraOptionUD = 1
			ExtraOptionLR = 1
			SelectedExtra = 0
			Secondstopress = 10
			RunsMenus = 0
			RunsSPSelected = 0
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
	end
	end
end

function displaymenu(m)

	if not openmenu then return end

	if network_is_server() then
	PlayersText = "Press A to Select, Press B to Close the Menu, Press Y to Open the Main Menu"
	else
	PlayersText = "Press A to Select, Press B to Close the Menu"
	end
	
	if Menus == 1 then
		if MenuOptions == 1 then
		ArrowPositionLRUp = -86
		ArrowPositionUp = -90
		elseif MenuOptions == 2 then
		ArrowPositionLRUp = -21
		ArrowPositionUp = -90
		elseif MenuOptions == 3 then
		ArrowPositionLRUp = 38
		ArrowPositionUp = -90
		elseif MenuOptions == 4 then
		ArrowPositionLRUp = 89
		ArrowPositionUp = -90
		end
	end
		
	if Menus == 4 then
		if SettingsOptions == 1 then
		ArrowPositionLRUp = -121
		ArrowPositionUp = -93
		elseif SettingsOptions == 2 then
		ArrowPositionLRUp = -66
		ArrowPositionUp = -93
		elseif SettingsOptions == 3 then
		ArrowPositionLRUp = 0
		ArrowPositionUp = -93
		elseif SettingsOptions == 4 then
		ArrowPositionLRUp = 64
		ArrowPositionUp = -93
		elseif SettingsOptions == 5 then
		ArrowPositionLRUp = 115
		ArrowPositionUp = -93
		end
	end
	
	if CommandMenuOption == "Commands" then
	commandmenuname = "Commands Toggle"
	else
	commandmenuname = "Buttons Toggle"
	end
	
		if showSpeedrunTimer == 1 then
		ChangeTimerColor = "#00FF00"
		else
		ChangeTimerColor = "#FF0000"
		end
		
		if Rules_Display == 1 then
		ChangeRulesColor = "#00FF00"
		else
		ChangeRulesColor = "#FF0000"
		end
		
		if ControlsHelper == 1 then
		ChangeHelperColor = "#00FF00"
		else
		ChangeHelperColor = "#FF0000"
		end
		
		if ControlsHelper == 1 then
		ChangeHelperColor = "#00FF00"
		else
		ChangeHelperColor = "#FF0000"
		end
		
		if gGlobalSyncTable.Intermission == true or (DisableWarps == true or Disable_Custom_Warps == true) then
		WarpColor = "#7a7a7a"
		else
		WarpColor = "#FFFFFF"
		end
	
		if gPlayerSyncTable[0].TeamColors == 1 and gGlobalSyncTable.SpeedrunTeams then
		TeamColor = "#f90303"
		elseif gPlayerSyncTable[0].TeamColors == 2 and gGlobalSyncTable.SpeedrunTeams then
		TeamColor = "#3903ff"
		elseif not gGlobalSyncTable.SpeedrunTeams then
		TeamColor = "#7a7a7a"
		end
		
	if SwitchColorOptions == 1 then
	Switch_Color_text = "L Trigger: Switch to The Font Color"
	elseif SwitchColorOptions == 0 then
	Switch_Color_text = "L Trigger: Switch to The Rect Color"
	end
	
	if DisplayCustomColors == 1 then
		SetColorCheck = "#00FF00"
		DisplayFontSettings = "#FFFFFF"
		else
		SetColorCheck = "#FF0000"
		DisplayFontSettings = "#7a7a7a"
	end
	
	if FontSettings == 0 then
	if FontTable[DefaultFont].name == FontTable[DefaultFont].name then
		 Fonts_names = FontTable[DefaultFont].longname
		end
	end
	
	if FontSettings == 4 then
	if FanfareTable[FanfareDefault].fanfare_sound == FanfareTable[FanfareDefault].fanfare_sound then
		 Fanfare_names = FanfareTable[FanfareDefault].long_fanfare_name
	end
		
	if CountdownTable[CountdownDefault].countdown_sound == CountdownTable[CountdownDefault].countdown_sound then
		 Countdown_names = CountdownTable[CountdownDefault].long_countdown_name
	end
		
	if GoTable[GoDefault].go_sound == GoTable[GoDefault].go_sound then
		 Go_names = GoTable[GoDefault].long_go_name
		end
	end
	
	if FontSettings == 1 then
		if FontMenuOptions == 1 then
		ArrowPositionLRUp = -80
		ArrowPositionUp = -90
		elseif FontMenuOptions == 2 then
		ArrowPositionLRUp = 0
		ArrowPositionUp = -90
		elseif FontMenuOptions == 3 then
		ArrowPositionLRUp = 80
		ArrowPositionUp = -90
		end
	end
		
	if FontSettings == 4 then
		ArrowPositionLeft = -140
		ArrowPositionRight = 140
		if SoundsSettings == 1 then
		ArrowPositionUDLeft = -175
		ArrowPositionUDRight = -175
		elseif SoundsSettings == 2 then
		ArrowPositionUDLeft = -125
		ArrowPositionUDRight = -125
		elseif SoundsSettings == 3 then
		ArrowPositionUDLeft = -75
		ArrowPositionUDRight = -75
		end
	end
	
	if FontSettings == 2 then
		if ColorOptions == 1 then
		ArrowPositionLRUp = -96
		ArrowPositionUp = -150
		ArrowPositionLRDown = -98
		ArrowPositionDown = -115
		elseif ColorOptions == 2 then
		ArrowPositionLRUp = -36
		ArrowPositionUp = -150
		ArrowPositionLRDown = -38
		ArrowPositionDown = -115
		elseif ColorOptions == 3 then
		ArrowPositionLRUp = 34
		ArrowPositionUp = -150
		ArrowPositionLRDown = 32
		ArrowPositionDown = -115
		elseif ColorOptions == 4 then
		ArrowPositionLRUp = 94
		ArrowPositionUp = -150
		ArrowPositionLRDown = 92
		ArrowPositionDown = -115
		end
	end
	
	if FontSettings == 3 then
		if PositionsMenuOptions == 1 then
		ArrowPositionLRUp = -52
		ArrowPositionUp = -150
		ArrowPositionLRDown = -54
		ArrowPositionDown = -115
		elseif PositionsMenuOptions == 2 then
		ArrowPositionLRUp = 48
		ArrowPositionUp = -150
		ArrowPositionLRDown = 46
		ArrowPositionDown = -115
		end
	end

	TeamColor = TeamColor
	
	modversion = {
		{
            "Speedrun Timer Reworked V1.4",
            95,
            220,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
		},
	}

	menumaintext = {
		{
            "CONFIG MENU",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "" .. PlayersText .. "",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	menubuttons = {
		{
            "Right: Next Option",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Option",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	Info_Texts = {
		{
            "Info Display",
            -85,
            -110,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Fonts_Texts = {
		{
            "Fonts Menu",
            -20,
            -110,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Settings_Texts = {
		{
            "Settings",
             40,
            -110,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Warp_Texts = {
		{
            "Warp",
             90,
            -110,
            globalFont,
            creditscale - 0.6,
            WarpColor
        }
	}
	
	HelperPopup_Texts = {
		{
            "Helper Popup",
            -120,
            -110,
            globalFont,
            creditscale - 0.65,
            ChangeHelperColor
        }
	}
	
	Timer_Texts = {
		{
            "Timer Display",
            -65,
            -110,
            globalFont,
            creditscale - 0.65,
            ChangeTimerColor
        }
	}
	
	CommandMenu_Texts = {
		{
            commandmenuname,
             0,
            -110,
            globalFont,
            creditscale - 0.65,
            creditcolor
        }
	}
	
	Rules_Texts = {
		{
            "Rules Display",
             65,
            -110,
            globalFont,
            creditscale - 0.65,
            ChangeRulesColor
        }
	}
	
	Teams_Texts = {
		{
            "Teams",
             115,
            -110,
            globalFont,
            creditscale - 0.65,
            TeamColor
        }
	}
	
	Arrow_Up = {
		{
            "^",
            ArrowPositionLRUp,
            ArrowPositionUp,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Down = {
		{
            "v",
            ArrowPositionLRDown,
            ArrowPositionDown,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	backtext = {
		{
            "Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
	}
	whatsnewtexts = {
		{
            "What's New?",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            'Added Runs Menu',
            0,
            -200,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
        {
		
			'Added Gamemodes Types',
            0,
            -170,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Back The Intro Option',
            0,
            -140,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Menu Command/Buttons Toggle',
            0,
            -110,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Starting Option Settings For The Host',
            0,
            -80,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Back 31, 45, and 50 Stars on the SM64 Rules',
            0,
            -50,
            globalFont,
            creditscale - 0.4,
            creditcolor
        }
	}
	
    creditstexts = {
		{
            "Credits",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Original Mod By EmeraldLockdown",
            0,
            -205,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
        {
		
			"Mod By JairoThePlumber",
            0,
            -188,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Star Road Postions by Mr.Needlemouse",
            0,
            -170,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Sm64 Rules by Sunk",
            0,
            -150,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Rules Mod by Kaje",
            0,
            -130,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Reset Save File Code by EmilyEmmi",
            0,
            -110,
            globalFont,
			creditscale - 0.6,
            creditcolor
        },
		{
		
			"Save Function From CS Mod by Squishy",
            0,
            -90,
            globalFont,
			creditscale - 0.6,
            creditcolor
        },
		{
		
			"Bingo Mod by Blocky and Skeltan",
            0,
            -70,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"The SM64 Coop Deluxe Team",
            0,
            -51,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"And Everyone Who help Test This Mod",
            0,
            -33,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
    }
	
	changestexts = {
		{
            "Changelog",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Reworked Some Changes To The Mod Itself",
            0,
            -200,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
		
			"Reworked The Custom Anti-Cheat Plugin to have it's own Menu",
            0,
            -185,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Reworked Intermission and Countdown Functions For the Gamemodes",
            0,
            -170,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Reworked Fanfare, Countdown, and Go Sounds For The Gamemodes",
            0,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Reworked Lives System (Meaning The Lives Plugin Is No Longer Needed)",
            0,
            -140,
            globalFont,
			creditscale - 0.7,
            creditcolor
        },
		{
		
			"Now Custom Plugins has it's Own Option",
			0,
            -125,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"The Freeze Warp now works without using a Romhack",
            0,
            -110,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Now There's Global Saves for Some Options",
            0,
            -95,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Causal is Now a Gamemode Option",
            0,
            -80,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Update The Indicator to add Gamemodes",
            0,
            -65,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"The Level Resets After Selecting a Different Gamemode",
            0,
            -50,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Adjust Some Functions to work properly",
            0,
            -35,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
    }
	
    playtesterstexts = {
		{
            "PlayTesters",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "BeanMKW",
            -110,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Key's Artwork",
            -110,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Vanilla",
            -110,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"DT_Ryan",
            -110,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mayo",
            -110,
            -160,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"LeoHaha",
            -110,
            -150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"DeathHawk789",
            -110,
            -140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Player",
            -110,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Issac",
            -110,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"ColbyRayz!",
            -110,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"JoseGera1012",
            -110,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Blazingmo6",
            -110,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"octi",
            -110,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LightWolf12745",
            -110,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mr.Pear",
            -110,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"jrb64",
            -110,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "SONIC12649S",
			-110,
            -40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Mongulus",
            -110,
            -30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"dav",
            -40,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"YUSUKE",
            -40,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"SomeIdot",
            -40,
            -180,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"LuisJoanXD",
            -40,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"prople",
            -40,
            -160,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LF64",
            -40,
			-150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mr.Needlemouse",
            -40,
			-140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"davidelxd24",
            -40,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Jugador",
            -40,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LuigiChavistaNoob",
            -40,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"omar",
            -40,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Kaice",
            -40,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Alv_ar0i",
            -40,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Tona",
            -40,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"ShadowX",
            -40,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"IvanZ",
            -40,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"SuperChicago64",
            -40,
			-40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Ricardocxy",
            -40,
			-30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Isaackie",
             30,
			-200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"max",
             30,
			-190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"TurboSebas",
             30,
			-180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"viveinsano",
             30,
			-170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Luigi",
             30,
			-160,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Kaice",
             30,
			-150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"OmniXerz",
             30,
			-140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"HiEpik",
             30,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Stickmanboiepic",
             30,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"panm.d",
             30,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"SonicGamer2923Y",
             30,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Destyps3",
             30,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Luis",
             30,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"RandomahhWaffle",
             30,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"agrazz",
             30,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"darkshadow7813",
             30,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Urisen",
             30,
			-40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Polyer2",
             30,
			-30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"haker",
             100,
			-200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"qwertyguy",
             100,
			-190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Player1",
             100,
			-180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Somaritheadvent",
             100,
			-170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Maro77",
             100,
			-160,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"shingi-cat",
             100,
			-150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"codeterminal",
             100,
			-140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"CarnivorousMoose",
             100,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mairo",
             100,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"janKali",
             100,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"das_dis",
             100,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Samar",
             100,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"bonittog",
             100,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"_beenis",
             100,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"MARIOGAMER",
             100,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LmFoLM64",
             100,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"boyfriendyt",
             100,
			-40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Bolt",
             100,
			-30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
    }
	
	fixedtexts = {
		{
            "Fixed Bugs",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            'Fixed Menu JoyStick being too Sensitive',
            0,
            -200,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
        {
		
			'Fixed Warping sometimes not Working',
            0,
            -180,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Restart Timer Not Resetting Some Functions",
            0,
            -160,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Save File Desync (I Hope)",
            0,
            -140,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Fanfare not playing sometimes",
            0,
            -120,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Not be able to reset after finishing a run",
            0,
            -100,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed More Desync issues (hopefully)",
            0,
            -80,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Some Issues that I didn't Check",
            0,
            -60,
            globalFont,
            creditscale - 0.6,
            creditcolor
        },
		{
		
			"Fixed Timer Not Stopping Sometimes??",
            0,
            -40,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
    }
	
	controlstexts = {
	{
            "Button Controls",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
		
			"L Trigger + X Button:",
            0,
            -180,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"(Start the Speedrun)",
            0,
            -160,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"L Trigger + Y Button:",
            0,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"(Reset the Timer)",
            0,
            -110,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "L Trigger + R Trigger + Start Button:",
            0,
            -80,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "(Restarting the Save File)",
            0,
            -60,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	compatiblemodstexts = {
		{
            "Compatible Mods",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Any Moveset Mods",
            0,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Yuyake Kasarion",
            0,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Sonic Character: Rebooted",
            0,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Pasta Castle",
            0,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Veph the Dolphin-Fox",
            0,
            -160,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"Minecraft",
            0,
            -150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Smash Brothers",
            0,
            -140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Milne the Crystal Fox",
            0,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Hat Kid",
            0,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Boyo!",
            0,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Sonic Character",
            0,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Only Up 64 Plugin",
            0,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Personal Star Counter",
            0,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Verbose Notifications",
            0,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Any Indicator Mods",
            0,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mari0",
            0,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        }
    }
	
	incompatiblemodstexts = {
		{
            "Incompatible Mods",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Cheats",
            -50,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Any Gamemode Mods",
            -50,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Wega Jumpscare",
            -50,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Object Spawner",
            -50,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Faster Bubble Speed",
            -50,
            -160,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"No Lives",
            -50,
            -150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Anti-Instakills",
            -50,
            -140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Remove Star Spawn Cutscenes",
            -50,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Faster Swimming",
            -50,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Death Crash",
            -50,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Clones",
            -50,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Random Objects",
           -50,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Falling Bombs",
            -50,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Door Bust",
            -50,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Complete Save",
            -50,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"WIND",
            -50,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Savestates",
            -50,
			-40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Noclip",
            -50,
			-30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "Random Wega Jumpscare",
            50,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Beard's Mod",
            50,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Save and Load Position",
            50,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LiveSplit 64 (Just A Warning)",
            50,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        }
    }
	
	infobuttons = {
		{
            "INFO DISPLAY",
            3,
            yhudposition2,
            hudFont,
            creditscale - 0.3,
            creditcolor,
			true,
			false
        },
		{
            "Right: Next Info",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Info",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}

	fontsmaintext = {
		{
            "FONTS MENU",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Save a Font, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select Font",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	fontsbuttons = {
		{
            "Right: Next Font",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Font",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	FontSettingsText = {
		{
            "Press Y For Colors Settings",
            0,
            -120,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	fontsnames = {
		{
            Fonts_names,
            0,
            -110,
            globalFont,
            creditscale - 0.3,
            creditcolor
        }
	}
	
	fontstitlestext = {
		{
            "FONTS SETTINGS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Set_Custom_Color_Texts = {
		{
            "Custom Colors",
            -80,
            -110,
            globalFont,
            creditscale - 0.4,
            SetColorCheck
        }
	}
	
	Set_Color_Texts = {
		{
            "Set Color",
            -0,
            -110,
            globalFont,
            creditscale - 0.4,
            DisplayFontSettings
        }
	}
	
	Position_Texts = {
		{
            "Set Position",
             80,
            -110,
            globalFont,
            creditscale - 0.4,
            creditcolor
        }
	}
	
	set_color_title = {
		{
            "SET COLOR",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Save, Press B to Go Back, Press Y to Reset Color",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Apply",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	ColorNames = {
		{
            "Red",
            -95,
            -170,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Green",
            -35,
            -170,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "Blue",
            35,
            -170,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Visable",
            95,
            -170,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	ColorTexts = {
		{
            "" .. RedColorFont .. "",
            -95,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. GreenColorFont .. "",
            -35,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. BlueColorFont .. "",
            35,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "" .. VisableFont .. "",
            95,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	RectColorTexts = {
		{
            "" .. RedColorRect .. "",
            -95,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. GreenColorRect .. "",
            -35,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
            "" .. BlueColorRect .. "",
            35,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "" .. VisableRect .. "",
            95,
            -130,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	SwitchColor = {
		{
            Switch_Color_text,
            0,
            -50,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	set_position_title = {
		{
            "SET POSITION",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Save, Press B to Go Back, Press Y to Reset Position",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Apply",
            -5,
            -40,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Custom_Positon_Names = {
		{
            "X Position",
            -50,
            -170,
            globalFont,
            creditscale - 0.3,
            creditcolor
        },
		{
            "Y Position",
            50,
            -170,
            globalFont,
            creditscale - 0.3,
            creditcolor
        }
	}
	
	Custom_Positon_Texts = {
		{
            "" .. CustomXPos .. "",
            -50,
            -130,
            globalFont,
            creditscale - 0.3,
            creditcolor
        },
		{
            "" .. CustomYPos .. "",
            50,
            -130,
            globalFont,
            creditscale - 0.3,
            creditcolor
        }
	}
	
	
	settingsmaintext = {
		{
            "SETTINGS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Select, Press B to Go Back",
            0,
            -15,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Left = {
		{
            "<",
            ArrowPositionLeft,
            ArrowPositionUDLeft,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Arrow_Right = {
		{
            ">",
            ArrowPositionRight,
            ArrowPositionUDRight,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Switch_Sounds = {
		{
            "Press R For Sounds Settings",
            0,
            -87,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	soundsbuttons = {
		{
            "Right: Next Sound",
            60,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			false,
			true
        },
		{
            "Left: Previous Sound",
            8,
            0,
            globalFont,
            creditscale - 0.7,
            creditcolor,
			true,
			false
        }
	}
	
	soundstitlestext = {
		{
            "SOUNDS SETTINGS",
            0,
            yhudposition,
            hudFont,
            creditscale - 0.2,
            creditcolor
        },
		{
            "Press A to Save Sounds, Press B to Go Back",
            0,
            -30,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	soundtextnames = {
		{
            "Fanfare Sounds:",
            0,
            -180,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Countdown Sounds:",
            0,
            -130,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "Go Sounds:",
            0,
            -80,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	fanfarenames = {
		{
            Fanfare_names,
            0,
            -170,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	countdownnames = {
		{
            Countdown_names,
            0,
            -120,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}
	
	gonames = {
		{
            Go_names,
            0,
            -70,
            globalFont,
            creditscale - 0.5,
            creditcolor
        }
	}

    -----------------------------------------
    -- Main code:
    if (openmenu == true) then
		renderRect(190, 120, FONT_MENU, 10000, 240, "#000000") 
		
		for _, v in ipairs(modversion) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		-- print all texts
	if Menus == 1 then
        for _, v in ipairs(menumaintext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        for _, v in ipairs(Info_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Settings_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        for _, v in ipairs(Fonts_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
        for _, v in ipairs(Warp_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
	end
	
	if Menus == 2 then
        for _, v in ipairs(backtext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(infobuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		if buttonispressed == 0 then
		for _, v in ipairs(whatsnewtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 1 then
		for _, v in ipairs(creditstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 2 then
		for _, v in ipairs(changestexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 3 then
		for _, v in ipairs(playtesterstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 4 then
		for _, v in ipairs(fixedtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 5 then
		for _, v in ipairs(controlstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 6 then
		for _, v in ipairs(compatiblemodstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 7 then
		for _, v in ipairs(incompatiblemodstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
	end
	
	if Menus == 3 then
	if FontSettings == 0 then
        for _, v in ipairs(fontsmaintext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(fontsbuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Switch_Sounds) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end

        for _, v in ipairs(fontsnames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(FontSettingsText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		end
	if FontSettings == 1 then		
        for _, v in ipairs(fontstitlestext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        for _, v in ipairs(Set_Custom_Color_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Set_Color_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Position_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		end
		
	if FontSettings == 2 then
		for _, v in ipairs(set_color_title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(ColorNames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Down) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		if RectFontsOnly == true then
		for _, v in ipairs(SwitchColor) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if SwitchColorOptions == 0 then
		for _, v in ipairs(ColorTexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		elseif SwitchColorOptions == 1 then
		for _, v in ipairs(RectColorTexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		end
	end
	
	if FontSettings == 3 then
		for _, v in ipairs(set_position_title) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Custom_Positon_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Custom_Positon_Names) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Down) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
	end
		
	if FontSettings == 4 then
		for _, v in ipairs(soundstitlestext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(fanfarenames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(countdownnames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(gonames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(soundtextnames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(soundsbuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		end
	end
	
	if Menus == 4 then
		for _, v in ipairs(settingsmaintext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(HelperPopup_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Timer_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
        for _, v in ipairs(Rules_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(CommandMenu_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Teams_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
	end
		if Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Menus == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MenuOptions > 3 then
			MenuOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			MenuOptions = MenuOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MenuOptions < 2 then
			MenuOptions = 4
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			MenuOptions = MenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 1 and Secondstopress == 0 then
		Menus = 2
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 2 and Secondstopress == 0 then
		Menus = 3
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 3 and Secondstopress == 0 then
		Menus = 4
		SettingsOptions = 1
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 4 then
		openmenu = false
		Secondstopress = 10
		if not (set_warp_position) and not (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) then
		set_warp_position = true
		else
		set_warp_position = false
		end
		if (Disable_Custom_Warps == true) then
		djui_popup_create("\\#FF0000\\Warps are disabled for this romhack, Because It's has a Custom Plugin to Disable Warps.", 2)
		end
		if (Disable_Custom_Warps == false) and (gGlobalSyncTable.Intermission or gGlobalSyncTable.startTimer) then
		djui_popup_create("\\#FF0000\\You only use this to avoid getting stuck, not using it for a speedrun", 2)
		end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
            openmenu = false
			Secondstopress = 10
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
	end
	
	if Menus == 2 then
		
		if Secondstopress == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and buttonispressed > 6 then
			buttonispressed = buttonispressed - 7
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and buttonispressed < 1 then
			buttonispressed = buttonispressed + 7
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
            Menus = 1
			Secondstopress = 10
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
				end
			end
		end
	
	if Menus == 3 then
		if FontSettings == 0 then
		ArrowPositionLRUp = -80
		ArrowPositionUp = -90
		end
		if FontSettings == 0 then
		
		if Secondstopress == 0 then
		if #FontTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and DefaultFont > #FontTable - 1 then
			DefaultFont = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			DefaultFont = DefaultFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and DefaultFont < 2 then
			DefaultFont = #FontTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			DefaultFont = DefaultFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if #FontTable == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
            play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if MenuOptions == 2 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
			djui_popup_create("".. Fonts_names .. "\nFont has been Selected \nSaving Font...", 3)
			Secondstopress = 10
			if FontTable[DefaultFont] ~= nil then
			pref_font(FontTable[DefaultFont])
			end
			end
		end
		
		if (MenuInputCheck & Y_BUTTON) ~= 0 and FontSettings == 0 and Secondstopress == 0 then
			FontSettings = 1
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & R_TRIG) ~= 0 and FontSettings == 0 and Secondstopress == 0 then
			FontSettings = 4
			Secondstopress = 10
			play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
            Menus = 1
			Secondstopress = 5
			Secondstopress = 10
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)			
			end
		end
	end
	
	if FontSettings == 1 then
		
		if DisplayCustomColors == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and FontMenuOptions > 2 then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			FontMenuOptions = FontMenuOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and FontMenuOptions < 2 then
			FontMenuOptions = FontMenuOptions + 2
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			FontMenuOptions = FontMenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if DisplayCustomColors == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and FontMenuOptions == 3 then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			FontMenuOptions = FontMenuOptions + 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and FontMenuOptions == 1 then
			FontMenuOptions = FontMenuOptions + 2
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
			Secondstopress = 10
			FontSettings = 0
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 2 and Secondstopress == 0 then
		FontSettings = 2
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 3 and Secondstopress == 0 then
		FontSettings = 3
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
		
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 1 and Secondstopress == 0 then
		Secondstopress = 10
		if DisplayCustomColors == 1 then
			DisplayCustomColors = 0
			mod_storage_save("DisplayColors", tostring(DisplayCustomColors))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			elseif DisplayCustomColors == 0 then
			DisplayCustomColors = 1
			mod_storage_save("DisplayColors", tostring(DisplayCustomColors))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
	end
	
	if FontSettings == 2 then
		
		if Secondstopress == 0 then
		if SwitchColorOptions == 0 then
		if ColorOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RedColorFont > 254 then
			RedColorFont = RedColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RedColorFont = RedColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RedColorFont < 1 then
			RedColorFont = RedColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RedColorFont = RedColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and GreenColorFont > 254 then
			GreenColorFont = GreenColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			GreenColorFont = GreenColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and GreenColorFont < 1 then
			GreenColorFont = GreenColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			GreenColorFont = GreenColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 3 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and BlueColorFont > 254 then
			BlueColorFont = BlueColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			BlueColorFont = BlueColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and BlueColorFont < 1 then
			BlueColorFont = BlueColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			BlueColorFont = BlueColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 4 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and VisableFont > 254 then
			VisableFont = VisableFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			VisableFont = VisableFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and VisableFont < 1 then
			VisableFont = VisableFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			VisableFont = VisableFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
				end
			end
		end
		
		if RectFontsOnly == true then
		if SwitchColorOptions == 1 then
		if ColorOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and RedColorRect > 254 then
			RedColorRect = RedColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			RedColorRect = RedColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and RedColorRect < 1 then
			RedColorRect = RedColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			RedColorRect = RedColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and GreenColorRect > 254 then
			GreenColorRect = GreenColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			GreenColorRect = GreenColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and GreenColorRect < 1 then
			GreenColorRect = GreenColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			GreenColorRect = GreenColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 3 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and BlueColorRect > 254 then
			BlueColorRect = BlueColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			BlueColorRect = BlueColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and BlueColorRect < 1 then
			BlueColorRect = BlueColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			BlueColorRect = BlueColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 4 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and VisableRect > 254 then
			VisableRect = VisableRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			VisableRect = VisableRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and VisableRect < 1 then
			VisableRect = VisableRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			VisableRect = VisableRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
				end
			end
		end
		
	
	if (MenuInputCheck & L_TRIG) ~= 0 and SwitchColorOptions == 0 and Secondstopress == 0 then
		SwitchColorOptions = 1
		Secondstopress = 10
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif (MenuInputCheck & L_TRIG) ~= 0 and SwitchColorOptions == 1 and Secondstopress == 0 then
		SwitchColorOptions = 0
		Secondstopress = 10
        play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end

	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchColorOptions == 0 and Secondstopress == 0 then
		Secondstopress = 10
		RedColorFont = 255
		GreenColorFont = 255
		BlueColorFont = 255
		VisableFont = 255
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchColorOptions == 1 and Secondstopress == 0 then
		Secondstopress = 10
		RedColorRect = 0
		GreenColorRect = 0
		BlueColorRect = 0
		VisableRect = 128
        play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and ColorOptions > 3 then
			ColorOptions = ColorOptions - 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			ColorOptions = ColorOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and ColorOptions < 2 then
			ColorOptions = ColorOptions + 3
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			ColorOptions = ColorOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 and SwitchColorOptions == 0 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("Red", tostring(RedColorFont))
		mod_storage_save("Blue", tostring(BlueColorFont))
		mod_storage_save("Green", tostring(GreenColorFont))
		mod_storage_save("Visable", tostring(VisableFont))
		djui_popup_create("You're Custom Colors have been Saved!", 2)
	end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 and (RectFontsOnly == true) and SwitchColorOptions == 1 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("RedRect", tostring(RedColorRect))
		mod_storage_save("BlueRect", tostring(BlueColorRect))
		mod_storage_save("GreenRect", tostring(GreenColorRect))
		mod_storage_save("VisableRect", tostring(VisableRect))
		djui_popup_create("You're Custom Rect Colors have been Saved!", 2)
		end
	end
	
	if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
		FontSettings = 1
		Secondstopress = 5
		ArrowPositionLRUp = 0
		ArrowPositionUp = -90
		SwitchColorOptions = 0
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
	if FontSettings == 3 then
		
		if Secondstopress == 0 then
		if PositionsMenuOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and CustomXPos > 254 then
			CustomXPos = CustomXPos - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			CustomXPos = CustomXPos + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and CustomXPos < -254 then
			CustomXPos = CustomXPos + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			CustomXPos = CustomXPos - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if PositionsMenuOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and CustomYPos > 254 then
			CustomYPos = CustomYPos - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			CustomYPos = CustomYPos + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and CustomYPos < -254 then
			CustomYPos = CustomYPos + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			CustomYPos = CustomYPos - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and PositionsMenuOptions > 1 then
			PositionsMenuOptions = PositionsMenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			PositionsMenuOptions = PositionsMenuOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and PositionsMenuOptions < 2 then
			PositionsMenuOptions = PositionsMenuOptions + 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			PositionsMenuOptions = PositionsMenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
	if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		mod_storage_save("XPos", tostring(CustomXPos))
		mod_storage_save("YPos", tostring(CustomYPos))
		djui_popup_create("You're Custom Positions have been Saved!", 2)
	end
	
	if (MenuInputCheck & Y_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		CustomXPos = 0
		CustomYPos = 0
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end
	
	if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
		Secondstopress = 10
		FontSettings = 1
		Secondstopress = 5
		ArrowPositionLRUp = 80
		ArrowPositionUp = -90
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
	if FontSettings == 4 then
		
		if Secondstopress == 0 then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and SoundsSettings < 2 then
			SoundsSettings = 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			SoundsSettings = SoundsSettings - 1	
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and SoundsSettings > 2 then
			SoundsSettings = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			SoundsSettings = SoundsSettings + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if SoundsSettings == 1 and #FanfareTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and FanfareDefault > #FanfareTable - 1 then
			FanfareDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			FanfareDefault = FanfareDefault + 1
			DpadTimerRight = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and FanfareDefault < 2 then
			FanfareDefault = #FanfareTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			FanfareDefault = FanfareDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SoundsSettings == 2 and #CountdownTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and CountdownDefault > #CountdownTable - 1 then
			CountdownDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			CountdownDefault = CountdownDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and CountdownDefault < 2 then
			CountdownDefault = #CountdownTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			CountdownDefault = CountdownDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if SoundsSettings == 3 and #GoTable ~= 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and GoDefault > #GoTable - 1 then
			GoDefault = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			GoDefault = GoDefault + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and GoDefault < 2 then
			GoDefault = #GoTable
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			GoDefault = GoDefault - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if #FanfareTable == 1 or #CountdownTable == 1 or #GoTable == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
            play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if MenuOptions == 2 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 then
			Secondstopress = 10
			djui_popup_create("\nSelected Sounds:\n\nFanfare: ".. FanfareTable[FanfareDefault].fanfare_sound .."\nCountdown: ".. CountdownTable[CountdownDefault].countdown_sound .."\nGo: ".. GoTable[GoDefault].go_sound .."\n\nSaving Sounds...", 6)
			if FanfareTable[FanfareDefault] ~= nil then
			pref_fanfare(FanfareTable[FanfareDefault])
			end
			if CountdownTable[CountdownDefault] ~= nil then
			pref_countdown(CountdownTable[CountdownDefault])
			end
			if GoTable[GoDefault] ~= nil then
			pref_go(GoTable[GoDefault])
			end
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
            FontSettings = 0
			Secondstopress = 10
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)			
			end
		end
		end
	end
		
	if Menus == 4 then
		
		if Secondstopress == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and SettingsOptions > 4 then
			SettingsOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			SettingsOptions = SettingsOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and SettingsOptions < 2 then
			SettingsOptions = 5
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			SettingsOptions = SettingsOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 1 and Secondstopress == 0 then
			Secondstopress = 10
		if ControlsHelper == 1 then
			ControlsHelper = 0
			mod_storage_save("PopupHelper", tostring(ControlsHelper))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			elseif ControlsHelper == 0 then
			ControlsHelper = 1
			mod_storage_save("PopupHelper", tostring(ControlsHelper))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 2 and Secondstopress == 0 then
			Secondstopress = 10
		if showSpeedrunTimer == 1 then
			showSpeedrunTimer = 0
			mod_storage_save("DisplayTimer", tostring(showSpeedrunTimer))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			elseif showSpeedrunTimer == 0 then
			showSpeedrunTimer = 1
			mod_storage_save("DisplayTimer", tostring(showSpeedrunTimer))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 3 and Secondstopress == 0 then
			Secondstopress = 10
		if CommandMenuOption == "Commands" then
			CommandMenuOption = "Buttons"
			mod_storage_save("CommandMenu", tostring(CommandMenuOption))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			elseif CommandMenuOption == "Buttons" then
			CommandMenuOption = "Commands"
			mod_storage_save("CommandMenu", tostring(CommandMenuOption))
			djui_popup_create("For This Option to Work, You Gotta have to Leave First and Join Back in to get it Working.", 3)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and Secondstopress == 0 then
			Secondstopress = 10
		if Rules_Display == 1 then
			Rules_Display = 0
			mod_storage_save("DisplayRules", tostring(Rules_Display))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		elseif Rules_Display == 0 then
			Rules_Display = 1
			mod_storage_save("DisplayRules", tostring(Rules_Display))
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 5 and (gGlobalSyncTable.SpeedrunTeams and gGlobalSyncTable.startglobaltimer > 0.1) and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\You can't change teams while the speedrun is starting", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 5 and not gGlobalSyncTable.SpeedrunTeams and not network_is_server() and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until the host turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 5 and not gGlobalSyncTable.SpeedrunTeams and network_is_server() and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until you turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 5 and gGlobalSyncTable.SpeedrunTeams and Secondstopress == 0 then
		Secondstopress = 10
		if gPlayerSyncTable[0].TeamColors == 1 then
			gPlayerSyncTable[0].TeamColors = 2
			djui_popup_create("\\#FFFF00\\You are in Team \\#3903ff\\Blue!", 2)
		elseif gPlayerSyncTable[0].TeamColors == 2 then
			gPlayerSyncTable[0].TeamColors = 1
			djui_popup_create("\\#FFFF00\\You are in Team \\#f90303\\Red!", 2)
			end
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and Secondstopress == 0 then
			Menus = 1
			SettingsOptions = 0
			Secondstopress = 10
			ArrowPositionLRUp = 80
			ArrowPositionUp = -90
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
	end
	
		if (MenuInputCheck & START_BUTTON) ~= 0 and Secondstopress == 0 then
            openmenu = false
			buttonispressed = 0
			MenuOptions = 1
			SettingsOptions = 1
			Menus = 1
			Secondstopress = 10
			FontSettings = 0
			FontMenuOptions = 1
			ColorOptions = 1
			SwitchColorOptions = 0
			PositionsMenuOptions = 1
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
	end
end