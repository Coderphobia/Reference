 
"==============================================================================
"                                    Cscope
"==============================================================================
if has("cscope")
    set csprg=/usr/bin/cscope
    set csto=1
    set cst
    set nocsverb
    " add any database in current directory
    if filereadable("cscope.out")
        cs add cscope.out
    endif
    if filereadable("../cscope.out")
        cs add cscope.out
    endif
    if filereadable("../../cscope.out")
        cs add cscope.out
    endif
    set csverb
endif
"
"==============================================================================
"                                    YouCompleteMe
"==============================================================================
let g:ycm_global_ycm_extra_conf = "~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py"
let g:ycm_auto_trigger = 1 
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示
let g:ycm_min_num_of_chars_for_completion=2 " 从第2个键入字符就开始罗列匹配项
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_cache_omnifunc=0  " 禁止缓存匹配项,每次都重新生成匹配项

"let g:ycm_complete_in_comments = 1 "在注释输入中也能补全

let g:ycm_complete_in_strings = 1 "在字符串输入中也能补全

let g:ycm_collect_identifiers_from_comments_and_strings = 0 "注释和字符串中的文字也会被收入补全

set completeopt=longest,menu "让Vim的补全菜单行为与一般IDE一致

let mapleader = ","
nnoremap <leader>gl :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>gf :YcmCompleter GoToDefinition<CR>
nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR>
inoremap <expr> <CR>  pumvisible() ? "\<C-y>" : "\<CR>"    "回车即选中当前项
"==============================================================================
"                                        WinManager
"==============================================================================
let g:NERDTree_title="[NERDTree]"  
let g:winManagerWindowLayout="NERDTree|TagList"  

function! NERDTree_Start()  
	exec 'NERDTree'  
endfunction  

function! NERDTree_IsValid()  
	return 1  
endfunction  

nmap wm :WMToggle<CR>  

"==============================================================================
"                                        Vbundle
"==============================================================================
set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
"
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
"
" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
"
" Git plugin not hosted on GitHub
Plugin 'git://git.wincent.com/command-t.git'
"
" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Install L9 and avoid a Naming conflict if you've already installed a
" different version somewhere else.
" Plugin 'ascenator/L9', {'name': 'newL9'}

" Install You Complete Me
Plugin 'Valloric/YouCompleteMe' 
Plugin 'scrooloose/syntastic'
Plugin 'The-NERD-tree'
Plugin 'taglist.vim'
Plugin 'vim-scripts/winmanager'
" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line
"
"==============================================================================
"                                        TagList
"==============================================================================
"taglist
":Tlist 打开 :Tlist 关闭
"ctl+ww切换窗口
"
let Tlist_Show_One_File=1     "不同时显示多个文件的tag，只显示当前文件的    
let Tlist_Exit_OnlyWindow=1   "如果taglist窗口是最后一个窗口，则退出vim   
let Tlist_Ctags_Cmd="/usr/bin/ctags" "将taglist与ctags关联  
let Tlist_Use_SingleClick=1        "设置单击tag就跳到tag定义的位置
let Tlist_Auto_Open=1  "设置在启动VIM后，自动打开taglist窗口，
let Tlist_Use_Right_Window=1 "设置taglist窗口显示在右侧
"==============================================================================

"==============================================================================
"                                        NerdTree
"==============================================================================
autocmd VimEnter * NERDTree "autocmd自动执行命令，打开vim时自动执行：NerdThree
autocmd VimLeave * NERDTree "autocmd自动执行命令，打开vim时自动执行：NerdThree
wincmd w
autocmd VimEnter * wincmd w
"==============================================================================

"==============================================================================
"                                        Vim设置
"==============================================================================
syntax on
syntax case match "区分大小写
syntax case ignore "不区分大小写

set number "设置行号
set tabstop=4 "设置tab空格数
set shiftwidth=4
set ruler
set backspace=2 "能使用backspace回删 
set cursorline "突出显示当前行
set textwidth=80 "设置文本宽度为80
set hlsearch "设置搜索结果高亮

set path=/root/orangepi_sdk/source/linux-3.4.112/include
set path=/root/orangepi_sdk/source/linux-3.4.112/arch/arm/include
set path=/root/orangepi_sdk/source/linux-3.4.112/arch/arm/mach-sunxi/include
set path=/root/orangepi_sdk/source/linux-3.4.112/usr/include
set path=/root/orangepi_sdk/source/linux-3.4.112/include/asm-generic
"==============================================================================
"                                        Vim命令
"==============================================================================
"1）vim与shell切换命令
"
"    :shell    可以在不关闭vim的情况下切换到shell命令行
"    :exit        shell命令行输入exit命令，可回到vim
"
"2) 窗口的分割与切换
"
"    ctl + ww    切换到下个窗口
"    ctl + wj 切换到下方窗口
"    ctl + wk 切换到上方窗口
"
"    :split    水平分割主窗口
"    ctl + w, '<-'    切换到当前窗口的左边窗口
"    ctl + w, '->' 切换到当前窗口的右边窗口
"
"    :vsplit    垂直分割主窗口
"    ctl + w, '<-'    切换到当前窗口的左边窗口
"    ctl + w, '->' 切换到当前窗口的右边窗口
"
"3）窗口关闭
"    
"    :only    关闭所有窗口，只保留当前窗口
"==============================================================================


