-- name: STR Official Custom Fonts Colored
-- incompatible:
-- description: The Official Speedrun Timer Custom Fonts Plugins

-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\This Plugin needs to have the Speedrun Timer Go Back and Download the Latest Version", 2)
	speedrun_timer_check = true
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

-- Here's are the Api For setting the custom fonts
-- _G.STRApi.custom_font_names(savename, display name) <- This checks the number and the name for the font (make sure no spaces on savename)
-- _G.STRApi.set_custom_color_on_fonts(true/false) <- this checks if you want to have colors on the font

-- Now I won't show all the font functions but you can use this for a example
-- You can check the api functions to check of what to do

-- You need this to avoid the numbers from going up, since idk how to make it stop without hook event
text_display = false

function custom_timer_render()
	if _G.SpeedrunTimerReworked then
	djui_hud_set_font(FONT_HUD)
    djui_hud_set_resolution(RESOLUTION_N64)

	local screenWidth = djui_hud_get_screen_width()
	local screenHeight = djui_hud_get_screen_height()
	local width = 1 * 1
	local height = 16 * 2

	local x = (screenWidth - width) / 2.0
	local y = screenHeight - 16
	
	-- This is Optional, but if you using the fonts from here than leave it
	local z = 225
	
	if text_display == false then
	_G.STRApi.add_font("SM64C_Color", "Super Mario 64 Custom (Color)")
	_G.STRApi.add_font("MLBIS_Color", "Mario & Luigi: Bowser's inside Story (Color)")
	_G.STRApi.add_font("MP64_Color", "Mario Party 1/2/3 (Color)")
	_G.STRApi.add_font("MK64_Color", "Mario Kart 64 (Color)")
	_G.STRApi.add_font("SM64DS_Color", "Super Mario 64 DS (Color)")
	_G.STRApi.add_font("SMB1_Color", "Super Mario Bros. (Color)")
	_G.STRApi.add_font("MPDS_Color", "Mario Party DS (Color)")
	_G.STRApi.add_font("PM64_Color", "Paper Mario 64 (Color)")
	_G.STRApi.add_font("MLSS_Color", "Mario & Luigi: Superstar Saga (Color)")
	_G.STRApi.add_font("MKDS_Color", "Mario Kart DS (Color)")
	_G.STRApi.add_font("MT64_Color", "Mario Tennis 64 (Color)")
	_G.STRApi.add_font("MPL_Color", "Mario Pinball Land (Color)")
	_G.STRApi.add_font("MLPIT_Color", "Mario & Luigi: Partners in Time (Color)")
	_G.STRApi.add_font("SuperMario_Color", "Modern Super Mario (Color)")
	text_display = true
end
	
	-- SM64 Custom Fonts
	_G.STRApi.set_custom_color_on_fonts(true)
	_G.STRApi.set_countdown_custom("SM64C_Color", "sm64_fonts", x - 14, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("SM64C_Color", "sm64_fonts", x - 28, y - 120, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("SM64C_Color", "sm64_fonts", x - 4, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("SM64C_Color", "sm64_fonts", x - 28, y - 120, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_extras_custom("SM64C_Color", "sm64_fonts", x + 21, y - 5, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("SM64C_Color", "sm64_fonts", x - 13, y - 5, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("SM64C_Color", "sm64_fonts", x - 48, y - 5, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_time_custom("SM64C_Color", "sm64_fonts", x - 115, y - 2, 0.25, 1, 192, 0, 64, 16, 0, 0, "None", "Static", x - 125, y - 2)
	_G.STRApi.set_hours_custom("SM64C_Color", "sm64_fonts", x - 70, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_hours_custom("SM64C_Color", "sm64_fonts", x - 58, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("SM64C_Color", "sm64_fonts", x - 38, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("SM64C_Color", "sm64_fonts", x - 26, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("SM64C_Color", "sm64_fonts", x - 4, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_seconds_custom("SM64C_Color", "sm64_fonts", x + 8, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_milliseconds_custom("SM64C_Color", "sm64_fonts", x + 30, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Multiplying", "Hundreds")
	_G.STRApi.set_milliseconds_custom("SM64C_Color", "sm64_fonts", x + 42, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("SM64C_Color", "sm64_fonts", x + 54, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying", "Ones")
	
	-- Mario & Luigi: Bowser's Inside Story Fonts
	_G.STRApi.set_countdown_custom("MLBIS_Color", "mlbis_fonts", x + 210 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MLBIS_Color", "mlbis_fonts", x + 198 - z, y - 120, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MLBIS_Color", "mlbis_fonts", x + 220 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MLBIS_Color", "mlbis_fonts", x + 165 - z, y - 140, 1, 2, 176, 0, 64, 32)
	_G.STRApi.set_milliseconds_custom("MLBIS_Color", "mlbis_fonts", x + 277 - z, y, 1, 1, 10, 16, 10, 17, 16, 16, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("MLBIS_Color", "mlbis_fonts", x + 267 - z, y, 1, 1, 10, 16, 100, 17, 16, 16, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MLBIS_Color", "mlbis_fonts", x + 257 - z, y, 1, 1, 10, 16, 1000, 17, 16, 16, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("MLBIS_Color", "mlbis_fonts", x + 233 - z, y, 1, 1, 10, 16, 10, 17, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MLBIS_Color", "mlbis_fonts", x + 223 - z, y, 1, 1, 10, 16, 100, 17, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MLBIS_Color", "mlbis_fonts", x + 199 - z, y, 1, 1, 10, 16, 10, 17, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MLBIS_Color", "mlbis_fonts", x + 189 - z, y, 1, 1, 10, 16, 100, 17, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MLBIS_Color", "mlbis_fonts", x + 165 - z, y, 1, 1, 10, 16, 10, 17, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MLBIS_Color", "mlbis_fonts", x + 155 - z, y, 1, 1, 10, 16, 100, 17, 16, 16, "Adding (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MLBIS_Color", "mlbis_fonts", x + 245 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MLBIS_Color", "mlbis_fonts", x + 211 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MLBIS_Color", "mlbis_fonts", x + 177 - z, y - 2, 1, 1, 160, 0, 16, 16)
	
	-- Mario Party 1/2/3 Fonts
	_G.STRApi.set_countdown_custom("MP64_Color", "mp_fonts", x + 209 - z, y - 120, 1.5, 1.5, 10, 24, 10, 24, 24, 24, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MP64_Color", "mp_fonts", x + 193 - z, y - 120, 1.5, 1.5, 10, 24, 100, 24, 24, 24, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MP64_Color", "mp_fonts", x + 225 - z, y - 120, 1.5, 1.5, 10, 24, 10, 24, 24, 24, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MP64_Color", "mp_fonts", x + 175 - z, y - 126, 0.75, 1.50, 176, 24, 64, 32)
	_G.STRApi.set_milliseconds_custom("MP64_Color", "mp_fonts", x + 291 - z, y - 1, 1, 1, 10, 16, 10, 24, 16, 16, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("MP64_Color", "mp_fonts", x + 276 - z, y - 1, 1, 1, 10, 16, 100, 24, 16, 16, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MP64_Color", "mp_fonts", x + 261 - z, y - 1, 1, 1, 10, 16, 1000, 24, 16, 16, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("MP64_Color", "mp_fonts", x + 232 - z, y - 1, 1, 1, 10, 16, 10, 24, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MP64_Color", "mp_fonts", x + 217 - z, y - 1, 1, 1, 10, 16, 100, 24, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MP64_Color", "mp_fonts", x + 188 - z, y - 1, 1, 1, 10, 16, 10, 24, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MP64_Color", "mp_fonts", x + 173 - z, y - 1, 1, 1, 10, 16, 100, 24, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MP64_Color", "mp_fonts", x + 151 - z, y - 1, 1, 1, 10, 16, 10, 24, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MP64_Color", "mp_fonts", x + 136 - z, y - 1, 1, 1, 10, 16, 100, 24, 16, 16, "Adding (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MP64_Color", "mp_fonts", x + 246 - z, y - 1, 1, 1, 160, 24, 16, 16)
	_G.STRApi.set_extras_custom("MP64_Color", "mp_fonts", x + 253 - z, y - 1, 1, 1, 160, 24, 16, 16)
	_G.STRApi.set_extras_custom("MP64_Color", "mp_fonts", x + 209 - z, y - 1, 1, 1, 160, 24, 16, 16)
	_G.STRApi.set_extras_custom("MP64_Color", "mp_fonts", x + 202 - z, y - 1, 1, 1, 160, 24, 16, 16)
	_G.STRApi.set_extras_custom("MP64_Color", "mp_fonts", x + 165 - z, y - 1, 1, 1, 160, 24, 16, 16)
	
	-- Mario Kart 64 Fonts
	_G.STRApi.set_countdown_custom("MK64_Color", "mk64_fonts", x + 210 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MK64_Color", "mk64_fonts", x + 203 - z, y - 120, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MK64_Color", "mk64_fonts", x + 219 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MK64_Color", "mk64_fonts", x + 199 - z, y - 120, 1, 2, 0, 16, 32, 16)
	_G.STRApi.set_milliseconds_custom("MK64_Color", "mk64_fonts", x + 269 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("MK64_Color", "mk64_fonts", x + 261 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("MK64_Color", "mk64_fonts", x + 253 - z, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("MK64_Color", "mk64_fonts", x + 237 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MK64_Color", "mk64_fonts", x + 229 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MK64_Color", "mk64_fonts", x + 213 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MK64_Color", "mk64_fonts", x + 205 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MK64_Color", "mk64_fonts", x + 189 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MK64_Color", "mk64_fonts", x + 181 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MK64_Color", "mk64_fonts", x + 245 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("MK64_Color", "mk64_fonts", x + 221 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("MK64_Color", "mk64_fonts", x + 197 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_time_custom("MK64_Color", "mk64_fonts", x + 158 - z, y - 2, 0.5, 1, 192, 0, 32, 16, 0, 0, "None", "Static", x + 150 - z, y - 2)
	
	-- Super Mario 64 DS Fonts
	_G.STRApi.set_countdown_custom("SM64DS_Color", "sm64ds_fonts", x + 210 - z, y - 119, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("SM64DS_Color", "sm64ds_fonts", x + 195 - z, y - 119, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("SM64DS_Color", "sm64ds_fonts", x + 225 - z, y - 119, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("SM64DS_Color", "sm64ds_fonts", x + 156 - z, y - 140, 0.75, 1.50, 160, 17, 96, 48)
	_G.STRApi.set_milliseconds_custom("SM64DS_Color", "sm64ds_fonts", x + 270 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("SM64DS_Color", "sm64ds_fonts", x + 261 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("SM64DS_Color", "sm64ds_fonts", x + 252 - z, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("SM64DS_Color", "sm64ds_fonts", x + 235.9 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("SM64DS_Color", "sm64ds_fonts", x + 227.9 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("SM64DS_Color", "sm64ds_fonts", x + 212 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("SM64DS_Color", "sm64ds_fonts", x + 204 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("SM64DS_Color", "sm64ds_fonts", x + 189 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("SM64DS_Color", "sm64ds_fonts", x + 181 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Adding (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("SM64DS_Color", "sm64ds_fonts", x + 245 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("SM64DS_Color", "sm64ds_fonts", x + 221 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_extras_custom("SM64DS_Color", "sm64ds_fonts", x + 197 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_time_custom("SM64DS_Color", "sm64ds_fonts", x + 158 - z, y - 2, 0.5, 1, 192, 0, 32, 16, 0, 0, "None", "Static", x + 149 - z, y - 2)
	
	-- Super Mario Bros. Fonts
	_G.STRApi.set_countdown_custom("SMB1_Color", "smb_fonts", x + 215 - z, y - 116, 3, 3, 10, 8, 10, 8, 8, 8, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("SMB1_Color", "smb_fonts", x + 205 - z, y - 116, 3, 3, 10, 8, 100, 8, 8, 8, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("SMB1_Color", "smb_fonts", x + 229 - z, y - 116, 3, 3, 10, 8, 10, 8, 8, 8, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("SMB1_Color", "smb_fonts", x + 195 - z, y - 116, 0.75, 3, 0, 8, 32, 8)
	_G.STRApi.set_milliseconds_custom("SMB1_Color", "smb_fonts", x + 292 - z, y, 2, 2, 10, 8, 10, 8, 8, 8, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("SMB1_Color", "smb_fonts", x + 275 - z, y, 2, 2, 10, 8, 100, 8, 8, 8, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("SMB1_Color", "smb_fonts", x + 258 - z, y, 2, 2, 10, 8, 1000, 8, 8, 8, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("SMB1_Color", "smb_fonts", x + 232 - z, y, 2, 2, 10, 8, 10, 8, 8, 8, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("SMB1_Color", "smb_fonts", x + 215 - z, y, 2, 2, 10, 8, 100, 8, 8, 8, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("SMB1_Color", "smb_fonts", x + 189 - z, y, 2, 2, 10, 8, 10, 8, 8, 8, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("SMB1_Color", "smb_fonts", x + 172 - z, y, 2, 2, 10, 8, 100, 8, 8, 8, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("SMB1_Color", "smb_fonts", x + 144 - z, y, 2, 2, 10, 8, 10, 8, 8, 8, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("SMB1_Color", "smb_fonts", x + 127 - z, y, 2, 2, 10, 8, 100, 8, 8, 8, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("SMB1_Color", "smb_fonts", x + 157 - z, y, 2, 2, 80, 0, 8, 8)
	_G.STRApi.set_extras_custom("SMB1_Color", "smb_fonts", x + 201 - z, y, 2, 2, 80, 0, 8, 8)
	_G.STRApi.set_extras_custom("SMB1_Color", "smb_fonts", x + 244 - z, y, 2, 2, 88, 0, 8, 8)
	_G.STRApi.set_time_custom("SMB1_Color", "smb_fonts", x + 143 - z, y - 8, 0.25, 1, 97, 0, 32, 8, 0, 0, "None", "Static", x + 126 - z, y - 8)
	
	-- Mario Party DS Fonts
	_G.STRApi.set_countdown_custom("MPDS_Color", "mpds_fonts", x + 211 - z, y - 135, 4, 2, 10, 16, 10, 32, 16, 32, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MPDS_Color", "mpds_fonts", x + 197 - z, y - 135, 4, 2, 10, 16, 100, 32, 16, 32, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MPDS_Color", "mpds_fonts", x + 227 - z, y - 135, 4, 2, 10, 16, 10, 32, 16, 32, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MPDS_Color", "mpds_fonts", x + 150 - z, y - 119, 0.30, 1.20, 0, 49, 128, 32)
	_G.STRApi.set_milliseconds_custom("MPDS_Color", "mpds_fonts", x + 268 - z, y - 2, 1, 1, 10, 16, 10, 32, 16, 16, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("MPDS_Color", "mpds_fonts", x + 257 - z, y - 2, 1, 1, 10, 16, 100, 32, 16, 16, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MPDS_Color", "mpds_fonts", x + 246 - z, y - 2, 1, 1, 10, 16, 1000, 32, 16, 16, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("MPDS_Color", "mpds_fonts", x + 228 - z, y - 2, 1, 1, 10, 16, 10, 32, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MPDS_Color", "mpds_fonts", x + 217 - z, y - 2, 1, 1, 10, 16, 100, 32, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MPDS_Color", "mpds_fonts", x + 199 - z, y - 2, 1, 1, 10, 16, 10, 32, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MPDS_Color", "mpds_fonts", x + 188 - z, y - 2, 1, 1, 10, 16, 100, 32, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MPDS_Color", "mpds_fonts", x + 170 - z, y - 2, 1, 1, 10, 16, 10, 32, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MPDS_Color", "mpds_fonts", x + 159 - z, y - 2, 1, 1, 10, 16, 100, 32, 16, 16, "Adding (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MPDS_Color", "mpds_fonts", x + 179 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MPDS_Color", "mpds_fonts", x + 208 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MPDS_Color", "mpds_fonts", x + 237 - z, y - 2, 1, 1, 176, 0, 16, 16)

	-- Paper Mario 64 Fonts
	_G.STRApi.set_countdown_custom("PM64_Color", "pm_fonts", x + 211 - z, y - 122, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("PM64_Color", "pm_fonts", x + 199.5 - z, y - 122, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("PM64_Color", "pm_fonts", x + 220 - z, y - 122, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("PM64_Color", "pm_fonts", x + 195 - z, y - 120, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_milliseconds_custom("PM64_Color", "pm_fonts", x + 268 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("PM64_Color", "pm_fonts", x + 257 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("PM64_Color", "pm_fonts", x + 246 - z, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("PM64_Color", "pm_fonts", x + 228 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("PM64_Color", "pm_fonts", x + 217 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("PM64_Color", "pm_fonts", x + 199 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("PM64_Color", "pm_fonts", x + 188 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("PM64_Color", "pm_fonts", x + 170 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("PM64_Color", "pm_fonts", x + 159 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("PM64_Color", "pm_fonts", x + 179 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("PM64_Color", "pm_fonts", x + 208 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("PM64_Color", "pm_fonts", x + 237 - z, y - 2, 1, 1, 176, 0, 16, 16)
	
	-- Mario & Luigi: Superstar Saga Fonts
	_G.STRApi.set_countdown_custom("MLSS_Color", "mlss_fonts", x + 209 - z, y - 125, 2.50, 1.75, 10, 18, 10, 26, 18, 26, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MLSS_Color", "mlss_fonts", x + 197 - z, y - 125, 2.50, 1.75, 10, 18, 100, 26, 18, 26, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MLSS_Color", "mlss_fonts", x + 225 - z, y - 125, 2.50, 1.75, 10, 18, 10, 26, 18, 26, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MLSS_Color", "mlss_fonts", x + 160 - z, y - 137, 1, 2, 180, 0, 64, 32)
	_G.STRApi.set_milliseconds_custom("MLSS_Color", "mlss_fonts", x + 271.0 - z, y, 1.50, 1.10, 10, 10, 10, 27, 10, 13, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("MLSS_Color", "mlss_fonts", x + 261.8 - z, y, 1.50, 1.10, 10, 10, 100, 27, 10, 13, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MLSS_Color", "mlss_fonts", x + 252.6 - z, y, 1.50, 1.10, 10, 10, 1000, 27, 10, 13, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("MLSS_Color", "mlss_fonts", x + 234 - z, y, 1.50, 1.10, 10, 10, 10, 27, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MLSS_Color", "mlss_fonts", x + 224.6 - z, y, 1.50, 1.10, 10, 10, 100, 27, 10, 13, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MLSS_Color", "mlss_fonts", x + 206 - z, y, 1.50, 1.10, 10, 10, 10, 27, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MLSS_Color", "mlss_fonts", x + 196.7 - z, y, 1.50, 1.10, 10, 10, 100, 27, 10, 13, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MLSS_Color", "mlss_fonts", x + 178 - z, y, 1.50, 1.10, 10, 10, 10, 27, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MLSS_Color", "mlss_fonts", x + 168.7 - z, y, 1.50, 1.10, 10, 10, 100, 27, 10, 13, "Adding (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MLSS_Color", "mlss_fonts", x + 187.2 - z, y, 1.50, 1.10, 100, 27, 10, 13)
	_G.STRApi.set_extras_custom("MLSS_Color", "mlss_fonts", x + 215.2 - z, y, 1.50, 1.10, 100, 27, 10, 13)
	_G.STRApi.set_extras_custom("MLSS_Color", "mlss_fonts", x + 243.2 - z, y, 1.50, 1.10, 110, 27, 10, 13)
	_G.STRApi.set_time_custom("MLSS_Color", "mlss_fonts", x + 161.1 - z, y - 17, 0.60, 1.10, 121, 27, 28, 14, 0, 0, "None", "Static", x + 151.9 - z, y - 17)
	
	-- Mario Kart DS Fonts
	_G.STRApi.set_countdown_custom("MKDS_Color", "mkds_fonts", x + 203 - z, y - 125, 1.50, 1.50, 10, 29, 10, 0, 29, 29, "Adding", "Middle Number")
	_G.STRApi.set_countdown_custom("MKDS_Color", "mkds_fonts", x + 217 - z, y - 125, 1.50, 1.50, 10, 29, 10, 0, 29, 29, "Adding", "Right Number")
	_G.STRApi.set_countdown_custom("MKDS_Color", "mkds_fonts", x + 190 - z, y - 125, 1.50, 1.50, 10, 29, 100, 0, 29, 29, "Adding", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MKDS_Color", "mkds_fonts", x + 137 - z, y - 128, 0.36, 1.50, 290, 0, 128, 32)
	_G.STRApi.set_milliseconds_custom("MKDS_Color", "mkds_fonts", x + 271 - z, y - 2, 1.50, 1.25, 10, 10, 10, 31, 10, 13, "Adding", "Ones")
	_G.STRApi.set_milliseconds_custom("MKDS_Color", "mkds_fonts", x + 260 - z, y - 2, 1.50, 1.25, 10, 10, 100, 31, 10, 13, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MKDS_Color", "mkds_fonts", x + 249 - z, y - 2, 1.50, 1.25, 10, 10, 1000, 31, 10, 13, "Adding", "Hundreds")
	_G.STRApi.set_seconds_custom("MKDS_Color", "mkds_fonts", x + 231 - z, y - 2, 1.50, 1.25, 10, 10, 10, 31, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MKDS_Color", "mkds_fonts", x + 220 - z, y - 2, 1.50, 1.25, 10, 10, 100, 31, 10, 13, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MKDS_Color", "mkds_fonts", x + 202 - z, y - 2, 1.50, 1.25, 10, 10, 10, 31, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MKDS_Color", "mkds_fonts", x + 191 - z, y - 2, 1.50, 1.25, 10, 10, 100, 31, 10, 13, "Adding (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MKDS_Color", "mkds_fonts", x + 173 - z, y - 2, 1.50, 1.25, 10, 10, 10, 31, 10, 13, "Adding (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MKDS_Color", "mkds_fonts", x + 162 - z, y - 2, 1.50, 1.25, 10, 10, 100, 31, 10, 13, "Adding (Hidden)", "Tens")
	_G.STRApi.set_time_custom("MKDS_Color", "mkds_fonts", x + 109 - z, y - 2, 0.50, 1.25, 121, 31, 36, 13, 0, 0, "None", "Static", x + 99 - z, y - 2)
	_G.STRApi.set_extras_custom("MKDS_Color", "mkds_fonts", x + 182 - z, y - 2, 1.50, 1.25, 100, 31, 10, 13)
	_G.STRApi.set_extras_custom("MKDS_Color", "mkds_fonts", x + 211 - z, y - 2, 1.50, 1.25, 100, 31, 10, 13)
	_G.STRApi.set_extras_custom("MKDS_Color", "mkds_fonts", x + 240 - z, y - 2, 1.50, 1.25, 110, 31, 10, 13)

	
	-- Mario Tennis 64 Fonts
	_G.STRApi.set_countdown_custom("MT64_Color", "mt64_fonts", x + 209 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MT64_Color", "mt64_fonts", x + 195.9 - z, y - 120, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MT64_Color", "mt64_fonts", x + 224 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MT64_Color", "mt64_fonts", x + 137 - z, y - 132, 0.50, 1.35, 0, 17, 128, 48)
	_G.STRApi.set_extras_custom("MT64_Color", "mt64_fonts", x + 169 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MT64_Color", "mt64_fonts", x + 204 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MT64_Color", "mt64_fonts", x + 239 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_milliseconds_custom("MT64_Color", "mt64_fonts", x + 278 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("MT64_Color", "mt64_fonts", x + 264 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("MT64_Color", "mt64_fonts", x + 250 - z, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("MT64_Color", "mt64_fonts", x + 229 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MT64_Color", "mt64_fonts", x + 215 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MT64_Color", "mt64_fonts", x + 194 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MT64_Color", "mt64_fonts", x + 180 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MT64_Color", "mt64_fonts", x + 159 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MT64_Color", "mt64_fonts", x + 145 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Hidden)", "Tens")
	
	-- Mario Pinball Land Fonts
	_G.STRApi.set_countdown_custom("MPL_Color", "mpl_fonts", x + 209 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MPL_Color", "mpl_fonts", x + 222 - z, y - 120, 2, 2, 10, 16, 10, 16, 16, 16, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MPL_Color", "mpl_fonts", x + 198 - z, y - 120, 2, 2, 10, 16, 100, 16, 16, 16, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MPL_Color", "mpl_fonts", x + 197 - z, y - 120, 1, 2, 192, 0, 32, 16)
	_G.STRApi.set_milliseconds_custom("MPL_Color", "mpl_fonts", x + 274 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("MPL_Color", "mpl_fonts", x + 262 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("MPL_Color", "mpl_fonts", x + 250 - z, y - 2, 1, 1, 10, 16, 1000, 16, 16, 16, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("MPL_Color", "mpl_fonts", x + 233 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MPL_Color", "mpl_fonts", x + 221 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MPL_Color", "mpl_fonts", x + 202 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MPL_Color", "mpl_fonts", x + 190 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("MPL_Color", "mpl_fonts", x + 171 - z, y - 2, 1, 1, 10, 16, 10, 16, 16, 16, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("MPL_Color", "mpl_fonts", x + 159 - z, y - 2, 1, 1, 10, 16, 100, 16, 16, 16, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("MPL_Color", "mpl_fonts", x + 183 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MPL_Color", "mpl_fonts", x + 214 - z, y - 2, 1, 1, 160, 0, 16, 16)
	_G.STRApi.set_extras_custom("MPL_Color", "mpl_fonts", x + 242.9 - z, y - 2, 1, 1, 176, 0, 16, 16)
	_G.STRApi.set_time_custom("MPL_Color", "mpl_fonts", x + 157 - z, y - 2, 1, 1, 225, 0, 16, 16, 0, 0, "None", "Static", x + 145 - z, y - 2)
	
	-- Mario & Luigi: Partners in Time Fonts
	_G.STRApi.set_countdown_custom("MLPIT_Color", "mlpit_fonts", x + 210 - z, y - 120, 2.50, 2, 10, 16, 10, 20, 16, 20, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("MLPIT_Color", "mlpit_fonts", x + 225 - z, y - 120, 2.50, 2, 10, 16, 10, 20, 16, 20, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("MLPIT_Color", "mlpit_fonts", x + 197 - z, y - 120, 2.50, 2, 10, 16, 100, 20, 16, 20, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("MLPIT_Color", "mlpit_fonts", x + 195 - z, y - 135, 2, 2, 194, 0, 32, 32)
	_G.STRApi.set_hours_custom("MLPIT_Color", "mlpit_fonts", x + 168 - z, y - 2, 1, 1, 10, 16, 100, 23, 16, 16, "Adding (Hidden)", "Tens")
	_G.STRApi.set_hours_custom("MLPIT_Color", "mlpit_fonts", x + 176 - z, y - 2, 1, 1, 10, 16, 10, 23, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("MLPIT_Color", "mlpit_fonts", x + 194 - z, y - 2, 1, 1, 10, 16, 100, 23, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("MLPIT_Color", "mlpit_fonts", x + 202 - z, y - 2, 1, 1, 10, 16, 10, 23, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("MLPIT_Color", "mlpit_fonts", x + 220 - z, y - 2, 1, 1, 10, 16, 100, 23, 16, 16, "Adding (Normal)", "Tens")
	_G.STRApi.set_seconds_custom("MLPIT_Color", "mlpit_fonts", x + 228 - z, y - 2, 1, 1, 10, 16, 10, 23, 16, 16, "Adding (Normal)", "Ones")
	_G.STRApi.set_milliseconds_custom("MLPIT_Color", "mlpit_fonts", x + 246 - z, y - 2, 1, 1, 10, 16, 1000, 23, 16, 16, "Adding", "Hundreds")
	_G.STRApi.set_milliseconds_custom("MLPIT_Color", "mlpit_fonts", x + 254 - z, y - 2, 1, 1, 10, 16, 100, 23, 16, 16, "Adding", "Tens")
	_G.STRApi.set_milliseconds_custom("MLPIT_Color", "mlpit_fonts", x + 262 - z, y - 2, 1, 1, 10, 16, 10, 23, 16, 16, "Adding", "Ones")
	_G.STRApi.set_extras_custom("MLPIT_Color", "mlpit_fonts", x + 185 - z, y - 2, 1, 1, 160, 23, 16, 16)
	_G.STRApi.set_extras_custom("MLPIT_Color", "mlpit_fonts", x + 211 - z, y - 2, 1, 1, 160, 23, 16, 16)
	_G.STRApi.set_extras_custom("MLPIT_Color", "mlpit_fonts", x + 236 - z, y - 2, 1, 1, 176, 23, 16, 16)
	
	-- Modern Super Mario Fonts
	_G.STRApi.set_countdown_custom("SuperMario_Color", "modern_fonts", x + 194 - z, y - 149, 2, 2, 8, 32, 8, 32, 32, 32, "Multiplying", "Middle Number")
	_G.STRApi.set_countdown_custom("SuperMario_Color", "modern_fonts", x + 208 - z, y - 149, 2, 2, 8, 32, 8, 32, 32, 32, "Multiplying", "Right Number")
	_G.STRApi.set_countdown_custom("SuperMario_Color", "modern_fonts", x + 178 - z, y - 149, 2, 2, 8, 32, 80, 32, 32, 32, "Multiplying", "Left Number (Tens)")
	_G.STRApi.set_go_custom("SuperMario_Color", "modern_fonts", x + 165 - z, y - 140, 1, 2, 96, 32, 64, 32)
	_G.STRApi.set_milliseconds_custom("SuperMario_Color", "modern_fonts", x + 275 - z, y - 17, 1, 1, 8, 32, 8, 32, 32, 32, "Multiplying", "Ones")
	_G.STRApi.set_milliseconds_custom("SuperMario_Color", "modern_fonts", x + 260 - z, y - 17, 1, 1, 8, 32, 80, 32, 32, 32, "Multiplying", "Tens")
	_G.STRApi.set_milliseconds_custom("SuperMario_Color", "modern_fonts", x + 245 - z, y - 17, 1, 1, 8, 32, 800, 32, 32, 32, "Multiplying", "Hundreds")
	_G.STRApi.set_seconds_custom("SuperMario_Color", "modern_fonts", x + 222 - z, y - 17, 1, 1, 8, 32, 8, 32, 32, 32, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_seconds_custom("SuperMario_Color", "modern_fonts", x + 207 - z, y - 17, 1, 1, 8, 32, 80, 32, 32, 32, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_minutes_custom("SuperMario_Color", "modern_fonts", x + 184 - z, y - 17, 1, 1, 8, 32, 8, 32, 32, 32, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_minutes_custom("SuperMario_Color", "modern_fonts", x + 169 - z, y - 17, 1, 1, 8, 32, 80, 32, 32, 32, "Multiplying (Normal)", "Tens")
	_G.STRApi.set_hours_custom("SuperMario_Color", "modern_fonts", x + 146 - z, y - 17, 1, 1, 8, 32, 8, 32, 32, 32, "Multiplying (Normal)", "Ones")
	_G.STRApi.set_hours_custom("SuperMario_Color", "modern_fonts", x + 131 - z, y - 17, 1, 1, 8, 32, 80, 32, 32, 32, "Multiplying (Hidden)", "Tens")
	_G.STRApi.set_extras_custom("SuperMario_Color", "modern_fonts", x + 157 - z, y - 12, 1, 1, 64, 32, 32, 32)
	_G.STRApi.set_extras_custom("SuperMario_Color", "modern_fonts", x + 195 - z, y - 12, 1, 1, 64, 32, 32, 32)
	_G.STRApi.set_extras_custom("SuperMario_Color", "modern_fonts", x + 234 - z, y - 12, 1, 1, 160, 32, 32, 32)
	end
end

hook_event(HOOK_ON_HUD_RENDER_BEHIND, custom_timer_render)

