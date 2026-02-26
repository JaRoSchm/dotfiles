vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- F9 for saving and running Python code
vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:lua run_python()<CR>', { noremap = true })

function run_python()
  local filename = vim.fn.expand('%:p')
  if vim.fn.executable('ipython') == 1 then
    vim.cmd('term ipython --pdb ' .. filename)
  else
    vim.cmd('term python ' .. filename)
  end
end
