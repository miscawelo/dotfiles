local wezterm = require 'wezterm'
local act = wezterm.action

return {
    keys = {
        {key="V", mods="CTRL", action=act.PasteFrom("Clipboard")},

        {key="V", mods="CTRL", action=act.PasteFrom("PrimarySelection")},
    },

    mouse_bindings = {
        {
            event={Up={streak=1, button="Left"}},
            mods="NONE",
            action=act.CompleteSelection("PrimarySelection"),
        },

        {
            event={Up={streak=1, button="Left"}},
            mods="CTRL",
            action=act.OpenLinkAtMouseCursor,
        },
    },

    hide_tab_bar_if_only_one_tab = true,

    color_scheme = 'Dracula',

    window_close_confirmation = "AlwaysPrompt",

    enable_scroll_bar = true,

    font = wezterm.font_with_fallback({
        'SF Mono',
        'FontAwesome6Free'
    }),

    font_size = 10.0,
}
