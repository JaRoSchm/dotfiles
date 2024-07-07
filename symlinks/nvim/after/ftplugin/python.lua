vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- F9 for saving and running Python code
-- if vim.fn.executable('ipython') then
--   vim.api.nvim_set_keymap('n', '<F9>', ':exec "!ipython --pdb" shellescape(@%, 1)<CR>', { noremap = true})
-- else
--   vim.api.nvim_set_keymap('n', '<F9>', ':exec "!python" shellescape(@%, 1)<CR>', { noremap = true})
-- end
vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:exec "!python" shellescape(@%, 1)<CR>', { noremap = true})

vim.opt.list = true
vim.opt.listchars = { tab = '▷⋅', trail = '⋅', nbsp = '⋅' }
