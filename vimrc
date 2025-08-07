"==============================================================================
" Sane, Modern, and Well-Commented .vimrc
"==============================================================================
" --- 插件管理 (Plugin Management) ---
" 使用 vim-plug 管理插件
call plug#begin('~/.vim/plugged')

" 主题
Plug 'dracula/vim', { 'as': 'dracula' }

" UI 增强: 状态栏
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

" 文件浏览器
Plug 'preservim/nerdtree'

" 模糊搜索 (需要先安装 fzf: sudo pacman -S fzf)
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" Git 集成
Plug 'tpope/vim-fugitive'

" 常用语言包 & 功能增强
Plug 'tpope/vim-commentary'    " 'gc' 快速注释
Plug 'jiangmiao/auto-pairs'     " 自动补全括号

" 代码补全引擎 (核心)
" 需要 Node.js v16+。安装后运行 :CocInstall coc-json coc-tsserver ...
Plug 'neoclide/coc.nvim', {'branch': 'release'}

call plug#end()

" --- 基础设置 (Basic Settings) ---

set nocompatible            " 不使用 vi 的兼容模式，使用 Vim 自己的增强功能
set encoding=utf-8          " 使用 UTF-8 编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936 " 支持中文编码
syntax on                   " 开启语法高亮
filetype plugin indent on   " 开启文件类型检测、插件和缩进
set history=1000            " 增加历史记录条数
set mouse=                 " 在所有模式下启用鼠标
set hidden                  " 允许在有未保存的修改时切换缓冲区，而不会提示

" 核心：让 Vim 的默认复制、粘贴直接使用系统剪贴板
set clipboard=unnamedplus

" 修复退格键行为，使其更符合现代编辑器
set backspace=indent,eol,start

" --- 外观与界面 (Appearance & UI) ---

colorscheme dracula         " 设置主题 (在 :PlugInstall 后生效)
set termguicolors           " 启用 true color 支持，让主题颜色更精确

set number                  " 显示行号
set relativenumber          " 显示相对行号 (与 number 结合使用，当前行为绝对行号，其他为相对)
set cursorline              " 高亮当前行
set signcolumn=yes          " 始终显示符号列，防止代码折叠/LSP标志导致屏幕闪烁

set laststatus=2            " 总是显示状态栏
set showcmd                 " 在右下角显示部分命令
set wildmenu                " 增强命令行补全菜单

set nowrap                  " 默认不自动换行，保持代码原始格式
set scrolloff=5             " 上下滚动时，光标距离顶部/底部至少保留5行

" --- 搜索与缩进 (Search & Indentation) ---

set incsearch               " 输入搜索内容时，即时高亮匹配
set hlsearch                " 高亮所有搜索匹配结果
set ignorecase              " 搜索时忽略大小写
set smartcase               " 当搜索内容包含大写字母时，不忽略大小写

" 使用空格替代 Tab
set expandtab
set tabstop=4               " Tab 宽度为4个空格
set shiftwidth=4            " 自动缩进宽度为4个空格
set smartindent             " 开启智能缩进

" --- 快捷键映射 (Key Mappings) ---

" 设置 Leader 键为空格，这是现代 Vim 配置的流行做法
" Leader 键是自定义快捷键的前缀
let mapleader = " "

" 快速保存
nnoremap <leader>w :w<CR>

" 快速退出
nnoremap <leader>q :q<CR>

" NERDTree 文件浏览器
nnoremap <leader>e :NERDTreeToggle<CR>

" FZF 模糊搜索文件
nnoremap <leader>f :Files<CR>

" Fugitive (Git)
nnoremap <leader>gs :G<CR> " Gstatus 的缩写

" 缓冲区导航
nnoremap <leader>p :bprevious<CR> " 上一个 buffer
nnoremap <leader>n :bnext<CR>     " 下一个 buffer
nnoremap <leader>d :bdelete<CR>   " 关闭当前 buffer

" 使用 Ctrl + hjkl 在窗口间切换
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" (可选) 强制使用 HJKL 移动，禁用方向键。新手可以先注释掉这几行
" nnoremap <up> <nop>
" nnoremap <down> <nop>
" nnoremap <left> <nop>
" nnoremap <right> <nop>

" CoC (代码补全) 的快捷键配置
" 使用 Tab 进行补全选择
inoremap <silent><expr> <TAB>
\ pumvisible() ? "\<C-n>" :
\ <SID>check_back_space() ? "\<TAB>" :
\ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
let col = col('.') - 1
return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" 使用 <CR> (回车) 确认补全，而不是插入新行
inoremap <silent><expr> <CR> pumvisible() ? coc#_select_confirm() : "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" 跳转到定义、实现等
nmap <leader>gd <Plug>(coc-definition)
nmap <leader>gy <Plug>(coc-type-definition)
nmap <leader>gi <Plug>(coc-implementation)
nmap <leader>gr <Plug>(coc-references)

