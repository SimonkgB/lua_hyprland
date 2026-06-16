---------------------
---- KEYBINDINGS ----
---------------------

-- Variables
local sink = "@DEFAULT_AUDIO_SINK@"
local source = "@DEFAULT_SOURCE@"
local workspace_script = "~/.config/ags/scripts/hyprland/workspace_action.sh workspace "
local move_script = "~/.config/ags/scripts/hyprland/workspace_action.sh movetoworkspacesilent "

-- Media & Hardware Binds
hl.bind("XF86AudioMute", hl.dsp.exec_cmd("wpctl set-volume " .. sink .. " 0%"), { locked = true })
hl.bind("ALT + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute " .. source .. " toggle"), { locked = true })
hl.bind("SUPER + XF86AudioMute", hl.dsp.exec_cmd("wpctl set-mute " .. source .. " toggle"), { locked = true })
hl.bind("SUPER + SHIFT + M", hl.dsp.exec_cmd("wpctl set-volume " .. sink .. " 0%"), { locked = true })

hl.bind("XF86AudioRaiseVolume", hl.dsp.exec_cmd("wpctl set-volume -l 1 " .. sink .. " 5%+"),
	{ locked = true, repeating = true })
hl.bind("XF86AudioLowerVolume", hl.dsp.exec_cmd("wpctl set-volume " .. sink .. " 5%-"),
	{ locked = true, repeating = true })

-- Brightness Binds
hl.bind("XF86MonBrightnessUp", hl.dsp.exec_cmd("brightnessctl s +5%"), { repeating = true })
hl.bind("XF86MonBrightnessdown", hl.dsp.exec_cmd("brightnessctl s 5%-"), { repeating = true })

-- Media Playback Binds
hl.bind("SUPER + SHIFT + N",
	hl.dsp.exec_cmd(
		[[playerctl next || playerctl position $(bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100")]]),
	{ locked = true })
hl.bind("SUPER + SHIFT + B", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("SUPER + SHIFT + P", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioNext",
	hl.dsp.exec_cmd(
		[[playerctl next || playerctl position $(bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100")]]),
	{ locked = true })
hl.bind("XF86AudioPrev", hl.dsp.exec_cmd("playerctl previous"), { locked = true })
hl.bind("XF86AudioPlay", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })
hl.bind("XF86AudioPause", hl.dsp.exec_cmd("playerctl play-pause"), { locked = true })

-- Mouse Media Binds
hl.bind("SUPER + SHIFT + ALT + mouse:275", hl.dsp.exec_cmd("playerctl previous"))
hl.bind("SUPER + SHIFT + ALT + mouse:276",
	hl.dsp.exec_cmd(
		[[playerctl next || playerctl position $(bc <<< "100 * $(playerctl metadata mpris:length) / 1000000 / 100")]]))

-- App Binds
hl.bind("SUPER + Return", hl.dsp.exec_cmd("kitty"))
hl.bind("SUPER + O", hl.dsp.exec_cmd("~/Documents/refresh_rate_serivce/refresh_rate_adjuster.sh"))
hl.bind("CTRL + SUPER + T", hl.dsp.exec_cmd("~/.config/ags/scripts/color_generation/switchwall.sh"))
hl.bind("CTRL + SUPER + Y", hl.dsp.exec_cmd("~/.config/ags/scripts/color_generation/switchcolor.sh"))
hl.bind("SUPER + V",
	hl.dsp.exec_cmd("pkill fuzzel || cliphist list | fuzzel --match-mode fzf --dmenu | cliphist decode | wl-copy"))
hl.bind("SUPER + SHIFT + S",
	hl.dsp.exec_cmd(
		[[grimblast --freeze --notify copysave area ~/Pictures/Screenshots/Screenshot_"$(date '+%Y-%m-%d_%H.%M.%S')".png]]))
hl.bind("SHIFT + ALT + S", hl.dsp.exec_cmd("grimblast --freeze --notify copy area"))

-- Screenshots
hl.bind("Print", hl.dsp.exec_cmd("grim - | wl-copy"), { locked = true })
hl.bind("CTRL + Print",
	hl.dsp.exec_cmd(
		[[mkdir -p ~/Pictures/Screenshots && grimblast --notify copysave screen ~/Pictures/Screenshots/Screenshot_"$(date '+%Y-%m-%d_%H.%M.%S')".png]]),
	{ locked = true })

-- Actions & System Binds
hl.bind("SUPER + SHIFT + T",
	hl.dsp.exec_cmd(
		[[grim -g "$(slurp $SLURP_ARGS)" "tmp.png" && tesseract -l eng "tmp.png" - | wl-copy && rm "tmp.png"]]))
hl.bind("SUPER + SHIFT + C", hl.dsp.exec_cmd("hyprpicker -a"))
hl.bind("SUPER + ALT + R", hl.dsp.exec_cmd("~/.config/ags/scripts/record-script.sh"))
hl.bind("CTRL + ALT + R", hl.dsp.exec_cmd("~/.config/ags/scripts/record-script.sh --fullscreen"))
hl.bind("SUPER + SHIFT + ALT + R", hl.dsp.exec_cmd("~/.config/ags/scripts/record-script.sh --fullscreen-sound"))
hl.bind("CTRL + ALT + S", hl.dsp.exec_cmd("~/.config/ags/scripts/record-stop.sh"))
hl.bind("SUPER + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("CTRL + SUPER + L", hl.dsp.exec_cmd("astal -i hyprpanel 'lock.lock()'"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("loginctl lock-session"))
hl.bind("CTRL + SHIFT + ALT + Delete", hl.dsp.exec_cmd("pkill wlogout || wlogout -p layer-shell"))
hl.bind("CTRL + SHIFT + ALT + SUPER + Delete", hl.dsp.exec_cmd("systemctl poweroff || loginctl poweroff"))
hl.bind("SUPER + SHIFT + L", hl.dsp.exec_cmd("sleep 0.1 && systemctl suspend || loginctl suspend"), { locked = true })

-- Window Actions (Focus, Close, Layout)
hl.bind("SUPER + Left", hl.dsp.focus({ direction = "left" }))
hl.bind("SUPER + Right", hl.dsp.focus({ direction = "right" }))
hl.bind("SUPER + Up", hl.dsp.focus({ direction = "up" }))
hl.bind("SUPER + Down", hl.dsp.focus({ direction = "down" }))
hl.bind("SUPER + Q", hl.dsp.window.close())
hl.bind("SUPER + SHIFT + ALT + Q", hl.dsp.exec_cmd("hyprctl kill"))

hl.bind("SUPER + SHIFT + Left", hl.dsp.window.move({ direction = "left" }))
hl.bind("SUPER + SHIFT + Right", hl.dsp.window.move({ direction = "right" }))
hl.bind("SUPER + SHIFT + Up", hl.dsp.window.move({ direction = "up" }))
hl.bind("SUPER + SHIFT + Down", hl.dsp.window.move({ direction = "down" }))

hl.bind("SUPER + ALT + P", hl.dsp.window.float({ action = "toggle" }))
hl.bind("SUPER + ALT + F", hl.dsp.window.fullscreen_state({ internal = 0, client = 3 }))
hl.bind("SUPER + F", hl.dsp.window.fullscreen({ mode = 0 }))
hl.bind("SUPER + J", hl.dsp.layout("togglesplit"))
hl.bind("SUPER + P", hl.dsp.window.pin())
hl.bind("CTRL + SUPER + Minus", hl.dsp.window.resize({ x = 640, y = 480 }))
-- Window Resizing
hl.bind("SUPER + Comma", hl.dsp.window.resize({ x = -50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + Period", hl.dsp.window.resize({ x = 50, y = 0, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + Comma", hl.dsp.window.resize({ x = 0, y = -50, relative = true }), { repeating = true })
hl.bind("SUPER + SHIFT + Period", hl.dsp.window.resize({ x = 0, y = 50, relative = true }), { repeating = true })

-- Mouse Window Drag/Resize
hl.bind("SUPER + mouse:272", hl.dsp.window.drag(), { mouse = true })
hl.bind("SUPER + mouse:273", hl.dsp.window.resize(), { mouse = true })



-- Workspace Actions
for i = 1, 9 do
	hl.bind("SUPER + " .. i, hl.dsp.focus({ workspace = i }))
end
hl.bind("SUPER + 0", hl.dsp.focus({ workspace = 10 }))

-- Move window to workspace
for i = 1, 9 do
	hl.bind("SUPER + ALT + " .. i, hl.dsp.window.move({ workspace = i }))
end
hl.bind("SUPER + ALT + 0", hl.dsp.window.move({ workspace = 10 }))
-- Workspace Actions (via script loops)
--for i = 1, 9 do
--	hl.bind("SUPER + " .. i, hl.dsp.exec_cmd(workspace_script .. i))
--end
--hl.bind("SUPER + 0", hl.dsp.exec_cmd(workspace_script .. "10"))

--for i = 1, 10 do
--	hl.bind("SUPER + ALT + " .. (i % 10), hl.dsp.exec_cmd(move_script .. i))
--end




-- Workspace Actions (Internal Disp)
hl.bind("CTRL + SUPER + Right", hl.dsp.focus({ workspace = "+1" }))
hl.bind("CTRL + SUPER + Left", hl.dsp.focus({ workspace = "-1" }))
hl.bind("CTRL + SUPER + Up", hl.dsp.focus({ workspace = "-5" }))
hl.bind("CTRL + SUPER + Down", hl.dsp.focus({ workspace = "+5" }))
hl.bind("SUPER + mouse_up", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + mouse_down", hl.dsp.focus({ workspace = "-1" }))
hl.bind("SUPER + Page_Down", hl.dsp.focus({ workspace = "+1" }))
hl.bind("SUPER + Page_Up", hl.dsp.focus({ workspace = "-1" }))

hl.bind("CTRL + SUPER + S", hl.dsp.workspace.toggle_special())
hl.bind("SUPER + ALT + S", hl.dsp.window.move({ workspace = "special" }))

-- Cycle / Window Switcher
hl.bind("ALT + Tab", hl.dsp.window.cycle_next())
hl.bind("ALT + Tab", hl.dsp.window.bring_to_top())

-- Move window to workspace
hl.bind("CTRL + SUPER + SHIFT + Up", hl.dsp.window.move({ workspace = "special" }))
hl.bind("CTRL + SUPER + SHIFT + Right", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("CTRL + SUPER + SHIFT + Left", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + SHIFT + mouse_down", hl.dsp.window.move({ workspace = "-1" }))
hl.bind("SUPER + SHIFT + mouse_up", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("SUPER + SHIFT + Page_Down", hl.dsp.window.move({ workspace = "+1" }))
hl.bind("SUPER + SHIFT + Page_Up", hl.dsp.window.move({ workspace = "-1" }))

-- Widgets & Panels
hl.bind("CTRL + ALT + B", hl.dsp.exec_cmd("astal -i hyprpanel -t bar-0"))
hl.bind("SUPER + D", hl.dsp.exec_cmd("pkill rofi || $HOME/.config/rofi/scripts/launcher_t6"))
hl.bind("SUPER + F1",
	hl.dsp.exec_cmd(
		[[kitty --class floating_kitty -e sh -c "grep -v '^\s*#\|^\s*$' ~/.config/hypr/config/keybinds.conf | less"]]))
hl.bind("SUPER + A", hl.dsp.exec_cmd("astal -i hyprpanel -t dashboardmenu"))
hl.bind("SUPER + S", hl.dsp.exec_cmd("astal -i hyprpanel -t energymenu"))
hl.bind("SUPER + M", hl.dsp.exec_cmd("astal -i hyprpanel -t mediamenu"))
hl.bind("SUPER + N", hl.dsp.exec_cmd("astal -i hyprpanel -t notificationsmenu"))
hl.bind("CTRL + ALT + Delete", hl.dsp.exec_cmd("pkill rofi || $HOME/.config/rofi/scripts/powermenu_t5"))
hl.bind("CTRL + SUPER + G",
	hl.dsp.exec_cmd(
		[[for ((i=0; i<$(hyprctl monitors -j | jq length); i++)); do astal -i hyprpanel -t "crosshair""$i"; done]]))

-- Testing Widgets
hl.bind("SUPER + ALT + F12",
	hl.dsp.exec_cmd(
		[[notify-send 'Test notification' "Here's a really long message to test truncation and wrapping\nYou can middle click or flick this notification to dismiss it!" -a 'Shell' -A "Test1=I got it!" -A "Test2=Another action" -t 5000]]))
hl.bind("SUPER + ALT + F11",
	hl.dsp.exec_cmd([[notify-send "Urgent notification" "Ah hell no" -u critical -a 'Hyprland keybind']]))

-- Widget Release Hooks
hl.bind("CTRL + SUPER + R", hl.dsp.exec_cmd("killall hyprpanel ydotool; hyprpanel &"), { release = true })
hl.bind("CTRL + SUPER + ALT + R", hl.dsp.exec_cmd("hyprctl reload; killall hyprpanel ydotool; hyprpanel &"),
	{ release = true })

-- Final Application Mappings
hl.bind("CTRL + SUPER + V",
	hl.dsp.exec_cmd(
		"code --password-store=gnome --disable-gpu --enable-features=UseOzonePlatform --ozone-platform=wayland"))
hl.bind("SUPER + E", hl.dsp.exec_cmd("nemo"))
hl.bind("SUPER + W", hl.dsp.exec_cmd("brave-origin-beta"))
hl.bind("CTRL + SUPER + W", hl.dsp.exec_cmd("brave"))
hl.bind("SUPER + X", hl.dsp.exec_cmd("gnome-text-editor --new-window"))
hl.bind("SUPER + SHIFT + W", hl.dsp.exec_cmd("onlyoffice-desktopeditors"))
hl.bind("SUPER + I", hl.dsp.exec_cmd([[XDG_CURRENT_DESKTOP="gnome" gnome-control-center]]))
hl.bind("SUPER + ALT + V", hl.dsp.exec_cmd("pavucontrol"))
hl.bind("CTRL + SUPER + SHIFT + V", hl.dsp.exec_cmd("easyeffects"))
hl.bind("CTRL + SHIFT + Escape", hl.dsp.exec_cmd("gnome-system-monitor"))
hl.bind("CTRL + SUPER + Space", hl.dsp.exec_cmd("pkill anyrun || anyrun"))
hl.bind("SUPER + ALT + Space", hl.dsp.exec_cmd("pkill anyrun || fuzzel"))
hl.bind("CTRL + SUPER + E", hl.dsp.exec_cmd("rnote"))
hl.bind("CTRL + SUPER + A",
	hl.dsp.exec_cmd(
		"spotify --enable-features=UseOzonePlatform --ozone-platform=wayland --force-device-scale-factor=1.5"))
