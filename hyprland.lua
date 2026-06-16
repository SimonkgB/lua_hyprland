hl.config({ debug = { disable_logs = false } })
-- input = {
--     kb_file = os.getenv("HOME") .. "/.config/xkb/keymap.xkb",
-- }
-- Define configuration directories
local base_dir   = os.getenv("HOME") .. "/.config/hypr"
-- local base_dir   = os.getenv("HOME") .. "/Desktop/projects/lua_hyprland"
local config_dir = base_dir .. "/config"
-- 1. Run generators to compile your hypridle.conf and hyprlock.conf files
dofile(base_dir .. "/hypridle.lua")
dofile(base_dir .. "/hyprlock.lua")

-- 2. Load your core Hyprland configurations
dofile(config_dir .. "/env.lua")
dofile(config_dir .. "/execs.lua")
dofile(config_dir .. "/general.lua")
dofile(config_dir .. "/rules.lua")
dofile(config_dir .. "/keybinds.lua")
dofile(config_dir .. "/colors.lua")

hl.on("hyprland.start", function()
	if hl.plugin.hyprexpo ~= nil then
		hl.config({
			plugin = {
				hyprexpo = {
					columns          = 3,
					gap_size         = 5,
					bg_col           = "rgb(000000)",
					workspace_method = "first 1",
					enable_gesture   = false,
				},
			},
		})
	end
end)
