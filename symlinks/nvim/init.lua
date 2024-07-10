-- leader key to space
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- some distance while scrolling
vim.opt.scrolloff = 5

-- use utf-8 encoding
vim.opt.encoding = 'utf-8'

-- fold settings
vim.opt.foldmethod = 'indent'
vim.opt.foldlevel = 99

-- search options
vim.opt.incsearch = true
vim.opt.ignorecase = true
vim.opt.smartcase = true

-- indention configuration
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.updatetime = 300

-- show invisible characters
vim.opt.list = true
vim.opt.listchars = { tab = '» ', trail = '·', nbsp = '␣' }

-- single status line
vim.opt.laststatus = 3

-- Preview substitutions live, as you type!
vim.opt.inccommand = 'split'

-- current dir as working dir
vim.opt.autochdir = true

-- directories
vim.opt.undodir = vim.fn.stdpath('config') .. '/undofiles'
vim.opt.directory = vim.fn.stdpath('config') .. '/swapfiles'
vim.opt.backupdir = vim.fn.stdpath('config') .. '/backupfiles'

-- remove trailing whitespace on save
vim.api.nvim_create_autocmd({ "BufWritePre" }, {
  pattern = { "*" },
  command = [[%s/\s\+$//e]],
})

-- use system clipboard
vim.opt.clipboard = 'unnamedplus'

-- border around floating windows
vim.diagnostic.config({
  float = {
    border = 'single',
  },
})
vim.lsp.handlers['textDocument/hover'] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = 'single' }
)
vim.lsp.handlers['textDocument/signatureHelp'] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = 'single' }
)

-- relative line numbers with auto switching
vim.opt.relativenumber = true
vim.opt.number = true
vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave" }, {
  pattern = { "*" },
  command = [[set relativenumber]],
})
vim.api.nvim_create_autocmd({ "BufLeave", "FocusLost", "InsertEnter" }, {
  pattern = { "*" },
  command = [[set norelativenumber]],
})

-- autoinstall plug.vim
local plug_path = vim.fn.stdpath('data') .. '/site/autoload/plug.vim'
if vim.fn.empty(vim.fn.glob(plug_path)) > 0 then
  vim.cmd('!curl -fLo ' .. plug_path .. ' --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim')
end

-- load plugins
local vim = vim
local Plug = vim.fn['plug#']

vim.call('plug#begin')

Plug('tpope/vim-apathy')
Plug('tpope/vim-fugitive')
Plug('tpope/vim-surround')
Plug('tpope/vim-sleuth') -- Detect tabstop and shiftwidth automatically
Plug('tpope/vim-repeat')
Plug('majutsushi/tagbar')
Plug('cohama/lexima.vim')
Plug('lervag/vimtex')
Plug('github/copilot.vim')
Plug('neomake/neomake')
Plug('lewis6991/gitsigns.nvim')
Plug('stevearc/oil.nvim') -- edit filesystem like a file

-- telescope and dependencies
Plug('nvim-lua/plenary.nvim')
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = ':TSUpdate' })
Plug('nvim-telescope/telescope.nvim')

-- lsp
Plug('neovim/nvim-lspconfig')
Plug('ray-x/lsp_signature.nvim')

-- snippets
Plug('garymjr/nvim-snippets')
Plug('rafamadriz/friendly-snippets')

-- completion
Plug('hrsh7th/cmp-nvim-lsp')
Plug('hrsh7th/cmp-buffer')
Plug('hrsh7th/cmp-path')
Plug('hrsh7th/cmp-cmdline')
Plug('hrsh7th/cmp-nvim-lsp-signature-help')
Plug('hrsh7th/nvim-cmp')

-- colorscheme
Plug('projekt0n/github-nvim-theme')

-- statusline
Plug('nvim-lualine/lualine.nvim')

vim.call('plug#end')

-- keymaps
vim.keymap.set('n', '<leader>df', vim.lsp.buf.format, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>tb', ':TagbarToggle<CR>', {noremap = true, silent = true})
vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, {noremap = true, silent = true})
vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, {noremap = true, silent = true})
vim.keymap.set('n', 'gd', require('telescope.builtin').lsp_definitions, {noremap = true, silent = true})
vim.keymap.set('n', 'gr', require('telescope.builtin').lsp_references, {noremap = true, silent = true})
vim.keymap.set('n', 'gi', require('telescope.builtin').lsp_implementations, {noremap = true, silent = true})
vim.keymap.set('n', 'gt', require('telescope.builtin').lsp_type_definitions, {noremap = true, silent = true})
vim.api.nvim_create_user_command('W', 'w', {})
vim.api.nvim_create_user_command('Wq', 'wq', {})
vim.api.nvim_create_user_command('Q', 'q', {})
vim.api.nvim_create_user_command('Qa', 'qa', {})
vim.keymap.set('n', '<leader>f', require('telescope.builtin').find_files, {})
vim.keymap.set('n', '<leader>b', require('telescope.builtin').buffers, {})
vim.keymap.set('n', '<leader>fg', require('telescope.builtin').live_grep, {})
vim.keymap.set('n', '<leader>fh', require('telescope.builtin').help_tags, {})
vim.keymap.set('n', 'z=', require('telescope.builtin').spell_suggest, {noremap = true, silent = true})

-- clear hightlight from search after pressing <Esc>
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", ":nohlsearch<CR>", {noremap = true, silent = true})

function GermanSpellChecking()
  vim.opt.spelllang = 'de_de'
  vim.opt.spell = true
end

function EnglishSpellChecking()
  vim.opt.spelllang = 'en_us'
  vim.opt.spell = true
end

function SpellCheckingOff()
  vim.opt.spell = false
end

vim.keymap.set("n", "<leader>sg", GermanSpellChecking, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>se", EnglishSpellChecking, {noremap = true, silent = true})
vim.keymap.set("n", "<leader>so", SpellCheckingOff, {noremap = true, silent = true})

-- colorscheme
vim.opt.termguicolors = true
vim.opt.background = 'light'
vim.cmd('colorscheme github_light_high_contrast')
-- vim.cmd('colorscheme minimal_mod')

-- lsp config
vim.lsp.inlay_hint.enable()

-- Function to show diagnostics in the command line
vim.diagnostic.config({
  virtual_text = false,
  underline = true,
  -- Highlight entire line for errors
  -- Highlight the line number for warnings
  signs = {
    text = {
      [vim.diagnostic.severity.ERROR] = '✗',
      [vim.diagnostic.severity.WARN] = '◆',
    },
    linehl = {
      [vim.diagnostic.severity.ERROR] = 'ErrorMsg',
    },
    numhl = {
      [vim.diagnostic.severity.WARN] = 'WarningMsg',
    },
  },
  -- update_in_insert = true,
})

local function truncate_message(message)
  local max_length = vim.v.echospace

  if #message > max_length then
    return message:sub(1, max_length - 3) .. "..."
  end

  return message
end

function ShowDiagnosticsInCommandLine()
  local diagnostics = vim.diagnostic.get(0, {lnum = vim.fn.line('.') - 1})

  if #diagnostics == 0 then
    return
  end

  -- Sort diagnostics by severity
  table.sort(diagnostics, function(a, b)
    return a.severity < b.severity
  end)

  local messages = {}
  for _, diagnostic in ipairs(diagnostics) do
    local source = diagnostic.source or 'Unknown'
    local code = diagnostic.code or ''
    table.insert(messages, string.format("[%s] %s: %s", source, code, diagnostic.message))
  end
  local message = table.concat(messages, ' | ')
  message = truncate_message(message)
  vim.api.nvim_echo({ { message, "WarningMsg" } }, false, {})
end

vim.api.nvim_create_autocmd({"CursorHold", "CursorHoldI"}, {
    callback = ShowDiagnosticsInCommandLine,
    group = vim.api.nvim_create_augroup("ShowDiagnostics", {clear = true}),
})


-- LSP config
local on_attach = function(client, bufnr)
  if client.name == 'pylsp' then
    client.server_capabilities.documentFormattingProvider = false
    client.server_capabilities.documentRangeFormattingProvider = false
    client.server_capabilities.diagnosticProvider = false
  end
  if client.name == 'ruff' then
    client.server_capabilities.hoverProvider = false
  end
end

require('lspconfig').ruff.setup {
  on_attach = on_attach,
  settings = {
    configurationPreference = "filesystemFirst",
  }
}
require('lspconfig').pylsp.setup {
  on_attach = on_attach,
  settings = {
    pylsp = {
      plugins = {
        autopep8 = {
          enabled = false
        },
        flake8 = {
          enabled = false
        },
        mccabe = {
          enabled = false
        },
        pycodestyle = {
          enabled = false
        },
        pyflakes = {
          enabled = false
        },
        pylint = {
          enabled = false
        },
        yapf = {
          enabled = false
        },
        ruff = {
          enabled = false,
          formatEnabled = false
        },
        rope_autoimport = {
          enabled = true
        },
      }
    }
  },
  python = {
    analysis = {
      -- Ignore all files for analysis to exclusively use Ruff for linting
      ignore = { '*' },
    },
  },
}

require('lspconfig').texlab.setup {
  on_attach = on_attach,
}

require('lspconfig').clangd.setup {
  on_attach = on_attach,
}

require('lspconfig').julials.setup {
  on_attach = on_attach,
}

-- snippets
require('snippets').setup({
  create_cmp_source = true,
  friendly_snippets = true,
})

-- completion config
local cmp = require('cmp')

local has_words_before = function()
  unpack = unpack or table.unpack
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0 and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]:sub(col, col):match('%s') == nil
end

cmp.setup({
  completion = {
    autocomplete = false
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-k>'] = cmp.mapping.scroll_docs(-4),
    ['<C-j>'] = cmp.mapping.scroll_docs(4),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping({
       i = function(fallback)
         if cmp.visible() and cmp.get_active_entry() then
           cmp.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = false })
         else
           fallback()
         end
       end,
       s = cmp.mapping.confirm({ select = true }),
       c = cmp.mapping.confirm({ behavior = cmp.ConfirmBehavior.Replace, select = true }),
     }),
    ['<C-Space>'] = cmp.mapping.confirm {
      behavior = cmp.ConfirmBehavior.Insert,
      select = true,
    },
    ['<Tab>'] = function(fallback)
      if not cmp.select_next_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
    ['<S-Tab>'] = function(fallback)
      if not cmp.select_prev_item() then
        if vim.bo.buftype ~= 'prompt' and has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end
    end,
  }),
  sources = cmp.config.sources({
      { name = 'nvim_lsp_signature_help' },
      { name = 'nvim_lsp' },
      { name = 'snippets' },
      { name = 'path' },
    }, {
      { name = 'buffer' },

    }
  ),
  window = {
    completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  -- limit width of completion menu
  formatting = {
    format = function(entry, vim_item)
      vim_item.abbr = string.sub(vim_item.abbr, 1, 30)
    return vim_item
  end
}
})

-- Completion: Use buffer source for `/` and `?` (if you enabled `native_menu`,
-- this won't work anymore).
cmp.setup.cmdline({ '/', '?' }, {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Completion: Use cmdline & path source for ':' (if you enabled `native_menu`,
-- this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  }),
  matching = { disallow_symbol_nonprefix_matching = false }
})

-- Completion: Set up lspconfig.
local capabilities = require('cmp_nvim_lsp').default_capabilities()
require('lspconfig')['ruff'].setup {
  capabilities = capabilities
}
require('lspconfig')['pylsp'].setup {
  capabilities = capabilities
}
require('lspconfig')['texlab'].setup {
  capabilities = capabilities
}
require('lspconfig')['clangd'].setup {
  capabilities = capabilities
}
require('lspconfig')['julials'].setup {
  capabilities = capabilities
}

-- copilot
vim.keymap.set('i', '<Right>', 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false
})
vim.g.copilot_no_tab_map = true

-- vimtex
vim.g.tex_flavor = 'latex'
vim.g.vimtex_view_general_viewer = 'okular'
-- vim.g.vimtex_view_general_options = '--unique file:@pdf\#src:@line@tex'
vim.g.vimtex_complete_enabled = 0

-- tagbar
vim.g.tagbar_sort = 0

-- neomake
vim.g.neomake_open_list = 2

-- gitsigns
require('gitsigns').setup({
  signs_staged_enable = false,
})

-- lsp signature
require('lsp_signature').setup({
  bind = true,
  handler_opts = {
    border = 'single',
  },
  doc_lines = 0,
  floating_window_above_cur_line = true,
  hint_prefix = {
    above = "↙ ",  -- when the hint is on the line above the current line
    current = "← ",  -- when the hint is on the same line
    below = "↖ "  -- when the hint is on the line below the current line
  }
})

-- statusline
require('lualine').setup({
  options = {
    theme = 'onelight',
  },
  sections = {
    lualine_a = {'mode'},
    lualine_b = {'branch', 'diff', 'diagnostics'},
    lualine_c = {
      { 'buffers', mode = 4 },
    },
    lualine_x = {'encoding', 'fileformat', 'filetype'},
    lualine_y = {'progress'},
    lualine_z = {'location'}
  },
})

-- telescope
require('telescope').setup()

-- oil
require("oil").setup()
