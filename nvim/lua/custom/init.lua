local default_options = { noremap = true, silent = true }

local map = function(mode, keys, command, description, options)
  local opts = vim.tbl_extend('force', options or default_options, { desc = description })
  return vim.keymap.set(mode, keys, command, opts)
end

-- Move to previous/next
map('n', '<A-,>', '<Cmd>BufferPrevious<CR>', 'Move to previous buffer')
map('n', '<A-.>', '<Cmd>BufferNext<CR>', 'Move to next buffer')

-- Re-order to previous/next
map('n', '<A-<>', '<Cmd>BufferMovePrevious<CR>', 'Accomodate buffer before')
map('n', '<A->>', '<Cmd>BufferMoveNext<CR>', 'Accomodate buffer after')

-- Goto buffer in position...
for i = 1, 9, 1 do
  map('n', string.format('<A-%d>', i), string.format('<Cmd>BufferGoto %d<CR>', i), string.format('Go to buffer %d', i))
end
map('n', '<A-0>', '<Cmd>BufferLast<CR>', 'Go to last buffer')

-- Pin/unpin buffer
-- map('n', '<A-p>', '<Cmd>BufferPin<CR>', opts)

-- Goto pinned/unpinned buffer
--                 :BufferGotoPinned
--                 :BufferGotoUnpinned

-- Close buffer
map('n', '<A-c>', '<Cmd>BufferClose<CR>', 'Close current buffer')

-- Wipeout buffer
--                 :BufferWipeout

-- Close commands
--                 :BufferCloseAllButCurrent
--                 :BufferCloseAllButPinned
--                 :BufferCloseAllButCurrentOrPinned
--                 :BufferCloseBuffersLeft
--                 :BufferCloseBuffersRight

-- Magic buffer-picking mode
-- map('n', '<C-p>', '<Cmd>BufferPick<CR>', opts)
map('n', '<leader>bp', '<Cmd>BufferPickDelete<CR>', 'Enter close-buffer pick mode')

-- Sort automatically by...
map('n', '<leader>bb', '<Cmd>BufferOrderByBufferNumber<CR>')
map('n', '<leader>bn', '<Cmd>BufferOrderByName<CR>')
map('n', '<leader>bd', '<Cmd>BufferOrderByDirectory<CR>')
map('n', '<leader>bl', '<Cmd>BufferOrderByLanguage<CR>')
map('n', '<leader>bw', '<Cmd>BufferOrderByWindowNumber<CR>')

-- Other:
-- :BarbarEnable - enables barbar (enabled by default)
-- :BarbarDisable - very bad command, should never be used

return {
  telescope_mappings = {
    { keys = '<leader>sh', mapper = 'help_tags', desc = '[s]earch [h]elp' },
    { keys = '<leader>sk', mapper = 'keymaps', desc = '[s]earch [k]eymaps' },
    { keys = '<leader>sf', mapper = 'find_files', desc = '[s]earch [f]iles' },
    { keys = '<leader>ss', mapper = 'builtin', desc = '[s]earch [s]elect telescope' },
    { keys = '<leader>sw', mapper = 'grep_string', desc = '[s]earch current [w]ord' },
    { keys = '<leader>sg', mapper = 'live_grep', desc = '[s]earch by [g]rep' },
    { keys = '<leader>sd', mapper = 'diagnostics', desc = '[s]earch [d]iagnostics' },
    { keys = '<leader>sr', mapper = 'resume', desc = '[s]earch [r]esume' },
    { keys = '<leader>s.', mapper = 'oldfiles', desc = '[s]earch recent files ("." for repeat)' },
    { keys = '<leader>sj', mapper = 'jumplist', desc = '[s]earch [j]umps' },
    { keys = '<leader>sc', mapper = 'command_history', desc = '[s]earch [c]ommand history' },
    { keys = '<leader><leader>', mapper = 'buffers', desc = '[ ] find existing buffers' },
  },
}
