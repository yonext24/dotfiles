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
