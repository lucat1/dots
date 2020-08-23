" sane dafaults
set noerrorbells
set noshowmatch
set noshowmode
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
set shortmess+=c
set mouse=a

" set tabs(as spaces) sizes
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
set updatetime=50

" line length gutter. 
set colorcolumn=80
highlight ColorColumn ctermbg=0 guibg=lightgrey

" mappings with leader key
let mapleader = " "

" jump back to where you left off
" from: https://askubuntu.com/a/202077
if has("autocmd")
  au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
endif


call plug#begin()
" my colorscheme (the one and only colorscheme)
" + other purely visual extensions
Plug 'gruvbox-community/gruvbox'
Plug 'ryanoasis/vim-devicons'

" essentials (status line, commenter, zen mode)
Plug 'itchyny/lightline.vim'
Plug 'junegunn/goyo.vim'
Plug 'mbbill/undotree'
Plug 'tpope/vim-commentary'

" lsp & navigation
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'stsewd/fzf-checkout.vim'
" getting errors unfortunately
" Plug 'antoinemadec/coc-fzf'

" version tracking features
Plug 'airblade/vim-gitgutter'

" languages
Plug 'sheerun/vim-polyglot'
call plug#end()

" -----------------------------------------------------------------------------
" appearance
" -----------------------------------------------------------------------------

let g:gruvbox_contrast_dark = 'hard'
if exists('+termguicolors')
    let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
    let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif
let g:gruvbox_invert_selection='0'
colorscheme gruvbox
set background=dark

" make comments and certain pieces of code italic (Operator Mono)
hi htmlArg gui=italic
hi Comment gui=italic
hi Type    gui=italic
hi htmlArg cterm=italic
hi Comment cterm=italic
hi Type    cterm=italic

" -----------------------------------------------------------------------------
" lightline
" -----------------------------------------------------------------------------

" configure lightline
let g:lightline = {
  \ 'colorscheme': 'gruvbox',
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
  \   'filetype': 'FileType',
  \   'cocstatus': 'coc#status',
  \ },
  \ 'separator': {'left': '', 'right': ''}
  \ }

function! FileType()
  return winwidth(0) > 70 ? (strlen(&filetype) ? &filetype . ' ' . WebDevIconsGetFileTypeSymbol() : '') : ''
endfunction

" -----------------------------------------------------------------------------
" coc & fzf
" -----------------------------------------------------------------------------

" definition/warning on hover
" from: https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
function! ShowDocIfNoDiagnostic(timer_id)
  if (coc#util#has_float() == 0)
    silent call CocActionAsync('doHover')
  endif
endfunction

function! s:show_hover_doc()
  call timer_start(750, 'ShowDocIfNoDiagnostic')
endfunction

autocmd CursorHoldI * :call <SID>show_hover_doc()
autocmd CursorHold * :call <SID>show_hover_doc()

" prettier format command
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" quick fzf config
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8 } }
let $FZF_DEFAULT_OPTS='--reverse'
let g:fzf_checkout_track_key = 'ctrl-t'

" -----------------------------------------------------------------------------
" language specific
" -----------------------------------------------------------------------------

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

" go (vim polyglot) config
let g:go_highlight_build_constraints = 1
let g:go_highlight_extra_types = 1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_methods = 1
let g:go_highlight_operators = 1
let g:go_highlight_structs = 1
let g:go_highlight_types = 1
let g:go_highlight_function_parameters = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_generate_tags = 1
let g:go_highlight_format_strings = 1
let g:go_highlight_variable_declarations = 1
let g:go_auto_sameids = 1

" -----------------------------------------------------------------------------
" binds
" -----------------------------------------------------------------------------

" manage splits with leader
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>
nnoremap <leader>+ :vertical resize +5<CR>
nnoremap <leader>- :vertical resize -5<CR>

" other bindings
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>u :UndotreeShow <bar> :UndotreeFocus <CR>
nnoremap <leader>f :Rg <space>
nnoremap <C-p> :GFiles<CR>

" <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()
" coc bindings
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
" renaming.
nmap <leader> rn <Plug>(coc-rename)
