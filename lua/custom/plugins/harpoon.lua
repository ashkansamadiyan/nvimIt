return  {
    'ThePrimeagen/harpoon',
    branch = 'harpoon2', -- Since you're using the new Harpoon 2 syntax
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = function()
      local harpoon = require 'harpoon'

      -- Setup harpoon
      harpoon:setup()

      -- Configure keymaps
      vim.keymap.set('n', '<leader>a', function()
        harpoon:list():add()
      end)
      vim.keymap.set('n', '<leader>rh', function()
        harpoon:list():remove()
      end)

      vim.keymap.set('n', '<leader>fh', function()
        harpoon:list():clear()
      end)

      vim.keymap.set('n', '<C-e>', function()
        harpoon.ui:toggle_quick_menu(harpoon:list())
      end)

    end,
  }

