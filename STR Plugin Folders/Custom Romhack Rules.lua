
-- A Warning Check
if not _G.STREnabled then
	djui_popup_create("\\#ff0000\\\nWarning:\nThis Plugin is Disable without The Speedrun Timer Reworked Mod.\n\nI suggest you Go Back and Get it Before You Use This Plugin.", 5)
	return 
end

function custom_romhack_rules()
if _G.STREnabled then
djui_hud_set_resolution(RESOLUTION_N64)
djui_hud_set_font(FONT_NORMAL)

if not OmmEnabled then
OMMTitle = "Hello, Welcome to the Speedrun Server!" XPlace = 5.0
else
OMMTitle = "Hello, Welcome to the OMM Rebirth Speedrun Server!" XPlace = 10.4
end

-- Recreation of the Rules Display
_G.STRApi.add_rules_rect(2.0, 2.0, 5, 3, 100, 170, 170, 170, 200)
_G.STRApi.add_rules_text(OMMTitle, XPlace, 2.0 - 500, 0, 32, 0.50, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Here are the Runs and Rules:", 3.6, 14.4, 0, 32, 0.50, 0.95, 0.95, 255, 255, 255, 255)

-- X: 73.0 - Left, 2.0 - Right, 3.56 - Middle
-- Y: 6.0 - 1, 3.35 - 2, 2.34 - 3, 1.79 - 4, 1.45 - 5 = Name Run
-- Y: 4.85 - 1, 2.98 - 2, 2.15 - 3, 1.68 - 4, 1.38 - 5 = Todo Task
-- Y: 4.2 - 1, 2.73 - 2, 2.02 - 3, 1.6 - 4, 1.325 - 5 = Glitches?

_G.STRApi.add_rules_text("Rule 1", 73.0, 6.0, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 1", 73.0, 4.85, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 73.0, 4.2, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 2", 73.0, 3.35, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 2", 73.0, 2.98, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 73.0, 2.73, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 3", 73.0, 2.34, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 3", 73.0, 2.15, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 73.0, 2.02, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 4", 73.0, 1.79, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 4", 73.0, 1.68, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 73.0, 1.6, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 5", 73.0, 1.45, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 5", 73.0, 1.38, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 73.0, 1.325, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 6", 2.0, 6.0, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 6", 2.0, 4.85, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 2.0, 4.2, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 7", 2.0, 3.35, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 7", 2.0, 2.98, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 2.0, 2.73, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 8", 2.0, 2.34, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 8", 2.0, 2.15, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 2.0, 2.02, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 9", 2.0, 1.79, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 9", 2.0, 1.68, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 2.0, 1.6, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("Rule 10", 2.0, 1.45, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Rules For Slot 10", 2.0, 1.38, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Depends If Glitches are Allowed", 2.0, 1.325, 0, 32, 0.25, 0.50, 0.50, 255, 255, 255, 255)

_G.STRApi.add_rules_text("These Rules are Needed to make your Run Vaild.", 4.06, 1.11, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Not following these Rules will count as Invaild.", 4.02, 1.06, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
_G.STRApi.add_rules_text("Make sure you got things ready before Starting.", 4.18, 1.012, 0, 32, 0.35, 0.95, 0.95, 255, 255, 255, 255)
	end
end

-- I have to put hooks, since for some reason they don't work without them
hook_event(HOOK_ON_HUD_RENDER, custom_romhack_rules)

