-- name: STR Official Custom Sounds
-- incompatible:
-- description: The Official Speedrun Timer Custom Sounds Plugins

-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

-- Super Mario Series
_G.STRApi.add_full_sounds("SM64DS", "Super Mario 64 DS", nil, "SM64DS Countdown.ogg", "SM64DS Go.ogg")
_G.STRApi.add_full_sounds("SMG", "Super Mario Galaxy 1/2", "SMG Fanfare.ogg", "SMG Countdown.ogg", "SMG Go.ogg")

-- Mario Kart Series
_G.STRApi.add_full_sounds("SMK", "Super Mario Kart", "SMK Fanfare.ogg", "SMK Countdown.ogg", "SMK Go.ogg")
_G.STRApi.add_full_sounds("MK64", "Mario Kart 64", "MK64 Fanfare.ogg", "MK64 Countdown.ogg", "MK64 Go.ogg")
_G.STRApi.add_full_sounds("MK64TT", "Mario Kart 64 (Time Trials)", "MK64 Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MKSC", "Mario Kart: Super Circuit", "MKSC Fanfare.ogg", "MKSC Countdown.ogg", "MKSC Go.ogg")
_G.STRApi.add_full_sounds("MKSCTT", "Mario Kart: Super Circuit (Time Trials)", "MKSC Fanfare (Time Trials).ogg")

_G.STRApi.add_full_sounds("MKDD", "Mario Kart: Double Dash!!", "MKDD Fanfare.ogg", "MKDD Countdown.ogg", "MKDD Go.ogg")
_G.STRApi.add_full_sounds("MKDDTT", "Mario Kart: Double Dash!! (Time Trials)", "MKDD Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MKDDB", "Mario Kart: Double Dash!! (Battle)", "MKDD Fanfare (Battle).ogg")

_G.STRApi.add_full_sounds("MKDS", "Mario Kart DS", "MKDS Fanfare.ogg", "MKDS Countdown.ogg", "MKDS Go.ogg")
_G.STRApi.add_full_sounds("MKDSTT", "Mario Kart DS (Time Trials)", "MKDS Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MKDSB", "Mario Kart DS (Battle)", "MKDS Fanfare (Battle).ogg")

_G.STRApi.add_full_sounds("MKWIITT", "Mario Kart Wii (Time Trials)", "MKWii Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MKWIIO", "Mario Kart Wii (Online)", "MKWii Fanfare (Online).ogg")
_G.STRApi.add_full_sounds("MKWIIB", "Mario Kart Wii (Battle)", nil, "MKWii Countdown (Battle).ogg", "MKWii Go (Battle).ogg")

_G.STRApi.add_full_sounds("MK7", "Mario Kart 7", "MK7 Fanfare.ogg")
_G.STRApi.add_full_sounds("MK7TT", "Mario Kart 7 (Time Trials)", "MK7 Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MK7B", "Mario Kart 7 (Battle)", "MK7 Fanfare (Battle).ogg")
_G.STRApi.add_full_sounds("MK7DP", "Mario Kart 7 (Download Play)", "MK7 Fanfare (Download Play).ogg")
_G.STRApi.add_full_sounds("MK7TTDP", "Mario Kart 7 (Time Trials Download Play)", "MK7 Fanfare (Time Trials Download Play).ogg")
_G.STRApi.add_full_sounds("MK7BDP", "Mario Kart 7 (Battle Download Play)", "MK7 Fanfare (Battle Download Play).ogg")

_G.STRApi.add_full_sounds("MK8", "Mario Kart 8", "MK8 Fanfare.ogg", "MK8 Countdown.ogg", "MK8 Go.ogg")
_G.STRApi.add_full_sounds("MK8TT", "Mario Kart 8 (Time Trials)", "MK8 Fanfare (Time Trials).ogg")
_G.STRApi.add_full_sounds("MK8B", "Mario Kart 8 (Battle)", "MK8 Fanfare (Battle).ogg", "MK8 Countdown (Battle).ogg", "MK8 Go (Battle).ogg")
_G.STRApi.add_full_sounds("MK8F", "Mario Kart 8 (F-Zero)", "MK8 Fanfare (F-Zero).ogg")

_G.STRApi.add_full_sounds("MK8DX", "Mario Kart 8 Deluxe (Yoshi's Island)", "MK8DX Fanfare (Yoshi Island).ogg")

_G.STRApi.add_full_sounds("MKT", "Mario Kart Tour", "MKT Fanfare.ogg")
_G.STRApi.add_full_sounds("MKTS", "Mario Kart Tour (Special)", "MKT Fanfare (Special).ogg")
_G.STRApi.add_full_sounds("MKTB", "Mario Kart Tour (Battle)", "MKT Fanfare (Battle).ogg")
_G.STRApi.add_full_sounds("MKTO", "Mario Kart Tour (Online)", "MKT Fanfare (Online).ogg")

_G.STRApi.add_full_sounds("MKLHC", "Mario Kart Live: Home Circuit", "MKLHC Fanfare.ogg")
_G.STRApi.add_full_sounds("MKLHCTT", "Mario Kart Live: Home Circuit (Time Trials)", "MKLHC Fanfare (Time Trials).ogg")

hook_event(HOOK_UPDATE, function () _G.STRApi.play_full_sounds() end) -- This is needed for the sounds to play
