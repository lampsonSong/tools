set nocompatible
filetype on
 
set rtp+=~/.vim/bundle/vundle
call vundle#begin()
 
 
" 这里根据自己需要的插件来设置，以下是我的配置 "
"
" YouCompleteMe:语句补全插件
set runtimepath+=~/.vim/bundle/YouCompleteMe
autocmd InsertLeave * if pumvisible() == 0|pclose|endif "离开插入模式后自动关闭预览窗口"
let g:ycm_collect_identifiers_from_tags_files = 1           " 开启 YCM基于标签引擎
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释与字符串中的内容也用于补全
let g:syntastic_ignore_files=[".*\.py$"]
let g:ycm_seed_identifiers_with_syntax = 1                  " 语法关键字补全
let g:ycm_complete_in_comments = 1
let g:ycm_confirm_extra_conf = 0                            " 关闭加载.ycm_extra_conf.py提示
let g:ycm_key_list_select_completion = ['<c-n>', '<Down>']  " 映射按键,没有这个会拦截掉tab, 导致其他插件的tab不能用.
let g:ycm_key_list_previous_completion = ['<c-p>', '<Up>']
let g:ycm_complete_in_comments = 1                          " 在注释输入中也能补全
let g:ycm_complete_in_strings = 1                           " 在字符串输入中也能补全
let g:ycm_collect_identifiers_from_comments_and_strings = 1 " 注释和字符串中的文字也会被收入补全
let g:ycm_global_ycm_extra_conf='~/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py'
let g:ycm_show_diagnostics_ui = 0                           " 禁用语法检查
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<CR>"             " 回车即选中当前项
nnoremap <c-j> :YcmCompleter GoToDefinitionElseDeclaration<CR>     " 跳转到定义处
let g:ycm_min_num_of_chars_for_completion=2                 " 从第2个键入字符就开始罗列匹配项
"

nnoremap tp :tabprevious<CR>
nnoremap tn :tabnext<CR>
nnoremap to :tabnew<CR>
nnoremap tc :tabclose<CR>

Plugin 'vim-airline/vim-airline'
"vim-airline配置:优化vim界面"
"let g:airline#extensions#tabline#enabled = 1
" airline设置
" 显示颜色
set t_Co=256
set laststatus=2
" 使用powerline打过补丁的字体
let g:airline_powerline_fonts = 1
" 开启tabline
let g:airline#extensions#tabline#enabled = 1
" tabline中当前buffer两端的分隔字符
let g:airline#extensions#tabline#left_sep = ' '
" tabline中未激活buffer两端的分隔字符
let g:airline#extensions#tabline#left_alt_sep = ' '
" tabline中buffer显示编号
let g:airline#extensions#tabline#buffer_nr_show = 1
" 映射切换buffer的键位
nnoremap [b :bp<CR>
nnoremap ]b :bn<CR>

let mapleader='f'
" 映射<leader>num到num buffer
map <leader>r :bnext<CR>
map <leader>l :bprevious<CR>
 

Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'

let g:vim_markdown_folding_disabled = 1 
let g:vim_markdown_override_foldtext = 0  
let g:vim_markdown_folding_level = 6   
let g:vim_markdown_no_default_key_mappings = 1
let g:vim_markdown_emphasis_multiline = 0
set conceallevel=0
let g:vim_markdown_frontmatter=1
syntax on

Plugin 'iamcco/mathjax-support-for-mkdp'
Plugin 'iamcco/markdown-preview.vim'

let g:mkdp_path_to_chrome = "firefox"
" Path to the chrome or the command to open chrome (or other modern browsers).
" If set, g:mkdp_browserfunc would be ignored.

let g:mkdp_browserfunc = 'MKDP_browserfunc_default'
" Callback Vim function to open browser, the only parameter is the url to open.

let g:mkdp_auto_start = 0
" Set to 1, Vim will open the preview window on entering the Markdown
" buffer.

let g:mkdp_auto_open = 0
" Set to 1, Vim will automatically open the preview window when you edit a
" Markdown file.

let g:mkdp_auto_close = 1
" Set to 1, Vim will automatically close the current preview window when
" switching from one Markdown buffer to another.

let g:mkdp_refresh_slow = 0
" Set to 1, Vim will just refresh Markdown when saving the buffer or
" leaving from insert mode. With default 0, it will automatically refresh
" Markdown as you edit or move the cursor.

let g:mkdp_command_for_global = 0
" Set to 1, the MarkdownPreview command can be used for all files,
" by default it can only be used in Markdown files.

let g:mkdp_open_to_the_world = 0
" Set to 1, the preview server will be available to others in your network.
" By default, the server only listens on localhost (127.0.0.1).
 
" vim-scripts 中的插件 "
Plugin 'taglist.vim'
"ctags 配置:F3快捷键显示程序中的各种tags，包括变量和函数等。
map <F3> :TlistToggle<CR>
let Tlist_Use_Right_Window=1
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1
let Tlist_WinWidt=25
 
Plugin 'The-NERD-tree'
"NERDTree 配置:F2快捷键显示当前目录树
map <F2> :NERDTreeToggle<CR>
let NERDTreeWinSize=25 
 
Plugin 'indentLine.vim'
Plugin 'delimitMate.vim'
 
" 非 github 仓库的插件"
" Plugin 'git://git.wincent.com/command-t.git'
" 本地仓库的插件 "
 
call vundle#end()

" json中不隐藏双引号
let g:indentLine_noConcealCursor=""
 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""实用设置
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 设置当文件被改动时自动载入
set autoread
" quickfix模式
autocmd FileType c,cpp map <buffer> <leader><space> :w<cr>:make<cr>
"代码补全 
set completeopt=preview,menu 
"允许插件  
filetype plugin on
"共享剪贴板  
set clipboard=unnamed 
"从不备份  
"set nobackup
"make 运行
:set makeprg=g++\ -Wall\ \ %
"自动保存
set autowrite
set ruler                   " 打开状态栏标尺
set cursorline              " 突出显示当前行
set magic                   " 设置魔术
set guioptions-=T           " 隐藏工具栏
set guioptions-=m           " 隐藏菜单栏
"set statusline=\ %<%F[%1*%M%*%n%R%H]%=\ %y\ %0(%{&fileformat}\ %{&encoding}\ %c:%l/%L%)\
" 设置在状态行显示的信息
set foldcolumn=0
set foldmethod=indent 
set foldlevel=300000 
set foldenable              " 开始折叠
" 不要使用vi的键盘模式，而是vim自己的
set nocompatible
" 语法高亮
set syntax=on
" 去掉输入错误的提示声音
set noeb
" 在处理未保存或只读文件的时候，弹出确认
set confirm
" 自动缩进
set autoindent
set cindent
" Tab键的宽度
set tabstop=4
" 统一缩进为4
set softtabstop=4
set shiftwidth=4
" 不要用空格代替制表符
set noexpandtab
" 在行和段开始处使用制表符
set smarttab
" 显示行号
set number
" 历史记录数
set history=1000
"搜索忽略大小写
set ignorecase
"搜索逐字符高亮
set hlsearch
set incsearch
"编码设置
set enc=utf-8
set fencs=utf-8,ucs-bom,shift-jis,gb18030,gbk,gb2312,cp936
"语言设置
set langmenu=zh_CN.UTF-8
set helplang=cn
" 我的状态行显示的内容（包括文件类型和解码）
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
set statusline=[%F]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
" 总是显示状态行
set laststatus=2
" 命令行（在状态行下）的高度，默认为1，这里是2
set cmdheight=2
" 侦测文件类型
filetype on
" 载入文件类型插件
filetype plugin on
" 为特定文件类型载入相关缩进文件
filetype indent on
" 保存全局变量
set viminfo+=!
" 带有如下符号的单词不要被换行分割
set iskeyword+=_,$,@,%,#,-
" 字符间插入的像素行数目
set linespace=0
" 增强模式中的命令行自动完成操作
set wildmenu
" 使回格键（backspace）正常处理indent, eol, start等
set backspace=2
" 允许backspace和光标键跨越行边界
"set whichwrap+=<,>,h,l

""" 可以在buffer的任何地方使用鼠标（类似office中在工作区双击鼠标定位）
""set mouse=a
""set selection=exclusive
""set selectmode=mouse,key

" 通过使用: commands命令，告诉我们文件的哪一行被改变过
set report=0
" 在被分割的窗口间显示空白，便于阅读
set fillchars=vert:\ ,stl:\ ,stlnc:\
" 高亮显示匹配的括号
set showmatch
" 匹配括号高亮的时间（单位是十分之一秒）
set matchtime=1
" 光标移动到buffer的顶部和底部时保持3行距离
set scrolloff=3
" 为C程序提供自动缩进
set smartindent
" 高亮显示普通txt文件（需要txt.vim脚本）
 au BufRead,BufNewFile *  setfiletype txt
"自动补全
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {<CR>}<ESC>O
":inoremap } <c-r>=ClosePair('}')<CR>
:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
:inoremap " ""<ESC>i
:inoremap ' ''<ESC>i
function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction
filetype plugin indent on 
"打开文件类型检测, 加了这句才可以用智能补全
set completeopt=longest,menu

