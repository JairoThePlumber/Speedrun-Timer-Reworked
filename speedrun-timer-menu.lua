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
DelayCheck = 10

-- Str Menu
MainOptions = 1
StartText = "Start"
ChangeCasualColor = "#FFFFFF"
GrayColor = "#FFFFFF"
RunsColor = "#FFFFFF"
TimerPositionLR = -90
TimerPositionUD = -95
SpeedrunPositionLR = -90
SpeedrunPositionUD = -80
StickTimerRight = 5
StickTimerLeft = 5
StickTimerUp = 5
StickTimerDown = 5
DpadTimerRight = 3
DpadTimerLeft = 3
DpadTimerUp = 3
DpadTimerDown = 3
Secondstopress = 10
CDNumbers = 5
StrOption = 0
ArrowsMovement = 0
CountdownMovement = 0
RunDefault = 1
RunsSlotColor = "#FFFFFF"
RunsName = ""
SavedRunName = "None"
RunTable = {}
openstrmenu = false

-- Config menu
Fonts_names = ""
Fanfare_names = ""
Countdown_names = ""
Go_names = ""
Switch_Color_text = ""
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
hook_event(HOOK_MARIO_UPDATE, function(m)
    if m.playerIndex ~= 0 then
        return
    end
		
	if save_func == 1 then
	DefaultName = load_fonts()
	FanfareName = load_custom_fanfare()
	CountdownName = load_custom_countdown()
	GoName = load_custom_go()
	end
	
	if save_func < 2 then
        save_func = save_func + 1
    end
	
	if gGlobalSyncTable.ResetSaveCheck == true then
	if gGlobalSyncTable.ResetSave >= 1 and network_is_server() then
	gGlobalSyncTable.ResetSave = gGlobalSyncTable.ResetSave - 1
	end
	reset_savefile()
	end
	if gGlobalSyncTable.ResetSave == 0 then
	gGlobalSyncTable.ResetSaveCheck = false
	gGlobalSyncTable.ResetSave = 10
	end
	
	if gGlobalSyncTable.ResettingTimer == true then
	if gGlobalSyncTable.ResetTimer >= 1 and network_is_server() then
	gGlobalSyncTable.ResetTimer = gGlobalSyncTable.ResetTimer - 1
	end
	reset_timer()
	end
	if gGlobalSyncTable.ResetTimer == 0 then
	gGlobalSyncTable.ResettingTimer = false
	gGlobalSyncTable.ResetTimer = 10
	end
end)

hook_event(HOOK_BEFORE_MARIO_UPDATE, function(m)
    if m.playerIndex ~= 0 then
        return
    end

    if (openmenu or openstrmenu or hasConfirmed == false) and not is_game_paused() then
	DelayCheck = 10
	end
	if not (openmenu or openstrmenu or hasConfirmed == false) and DelayCheck >= 1 then
	DelayCheck = DelayCheck - 1
	end
	if DelayCheck >= 1 then
		MenuInputCheck = m.controller.buttonPressed
		MenuStickX = m.controller.stickX
		MenuStickY = m.controller.stickY
		m.controller.buttonPressed = 0
		m.controller.buttonDown = 0
		m.controller.stickX = 0
		m.controller.stickY = 0
		m.controller.stickMag = 0
	end
end)

function SwitchingMenusCheck(m)
	-- This is to the prvent the menu to softlock someone while being in the menu
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
	
	if Secondstopress == 0 then
	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchingMenus == 1 and StrOption == 0 then
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
	if m.controller.rawStickX > -0 and StickTimerRight >= 1 then
		StickTimerRight = StickTimerRight - 1
		else
		StickTimerRight = 5
		end
		
		if m.controller.rawStickX < -0 and StickTimerLeft >= 1 then
		StickTimerLeft = StickTimerLeft - 1
		else
		StickTimerLeft = 5
		end
		
		if m.controller.rawStickY < -0 and StickTimerUp >= 1 then
		StickTimerUp = StickTimerUp - 1
		else
		StickTimerUp = 5
		end
		
		if m.controller.rawStickY > -0 and StickTimerDown >= 1 then
		StickTimerDown = StickTimerDown - 1
		else
		StickTimerDown = 5
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

function displaystrmenu(m)
if not openstrmenu then return end

	if gGlobalSyncTable.RunsSlots ~= 0 and Romhack_Runs_Option == true then
	DisableCommands = true
	end
	
	if DisableTeams == true then
	TeamOptionColor = "#7a7a7a"
	elseif DisableTeams == false then
	TeamOptionColor = "#FFFFFF"
	end
	
	if buttonsonly == 1 then
	GrayColor = "#7a7a7a"
	elseif buttonsonly == 0 then
	GrayColor = "#FFFFFF"
	end
	
	if casualTimer == 1 then
	ChangeCasualColor = "#00FF00"
	elseif casualTimer == 0 then
	ChangeCasualColor = "#FF0000"
	end
	
	if Romhack_Runs_Option == true then
	RunsColor = "#FFFFFF"
	elseif Romhack_Runs_Option == false then
	RunsColor = "#7a7a7a"
	end
	
	if gGlobalSyncTable.Intermission == false and gGlobalSyncTable.startglobaltimer == 0 then
	StartText = "Start"
	end
	if gGlobalSyncTable.startglobaltimer ~= 0 then
	if gGlobalSyncTable.Intermission == true and gGlobalSyncTable.startTimer == false then
	StartText = "Resume"
	elseif gGlobalSyncTable.Intermission == true and gGlobalSyncTable.startTimer == true then
	StartText = "Pause"
		end
	end
	
	if StrOption == 4 then
	
	if RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber == RunTable[RunDefault].RunsSlotNumber then
		 RunsName = "" .. RunTable[RunDefault].RunsSlotName .." Run"
	end
	
	if RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber ~= gGlobalSyncTable.RunsSlots then 
		RunsSlotColor = "#FFFFFF"
	elseif RunTable[RunDefault].RunsSlotName == RunTable[RunDefault].RunsSlotName and RunTable[RunDefault].RunsSlotNumber == gGlobalSyncTable.RunsSlots then 
		RunsSlotColor = "#00FF00"
		SavedRunName = RunTable[RunDefault].RunsSlotName
		end
	end	
	
	if MainOptions == 1 then
		ArrowPositionLRUp = -116
		ArrowPositionUp = -90
		elseif MainOptions == 2 then
		ArrowPositionLRUp = -79
		ArrowPositionUp = -90
		elseif MainOptions == 3 then
		ArrowPositionLRUp = -33
		ArrowPositionUp = -90
		elseif MainOptions == 4 then
		ArrowPositionLRUp = 14
		ArrowPositionUp = -90
		elseif MainOptions == 5 then
		ArrowPositionLRUp = 53
		ArrowPositionUp = -90
		elseif MainOptions == 6 then
		ArrowPositionLRUp = 90
		ArrowPositionUp = -90
		elseif MainOptions == 7 then
		ArrowPositionLRUp = 124
		ArrowPositionUp = -90
		end
		
		if StrOption == 2 then
		TimerPositionLR = 54
		SpeedrunPositionLR = 54
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		elseif StrOption == 3 then
		TimerPositionLR = 91
		SpeedrunPositionLR = 91
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		end
		
		if StrOption == 1 then
		ArrowPositionLeft = -3
		ArrowPositionRight = 24
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 2 and ArrowsMovement == 1 then
		ArrowPositionLeft = 73
		ArrowPositionRight = 28
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 2 and ArrowsMovement == 2 then
		ArrowPositionLeft = 70
		ArrowPositionRight = 32
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		elseif StrOption == 3 and ArrowsMovement == 1 then
		ArrowPositionLeft = 108
		ArrowPositionRight = 67
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 3 and ArrowsMovement == 2 then
		ArrowPositionLeft = 109
		ArrowPositionRight = 66
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		end

	menumaintext = {
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
            "Select Run",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	runsmenubuttons = {
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
	
	Start_Text = {
		{
            StartText,
            -115,
            -110,
            globalFont,
            creditscale - 0.65,
            GrayColor
        }
	}
	
	Restart_Text = {
		{
            "Restart",
            -78,
            -110,
            globalFont,
            creditscale - 0.65,
            GrayColor
        }
	}
	
	Reset_Save_Text = {
		{
            "Reset Save",
            -33,
            -110,
            globalFont,
            creditscale - 0.65,
            GrayColor
        }
	}
	
	Countdown_Text = {
		{
            "Countdown",
             14,
            -110,
            globalFont,
            creditscale - 0.65,
            GrayColor
        }
	}
	
	Options_Text = {
		{
            "Options",
             54,
            -110,
            globalFont,
            creditscale - 0.65,
            creditcolor
        }
	}
	
	Extras_Text = {
		{
            "Extras",
             91,
            -110,
            globalFont,
            creditscale - 0.65,
            creditcolor
        }
	}
	
	Runs_Texts = {
		{
            "Runs",
             124,
            -110,
            globalFont,
            creditscale - 0.65,
            RunsColor
        }
	}
	
	Buttons_Text = {
		{
            "Buttons",
            TimerPositionLR,
            TimerPositionUD,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Menu_Text = {
		{
            "Menu",
            SpeedrunPositionLR,
            SpeedrunPositionUD,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Teams_Text = {
		{
            "Teams",
            TimerPositionLR,
            TimerPositionUD,
            globalFont,
            creditscale - 0.7,
            TeamOptionColor
        }
	}
	
	Casual_Text = {
		{
            "Casual",
            SpeedrunPositionLR,
            SpeedrunPositionUD,
            globalFont,
            creditscale - 0.7,
            ChangeCasualColor
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
	
	Countdown_Numbers = {
		{
            "(" .. CDNumbers .. ")",
            14,
            -95,
            globalFont,
            creditscale - 0.7,
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

	if (openstrmenu == true) then
		renderRect(190, 120, FONT_MENU, 10000, 240, "#000000") 
		if StrOption ~= 4 then
		for _, v in ipairs(menumaintext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Start_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Restart_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Reset_Save_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Countdown_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Options_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Extras_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Runs_Texts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		if StrOption == 1 then
		for _, v in ipairs(Countdown_Numbers) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
        end
		
		if (StrOption == 2) then
		for _, v in ipairs(Buttons_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Menu_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if (StrOption == 3) then
		for _, v in ipairs(Teams_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Casual_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if StrOption == 0 then
		for _, v in ipairs(Arrow_Up) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
				end
			end
        end
		if StrOption == 4 then
		for _, v in ipairs(runsmenutext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(RunSlotText) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runsmenubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		end
		
		
		if Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.beatedGame then
        djui_popup_create("\\#ff0000\\The Run is Finished, You can Either Rehost or Restart The Speedrun", 2)
		Secondstopress = 10
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions <= 4 and casualTimer == 1 then
        djui_popup_create("\\#ff0000\\You have to Disable the Causal Option if you want to do a speedrun", 2)
		Secondstopress = 10 
		end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and (MainOptions == 1 or MainOptions == 2) and gGlobalSyncTable.Intermission and gGlobalSyncTable.startglobaltimer == 0 then
		djui_popup_create("\\#ff0000\\Wait Until The Countdown Ends!", 2)
		Secondstopress = 10 
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Paused!", 2)
		gGlobalSyncTable.startTimer = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer == false and gGlobalSyncTable.startglobaltimer ~= 0 then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.startTimer = true
		openstrmenu = false
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and casualTimer == 0 and not gGlobalSyncTable.Intermission and DisableCommands == true and gGlobalSyncTable.startglobaltimer == 0 and not gGlobalSyncTable.beatedGame then
		Secondstopress = 10 
		gGlobalSyncTable.Intermission = true
		openstrmenu = false
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and (DisableCommands == false and Romhack_Runs_Option == true) and gGlobalSyncTable.startglobaltimer == 0 then
		djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
		Secondstopress = 10
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and not gGlobalSyncTable.Intermission then
		djui_popup_create("\\#ff0000\\This Option only works if you already Start a Speedrun", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and gGlobalSyncTable.startglobaltimer ~= 0 then
		Secondstopress = 10
		gGlobalSyncTable.ResettingTimer = true
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 then
		gGlobalSyncTable.ResetSaveCheck = true
		Secondstopress = 10 
		djui_popup_create_global("\\#ff0000\\The Save File is Restarting!", 2)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 2 and ArrowsMovement == 1 and buttonsonly == 1 then
		djui_popup_create("\\#ff0000\\You already have the buttons option on", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 2 and ArrowsMovement == 1 then
		buttonsonly = 1
		mod_storage_save("Buttons", tostring(buttonsonly))
		Secondstopress = 10 
		djui_popup_create("Button commands! The Original Settings of the Speedrun Timer", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 2 and ArrowsMovement == 2 and buttonsonly == 0 then
		djui_popup_create("\\#ff0000\\You already have the menu option on", 2)
		Secondstopress = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 2 and ArrowsMovement == 2 then
		buttonsonly = 0
		Secondstopress = 10 
		mod_storage_save("Buttons", tostring(buttonsonly))
		djui_popup_create("Menu Config! The Modern Settings of the Speedrun Timer", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 3 and ArrowsMovement == 1 and DisableTeams then
        djui_popup_create("\\#ff0000\\Teams are Disable in this Romhack", 2)
		Secondstopress = 10 
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 3 and ArrowsMovement == 1 and not gGlobalSyncTable.SpeedrunTeams and not DisableTeams then
		djui_popup_create("Speedrun in Teams is Enabled", 1)
		gGlobalSyncTable.SpeedrunTeams = true
		gGlobalSyncTable.notags = true
		Secondstopress = 10 
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 3 and ArrowsMovement == 1 and gGlobalSyncTable.SpeedrunTeams and not DisableTeams then
		djui_popup_create("Speedrun in Teams is Disabled", 1)
		gGlobalSyncTable.SpeedrunTeams = false
		gGlobalSyncTable.notags = false
		Secondstopress = 10 
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 3 and ArrowsMovement == 2 and casualTimer == 0 then
		casualTimer = 1
		Secondstopress = 10 
		mod_storage_save("Casual", tostring(casualTimer))
		djui_popup_create("Casual Mode: \nThe Timer will Start everytime you start hosting, Including Rehosting!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 3 and ArrowsMovement == 2 and casualTimer == 1 then
		casualTimer = 0
		gGlobalSyncTable.ResettingTimer = true
		Secondstopress = 10 
		djui_popup_create("Speedrun Mode: \nThe Timer will Reset the Timer until you Start The Speedrun!", 2)
		mod_storage_save("Casual", tostring(casualTimer))
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions <= 4 and buttonsonly == 1 then
        djui_popup_create("\\#ff0000\\That Option is Disabled when having button controls", 2)
		Secondstopress = 10
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 4 and CountdownMovement == 0 and casualTimer == 0 then
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and ArrowsMovement == 0 then
		if moveset_is_check or other_moveset_mods then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\This Option is Disabled for Moveset Mods, To Prevent Mods From Breaking", 2)
		else
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 2
		ArrowsMovement = 1
		Secondstopress = 10
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and ArrowsMovement == 0 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 3
		ArrowsMovement = 1
		Secondstopress = 10
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 7 and StrOption ~= 4 then
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
        StrOption = 4
		Secondstopress = 10
		RunDefault = 1
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 1 then
        StrOption = 0
		CountdownMovement = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 2 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 3 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 10
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (StrOption == 2 or StrOption == 3) then
		if ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) and ArrowsMovement == 2 then
			ArrowsMovement = ArrowsMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 5) or (MenuInputCheck & U_JPAD ~= 0 and DpadTimerUp == 3)) then
			ArrowsMovement = ArrowsMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) and ArrowsMovement == 1 then
			ArrowsMovement = ArrowsMovement + 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 5) or (MenuInputCheck & D_JPAD ~= 0 and DpadTimerDown == 3)) then
			ArrowsMovement = ArrowsMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if StrOption == 1 and CountdownMovement == 1 then
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
		end
		
		if Secondstopress == 0 then 
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 4 and StrOption == 1 and CountdownMovement == 1 then
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
		
		if StrOption == 0 then
		if not Romhack_Runs_Option then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MainOptions > 5 then
			MainOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			MainOptions = MainOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MainOptions < 2 then
			MainOptions = 6
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			MainOptions = MainOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if Romhack_Runs_Option then
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and MainOptions > 6 then
			MainOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			MainOptions = MainOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and MainOptions < 2 then
			MainOptions = 7
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) then
			MainOptions = MainOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if Secondstopress == 0 then 
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 0 then
            openstrmenu = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		end
	end
		
	if StrOption == 4 then

		if Secondstopress == 0 then
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.RunsSlots ~= RunTable[RunDefault].RunsSlotNumber then
			Secondstopress = 10
			gGlobalSyncTable.RunsSlots = RunTable[RunDefault].RunsSlotNumber
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and Secondstopress == 0 and gGlobalSyncTable.RunsSlots == RunTable[RunDefault].RunsSlotNumber then
			Secondstopress = 10
			gGlobalSyncTable.RunsSlots = 0
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
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
			CountdownMovement = 0
			Secondstopress = 10
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
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
		ArrowPositionLRUp = -86
		ArrowPositionUp = -90
		elseif SettingsOptions == 2 then
		ArrowPositionLRUp = -21
		ArrowPositionUp = -90
		elseif SettingsOptions == 3 then
		ArrowPositionLRUp = 38
		ArrowPositionUp = -90
		elseif SettingsOptions == 4 then
		ArrowPositionLRUp = 89
		ArrowPositionUp = -90
		end
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
		
		if gGlobalSyncTable.Intermission == true or (DisableWarps == true or Disable_Custom_Warps == true) then
		WarpColor = "#7a7a7a"
		else
		WarpColor = "#FFFFFF"
		end
	
		if gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam and gGlobalSyncTable.SpeedrunTeams then
		TeamColor = "#f90303"
		elseif gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam and gGlobalSyncTable.SpeedrunTeams then
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
            "Speedrun Timer Reworked V1.3",
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
	
	Timer_Texts = {
		{
            "Timer Display",
            -24,
            -110,
            globalFont,
            creditscale - 0.6,
            ChangeTimerColor
        }
	}
	
	Rules_Texts = {
		{
            "Rules Display",
             40,
            -110,
            globalFont,
            creditscale - 0.6,
            ChangeRulesColor
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
	
	Teams_Texts = {
		{
            "Teams",
             90,
            -110,
            globalFont,
            creditscale - 0.6,
            TeamColor
        }
	}
	
	HelperPopup_Texts = {
		{
            "Helper Popup",
            -85,
            -110,
            globalFont,
            creditscale - 0.6,
            ChangeHelperColor
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
            'Added Romhack Color Fonts',
            0,
            -160,
            globalFont,
            creditscale,
            creditcolor
        },
		{
            'Added Intermission Display',
            0,
            -100,
            globalFont,
            creditscale,
            creditcolor
        },
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
            "SM64 Only Is Now The Default Mod",
            0,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Removed Stop Timer Function",
            0,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Reworked Restart Timer Function",
            0,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Now Start and Pause Function now Merged",
            0,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Removed Compatible Romhack List (But Will have a Text File Tho)",
            0,
            -160,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"Removed 31, 45, and 50 Stars On the SM64 Rules",
            0,
            -150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Change The Buttons Mapping on How to Open the Menu",
            0,
            -140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Made The JoyStick Menu Speed Slower But Easier Now",
            0,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Buttons Controls Mapping Has Been Changed",
            0,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Now Incompatible Romhacks Warp You Back After Resetting",
            0,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Grand Star Function is to True Be Default Now",
            0,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Removed Display_Custom_Rules_Romhack_Function for being useless now",
            0,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Reworked Custom Runs (It can be Shown in the Intermission Display)",
            0,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Fanfare and Go Sounds Play Sooner Now",
            0,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Now SM64 Font for Romhack Visibility can be changed",
            0,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Removed some code that no longer be used",
            0,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Adjust the Mod Again to Run Better?",
            0,
			-40,
            globalFont,
            creditscale - 0.75,
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
            -50,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Key's Artwork",
            -50,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Vanilla",
            -50,
            -180,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"DT_Ryan",
            -50,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mayo",
            -50,
            -160,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"LeoHaha",
            -50,
            -150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"DeathHawk789",
            -50,
            -140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Player",
            -50,
			-130,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Issac",
            -50,
			-120,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"ColbyRayz!",
            -50,
			-110,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"JoseGera1012",
            -50,
			-100,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Blazingmo6",
            -50,
			-90,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"octi",
            -50,
			-80,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LightWolf12745",
            -50,
			-70,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mr.Pear",
            -50,
			-60,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"jrb64",
            -50,
			-50,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
            "SONIC12649S",
			-50,
            -40,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
        {
		
			"Mongulus",
            -50,
            -30,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"dav",
            50,
            -200,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"YUSUKE",
            50,
            -190,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"SomeIdot",
            50,
            -180,
            globalFont,
			creditscale - 0.75,
            creditcolor
        },
		{
		
			"LuisJoanXD",
            50,
            -170,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"prople",
            50,
            -160,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"LF64",
            50,
			-150,
            globalFont,
            creditscale - 0.75,
            creditcolor
        },
		{
		
			"Mr.Needlemouse",
            50,
			-140,
            globalFont,
            creditscale - 0.75,
            creditcolor
        }
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
            'Fixed Config Menu Softlock',
            0,
            -200,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
        {
		
			'Fixed Being on the Air with Rules On',
            0,
            -170,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Restart Timer Not Resetting",
            0,
            -140,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Some Desync issues",
            0,
            -110,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Warp Option when Disabling Warps",
            0,
            -80,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Rules Overlay on the Custom Rules",
            0,
            -50,
            globalFont,
            creditscale - 0.4,
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
		if not (set_warp_position) and not gGlobalSyncTable.Intermission then
		set_warp_position = true
		else
		set_warp_position = false
		end
		if (Disable_Custom_Warps == true) then
		djui_popup_create("\\#FF0000\\Warps are disabled for this romhack, Because It's has a Custom Plugin to Disable Warps.", 2)
		end
		if (Disable_Custom_Warps == false) and gGlobalSyncTable.Intermission then
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
		if ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) and SettingsOptions > 3 then
			SettingsOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 5) or (MenuInputCheck & R_JPAD ~= 0 and DpadTimerRight == 3)) then
			SettingsOptions = SettingsOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 5) or (MenuInputCheck & L_JPAD ~= 0 and DpadTimerLeft == 3)) and SettingsOptions < 2 then
			SettingsOptions = 4
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and (gGlobalSyncTable.SpeedrunTeams and gGlobalSyncTable.startglobaltimer > 0.1) and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#ff0000\\You can't change teams while the speedrun is starting", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and not gGlobalSyncTable.SpeedrunTeams and not network_is_server() and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until the host turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and not gGlobalSyncTable.SpeedrunTeams and network_is_server() and Secondstopress == 0 then
		Secondstopress = 10
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until you turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and (gGlobalSyncTable.SpeedrunTeams and gGlobalSyncTable.notags) and Secondstopress == 0 then
		Secondstopress = 10
		if gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam then
			gPlayerSyncTable[0].TeamColors = SpeedrunBlueTeam
			djui_popup_create("\\#FFFF00\\You are in Team \\#3903ff\\Blue!", 2)
		elseif gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam then
			gPlayerSyncTable[0].TeamColors = SpeedrunRedTeam
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