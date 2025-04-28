local T = {}

T.setup = function()
  vim.api.nvim_create_autocmd('TermOpen', {
    group = vim.api.nvim_create_augroup('custorm-term-open', { clear = true }),
    callback = function()
      vim.opt.number = false
      vim.opt.relativenumber = false
    end,
  })

  local job_id = nil
  vim.keymap.set('n', '<leader>to', function()
    vim.cmd.vnew()
    vim.cmd.term()
    vim.cmd.wincmd 'J'
    vim.api.nvim_win_set_height(0, 10)

    job_id = vim.bo.channel
  end, { desc = '[t]erminal: [o]pen' })

  vim.keymap.set('n', '<leader>tl', function()
    if job_id ~= nil then
      vim.cmd('call chansend(' .. job_id .. ', "\x1b\x5b\x41\\<cr>")')
    end
  end, { desc = '[t]erminal: run [l]ast command' })
end

return T
