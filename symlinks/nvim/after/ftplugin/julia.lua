vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- F9 for saving and running Julia code
vim.api.nvim_set_keymap('n', '<F9>', ':w<CR>:term julia %<CR>:norm G<CR>', { noremap = true})
