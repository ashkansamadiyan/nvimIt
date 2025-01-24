return {
  'nvim-treesitter/nvim-treesitter',
  build = ':TSUpdate',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  config = function()
    require('nvim-treesitter.configs').setup({
      ensure_installed = {
        'bash',
        'c',
        'diff',
        'html',
        'lua',
        'luadoc',
        'markdown',
        'markdown_inline',
        'query',
        'vim',
        'vimdoc',
        'typescript',
        'tsx', -- Added for proper JSX support
        'javascript',
        'python',
        'html',
        'xml',
        'json'
      },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-s>',
          node_incremental = '<C-s>',
          scope_incremental = '<leader>st',
          node_decremental = '<M-s>',
        },
      },
      auto_install = true,
      highlight = {
        enable = true,
        additional_vim_regex_highlighting = { 'ruby' },
      },
      indent = { enable = true, disable = { 'ruby' } },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            -- Function textobjects
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            -- Parameter textobjects
            ['ap'] = '@parameter.outer',
            ['ip'] = '@parameter.inner',
            -- JSX textobjects
            ['ax'] = '@jsx_element.outer',
            ['ix'] = '@jsx_element.inner',
          },
        },
        move = {
          enable = true,
          goto_next_start = { [']m'] = '@function.outer' },
          goto_previous_start = { ['[m'] = '@function.outer' },
        },
      },
    })

    -- Create custom queries directory structure
    local parser_config = require('nvim-treesitter.parsers').get_parser_configs()
    parser_config.tsx.filetype_to_parsername = { 'javascript', 'typescript', 'tsx' }
  end
}
