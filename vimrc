set nocompatible              " 去除VI一致性,必须要添加
filetype off                  " 必须要添加

" 设置包括vundle和初始化相关的runtime path
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim'
    Plugin 'Valloric/YouCompleteMe'
    Plugin 'scrooloose/syntastic' 
    Plugin 'vim-scripts/DoxygenToolkit.vim'
call vundle#end()
filetype plugin indent on
filetype plugin on

"""""显示相关""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [POS=%l,%v]\    "状态行显示的内容
set laststatus=2    " 启动显示状态行(1),总是显示状态行(2)
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
set fileencodings=ucs-bom,utf-8,cp936
set fileencoding=utf-8

"""""新文件标题""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
autocmd BufNewFile *.cpp,*.cc,*.[ch],*.sh,*.pl,*.py,*.java exec ":call SetTitle()"
func SetTitle()
    "如果文件类型为.sh文件
    if &filetype == 'sh' || &filetype == 'python'
        call setline(1,"\#########################################################################")
        call append(line("."), "\# File Name: ".expand("%"))
        call append(line(".")+1, "\# Author: ivar")
        call append(line(".")+2, "\# mail: ivar.wu@momenta.ai")
        call append(line(".")+3, "\# Created Time: ".strftime('%Y-%m-%d %H:%M'))
        call append(line(".")+4, "\#########################################################################")
        if &filetype == 'sh'
            call append(line(".")+5, "\#!/bin/bash")
        elseif &filetype == 'python'
            call append(line(".")+0, "# -*- coding: utf-8 -*-")
            call append(line(".")+6, "\#! /usr/bin/env python")
        endif
        call append(line(".")+7, "")
    else
        call setline(1, "/*************************************************************************")
        call append(line("."), "    > File Name: ".expand("%"))
        call append(line(".")+1, "    > Author: ivar")
        call append(line(".")+2, "    > Mail: ivar.wu@momenta.ai")
        call append(line(".")+3, "    > Created Time: ".strftime('%Y-%m-%d %H:%M'))
        call append(line(".")+4, " ************************************************************************/")
        call append(line(".")+5, "")
    endif
    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc

" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" |  " 打开自动定位到上次光标位置
set autoread                " 设置当文件被改动时自动载入
set completeopt=preview,menu  "代码补全
set clipboard+=unnamed      " 共享剪贴板
set nobackup                " 不自动备份
set autowrite               " 自动保存
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set confirm                 " 在处理未保存或只读文件的时候，弹出确认
set autoindent              " 自动缩进
set cindent
set tabstop=2               " Tab键的宽度(不修改按Tab键的行为)
set softtabstop=2           " 统一缩进为2(修改按Tab键的行为,不修改tab字符的显示宽度)
set shiftwidth=2            
set expandtab               " 把Tab替换成空格, 具体空格数目跟tabstop选项值有关
set smarttab                " 在行和段开始处使用制表符
set number                  " 显示行号
set history=1000            " 历史记录数
set noswapfile              " 禁止生成临时文件
set hlsearch                " 搜索逐字符高亮
set incsearch               " 搜索逐字符高亮
set gdefault                " 行内替换
set langmenu=zh_CN.UTF-8    " 语言设置
set helplang=cn
set cmdheight=1             " 命令行（在状态行下）的高度，默认为1
set viminfo+=!              " 保存全局变量
set iskeyword+=_,$,@,%,#,-  " 带有如下符号的单词不要被换行分割
set linespace=0             " 字符间插入的像素行数目
set wildmenu                " 增强模式中的命令行自动完成操作
set backspace=2             " 使回格键（backspace）正常处理indent, eol, start等
set fillchars=vert:\ ,stl:\ ,stlnc:\  " 在被分割的窗口间显示空白，便于阅读
set showmatch               " 高亮显示匹配的括号
set matchtime=1             " 匹配括号高亮的时间（单位是十分之一秒）
set scrolloff=3             " 光标移动到buffer的顶部和底部时保持3行距离
set smartindent             " 为C程序提供自动缩进

" 设置100字符提示
hi ColorColumn ctermbg=grey guibg=lightgrey
set colorcolumn=100

let g:ycm_show_diagnostics_ui = 0   " 关闭ycm的检查,使用cpplint                                     
let g:syntastic_cpp_cpplint_exec = 'cpplint'                                                        
let g:syntastic_cpp_checkers = ['cpplint']                                                   
let g:syntastic_check_on_open = 1    " 文件打开时检查                                               
let g:syntastic_error_symbol = "✗"                                                                     
let g:syntastic_warning_symbol = "⚠"                                                                
let g:syntastic_style_error_symbol = '!'                                                            
let g:syntastic_style_warning_symbol = '?'
