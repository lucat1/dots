call plug#begin()
" my colorscheme (github on the macbook)
" Plug 'gruvbox-community/gruvbox'
Plug 'rakr/vim-one'

" essentials (status line, commenter, zen mode)
Plug 'itchyny/lightline.vim'
Plug 'tpope/vim-commentary'
Plug 'junegunn/goyo.vim'

" lsp
Plug 'neoclide/coc.nvim', {'branch': 'release'}

" version tracking features
Plug 'airblade/vim-gitgutter'
Plug 'mbbill/undotree'

" navigation
Plug 'jremmen/vim-ripgrep'
Plug 'ctrlpvim/ctrlp.vim'

" icons
Plug 'ryanoasis/vim-devicons'

" language-specific 
Plug 'pangloss/vim-javascript'
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'jparise/vim-graphql'
Plug 'fatih/vim-go'
Plug 'lervag/vimtex'
call plug#end()

" remove arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" sane dafaults
set noshowmatch
set relativenumber
set nohlsearch
set hidden
set nowrap
set smartcase
set noswapfile
set nobackup
set nowritebackup
set undodir=~/.config/nvim/undodir
set undofile
set incsearch
set termguicolors
set scrolloff=10
set cursorline

" set tabs(as spaces) sizes
set noerrorbells
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

" display line numbers
set number
set relativenumber
" set line gutter size
set numberwidth=4

" lower update times for a better experience
" don't pass messages to autocomplete dialogs 
set updatetime=50
set shortmess+=c

" line length gutter. 
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" set the colorscheme *dark*
colorscheme one 
set background=light

" make comments and certain pieces of code italic (Operator Mono)
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

" configure lightline
set noshowmode
" set lightline sections
" \ 'colorscheme': 'github',
let g:lightline = {
  \ 'colorscheme': 'one',
  \ 'active': {
  \   'left': [ [ 'mode' ], 
  \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'filetype' ],
  \   ] 
  \ },
  \ 'component_function': {
  \   'filetype': 'MyFiletype',
  \   'cocstatus': 'coc#status',
  \ },
  \ 'separator': {'left': '', 'right': ''}
  \ }

function! MyFiletype()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

" coc definition/warning on hover
" from: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(500, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" additional coc configurations
" Use tab for trigger completion with characters ahead and navigate.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" jump back to where you left off
" from: https://askubuntu.com/a/202077
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif

" disable vim-go gopls process
let g:go_def_mapping_enabled = 0
let g:go_code_completion_enabled = 0

" alias .svelte to html
au! BufNewFile,BufRead *.svelte set ft=html

" format c files on save
function FormatBuffer()
  if &modified && !empty(findfile('.clang-format', expand('%:p:h') . ';'))
    let cursor_pos = getpos('.')
    :%!clang-format
    call setpos('.', cursor_pos)
  endif
endfunction
autocmd BufWritePre *.h,*.hpp,*.c,*.cpp :call FormatBuffer()

" ctrlp configuration
set wildignore+=node_modules
" from: https://github.com/ctrlpvim/ctrlp.vim/issues/417#issuecomment-388484625
if executable('rg')
  let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
endif

" mappings with leader key
let mapleader = " "

" netrw config. Keep the tree viewer simple
let g:netrw_browse_split = 2
let g:vrfr_rg = 'true'
let g:netrw_banner = 0
let g:netrw_winsize = 25
let g:netrw_liststyle=3

" switch splits with leader
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

" zen mode
nnoremap <leader>g :Goyo<CR>

" configure vim for LaTeX
let g:tex_flavor = 'latex'
let g:vimtex_view_method = 'zathura'
let g:vimtex_quickfix_open_on_warning = 0

" toggle tree viewer/undo with leader
nnoremap <leader>t :Fern . -drawer -toggle<CR>
nnoremap <leader>u :UndotreeShow <bar> :UndotreeFocus <CR>
nnoremap <leader>f :Rg <space>
