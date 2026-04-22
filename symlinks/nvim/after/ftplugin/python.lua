vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- F9 for saving and running Python code
vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:lua run_python()<CR>', { noremap = true })

function run_python()
  local filename = vim.fn.expand('%:p')
  -- `cd` to the file's directory before running
  -- useful for running code that relies on relative imports or file paths
  local filedir = vim.fn.expand('%:p:h')
  if vim.fn.executable('ipython') == 1 then
    vim.cmd('term cd ' .. filedir .. ' && ipython --pdb ' .. filename)
  else
    vim.cmd('term cd ' .. filedir .. ' && python ' .. filename)
  end
end
