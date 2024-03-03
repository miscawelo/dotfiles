require("ibl").setup()

require'nvim-treesitter.configs'.setup {
  ensure_installed = {"c", "c_sharp", "cpp" , "html", "hyprlang", "json", "latex", "css", "python", "latex", "markdown", "lua", "vim", "bash", "yaml", "yuck"},
  sync_install = false,
  auto_install = true,

  highlight = {
    enable = true,
    additional_vim_regex_highlighting = false,
  },

  indent = {
    enable = true
  },
}

vim.filetype.add({
pattern = { [".*/hyprland%.conf"] = "hyprlang" },
})

require('lualine').setup {
  options = {
    icons_enabled = true,
    theme = 'dracula',
    component_separators = { left = '|', right = '|'},
    section_separators = { left = '', right = ''},
    disabled_filetypes = {
      statusline = {},
      winbar = {},
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = false,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    }
  },

  sections = {
    lualine_a = {'mode'},
    lualine_b = {'filetype', 'branch'},
    lualine_c = {'filename'},
    lualine_x = {'selectioncount', 'searchcount'},
    lualine_y = {'location', 'progress'},
    lualine_z = {'hostname'}
  },

  inactive_sections = {
    lualine_a = {},
    lualine_b = {'filetype'},
    lualine_c = {'filename'},
    lualine_x = {},
    lualine_y = {},
    lualine_z = {}
  },

  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {}
}
