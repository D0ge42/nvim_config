require("Otree").setup({
    win_size = 27,
    open_on_startup = false,
    hijack_netrw = true,
    show_hidden = false,
    show_ignore = false,
    cursorline = true,

    ignore_patterns = {},

    keymaps = {
        ["<CR>"] = "actions.on_enter",
        ["l"] = "actions.on_enter",
        ["h"] = "actions.on_close_dir",
        ["q"] = "actions.close_win",
        ["<C-h>"] = "actions.goto_parent",
        ["<C-l>"] = "actions.goto_dir",
        ["<M-H>"] = "actions.goto_pwd",
        ["cd"] = "actions.change_pwd",
        ["L"] = "actions.open_dirs",
        ["H"] = "actions.close_dirs",
        ["o"] = "actions.edit_dir",
        ["O"] = "actions.edit_into_dir",
        ["st"] = "actions.open_tab",
        ["<leader>s"] = "actions.open_vsplit",
        ["ss"] = "actions.open_split",
        ["s."] = "actions.toggle_hidden",
        ["si"] = "actions.toggle_ignore",
        ["r"] = "actions.refresh",
        ["sf"] = "actions.focus_file",
    },

    tree = {
        space_after_icon = " ",
        space_after_connector = " ",
        connector_space = "  ",
        connector_last = "└─",
        connector_middle = "├─",
        vertical_line = "│",
    },

    icons = {
        title = " ",
        directory = "",
        empty_dir = "",
    },

    highlights = {
        directory = "Directory",
        file = "Normal",
        title = "TelescopeTitle",
        tree = "Comment",
        normal = "Normal",
        float_normal = "TelescopeNormal",
        float_border = "TelescopeBorder",
    },

    float = {
        width_ratio = 0.4,
        height_ratio = 0.7,
        padding = 2,
        cursorline = true,
    },
})
