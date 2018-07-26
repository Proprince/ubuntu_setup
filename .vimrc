"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""
"去掉vi的一致性"
set nocompatible

"Vundle Section"
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Plugin 'my plugins'
" Python
Plugin 'davidhalter/jedi-vim'
Plugin 'Lokaltog/vim-powerline'
Plugin 'scrooloose/nerdtree'
Plugin 'Yggdroot/indentLine'
Plugin 'tell-k/vim-autopep8'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'


call vundle#end()
filetype plugin indent on
"filetype plugin on

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件，追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件，需要确认；追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和 wiki 以及 FAQ
" 将你自己的非插件片段放在这行之后
"""""""""""""""""""""""""Vundle"""""""""""""""""""""""""

" file encoding
set encoding=utf-8
set fileencodings=utf-8,chinese,latin-1,gbk,gb18030,gk2312
if has("win32")
set fileencoding=chinese
else
set fileencoding=utf-8
endif
" 解决菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
" 解决 console 提示信息输出乱码
language messages zh_CN.utf-8


"显示行号"
set number
" 隐藏滚动条"    
set guioptions-=TrLm 
"隐藏顶部标签栏"
set showtabline=0
"设置字体"
set guifont=Consolas:h14
syntax on   "开启语法高亮"

" 配色
set t_Co=256
set background=dark     "设置背景色"
colorscheme jellybeans
" 浅色高亮
"set cursorline
" set cursorcolumn

set nowrap  "设置不折行"
set fileformat=unix "设置以unix的格式保存文件"
set cindent     "设置C样式的缩进格式"

" tab 键设置
set softtabstop=4
set tabstop=4   "设置table长度"
set shiftwidth=4        "同上"
set expandtab

set showmatch   "显示匹配的括号"
set scrolloff=5     "距离顶部和底部5行"
set laststatus=2    "命令行为两行"
set backspace=2
set mouse=a     "启用鼠标"
set selection=exclusive
set selectmode=mouse,key
set matchtime=5
set ignorecase      "忽略大小写"
set incsearch
set hlsearch        "高亮搜索项"
set noexpandtab     "不允许扩展table"
set whichwrap+=<,>,h,l
set autoread

"按F5运行python"
map <F5> :Autopep8<CR> :w<CR> :call RunPython()<CR>
function RunPython()
    let mp = &makeprg
    let ef = &errorformat
    let exeFile = expand("%:t")
    setlocal makeprg=python\ -u
    set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\%l%.%#,%Z%[%^\ ]%\\@=%m
    silent make %
    copen
    let &makeprg = mp
    let &errorformat = ef
endfunction

"jedi-vim
let g:jedi#auto_initialization = 0

