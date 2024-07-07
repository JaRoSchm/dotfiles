vim.opt.textwidth = 80
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4

-- call neomake on save
vim.api.nvim_create_autocmd(
  { "BufWritePost" },
  { pattern = { "*.tex" }, command = "Neomake!" }
)
