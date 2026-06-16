-------------------
---- AUTOSTART ----
-------------------

-- See https://wiki.hypr.land/Configuring/Basics/Autostart/

local startup = {
	-- Wallpaper
	"awww-daemon",
	"sleep 1 && awww img /home/simon/.config/hypr/wallhaven-rrljjq.jpg",
	-- Location services
	"/usr/lib/geoclue-2.0/demos/agent",

	-- Panel
	"hyprpanel",

	-- Input method
	"fcitx5",

	-- Authentication
	"gnome-keyring-daemon --start --components=secrets",
	[[/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 || /usr/libexec/polkit-gnome-authentication-agent-1]],

	-- Idle daemon
	"hypridle",

	-- D-Bus environment
	"dbus-update-activation-environment --all",
	"sleep 1 && dbus-update-activation-environment --systemd WAYLAND_DISPLAY XDG_CURRENT_DESKTOP",

	-- Plugins
	"hyprpm reload",

	-- Clipboard history
	"wl-paste --type text --watch cliphist store",
	"wl-paste --type image --watch cliphist store",

	-- Cursor
	"hyprctl setcursor Bibata-Modern-Classic 24",
	"gsettings set org.gnome.desktop.interface cursor-theme Bibata-Modern-Classic",
	"gsettings set org.gnome.desktop.interface cursor-size 24",

	-- Stickers
	"~/.config/eww/sticker/start.sh",
}

hl.on("hyprland.start", function()
	for _, cmd in ipairs(startup) do
		hl.exec_cmd(cmd)
	end
end)
