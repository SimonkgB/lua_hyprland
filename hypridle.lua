---------------------------
---- HYPRIDLE GENERATOR ---
---------------------------

local lock_cmd = "pidof hyprlock || hyprlock"
local suspend_cmd = "pidof steam || systemctl suspend || loginctl suspend"

local hypridle_config = {
    general = {
        lock_cmd         = lock_cmd,
        before_sleep_cmd = "loginctl lock-session",
    },

    listeners = {
        {
            timeout    = 300,
            on_timeout = "loginctl lock-session",
        },
        {
            timeout    = 420,
            on_timeout = "hyprctl dispatch dpms off",
            on_resume  = "hyprctl dispatch dpms on",
        },
        {
            timeout    = 540,
            on_timeout = suspend_cmd,
        },
    },
}

-- Function to dynamically render the hypridle.conf file
local function generate_hypridle_conf()
    local path = os.getenv("HOME") .. "/.config/hypr/hypridle.conf"
    local file = io.open(path, "w")
    if not file then return end

    file:write("# Auto-generated from hyprland.lua\n\n")

    -- Render general block
    file:write("general {\n")
    for k, v in pairs(hypridle_config.general) do
        file:write(string.format("    %s = %s\n", k, v))
    end
    file:write("}\n\n")

    -- Render listener blocks
    for _, listener in ipairs(hypridle_config.listeners) do
        file:write("listener {\n")
        for k, v in pairs(listener) do
            file:write(string.format("    %s = %s\n", k, tostring(v)))
        end
        file:write("}\n\n")
    end

    file:close()
end

-- Generate the file immediately on reload/startup
generate_hypridle_conf()