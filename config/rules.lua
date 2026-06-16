--------------------------------
---- WINDOWS AND WORKSPACES ----
--------------------------------

-- See https://wiki.hypr.land/Configuring/Basics/Window-Rules/
-- and https://wiki.hypr.land/Configuring/Basics/Workspace-Rules/

-- Global
hl.window_rule({
	name    = "global-opacity",
	match   = { class = ".*" },
	opacity = "1 0.95",
})

-- Application behavior
hl.window_rule({
	name  = "float-blueberry",
	match = { class = "^(blueberry.py)$" },
	float = true,
})

hl.window_rule({
	name  = "float-steam",
	match = { class = "^(steam)$" },
	float = true,
})

hl.window_rule({
	name  = "float-guifetch",
	match = { class = "^(guifetch)$" },
	float = true,
})

hl.window_rule({
	name  = "tile-warp",
	match = { class = "^(dev.warp.Warp)$" },
	tile  = true,
})

-- Utility windows
hl.window_rule({
	name  = "float-fdm",
	match = { title = "^(Free Download Manager)(.*)$" },
	float = true,
})

hl.window_rule({
	name  = "float-windscribe",
	match = { title = "^(Windscribe)(.*)$" },
	float = true,
})

hl.window_rule({
	name  = "float-wdisplays",
	match = { title = "^(wdisplays)(.*)$" },
	float = true,
})

-- Dialogs
hl.window_rule({
	name   = "dialog-open-file",
	match  = { title = "^(Open File)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-select-file",
	match  = { title = "^(Select a File)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-choose-wallpaper",
	match  = { title = "^(Choose wallpaper)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-open-folder",
	match  = { title = "^(Open Folder)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-save-as",
	match  = { title = "^(Save As)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-library",
	match  = { title = "^(Library)(.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "dialog-file-upload",
	match  = { title = "^(File Upload)(.*)$" },
	float  = true,
	center = true,
})

-- Picture in Picture
hl.window_rule({
	name              = "picture-in-picture",
	match             = { title = "^(Picture(-| )in(-| )[Pp]icture)$" },
	float             = true,
	keep_aspect_ratio = true,
	move              = "73% 72%",
	size              = "25% 25%",
	pin               = true,
})

-- Tearing fixes
hl.window_rule({
	name      = "tearing-steam-apps",
	match     = { class = "steam_app" },
	immediate = true,
})

hl.window_rule({
	name      = "tearing-exe-files",
	match     = { class = ".*\\.exe" },
	immediate = true,
})

-- Visual behavior
hl.window_rule({
	name      = "disable-shadows-tiled",
	match     = { float = false },
	no_shadow = true,
})

-- Matplotlib
hl.window_rule({
	name   = "matplotlib-windows",
	match  = { title = "^(Matplotlib.*)$" },
	float  = true,
	center = true,
})

hl.window_rule({
	name   = "matplotlib-figure-windows",
	match  = { title = "^(Figure.*)$" },
	float  = true,
	center = true,
})


---------------------
---- LAYER RULES ----
---------------------

-- Global
hl.layer_rule({
	name  = "global-xray",
	match = { namespace = ".*" },
	xray  = true,
})

-- Disable animations
hl.layer_rule({
	name    = "no-anim-walker",
	match   = { namespace = "walker" },
	no_anim = true,
})

hl.layer_rule({
	name    = "no-anim-selection",
	match   = { namespace = "selection" },
	no_anim = true,
})

hl.layer_rule({
	name    = "no-anim-anyrun",
	match   = { namespace = "anyrun" },
	no_anim = true,
})

hl.layer_rule({
	name    = "no-anim-hyprpicker",
	match   = { namespace = "hyprpicker" },
	no_anim = true,
})

-- Shell surfaces
hl.layer_rule({
	name         = "shell-surfaces",
	match        = { namespace = "shell.*" },
	blur         = true,
	ignore_alpha = 0.6,
})

-- GTK layer shell
hl.layer_rule({
	name         = "gtk-layer-shell-tweaks",
	match        = { namespace = "gtk-layer-shell" },
	blur         = true,
	ignore_alpha = 0,
})

-- Launchers
hl.layer_rule({
	name         = "launcher-tweaks",
	match        = { namespace = "launcher" },
	blur         = true,
	ignore_alpha = 0.5,
})

-- Notifications
hl.layer_rule({
	name         = "notification-tweaks",
	match        = { namespace = "notifications" },
	blur         = true,
	ignore_alpha = 0.69,
})

-- AGS Widgets
hl.layer_rule({
	name         = "ags-bar",
	match        = { namespace = "bar" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-dock",
	match        = { namespace = "dock" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-corners",
	match        = { namespace = "corner.*" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-indicators",
	match        = { namespace = "indicator.*" },
	blur         = true,
	ignore_alpha = 0.6,
	no_anim      = true,
})

hl.layer_rule({
	name         = "ags-overview",
	match        = { namespace = "overview" },
	blur         = true,
	ignore_alpha = 0.6,
	no_anim      = true,
})

hl.layer_rule({
	name         = "ags-cheatsheet",
	match        = { namespace = "cheatsheet" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-sideright",
	match        = { namespace = "sideright" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-sideleft",
	match        = { namespace = "sideleft" },
	blur         = true,
	ignore_alpha = 0.6,
})

hl.layer_rule({
	name         = "ags-osk",
	match        = { namespace = "osk" },
	blur         = true,
	ignore_alpha = 0.6,
	no_anim      = true,
})

-- Layer Animations
hl.layer_rule({
	name      = "anim-sideleft",
	match     = { namespace = "sideleft.*" },
	animation = "slide top",
})

hl.layer_rule({
	name      = "anim-sideright",
	match     = { namespace = "sideright.*" },
	animation = "slide top",
})

-- Session
hl.layer_rule({
	name  = "session-tweaks",
	match = { namespace = "session" },
	blur  = true,
})

hl.window_rule({ match = { class = "notesedit" }, float = true })
hl.window_rule({ match = { class = "notesedit" }, size = "420 320" })
hl.window_rule({ match = { class = "notesedit" }, move = "20 200" })
