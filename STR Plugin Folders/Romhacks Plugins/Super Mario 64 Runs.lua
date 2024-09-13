-- name: Super Mario 64 Runs

if Romhack_Is_Enabled then return end

Romhack_Is_Enabled = false

for romhacks in pairs(gActiveMods) do
    if (gActiveMods[romhacks].incompatible ~= nil and gActiveMods[romhacks].incompatible:find("romhack")) then
        Romhack_Is_Enabled = true
		djui_popup_create("\\#ff0000\\This Plugin is only for SM64, it's doesn't work for Romhacks", 2)
		break
    end
end

-- A Warning Check
speedrun_timer_check = false
function speedrun_timer()
if not _G.SpeedrunTimerReworked and speedrun_timer_check == false then	
    djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	speedrun_timer_check = true
	Romhack_Name = "None"
	end
end

hook_event(HOOK_UPDATE, speedrun_timer)

-- These are the Custom Runs but this is Optional tho, but it's you're choice
-- These are examples, you can change them whatever you like

-- Here's are the Api For Making Run Commands (Optional)
-- This will check if you're making a run command
function custom_runs(m)
if _G.SpeedrunTimerReworked and Romhack_Is_Enabled == false then
	if not OmmEnabled then
	_G.STRApi.add_custom_run(1, "0 Stars")
	_G.STRApi.add_custom_run(2, "1 Star")
	_G.STRApi.add_custom_run(3, "16 Stars")
	_G.STRApi.add_custom_run(4, "70 Stars")
	_G.STRApi.add_custom_run(5, "120 Stars")
	else
	_G.STRApi.add_custom_run(1, "16 Stars")
	_G.STRApi.add_custom_run(2, "70 Stars")
	_G.STRApi.add_custom_run(3, "90 Stars")
	_G.STRApi.add_custom_run(4, "120 Stars")
	end
    end
end

-- Functions
-- This will stop the timer once on the correct way to finish it
function custom_stars_interact_update(m, o)
if Romhack_Is_Enabled == false then
	if not OmmEnabled then
	_G.STRApi.custom_romhack_runs("0 Stars", m.numStars >= 0 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("1 Star", m.numStars >= 1 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("16 Stars", m.numStars >= 16 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("70 Stars", m.numStars >= 70 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("120 Stars", m.numStars >= 120 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	else
	_G.STRApi.custom_romhack_runs("16 Stars", m.numStars >= 16 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("70 Stars", m.numStars >= 70 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("90 Stars", m.numStars >= 90 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	_G.STRApi.custom_romhack_runs("120 Stars", m.numStars >= 120 and get_id_from_behavior(o.behavior) == id_bhvGrandStar)
	end
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_ON_MODS_LOADED, custom_runs)
hook_event(HOOK_ON_INTERACT, custom_stars_interact_update)

