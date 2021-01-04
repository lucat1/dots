require 'utils'

-- setting up packer.nvim
vim.cmd [[packadd packer.nvim]]
require('packer').startup(function()
  -- Packer can manage itself as an optional plugin
  use {'wbthomason/packer.nvim', opt = true}

  -- lazy load Goyo only when called
  use {'junegunn/goyo.vim', opt = true, cmd = 'Goyo'}

  -- glorious gruvbox (gruvbox8 is a lighter remake)
  use 'tpope/vim-commentary'
  -- essentials
  use 'lifepillar/vim-gruvbox8'

  -- lsp, syntax highlighting and fuzzy finding
  use 'neovim/nvim-lspconfig'
  use 'nvim-lua/completion-nvim'
  use 'nvim-treesitter/nvim-treesitter'
  use {
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/popup.nvim', 'nvim-lua/plenary.nvim'}
  }
end)

local lspconfig = require 'lspconfig'
local completion = require'completion'
require 'utils'

-- sane dafaults
vim.wo.wrap = false
vim.o.hidden = true
vim.o.scrolloff = 10
vim.o.showmode = false
vim.o.completeopt = "menuone,noinsert,noselect"
-- set lazyredraw ttyfast mouse-=a shell=/bin/bash shortmes+=c
-- lower update times for a better experience
vim.o.updatetime = 50
-- search stuff
vim.o.smartcase = true
vim.o.hlsearch = false
vim.o.incsearch = true
-- disable swapfiles and enable undodir
vim.o.swapfile = false
vim.o.undodir = "/home/luca/.config/nvim/undodir"
vim.o.undofile = true
vim.o.backup = false
vim.o.writebackup = false

-- line numbers, ruler and tabs
vim.wo.number = true
vim.wo.relativenumber = true
vim.wo.colorcolumn = "80"
vim.bo.tabstop = 2
vim.bo.softtabstop = 0
vim.bo.shiftwidth = 2
vim.bo.smartindent = true
vim.bo.expandtab = true

-- colorscheme
vim.o.termguicolors = true
vim.o.background = "dark"
vim.cmd 'colorscheme gruvbox8'
vim.g.gruvbox_italics = true

-- mappings with leader key and all binds
vim.g.mapleader = " "
vim.api.nvim_set_keymap('n', '<leader>p', ':lua require \'telescope.builtin\'.git_files()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>f', ':lua require \'telescope.builtin\'.live_grep()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>h', ':wincmd h<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>j', ':wincmd j<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>k', ':wincmd k<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>l', ':wincmd l<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>J', ':vertical resize -5<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', '<leader>K', ':vertical resize +5<CR>', { noremap = true })

-- <c-space> to trigger completion.
-- imap <silent><c-space> <Plug>(completion_trigger)
vim.api.nvim_set_keymap('n', 'gd', ':lua vim.lsp.buf.declaration()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gf', ':lua vim.lsp.buf.definition()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', 'gr', ':lua require \'telescope.builtin\'.lsp_references()<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<leader>rn', ':lua vim.lsp.buf.rename()<CR>', { noremap = true })
vim.api.nvim_set_keymap('n', 'K', ':lua vim.lsp.buf.hover()<CR>', { noremap = true, silent = true })

-- language servers and auto format extensions
local servers = {'gopls', 'clangd'}
local format_extensions = {'*.h' ,'*.hpp', '*.c', '*.cpp', '*.go'}
nvim_create_augroups({
  format = {
    {
      'BufWritePre',
       table.concat(format_extensions, ','),
      'lua vim.lsp.buf.formatting_sync(nil, 1000)'
    }
  },
  getback = {
    {
      'BufReadPost',
      '*',
      'if line("\'\\"") > 0 && line("\'\\"") <= line("$") | exe "normal! g`\\"" | endif'
    }
  }
})

-- native lsp setup
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = completion.on_attach,
  }
end
