-- name: STR: SM64 Plugin Runs

for romhacks in pairs(gActiveMods) do if (gActiveMods[romhacks].incompatible ~= nil and gActiveMods[romhacks].incompatible:find("romhack")) then Romhack_Is_Enabled = true break end end

if Romhack_Is_Enabled == true then return end

-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis plugin doesn't work without STR Mod.\n\nI suggest you go turn on STR before trying it", 5)
	return 
end

-- Here's all the Runs for Normal and OMM Rebirth
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

-- You will need this hook for it to work
hook_event(HOOK_ON_INTERACT, Run_Slot_Interact)

