
SM64Rules = true

for romhacks in pairs(gActiveMods) do 
if (gActiveMods[romhacks].incompatible ~= nil and gActiveMods[romhacks].incompatible:find("romhack")) then 
SM64Rules = false
	break
    end
end

function Rules_Display()
	RSize = 100
	RW = 5 * RSize
	RH = 3 * RSize
	RX = (S_Width() - RW) / 2.0
	RY = (S_Height() - RH) / 2.0
	render_rect(RX, RY, RW, RH, 170, 170, 170, 200)
	
	if not OmmEnabled then
	TitleText = "Hello, Welcome to the Speedrun Server!"
	else
	TitleText = "Hello, Welcome to the OMM Rebirth Speedrun Server!"
	end

	TSize = 0.50
    TWidth = Hud_Measure(TitleText) * TSize
    THeight = 32 * TSize

    TX = (S_Width() - TWidth) / 2.0
    TY = (S_Height() - THeight) / 2.0 - 112
	
    shadow_text(TitleText, TX, TY - 0.5, TSize, 1, 1, 255, 255, 255, 255)
	
	RulesText = "Here are the Runs and Rules:"
	
	R_Size = 0.50
	R_Height = 16 * R_Size
	R_W = Hud_Measure(RulesText) * R_Size
	R_X = (S_Width() - R_W) / 2.0 
    R_Y = (S_Height() - R_Height) / 2.0 - 100
	shadow_text(RulesText, R_X, R_Y - 0.5, R_Size, 1, 1, 255, 255, 255, 255)
	
	local Size = 0.75
	local Height = 32 * Size
	local Width = 0 * Size
	local X = (S_Width() - Width) / 2.0
	local Y = (S_Height() - Height) / 2.0
	
	if SM64Rules == true then
	if not OmmEnabled then
	shadow_text("0 Stars", X - 155, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Skip both 8 and 30 Star doors by BLJs", X - 155, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("1 Star", X - 155, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Get one Star in DDD after doing", X - 155, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("16 Stars", X - 155, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Stars and then Beat Bowser", X - 155, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("SBLJs are Banned", X - 155, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 155, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 155, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("BLJs/MIPS Clip are Banned", X - 155, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 155, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 120 Stars", X - 155, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 155, Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("15 Stars", X, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("SBLJ Collect Only One Star in Each Main Level", X, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("LBLJs/SBLJs are Allowed/Required", X, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("31 Stars", X, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("30 Star Door cannot be bypassed", X, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("SBLJ/MIPS Clip are Banned", X, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("45 Stars", X, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect at least 3 Stars in Each Main Level", X, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("SBLJs are Banned", X, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("50 Stars", X, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors Except 70 cannot be Bypassed.", X, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Castle Skips Except BLJs are Banned", X , Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("90 Stars", X, Y + 50, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Only Collect 6 Stars in Each Main Level", X, Y + 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Castle Secret and 100 Coins Stars are Banned", X, Y + 67, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	else
	shadow_text("16 Stars", X - 70, Y - 70, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Collect 16 Stars and then Beat Bowser", X - 70, Y - 60, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("You're only allowed to Switch Movesets in the Upper Floor", X - 70, Y - 53, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("70 Stars", X - 70, Y - 40, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("All Star Doors can't be Skipped", X - 70, Y - 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("MIPS Clip/Switching Moveset are Banned", X - 70, Y - 23, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("90 Stars", X - 70, Y - 10, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Only Collect 6 Stars in Each Main Level", X - 70, Y, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("Any Castle Secret and 100 Coins Stars are Banned", X - 70, Y + 7, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	
	shadow_text("120 Stars", X - 70, Y + 20, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Beat The Game with All 120 Stars", X - 70, Y + 30, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	shadow_text("All Glitches are Allowed", X - 70, Y + 37, Size - 0.50, 0.50, 0.50, 255, 255, 255, 255)
	end
	end
	
	shadow_text("These Rules are Needed to make your Run Vaild.", X - 81, Y + 98, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Not following these Rules will count as Invaild.", X - 80, Y + 108, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
	shadow_text("Make sure you got things ready before Starting.", X - 83, Y + 118, Size - 0.40, 0.95, 0.95, 255, 255, 255, 255)
end