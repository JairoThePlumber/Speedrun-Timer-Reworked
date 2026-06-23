
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

function ResettingSave_Display()
    SaveText = "Making a New Fresh Save In " .. tostring(math.floor(STRGST.STREraseSaveCD))

    local Size = 0.50
    local Width = Hud_Measure(SaveText) * Size
    local Height = 32 * Size

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - Height) / 2.0 - 112
	
	 -- render
    render_rect(X - 6 * Size, Y, Width + 12 * Size, Height, 0, 0, 0, 128)
    shadow_text(SaveText, X, Y - 0.5, Size, 1, 1, 255, 255, 255, 255)
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

function Requirements_Display()
	GSize = 0.25
	GHeight = 32 * GSize
	
	SettingsText = "- Requirements For This Run -"
	
    local Width = Hud_Measure(SettingsText) * GSize

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - GHeight) / 2.0 - 116
	
	 -- render
    render_rect(X - 6 * GSize, Y, Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SettingsText, X, Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	if (RH_Name ~= "None" or CRH_Name ~= "None") then
	if #STRPluginRuns == 0 and CRH_Name == "None" and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false then
	CText = RH_Name .. " - " .. RH_Run_Name
	elseif #STRPluginRuns == 0 and CRH_Name ~= "None" and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false then
	CText = CRH_Name .. " - " .. RH_Run_Name
	elseif #STRPluginRuns ~= 1 and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false and RH_Name ~= "None" then
	if network_is_server() then CText = RH_Name .. " - Available Slots (" .. #STRPluginRuns .. ")" else CText = "Wait until the Host Picks a Run" end
	elseif #STRPluginRuns == 1 and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false and RH_Name ~= "None" then
	if network_is_server() then CText = RH_Name .. " - Available Slot (" .. #STRPluginRuns .. ")" else CText = "Wait until the Host Pick the Only Run" end
	elseif #STRPluginRuns ~= 1 and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false and CRH_Name ~= "None" then
	if network_is_server() then CText = CRH_Name .. " - Available Slots (" .. #STRPluginRuns .. ")" else CText = "Wait until the Host Picks a Custom Run" end
	elseif #STRPluginRuns == 1 and STRGST.AddRomhack == true and STRGST.STRPluginsCheck == false and CRH_Name ~= "None" then
	if network_is_server() then CText = CRH_Name .. " - Available Slot (" .. #STRPluginRuns .. ")" else CText = "Wait until the Host Pick the Only Custom Run" end
	elseif STRGST.AddRomhack == true and STRGST.STRPluginsCheck == true and STRRunSlotAdded == true then
	CText = RH_Name .. " - " .. STRPluginRuns[STRGST.STRPluginsTypes].PluginName
	elseif STRGST.AddRomhack == true and STRGST.STRPluginsCheck == true and STRRunSlotAdded == true then
	CText = CRH_Name .. " - " .. STRPluginRuns[STRGST.STRPluginsTypes].PluginName
	elseif RH_Name == "None" or CRH_Name == "None" or RH_Run_Name == "None" then
	CText = "Loading Run..."
	end
	
	CWidth = Hud_Measure(CText) * GSize
	CX = (S_Width() - CWidth) / 2.0
	CY = (S_Height() - GHeight) / 2.0 - 108
	
	render_rect(CX - 6 * GSize, CY, CWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(CText, CX, CY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if SM64Rules == true and STRGST.AddRomhack == false and #STRPluginRuns ~= 0 then
	if STRGST.STRPluginsCheck == false then
	CText = "Super Mario 64 - Available Slots (" .. #STRPluginRuns .. ")"
	elseif STRGST.STRPluginsCheck == true then
	CText = "Super Mario 64 - " .. STRPluginRuns[STRGST.STRPluginsTypes].PluginName
	else
	CText = "Loading Run..."
	end
	
	CWidth = Hud_Measure(CText) * GSize
	CX = (S_Width() - CWidth) / 2.0
	CY = (S_Height() - GHeight) / 2.0 - 108
	
	render_rect(CX - 6 * GSize, CY, CWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(CText, CX, CY - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	end
	
	if STRGST.STRPluginsCheck == false and STRGST.AddRomhack == false and (RH_Name == "None" or CRH_Name == "None") and #STRPluginRuns == 0 then
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

function ServerSettings_Display()
	GSize = 0.25
	GHeight = 32 * GSize
	
	SettingsText = "- Server Settings -"
	
    local Width = Hud_Measure(SettingsText) * GSize

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - GHeight) / 2.0 - 116
	
	 -- render
    render_rect(X - 6 * GSize, Y, Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SettingsText, X, Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	if gServerSettings.playerInteractions == 0 then PIFunc = "Non Solid" elseif gServerSettings.playerInteractions == 1 then PIFunc = "Solid" elseif gServerSettings.playerInteractions == 2 then PIFunc = "Friendly Fire" end
	if gServerSettings.playerKnockbackStrength == 10 then KBFunc = "Weak" elseif gServerSettings.playerKnockbackStrength == 25 then KBFunc = "Normal" elseif gServerSettings.playerKnockbackStrength == 60 then KBFunc = "Too Much" end
	if gServerSettings.pvpType == 0 then PVPFunc = "Classic" elseif gServerSettings.pvpType == 1 then PVPFunc = "Revamped" end
	if gServerSettings.stayInLevelAfterStar == 0 then SCFunc = "Leave Level" elseif gServerSettings.stayInLevelAfterStar == 1 then SCFunc = "Stay In Level" elseif gServerSettings.stayInLevelAfterStar == 2 then SCFunc = "Non-Stop" end
	if gServerSettings.bouncyLevelBounds == 0 then BLFunc = "Off" elseif gServerSettings.bouncyLevelBounds == 1 then BLFunc = "On" elseif gServerSettings.bouncyLevelBounds == 2 then BLFunc = "On (Capped)" end
	if gServerSettings.nametags == 0 then NTFunc = "Disabled" elseif gServerSettings.nametags == 1 then NTFunc = "Enabled" end
	if gServerSettings.bubbleDeath == 0 then BDFunc = "Disabled" elseif gServerSettings.bubbleDeath == 1 then BDFunc = "Enabled" end
	if gServerSettings.pauseAnywhere == 0 then PAFunc = "Disabled" elseif gServerSettings.pauseAnywhere == 1 then PAFunc = "Enabled" end
	if gServerSettings.skipIntro == 0 then SITText = "Enabled" else SITText = "Disabled" end
	
	SS1Text = "Player Interact: " .. PIFunc .. " | Knockback Strength: ".. KBFunc
	SS1Width = Hud_Measure(SS1Text) * GSize
	SS1X = (S_Width() - SS1Width) / 2.0
	SS1Y = (S_Height() - GHeight) / 2.0 - 108
	
	SS2Text = "PVP Mode: " .. PVPFunc .. " | On Star Collection: " .. SCFunc
	SS2Width = Hud_Measure(SS2Text) * GSize
	SS2X = (S_Width() - SS2Width) / 2.0
	SS2Y = (S_Height() - GHeight) / 2.0 - 100
	
	SS3Text = "Bouncy Level Bounds: " .. BLFunc .. " | Nametags: " .. NTFunc
	SS3Width = Hud_Measure(SS3Text) * GSize
	SS3X = (S_Width() - SS3Width) / 2.0
	SS3Y = (S_Height() - GHeight) / 2.0 - 92
	
	SS4Text = "Bubble On Death: " .. BDFunc .. " | Pause Anywhere: " .. PAFunc
	SS4Width = Hud_Measure(SS4Text) * GSize
	SS4X = (S_Width() - SS4Width) / 2.0
	SS4Y = (S_Height() - GHeight) / 2.0 - 84
	
	SS5Text = "Max Players: " .. tostring(gServerSettings.maxPlayers) .. " | Skip Intro: " .. SITText
	SS5Width = Hud_Measure(SS5Text) * GSize
	SS5X = (S_Width() - SS5Width) / 2.0
	SS5Y = (S_Height() - GHeight) / 2.0 - 76
	
	render_rect(SS1X - 6 * GSize, SS1Y, SS1Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SS1Text, SS1X, SS1Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	render_rect(SS2X - 6 * GSize, SS2Y, SS2Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SS2Text, SS2X, SS2Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	render_rect(SS3X - 6 * GSize, SS3Y, SS3Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SS3Text, SS3X, SS3Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)	
	
	render_rect(SS4X - 6 * GSize, SS4Y, SS4Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SS4Text, SS4X, SS4Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
	
	render_rect(SS5X - 6 * GSize, SS5Y, SS5Width + 12 * GSize, GHeight, 0, 0, 0, 128)
    shadow_text(SS5Text, SS5X, SS5Y - 0.5, GSize, 0.5, 0.5, 255, 255, 255, 255)
end

function BestTime_Display()
	local GSize = 0.25
	local GHeight = 32 * GSize
	
	BTTotal = STRBestTimeNumber / 30 
	BTHours = math.floor(BTTotal / 3600) 
	BTMinutes = math.floor((BTTotal % 3600) / 60) 
	BTSeconds = math.floor(BTTotal % 60) 
	BTMilliSeconds = math.floor((BTTotal * 1000) % 1000)
	
	BestTimeText = "Best Time: " .. string.format('%01d:%02d:%02d.%03d', BTHours, BTMinutes, BTSeconds, BTMilliSeconds)
	
    local BTDWidth = Hud_Measure(BestTimeText) * GSize

    BTDX = (S_Width() - BTDWidth) / 2.0
	
	if (((STRGST.STRGameState == "Lobby" or (STRGST.STRGameState == "Started" and STRSettingsTimer == 0)) and (STRRDisplay == "Start" or STRRDisplay == "SS_Start")) 
	and (STRGST.STRGameMode == 1 or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3))
	or (STRGST.STRGameMode == 4 and ((STRGST.STRGameState == "Finished" and STRGST.STRSSText <= 1) or STRGST.STRGameState == "Lobby")) 
	or (STRGST.STRGameState == "Finished" and STRGST.STRFinishText < 1)
	or ((STRRDisplay == "Lobby" or STRRDisplay == "SS_Lobby") and STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4) 
	or (STRGST.STRGameState == "Resetting" or STRGST.STRGameState == "Paused") 
	or (STRGST.STRIntermission <= 1 and STRGST.STRGameState == "Preparing") 
	or (STRRDisplay == "None" and STRGST.STRGameState ~= "Finished" and STRGST.STRGameMode ~= 4) then
	BTDY = (S_Height() - GHeight) / 2.0 - 116
	elseif ((STRGST.STRRunsTypes == 1 or STRGST.STRRunsTypes == 2 or STRGST.STRRunsTypes == 3 or STRGST.STRRunsTypes == 4) and (STRRDisplay == "Lobby" or STRRDisplay == "Start" or STRRDisplay == "SS_Start"))
	or (STRGST.STRGameState == "Finished" and STRGST.STRFinishGameWarp == "Disabled" and (STRGST.STRFinishText > 12 and STRGST.STRFinishText < 2)) 
	or (STRGST.STRGameState == "Started" and STRGST.STRGameMode == 4) 
	or (((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or (STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) and STRGST.STRGameState == "Finished") 
	or (STRGST.STRGameMode == 1 and STRGST.STRIntermission >= 1 and STRGST.STRGameState == "Preparing") 
	or ((STRGST.STRPluginsCheck == true or STRGST.AddRomhack == true) and not (STRRDisplay == "SS_Lobby" or STRRDisplay == "SS_Start")) then
    BTDY = (S_Height() - GHeight) / 2.0 - 100
	elseif (STRGST.STRRunsTypes == 5 or STRGST.STRRunsTypes == 6 or STRGST.STRRunsTypes == 7 or STRGST.STRRunsTypes == 8 or STRGST.STRRunsTypes == 9 or STRGST.STRRunsTypes == 10) 
	and (STRRDisplay == "Lobby" or STRRDisplay == "Start") then
    BTDY = (S_Height() - GHeight) / 2.0 - 92
	elseif (STRGST.STRRunsTypes == 11 or STRGST.STRRunsTypes == 12 or STRGST.STRRunsTypes == 13 or STRGST.STRRunsTypes == 14) and (STRRDisplay == "Lobby" or STRRDisplay == "Start") then
    BTDY = (S_Height() - GHeight) / 2.0 - 84
	elseif STRGST.STRRunsTypes == 15 and (STRRDisplay == "Lobby" or STRRDisplay == "Start") then
    BTDY = (S_Height() - GHeight) / 2.0 - 76
	elseif ((STRRDisplay == "SS_Lobby" and STRGST.STRGameState == "Lobby") or (STRRDisplay == "SS_Start" and STRGST.STRGameState == "Started" and STRSettingsTimer ~= 0)) then
    BTDY = (S_Height() - GHeight) / 2.0 - 68
	end
	
	 -- render
    render_rect(BTDX - 6 * GSize, BTDY, BTDWidth + 12 * GSize, GHeight, 0, 0, 0, 128)
	if STRBestTimeOption == "Enabled" and STRGST.STRGameState ~= "Finished" then
	BTRed, BTGreen, BTBlue = 255, 255, 0
	elseif STRBestTimeOption == "Saves" and STRGST.STRGameState ~= "Finished" then
	BTRed, BTGreen, BTBlue = 255, 255, 255
	end
	
	if STRBestTimeNumber ~= STRGST.STRGlobalTimer and STRGST.STRGameState ~= "Lobby" then
	if STRBestTimeNumber >= STRGST.STRGlobalTimer and STRBestTimeOption == "Enabled" then 
	BTRed, BTGreen, BTBlue = 0, 255, 0
	elseif STRBestTimeNumber <= STRGST.STRGlobalTimer and STRBestTimeOption == "Enabled" then 
	BTRed, BTGreen, BTBlue = 255, 0, 0
	end
	end
	
	if STRBestTimeNumber ~= 0 and STRGST.STRGameState ~= "Lobby" then
	if STRBestTimeNumber >= STRGST.STRGlobalTimer and STRBestTimeOption == "Saves" then 
	BTRed, BTGreen, BTBlue = 0, 255, 0
	elseif STRBestTimeNumber <= STRGST.STRGlobalTimer and STRBestTimeOption == "Saves" then 
	BTRed, BTGreen, BTBlue = 255, 0, 0
	end
	end
	
	shadow_text(BestTimeText, BTDX, BTDY - 0.5, GSize, 0.5, 0.5, BTRed, BTGreen, BTBlue, 255)
end

function Warp_Timer_Display()
	if STRGST.STRFinishText > 6 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" then
    WarpText = "The Run is Finished!!"
	elseif ((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3) and STRGST.STRCakeEndingCheck == true then
	WarpText = "The Run will Reset, Once someone is out of the Cake Ending"
	elseif ((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3) and STRGST.STRCakeEndingCheck == false then
	WarpText = "The Run will Reset in " .. tostring(math.floor(STRGST.STRWarpCountdown))
	elseif STRGST.STRFinishText > 2 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" and not network_is_server() then
    WarpText = "You can check around, While the Host is setting up"
	elseif STRGST.STRFinishText > 2 and STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled" and network_is_server() then
    WarpText = "You can Redo the Run or Do a Different Run."
	end

    local Size = 0.50
    local Width = Hud_Measure(WarpText) * Size
    local Height = 32 * Size

    local X = (S_Width() - Width) / 2.0
    local Y = (S_Height() - Height) / 2.0 - 112

    render_rect(X - 6 * Size, Y, Width + 12 * Size, Height, 0, 0, 0, 128)
    shadow_text(WarpText, X, Y - 0.5, Size, 1, 1, 255, 255, 255, 255)
end

function Normal_Timer_Hud()
	NT_T = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFTMNumber == 1 then
	NT_S = 0.50
	NT_H = 16 * NT_S
	NT_W = Hud_Measure(NT_T) * NT_S
	NT_X = (S_Width() - NT_W) / 2.0 + STRFontPosition.STRCX
    NT_Y = (S_Height() - NT_H) / 2.0 + 108 + STRFontPosition.STRCY
	custom_render_rect(NT_X - 5.5, NT_Y, NT_W + 12, 16)
	custom_shadow_text(NT_T, NT_X, NT_Y - 0.5, NT_S, 1, 1)
	end

	if GoDisplayFunc or ShowGoFont then
    NT_C = "Go!"
	elseif CountdownSwitchFunc or ShowCDFont then
	NT_C = tostring(math.floor(STRGST.STRCountdown))
	else
	NT_C = "Wait"
	end
	
	if STRFCDNumber == 1 then
	NTCD_S = 1
	NTCD_H = 32 * NTCD_S
	NTCD_W = Hud_Measure(NT_C) * NTCD_S
	NTCD_X = (S_Width() - NTCD_W) / 2.0 - 1
	NTCD_Y = (S_Height() - NTCD_H) / 2.0
	if CountdownDisplayFunc or ShowCDFont then
	custom_render_rect(NTCD_X - 5, NTCD_Y, NTCD_W + 12, NTCD_H)
	custom_shadow_text(NT_C, NTCD_X, NTCD_Y - 0.5, NTCD_S, 2, 2)
	end
	end
	
	if STRFGONumber == 1 then
	NTGO_S = 1
	NTGO_H = 32 * NTGO_S
	NTGO_W = Hud_Measure(NT_C) * NTGO_S
	NTGO_X = (S_Width() - NTGO_W) / 2.0 - 1
	NTGO_Y = (S_Height() - NTGO_H) / 2.0
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_render_rect(NTGO_X - 5, NTGO_Y, NTGO_W + 12, NTGO_H)
	custom_shadow_text(NT_C, NTGO_X - 0.5, NTGO_Y - 0.5, NTGO_S, 2, 2)
	end
	end
end

function Aliased_Timer_Hud()
	AT_T = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFTMNumber == 2 then
	AT_S = 0.50
	AT_H = 16 * AT_S
	AT_W = Hud_Measure(AT_T) * AT_S
	AT_X = (S_Width() - AT_W) / 2.0 + STRFontPosition.STRCX
    AT_Y = (S_Height() - AT_H) / 2.0 + 108 + STRFontPosition.STRCY
	custom_render_rect(AT_X - 5.5, AT_Y, AT_W + 12, 16)
	custom_shadow_text(AT_T, AT_X, AT_Y - 0.5, AT_S, 1, 1)
	end

	if GoDisplayFunc or ShowGoFont then
    AT_C = "Go!"
	elseif CountdownSwitchFunc or ShowCDFont then
	AT_C = tostring(math.floor(STRGST.STRCountdown))
	else
	AT_C = "Wait"
	end
	
	if STRFCDNumber == 2 then
	ATCD_S = 1
	ATCD_H = 32 * ATCD_S
	ATCD_W = Hud_Measure(AT_C) * ATCD_S
	ATCD_X = (S_Width() - ATCD_W) / 2.0 - 1
	ATCD_Y = (S_Height() - ATCD_H) / 2.0
	if CountdownDisplayFunc or ShowCDFont then
	custom_render_rect(ATCD_X - 5, ATCD_Y, ATCD_W + 12, ATCD_H)
	custom_shadow_text(AT_C, ATCD_X, ATCD_Y - 0.5, ATCD_S, 2, 2)
	end
	end
	
	if STRFGONumber == 2 then
	ATGO_S = 1
	ATGO_H = 32 * ATGO_S
	ATGO_W = Hud_Measure(AT_C) * ATGO_S
	ATGO_X = (S_Width() - ATGO_W) / 2.0 - 1
	ATGO_Y = (S_Height() - ATGO_H) / 2.0
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_render_rect(ATGO_X - 5, ATGO_Y, ATGO_W + 12, ATGO_H)
	custom_shadow_text(AT_C, ATGO_X - 0.5, ATGO_Y - 0.5, ATGO_S, 2, 2)
	end
	end
end

function Custom_Hud_Timer()
	CHT_STRH10 = string.format("%02d", GSTRH)
	CHT_STRH = string.format("%d", GSTRH)
    CHT_STRM = string.format("%02d", GSTRM)
	CHT_STRS = string.format("%02d", GSTRS)
	CHT_STRMS = string.format("%03d", GSTRMS)
	
	if STRFTMNumber == 3 then
	CHT_S = 1
	CHT_W = 1 * CHT_S
	CHT_H = 16 * CHT_S
	CHT_X = (S_Width() - CHT_W) / 2.0 + STRFontPosition.STRCX
	CHT_Y = (S_Height() - CHT_H) / 2.0 + 110 + STRFontPosition.STRCY	
	
	if GSTRH >= 10 then
	z = -28
	custom_normal_text("Time", CHT_X - 127 - z, CHT_Y, CHT_S)
	custom_normal_text(CHT_STRH10, CHT_X - 67 - z, CHT_Y, CHT_S)
	else
	z = -20
	custom_normal_text("Time", CHT_X - 115 - z, CHT_Y, CHT_S)
	custom_normal_text(CHT_STRH, CHT_X - 55 - z, CHT_Y, CHT_S)
	end
	
	custom_normal_text(CHT_STRM, CHT_X - 35 - z, CHT_Y, CHT_S)
	custom_normal_text(CHT_STRS, CHT_X - 1 - z, CHT_Y, CHT_S)
	custom_normal_text(CHT_STRMS, CHT_X + 33 - z, CHT_Y, CHT_S)
	
	custom_normal_text("'", CHT_X - 40 - z, CHT_Y - 3, CHT_S)
	custom_normal_text('"', CHT_X - 7 - z, CHT_Y - 3, CHT_S)
	custom_normal_text('"', CHT_X + 27 - z, CHT_Y - 3, CHT_S)
	end
	
	if GoDisplayFunc or ShowGoFont then
	CH_C = "Go!"
	elseif CountdownSwitchFunc or ShowCDFont then
	CH_C = tostring(math.floor(STRGST.STRCountdown))
	else
	CH_C = "Wait"
	end
	
	if STRFCDNumber == 3 then
	CHCD_S = 2
	CHCD_H = 16 * CHCD_S
    CHCD_W = Hud_Measure(CH_C) * CHCD_S
	CHCD_Y = (S_Height() - CHCD_H) / 2.0
	
	if STRGST.STRGlobalTimer == 0 then
	if STRGST.STRCountdown < 10 then
	CHCD_X = (S_Width() - CHCD_W) / 2.03
	else
	CHCD_X = (S_Width() - CHCD_W) / 2.04
	end
	end
	
	if CountdownDisplayFunc or ShowCDFont then
	custom_normal_text(CH_C, CHCD_X, CHCD_Y, CHCD_S)
	end
	end
	
	if STRFGONumber == 3 then
	CHGO_S = 2
	CHGO_H = 16 * CHGO_S
	CHGO_W = Hud_Measure(CH_C) * CHGO_S
	CHGO_X = (S_Width() - CHGO_W) / 2.01
	CHGO_Y = (S_Height() - CHGO_H) / 2.0
	
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_normal_text(CH_C, CHGO_X, CHGO_Y, CHGO_S)
	end
	end
end

function Normal_Hud_Timer()
	NHT_STRH10 = string.format("%02d", GSTRH)
	NHT_STRH = string.format("%d", GSTRH)
    NHT_STRM = string.format("%02d", GSTRM)
	NHT_STRS = string.format("%02d", GSTRS)
	NHT_STRMS = string.format("%03d", GSTRMS)
	
	if STRFTMNumber == 4 then
	NHT_S = 1
	NHT_W = 1 * NHT_S
	NHT_H = 16 * NHT_S
	NHT_X = (S_Width() - NHT_W) / 2.0 + STRFontPosition.STRCX
	NHT_Y = (S_Height() - NHT_H) / 2.0 + 110 + STRFontPosition.STRCY	
	
	if GSTRH >= 10 then
	z = -28
	custom_romhack_text("TIME", NHT_X - 127 - z, NHT_Y, NHT_S, "Words")
	custom_romhack_text(NHT_STRH10, NHT_X - 67 - z, NHT_Y, NHT_S, "Numbers")
	else
	z = -20
	custom_romhack_text("TIME", NHT_X - 115 - z, NHT_Y, NHT_S, "Words")
	custom_romhack_text(NHT_STRH, NHT_X - 55 - z, NHT_Y, NHT_S, "Numbers")
	end
	
	custom_romhack_text(NHT_STRM, NHT_X - 35 - z, NHT_Y, NHT_S, "Numbers")
	custom_romhack_text(NHT_STRS, NHT_X - 1 - z, NHT_Y, NHT_S, "Numbers")
	custom_romhack_text(NHT_STRMS, NHT_X + 33 - z, NHT_Y, NHT_S, "Numbers")
	
	custom_romhack_text("'", NHT_X - 45 - z, NHT_Y - 8, NHT_S, "Quotes")
	custom_romhack_text('"', NHT_X - 10 - z, NHT_Y - 8, NHT_S, "Quotes")
	custom_romhack_text('"', NHT_X + 24 - z, NHT_Y - 8, NHT_S, "Quotes")
	end
	
	if GoDisplayFunc or ShowGoFont then
	NH_C = "Go"
	elseif CountdownSwitchFunc or ShowCDFont then
	NH_C = tostring(math.floor(STRGST.STRCountdown))
	else
	NH_C = "Wait"
	end
	
	if STRFCDNumber == 4 then
	NHCD_S = 2
	NHCD_H = 16 * NHCD_S
    NHCD_W = Hud_Measure(NH_C) * NHCD_S
	NHCD_Y = (S_Height() - NHCD_H) / 2.0
	
	if STRGST.STRGlobalTimer == 0 then
	if STRGST.STRCountdown < 10 then
	NHCD_X = (S_Width() - NHCD_W) / 2.03
	else
	NHCD_X = (S_Width() - NHCD_W) / 2.04
	end
	end
	
	if CountdownDisplayFunc or ShowCDFont then
	custom_romhack_text(NH_C, NHCD_X, NHCD_Y, NHCD_S, "Numbers")
	end
	end
	
	if STRFGONumber == 4 then
	NHGO_S = 2
	NHGO_H = 16 * NHGO_S
	NHGO_W = Hud_Measure(NH_C) * NHGO_S
	NHGO_X = (S_Width() - NHGO_W) / 2.01
	NHGO_Y = (S_Height() - NHGO_H) / 2.0
	
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_romhack_text(NH_C, NHGO_X, NHGO_Y, NHGO_S, "Words")
	end
	end
end

function Menu_Timer_Hud()
	-- Timer Display
	MHT_T = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFTMNumber == 5 then
	MHT_S = 0.36
	MHT_H = 16 * MHT_S
	MHT_W = Hud_Measure(MHT_T) * MHT_S
	MHT_X = (S_Width() - MHT_W) / 2.0 + STRFontPosition.STRCX
    MHT_Y = (S_Height() - MHT_H) / 2.0 + 102 + STRFontPosition.STRCY
	custom_normal_text(MHT_T, MHT_X, MHT_Y, MHT_S)
	end

	if GoDisplayFunc or ShowGoFont then
    MH_C = "Go!"
	elseif CountdownDisplayFunc or ShowCDFont then
	MH_C = tostring(math.floor(STRGST.STRCountdown))
	else
	MH_C = "Wait"
	end
	
	if STRFCDNumber == 5 then
	MHCD_S = 0.75
	MHCD_H = 50 * MHCD_S
	MHCD_W = Hud_Measure(MH_C) * MHCD_S
	MHCD_X = (S_Width() - MHCD_W) / 2.05
	MHCD_Y = (S_Height() - MHCD_H) / 2.12
	if CountdownDisplayFunc or ShowCDFont then
	custom_normal_text(MH_C, MHCD_X, MHCD_Y, MHCD_S)
	end
	end
	
	if STRFGONumber == 5 then
	MHGO_S = 0.75
	MHGO_H = 50 * MHGO_S
	MHGO_W = Hud_Measure(MH_C) * MHGO_S
	MHGO_X = (S_Width() - MHGO_W) / 1.97
	MHGO_Y = (S_Height() - MHGO_H) / 2.12
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_normal_text(MH_C, MHGO_X, MHGO_Y, MHGO_S)
	end
	end
end

function Special_Timer_Hud()
	ST_T = string.format('%01d:%02d:%02d.%03d', GSTRH, GSTRM, GSTRS, GSTRMS)
	
	if STRFTMNumber == 6 then
	ST_S = 0.50
	ST_H = 16 * ST_S
	ST_W = Hud_Measure(ST_T) * ST_S
	ST_X = (S_Width() - ST_W) / 2.0 + STRFontPosition.STRCX
    ST_Y = (S_Height() - ST_H) / 2.0 + 108 + STRFontPosition.STRCY
	custom_render_rect(ST_X - 5.5, ST_Y, ST_W + 12, 16)
	custom_shadow_text(ST_T, ST_X, ST_Y - 0.5, ST_S, 1, 1)
	end

	if GoDisplayFunc or ShowGoFont then
    ST_C = "Go!"
	elseif CountdownSwitchFunc or ShowCDFont then
	ST_C = tostring(math.floor(STRGST.STRCountdown))
	else
	ST_C = "Wait"
	end
	
	if STRFCDNumber == 6 then
	STCD_S = 1
	STCD_H = 32 * STCD_S
	STCD_W = Hud_Measure(ST_C) * STCD_S
	STCD_X = (S_Width() - STCD_W) / 2.0 - 1
	STCD_Y = (S_Height() - STCD_H) / 2.0
	if CountdownDisplayFunc or ShowCDFont then
	custom_render_rect(STCD_X - 5, STCD_Y, STCD_W + 12, STCD_H)
	custom_shadow_text(ST_C, STCD_X, STCD_Y - 0.5, STCD_S, 2, 2)
	end
	end
	
	if STRFGONumber == 6 then
	STGO_S = 1
	STGO_H = 32 * STGO_S
	STGO_W = Hud_Measure(ST_C) * STGO_S
	STGO_X = (S_Width() - STGO_W) / 2.0 - 1
	STGO_Y = (S_Height() - STGO_H) / 2.0
	if (GoDisplayFunc and STRGST.STRGameMode ~= 4) or ShowGoFont then
	custom_render_rect(STGO_X - 5, STGO_Y, STGO_W + 12, STGO_H)
	custom_shadow_text(ST_C, STGO_X - 0.5, STGO_Y - 0.5, STGO_S, 2, 2)
	end
	end
end

function All_Hud_Renders()
	djui_hud_set_resolution(RESOLUTION_N64)
	djui_hud_set_font(FONT_NORMAL)
	
	if STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay > 1 and STRGST.STRIntermission > 1 and (STRGST.STRStartingType == 1 or STRGST.STRStartingType == 2) then
	Intermission_Display()
	end
	
	if STRGST.EraseSave == true then
	ResettingSave_Display()
	end
	
	if STRGST.STRGameState == "Finished" and ((((STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Enabled") or STRGST.STRGameMode == 2 or STRGST.STRGameMode == 3)) 
	or (STRGST.STRFinishText > 1 and (STRGST.STRGameMode == 1 and STRGST.STRFinishGameWarp == "Disabled"))) then
	Warp_Timer_Display()
	end
	
	if (STRRDisplay == "Lobby" and STRGST.STRGameState == "Lobby" and not STRGST.EraseSave and STRGST.STRGameMode ~= 4) 
	or (STRRDisplay == "Start" and STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 and STRSettingsTimer ~= 0) then
	Requirements_Display()
	end
	
	if (STRRDisplay == "SS_Lobby" and STRGST.STRGameState == "Lobby" and not STRGST.EraseSave and STRGST.STRGameMode ~= 4) 
	or (STRRDisplay == "SS_Start" and STRGST.STRGameState == "Started" and STRGST.STRGameMode ~= 4 and STRSettingsTimer ~= 0) then
	ServerSettings_Display()
	end
	
	if (STRBestTimeOption == "Enabled" or STRBestTimeOption == "Saves") and STRGST.EraseSave == false then 
	BestTime_Display()
	end

	if (STRGST.STRGameState == "Started" or STRGST.STRGameState == "Finished") and STRGST.STRGameMode == 4 and STRGST.STRSSText >= 2 then
	SingleStars_Display()
	end
	
	if STRRules == "Enabled" and STRRulesOpen == true and (STRGST.STRGameMode == 1 or STRGST.STRGameMode == 2) and (SM64Rules == true or STRGST.AddRomhack == true) and STRGST.STRGameState == "Lobby" then
	Rules_Display()
	romhack_rules()
	end
end

function Timer_Hud_Renders()
	djui_hud_set_resolution(RESOLUTION_N64)
	
	if (STRFTMNumber == 1 or STRFCDNumber == 1 or STRFGONumber == 1) and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_NORMAL)
	Normal_Timer_Hud()
	end
	
	if STRFTMNumber == 2 or STRFCDNumber == 2 or STRFGONumber == 2 and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_ALIASED)
	Aliased_Timer_Hud()
	end
	
	if (STRFTMNumber == 3 or STRFCDNumber == 3 or STRFGONumber == 3) and STRCustomColors == "Disabled" and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_CUSTOM_HUD)
	Custom_Hud_Timer()
	elseif (STRFTMNumber == 3 or STRFCDNumber == 3 or STRFGONumber == 3) and STRCustomColors == "Enabled" and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_RECOLOR_HUD)
	Custom_Hud_Timer()
	end
	
	if STRFTMNumber == 4 or STRFCDNumber == 4 or STRFGONumber == 4 and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_HUD)
	Normal_Hud_Timer()
	end
	
	if STRFTMNumber == 5 or STRFCDNumber == 5 or STRFGONumber == 5 and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_MENU)
	Menu_Timer_Hud()
	end
	
	if STRFTMNumber == 6 or STRFCDNumber == 6 or STRFGONumber == 6 and STRLoadSaveUpdater > 1 then
	djui_hud_set_font(FONT_SPECIAL)
	Special_Timer_Hud()
	end
end
