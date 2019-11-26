" 让配置变更立即生效
" autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 加载插件
source ~/.vim/vimrc.bundle
"""""""""""""""""""""""""""""""""""""""""""""
"
" 基础
" 
"""""""""""""""""""""""""""""""""""""""""""""
set background=dark " 样式
colorscheme deus " 样式
" 禁止显示滚动条
set guioptions-=l
set guioptions-=L
set guioptions-=r
set guioptions-=R
" 禁止显示菜单和工具条
set guioptions-=m
set guioptions-=T
" 总是显示状态栏
set laststatus=2
" 显示光标当前位置
set ruler
set rulerformat=%30(%=\:b%n%y%m%r%w\ %l,%c%V\ %P%)
set showcmd
" 高亮显示当前行/列
set cursorcolumn
set cursorline
" 设置 gvim 显示字体
set guifont=Mono\ Regular:h20,Menlo\ Regular:h11,Consolas\ Regular:h12,Courier\ New\ Regular:h14
syntax on                   " 语法高亮
set mouse=a 
set foldenable      " 允许折叠  
set foldmethod=manual   " 手动折叠
" 编码设置
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8
set backspace=indent,eol,start  " 使回格键（backspace）正常处理indent, eol, start等
set linespace=0                 " 除去行之外空格
set number                      " 行号
set showmatch                   " 高亮显示匹配的括号
set matchtime=1 " 匹配括号高亮的时间（单位是十分之一秒）
set incsearch                   " 搜索
set hlsearch                    " 高亮搜索
set ignorecase                  " 搜索忽略大小写
set smartcase                   " 出现大写时，区分大小写
set wildmenu                    " 增强模式中的命令行自动完成操作
set whichwrap=b,s,h,l,<,>,[,]
set nowrap                      " 禁止这行
set autoindent                  " 自动缩进
set shiftwidth=4                " 缩进为4个空格
set expandtab                   " Tab为空格
set tabstop=4                   " 一个tab为4个空格
set softtabstop=4
" 禁止备份
set nobackup 
set noundofile
set noswapfile
autocmd FileType haskell,puppet,ruby,yml,html,javascript,json,yam,yaml setlocal expandtab shiftwidth=2 softtabstop=2
"""""""""""""""""""""""""""""""""""""""""""""
"
" 快捷键
" 
"""""""""""""""""""""""""""""""""""""""""""""
map <C-J> <C-W>j<C-W>
map <C-K> <C-W>k<C-W>
map <C-L> <C-W>l<C-W>
map <C-H> <C-W>h<C-W>
let mapleader = ',' " 命令
" 设置快捷键将选中文本块复制至系统剪贴板
vnoremap <Leader>y "+y
" 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>p "+p
"""""""""""""""""""""""""""""""""""""""""""""
"
" 插件
" 
"""""""""""""""""""""""""""""""""""""""""""""
" airline
let g:airline_theme = 'deus' " 样式
let g:airline#extensions#tabline#enabled = 1 " 显示文件名
let g:airline#extensions#tabline#left_sep = ' ' " 文件名分割
let g:airline#extensions#tabline#left_alt_sep = '|' " 文件名分割
let g:airline#extensions#tabline#formatter = 'default' "文件名格式化

" nerdtree
map <D-1> :NERDTreeToggle<CR> " 打开
map <leader>e :NERDTreeFind<CR>
nmap <leader>nt :NERDTreeFind<CR>
let NERDTreeShowBookmarks=1
let NERDTreeIgnore=['\.py[cd]$', '\~$', '\.swo$', '\.swp$', '^\.git$', '^\.hg$', '^\.svn$', '\.bzr$']
let NERDTreeChDirMode=0
let NERDTreeQuitOnOpen=1
let NERDTreeMouseMode=2
let NERDTreeShowHidden=1
let NERDTreeKeepTreeInNewTab=1
let g:nerdtree_tabs_open_on_gui_startup=0

" 自动不全括号
inoremap ' ''<ESC>i
inoremap " ""<ESC>i
inoremap ( ()<ESC>i
inoremap [ []<ESC>i
inoremap < <><ESC>i
inoremap { {<CR>}<ESC>O

"设置跳出自动补全的括号
func SkipPair()
    if getline('.')[col('.') - 1] == ')' || getline('.')[col('.') - 1] == ']' || getline('.')[col('.') - 1] == '"' || getline('.')[col('.') - 1] == "'" || getline('.')[col('.') - 1] == '}'
        return "\<ESC>la"
    else
        return "\t"
    endif
endfunc
" 将tab键绑定为跳出括号
inoremap <TAB> <c-r>=SkipPair()<CR>
