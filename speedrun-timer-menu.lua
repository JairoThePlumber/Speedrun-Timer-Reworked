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
MenuInputCheck = 0
MenuStickX = 0
MenuStickY = 0
SwitchingMenus = 1
DisableTeams = false

-- Str Menu
MainOptions = 1
ChangeCasualColor = "#FFFFFF"
GrayColor = "#FFFFFF"
RunsColor = "#FFFFFF"
ArrowPositionLeft = 0
ArrowPositionUDLeft = 0
ArrowPositionRight = 0
ArrowPositionUDRight = 0
TimerPositionLR = -90
TimerPositionUD = -95
SpeedrunPositionLR = -90
SpeedrunPositionUD = -80
StickTimerRight = 2
StickTimerLeft = 2
StickTimerUp = 2
StickTimerDown = 2
Secondstopress = 5
CDNumbers = 4
StrOption = 0
ArrowsMovement = 0
CountdownMovement = 0
RunsArrowsLR = 0
RunsArrowsUD = 0
RunsSlotColor1 = "#7a7a7a"
RunsSlotColor2 = "#7a7a7a"
RunsSlotColor3 = "#7a7a7a"
RunsSlotColor4 = "#7a7a7a"
RunsSlotColor5 = "#7a7a7a"
RunsSlotColor6 = "#7a7a7a"
RunsSlotColor7 = "#7a7a7a"
RunsSlotColor8 = "#7a7a7a"
RunsSlotColor9 = "#7a7a7a"
RunsSlotColor10 = "#7a7a7a"

RunsSlotsName1 = "Empty Slot 1"
RunsSlotsName2 = "Empty Slot 2"
RunsSlotsName3 = "Empty Slot 3"
RunsSlotsName4 = "Empty Slot 4"
RunsSlotsName5 = "Empty Slot 5"
RunsSlotsName6 = "Empty Slot 6"
RunsSlotsName7 = "Empty Slot 7"
RunsSlotsName8 = "Empty Slot 8"
RunsSlotsName9 = "Empty Slot 9"
RunsSlotsName10 = "Empty Slot 10"
openstrmenu = false
closestrmenu = false

-- Config menu
Fonts_names = ""
Custom_Names = ""
Switch_text = ""
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
FontSettings = 0
FontMenuOptions = 1
ColorOptions = 1
SwitchColorOptions = 0
PositionsMenuOptions = 1
PlayersText = "Press A to Select, Press B to Close the Menu"
openmenu = false
closemenu = false


hook_event(HOOK_BEFORE_MARIO_UPDATE, function(m)
    if m.playerIndex ~= 0 then
        return
    end

    if openmenu or openstrmenu then
		MenuInputCheck = m.controller.buttonPressed
		MenuStickX = m.controller.stickX
		MenuStickY = m.controller.stickY
		m.controller.buttonPressed = 0
		m.controller.stickX = 0
		m.controller.stickY = 0
		m.controller.stickMag = 0
	end
end)

function SwitchingMenusCheck(m)
if Secondstopress == 0 then
	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchingMenus == 1 and StrOption == 0 then
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
        openstrmenu = false
		closestrmenu = false
        openmenu = true	
		SwitchingMenus = 2
		Secondstopress = 5
		end
	end
	
	if SwitchingMenus == 2 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
	end
	
	if Secondstopress == 0 then
	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchingMenus == 2 and Menus == 1 and network_is_server() then
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
        openmenu = false
		closemenu = false
		openstrmenu = true
		SwitchingMenus = 1
		Secondstopress = 5
		end
	end
	
	if (openmenu or openstrmenu) then 
	if m.controller.rawStickX > -0 and StickTimerRight >= 1 then
		StickTimerRight = StickTimerRight - 1
		else
		StickTimerRight = 2
		end
		
		if m.controller.rawStickX < -0 and StickTimerLeft >= 1 then
		StickTimerLeft = StickTimerLeft - 1
		else
		StickTimerLeft = 2
		end
		
		if m.controller.rawStickY < -0 and StickTimerUp >= 1 then
		StickTimerUp = StickTimerUp - 1
		else
		StickTimerUp = 2
		end
		
		if m.controller.rawStickY > -0 and StickTimerDown >= 1 then
		StickTimerDown = StickTimerDown - 1
		else
		StickTimerDown = 2
		end
	if (closestrmenu == false) or (closemenu == false) then
		set_mario_action(m, ACT_READING_NPC_DIALOG, 0)
	else
		set_mario_action(m, ACT_IDLE, 0)
	end
	switched = false
	hasConfirmed = true
	end
	
	if (openmenu or openstrmenu) then return end
	if network_is_server() then
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & R_JPAD) ~= 0) then
		openstrmenu = true
		closestrmenu = false
		openmenu = false
		closemenu = false
		SwitchingMenus = 1
		MenuOptions = 1
	elseif ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & L_JPAD) ~= 0) then
		openmenu = true
		closemenu = false
		openstrmenu = false
		closestrmenu = false
		SwitchingMenus = 2
		end
	end
	
	if not network_is_server() then
	if ((m.controller.buttonDown & L_TRIG) ~= 0) and ((m.controller.buttonDown & R_TRIG) ~= 0) and ((m.controller.buttonDown & L_JPAD) ~= 0) then
		openmenu = true
		closemenu = false
		end
	end
end

function displaystrmenu(m)
	if not SwitchingMenus == 1 then return end
	
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
	
	
	if StrOption == 6 then
	if RunsSlotsName1 ~= "Empty Slot 1" and gGlobalSyncTable.RunsSlots ~= 1 then 
		RunsSlotColor1 = "#FFFFFF"
	elseif RunsSlotsName1 ~= "Empty Slot 1" and gGlobalSyncTable.RunsSlots == 1 then 
		RunsSlotColor1 = "#00FF00"
	end	
	
	if RunsSlotsName2 ~= "Empty Slot 2" and gGlobalSyncTable.RunsSlots ~= 2 then 
		RunsSlotColor2 = "#FFFFFF"
	elseif RunsSlotsName2 ~= "Empty Slot 2" and gGlobalSyncTable.RunsSlots == 2 then 
		RunsSlotColor2 = "#00FF00"
	else
		RunsSlotColor2 = "#7a7a7a"
	end	
	
	if RunsSlotsName3 ~= "Empty Slot 3" and gGlobalSyncTable.RunsSlots ~= 3 then 
		RunsSlotColor3 = "#FFFFFF"
	elseif RunsSlotsName3 ~= "Empty Slot 3" and gGlobalSyncTable.RunsSlots == 3 then 
		RunsSlotColor3= "#00FF00"
	else
		RunsSlotColor3 = "#7a7a7a"
	end	
	
	if RunsSlotsName4 ~= "Empty Slot 4" and gGlobalSyncTable.RunsSlots ~= 4 then 
		RunsSlotColor4 = "#FFFFFF"
	elseif RunsSlotsName4 ~= "Empty Slot 4" and gGlobalSyncTable.RunsSlots == 4 then 
		RunsSlotColor4 = "#00FF00"
	else
		RunsSlotColor4 = "#7a7a7a"
	end	
	
	if RunsSlotsName5 ~= "Empty Slot 5" and gGlobalSyncTable.RunsSlots ~= 5 then 
		RunsSlotColor5 = "#FFFFFF"
	elseif RunsSlotsName5 ~= "Empty Slot 5" and gGlobalSyncTable.RunsSlots == 5 then 
		RunsSlotColor5 = "#00FF00"
	else
		RunsSlotColor5 = "#7a7a7a"
	end	
	
	if RunsSlotsName6 ~= "Empty Slot 6" and gGlobalSyncTable.RunsSlots ~= 6 then 
		RunsSlotColor6 = "#FFFFFF"
	elseif RunsSlotsName6 ~= "Empty Slot 6" and gGlobalSyncTable.RunsSlots == 6 then 
		RunsSlotColor6 = "#00FF00"
	else
		RunsSlotColor6 = "#7a7a7a"
	end	
	
	if RunsSlotsName7 ~= "Empty Slot 7" and gGlobalSyncTable.RunsSlots ~= 7 then 
		RunsSlotColor7 = "#FFFFFF"
	elseif RunsSlotsName7 ~= "Empty Slot 7" and gGlobalSyncTable.RunsSlots == 7 then 
		RunsSlotColor7 = "#00FF00"
	else
		RunsSlotColor7 = "#7a7a7a"
	end	
	
	if RunsSlotsName8 ~= "Empty Slot 8" and gGlobalSyncTable.RunsSlots ~= 8 then 
		RunsSlotColor8 = "#FFFFFF"
	elseif RunsSlotsName8 ~= "Empty Slot 8" and gGlobalSyncTable.RunsSlots == 8 then 
		RunsSlotColor8 = "#00FF00"
	else
		RunsSlotColor8 = "#7a7a7a"
	end	
	
	if RunsSlotsName9 ~= "Empty Slot 9" and gGlobalSyncTable.RunsSlots ~= 9 then 
		RunsSlotColor9 = "#FFFFFF"
	elseif RunsSlotsName9 ~= "Empty Slot 9" and gGlobalSyncTable.RunsSlots == 9 then 
		RunsSlotColor9 = "#00FF00"
	else
		RunsSlotColor9 = "#7a7a7a"
	end	
	
	if RunsSlotsName10 ~= "Empty Slot 10" and gGlobalSyncTable.RunsSlots ~= 10 then 
		RunsSlotColor10 = "#FFFFFF"
	elseif RunsSlotsName10 ~= "Empty Slot 10" and gGlobalSyncTable.RunsSlots == 10 then 
		RunsSlotColor10 = "#00FF00"
	else
		RunsSlotColor10 = "#7a7a7a"
	end
end	
	
	if MainOptions == 1 then
		ArrowPositionLRUp = -130
		ArrowPositionUp = -90
		elseif MainOptions == 2 then
		ArrowPositionLRUp = -91
		ArrowPositionUp = -90
		elseif MainOptions == 3 then
		ArrowPositionLRUp = -51
		ArrowPositionUp = -90
		elseif MainOptions == 4 then
		ArrowPositionLRUp = 0
		ArrowPositionUp = -90
		elseif MainOptions == 5 then
		ArrowPositionLRUp = 47
		ArrowPositionUp = -90
		elseif MainOptions == 6 then
		ArrowPositionLRUp = 89
		ArrowPositionUp = -90
		elseif MainOptions == 7 then
		ArrowPositionLRUp = 128
		ArrowPositionUp = -90
		end
		
		if StrOption == 1 then
		TimerPositionLR = -90
		SpeedrunPositionLR = -90
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		elseif StrOption == 2 then
		TimerPositionLR = -50
		SpeedrunPositionLR = -50
		SavefilePositionLR = -50
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		SavefilePositionUD = -65
		elseif StrOption == 4 then
		TimerPositionLR = 48
		SpeedrunPositionLR = 48
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		elseif StrOption == 5 then
		TimerPositionLR = 90
		SpeedrunPositionLR = 90
		TimerPositionUD = -95
		SpeedrunPositionUD = -80
		end
		
		if StrOption == 6 then
		if RunsArrowsLR == 1 then 
		ArrowPositionLeft = -14
		ArrowPositionRight = -110
		elseif RunsArrowsLR == 2 then 
		ArrowPositionLeft = 108
		ArrowPositionRight = 7
		end
		if RunsArrowsUD == 1 then 
		ArrowPositionUDLeft = -175
		ArrowPositionUDRight = -175
		elseif RunsArrowsUD == 2 then 
		ArrowPositionUDLeft = -155
		ArrowPositionUDRight = -155
		elseif RunsArrowsUD == 3 then 
		ArrowPositionUDLeft = -135
		ArrowPositionUDRight = -135
		elseif RunsArrowsUD == 4 then 
		ArrowPositionUDLeft = -115
		ArrowPositionUDRight = -115
		elseif RunsArrowsUD == 5 then 
		ArrowPositionUDLeft = -95
		ArrowPositionUDRight = -95
			end
		end
		
		if StrOption == 1 and ArrowsMovement == 1 then
		ArrowPositionLeft = -74
		ArrowPositionRight = -113
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 1 and ArrowsMovement == 2 then
		ArrowPositionLeft = -68
		ArrowPositionRight =  -118
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		elseif StrOption == 2 and ArrowsMovement == 1 then
		ArrowPositionLeft = -33
		ArrowPositionRight = -74
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 2 and ArrowsMovement == 2 then
		ArrowPositionLeft = -29
		ArrowPositionRight =  -78
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		elseif StrOption == 2 and ArrowsMovement == 3 then
		ArrowPositionLeft = -30
		ArrowPositionRight = -79
		ArrowPositionUDRight = -73
		ArrowPositionUDLeft = -73
		elseif StrOption == 3 then
		ArrowPositionLeft = -16
		ArrowPositionRight = 10
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 4 and ArrowsMovement == 1 then
		ArrowPositionLeft = 68
		ArrowPositionRight = 22
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 4 and ArrowsMovement == 2 then
		ArrowPositionLeft = 63
		ArrowPositionRight = 26
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		elseif StrOption == 5 and ArrowsMovement == 1 then
		ArrowPositionLeft = 107
		ArrowPositionRight = 67
		ArrowPositionUDRight = -103
		ArrowPositionUDLeft = -103
		elseif StrOption == 5 and ArrowsMovement == 2 then
		ArrowPositionLeft = 108
		ArrowPositionRight = 65
		ArrowPositionUDRight = -88
		ArrowPositionUDLeft = -88
		end
	
	if not openstrmenu then return end

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
            "Select",
            -5,
            -37,
            FONT_MENU,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Start_Text = {
		{
            "Start",
            -130,
            -110,
            globalFont,
            creditscale - 0.6,
            GrayColor
        }
	}
	
	Stop_Text = {
		{
            "Stop",
            -90,
            -110,
            globalFont,
            creditscale - 0.6,
            GrayColor
        }
	}
	
	Restart_Text = {
		{
            "Restart",
            -50,
            -110,
            globalFont,
            creditscale - 0.6,
            GrayColor
        }
	}
	
	Countdown_Text = {
		{
            "Countdown",
             0,
            -110,
            globalFont,
            creditscale - 0.6,
            GrayColor
        }
	}
	
	Options_Text = {
		{
            "Options",
             48,
            -110,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Extras_Text = {
		{
            "Extras",
             90,
            -110,
            globalFont,
            creditscale - 0.6,
            creditcolor
        }
	}
	
	Runs_Texts = {
		{
            "Runs",
             128,
            -110,
            globalFont,
            creditscale - 0.6,
            RunsColor
        }
	}
	
	Timer_Text = {
		{
            "Timer",
            TimerPositionLR,
            TimerPositionUD,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Speedrun_Text = {
		{
            "Speedrun",
            SpeedrunPositionLR,
            SpeedrunPositionUD,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	SaveFile_Text = {
		{
            "Save File",
            SavefilePositionLR,
            SavefilePositionUD,
            globalFont,
            creditscale - 0.7,
            creditcolor
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
	
	Countdown_Numbers = {
		{
            "(" .. CDNumbers .. ")",
            0,
            -95,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	runslot1 = {
		{
            RunsSlotsName1,
            -60,
            -170,
            globalFont,
            creditscale - 0.5,
            RunsSlotColor1	
        }
	}
	
	runslot2 = {
		{
            RunsSlotsName2,
            -60,
            -150,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor2
        }
	}
	
	runslot3 = {
		{
            RunsSlotsName3,
            -60,
            -130,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor3
        }
	}
	
	runslot4 = {
		{
            RunsSlotsName4,
            -60,
            -110,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor4
        }
	}
	
	runslot5 = {
		{
            RunsSlotsName5,
            -60,
            -90,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor5
        }
	}
	
	runslot6 = {
		{
            RunsSlotsName6,
             60,
            -170,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor6
        }
	}
	
	runslot7 = {
		{
            RunsSlotsName7,
             60,
            -150,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor7
        }
	}
	
	runslot8 = {
		{
            RunsSlotsName8,
             60,
            -130,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor8
        }
	}
	
	runslot9 = {
		{
            RunsSlotsName9,
             60,
            -110,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor9
        }
	}
	
	runslot10 = {
        {
            RunsSlotsName10,
             60,
            -90,
            globalFont,
            creditscale - 0.5,
			RunsSlotColor10
        }
	}

	if (openstrmenu == true) then
		renderRect(190, 120, FONT_MENU, 10000, 240, "#000000") 
		if StrOption ~= 6 then
		for _, v in ipairs(menumaintext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
        end
		
		for _, v in ipairs(Start_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Stop_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Restart_Text) do
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
		
		if (StrOption == 1 or StrOption == 2) then
		for _, v in ipairs(Timer_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Speedrun_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if StrOption == 2 then
		for _, v in ipairs(SaveFile_Text) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if StrOption == 3 then
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
		
		if (StrOption == 4) then
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
		
		if (StrOption == 5) then
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
		if StrOption == 6 then
		for _, v in ipairs(runsmenutext) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Left) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end
		
		for _, v in ipairs(Arrow_Right) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot1) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot2) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot3) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot4) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot5) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot6) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot7) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot8) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot9) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(runslot10) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
		end
		
		for _, v in ipairs(menubuttons) do
            printMenuText(v[1], v[2], v[3], v[4], v[5], v[6], v[7], v[8])
			end
		end
		
		if StrOption ~= 6 then
		if StrOption == 0 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if StrOption == 3 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end		
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.beatedGame then
        djui_popup_create("\\#ff0000\\The Run is Finished, You can Either Rehost or Restart The Speedrun", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions <= 4 and casualTimer == 1 then
        djui_popup_create("\\#ff0000\\You have to disable the Causal Option if you want to do a speedrun", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.stopSpeedrun then
        djui_popup_create("\\#ff0000\\The Speedrun has Stopped, You can Either Rehost or Restart The Speedrun", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.stopTimer and gGlobalSyncTable.Intermission then
		djui_popup_create("The Speedrun has been Unpaused!", 2)
		gGlobalSyncTable.stopTimer = false
		openstrmenu = false
		if (closestrmenu == false) then
            set_mario_action(m, ACT_IDLE, 0)
            closestrmenu = true	
				end
		Secondstopress = 5
		end
		
		if Secondstopress == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and (gGlobalSyncTable.startTimer and gGlobalSyncTable.Intermission and not gGlobalSyncTable.stopTimer and not gGlobalSyncTable.beatedGame) then
        djui_popup_create("\\#ff0000\\The Speedrun is already running!", 2)
				end
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and gGlobalSyncTable.restartTimer then
        djui_popup_create("\\#ff0000\\This Option is disabled when restarting a run", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and casualTimer == 0 and not gGlobalSyncTable.Intermission and not gGlobalSyncTable.stopSpeedrun and DisableCommands == true then
		gGlobalSyncTable.Intermission = true
		djui_popup_create_global('The Speedrun is Starting!', 2)
		openstrmenu = false
		if (closestrmenu == false) then
            set_mario_action(m, ACT_IDLE, 0)
            closestrmenu = true	
				end
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 1 and (DisableCommands == false and Romhack_Runs_Option == true) then
		djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 1 and not gGlobalSyncTable.Intermission then
		djui_popup_create("\\#ff0000\\You know the timer is not even starting Right?", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 1 and gGlobalSyncTable.stopTimer then
		djui_popup_create("\\#ff0000\\You already paused the timer", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 1 and 
		gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer then
		gGlobalSyncTable.stopTimer = true
		djui_popup_create_global("\\#ff0000\\The Speedrun is Paused!", 2)
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 2 and not gGlobalSyncTable.Intermission then
		djui_popup_create("\\#ff0000\\Why you want to stop the speedrun, if you didn't even start the timer?", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 2 and gGlobalSyncTable.stopSpeedrun and gGlobalSyncTable.startTimer == false then
		djui_popup_create("\\#ff0000\\The Speedrun has already Stopped, You can Either Rehost or Restart The Speedrun", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and StrOption == 1 and ArrowsMovement == 2 and 
		gGlobalSyncTable.Intermission and (gGlobalSyncTable.startTimer or gGlobalSyncTable.restartTimer or gGlobalSyncTable.stopTimer) then
		gGlobalSyncTable.stopSpeedrun = true
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.Intermission = false
		djui_popup_create_global("\\#ff0000\\The Speedrun has Stopped!", 2)
			end
		end
		
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 1 and not gGlobalSyncTable.Intermission then
		djui_popup_create("\\#ff0000\\You know the timer is not even starting Right?", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 1 and gGlobalSyncTable.restartTimer then
		djui_popup_create("\\#ff0000\\You already reset the timer", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 1 and 
		gGlobalSyncTable.Intermission and gGlobalSyncTable.startTimer then
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = true
		gGlobalSyncTable.stopTimer = false
		gGlobalSyncTable.Intermission = false
		gGlobalSyncTable.Intercountdown = 6
		freeze_check = false
		gGlobalSyncTable.FreezePlayers = false
		gGlobalSyncTable.GoTimer = 0
		fanfare_check = false
		djui_popup_create_global("\\#ff0000\\The Timer is Restarting!", 2)
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 2 and not gGlobalSyncTable.restartTimer then
		djui_popup_create("\\#ff0000\\I suggest you restart the timer, before you restart the speedrun", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 2 and gGlobalSyncTable.startTimer then
		djui_popup_create("\\#ff0000\\The Speedrun is already running!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 2 
		and (gGlobalSyncTable.startTimer or gGlobalSyncTable.restartTimer or gGlobalSyncTable.stopTimer) then
		gGlobalSyncTable.Intermission = true
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.beatedGame = false
		gGlobalSyncTable.restartTimer = false
		gGlobalSyncTable.stopSpeedrun = false
		gGlobalSyncTable.stopTimer = false
		if CDNumbers ~= nil then
			CDNumbers = clamp(CDNumbers, 0, 50)
			startspeedruntime = CDNumbers * 30
		end
		if not set_countdown_numbers then
		startspeedruntime = 4 * 30
		end
		djui_popup_create_global("\\#ff0000\\The Speedrun is Restarting!", 2)
		openstrmenu = false
		if (closestrmenu == false) then
            set_mario_action(m, ACT_IDLE, 0)
            closestrmenu = true	
				end
			end
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and StrOption == 2 and ArrowsMovement == 3 then
		gGlobalSyncTable.ResetSaveCheck = true
		ResetSave = false
		djui_popup_create_global("\\#ff0000\\The Save File is Restarting!", 2)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 4 and ArrowsMovement == 1 and buttonsonly == 1 then
		djui_popup_create("\\#ff0000\\You already have the buttons option on", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 4 and ArrowsMovement == 1 then
		buttonsonly = 1
		mod_storage_save("Buttons", tostring(buttonsonly))
		djui_popup_create("Button commands! The Original Settings of the Speedrun Timer", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 4 and ArrowsMovement == 2 and buttonsonly == 0 then
		djui_popup_create("\\#ff0000\\You already have the menu option on", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and StrOption == 4 and ArrowsMovement == 2 then
		buttonsonly = 0
		mod_storage_save("Buttons", tostring(buttonsonly))
		djui_popup_create("Menu Config! The Modern Settings of the Speedrun Timer", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 5 and ArrowsMovement == 1 and DisableTeams then
        djui_popup_create("\\#ff0000\\Teams are Disable in this Romhack", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 5 and ArrowsMovement == 1 and not gGlobalSyncTable.SpeedrunTeams and not DisableTeams then
		djui_popup_create("Speedrun in Teams is Enabled", 1)
		gGlobalSyncTable.SpeedrunTeams = true
		gGlobalSyncTable.notags = true
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 5 and ArrowsMovement == 1 and gGlobalSyncTable.SpeedrunTeams and not DisableTeams then
		djui_popup_create("Speedrun in Teams is Disabled", 1)
		gGlobalSyncTable.SpeedrunTeams = false
		gGlobalSyncTable.notags = false
		gPlayerSyncTable[0].TeamColors = SpeedrunNoTeams
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 5 and ArrowsMovement == 2 and casualTimer == 0 then
		casualTimer = 1
		mod_storage_save("Casual", tostring(casualTimer))
		djui_popup_create("Casual Mode: \nThe Timer will Start everytime you start hosting, Including Rehosting!", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and StrOption == 5 and ArrowsMovement == 2 and casualTimer == 1 then
		casualTimer = 0
		gGlobalSyncTable.Intermission = false
		gGlobalSyncTable.startTimer = false
		gGlobalSyncTable.Intercountdown = 6
		gGlobalSyncTable.GoTimer = 0
		gGlobalSyncTable.startspeedrun = 0
		djui_popup_create("Speedrun Mode: \nThe Timer will Reset the Timer until you Start The Speedrun!", 2)
		mod_storage_save("Casual", tostring(casualTimer))
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions <= 4 and buttonsonly == 1 then
        djui_popup_create("\\#ff0000\\That Option is Disabled when having button controls", 2)
		end
		
		if buttonsonly == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 2 and ArrowsMovement == 0 and casualTimer == 0 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 1
		ArrowsMovement = 1
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 3 and ArrowsMovement == 0 and casualTimer == 0 then
		if (DisableCommands == false and Romhack_Runs_Option == true) then
		djui_popup_create("\\#ff0000\\Woah There!! You need to choose a Run before you start the Speedrun", 2)
		else
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 2
		ArrowsMovement = 1
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 4 and CountdownMovement == 0 and casualTimer == 0 then
		if gGlobalSyncTable.startTimer then
		djui_popup_create("\\#ff0000\\This Command is Disabled when a Speedrun is Starting", 2)
		else
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 3
		CountdownMovement = 1
		Secondstopress = 5
				end
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 5 and ArrowsMovement == 0 then
		if moveset_is_check or other_moveset_mods then
		djui_popup_create("\\#ff0000\\This Option is Disabled for Moveset Mods, To Prevent Mods From Breaking", 2)
		else
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 4
		ArrowsMovement = 1
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 6 and ArrowsMovement == 0 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
        StrOption = 5
		ArrowsMovement = 1
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 7 then
		play_sound(SOUND_MENU_REVERSE_PAUSE, m.marioObj.header.gfx.cameraToObject)
        StrOption = 6
		Secondstopress = 5
		RunsArrowsLR = 1
		RunsArrowsUD = 1
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 1 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 2 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 3 then
        StrOption = 0
		CountdownMovement = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 4 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 5 then
        StrOption = 0
		ArrowsMovement = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		if (StrOption == 1 or StrOption == 4 or StrOption == 5) then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and ArrowsMovement == 2 then
			ArrowsMovement = ArrowsMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			ArrowsMovement = ArrowsMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and ArrowsMovement == 1 then
			ArrowsMovement = ArrowsMovement + 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			ArrowsMovement = ArrowsMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if StrOption == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and ArrowsMovement < 2 then
			ArrowsMovement = 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			ArrowsMovement = ArrowsMovement - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and ArrowsMovement > 2 then
			ArrowsMovement = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			ArrowsMovement = ArrowsMovement + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if StrOption == 3 and CountdownMovement == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and CDNumbers > 49 then
			CDNumbers = 0
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			CDNumbers = CDNumbers + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and CDNumbers < 1 then
			CDNumbers = 50
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			CDNumbers = CDNumbers - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if Secondstopress == 0 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and MainOptions == 4 and StrOption == 3 and CountdownMovement == 1 then
			 if CDNumbers ~= nil then
				CDNumbers = clamp(CDNumbers, 0, 50)
				if CDNumbers == 0 then
				djui_popup_create_global("No Countdown \n(That's Pretty Much it)", 2)
				elseif CDNumbers == 1 then
				djui_popup_create_global("Countdown set to " .. CDNumbers .. "\n(Which is Short.)", 2)
				elseif CDNumbers == 4 then
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
				startspeedruntime = CDNumbers * 30
				set_countdown_numbers = true
			end
			end
		end
		
		if StrOption == 0 then
		if not Romhack_Runs_Option then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and MainOptions > 5 then
			MainOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			MainOptions = MainOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and MainOptions < 2 then
			MainOptions = 6
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			MainOptions = MainOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if Romhack_Runs_Option then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and MainOptions > 6 then
			MainOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			MainOptions = MainOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and MainOptions < 2 then
			MainOptions = 7
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			MainOptions = MainOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if Secondstopress == 0 then
		if (MenuInputCheck & B_BUTTON) ~= 0 and StrOption == 0 then
            openstrmenu = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (closestrmenu == false) then
                set_mario_action(m, ACT_IDLE, 0)
                closestrmenu = true	
				end
			end
			end
		end
		end
		
	if StrOption == 6 then
		
		if StrOption == 6 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end		
		
		if Secondstopress == 0 then
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 1 and RunsSlotsName1 == "Empty Slot 1" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 1 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName1 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 1
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 1 and gGlobalSyncTable.RunsSlots == 1 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 2 and RunsSlotsName2 == "Empty Slot 2" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 2 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName2 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 2
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 2 and gGlobalSyncTable.RunsSlots == 2 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 3 and RunsSlotsName3 == "Empty Slot 3" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 3 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName3 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 3
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 3 and gGlobalSyncTable.RunsSlots == 3 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 4 and RunsSlotsName4 == "Empty Slot 4" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 4 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName4 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 4
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 4 and gGlobalSyncTable.RunsSlots == 4 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 5 and RunsSlotsName5 == "Empty Slot 5" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 5 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName5 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 5
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 1 and RunsArrowsUD == 5 and gGlobalSyncTable.RunsSlots == 5 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 1 and RunsSlotsName6 == "Empty Slot 6" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 1 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName6 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 6
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 1 and gGlobalSyncTable.RunsSlots == 6 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 2 and RunsSlotsName7 == "Empty Slot 7" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 2 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName7 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 7
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 2 and gGlobalSyncTable.RunsSlots == 7 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 3 and RunsSlotsName8 == "Empty Slot 8" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 3 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName8 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 8
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 3 and gGlobalSyncTable.RunsSlots == 8 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 4 and RunsSlotsName9 == "Empty Slot 9" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 4 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName9 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 9
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 4 and gGlobalSyncTable.RunsSlots == 9 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 5 and RunsSlotsName10 == "Empty Slot 10" then
		djui_popup_create("\\#ff0000\\There's nothing on that Slot\nChoose a different one", 2)
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 5 and gGlobalSyncTable.RunsSlots == 0 then
		djui_popup_create_global("The Run Has Been Chosen:\n" .. RunsSlotsName10 .. ' Run', 2)
        gGlobalSyncTable.RunsSlots = 10
		elseif (MenuInputCheck & A_BUTTON) ~= 0 and RunsArrowsLR == 2 and RunsArrowsUD == 5 and gGlobalSyncTable.RunsSlots == 10 then
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		gGlobalSyncTable.RunsSlots = 0
			end
		end
		
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and RunsArrowsUD < 2 then
			RunsArrowsUD = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			RunsArrowsUD = RunsArrowsUD - 1 
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and RunsArrowsUD > 4 then
			RunsArrowsUD = 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			RunsArrowsUD = RunsArrowsUD + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and RunsArrowsLR == 2 then
			RunsArrowsLR = RunsArrowsLR - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			RunsArrowsLR = RunsArrowsLR + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and RunsArrowsLR == 1 then
			RunsArrowsLR = RunsArrowsLR + 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			RunsArrowsLR = RunsArrowsLR - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
	if (MenuInputCheck & B_BUTTON) ~= 0 then
        StrOption = 0
	    Secondstopress = 5
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		
		end
		end
	end
	
	if (MenuInputCheck & START_BUTTON) ~= 0 then
            openstrmenu = false
			MainOptions = 1
			StrOption = 0
			ArrowsMovement = 0
			CountdownMovement = 0
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (closestrmenu == false) then
                set_mario_action(m, ACT_IDLE, 0)
                closestrmenu = true	
		end
	end
end

function displaymenu(m)
	if not SwitchingMenus == 2 then return end
	
	Fonts_names = Fonts_names 
	Custom_Names = Custom_Names
	Switch_text = Switch_text

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
		
		if gGlobalSyncTable.Intermission == true or (violet_stars == true) then
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
	if _G.FontsSelect == 1 and _G.SwitchFonts == 0 then
		Fonts_names = "Super Mario 64 Text Fonts"
		elseif _G.FontsSelect == 2 and _G.SwitchFonts == 0 then
		Fonts_names = "Aliased Text Fonts"
		elseif _G.FontsSelect == 3 and _G.SwitchFonts == 0 then
		Fonts_names = "Super Mario 64 Fonts (Built in)"
		elseif _G.FontsSelect == 4 and _G.SwitchFonts == 0 then
		Fonts_names = "Djui Fonts"
		elseif _G.CustomFontsSelect >= 1 then
		Fonts_names = Custom_Names
		end
		
		if _G.SwitchFonts == 0 and CustomFontsDisplay then
		Switch_text = "X Button: Switch to Custom Fonts"
		elseif _G.SwitchFonts == 1 and CustomFontsDisplay then
		Switch_text = "X Button: Switch to Built in Fonts"
		elseif _G.SwitchFonts == 0 and not CustomFontsDisplay then
		Switch_text = "No Custom Fonts Plugins Installed"
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

	if not openmenu then return end

	TeamColor = TeamColor
	
	modversion = {
		{
            "Speedrun Timer Reworked V1.2",
            92,
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
            'Added a Menu for Host and Players',
            0,
            -200,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
        {
		
			'Added Custom Position and Colors Fonts',
            0,
            -170,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Api for Other Mods',
            0,
            -140,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added a Reset Save File Function',
            0,
            -110,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added Warps for Incompatible Romhacks',
            0,
            -80,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			'Added SM64 Coop Deluxe Support',
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
            -200,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
		
			"Mod By JairoThePlumber",
            0,
            -180,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"Star Road Postions by Mr.Needlemouse",
            0,
            -160,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"Sm64 Rules by Sunk",
            0,
            -140,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"Rules Mod by Kaje",
            0,
            -120,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"Reset Save File Code by EmilyEmmi",
            0,
            -100,
            globalFont,
			creditscale - 0.5,
            creditcolor
        },
		{
		
			"Bingo Mod by Blocky and Skeltan",
            0,
            -80,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"The SM64 Coop Deluxe Team",
            0,
            -60,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
		{
		
			"And Everyone Who help Test This Mod",
            0,
            -40,
            globalFont,
            creditscale - 0.5,
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
            "Removed the intro command, because it's just breaks for some reason",
            0,
            -200,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
        {
		
			"All Commands have been removed and turn it into a Menu",
            0,
            -185,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Removed Savefile Check Function (To let anyone have their fun)",
            0,
            -170,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"All Rules are now shared in one Function",
            0,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Info Display now has Compatible and Incompatible Mods Displayed",
            0,
            -140,
            globalFont,
			creditscale - 0.7,
            creditcolor
        },
		{
		
			"Adjust the Config Menu to not feel Clutter with 4:3 Enable",
			0,
            -125,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Now The Grand Star has a Function now and it's set off by default",
            0,
            -110,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"The Save Function has been Reworked and Made it Easier",
            0,
            -95,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Removed Custom Fonts (But there now Plugins you can add)",
            0,
            -80,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"All Run Commands has now been part of the Runs Options in the Menu",
            0,
            -65,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Now Romhacks can be Reset to the Start Warp",
            0,
            -50,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Did Some Adjustments to the mod to be playable",
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
	
	romhackstexts = {
		{
            "Compatible Romhacks",
            0,
            -223,
            globalFont,
            creditscale - 0.5,
            creditcolor
        },
        {
            "Star Road",
            -120,
            -200,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
        {
		
			"Star Road: The Replica Comet",
            -120,
            -190,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 74",
            -120,
            -180,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 74: Extreme Edition",
            -120,
            -170,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 74: Ten Years After",
            -120,
            -160,
            globalFont,
			creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64 Moonshine",
			-120,
            -150,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"King Boo's Revenge 2",
            -120,
            -140,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Lug's Delightful Dioramas",
            -120,
			-130,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Lug's Delightful Dioramas: Green Comet",
            -120,
			-120,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64: The Green Stars",
            -120,
			-110,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64 Sapphire",
            -120,
			-100,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"The Phantom's Call",
            -120,
			-90,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 1: Star Takeover",
            -120,
			-80,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 2: Night of Doom",
            -120,
			-70,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 6.5",
            -120,
			-60,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64: Twisted Adventures",
            -120,
			-50,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
            "Luigi's Mansion 64",
			-120,
            -40,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
        {
		
			"Luigi's Mansion 64.5 [EM + SPM]",
            -120,
            -30,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64 Paradise Island",
            -50,
            -200,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Ztar Attack 2",
            -50,
            -190,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64: Peach and the Pink Star",
            -50,
            -180,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64: Hidden Stars",
            -50,
            -170,
            globalFont,
			creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64: The Galactic Journey",
            -50,
            -160,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 1.5: Star Takeover Redone",
            -50,
            -150,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Luigi and the Forest Ruins",
            -50,
            -140,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Only Up 64",
            -50,
			-130,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Thousand Year Door 64",
            -50,
			-120,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64: The Mushroom Cup",
            -50,
			-110,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Eternal Realm",
            -50,
			-100,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Despair Mario's Gambit",
			-50,
			-90,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Retro Land",
            -50,
			-80,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64: The Underworld",
            -50,
			-70,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Katze Stuck in the Toilet 64",
			-50,
			-60,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario The Power Star Journey",
            -50,
			-50,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Shining Stars",
            -50,
			-40,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Shining Stars 2 Mirror Madness",
            -50,
			-30,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Mario's Treasure Dome: The Revival",
            30,
			-200,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Luigi & The Violet Stars",
            30,
			-190,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64 Sapphire Green Comet",
            30,
			-180,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64 Royal Legacy",
            30,
			-170,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"SM64 Extra",
            30,
			-160,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 3: Mario on An Saoire 64",
            30,
			-150,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 4: The Kedama Takeover 64",
            30,
			-140,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64 Trouble Town",
            30,
			-130,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Star Revenge 1.3: Redone 1.3",
            30,
			-120,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario 64 Into Bowser's Castle",
            30,
			-110,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Green Star Revenge 1",
            30,
			-100,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario and the Marvel Adventure",
            30,
			-90,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Super Mario Rainbow Road",
            30,
			-80,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"Sonic Adventure 64 DX",
            30,
			-70,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"",
            30,
			-60,
            globalFont,
            creditscale - 0.83,
            creditcolor
        },
		{
		
			"",
            30,
			-50,
            globalFont,
            creditscale - 0.83,
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
            'Fix Custom Pipes For OMM Rebirth',
            0,
             -200,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
        {
		
			'Fixed and Revamp the Warp Option',
            0,
            -170,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed the Save Function",
            0,
            -140,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Causal Option Function",
            0,
            -110,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Djui Fonts and Rules being Off-Centered",
            0,
            -80,
            globalFont,
            creditscale - 0.4,
            creditcolor
        },
		{
		
			"Fixed Some Code that weren't noticeable",
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
		
			"X Button:",
            0,
            -200,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"(Start the Speedrun)",
            0,
            -185,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"Y Button:",
            0,
            -170,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
		
			"(Pauses the Timer)",
            0,
            -155,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "L Trigger + D-Pad:",
            0,
            -140,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "(Stops the Speedrun)",
            0,
            -125,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "L Trigger + R Trigger + Z Trigger",
            0,
            -110,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "(Resets the Timer)",
            0,
            -95,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "L Trigger + R Trigger + X Button",
            0,
            -80,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "(Restarting the Speedrun)",
            0,
            -65,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "L Trigger + R Trigger + Start Button",
            0,
            -50,
            globalFont,
            creditscale - 0.7,
            creditcolor
        },
		{
            "(Restarting the Save File)",
            0,
            -35,
            globalFont,
            creditscale - 0.7,
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
            "Press A to Select a Font, Press B to Go Back",
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
            "Press Y For Settings",
            0,
            -120,
            globalFont,
            creditscale - 0.7,
            creditcolor
        }
	}
	
	Switch = {
		{
            Switch_text,
            0,
            -87,
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
		for _, v in ipairs(romhackstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 5 then
		for _, v in ipairs(fixedtexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 6 then
		for _, v in ipairs(controlstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 7 then
		for _, v in ipairs(compatiblemodstexts) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
			end
		end
		
		if buttonispressed == 8 then
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

        for _, v in ipairs(fontsnames) do
            printColorText(v[1], v[2], v[3], v[4], v[5], v[6])
        end

        for _, v in ipairs(Switch) do
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
		
		if (_G.FontsSelect <= 2 and RectFontsOnly and _G.SwitchFonts == 0) then
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
		
		if Menus == 1 then
		
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and MenuOptions > 3 then
			MenuOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			MenuOptions = MenuOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and MenuOptions < 2 then
			MenuOptions = 4
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			MenuOptions = MenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 1 then
		Menus = 2
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 2 then
		Menus = 3
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 3 then
		Menus = 4
		SettingsOptions = 1
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 4 then
		openmenu = false
            if (closemenu == false) then
                set_mario_action(m, ACT_IDLE, 0)
                closemenu = true	
			end
		if not (set_warp_position) and not gGlobalSyncTable.Intermission then
		set_warp_position = true
		else
		set_warp_position = false
		end
		if (violet_stars == true) then
		djui_popup_create("\\#FF0000\\Warps are disabled for this romhack, Because warping doesn't work for some reason, I can't fix it sadly", 2)
			end
		if (Disable_Custom_Warps == true) then
		djui_popup_create("\\#FF0000\\Warps are disabled for this romhack, Because It's has a Custom Plugin to Disable Warps.", 2)
			end
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and MenuOptions == 4 then
		if (violet_stars == false) and gGlobalSyncTable.Intermission then
		djui_popup_create("\\#FF0000\\You only use this to avoid getting stuck, not using it for a speedrun", 2)
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
            openmenu = false
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (closemenu == false) then
                set_mario_action(m, ACT_IDLE, 0)
                closemenu = true	
			end
		end
	end
	
	if Menus == 2 then
		if MenuOptions == 1 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and buttonispressed > 7 then
			buttonispressed = buttonispressed - 8
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			buttonispressed = buttonispressed + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and buttonispressed < 1 then
			buttonispressed = buttonispressed + 8
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			buttonispressed = buttonispressed - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
            Menus = 1
			Secondstopress = 5
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
		
		if MenuOptions == 2 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		if _G.SwitchFonts == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and _G.FontsSelect > 3 then
			_G.FontsSelect = _G.FontsSelect - 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			_G.FontsSelect = _G.FontsSelect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and _G.FontsSelect < 2 then
			_G.FontsSelect = _G.FontsSelect + 3
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			_G.FontsSelect = _G.FontsSelect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if _G.SwitchFonts == 0 and not CustomFontsDisplay then
		if (MenuInputCheck & X_BUTTON) ~= 0 then
		play_sound(SOUND_MENU_CAMERA_BUZZ, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if CustomFontsDisplay then
		if (MenuInputCheck & X_BUTTON) ~= 0 and _G.SwitchFonts == 0 then
			_G.SwitchFonts = 1
			play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif (MenuInputCheck & X_BUTTON) ~= 0 and _G.SwitchFonts == 1 then
			_G.SwitchFonts = 0
            play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if MenuOptions == 2 then
		if (MenuInputCheck & A_BUTTON) ~= 0 and _G.SwitchFonts == 0 then
			djui_popup_create("".. Fonts_names .. "\nhas been Selected \nSaving Font...", 2)
			mod_storage_save("Fonts", tostring(_G.FontsSelect))
			mod_storage_save("SwitchFonts", tostring(_G.SwitchFonts))
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and _G.SwitchFonts == 1 then
		djui_popup_create("".. Fonts_names .. "\nhas been Selected \nSaving Custom Font...", 2)
		mod_storage_save("CustomFonts", tostring(_G.CustomFontsSelect))
		mod_storage_save("SwitchFonts", tostring(_G.SwitchFonts))
			end
		end
		
		if (MenuInputCheck & Y_BUTTON) ~= 0 and FontSettings == 0 then
			FontSettings = 1
			play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
            Menus = 1
			Secondstopress = 5
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)			
			end
		end
		end
	end
	
	if FontSettings == 1 then
		
		if DisplayCustomColors == 1 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and FontMenuOptions > 2 then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			FontMenuOptions = FontMenuOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and FontMenuOptions < 2 then
			FontMenuOptions = FontMenuOptions + 2
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			FontMenuOptions = FontMenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if DisplayCustomColors == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and FontMenuOptions == 3 then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			FontMenuOptions = FontMenuOptions + 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and FontMenuOptions == 1 then
			FontMenuOptions = FontMenuOptions + 2
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			FontMenuOptions = FontMenuOptions - 2
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
			Secondstopress = 5
			FontSettings = 0
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		
		
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 2 then
		FontSettings = 2
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 3 then
		FontSettings = 3
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
		
	if (MenuInputCheck & A_BUTTON) ~= 0 and FontMenuOptions == 1 then
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
		
		if FontSettings == 2 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		if SwitchColorOptions == 0 then
		if ColorOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and RedColorFont > 254 then
			RedColorFont = RedColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			RedColorFont = RedColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and RedColorFont < 1 then
			RedColorFont = RedColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			RedColorFont = RedColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and GreenColorFont > 254 then
			GreenColorFont = GreenColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			GreenColorFont = GreenColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and GreenColorFont < 1 then
			GreenColorFont = GreenColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			GreenColorFont = GreenColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 3 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and BlueColorFont > 254 then
			BlueColorFont = BlueColorFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			BlueColorFont = BlueColorFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and BlueColorFont < 1 then
			BlueColorFont = BlueColorFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			BlueColorFont = BlueColorFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 4 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and VisableFont > 254 then
			VisableFont = VisableFont - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			VisableFont = VisableFont + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and VisableFont < 1 then
			VisableFont = VisableFont + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			VisableFont = VisableFont - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
				end
			end
		end
		
		if (_G.FontsSelect <= 2 and RectFontsOnly and _G.SwitchFonts == 0) then
		if SwitchColorOptions == 1 then
		if ColorOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and RedColorRect > 254 then
			RedColorRect = RedColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			RedColorRect = RedColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and RedColorRect < 1 then
			RedColorRect = RedColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			RedColorRect = RedColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and GreenColorRect > 254 then
			GreenColorRect = GreenColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			GreenColorRect = GreenColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and GreenColorRect < 1 then
			GreenColorRect = GreenColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			GreenColorRect = GreenColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 3 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and BlueColorRect > 254 then
			BlueColorRect = BlueColorRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			BlueColorRect = BlueColorRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and BlueColorRect < 1 then
			BlueColorRect = BlueColorRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			BlueColorRect = BlueColorRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ColorOptions == 4 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and VisableRect > 254 then
			VisableRect = VisableRect - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			VisableRect = VisableRect + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and VisableRect < 1 then
			VisableRect = VisableRect + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			VisableRect = VisableRect - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
				end
			end
		end
		
	
	if (MenuInputCheck & L_TRIG) ~= 0 and SwitchColorOptions == 0 then
		SwitchColorOptions = 1
		Secondstopress = 5
		play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif (MenuInputCheck & L_TRIG) ~= 0 and SwitchColorOptions == 1 then
		SwitchColorOptions = 0
		Secondstopress = 5
        play_sound(SOUND_MENU_REVERSE_PAUSE, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end

	if (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchColorOptions == 0 then
		RedColorFont = 255
		GreenColorFont = 255
		BlueColorFont = 255
		VisableFont = 255
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	elseif (MenuInputCheck & Y_BUTTON) ~= 0 and SwitchColorOptions == 1 then
		RedColorRect = 0
		GreenColorRect = 0
		BlueColorRect = 0
		VisableRect = 128
        play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
	end
	
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and ColorOptions > 3 then
			ColorOptions = ColorOptions - 3
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			ColorOptions = ColorOptions + 1
			Secondstopress = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and ColorOptions < 2 then
			ColorOptions = ColorOptions + 3
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			ColorOptions = ColorOptions - 1
			Secondstopress = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 then
		mod_storage_save("Red", tostring(RedColorFont))
		mod_storage_save("Blue", tostring(BlueColorFont))
		mod_storage_save("Green", tostring(GreenColorFont))
		mod_storage_save("Visable", tostring(VisableFont))
		djui_popup_create("You're Custom Colors have been Saved!", 2)
	end
	
	if (MenuInputCheck & A_BUTTON) ~= 0 and (_G.FontsSelect == 1 or _G.FontsSelect == 2) then
		mod_storage_save("RedRect", tostring(RedColorRect))
		mod_storage_save("BlueRect", tostring(BlueColorRect))
		mod_storage_save("GreenRect", tostring(GreenColorRect))
		mod_storage_save("VisableRect", tostring(VisableRect))
		end
	end
	
	if (MenuInputCheck & B_BUTTON) ~= 0 then
		FontSettings = 1
		Secondstopress = 5
		ArrowPositionLRUp = 0
		ArrowPositionUp = -90
		SwitchColorOptions = 0
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
	if FontSettings == 3 then
	
	if FontSettings == 3 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
	end
		
		if Secondstopress == 0 then
		if PositionsMenuOptions == 1 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and CustomXPos > 254 then
			CustomXPos = CustomXPos - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			CustomXPos = CustomXPos + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and CustomXPos < -254 then
			CustomXPos = CustomXPos + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			CustomXPos = CustomXPos - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if PositionsMenuOptions == 2 then
		if ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) and CustomYPos > 254 then
			CustomYPos = CustomYPos - 255
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY > -0 and StickTimerDown == 2) or (MenuInputCheck & U_JPAD) ~= 0) then
			CustomYPos = CustomYPos + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) and CustomYPos < -254 then
			CustomYPos = CustomYPos + 255
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickY < -0 and StickTimerUp == 2) or (MenuInputCheck & D_JPAD) ~= 0) then
			CustomYPos = CustomYPos - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
			end
		end
		
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and PositionsMenuOptions > 1 then
			PositionsMenuOptions = PositionsMenuOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			PositionsMenuOptions = PositionsMenuOptions + 1
			Secondstopress = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and PositionsMenuOptions < 2 then
			PositionsMenuOptions = PositionsMenuOptions + 1
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			PositionsMenuOptions = PositionsMenuOptions - 1
			Secondstopress = 5
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
	if (MenuInputCheck & A_BUTTON) ~= 0 then
		mod_storage_save("XPos", tostring(CustomXPos))
		mod_storage_save("YPos", tostring(CustomYPos))
		djui_popup_create("You're Custom Positions have been Saved!", 2)
	end
	
	if (MenuInputCheck & Y_BUTTON) ~= 0 then
		CustomXPos = 0
		CustomYPos = 0
		play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
	end
	
	if (MenuInputCheck & B_BUTTON) ~= 0 then
		FontSettings = 1
		Secondstopress = 5
		ArrowPositionLRUp = 80
		ArrowPositionUp = -90
		play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
			end
		end
		
	if Menus == 4 then
		if Menus == 4 and Secondstopress >= 1 then
		Secondstopress = Secondstopress - 1
		end
		
		if Secondstopress == 0 then
		if ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) and SettingsOptions > 3 then
			SettingsOptions = 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX > -0 and StickTimerRight == 2) or (MenuInputCheck & R_JPAD) ~= 0) then
			SettingsOptions = SettingsOptions + 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) and SettingsOptions < 2 then
			SettingsOptions = 4
			play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		elseif ((MenuStickX < -0 and StickTimerLeft == 2) or (MenuInputCheck & L_JPAD) ~= 0) then
			SettingsOptions = SettingsOptions - 1
            play_sound(SOUND_MENU_CHANGE_SELECT, gMarioStates[0].marioObj.header.gfx.cameraToObject)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 1 then
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 2 then
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 3 then
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
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and (gGlobalSyncTable.SpeedrunTeams and gGlobalSyncTable.startspeedrun > 0.1) then
		djui_popup_create("\\#ff0000\\You can't change teams while the speedrun is starting", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and not gGlobalSyncTable.SpeedrunTeams and not network_is_server() then
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until the host turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and not gGlobalSyncTable.SpeedrunTeams and network_is_server() then
		djui_popup_create("\\#FF0000\\Teams are disable, so you can't change color until you turns on Teams", 2)
		end
		
		if (MenuInputCheck & A_BUTTON) ~= 0 and SettingsOptions == 4 and (gGlobalSyncTable.SpeedrunTeams and gGlobalSyncTable.notags) then
		if gPlayerSyncTable[0].TeamColors == SpeedrunRedTeam then
			gPlayerSyncTable[0].TeamColors = SpeedrunBlueTeam
			djui_popup_create("\\#FFFF00\\You are in Team \\#3903ff\\Blue!", 2)
		elseif gPlayerSyncTable[0].TeamColors == SpeedrunBlueTeam then
			gPlayerSyncTable[0].TeamColors = SpeedrunRedTeam
			djui_popup_create("\\#FFFF00\\You are in Team \\#f90303\\Red!", 2)
			end
			end
		end
		
		if (MenuInputCheck & B_BUTTON) ~= 0 then
			Menus = 1
			SettingsOptions = 0
			Secondstopress = 5
			ArrowPositionLRUp = 80
			ArrowPositionUp = -90
			play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
		end
		end
	end
	
		if (MenuInputCheck & START_BUTTON) ~= 0 then
            openmenu = false
			buttonispressed = 0
			MenuOptions = 1
			SettingsOptions = 1
			Menus = 1
			FontSettings = 0
			FontMenuOptions = 1
			ColorOptions = 1
			SwitchColorOptions = 0
			PositionsMenuOptions = 1
            play_sound(SOUND_MENU_CLICK_FILE_SELECT, m.marioObj.header.gfx.cameraToObject)
            if (closemenu == false) then
                set_mario_action(m, ACT_IDLE, 0)
                closemenu = true	
		end
	end
end