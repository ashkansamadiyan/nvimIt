return {
  -- Add dracula
  { "Mofiqul/dracula.nvim" },
  -- Configure LazyVim to load dracula
  
  {
    "Mofiqul/dracula.nvim",
    config = function()
      local dracula = require("dracula")
      dracula.setup({
        colors = {
          -- Base colors
          bg = "#1E1F2B",             -- Slightly darker than default
          fg = "#F8F8F2",             -- Classic Dracula foreground
          selection = "#454B7D",       -- Slightly more saturated selection
          comment = "#6272A4",         -- Original comment color
          
          -- Balanced primary colors
          red = "#FF4455",            -- Softened red
          orange = "#FFB86C",         -- Classic orange
          yellow = "#F1FA8C",         -- Classic yellow
          green = "#50FA7B",          -- Classic green
          purple = "#BD93F9",         -- Classic purple
          cyan = "#8BE9FD",           -- Classic cyan
          pink = "#FF79C6",           -- Classic pink
          
          -- Bright variants (slightly toned down)
          bright_red = "#FF6E6E",     -- Softer bright red
          bright_green = "#69FF94",   -- Balanced bright green
          bright_yellow = "#FFFFA5",  -- Softer bright yellow
          bright_blue = "#CAB3FF",    -- Balanced bright blue
          bright_magenta = "#FF92DF", -- Classic bright magenta
          bright_cyan = "#A4FFFF",    -- Classic bright cyan
          bright_white = "#FFFFFF",   -- Pure white
          
          -- UI elements
          menu = "#21222C",          -- Classic menu background
          visual = "#3E4452",        -- Classic visual selection
          gutter_fg = "#4B5263",     -- Classic gutter
          nontext = "#3B4048",       -- Classic non-text
          white = "#F8F8F2",         -- Slightly off-white
          black = "#191A21",         -- Classic black
        },
        -- Show the '~' characters after the end of buffers
        show_end_of_buffer = true,
        -- Use transparent background
        transparent_bg = true,
        -- Set custom lualine background color
        lualine_bg_color = "#2D3143",
        -- Set italic comment
        italic_comment = true,
        -- Override specific highlights
        overrides = {
          -- Balanced keyword and function highlighting
          Keyword = { fg = "#FF79C6", bold = true },
          Function = { fg = "#8BE9FD", bold = true },
          -- Classic string color
          String = { fg = "#F1FA8C" },
          -- Enhanced UI elements
          CursorLine = { bg = "#282A36" },
          Visual = { bg = "#3E4452", bold = true },
        },
      })
    end,
  },
}
