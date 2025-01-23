return {
  {
    "pmizio/typescript-tools.nvim",
    ft = { "typescript", "typescriptreact" },
    dependencies = {
      "nvim-lua/plenary.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      -- Merge capabilities properly
      local capabilities = vim.tbl_deep_extend('force',
        vim.lsp.protocol.make_client_capabilities(),
        require('cmp_nvim_lsp').default_capabilities(),
        require('blink.cmp').get_lsp_capabilities(),
        {
          workspace = {
            didChangeWatchedFiles = { dynamicRegistration = true },
            configuration = true,
          }
        }
      )

      require("typescript-tools").setup({
        capabilities = capabilities,
        
        on_attach = function(client, bufnr)
          -- Disable formatting in favor of null-ls
          client.server_capabilities.documentFormattingProvider = false
          client.server_capabilities.documentRangeFormattingProvider = false

          -- TS-specific keymaps
          local map = function(mode, lhs, rhs, desc)
            vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = 'TS: ' .. desc })
          end
          
          map('n', '<leader>to', '<cmd>TSToolsOrganizeImports<CR>', 'Organize Imports')
          map('n', '<leader>tr', '<cmd>TSToolsRemoveUnused<CR>', 'Remove Unused')
          map('n', '<leader>ti', '<cmd>TSToolsAddMissingImports<CR>', 'Add Missing Imports')
          map('n', 'gD', '<cmd>TSToolsGoToSourceDefinition<CR>', 'Source Definition')
          map('n', '<leader>tR', '<cmd>TSToolsRenameFile<CR>', 'Rename File')
          map('n', 'K', vim.lsp.buf.hover, 'Hover Documentation')
        end,

        settings = {
          separate_diagnostic_server = true,
          publish_diagnostic_on = "insert_leave",
          expose_as_code_action = { "fix_all", "add_missing_imports" },
          tsserver_file_preferences = {
            includeInlayParameterNameHints = "literals",
            includeInlayVariableTypeHints = true,
            importModuleSpecifierPreference = "project-relative",
          },
          tsserver_format_options = {
            insertSpaceAfterCommaDelimiter = true,
            insertSpaceAfterSemicolonInForStatements = true,
            semicolons = "insert",
          }
        }
      })
    end
  },
}
