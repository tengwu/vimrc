"""Vundle"""
set nocompatible 
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
"在之后安装插件

Plugin 'VundleVim/Vundle.vim' "管理自己

Plugin 'https://github.com/Lokaltog/vim-powerline.git'
Plugin 'The-NERD-tree'
Plugin 'octol/vim-cpp-enhanced-highlight'
Plugin 'scrooloose/nerdcommenter'
Plugin 'Raimondi/delimitMate'
Plugin 'honza/vim-snippets'
Plugin 'mattn/emmet-vim'
Plugin 'chrisbra/vim-diff-enhanced'
Plugin 'whatot/gtags-cscope.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'mhinz/vim-signify'
Plugin 'mileszs/ack.vim'

"在这之前安装插件
call vundle#end()
filetype plugin on
" 常用命令
" :PluginList 		-查看已经安装的插件
" :PluginInstall 	-安装插件
" :PluginUpdate 	-更新插件
" :PluginSearch 	-搜索插件
" :PluginClean 		-删除插件
" h: vundle 		-获取帮助
" vundle配置完毕，在下面写自己的配置
""""""""""""""""""""""
colorscheme molokai
set number
set cursorcolumn
set cursorline
set tabstop=4
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

nmap <leader>s <Esc>:Ack! 

" 窗口光标控制
nnoremap <C-j> <Esc><C-w>j
nnoremap <C-k> <Esc><C-w>k
nnoremap <C-h> <Esc><C-w>h
nnoremap <C-l> <Esc><C-w>l
set expandtab " 将制表符扩展为空格
set shiftwidth=4 " 设置格式化时的tab为4个空格
set softtabstop=4 " 把连续数量的空格视为一个制表符
set foldmethod=syntax " 基于语法进行代码折叠
set nofoldenable " 启动vim时关闭折叠

" vim-powerline
set nocompatible   " 不向下兼容
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
let g:Powerline_symbols = 'unicode'
let g:Powerline_colorscheme = 'solarized256'
let g:Powerline_stl_path_style = 'short'
set t_Co=256

"vim The-NERD-tree 目录树

" 如果当前没文件时,自动打开
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" map <C-n> :NERDTreeToggle<CR>  " 映射`ctrl+c`快捷键
noremap <F4> :NERDTreeToggle<CR>
let g:nerdtree_tabs_smart_startup_focus = 1     
let NERDTreeAutoCenter=1       " nerdtree 光标所在的位置默认在窗口中间

" ack搜索结果高亮
let g:ackhighlight = 1
hi Search term=standout ctermfg=0 ctermbg=3 " 设置搜索结果高亮颜色

" snippets 补全，依赖py3，暂不使用
" let g:UltiSnipsExpandTrigger="<c-e>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"

set mouse=a
