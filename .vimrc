if has("win32")
    set nocompatible
    source $VIMRUNTIME/vimrc_example.vim
    source $VIMRUNTIME/mswin.vim
    behave mswin
endif

call pathogen#infect()
syntax on
filetype plugin indent on 

set nu
set tabstop=4
set hlsearch
set incsearch
set shiftwidth=4
set autoindent
set autowrite
set expandtab
set mouse=a
set foldmethod=marker
set writebackup
syntax enable
set nocp
set background=dark
colorscheme solarized

let g:instant_markdown_slow=1
let g:instant_markdown_autostart =1
autocmd BufNewFile,BufReadPost *.md set filetype=markdown
let NERDTreeChristmasTree=1
let NERDTreeMouseMode=2
let NERDTreeHighlightCursorline=0
let NERDCompactSexyComs=1
let NERDSpaceDelims=1
let NERDTreeShowBookmarks=1
"nmap <C-h> <C-w>h
"nmap <C-j> <C-w>j
"nmap <C-k> <C-w>k
"nmap <C-l> <C-w>l
"multi set
let g:multi_cursor_use_default_mapping=0
let g:multi_cursor_next_key='<C-n>'
let g:multi_cursor_prev_key='<C-p>'
let g:multi_cursor_skip_key='<C-x>'
let g:multi_cursor_quit_key='<Esc>'
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | end  " Auto Exit
" html indent  
filetype indent on   
let g:html_indent_inctags = "body,head,tbody"   " 缩进body head  
" let g:html_indent_script1 = "inc"     " 缩进<script>标签  
" let g:html_indent_style1 = "inc"      " 缩进<style>标签 

" NERDCommand
let mapleader=","

map <F2> :silent! NERDTreeToggle<CR>

" TagbarToggle
map <F3> :silent! TagbarToggle<CR>

" FulCoverageFile
"map <F4> :silent! FufCoverageFile<CR>

" NerdTree Book Mark
map <F5> :Bookmark <CR>
let NERDTreeIgnore=['cscope\.*','\.svn','\.git','\.o']

" Cscope
map <F6> :!find . -name '*.php' -o -name '*.c' -o -name '*.h' -o -name '*.cpp' -o -name '*.java' -o -name '*.phtml' -name '*.ini' >cscope.files && cscope -bq<CR>:cs reset<CR>:cs add cscope.out<CR>

" MiniBuffer
map <C-c> :MBEbd<CR>
map <C-n> :MBEbn<CR>
map <C-b> :MBEbp<CR>

"Gundo 
map <leader>h :GundoToggle<CR>

" NERDCommand
let mapleader=","

" Powerline
set laststatus=2
let g:Powerline_symbols = 'unicode'

" Supertab
let g:SuperTabRetainCompletionType=2
let g:SuperTabDefaultCompletionType="<C-X><C-O>"
set ofu=syntaxcomplete#Complete
set completeopt=menu,longest

" Cscope
set cscopequickfix=s-,c-,d-,i-,t-,e-
set cscopetag 
set csto=1
if filereadable("cscope.out")  
    cs add cscope.out
endif
set cscopeverbose
map <C-g>s :cs find s <C-R>=expand("<cword>")<CR><CR>:copen<CR>      
map <C-g>g :cs find g <C-R>=expand("<cword>")<CR><CR>:copen<CR>     
map <C-g>c :cs find c <C-R>=expand("<cword>")<CR><CR>:copen<CR>   
map <C-g>t :cs find t <C-R>=expand("<cword>")<CR><CR>:copen<CR>
map <C-g>e :cs find e <C-R>=expand("<cword>")<CR><CR>:copen<CR>     
map <C-g>f :cs find f <C-R>=expand("<cfile>")<CR><CR>:copen<CR>
map <C-g>i :cs find i ^<C-R>=expand("<cfile>")<CR>$<CR>:copen<CR>   
map <C-g>d :cs find d <C-R>=expand("<cword>")<CR><CR>:copen<CR>   

" 相对行号
set relativenumber
au FocusLost * :set number
au FocusGained * :set relativenumber
" 插入模式下用绝对行号, 普通模式下用相对
autocmd InsertEnter * :set number
autocmd InsertLeave * :set relativenumber
function! NumberToggle()
 if(&relativenumber == 1)
  set number
else
 set relativenumber
endif
endfunc
nnoremap <C-r> :call NumberToggle()<cr>


" 配色方案
if has("gui_running")
    colo solarized
else
    colo desert
endif

"--------------------------------------------------
" Name: solarized
" Git: https://github.com/altercation/vim-colors-solarized.git
"--------------------------------------------------
let g:solarized_termcolors=256
let g:solarized_termtrans=0
let g:solarized_contrast="normal"
let g:solarized_visibility="high"
let g:solarized_underline=1
let g:solarized_italic=0
let g:solarized_degrade=0
let g:solarized_bold=1
let g:solarized_diffmode="normal"
let g:solarized_hitrail=0
let g:solarized_menu=1


au BufNewFile,BufRead *.py
\ set tabstop=4
\ set softtabstop=4
\ set shiftwidth=4
\ set textwidth=79
\ set expandtab
\ set autoindent
\ set fileformat=unix

" =============================================================================
"                            << 设置快捷键映射 >>
" =============================================================================
let mapleader=";"                                     " 定义快捷键的前缀，即<Leader>
nnoremap lb 0                                             " 映射行尾行首
nnoremap le $
vnoremap <Leader>y "+y                                " 设置快捷键将选中文本块复制至系统剪贴板
nmap <Leader>p "+p                                    " 设置快捷键将系统剪贴板内容粘贴至 vim
nmap <Leader>Y "*y                                    " 设置快捷键将选中文本复制到系统缓冲区
nmap <Leader>P "*p                                    " 设置快捷键将系统缓冲区内容粘贴至 vim
nnoremap <Leader>q :q<CR>" 定义快捷键关闭当前分割窗口
nnoremap <Leader>, :w<CR>" 定义快捷键保存当前窗口内容
nmap <Leader>WAQ :wa<CR>:q<CR>                        " 定义快捷键保存所有窗口内容并退出 vim
nmap <Leader>Q :qa!<CR>                               " 不做任何保存，直接退出 vim
nnoremap wn <C-W><C-W>                                " 依次遍历子窗口
nnoremap wp <C-w>p                                    " 逆向遍历窗口
nnoremap <Leader>lw <C-W>l                            " 跳转至右方的窗口
nnoremap <Leader>hw <C-W>h                            " 跳转至左方的窗口
nnoremap <Leader>kw <C-W>k                            " 跳转至上方的子窗口
nnoremap <Leader>jw <C-W>j                            " 跳转至下方的子窗口
nnoremap <Leader>Lw <C-W>L                            " 跳转至最右方的窗口
nnoremap <Leader>Hw <C-W>H                            " 跳转至最左方的窗口
nnoremap <Leader>Kw <C-W>K                            " 跳转至最上方的子窗口
nnoremap <Leader>Jw <C-W>J                            " 跳转至最下方的子窗口
nmap <Leader>pa %" 定义快捷键在结对符之间跳转，助记pair
nmap <Leader><Leader>tn :tnext<CR>                   " 正向遍历同名标签
nmap <Leader><Leader>tp :tprevious<CR>               " 反向遍历同名标签

" =============================================================================
"        << 判断操作系统是 Windows 还是 Linux 和判断是终端还是 Gvim >>
" =============================================================================

" -----------------------------------------------------------------------------
"  < 判断操作系统是否是 Windows 还是 Linux >
" -----------------------------------------------------------------------------
let g:iswindows = 0
let g:islinux = 0
if(has("win32") || has("win64") || has("win95") || has("win16"))
    let g:iswindows = 1
else
    let g:islinux = 1
endif

" -----------------------------------------------------------------------------
"  < 判断是终端还是 Gvim >
" -----------------------------------------------------------------------------
if has("gui_running")
    let g:isGUI = 1
else
    let g:isGUI = 0
endif

" =============================================================================
"                          << 插件管理 >>
" =============================================================================
" 用于更方便的管理vim插件，具体用法参考 :h vundle 帮助
" 安装方法为在终端输入如下命令
" git clone https://github.com/gmarik/vundle.git ~/.vim/bundle/vundle
" 如果想在 windows 安装就必需先安装 "git for window"，可查阅网上资料

set nocompatible                                      "禁用 Vi 兼容模式
filetype off                                          "禁用文件类型侦测

if g:islinux
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
else
    set rtp+=$VIM/vimfiles/bundle/vundle/
    call vundle#rc('$VIM/vimfiles/bundle/')
endif

" 使用Vundle来管理Vundle，这个必须要有。
Bundle 'VundleVim/Vundle.vim'

" 以下为要安装或更新的插件，不同仓库都有（具体书写规范请参考帮助）
Bundle 'xml.vim'
Bundle 'Align'
Bundle 'jiangmiao/auto-pairs'
Bundle 'mileszs/ack.vim'
Bundle 'dyng/ctrlsf.vim'
Bundle 'Yggdroot/indentLine'
Bundle 'Shougo/neocomplete'
Bundle 'scrooloose/nerdcommenter'
Bundle 'scrooloose/nerdtree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'Konfekt/FastFold'
Bundle 'vim-scripts/indexer.tar.gz'
Bundle 'DfrankUtil'
Bundle 'vimprj'
Bundle 'suan/vim-instant-markdown'
Bundle 'majutsushi/tagbar'
Bundle 'fholgado/minibufexpl.vim'
Bundle 'terryma/vim-multiple-cursors'
Bundle 'vim-scripts/indentpython.vim'
"Bundle 'Valloric/YouCompleteMe'

" =============================================================================
"        << 界面&主题配置 >>
" =============================================================================
" 设置代码配色方案
if g:isGUI
    "colorscheme solarized
    colorscheme molokai 
    set background=dark
else
    "colorscheme molokai
    colorscheme gruvbox
    set background=dark
endif
" 显示/隐藏菜单栏、工具栏、滚动条，可用 Ctrl + F11 切换
if g:isGUI
    set guioptions-=m
    set guioptions-=T
    set guioptions-=r
    set guioptions-=L
    map <silent> <c-F11> :if &guioptions =~# 'm' <Bar>
                \set guioptions-=m <Bar>
                \set guioptions-=T <Bar>
                \set guioptions-=r <Bar>
                \set guioptions-=L <Bar>
                \else <Bar>
                \set guioptions+=m <Bar>
                \set guioptions+=T <Bar>
                \set guioptions+=r <Bar>
                \set guioptions+=L <Bar>
                \endif<CR>
endif

set guifont=YaHei\ Consolas\ Hybrid\ 12               "设置 gvim 显示字体
set number                                            "显示行号
set laststatus=2                                      "启用状态栏信息
set cmdheight=2                                       "设置命令行的高度为2，默认为1
set ruler                                             "显示光标当前位置
set cursorline                                        "高亮显示当前行/列
set nofoldenable                                      "不启用折叠
set nowrap                                            "设置不自动换行
set shortmess=atI                                     "去掉欢迎界面
set gcr=a:block-blinkon0                             "禁止光标闪烁
set hlsearch                                          "高亮显示搜索结果


" =============================================================================
"                          << 编码设置 >>
" =============================================================================
" 注：使用utf-8格式后，软件与程序源码、文件路径不能有中文，否则报错
set encoding=utf-8                                    "设置gvim内部编码
set fileencoding=utf-8                                "设置当前文件编码
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

" 文件格式，默认 ffs=dos,unix
set fileformat=unix                                   "设置新文件的<EOL>格式
set fileformats=unix,dos,mac                          "给出文件的<EOL>格式类型

if (g:iswindows && g:isGUI)
    "解决菜单乱码
    source $VIMRUNTIME/delmenu.vim
    source $VIMRUNTIME/menu.vim

    "解决consle输出乱码
    language messages zh_CN.utf-8
endif

syntax on
syntax enable
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=4                                         "设置Tab键的宽度
set shiftwidth=4                                      "换行时自动缩进4个空格
set shiftwidth=4                                      "设置格式化时制表符占用空格数
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度的空格
set foldmethod=indent                                "indent 折叠方式
"set foldmethod=syntax                                 "syntax 折叠方式
set wildmenu                                          "vim 自身命令行模式智能补全
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                       "在输入要搜索的文字时，取消实时匹配


set undofile                                          "设置undofile
set undolevels=1000
if g:iswindows                                        
    set undodir=$VIM.'/vimfiles/_undodir'
else 
    set undodir=$HOME.'/.vim'
endif

" 用空格键来开关折叠
nnoremap <Leader><space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>

" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
"nmap cS :%s/\s\+$//g<CR>:noh<CR>
nmap cS :g/^s*$/d<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

" Ctrl + K 插入模式下光标向上移动
imap <c-k> <Up>

" Ctrl + J 插入模式下光标向下移动
imap <c-j> <Down>

" Ctrl + H 插入模式下光标向左移动
imap <c-h> <Left>

" Ctrl + L 插入模式下光标向右移动
imap <c-l> <Right>

" 启用每行超过80列的字符提示（字体变蓝并加下划线），不启用就注释掉
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)

" =============================================================================
"                          << 自定义函数 >>
" =============================================================================
"--------------------------------------------------------------------
" < 窗口最大化 >
"--------------------------------------------------------------------
" 将外部命令 wmctrl 控制窗口最大化的命令行参数封装成一个 vim 的函数
fun! ToggleFullscreen()
    call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")
endf
" 全屏开/关快捷键
map <silent> <F11> :call ToggleFullscreen()<CR>

"--------------------------------------------------------------------
" < 替换函数 >
" confirm：是否替换前逐一确认
" wholeword：是否整词匹配
" replace：被替换字符串
"--------------------------------------------------------------------
function! Replace(confirm, wholeword, replace)
    wa
    let flag = ''
    if a:confirm
        let flag .= 'gec'
    else
        let flag .= 'ge'
    endif
    let search = ''
    if a:wholeword
        let search .= '\<' . escape(expand('<cword>'), '/\.*$^~[') . '\>'
    else
        let search .= expand('<cword>')
    endif
    let replace = escape(a:replace, '/\&~')
    execute 'argdo %s/' . search . '/' . replace . '/' . flag . '| update'
endfunction
" 不确认、非整词
nnoremap <Leader>R :call Replace(0, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 不确认、整词
nnoremap <Leader>rw :call Replace(0, 1, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、非整词
nnoremap <Leader>rc :call Replace(1, 0, input('Replace '.expand('<cword>').' with: '))<CR>
" 确认、整词
nnoremap <Leader>rcw :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>
nnoremap <Leader>rwc :call Replace(1, 1, input('Replace '.expand('<cword>').' with: '))<CR>

"----------------------PHP函数自动补全----------------------------------------
set dictionary-=$VIM/vimfiles/TXT/php_funclist.txt dictionary+=$VIM/vimfiles/TXT/php_funclist.txt
set complete-=k complete+=k
au FileType php call AddPHPFuncList()
function AddPHPFuncList()
    set dictionary-=$VIM/vimfiles/TXT/php_funclist.txt dictionary+=$VIM/vimfiles/TXT/php_funclist.txt
    set complete-=k complete+=k
endfunction

"-------------------------版权信息------------------------
function CopyRight(type, position) 
    let author = "kaleo <kaleo1990@hotmail.com>"
    if a:position == 'curr'
        let line_num = line(".")
    else
        let line_num = 0
    endif
    if a:type == "phpfile" 
        call setline(line_num,"<?php")
        call append(line_num+0,"<?php")
        call append(line_num+1,"/** =============================================================================") 
        call append(line_num+2," * @name ".expand("%:t")) 
        call append(line_num+3," * @date date ".strftime("%c")) 
        call append(line_num+4," * @author ".author) 
        call append(line_num+5," * @package ") 
        call append(line_num+6," * =============================================================================")
        call append(line_num+7," */") 
    else
        if a:type == "file"
        call setline(line_num,"")
        call append(line_num+0,"/** =============================================================================") 
        call append(line_num+1," * @name ".expand("%:t")) 
        call append(line_num+2," * @date date ".strftime("%c")) 
        call append(line_num+3," * @author ".author) 
        call append(line_num+4," * @package ") 
        call append(line_num+5," * =============================================================================")
        call append(line_num+6," */") 
    elseif a:type == "func" 
            call setline(line_num," /**") 
            call append(line_num+0," * @access ") 
            call append(line_num+1," * @author ".author) 
            call append(line_num+2," * @param") 
            call append(line_num+3," * @return") 
            call append(line_num+4," */") 
        else 
            call setline(line_num," /**") 
            call append(line_num+0," * @access ") 
            call append(line_num+1," * @var ") 
            call append(line_num+2," */") 
        endif 
    endif
endfunction

nnoremap <Leader>cp :call CopyRight("phpfile","0")<CR>
nnoremap <Leader>co :call CopyRight("file","0")<CR>
nnoremap <Leader>cf :call CopyRight("func","curr")<CR>
nnoremap <Leader>cv :call CopyRight("var","curr")<CR>

"-----------------------------------------------------------------------
" < ctrlsf查找 >
"-----------------------------------------------------------------------
function Search(options)
    NERDTreeClose
    if a:options != 0
        let searchOptions = a:options
        execute 'CtrlSF '.searchOptions
    else
        execute 'CtrlSF -i '.expand('<cword>')
    endif
endfunction

function SearchResult(open)
    if a:open
        NERDTreeClose
        CtrlSFOpen
    else
        NERDTree
        CtrlSFClose
    endif
endfunction

"-----------------------------------------------------------------------
" < 打开某个buffer >
"-----------------------------------------------------------------------
function BufferOpen()
    let bufnum = input("which buffer to open(input buffer number):") 
    execute 'b'.bufnum
endfunction


" =============================================================================
"                          << 插件配置 >>
" =============================================================================

"------------------------------------------------------------------------
" < vim-powerline >
"------------------------------------------------------------------------
if g:isGUI
    let g:Powerline_colorscheme='solarized256'
else
    let g:Powerline_colorscheme='solarized'
endif

"------------------------------------------------------------------------
" < vim-indent-guides >
"------------------------------------------------------------------------
" 随 vim 自启动
"let g:indent_guides_enable_on_vim_startup=1
" 从第二层开始可视化显示缩进
"let g:indent_guides_start_level=2
" 色块宽度
"let g:indent_guides_guide_size=1
" 快捷键 i 开/关缩进可视化
":nmap <silent> <Leader>i <Plug>IndentGuidesToggle

"------------------------------------------------------------------------
" < Align >
"------------------------------------------------------------------------
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多

"------------------------------------------------------------------------
" < minibufexpl >
"------------------------------------------------------------------------
" 显示/隐藏 MiniBufExplorer 窗口
let g:miniBufExplMapCTabSwitchBufs=1
map <Leader>bl :MBEToggle<cr>
map <Leader>bo :MBEOpen<cr>
map <Leader>bc :MBEClose<cr>
" buffer 切换快捷键
map <C-Tab> :MBEbn<cr>
map <C-S-Tab> :MBEbp<cr>
map <Leader><Leader>d :MBEbd<cr>
map <Leader><Leader>b :call BufferOpen()<cr>
" 在不使用 MiniBufExplorer 插件时也可用<C-k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

"------------------------------------------------------------------------
" < tagbar >
"------------------------------------------------------------------------
" 高效地浏览源码, 其功能就像vc中的workpace
" 那里面列出了当前文件中的所有宏,全局变量, 函数名等

nnoremap <Leader>tl :TagbarToggle<CR>       "设置显示／隐藏标签列表子窗口的快捷键
let tagbar_right=1                          "设置 tagbar 子窗口的位置出现在主编辑区的左边
let tagbar_width=30                         "设置标签子窗口的宽度 
let g:tagbar_compact=1                      "tagbar 子窗口中不显示冗余帮助信息 

"------------------------------------------------------------------------
" < indexer >
"------------------------------------------------------------------------
set tags+=/home/lancelot/resources/tags/ap-tags
let g:indexer_ctagsCommandLineOptions="--c++-kinds=+p+l+x+c+d+e+f+g+m+n+s+t+u+v --php-kinds=+c+i+d+f+v+j --python-kinds=+c+f+m+v+i --sql-kinds=+c+d+f+F+l+L+p+P+r+s+t+T+v+i+e+U+R+D+V+n+x+y+z --vim-kinds=+a+c+f+m+v --java-kinds=+c+e+f+g+i+l+m+p --javascript-kinds=+f+c+m+p+v --fields=+iaSl --extra=+q"

"------------------------------------------------------------------------
" < ctrlsf.vim >
"------------------------------------------------------------------------
nnoremap <Leader>ss :call Search(input('input search string:'))<CR>
nnoremap <Leader>si :call Search(0)<CR>
nnoremap <Leader>so :call SearchResult(1)<CR>
nnoremap <Leader>sc :call SearchResult(0)<CR>

"------------------------------------------------------------------------
" < nerdtree >
"------------------------------------------------------------------------
" 使用 NERDTree 插件查看工程文件。设置快捷键，速记：file list
nmap <Leader>fl :NERDTreeToggle<CR>
" 设置NERDTree子窗口宽度
let NERDTreeWinSize=28
" 设置NERDTree子窗口位置
let NERDTreeWinPos="left"
" 显示隐藏文件
let NERDTreeShowHidden=0
" NERDTree 子窗口中不显示冗余帮助信息
let NERDTreeMinimalUI=1
" 删除文件时自动删除文件对应 buffer
let NERDTreeAutoDeleteBuffer=1

"------------------------------------------------------------------------
" < nerdcommenter >
"------------------------------------------------------------------------
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
let NERDSpaceDelims = 1                     "在左注释符之后，右注释符之前留有空格

"------------------------------------------------------------------------
" < indentline  >
"------------------------------------------------------------------------
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR>
if g:isGUI
    let g:indentLine_char = "┊"
    let g:indentLine_first_char = "┊"
endif
let g:indentLine_color_term = 239

"------------------------------------------------------------------------
" < neocomplete >
"------------------------------------------------------------------------
let g:neocomplete#enable_at_startup = 0
" Use smartcase.
let g:neocomplete#enable_smart_case = 1
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType js,javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType php setlocal omnifunc=phpcomplete#CompletePHP
autocmd FileType sql setlocal omnifunc=sqlcomplete#Complete


" =============================================================================
"                          << autocmd >>
" =============================================================================
"autocmd VimEnter * call ToggleFullscreen()                " 启动 vim 时自动全屏
autocmd VimEnter * set nu
autocmd BufNewFile *.php call CopyRight("phpfile","0")
map <F4> :call TitleDet()<cr>
function AddTitle()
    call append(0,"\#!/usr/bin/env bash")
    call append(1,"# ******************************************************")
    call append(2,"# Author       : kaleo")
    call append(3,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(4,"# Email        : kaleo1990@hotmail.com")
    call append(5,"# Filename     : ".expand("%:t"))
    call append(6,"# Description  : ")
    call append(7,"# ******************************************************")
    echohl WarningMsg | echo "Successful in adding copyright." | echohl None
endf

function UpdateTitle()
    normal m'
    execute '/# Last modified/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# Filename/s@:.*$@\=":\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copyright." | echohl None
endfunction

function TitleDet()
    let n=1
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
