
function Intermission_Display()
	if STRGST.STRStartingType == 1 then
    ReadyText = "Get Ready after the Countdown in " .. tostring(math.floor(STRGST.STRIntermission))
	elseif STRGST.STRStartingType == 2 then
	ReadyText = "Get Ready to Begin in " .. tostring(math.floor(STRGST.STRIntermission))
	end

    local Size = 0.50
    local Width = Hud_Measure(ReadyText) * Size
    local Height = 32 * Size

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - Height) / 2.0 - 112
	
	 -- render
    render_rect(X - 6 * Size, Y, Width + 12 * Size, Height, 0, 0, 0, 128)
    shadow_text(ReadyText, X, Y - 0.5, Size, 1, 1, 255, 255, 255, 255)
end

function SingleStars_Display()
	if STRGST.STRGameState == "Started" then
	Complete = STRSSTypeTable[STRGST.STRSSType].Todo
	if STRGST.STRSSType == 1 and STRGST.STRSSCollectedStar ~= 1 then
	Complete = STRSSTypeTable[STRGST.STRSSType].Todo .. STRGST.STRSSCollectedStar .. " Stars"
	elseif STRGST.STRSSType == 1 and STRGST.STRSSCollectedStar == 1 then
	Complete = STRSSTypeTable[STRGST.STRSSType].Todo .. STRGST.STRSSCollectedStar .. " Star"
	elseif STRGST.STRSSType == 2 then
	Complete = STRSSTypeTable[STRGST.STRSSType].Todo .. STRGST.STRSSCollectedStar
	end
	else
	Complete = ": Complete!"
	end
	
	if STRGST.STRSSText >= 151 then
    DisplayText = STRSSTypeTable[STRGST.STRSSType].SSName .. Complete
	elseif STRGST.STRSSText >= 1 then
	if network_is_server() then
	DisplayText = "You can either Reset Or Choose a Different Run."
	else
	DisplayText = "You can visit Other Levels, While the Host is Setting up."
	end
	end

    local Size = 0.50
    local Width = Hud_Measure(DisplayText) * Size
    local Height = 32 * Size

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - Height) / 2.0 - 112
	
	render_rect(X - 6 * Size, Y, Width + 12 * Size, Height, 0, 0, 0, 128)
	shadow_text(DisplayText, X, Y - 0.5, Size, 1, 1, 255, 255, 255, 255)
	if STRGST.STRGameState == "Finished" and STRGST.STRSSText >= 151 then
	shadow_text(DisplayText, X, Y - 0.5, Size, 1, 1, 0, 255, 0, 255)
	end
end

function Settings_Display()
	GSize = 0.25
	GHeight = 32 * GSize
	
	SettingsText = "Requirements For This Run:"
	
    local Width = Hud_Measure(SettingsText) * GSize

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - GHeight) / 2.0 - 116
	
	 -- render
    render_rect(X - 6 * GSize, Y, Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SettingsText, X, Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	if STRGST.BuildInRomhacks == true and STRGST.STRPluginsCheck == false then
	if STRGST.GrandStar == true and STRGST.CakeEnding == false then
	CText = "Build In Run: Grand Star"
	elseif STRGST.CakeEnding == true and STRGST.GrandStar == false then
	CText = "Build In Run: Cake Ending"
	elseif STRGST.GrandStar == true and STRGST.CakeEnding == true then
	CText = "Build In Run: Grand Star and Cake Ending"
	elseif STRGST.GrandStar == false and STRGST.CakeEnding == false then
	CText = "Build In Run: Custom Run"
	end
	CWidth = Hud_Measure(CText) * GSize
	CX = (S_Width() - CWidth) / 2.0
	CY = (S_Height() - GHeight) / 2.0 - 108
	
	render_rect(CX - 6 * GSize, CY, CWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(CText, CX, CY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRPluginsCheck == true then
	CText = "Run Plugin: " .. STRPluginRuns[STRGST.STRPluginsTypes].PluginName
	CWidth = Hud_Measure(CText) * GSize
	CX = (S_Width() - CWidth) / 2.0
	CY = (S_Height() - GHeight) / 2.0 - 108
	
	render_rect(CX - 6 * GSize, CY, CWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(CText, CX, CY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRPluginsCheck == false and STRGST.BuildInRomhacks == false then
	if STRGST.STRRunsTypes == 1 or STRGST.STRRunsTypes == 5 or STRGST.STRRunsTypes == 6 or STRGST.STRRunsTypes == 7 
	or STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 15 then
	if STRGST.STRLFStars == 1 then
	SText = "Star Limit: " .. STRGST.STRLFLimit
	elseif STRGST.STRLFStars == 2 then
	SText = "Star ID: " .. STRGST.STRLFID
	elseif STRGST.STRLFStars == 3 then
	SText = "Behavior: " .. STRLFB[STRGST.STRLFBehavior].Type
	elseif STRGST.STRLFStars == 4 then
	SText = "Star Limit: " .. STRGST.STRLFLimit .. " + Star ID: " .. STRGST.STRLFID
	elseif STRGST.STRLFStars == 5 then
	SText = "Star Limit: " .. STRGST.STRLFLimit .. " + Behavior: " .. STRLFB[STRGST.STRLFBehavior].Type
	elseif STRGST.STRLFStars == 6 then
	SText = "Star ID: " .. STRGST.STRLFID .. " + Behavior: " .. STRLFB[STRGST.STRLFBehavior].Type
	end
	SWidth = Hud_Measure(SText) * GSize
	SX = (S_Width() - SWidth) / 2.0
	SY = (S_Height() - GHeight) / 2.0 - 108
	
	render_rect(SX - 6 * GSize, SY, SWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SText, SX, SY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRRunsTypes == 2 or STRGST.STRRunsTypes == 5 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 9 
	or STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 14 or STRGST.STRRunsTypes == 15 then
	if STRGST.STRLFLevels == 1 then
	LText = "Level: " .. STRLevels[STRGST.STRLFLevel].STRLN
	elseif STRGST.STRLFLevels == 2 then
	LText = "Area: " .. STRGST.STRLFArea
	elseif STRGST.STRLFLevels == 3 then
	LText = "Act: " .. STRGST.STRLFAct
	elseif STRGST.STRLFLevels == 4 then
	LText = "Level: " .. STRLevels[STRGST.STRLFLevel].STRLN .. " + Area: " .. STRGST.STRLFArea
	elseif STRGST.STRLFLevels == 5 then
	LText = "Level: " .. STRLevels[STRGST.STRLFLevel].STRLN .. " + Act: " .. STRGST.STRLFAct
	elseif STRGST.STRLFLevels == 6 then
	LText = "Level: " .. STRLevels[STRGST.STRLFLevel].STRLN .. " + Area: " .. STRGST.STRLFArea .. " + Act: " .. STRGST.STRLFAct
	end
	LWidth = Hud_Measure(LText) * GSize
	LX = (S_Width() - LWidth) / 2.0
	
	if STRGST.STRRunsTypes == 2 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 9 or STRGST.STRRunsTypes == 14 then
	LY = (S_Height() - GHeight) / 2.0 - 108
	elseif STRGST.STRRunsTypes == 5 or STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 15 then
	LY = (S_Height() - GHeight) / 2.0 - 100
	end
		
	render_rect(LX - 6 * GSize, LY, LWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(LText, LX, LY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRRunsTypes == 3 or STRGST.STRRunsTypes == 6 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 10 
	or STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14 or STRGST.STRRunsTypes == 15 then
	if STRGST.STRLFActions == 1 then
	AText = "Action: " .. STRActions[STRGST.STRLFAction].A_Name
	elseif STRGST.STRLFActions == 2 then
	AText = "Action: " .. STRActions[STRGST.STRLFAction].A_Name .. " + Timer: " .. STRGST.STRLFSetTimer
	end
	AWidth = Hud_Measure(AText) * GSize
	AX = (S_Width() - AWidth) / 2.0
	
	if STRGST.STRRunsTypes == 3 or STRGST.STRRunsTypes == 10 then
	AY = (S_Height() - GHeight) / 2.0 - 108
	elseif STRGST.STRRunsTypes == 6 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14 then
	AY = (S_Height() - GHeight) / 2.0 - 100
	elseif STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 15 then
	AY = (S_Height() - GHeight) / 2.0 - 92
	end
		
	render_rect(AX - 6 * GSize, AY, AWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(AText, AX, AY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRRunsTypes == 4 or STRGST.STRRunsTypes == 7 or STRGST.STRRunsTypes == 9 or STRGST.STRRunsTypes == 10 
	or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14 or STRGST.STRRunsTypes == 15 then
	BoxX = "(< " .. STRGST.STRLFXPos .. " > " .. STRGST.STRLFEXPos .. ")"
	BoxY = "(< " .. STRGST.STRLFYPos .. " > " .. STRGST.STRLFEYPos .. ")"
	BoxZ = "(< " .. STRGST.STRLFZPos .. " > " .. STRGST.STRLFEZPos .. ")"
	if STRGST.STRLFPositions == 1 then
	PText = "X: " .. STRGST.STRLFXPos
	elseif STRGST.STRLFPositions == 2 then
	PText = "Y: " .. STRGST.STRLFYPos
	elseif STRGST.STRLFPositions == 3 then
	PText = "Z: " .. STRGST.STRLFZPos
	elseif STRGST.STRLFPositions == 4 then
	PText = "X: " .. STRGST.STRLFXPos .. " + Y: " .. STRGST.STRLFYPos
	elseif STRGST.STRLFPositions == 5 then
	PText = "X: " .. STRGST.STRLFXPos .. " + Z: " .. STRGST.STRLFZPos
	elseif STRGST.STRLFPositions == 6 then
	PText = "Y: " .. STRGST.STRLFYPos .. " + Z: " .. STRGST.STRLFZPos
	elseif STRGST.STRLFPositions == 7 then
	PText = "X: " .. STRGST.STRLFXPos .. " + Y: " .. STRGST.STRLFYPos .. " + Z: " .. STRGST.STRLFZPos
	elseif STRGST.STRLFPositions == 8 then
	PText = "Box X: " .. BoxX
	elseif STRGST.STRLFPositions == 9 then
	PText = "Box Y: " .. BoxY
	elseif STRGST.STRLFPositions == 10 then
	PText = "Box Z: " .. BoxZ
	elseif STRGST.STRLFPositions == 11 then
	PText = "Box X: " .. BoxX .. " + Box Y: " .. BoxY
	elseif STRGST.STRLFPositions == 12 then
	PText = "Box X: " .. BoxX .. " + Box Z: " .. BoxZ
	elseif STRGST.STRLFPositions == 13 then
	PText = "Box Y: " .. BoxY .. " + Box Z: " .. BoxZ
	elseif STRGST.STRLFPositions == 14 then
	PText = "Box X: " .. BoxX .. " + Box Y: " .. BoxY .. " + Box Z: " .. BoxZ
	end
	PWidth = Hud_Measure(PText) * GSize
	PX = (S_Width() - PWidth) / 2.0
	
	if STRGST.STRRunsTypes == 4 then
	PY = (S_Height() - GHeight) / 2.0 - 108
	elseif STRGST.STRRunsTypes == 7 or STRGST.STRRunsTypes == 9 or STRGST.STRRunsTypes == 10 then
	PY = (S_Height() - GHeight) / 2.0 - 100
	elseif STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14 then
	PY = (S_Height() - GHeight) / 2.0 - 92
	elseif STRGST.STRRunsTypes == 15 then
	PY = (S_Height() - GHeight) / 2.0 - 84
	end
		
	render_rect(PX - 6 * GSize, PY, PWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(PText, PX, PY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	end
end

function BestTime_Display()
	local GSize = 0.25
	local GHeight = 32 * GSize
	
	BTTotal = STRGST.BestTimeNumber / 30 
	BTHours = math.floor(BTTotal / 3600) 
	BTMinutes = math.floor((BTTotal % 3600) / 60) 
	BTSeconds = math.floor(BTTotal % 60) 
	BTMilliSeconds = math.floor((BTTotal * 1000) % 1000)
	
	BestTimeText = "Best Time: " .. string.format('%01d:%02d:%02d.%03d', BTHours, BTMinutes, BTSeconds, BTMilliSeconds)
	
    local BTDWidth = Hud_Measure(BestTimeText) * GSize

    BTDX = (S_Width() - BTDWidth) / 2.0
	
	if (((STRSettingsTimer == 0 and STRGST.STRRDisplay == "Start") or (STRGST.STRRDisplay ~= "Start" and STRGST.STRGameState == "Started")) and STRGST.STRGameMode ~= 4)
	or (STRGST.STRGameMode == 4 and ((STRGST.STRGameState == "Finished" and STRGST.STRSSText <= 1) or STRGST.STRGameState == "Lobby")) then
	BTDY = (S_Height() - GHeight) / 2.0 - 116
	elseif (STRGST.STRRunsTypes == 1 or STRGST.STRRunsTypes == 2 or STRGST.STRRunsTypes == 3 or STRGST.STRRunsTypes == 4)
	or (STRGST.STRPluginsCheck == true or STRGST.BuildInRomhacks == true or STRGST.STRGameState == "Finished" or (STRGST.STRGameState == "Started" and STRGST.STRGameMode == 4)) then
    BTDY = (S_Height() - GHeight) / 2.0 - 100
	elseif (STRGST.STRRunsTypes == 5 or STRGST.STRRunsTypes == 6 or STRGST.STRRunsTypes == 7 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 9 or STRGST.STRRunsTypes == 10) then
    BTDY = (S_Height() - GHeight) / 2.0 - 92
	elseif (STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14) then
    BTDY = (S_Height() - GHeight) / 2.0 - 84
	elseif STRGST.STRRunsTypes == 15 then
    BTDY = (S_Height() - GHeight) / 2.0 - 76
	end
	
	 -- render
    render_rect(BTDX - 6 * GSize, BTDY, BTDWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
	if STRGST.BestTimeNumber ~= STRGST.STRGlobalTimer then
	if STRGST.BestTimeNumber >= STRGST.STRGlobalTimer and STRGST.STRGameState ~= "Lobby" and STRGST.BestTimeOption == "Enabled" then 
	BTRed, BTGreen, BTBlue = 0, 255, 0
	elseif STRGST.BestTimeNumber <= STRGST.STRGlobalTimer and STRGST.STRGameState ~= "Lobby" and STRGST.BestTimeOption == "Enabled" then 
	BTRed, BTGreen, BTBlue = 255, 0, 0
	end
	end
	if STRGST.BestTimeNumber == STRGST.STRGlobalTimer and STRGST.BestTimeOption == "Enabled" then
	BTRed, BTGreen, BTBlue = 255, 255, 0
	elseif (STRGST.BestTimeNumber == STRGST.STRGlobalTimer and STRGST.BestTimeOption == "Saves") or STRGST.BestTimeNumber == 0 then
	BTRed, BTGreen, BTBlue = 255, 255, 255
	end
	
	if STRGST.BestTimeNumber ~= 0 then
	if STRGST.BestTimeNumber >= STRGST.STRGlobalTimer and STRGST.STRGameState ~= "Lobby" and STRGST.BestTimeOption == "Saves" then 
	BTRed, BTGreen, BTBlue = 0, 255, 0
	elseif STRGST.BestTimeNumber <= STRGST.STRGlobalTimer and STRGST.STRGameState ~= "Lobby" and STRGST.BestTimeOption == "Saves" then 
	BTRed, BTGreen, BTBlue = 255, 0, 0
	end
	end
	
	shadow_text(BestTimeText, BTDX, BTDY - 0.5, GSize, 0.5, 0.5, BTRed, BTGreen, BTBlue, 255)
end

function Warp_Timer_Display()
	if STRGST.STRFinishText > 6 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" then
    WarpText = "The Run is Finished!!"
	elseif STRGST.STRFinishText > 2 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" and not network_is_server() then
    WarpText = "You can check around, While the Host is setting up"
	elseif STRGST.STRFinishText > 2 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" and network_is_server() then
    WarpText = "You can Redo the Run or Do a Different Run."
	elseif ((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3) and STRGST.STRWarpCountdown >= 1 then
	WarpText = "The Run will Reset in " .. tostring(math.floor(STRGST.STRWarpCountdown))
	end

    local Size = 0.50
    local Width = Hud_Measure(WarpText) * Size
    local Height = 32 * Size

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - Height) / 2.0 - 112

    -- render
    render_rect(X - 6 * Size, Y, Width + 12 * Size, Height, 0, 0, 0, 128)
    shadow_text(WarpText, X, Y - 0.5, Size, 1, 1, 255, 255, 255, 255)
end

function Normal_Timer_Hud()
	T_Text = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFontTMNumber == 1 then
	T_Size = 0.50
	T_Height = 16 * T_Size
	T_W = Hud_Measure(T_Text) * T_Size
	T_X = (S_Width() - T_W) / 2.0 + CXPos
    T_Y = (S_Height() - T_Height) / 2.0 + 108 + CYPos
	custom_render_rect(T_X - 5.5, T_Y, T_W + 12, 16)
	custom_shadow_text(T_Text, T_X, T_Y - 0.5, T_Size, 1, 1)
	end

	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
    Center_Text = "Go!"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	if STRFontCDNumber == 1 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X, G_Y - 0.5, G_Size, 2, 2)
	end
	end
	
	if STRFontGONumber == 1 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X - 0.5, G_Y - 0.5, G_Size, 2, 2)
	end
	end
end

function Aliased_Timer_Hud()
	T_Text = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFontTMNumber == 2 then
	T_Size = 0.50
	T_Height = 16 * T_Size
	T_W = Hud_Measure(T_Text) * T_Size
	T_X = (S_Width() - T_W) / 2.0 + CXPos
    T_Y = (S_Height() - T_Height) / 2.0 + 108 + CYPos
	custom_render_rect(T_X - 5.5, T_Y, T_W + 12, 16)
	custom_shadow_text(T_Text, T_X, T_Y - 0.5, T_Size, 1, 1)
	end

	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
    Center_Text = "Go!"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	if STRFontCDNumber == 2 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X, G_Y - 0.5, G_Size, 2, 2)
	end
	end
	
	if STRFontGONumber == 2 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X - 0.5, G_Y - 0.5, G_Size, 2, 2)
	end
	end
end

function Custom_Hud_Timer()
	-- Timer Display
	STRH10 = string.format("%02d", GSTRH)
	STRH = string.format("%d", GSTRH)
    STRM = string.format("%02d", GSTRM)
	STRS = string.format("%02d", GSTRS)
	STRMS = string.format("%03d", GSTRMS)
	
	T_Size = 1
	T_W = 1 * T_Size
	T_X = (S_Width() - T_W) / 2.0 + CXPos
	
	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
	Center_Text = "GO!"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	G_Size = 2
	G_Height = 16 * G_Size
    Center_W = Hud_Measure(Center_Text) * G_Size
	T_Height = 16 * G_Size
	T_Y = (S_Height() - T_Height) / 2.0 + 118 + CYPos
	G_Y = (S_Height() - G_Height) / 2.0
	
	if STRGST.STRGlobalTimer == 0 then
	if STRGST.STRCountdown < 10 then
	Center_X = (S_Width() - Center_W) / 2.03
	else
	Center_X = (S_Width() - Center_W) / 2.04
	end
	elseif STRGST.STRGlobalTimer ~= 0 then
	Center_X = (S_Width() - Center_W) / 2.01
	end
	
	if STRFontTMNumber == 3 then
	if GSTRH >= 10 then
	custom_normal_text("TIME", T_X - 127, T_Y, T_Size)
	custom_normal_text(STRH10, T_X - 67, T_Y, T_Size)
	else
	custom_normal_text("TIME", T_X - 115, T_Y, T_Size)
	custom_normal_text(STRH, T_X - 55, T_Y, T_Size)
	end
	
	custom_normal_text(STRM, T_X - 35, T_Y, T_Size)
	custom_normal_text(STRS, T_X - 1, T_Y, T_Size)
	custom_normal_text(STRMS, T_X + 33, T_Y, T_Size)
	
	custom_normal_text("'", T_X - 40, T_Y - 3, T_Size)
	custom_normal_text('"', T_X - 7, T_Y - 3, T_Size)
	custom_normal_text('"', T_X + 27, T_Y - 3, T_Size)
	end
	
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing"))
	or (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1) then
	if STRGST.STRCountdown >= 1.01 and STRFontCDNumber == 3 then
	custom_normal_text(Center_Text, Center_X, G_Y, G_Size)
	end
	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRFontGONumber == 3 then
	custom_normal_text(Center_Text, Center_X, G_Y, G_Size)
		end
	end
end

function Normal_Hud_Timer()
	-- Timer Display
	STRH10 = string.format("%02d", GSTRH)
	STRH = string.format("%d", GSTRH)
    STRM = string.format("%02d", GSTRM)
	STRS = string.format("%02d", GSTRS)
	STRMS = string.format("%03d", GSTRMS)
	
	T_Size = 1
	T_W = 1 * T_Size
	T_X = (S_Width() - T_W) / 1.996 + CXPos
	
	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
	Center_Text = "GO"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	G_Size = 2
	G_Height = 16 * G_Size
    Center_W = Hud_Measure(Center_Text) * G_Size
	T_Height = 16 * G_Size
	T_Y = (S_Height() - T_Height) / 2.0 + 118 + CYPos
	G_Y = (S_Height() - G_Height) / 2.0
	
	if STRGST.STRGlobalTimer == 0 then
	if STRGST.STRCountdown < 10 then
	Center_X = (S_Width() - Center_W) / 2.03
	else
	Center_X = (S_Width() - Center_W) / 2.04
	end
	elseif STRGST.STRGlobalTimer ~= 0 then
	Center_X = (S_Width() - Center_W) / 2.01
	end
	
	if STRFontTMNumber == 4 then
	if GSTRH >= 10 then
	custom_romhack_text("TIME", T_X - 127, T_Y, T_Size, "Words")
	custom_romhack_text(STRH10, T_X - 67, T_Y, T_Size, "Numbers")
	else
	custom_romhack_text("TIME", T_X - 115, T_Y, T_Size, "Words")
	custom_romhack_text(STRH, T_X - 55, T_Y, T_Size, "Numbers")
	end
	
	custom_romhack_text(STRM, T_X - 35, T_Y, T_Size, "Numbers")
	custom_romhack_text(STRS, T_X - 1, T_Y, T_Size, "Numbers")
	custom_romhack_text(STRMS, T_X + 33, T_Y, T_Size, "Numbers")
	
	custom_romhack_text("'", T_X - 45, T_Y - 8, T_Size, "Quotes")
	custom_romhack_text('"', T_X - 10, T_Y - 8, T_Size, "Quotes")
	custom_romhack_text('"', T_X + 24, T_Y - 8, T_Size, "Quotes")
	end
	
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) 
	or (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1) then
	if STRGST.STRCountdown >= 1.01 and STRFontCDNumber == 4 then
	custom_romhack_text(Center_Text, Center_X, G_Y, G_Size, "Numbers")
	end
	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRFontGONumber == 4 then
	custom_romhack_text(Center_Text, Center_X, G_Y, G_Size, "Words")
	end
	end
end

function Menu_Timer_Hud()
	-- Timer Display
	T_Text = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFontTMNumber == 5 then
	T_Size = 0.36
	T_Height = 16 * T_Size
	T_W = Hud_Measure(T_Text) * T_Size
	T_X = (S_Width() - T_W) / 2.0 + CXPos
    T_Y = (S_Height() - T_Height) / 2.0 + 102 + CYPos
	custom_normal_text(T_Text, T_X, T_Y, T_Size)
	end

	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
    Center_Text = "Go!"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	if STRFontCDNumber == 5 then
	G_Size = 0.75
	G_Height = 50 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.05
	G_Y = (S_Height() - G_Height) / 2.0 
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) then
	custom_normal_text(Center_Text, Center_X, G_Y, G_Size)
	end
	end
	
	if STRFontGONumber == 5 then
	G_Size = 0.75
	G_Height = 50 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 1.97
	G_Y = (S_Height() - G_Height) / 2.0
	if (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then
	custom_normal_text(Center_Text, Center_X, G_Y, G_Size)
	end
	end
end

function Special_Timer_Hud()
	T_Text = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFontTMNumber == 6 then
	T_Size = 0.50
	T_Height = 16 * T_Size
	T_W = Hud_Measure(T_Text) * T_Size
	T_X = (S_Width() - T_W) / 2.0 + CXPos
    T_Y = (S_Height() - T_Height) / 2.0 + 108 + CYPos
	custom_render_rect(T_X - 5.5, T_Y, T_W + 12, 16)
	custom_shadow_text(T_Text, T_X, T_Y - 0.5, T_Size, 1, 1)
	end

	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 then
    Center_Text = "Go!"
	elseif STRGST.STRCountdown >= 1.01 then
	Center_Text = tostring(math.floor(STRGST.STRCountdown))
	end
	
	if STRFontCDNumber == 6 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X, G_Y - 0.5, G_Size, 2, 2)
	end
	end
	
	if STRFontGONumber == 6 then
	G_Size = 1
	G_Height = 32 * G_Size
	Center_W = Hud_Measure(Center_Text) * G_Size
	Center_X = (S_Width() - Center_W) / 2.0 - 1
	G_Y = (S_Height() - G_Height) / 2.0
	if (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then
	custom_render_rect(Center_X - 5, G_Y, Center_W + 12, G_Height)
	custom_shadow_text(Center_Text, Center_X - 0.5, G_Y - 0.5, G_Size, 2, 2)
	end
	end
end

function All_Hud_Renders()
	djui_hud_set_resolution(RESOLUTION_N64)
	djui_hud_set_font(FONT_NORMAL)
	if STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay > 1 and STRGST.STRIntermission > 1 and (STRGST.STRStartingType == 1 or STRGST.STRStartingType == 2) then
	Intermission_Display()
	end
	
	if STRGST.STRGameState == "Finished" and ((((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) 
	or (STRGST.STRFinishText > 1 and (STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled"))) then
	Warp_Timer_Display()
	end
	
	if (STRGST.STRRDisplay == "Lobby" and STRGST.STRGameState == "Lobby" and STRGST.STRGameMode ~= 4) 
	or (STRGST.STRRDisplay == "Start" and STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 and STRSettingsTimer ~= 0) then
	Settings_Display()
	end
	
	if (STRGST.BestTimeOption == "Enabled" or STRGST.BestTimeOption == "Saves") and (STRBTDisplay == "Enabled") then 
	if ((STRGST.STRRDisplay == "Lobby" and STRGST.STRGameState == "Lobby") or (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Finished")) then
	BestTime_Display()
	end
	end

	if (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Finished") and STRGST.STRGameMode == 4 and STRGST.STRSSText >= 2 then
	SingleStars_Display()
	end
	
	if STRRules == "Enabled" and STRRulesOpen == true and (STRGST.STRGameMode == 1 or STRGST.STRGameMode == 2) and (SM64Rules == true or STRGST.BuildInRomhacks == true) and STRGST.STRGameState == "Lobby" then
	Rules_Display()
	romhack_rules()
	end
end

function Timer_Hud_Renders()
	djui_hud_set_resolution(RESOLUTION_N64)
	
	if (STRFontTMNumber == 1 or STRFontCDNumber == 1 or STRFontGONumber == 1) then
	djui_hud_set_font(FONT_NORMAL)
	Normal_Timer_Hud()
	end
	
	if STRFontTMNumber == 2 or STRFontCDNumber == 2 or STRFontGONumber == 2 then
	djui_hud_set_font(FONT_ALIASED)
	Aliased_Timer_Hud()
	end
	
	if (STRFontTMNumber == 3 or STRFontCDNumber == 3 or STRFontGONumber == 3) and STRCustomColors == "Disabled" then
	djui_hud_set_font(FONT_CUSTOM_HUD)
	Custom_Hud_Timer()
	elseif (STRFontTMNumber == 3 or STRFontCDNumber == 3 or STRFontGONumber == 3) and STRCustomColors == "Enabled" then
	djui_hud_set_font(FONT_RECOLOR_HUD)
	Custom_Hud_Timer()
	end
	
	if STRFontTMNumber == 4 or STRFontCDNumber == 4 or STRFontGONumber == 4 then
	djui_hud_set_font(FONT_HUD)
	Normal_Hud_Timer()
	end
	
	if STRFontTMNumber == 5 or STRFontCDNumber == 5 or STRFontGONumber == 5 then
	djui_hud_set_font(FONT_MENU)
	Menu_Timer_Hud()
	end
	
	if STRFontTMNumber == 6 or STRFontCDNumber == 6 or STRFontGONumber == 6 then
	djui_hud_set_font(FONT_SPECIAL)
	Special_Timer_Hud()
	end
end
