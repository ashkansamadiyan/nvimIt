return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local lualine = require 'lualine'
    local colors = {
      blue = '#2979FF',
      green = '#76FF03',
      violet = '#FF61EF',
      yellow = '#FFDA7B',
      red = '#FF1744',
      fg = '#c3ccdc',
      bg = '#112638',
      inactive_bg = '#2c3043',
    }

    local my_lualine_theme = {
      normal = {
        a = { bg = colors.blue, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg }, -- Pill background
        c = { bg = colors.bg, fg = colors.fg },
      },
      insert = {
        a = { bg = colors.green, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg }, -- Consistent pill color
        c = { bg = colors.bg, fg = colors.fg },
      },
      visual = {
        a = { bg = colors.violet, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      command = {
        a = { bg = colors.yellow, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      replace = {
        a = { bg = colors.red, fg = colors.bg, gui = 'bold' },
        b = { bg = colors.green, fg = colors.bg },
        c = { bg = colors.bg, fg = colors.fg },
      },
      inactive = {
        a = { bg = colors.inactive_bg, fg = colors.semilightgray, gui = 'bold' },
        b = { bg = colors.inactive_bg, fg = colors.semilightgray },
        c = { bg = colors.inactive_bg, fg = colors.semilightgray },
      },
    }

    -- Configure lualine with pill-shaped filename and no Git info
    lualine.setup {
      options = {
        theme = my_lualine_theme,
        component_separators = { left = '', right = '' }, -- Pill separators
        section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_a = { 'mode' },
        lualine_b = {
          { -- Pill-shaped filename component
            'filename',
            path = 1,
            separator = { left = '', right = '' },
            padding = 1,
          },
        },
        lualine_c = { 'diagnostics' }, -- Removed Git components
        lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_y = { 'progress' },
        lualine_z = { 'location' },
      },
    }
  end,
}
