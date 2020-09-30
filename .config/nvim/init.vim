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
set scrolloff=10
" set cursorline
set shortmess+=c
set shell=/bin/bash
set mouse-=a
set lazyredraw
set ttyfast

" set tabs(as spaces) sizes
set tabstop=2 softtabstop=2
set shiftwidth=2
set smartindent
set expandtab

" display line numbers
set number
set relativenumber

" lower update times for a better experience
set updatetime=50

" line length gutter. 
set colorcolumn=80

" mappings with leader key
let mapleader = " "

" jump back to where you left off
" from: https://askubuntu.com/a/202077
au BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

call plug#begin()
" Plug 'co1ncidence/monokai-pro.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'co1ncidence/monokai-pro.vim'

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

" languages
Plug 'nvim-treesitter/nvim-treesitter'
call plug#end()

" -----------------------------------------------------------------------------
" appearance
" -----------------------------------------------------------------------------
hi clear
if exists("syntax_on") 
 syntax reset 
endif
set termguicolors
set background=dark
colorscheme monokai-pro

" -----------------------------------------------------------------------------
" lightline
" -----------------------------------------------------------------------------

" echo g:lightline#colorscheme#rosepine#palette
" configure lightline
" \ 'colorscheme': 'monokai-pro',
let g:lightline = {
  \ 'active': {
  \   'left': [ [ 'mode', 'cocstatus' ], 
  \             [ 'readonly', 'filename', 'modified' ] ],
  \   'right': [
  \     [ 'lineinfo' ],
  \     [ 'percent' ],
  \     [ 'filetype' ],
  \   ] 
  \ },
  \ 'component_function': {
  \   'filetype': 'FileType',
  \   'cocstatus': 'coc#status',
  \ }
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

" format go code on save
autocmd BufWritePre *.go :call CocAction('runCommand', 'editor.action.organizeImport')

" -----------------------------------------------------------------------------
" binds
" -----------------------------------------------------------------------------

" movement and reiszing across splits
nnoremap <leader>h :wincmd h<CR>
nnoremap <leader>j :wincmd j<CR>
nnoremap <leader>k :wincmd k<CR>
nnoremap <leader>l :wincmd l<CR>

noremap <leader>H :vertical resize +5<CR>
noremap <leader>J :resize -5<CR>
noremap <leader>K :resize +5<CR>
noremap <leader>L :vertical resize -5<CR>

" other bindings
nnoremap <leader>p :GFiles --cached --others --exclude-standard<CR>
nnoremap <leader>f :Rg<space>
nnoremap <leader>g :Goyo<CR>
nnoremap <leader>u :UndotreeShow <bar> :UndotreeFocus<CR>

" <c-space> to trigger completion.
inoremap <silent><expr> <C-space> coc#refresh()
" coc bindings
nmap <silent>gd <Plug>(coc-definition)
nmap <silent>gy <Plug>(coc-type-definition)
nmap <silent>gi <Plug>(coc-implementation)
nmap <silent>gr <Plug>(coc-references)
nmap <leader>rn <Plug>(coc-rename)

" map <ESC> in terminal
tnoremap <ESC> <C-\><C-n>

" goyo hooks
function! s:goyo_enter()
  set wrap linebreak

  let b:quitting = 0
  let b:quitting_bang = 0
  autocmd QuitPre <buffer> let b:quitting = 1
  cabbrev <buffer> q! let b:quitting_bang = 1 <bar> q!
endfunction

function! s:goyo_leave()
  set nowrap nolinebreak

  " Quit Vim if this is the only remaining buffer
  if b:quitting && len(filter(range(1, bufnr('$')), 'buflisted(v:val)')) == 1
    if b:quitting_bang
      qa!
    else
      qa
    endif
  endif
endfunction

autocmd! User GoyoEnter call <SID>goyo_enter()
autocmd! User GoyoLeave call <SID>goyo_leave()
