""" vim-plug """
" Specify a directory for plugins
" - For Neovim: stdpath('data') . '/plugged'
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'
Plug 'preservim/nerdtree'
Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Raimondi/delimitMate' " auto-completion for quotes, parens, brackets, etc.
Plug 'chrisbra/vim-diff-enhanced'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'flazz/vim-colorschemes'
Plug 'prabirshrestha/vim-lsp'
Plug 'mattn/vim-lsp-settings'
Plug 'terryma/vim-multiple-cursors'
Plug 'ludovicchabant/vim-gutentags'
Plug 'skywind3000/gutentags_plus'
Plug 'skywind3000/vim-preview'
Plug 'tengwu/vim-utilities'
Plug 'cormacrelf/vim-colors-github'
Plug 'prabirshrestha/asyncomplete.vim' " auto-complete
Plug 'prabirshrestha/asyncomplete-lsp.vim' " python auto-complelte

" Initialize plugin system
call plug#end()
""""""""""""""""""""""

let mapleader=";"
colorscheme github

"" if you use airline / lightline
"let g:airline_theme = "github"

set number
set foldmethod=manual
" set cursorcolumn
set cursorline
" set colorcolumn=81
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

noremap <leader>n :NERDTreeToggle<CR>
"let g:nerdtree_tabs_smart_startup_focus = 1
"let NERDTreeAutoCenter=1       " nerdtree 光标所在的位置默认在窗口中间

noremap <leader>u :call ToggleQuickfixList()<CR>

" snippets
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" for MacVim
set guifont=Menlo\ Regular:h19

" use system clipboard
set clipboard+=unnamedplus

" for cmd completation
set wildmenu

set scrolloff=5


nnoremap  \ :cn<CR>
nnoremap  ` :cp<CR>

" for Gtags or ctags
" gutentags 搜索工程目录的标志，当前文件路径向上递归直到碰到这些文件/目录名
let g:gutentags_project_root = ['.root', '.svn', '.git', '.hg', '.project']

" 所生成的数据文件的名称
let g:gutentags_ctags_tagfile = '.tags'

" 同时开启 ctags 和 gtags 支持：
let g:gutentags_modules = []
" if executable('ctags')
" 	let g:gutentags_modules += ['ctags']
" endif
if executable('gtags-cscope') && executable('gtags')
	let g:gutentags_modules += ['gtags_cscope']
endif

" 将自动生成的 ctags/gtags 文件全部放入 ~/.cache/tags 目录中，避免污染工程目录
let g:gutentags_cache_dir = expand('~/.cache/tags')

" 配置 ctags 的参数，老的 Exuberant-ctags 不能有 --extra=+q，注意
let g:gutentags_ctags_extra_args = ['--fields=+niazS', '--extra=+q']
let g:gutentags_ctags_extra_args += ['--c++-kinds=+px']
let g:gutentags_ctags_extra_args += ['--c-kinds=+px']

" 如果使用 universal ctags 需要增加下面一行，老的 Exuberant-ctags 不能加下一行
let g:gutentags_ctags_extra_args += ['--output-format=e-ctags']

" 禁用 gutentags 自动加载 gtags 数据库的行为
let g:gutentags_auto_add_gtags_cscope = 0

" change focus to quickfix window after search (optional).
let g:gutentags_plus_switch = 1

let g:gutentags_plus_nomap = 1
" Find symbol(reference)
noremap <silent> <leader>gs :GscopeFind s <C-R><C-W><cr>
" Find symbol definition under cursor
noremap <silent> <leader>gg :GscopeFind g <C-R><C-W><cr>
" Functions calling this function
noremap <silent> <leader>gc :GscopeFind c <C-R><C-W><cr>
" Find text string under cursor
noremap <silent> <leader>gt :GscopeFind t <C-R><C-W><cr>
" Find egrep pattern under cursor
noremap <silent> <leader>ge :GscopeFind e <C-R><C-W><cr>
" Find file name under cursor
noremap <silent> <leader>gf :GscopeFind f <C-R>=expand("<cfile>")<cr><cr>
" Find files #including the file name under cursor
noremap <silent> <leader>gi :GscopeFind i <C-R>=expand("<cfile>")<cr><cr>
" Functions called by this function
noremap <silent> <leader>gd :GscopeFind d <C-R><C-W><cr>
" Find places where current symbol is assigned
noremap <silent> <leader>ga :GscopeFind a <C-R><C-W><cr>
" Find current word in ctags database
noremap <silent> <leader>gz :GscopeFind z <C-R><C-W><cr>

" lsp configuration
if executable('pyls')
    " pip install python-language-server
    au User lsp_setup call lsp#register_server({
        \ 'name': 'pyls',
        \ 'cmd': {server_info->['pyls']},
        \ 'allowlist': ['python'],
        \ })
endif

function! s:on_lsp_buffer_enabled() abort
    setlocal omnifunc=lsp#complete
    setlocal signcolumn=yes
    if exists('+tagfunc') | setlocal tagfunc=lsp#tagfunc | endif
    nmap <buffer> gd <plug>(lsp-definition)
    nmap <buffer> gs <plug>(lsp-document-symbol-search)
    nmap <buffer> gS <plug>(lsp-workspace-symbol-search)
    nmap <buffer> gr <plug>(lsp-references)
    nmap <buffer> gi <plug>(lsp-implementation)
    nmap <buffer> gt <plug>(lsp-type-definition)
    nmap <buffer> <leader>rn <plug>(lsp-rename)
    nmap <buffer> [g <plug>(lsp-previous-diagnostic)
    nmap <buffer> ]g <plug>(lsp-next-diagnostic)
    nmap <buffer> K <plug>(lsp-hover)

    let g:lsp_format_sync_timeout = 1000
    autocmd! BufWritePre *.rs,*.go call execute('LspDocumentFormatSync')

    " refer to doc to add more commands
endfunction

augroup lsp_install
    au!
    " call s:on_lsp_buffer_enabled only for languages that has the server registered.
    autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END

inoremap <expr> <Tab>   pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
inoremap <expr> <cr>    pumvisible() ? asyncomplete#close_popup() : "\<cr>"

" code fold
set foldmethod=expr
  \ foldexpr=lsp#ui#vim#folding#foldexpr()
  \ foldtext=lsp#ui#vim#folding#foldtext()
