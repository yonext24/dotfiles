-- Neo-tree is a Neovim plugin to browse the file system
-- https://github.com/nvim-neo-tree/neo-tree.nvim

return {
  'nvim-neo-tree/neo-tree.nvim',
  version = '*',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-telescope/telescope.nvim',
    'nvim-tree/nvim-web-devicons', -- not strictly required, but recommended
    'MunifTanjim/nui.nvim',
  },
  keys = {
    { '\\', ':Neotree reveal<CR>', desc = 'NeoTree reveal', silent = true },
  },
  config = function()
    require('neo-tree').setup {
      window = {
        width = 20,
        mappings = {
          ['<space>'] = 'none',
          ['<leader>'] = 'none',
          ['\\'] = 'close_window',
          ['m'] = {
            'move',
            nowait = true,
            config = {
              show_path = 'relative',
            },
          },
        },
      },
    }
  end,
}
