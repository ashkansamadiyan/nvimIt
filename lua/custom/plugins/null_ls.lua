return {
  "jose-elias-alvarez/null-ls.nvim",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.prettier.with({
          filetypes = {
            "javascript",
            "javascriptreact",
            "typescript",
            "typescriptreact",
            "css",
            "scss",
            "html",
            "json",
            "yaml",
            "lua",
            "go",
            'rust',
            "markdown"
          },
          extra_args = { "--single-quote", "--jsx-single-quote" } -- optional
        }),
        null_ls.builtins.formatting.black
      },
    })

    -- Format command that ONLY uses null-ls
    vim.keymap.set('n', '<leader>f', function()
      vim.lsp.buf.format({
        filter = function(client)
          return client.name == "null-ls"
        end,
        async = true
      })
    end, { desc = "Format file (Prettier only)" })

    vim.api.nvim_create_autocmd('BufWritePre', {
  pattern = { '*.ts', '*.tsx', '*.js', '*.jsx' },
  callback = function()
    vim.lsp.buf.format({
      filter = function(client)
        return client.name == "null-ls"
      end,
      async = false
    })
  end
})
  end,
}
