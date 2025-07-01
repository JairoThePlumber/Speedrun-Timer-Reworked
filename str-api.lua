-- This is a Api for adding a Romhack, I also added a warp to the right location

function add_plugin_slot(RunNumber, MainFunc)
	if STRGST.STRGameMode ~= 4 and STRPluginRuns[STRGST.STRPluginsTypes].PluginNum == RunNumber and STRGST.STRPluginsCheck == true and MainFunc and STRGST.STRGameState == "Started" then
	STRGST.STRGameState = "Finished"
	end
	
	if STRGST.STRGameMode ~= 4 and STRPluginRuns[STRGST.STRPluginsTypes].PluginNum == RunNumber and MainFunc and STRGST.STRPluginsCheck == false and STRGST.BuildInRomhacks == true then
	STRGST.STRGameState = "Finished"
	end
end

local function add_custom_fonts(ID, Name)
if ID ~= nil and Name ~= nil then
table.insert(STRFontsTable, {str_font_id = ID, str_font_name = Name})
end

return #STRFontsTable
end

local function set_romhack_colors(Numbers, Words, Quotes)
STRNumbers = Numbers
STRWords = Words
STRQuotes = Quotes
end

local function set_custom_colors(Apply, R, B, G)
if (STRCustomColors == "Disabled") or (STRCustomColors == "Enabled" and Apply == false) then
Hud_Color(255, 255, 255, STRFV)
elseif STRCustomColors == "Enabled" and Apply == true then
Hud_Color(STRFR, STRFG, STRFB, STRFV)
elseif Apply == "Custom" then
Hud_Color(R, G, B, STRFV)
	end
end

local function set_custom_countdown(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, layers)
	if not ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing")) then return end
	
	if STRFontsTable[STRFontCDNumber].str_font_id ~= FName then return end
	
	if (layers == "Middle") or (layers == "Right") then
	CD1 = (math.floor(STRGST.STRCountdown%10)%n1)
	CD2 =  math.floor(STRGST.STRCountdown%10/n2)
	elseif (layers == "Left (Tens)" or layers == "Left (Ones)") then
	CD1 = ((math.floor(gGlobalSyncTable.STRCountdown/10)%10)%n1)
	CD2 = math.floor(STRGST.STRCountdown%100/n2)
	end
	
	if ((layers == "Middle" and STRGST.STRCountdown < 10) or ((layers ~= "Middle") and STRGST.STRCountdown >= 10)) then
	if types == "Multiply" then
	Hud_Tile_Tex(Texture(Tx), x, y, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Add" then
	Hud_Tile_Tex(Texture(Tx), x, y, s1, s2, CD1*s3, CD2+s4, s5, s6)
	end
	end
end

local function set_custom_go(FName, Tx, x, y, s1, s2, s3, s4, s5, s6)
	if not (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then return end
	if STRFontsTable[STRFontGONumber].str_font_id ~= FName then return end
    Hud_Tile_Tex(Texture(Tx), x, y, s1, s2, s3, s4, s5, s6)
end

local function set_custom_extras(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, types)
	if types == "Timer" and STRFontsTable[STRFontTMNumber].str_font_id == FName then
    Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, s3, s4, s5, s6)
	elseif types ~= "Timer" then
	if ((STRGST.STRSecondsDelay > 28 and STRGST.STRStartingType == 3 and STRGST.STRCountdown >= 1.01) 
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 90 and STRGST.STRCountdown >= 1.01)
	or (STRGST.STRSecondsDelay > 58 and STRGST.STRSecondsDelay < 89 and STRGST.STRCountdown == 1 and STRGST.STRGameState == "Preparing")
	or (STRGST.STRSecondsDelay > 28 and STRGST.STRSecondsDelay < 58 and STRGST.STRCountdown == 1 and STRGST.STRStartingType == 3 and STRGST.STRGameState == "Preparing"))	
	or (STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and STRGST.STRGameMode ~= 4) then
	if STRGST.STRCountdown >= 1.01 and types == "Countdown" and STRFontsTable[STRFontCDNumber].str_font_id == FName then
	Hud_Tile_Tex(Texture(Tx), x, y, s1, s2, s3, s4, s5, s6)
	end
	if STRGST.STRGlobalTimer <= 30 and STRGST.STRGlobalTimer >= 1 and types == "Go" and STRFontsTable[STRFontGONumber].str_font_id == FName then
	Hud_Tile_Tex(Texture(Tx), x, y, s1, s2, s3, s4, s5, s6)
	end
	end
	end
end

local function set_custom_time(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, speed, x2, y2, s7, s8, s9, s10, s11, s12, n3, n4)
	if STRFontsTable[STRFontTMNumber].str_font_id ~= FName then return end
	
	if speed == "Hours Speed" then
	TM1 = (math.floor(GSTRH%10)%n1)
	TM2 =  math.floor(GSTRH%10/n2)
	TM3 = (math.floor(GSTRH%10)%n3)
	TM4 =  math.floor(GSTRH%10/n4)
	elseif speed == "Minutes Speed" then
	TM1 = (math.floor(GSTRM%10)%n1)
	TM2 =  math.floor(GSTRM%10/n2)
	TM3 = (math.floor(GSTRM%10)%n3)
	TM4 =  math.floor(GSTRM%10/n4)
	elseif speed == "Seconds Speed" then
	TM1 = (math.floor(GSTRS%10)%n1)
	TM2 =  math.floor(GSTRS%10/n2)
	TM3 = (math.floor(GSTRS%10)%n3)
	TM4 =  math.floor(GSTRS%10/n4)
	elseif speed == "Milliseconds Speed" then
	TM1 = (math.floor(GSTRMS%10)%n1)
	TM2 =  math.floor(GSTRMS%10/n2)
	TM1 = (math.floor(GSTRMS%10)%n3)
	TM2 =  math.floor(GSTRMS%10/n4)
	end

    if GSTRH >= 10 then
	if speed == "Static" and types == "None" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s1, s2, s3, s4, s5, s6)
	elseif speed == "Moveable" and types == "None" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s7, s8, s9, s10, s11, s12)
	end
	
	if types == "Multiply (Static)" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s1, s2, TM1*s3, TM2*s4, s5, s6)
	elseif types == "Multiply (Moveable)" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s7, s8, TM3*s9, TM4*s10, s11, s12)
	elseif types == "Add (Static)" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s1, s2, TM1*s3, TM2+s4, s5, s6)
	elseif types == "Add (Moveable)" then
	Hud_Tile_Tex(Texture(Tx), x2 + CXPos, y2 + CYPos, s7, s8, TM3*s9, TM4+s10, s11, s12)
		end
	end
	
	if GSTRH < 10 then
	if (speed == "Static" or speed == "Moveable") and types == "None" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, s3, s4, s5, s6)
	end

	if types == "Multiply (Static)" or types == "Multiply (Moveable)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, TM1*s3, TM2*s4, s5, s6)
	elseif types == "Add (Static)" or types == "Add (Moveable)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, TM1*s3, TM2+s4, s5, s6)
		end
	end
end

local function set_custom_milliseconds(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, layers)
	if STRFontsTable[STRFontTMNumber].str_font_id ~= FName then return end
	
	if layers == "Ones" then
	CD1 = (math.floor(GSTRMS%10)%n1)
	CD2 =  math.floor(GSTRMS%10/n2)
	elseif layers == "Tens" then
	CD1 = ((math.floor(GSTRMS/10)%10)%n1)
	CD2 =  math.floor(GSTRMS%100/n2)
	elseif layers == "Hundreds" then
	CD1 = ((math.floor(GSTRMS/100)%10)%n1)
	CD2 =  math.floor(GSTRMS%1000/n2)
	end
	
	if types == "Multiply" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Add" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	end
end

local function set_custom_seconds(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, layers)
	if STRFontsTable[STRFontTMNumber].str_font_id ~= FName then return end
	
	if layers == "Ones" then
	CD1 = (math.floor(GSTRS%10)%n1)
	CD2 =  math.floor(GSTRS%10/n2)
	elseif layers == "Tens" then
	CD1 = ((math.floor(GSTRS/10)%10)%n1)
	CD2 =  math.floor(GSTRS%100/n2)
	end
	
	if types == "Multiply (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Multiply (Hidden)" and Seconds >= 10 then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Add (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	elseif types == "Add (Hidden)" and Seconds >= 10 then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	end
end

local function set_custom_minutes(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, layers)
	if STRFontsTable[STRFontTMNumber].str_font_id ~= FName then return end
	
	if layers == "Ones" then
	CD1 = (math.floor(GSTRM%10)%n1)
	CD2 =  math.floor(GSTRM%10/n2)
	elseif layers == "Tens" then
	CD1 = ((math.floor(GSTRM/10)%10)%n1)
	CD2 =  math.floor(GSTRM%100/n2)
	end
	
	if types == "Multiply (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Multiply (Hidden)" and GSTRM >= 10 then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Add (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	elseif types == "Add (Hidden)" and GSTRM >= 10 then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	end
end

local function set_custom_hours(FName, Tx, x, y, s1, s2, s3, s4, s5, s6, n1, n2, types, layers)
	if STRFontsTable[STRFontTMNumber].str_font_id ~= FName then return end
	
	if layers == "Ones" then
	CD1 = (math.floor(GSTRH%10)%n1)
	CD2 =  math.floor(GSTRH%10/n2)
	elseif layers == "Tens" then
	CD1 = ((math.floor(GSTRH/10)%10)%n1)
	CD2 =  math.floor(GSTRH%100/n2)
	end
	
	if types == "Multiply (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Multiply (Hidden)" and GSTRH < 10 and layers == "Ones" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Multiply (Hidden)" and GSTRH >= 10 and layers == "Tens" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2*s4, s5, s6)
	elseif types == "Add (Normal)" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	elseif types == "Add (Hidden)"and GSTRH < 10 and layers == "Ones" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	elseif types == "Add (Hidden)" and GSTRH >= 10 and layers == "Tens" then
	Hud_Tile_Tex(Texture(Tx), x + CXPos, y + CYPos, s1, s2, CD1*s3, CD2+s4, s5, s6)
	end
end

local function add_rules_text(RTText, RTX, RTY, RTW, RTH, RTS, RTSX, RTSY, RTR, RTG, RTB, RTV)
	if STRRules == "Enabled" and STRRulesOpen == true and STRCustomRules == true then
	local RulesTSize = RTS
	local RulesTWidth = RTW * RulesTSize
	local RulesTHeight = RTH * RulesTSize
	local RulesTX = (S_Width() - RulesTWidth) / RTX
	local RulesTY = (S_Height() - RulesTHeight) / RTY
	
	shadow_text(RTText, RulesTX, RulesTY, RulesTSize, RTSX, RTSY, RTR, RTG, RTB, RTV)
	end
end

local function add_rules_rect(RRX, RRY, RRW, RRH, RRS, RulesRR, RulesRG, RulesRB, RulesRV)
	STRCustomRules = true
	if STRRules == "Enabled" and STRRulesOpen == true and STRCustomRules == true then
	local RulesRSize = RRS
	local RulesRW = RRW * RulesRSize
	local RulesRH = RRH * RulesRSize
	local RulesRX = (S_Width() - RulesRW) / RRX
	local RulesRY = (S_Height() - RulesRH) / RRY
	render_rect(RulesRX, RulesRY, RulesRW, RulesRH, RulesRR, RulesRG, RulesRB, RulesRV)
	end
end

local function add_full_sounds(ID, Name, FSound, CNSound, GoSound)
if ID ~= nil and Name ~= nil then
if FSound ~= nil then
table.insert(STRFanfareTable, {str_fanfare_id = ID, str_fanfare_name = Name, str_fanfare_sound = FSound})
end

if CNSound ~= nil then
table.insert(STRCountdownTable, {str_countdown_id = ID, str_countdown_name = Name, str_countdown_sound = CNSound})
end

if GoSound ~= nil then
table.insert(STRGoTable, {str_go_id = ID, str_go_name = Name, str_go_sound = GoSound})
end
end
return #STRFanfareTable or #STRCountdownTable or #STRGoTable
end

local function play_full_sounds()
	if is_game_paused() then
	Volume = 0.5
	else
	Volume = 1
	end
	if (STRGST.STRGameState == "Preparing" and STRGST.STRSecondsDelay == 3 and (STRGST.STRStartingType == 1 or STRGST.STRStartingType == 2)) and STRFanfareNumber ~= 1 then
		audio_sample_play(audio_sample_load(STRFanfareTable[STRFanfareNumber].str_fanfare_sound), gMarioStates[0].pos, Volume)
	end
	
	if STRGST.STRCDSounds == 29 and STRCountdownNumber > 5 then
		audio_sample_play(audio_sample_load(STRCountdownTable[STRCountdownNumber].str_countdown_sound), gMarioStates[0].pos, Volume)
	end
	
	if STRGST.STRGlobalTimer == 2 and STRGoNumber ~= 1 and STRGST.STRGameMode ~= 4 then
		audio_sample_play(audio_sample_load(STRGoTable[STRGoNumber].str_go_sound), gMarioStates[0].pos, Volume)
	end
	
	if STRMenuDisplay == true and MenuSwitchDeplay == 5 and STRMenuNumber == 13 and MenuButtonsDeplay == 0 then
	if STRPlaySound == true and MenuOptionDeplay == 9 and MenuUDOption == 1 then 
	if STRFanfareNumber ~= 1 then
	audio_sample_play(audio_sample_load(STRFanfareTable[STRFanfareNumber].str_fanfare_sound), gMarioStates[0].pos, Volume)
	end
	STRPlaySound = false
	end
	if STRPlaySound == true and MenuOptionDeplay == 9 and MenuUDOption == 2 then
	if STRCountdownNumber > 5 then
	audio_sample_play(audio_sample_load(STRCountdownTable[STRCountdownNumber].str_countdown_sound), gMarioStates[0].pos, Volume)
	end
	STRPlaySound = false
	end
	if STRPlaySound == true and MenuOptionDeplay == 9 and MenuUDOption == 3 then 
	if STRGoNumber ~= 1 then
	audio_sample_play(audio_sample_load(STRGoTable[STRGoNumber].str_go_sound), gMarioStates[0].pos, Volume)
	end 
	STRPlaySound = false
	end
	end
end

-- Api For Other Mods
_G.STREnabled = true
_G.STRApi = {
	-- Main Runs and Custom Runs --
	add_plugin_slot = add_plugin_slot,
	
	add_run_slot = function (Number, NameSlot)
	table.insert(STRPluginRuns, {PluginName = NameSlot, PluginNum = Number})
	STRRunSlotAdded = true
	return #STRPluginRuns
	end,
	
	-- Rules --
	add_rules_text = add_rules_text,
	add_rules_rect = add_rules_rect,
	
	Set_Font_Render = function (Type)
	return STRRenderType == Type
	end,
	
	Set_Timer = function ()
	return STRGST.STRGlobalTimer
	end,
	
	Set_Countdown = function ()
	return STRGST.STRCountdown 
	end,
	
	-- Fonts --
	add_custom_fonts = add_custom_fonts,
	set_custom_colors = set_custom_colors,
	set_romhack_colors = set_romhack_colors,
	
	set_custom_countdown = set_custom_countdown,
	set_custom_go = set_custom_go,
	set_custom_time = set_custom_time,
	set_custom_milliseconds = set_custom_milliseconds,
	set_custom_seconds = set_custom_seconds,
	set_custom_minutes = set_custom_minutes,
	set_custom_hours = set_custom_hours,
	set_custom_extras = set_custom_extras,
	
	-- Sounds --
	add_full_sounds = add_full_sounds,
	play_full_sounds = play_full_sounds,
	-- Extra --
}