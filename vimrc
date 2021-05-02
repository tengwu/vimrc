""" vim-plug """
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'bling/vim-airline'
Plug 'vim-airline/vim-airline-themes' " airline主题
" Plug 'powerline/powerline'
Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'scrooloose/nerdcommenter'
Plug 'Raimondi/delimitMate'
Plug 'honza/vim-snippets'
Plug 'mattn/emmet-vim'
Plug 'chrisbra/vim-diff-enhanced'
Plug 'whatot/gtags-cscope.vim'
" Plug 'kien/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'mhinz/vim-signify'
Plug 'rking/ag.vim'
" Plug 'ycm-core/YouCompleteMe'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
" Plug 'garbas/vim-snipmate' " 代码补全
Plug 'nathanaelkane/vim-indent-guides'
Plug 'vim-scripts/taglist.vim'
Plug 'majutsushi/tagbar'
Plug 'flazz/vim-colorschemes' " 管理主题
Plug 'Yggdroot/LeaderF', { 'do': './install.sh' } " 查找文件 & 自动生成gtags
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " go语言语法检查 & 高亮

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
set backspace=indent,eol,start " 解决退格键不能用的问题
hi Search term=reverse ctermbg=7 guibg=LightGrey " 搜索高亮颜色
filetype indent on " 自适应不同语言的缩进
" 以下几个按键映射目前不会用到，暂时屏蔽
" nnoremap <F5>   <Esc>:w<CR>:!g++ -std=c++11 % -o /tmp/a.out && /tmp/a.out<CR>
" nnoremap <F7>   <Esc>:w<CR>:!g++ -std=c++11 %<CR>
" nnoremap <C-F5> <Esc>:w<CR>:!g++ -std=c++11 -g % -o /tmp/a.out && gdb /tmp/a.out<CR>
" 设置键绑定 全选
" map <F4> :<ESC>ggVG"+y

" gtags按键绑定
nmap <C-a> :Gtags<CR><CR>
nmap <C-n> :cn<CR>
nmap <C-m> :cp<CR>
nmap <C-t> :Gtags -f<CR>

nmap <leader>s <Esc>:Ag! 
" nmap <leader>t :TlistToggle<CR>
nmap <leader>t :TagbarToggle<CR>
imap kj <Esc>

" 窗口光标控制
nnoremap <C-j> <Esc><C-w>j
nnoremap <C-k> <Esc><C-w>k
nnoremap <C-h> <Esc><C-w>h
nnoremap <C-l> <Esc><C-w>l
set expandtab " 将制表符扩展为空格
set shiftwidth=2 " 设置格式化时的tab为4个空格
set softtabstop=2 " 把连续数量的空格视为一个制表符
set foldmethod=syntax " 基于语法进行代码折叠
set nofoldenable " 启动vim时关闭折叠

" 自动生成gtags索引
let g:Lf_GtagsAutoGenerate = 1

" vim-powerline
" set laststatus=2   " Always show the statusline
" set encoding=utf-8 " Necessary to show Unicode glyphs
" let g:Powerline_symbols = 'unicode'
" let g:Powerline_colorscheme = 'solarized256'
" let g:Powerline_stl_path_style = 'short'
" set t_Co=256

let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'

"vim The-NERD-tree 目录树

" 如果当前没文件时,自动打开
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map <C-n> :NERDTreeToggle<CR>  " 映射`ctrl+c`快捷键
noremap <leader>n :NERDTreeToggle<CR>
let g:nerdtree_tabs_smart_startup_focus = 1     
let NERDTreeAutoCenter=1       " nerdtree 光标所在的位置默认在窗口中间

" ack搜索结果高亮
let g:ackhighlight = 1
hi Search term=standout ctermfg=0 ctermbg=3 " 设置搜索结果高亮颜色

" snippets 补全，依赖py3，暂不使用
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" set mouse=a

" airline主题
let g:airline_theme = "molokai"

set guifont=Menlo\ Regular:h19

" use system clipboard
set clipboard+=unnamedplus
