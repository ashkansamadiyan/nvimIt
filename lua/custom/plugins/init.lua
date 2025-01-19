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
  priority = 1000, -- Ensure it loads firso
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
  },
  {
    "jose-elias-alvarez/null-ls.nvim",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "nvim-lua/plenary.nvim",
    },
    config = function()
      local null_ls = require("null-ls")
      null_ls.setup({
        sources = {
          null_ls.builtins.formatting.prettier,
          null_ls.builtins.formatting.black,
        },
      })
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = "Format file" })
    end,
  }
  ,
  {
  "nvim-treesitter/nvim-treesitter-context",
  dependencies = {"nvim-treesitter/nvim-treesitter"},
  config = function()
    require("treesitter-context").setup(
    {max_lines = 2}
    )
  end
}
}


