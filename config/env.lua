-------------------------------
---- ENVIRONMENT VARIABLES ----
-------------------------------

-- See https://wiki.hypr.land/Configuring/Advanced-and-Cool/Environment-variables/

local env = {
	-- Input method
	QT_IM_MODULE              = "fcitx",
	XMODIFIERS                = "@im=fcitx",

	HYPRCURSOR_SIZE           = "24",
	HYPRCURSOR_THEME          = "Bibata-Modern-Classic",

	SDL_IM_MODULE             = "fcitx",
	GLFW_IM_MODULE            = "ibus",
	INPUT_METHOD              = "fcitx",

	-- Themes
	QT_QPA_PLATFORM           = "wayland",
	QT_QPA_PLATFORMTHEME      = "qt5ct",

	WLR_NO_HARDWARE_CURSORS   = "1",

	-- NVIDIA
	LIBVA_DRIVER_NAME         = "nvidia",
	XDG_SESSION_TYPE          = "wayland",
	GBM_BACKEND               = "nvidia-drm",
	__GLX_VENDOR_LIBRARY_NAME = "nvidia",

	-- VA-API
	NVD_BACKEND               = "direct",
}

for key, value in pairs(env) do
	hl.env(key, value)
end


------------------------
---- CURSOR CONFIG -----
------------------------

hl.config({
	cursor = {
		no_hardware_cursors = true,
	},
})
