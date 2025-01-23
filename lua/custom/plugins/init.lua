return {
  {
    "rose-pine/neovim",
    name = "rose-pine",
    config = function()

      vim.cmd("colorscheme rose-pine")
    end
  },

  {
  "olimorris/onedarkpro.nvim",
  }
  ,
  {
    'stevearc/oil.nvim',
    ---@module 'oil'
    ---@type oil.SetupOpts
    opts = {
      view_options = {
        show_hidden = true,
      },
      buf_options = {
        buflisted = false,
        bufhidden = "hide",
      },
    },
  }

}


