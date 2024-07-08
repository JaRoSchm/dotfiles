vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- F9 for saving and running Python code
if vim.fn.executable('ipython') then
  vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:term ipython --pdb %<CR>:norm G<CR>', { noremap = true})
else
  vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:term python %<CR>:norm G<CR>', { noremap = true})
end
