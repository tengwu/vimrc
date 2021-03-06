""" vim-plug """
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes' " airline主题
Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate' " auto-completion for quotes, parens, brackets, etc.
Plug 'SirVer/ultisnips'
Plug 'keelii/vim-snippets'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes' " 管理主题
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'terryma/vim-multiple-cursors'
Plug 'tengwu/cscope.vim'
Plug 'voldikss/vim-translator' " 翻译
Plug 'voldikss/vim-floaterm' " vim-translator 浮动窗口依赖

" Initialize plugin system
call plug#end()
""""""""""""""""""""""

let mapleader=";"
colorscheme molokai
set number
set cursorcolumn
set cursorline
set colorcolumn=81
set tabstop=2
syntax on
set hlsearch " 搜索高亮
set incsearch " 增量搜索
set backspace=indent,eol,start " 解决退格键不能用的问题
hi Search term=reverse ctermbg=7 guibg=LightGrey " 搜索高亮颜色
filetype indent on " 自适应不同语言的缩进
" 以下几个按键映射目前不会用到，暂时屏蔽
" nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
" nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>
" nnoremap <C-F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
" 设置键绑定 全选
map <leader>a :<ESC>ggVGy

" vim quit
map S <Esc>:w<CR>
map Q <Esc>:q<CR>

" 窗口光标控制
nnoremap <C-j> <Esc><C-w>j
nnoremap <C-k> <Esc><C-w>k
nnoremap <C-h> <Esc><C-w>h
nnoremap <C-l> <Esc><C-w>l

imap kj <Esc>

set expandtab " 将制表符扩展为空格
set shiftwidth=2 " 设置格式化时的tab为4个空格
set softtabstop=2 " 把连续数量的空格视为一个制表符
set foldmethod=syntax " 基于语法进行代码折叠
set nofoldenable " 启动vim时关闭折叠

"vim The-NERD-tree 目录树

"" 如果当前没文件时,自动打开
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
"
"let g:NERDSpaceDelims = 1
"let g:NERDDefaultAlign = 'left'
"
noremap <leader>n :NERDTreeToggle<CR>
"let g:nerdtree_tabs_smart_startup_focus = 1
"let NERDTreeAutoCenter=1       " nerdtree 光标所在的位置默认在窗口中间

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" airline主题
let g:airline_theme = "molokai"

set guifont=Menlo\ Regular:h19

" use system clipboard
set clipboard+=unnamedplus

" for cmd completation
set wildmenu

set scrolloff=5


nnoremap L :call ToggleLocationList()<CR>

" s: Find this C symbol
nnoremap  <leader>gs :call CscopeFind('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>gd :call CscopeFind('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>gf :call CscopeFind('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>ga :call CscopeFind('c', expand('<cword>'))<CR>
" t: Find this text string
nnoremap  <leader>gt :call CscopeFind('t', expand('<cword>'))<CR>
" e: Find this egrep pattern
nnoremap  <leader>ge :call CscopeFind('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>gf :call CscopeFind('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>gi :call CscopeFind('i', expand('<cword>'))<CR>

nnoremap  \ :lprevious<CR>
nnoremap  ` :lnext<CR>

" vim-translator
" let g:translator_history_enable = v:true
" let g:translator_proxy_url = 'socks5://127.0.0.1:7890'
" let g:translator_window_type = 'popup'
