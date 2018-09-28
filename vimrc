"""""""""""""""""" file encoding """"""""""""""""""
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
"""""""""""""""""" file encoding """"""""""""""""""

"""""""" tab key """"""""
set tabstop=4       " Number of spaces that a <Tab> in the file counts for.
 
set shiftwidth=4    " Number of spaces to use for each step of (auto)indent.
 
set expandtab       " Use the appropriate number of spaces to insert a <Tab>.
                    " Spaces are used in indents with the '>' and '<' commands
                    " and when 'autoindent' is on. To insert a real tab when
                    " 'expandtab' is on, use CTRL-V <Tab>.
 
set smarttab        " When on, a <Tab> in front of a line inserts blanks
                    " according to 'shiftwidth'. 'tabstop' is used in other
                    " places. A <BS> will delete a 'shiftwidth' worth of space
                    " at the start of the line.

set autoindent      " Copy indent from current line when starting a new line
                    " (typing <CR> in Insert mode or when using the "o" or "O"
                    " command).
"""""""" tab key """"""""
 
set showcmd         " Show (partial) command in status line.

set number          " Show line numbers.

set showmatch       " When a bracket is inserted, briefly jump to the matching
                    " one. The jump is only done if the match can be seen on the
                    " screen. The time to show the match can be set with
                    " 'matchtime'.
 
set hlsearch        " When there is a previous search pattern, highlight all
                    " its matches.
 
set incsearch       " While typing a search command, show immediately where the
                    " so far typed pattern matches.
 
set ignorecase      " Ignore case in search patterns.
 
set smartcase       " Override the 'ignorecase' option if the search pattern
                    " contains upper case characters.
 
set backspace=2     " Influences the working of <BS>, <Del>, CTRL-W
                    " and CTRL-U in Insert mode. This is a list of items,
                    " separated by commas. Each item allows a way to backspace
                    " over something.
 
"set textwidth=79    " Maximum width of text that is being inserted. A longer
                    " line will be broken after white space to get this width.
 
set formatoptions=c,q,r,t " This is a sequence of letters which describes how
                    " automatic formatting is to be done.
                    "
                    " letter    meaning when present in 'formatoptions'
                    " ------    ---------------------------------------
                    " c         Auto-wrap comments using textwidth, inserting
                    "           the current comment leader automatically.
                    " q         Allow formatting of comments with "gq".
                    " r         Automatically insert the current comment leader
                    "           after hitting <Enter> in Insert mode. 
                    " t         Auto-wrap text using textwidth (does not apply
                    "           to comments)
 
set ruler           " Show the line and column number of the cursor position,
                    " separated by a comma.

set mouse=a         " Enable the use of the mouse.
 
filetype plugin indent on
syntax on

"""""""" 配色 """"""""
set t_Co=256
set background=dark " When set to "dark", Vim will try to use colors that look
                    " good on a dark background. When set to "light", Vim will
                    " try to use colors that look good on a light background.
                    " Any other value is illegal.
colorscheme jellybeans " downlaod <color>.vim in ~/.vim/colors/
"""""""" 配色 """"""""

""""""""""""""""""""" Vundle Setting """""""""""""""""""""""""
set nocompatible              " required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim

call vundle#begin()

Plugin 'gmarik/Vundle.vim'              " vundle project
Plugin 'tell-k/vim-autopep8'            " python autopep
Plugin 'jiangmiao/auto-pairs'
Plugin 'Shougo/echodoc'
Plugin 'Valloric/YouCompleteMe'         " auto complete

call vundle#end()            " required

filetype plugin indent on    " required

set noshowmode
let g:echodoc_enable_at_startup=1 " 底部命令行显示函数参数

" YouCompleteMe setting required
let g:ycm_server_python_interpreter='/usr/bin/python'
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/.ycm_extra_conf.py'
let g:ycm_seed_identifiers_with_syntax=1 "语法关键字补全
let g:ycm_show_diagnostics_ui=0 "关闭语法提示
let g:ycm_collect_identifiers_from_comments_and_strings=1
let g:ycm_collect_identifiers_from_tags_files=1 " 开启 YCM 标签补全引擎
let g:ycm_complete_in_strings=1
let g:ycm_complete_in_comments=1
let g:ycm_semantic_triggers={
            \ 'c,cpp,python,java,go,erlang,perl': ['re!\w{2}'],
            \ 'cs,lua,javascript': ['re!\w{2}'],
            \}
set completeopt=menu,menuone
let g:ycm_add_preview_to_completeopt=0
highlight PMenu ctermfg=0 ctermbg=242 guifg=black guibg=darkgrey
highlight PMenuSel ctermfg=242 ctermbg=8 guifg=darkgrey guibg=black
let g:ycm_filetype_whitelist={
            \ "c":1,
            \ "cpp":1,
            \ "cxx":1,
            \ "h":1,
            \ "hpp":1,
            \ "objc":1,
            \ "py":1,
            \ "sh":1,
            \ "zsh":1,
            \ "zimbu":1,
            \ }
map <F2> :YcmCompleter GoToDefinition<CR>
map <F3> :YcmCompleter GoToDeclaration<CR>
map <F4> :YcmCompleter GoToDefinitionElseDeclaration<CR>

" 简要帮助文档
" :PluginList       - 列出所有已配置的插件
" :PluginInstall    - 安装插件，追加 `!` 用以更新或使用 :PluginUpdate
" :PluginSearch foo - 搜索 foo ; 追加 `!` 清除本地缓存
" :PluginClean      - 清除未使用插件，需要确认；追加 `!` 自动批准移除未使用插件
"
" 查阅 :h vundle 获取更多细节和 wiki 以及 FAQ
" 将你自己的非插件片段放在这行之后
""""""""""""""""""""" Vundle Setting """""""""""""""""""""""""

"""""""" F8 Autopep8 """"""""
map <F8> :Autopep8<CR>

"""""""" 按F5运行python """"""""
map <F5> :w<CR> :call RunPython()<CR>
function RunPython()
    if &filetype == 'python'
        let mp = &makeprg
        let ef = &errorformat
        let exeFile = expand("%:t")
        setlocal makeprg=python3\ -u
        set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\%l%.%#,%Z%[%^\ ]%\\@=%m
        silent make %
        copen
        let &makeprg = mp
        let &errorformat = ef
    endif
endfunction
"""""""" 按F5运行python """"""""

