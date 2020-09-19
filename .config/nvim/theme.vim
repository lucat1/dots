" custom rose-pine inspired colorscheme

" enable true color
hi clear
if exists("syntax_on") 
 syntax reset 
endif
set termguicolors
set background=dark

" color definitions
let s:bg = '#191724'
let s:bg_highlight = '#5752790a'
let s:surface = '#1F1D2D'
let s:fg = '#E0DEF4'
let s:fg_subtle = '#e0def466'
let s:fg_inactive = '#706e86'
let s:gray = '#706e86'

let s:rose = '#ebbcba'
let s:pine = '#31748f'
let s:foam = '#9ccfd8'
let s:iris = '#c4a7e7'
let s:love = '#eb6f92'
let s:leaf = '#f6c177'
let s:gold = '#f6c177'

exe 'hi Normal guifg='s:fg' guibg='s:bg
exe 'hi Cursor guifg='s:bg' guibg='s:fg
exe 'hi LineNr guifg='s:gray' gui=bold'
" re-enable if I readd cursorline
" exe 'hi CursorLine guibg='s:theme_surface
exe 'hi CursorLineNR guifg='s:fg_subtle' guibg='s:surface
" (usually 80) char gutter limit
exe 'hi ColorColumn guibg='s:surface 
exe 'hi VertSplit guibg='s:gray' guifg='s:bg
exe 'hi MatchParen guifg='s:fg_inactive'  gui=underline'
exe 'hi Pmenu guifg='s:fg_subtle' guibg='s:surface
exe 'hi PmenuSel guifg='s:fg' guibg='s:bg_highlight

exe 'hi Boolean guifg='s:rose
exe 'hi Character guifg='s:rose
exe 'hi Constant guifg='s:rose
exe 'hi Comment guifg='s:fg_inactive' gui=italic'
exe 'hi Conditional guifg='s:pine
exe 'hi Define guifg='s:pine
" exe 'hi DiffAdd guifg=#fafafa guibg=#123d0f gui=bold'
" exe 'hi DiffDelete guibg='s:bg2
" exe 'hi DiffChange  guibg=#151b3c guifg=#fafafa'
" exe 'hi DiffText guifg=#ffffff guibg=#ff0000 gui=bold'
" exe 'hi ErrorMsg guifg='s:warning' guibg='s:bg2' gui=bold'
" exe 'hi WarningMsg guifg='s:fg' guibg='s:warning2
exe 'hi Float guifg='s:rose
exe 'hi Function guifg='s:love
exe 'hi goFunctionCall guifg='s:rose
exe 'hi Identifier guifg='s:foam'  gui=italic'
exe 'hi Keyword guifg='s:pine'  gui=bold'
exe 'hi Label guifg='s:rose' gui=italic'
exe 'hi Number guifg='s:rose
exe 'hi Operator guifg='s:pine
exe 'hi PreProc guifg='s:pine
exe 'hi Special guifg='s:fg
" exe 'hi SpecialKey guifg='s:fg2' guibg='s:bg2
exe 'hi Statement guifg='s:pine
exe 'hi StorageClass guifg='s:foam'  gui=italic'
exe 'hi String guifg='s:leaf
exe 'hi Tag guifg='s:pine
exe 'hi Title guifg='s:fg'  gui=bold'
exe 'hi Todo guibg='s:bg' guifg='s:love' gui=inverse,bold'
exe 'hi Type guifg='s:foam' gui=italic'
exe 'hi Underlined gui=underline'

" (git gutter and coc warnings) clear bg/fg
" also make html args/params italic
hi clear SignColumn
hi htmlArg gui=italic

" lightline colorscheme
let s:p = {'normal': {}}
let s:p.normal.left = [ [ s:fg, s:rose, 'NONE', 'NONE' ] ]
let s:p.normal.middle = [ [ s:fg, s:bg, 'NONE', 'NONE' ] ]
let s:p.normal.right = [ [ s:fg, s:pine, 'NONE', 'NONE' ] ]
let g:lightline#colorscheme#rosepine#palette = lightline#colorscheme#fill(s:p)
