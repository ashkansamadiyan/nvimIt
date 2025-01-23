return {
  'saghen/blink.cmp',
  version = '*',
  dependencies = { 'L3MON4D3/LuaSnip', version = 'v2.*' },
  opts = {
    snippets = { preset = 'luasnip' },
    keymap = { preset = 'default' },
    appearance = {
      use_nvim_cmp_as_default = true,
      nerd_font_variant = 'normal',
    },
    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },
    completion = {
      list = {
        selection = { preselect = true, auto_insert = false }, 
      },
      keyword = {
        range = 'full', 
      },
      menu = {
        border = 'single',
        min_width = 20,
        scrollbar = false,
        draw = {
          columns = {
            { "label", "label_description", gap = 1 },
            { "kind_icon", "kind" }, -- ⚠️ Needs icon definitions
          },
        },
      },
      documentation = {
        auto_show = true,
        auto_show_delay_ms = 50,
        window = {
          min_width = 13,
          border = 'single',
          scrollbar = false,
        },
      },
    },
    signature = { enabled = true },
  },
  opts_extend = { "sources.default" },
}
