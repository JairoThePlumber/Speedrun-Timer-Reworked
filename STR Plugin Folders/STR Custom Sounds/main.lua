-- name: STR Official Custom Sounds
-- incompatible:
-- description: The Official Speedrun Timer Custom Sounds Plugins

-- Here's are the Api For setting the custom sounds

local function on_sounds_names_load()
	_G.STRApi.set_custom_countdown_name("SM64DS", "Super Mario 64 DS")
	_G.STRApi.set_custom_go_name("SM64DS", "Super Mario 64 DS")
	
	_G.STRApi.set_custom_fanfare_name("SMG", "Super Mario Galaxy 1/2")
	_G.STRApi.set_custom_countdown_name("SMG", "Super Mario Galaxy 1/2")
	_G.STRApi.set_custom_go_name("SMG", "Super Mario Galaxy 1/2")

	_G.STRApi.set_custom_fanfare_name("SMK", "Super Mario Kart")
	_G.STRApi.set_custom_countdown_name("SMK", "Super Mario Kart")
	_G.STRApi.set_custom_go_name("SMK", "Super Mario Kart")
	
	_G.STRApi.set_custom_fanfare_name("MK64", "Mario Kart 64")
	_G.STRApi.set_custom_fanfare_name("MK64TT", "Mario Kart 64 (Time Trials)")
	_G.STRApi.set_custom_countdown_name("MK64", "Mario Kart 64")
	_G.STRApi.set_custom_go_name("MK64", "Mario Kart 64")
	
	_G.STRApi.set_custom_fanfare_name("MKSC", "Mario Kart: Super Circuit")
	_G.STRApi.set_custom_fanfare_name("MKSCTT", "Mario Kart: Super Circuit (Time Trials)")
	_G.STRApi.set_custom_countdown_name("MKSC", "Mario Kart: Super Circuit")
	_G.STRApi.set_custom_go_name("MKSC", "Mario Kart: Super Circuit")
	
	_G.STRApi.set_custom_fanfare_name("MKDD", "Mario Kart: Double Dash!!")
	_G.STRApi.set_custom_fanfare_name("MKDDTT", "Mario Kart: Double Dash!! (Time Trials)")
	_G.STRApi.set_custom_fanfare_name("MKDDB", "Mario Kart: Double Dash!! (Battle)")
	_G.STRApi.set_custom_countdown_name("MKDD", "Mario Kart: Double Dash!!")
	_G.STRApi.set_custom_go_name("MKDD", "Mario Kart: Double Dash!!")
	
	_G.STRApi.set_custom_fanfare_name("MKDS", "Mario Kart DS")
	_G.STRApi.set_custom_fanfare_name("MKDSTT", "Mario Kart DS (Time Trials)")
	_G.STRApi.set_custom_fanfare_name("MKDSB", "Mario Kart DS (Battle)")
	_G.STRApi.set_custom_countdown_name("MKDS", "Mario Kart DS")
	_G.STRApi.set_custom_go_name("MKDS", "Mario Kart DS")
	
	_G.STRApi.set_custom_fanfare_name("MKWIITT", "Mario Kart Wii (Time Trials)")
	_G.STRApi.set_custom_fanfare_name("MKWIIO", "Mario Kart Wii (Online)")
	_G.STRApi.set_custom_countdown_name("MKWIIB", "Mario Kart Wii (Battle)")
	_G.STRApi.set_custom_go_name("MKWIIB", "Mario Kart Wii (Battle)")
	
	_G.STRApi.set_custom_fanfare_name("MK7", "Mario Kart 7")
	_G.STRApi.set_custom_fanfare_name("MK7TT", "Mario Kart 7 (Time Trials)")
	_G.STRApi.set_custom_fanfare_name("MK7B", "Mario Kart 7 (Battle)")
	_G.STRApi.set_custom_fanfare_name("MK7DP", "Mario Kart 7 (Download Play)")
	_G.STRApi.set_custom_fanfare_name("MK7TTDP", "Mario Kart 7 (Time Trials and Download Play)")
	_G.STRApi.set_custom_fanfare_name("MK7BDP", "Mario Kart 7 (Battle and Download Play)")
	
	_G.STRApi.set_custom_fanfare_name("MK8", "Mario Kart 8")
	_G.STRApi.set_custom_fanfare_name("MK8TT", "Mario Kart 8 (Time Trials)")
	_G.STRApi.set_custom_fanfare_name("MK8B", "Mario Kart 8 (Battle)")
	_G.STRApi.set_custom_fanfare_name("MK8F", "Mario Kart 8 (F-Zero)")
	_G.STRApi.set_custom_countdown_name("MK8", "Mario Kart 8")
	_G.STRApi.set_custom_countdown_name("MK8B", "Mario Kart 8 (Battle)")
	_G.STRApi.set_custom_go_name("MK8", "Mario Kart 8")
	_G.STRApi.set_custom_go_name("MK8B", "Mario Kart 8 (Battle)")
	
	_G.STRApi.set_custom_fanfare_name("MK8DX", "Mario Kart 8 Deluxe (Yoshi's Island)")
	
	_G.STRApi.set_custom_fanfare_name("MKT", "Mario Kart Tour")
	_G.STRApi.set_custom_fanfare_name("MKTS", "Mario Kart Tour (Special)")
	_G.STRApi.set_custom_fanfare_name("MKTB", "Mario Kart Tour (Battle)")
	_G.STRApi.set_custom_fanfare_name("MKTO", "Mario Kart Tour (Online)")
	
	_G.STRApi.set_custom_fanfare_name("MKLHC", "Mario Kart Live: Home Circuit")
	_G.STRApi.set_custom_fanfare_name("MKLHCTT", "Mario Kart Live: Home Circuit (Time Trials)")
end
	
hook_event(HOOK_ON_MODS_LOADED, on_sounds_names_load)

local function custom_sounds(m)
if _G.SpeedrunTimerReworked then
_G.STRApi.set_custom_countdown("SM64DS", "Super Mario 64 DS", "SM64DS Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("SM64DS", "Super Mario 64 DS", "SM64DS Go.ogg")

_G.STRApi.set_custom_fanfare("SMG", "Super Mario Galaxy 1/2", "SMG Fanfare.ogg")
_G.STRApi.set_custom_countdown("SMG", "Super Mario Galaxy 1/2", "SMG Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("SMG", "Super Mario Galaxy 1/2", "SMG Go.ogg")

_G.STRApi.set_custom_fanfare("SMK", "Super Mario Kart", "SMK Fanfare.ogg")
_G.STRApi.set_custom_countdown("SMK", "Super Mario Kart", "SMK Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("SMK", "Super Mario Kart", "SMK Go.ogg")

_G.STRApi.set_custom_fanfare("MK64", "Mario Kart 64", "MK64 Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MK64TT", "Mario Kart 64 (Time Trials)", "MK64 Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_countdown("MK64", "Mario Kart 64", "MK64 Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MK64", "Mario Kart 64", "MK64 Go.ogg")

_G.STRApi.set_custom_fanfare("MKSC", "Mario Kart: Super Circuit", "MKSC Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MKSCTT", "Mario Kart: Super Circuit (Time Trials)", "MKSC Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_countdown("MKSC", "Mario Kart: Super Circuit", "MKSC Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MKSC", "Mario Kart: Super Circuit", "MKSC Go.ogg")

_G.STRApi.set_custom_fanfare("MKDD", "Mario Kart: Double Dash!!", "MKDD Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MKDDTT", "Mario Kart: Double Dash!! (Time Trials)", "MKDD Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_fanfare("MKDDB", "Mario Kart: Double Dash!! (Battle)", "MKDD Fanfare (Battle).ogg")
_G.STRApi.set_custom_countdown("MKDD", "Mario Kart: Double Dash!!", "MKDD Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MKDD", "Mario Kart: Double Dash!!", "MKDD Go.ogg")

_G.STRApi.set_custom_fanfare("MKDS", "Mario Kart DS", "MKDS Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MKDSTT", "Mario Kart DS (Time Trials)", "MKDS Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_fanfare("MKDSB", "Mario Kart DS (Battle)", "MKDS Fanfare (Battle).ogg")
_G.STRApi.set_custom_countdown("MKDS", "Mario Kart DS", "MKDS Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MKDS", "Mario Kart DS", "MKDS Go.ogg")

_G.STRApi.set_custom_fanfare("MKWIITT", "Mario Kart Wii (Time Trials)", "MKWii Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_fanfare("MKWIIO", "Mario Kart Wii (Online)", "MKWii Fanfare (Online).ogg")
_G.STRApi.set_custom_countdown("MKWIIB", "Mario Kart Wii (Battle)", "MKWii Countdown (Battle).ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MKWIIB", "Mario Kart Wii (Battle)", "MKWii Go (Battle).ogg")

_G.STRApi.set_custom_fanfare("MK7", "Mario Kart 7", "MK7 Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MK7TT", "Mario Kart 7 (Time Trials)", "MK7 Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_fanfare("MK7B", "Mario Kart 7 (Battle)", "MK7 Fanfare (Battle).ogg")
_G.STRApi.set_custom_fanfare("MK7DP", "Mario Kart 7 (Download Play)", "MK7 Fanfare (Download Play).ogg")
_G.STRApi.set_custom_fanfare("MK7TTDP", "Mario Kart 7 (Time Trials and Download Play)", "MK7 Fanfare (Time Trials and Download Play).ogg")
_G.STRApi.set_custom_fanfare("MK7BDP", "Mario Kart 7 (Battle and Download Play)", "MK7 Fanfare (Battle and Download Play).ogg")

_G.STRApi.set_custom_fanfare("MK8", "Mario Kart 8", "MK8 Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MK8TT", "Mario Kart 8 (Time Trials)", "MK8 Fanfare (Time Trials).ogg")
_G.STRApi.set_custom_fanfare("MK8B", "Mario Kart 8 (Battle)", "MK8 Fanfare (Battle).ogg")
_G.STRApi.set_custom_fanfare("MK8F", "Mario Kart 8 (F-Zero)", "MK8 Fanfare (F-Zero).ogg")
_G.STRApi.set_custom_countdown("MK8", "Mario Kart 8", "MK8 Countdown.ogg", "Only 10", nil)
_G.STRApi.set_custom_countdown("MK8B", "Mario Kart 8 (Battle)", "MK8 Countdown (Battle).ogg", "Only 10", nil)
_G.STRApi.set_custom_go("MK8", "Mario Kart 8", "MK8 Go.ogg")
_G.STRApi.set_custom_go("MK8B", "Mario Kart 8 (Battle)", "MK8 Go (Battle).ogg")

_G.STRApi.set_custom_fanfare("MK8DX", "Mario Kart 8 Deluxe (Yoshi's Island)", "MK8DX Fanfare (Yoshi Island).ogg")

_G.STRApi.set_custom_fanfare("MKT", "Mario Kart Tour", "MKT Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MKTS", "Mario Kart Tour (Special)", "MKT Fanfare (Special).ogg")
_G.STRApi.set_custom_fanfare("MKTB", "Mario Kart Tour (Battle)", "MKT Fanfare (Battle).ogg")
_G.STRApi.set_custom_fanfare("MKTO", "Mario Kart Tour (Online)", "MKT Fanfare (Online).ogg")

_G.STRApi.set_custom_fanfare("MKLHC", "Mario Kart Live: Home Circuit", "MKLHC Fanfare.ogg")
_G.STRApi.set_custom_fanfare("MKLHCTT", "Mario Kart Live: Home Circuit (Time Trials)", "MKLHC Fanfare (Time Trials).ogg")
	end
end

hook_event(HOOK_MARIO_UPDATE, custom_sounds)
