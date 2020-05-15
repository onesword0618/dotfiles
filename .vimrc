"""kill default setting
set all&

""" basic
filetype on
syntax on
set number
set ruler
set cursorline
set cursorcolumn
set laststatus=2 "Always
set list
set listchars=tab:▸\ ,eol:↲,extends:❯,precedes:❮
set backspace=indent,eol,start
set showmatch
set cmdheight=2
set helpheight=999
set clipboard=unnamedplus "system clipboard

""" indent
set foldmethod=indent

""" commandline↲
set wildmenu wildmode=list:longest,full
set history=10000

""" key mapping
""" moving windows
noremap <c-h> <c-w><c-h>
noremap <c-j> <c-w><c-j>
noremap <c-k> <c-w><c-k>
noremap <c-l> <c-w><c-l>

inoremap ' ''<esc>i
inoremap " ""<esc>i
inoremap ( ()<esc>i
inoremap { {}<esc>i
inoremap [ []<esc>i

let mapleader=','
