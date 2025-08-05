-- name: Super Mario 64 Runs (New)

if Romhack_Is_Enabled then return end

-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

-- These are the Custom Runs but this is Optional tho, but it's you're choice
-- These are examples, you can change them whatever you like

-- Here's are the Api For Making Run Commands (Optional)
-- This will check if you're making a run command
if not OmmEnabled then
_G.STRApi.add_run_slot(nil, 1, "0 Stars")
_G.STRApi.add_run_slot(nil, 2, "1 Star")
_G.STRApi.add_run_slot(nil, 3, "15 Stars")
_G.STRApi.add_run_slot(nil, 4, "16 Stars")
_G.STRApi.add_run_slot(nil, 5, "31 Stars")
_G.STRApi.add_run_slot(nil, 6, "45 Stars")
_G.STRApi.add_run_slot(nil, 7, "50 Stars")
_G.STRApi.add_run_slot(nil, 8, "70 Stars")
_G.STRApi.add_run_slot(nil, 9, "90 Stars")
_G.STRApi.add_run_slot(nil, 10, "120 Stars")
else
_G.STRApi.add_run_slot(nil, 1, "16 Stars")
_G.STRApi.add_run_slot(nil, 2, "70 Stars")
_G.STRApi.add_run_slot(nil, 3, "90 Stars")
_G.STRApi.add_run_slot(nil, 4, "120 Stars")
end

function Run_Slot_Interact(m, o, type)
if _G.STREnabled and Romhack_Is_Enabled == false then
	Stars = m.numStars
	GrandStar = get_id_from_behavior(o.behavior) == id_bhvGrandStar
	if not OmmEnabled then
	_G.STRApi.add_plugin_slot(1, Stars >= 0 and GrandStar)
	_G.STRApi.add_plugin_slot(2, Stars >= 1 and GrandStar)
	_G.STRApi.add_plugin_slot(3, Stars >= 15 and GrandStar)
	_G.STRApi.add_plugin_slot(4, Stars >= 16 and GrandStar)
	_G.STRApi.add_plugin_slot(5, Stars >= 31 and GrandStar)
	_G.STRApi.add_plugin_slot(6, Stars >= 45 and GrandStar)
	_G.STRApi.add_plugin_slot(7, Stars >= 50 and GrandStar)
	_G.STRApi.add_plugin_slot(8, Stars >= 70 and GrandStar)
	_G.STRApi.add_plugin_slot(9, Stars >= 90 and GrandStar)
	_G.STRApi.add_plugin_slot(10, Stars >= 120 and GrandStar)
	else
	_G.STRApi.add_plugin_slot(1, Stars >= 16 and GrandStar)
	_G.STRApi.add_plugin_slot(2, Stars >= 70 and GrandStar)
	_G.STRApi.add_plugin_slot(3, Stars >= 90 and GrandStar)
	_G.STRApi.add_plugin_slot(4, Stars >= 120 and GrandStar)
	end
    end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_ON_INTERACT, Run_Slot_Interact)

