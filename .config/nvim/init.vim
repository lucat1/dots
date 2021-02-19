" sane dafaults
set noerrorbells
set noshowmatch
set noshowmode
set hidden
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set nohlsearch
set incsearch
set shortmess+=c
set shell=/bin/bash

" set tabs(as spaces) sizes
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

" display line numbers
set number
set relativenumber

set updatetime=50
set colorcolumn=80
set scrolloff=5

" mappings with leader key
let mapleader = " "

call plug#begin()
Plug 'lifepillar/vim-gruvbox8'

" essentials (status line, commenter, zen mode)
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'tpope/vim-commentary'

" lsp & navigation
Plug 'neovim/nvim-lspconfig'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

" languages
Plug 'sheerun/vim-polyglot'
call plug#end()

" -----------------------------------------------------------------------------
" appearance
" -----------------------------------------------------------------------------
set termguicolors
set background=dark
colorscheme gruvbox8

" -----------------------------------------------------------------------------
" lightline
" -----------------------------------------------------------------------------

" configure lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox8',
  \ 'active': {
  \   'left': [ [ 'mode' ], 
  \             [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'filetype' ],
  \   ] 
  \ }
\ }

" -----------------------------------------------------------------------------
" nvim lsp
" -----------------------------------------------------------------------------

" neovim native LSPs
lua << EOF
  local lspconfig = require('lspconfig')
  local completion = require('completion')

  local servers = {'gopls', 'clangd', 'texlab'}
  for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup {
      on_attach = completion.on_attach,
    }
  end
EOF

au BufWritePre *.h,*.hpp,*.c,*.cpp,*.go lua vim.lsp.buf.formatting_sync(nil, 1000)

" autocomplete settings
set completeopt=menuone,noinsert,noselect
let g:completion_matching_strategy = ['exact', 'substring', 'fuzzy']

" -----------------------------------------------------------------------------
" binds
" -----------------------------------------------------------------------------

" movement and reiszing across splits
noremap <leader>H :vertical resize +5<CR>
noremap <leader>J :resize -5<CR>
noremap <leader>K :resize +5<CR>
noremap <leader>L :vertical resize -5<CR>

" other bindings
nnoremap <leader>p <cmd>Telescope find_files<cr>
nnoremap <leader>f <cmd>Telescope live_grep<cr>
nnoremap <leader>g :Goyo<CR>

" coc bindings
nnoremap <silent>gd <cmd>lua vim.lsp.buf.declaration()<CR>
nnoremap <silent>gr <cmd>lua vim.lsp.buf.references()<CR>
nnoremap <silent>r <cmd>lua vim.lsp.buf.rename()<CR>
nnoremap <silent>K  <cmd>lua vim.lsp.buf.hover()<CR>
