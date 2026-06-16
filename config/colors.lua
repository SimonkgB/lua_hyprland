----------------
----  MISC  ----
----------------

hl.config({
	misc = {
		background_color = "rgba(19101DFF)",
	},
})


-----------------
---- PLUGINS ----
-----------------

hl.on("hyprland.start", function()
	if hl.plugin.hyprbars ~= nil then
		hl.config({
			plugin = {
				hyprbars = {
					bar_text_font              = "Rubik",
					bar_height                 = 30,
					bar_padding                = 10,
					bar_button_padding         = 5,
					bar_precedence_over_border = true,
					bar_part_of_window         = true,
					bar_color                  = "rgba(19101DFF)",
					bar_text_color             = "rgba(EEDDF0FF)",
				},
			},
		})

		hl.plugin.hyprbars.add_button({
			bg_color = "rgb(EEDDF0)",
			size     = 13,
			icon     = "󰖭",
			action   = "hyprctl dispatch killactive",
		})

		hl.plugin.hyprbars.add_button({
			bg_color = "rgb(EEDDF0)",
			size     = 13,
			icon     = "󰖯",
			action   = "hyprctl dispatch fullscreen 1",
		})

		hl.plugin.hyprbars.add_button({
			bg_color = "rgb(EEDDF0)",
			size     = 13,
			icon     = "󰖰",
			action   = "hyprctl dispatch movetoworkspacesilent special",
		})
	end
end)


----------------------
---- WINDOW RULES ----
----------------------

hl.window_rule({
	name         = "pinned-window-borders",
	match        = { pin = true },
	border_color = "rgba(EAB2FFAA) rgba(EAB2FF77)",
})
