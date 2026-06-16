---------------------------
---- HYPRLOCK GENERATOR ---
---------------------------

local colors = {
	text             = "rgba(FFFFFFFF)",
	entry_background = "rgba(33333311)",
	entry_border     = "rgba(3B3B3B55)",
	entry            = "rgba(FFFFFFFF)",
}

local fonts = {
	default = "SF Pro",
	clock   = "SF Pro",
	icons   = "Material Symbols Rounded",
}

local hyprlock_config = {
	background = {
		color       = "rgba(000000FF)",
		path        = "/home/simon/.config/hypr/wallhaven-rrljjq.jpg",
		blur_size   = 1,
		blur_passes = 3,
	},

	input_field = {
		size              = "250, 50", -- combined into standard layout string
		outline_thickness = 2,
		dots_size         = 0.1,
		dots_spacing      = 0.3,
		outer_color       = colors.entry_border,
		inner_color       = colors.entry_background,
		font_color        = colors.entry,
		position          = "0, -100",
		halign            = "center",
		valign            = "center",
	},

	labels = {
		-- Clock
		{
			text          = "$TIME",
			shadow_passes = 1,
			shadow_boost  = 0.5,
			color         = colors.text,
			font_size     = 150,
			font_family   = fonts.clock,
			position      = "0, 200",
			halign        = "center",
			valign        = "center",
		},
		-- Greeting
		{
			text          = "Hi $USER !!!",
			shadow_passes = 1,
			shadow_boost  = 0.5,
			color         = colors.text,
			font_size     = 30,
			font_family   = fonts.default,
			position      = "0, 0",
			halign        = "center",
			valign        = "center",
		},
		-- Lock icon
		{
			text          = "lock",
			shadow_passes = 1,
			shadow_boost  = 0.5,
			color         = colors.text,
			font_size     = 21,
			font_family   = fonts.icons,
			position      = "0, 65",
			halign        = "center",
			valign        = "bottom",
		},
		-- Locked text
		{
			text          = "locked",
			shadow_passes = 1,
			shadow_boost  = 0.5,
			color         = colors.text,
			font_size     = 14,
			font_family   = fonts.default,
			position      = "0, 45",
			halign        = "center",
			valign        = "bottom",
		},
		-- Status
		{
			text          = [[cmd[update:5000] ${XDG_CONFIG_HOME:-$HOME/.config}/hypr/hyprlock/status.sh]],
			shadow_passes = 1,
			shadow_boost  = 0.5,
			color         = colors.text,
			font_size     = 14,
			font_family   = fonts.default,
			position      = "30, -30",
			halign        = "left",
			valign        = "top",
		},
	}
}

local function generate_hyprlock_conf()
	local path = os.getenv("HOME") .. "/.config/hypr/hyprlock.conf"
	local file = io.open(path, "w")
	if not file then return end

	file:write("# Auto-generated from hyprland.lua\n\n")

	-- Render Background
	file:write("background {\n")
	for k, v in pairs(hyprlock_config.background) do
		file:write(string.format("    %s = %s\n", k, tostring(v)))
	end
	file:write("}\n\n")

	-- Render Input Field
	file:write("input-field {\n")
	for k, v in pairs(hyprlock_config.input_field) do
		file:write(string.format("    %s = %s\n", k, tostring(v)))
	end
	file:write("}\n\n")

	-- Render Labels Array
	for _, label in ipairs(hyprlock_config.labels) do
		file:write("label {\n")
		for k, v in pairs(label) do
			file:write(string.format("    %s = %s\n", k, tostring(v)))
		end
		file:write("}\n\n")
	end

	file:close()
end

generate_hyprlock_conf()
