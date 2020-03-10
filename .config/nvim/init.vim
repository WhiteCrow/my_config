" ------------------------------------------------------------------------
" <快捷键记录>
" ------------------------------------------------------------------------
" <C-w> v   : vsplit window
" <C-w> s   : split window
" <C-m> p   : markdown preview
" <C-m> t   : markdown toggle preview
" <C-]>     : ctags 代码跳转，初始化：!ctags -R . :set tags=tags
" <C-\>     : tags bar
" S         : 搜索当前整个目录
" gd        : 跳转到文档
" nt        : 增加标签页
" 
" CocInstall -sync coc-* install coc extension
" 
" ------------------------------------------------------------------------
" <依赖>
" ------------------------------------------------------------------------
" ctags 
" w3m
" dasht
" neovim (python pip package) 
" neovim (ruby gem package) 
"
" ------------------------------------------------------------------------
" <插件>
" ------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')

" 外观
Plug 'Yggdroot/indentLine'
Plug 'scrooloose/syntastic'
Plug 'vim-airline/vim-airline' " 编辑器底栏
Plug 'vim-airline/vim-airline-themes' " 编辑器底栏
Plug 'airblade/vim-gitgutter'
Plug 'morhetz/gruvbox' " gruvbox theme
" Plug 'altercation/vim-colors-solarized' " solarized theme

" 文件导航
Plug 'scrooloose/nerdtree' " ctrl + e 目录
Plug 'ctrlpvim/ctrlp.vim' " ctrl + p 搜索
Plug 'kristijanhusak/defx-icons'

" ruby on rails
Plug 'tpope/vim-rails'

" 代码自动补全
" Plug 'jiangmiao/auto-pairs' " pairs match notice
" 自动补全，包括：TypeScript, JS, css, html, c++, rust, ruby
" Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' } 
" 更快的代码补全 需要node requirements curl -sL install-node.now.sh/lts | bash
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'junegunn/vim-easy-align' " 代码对齐
Plug 'mattn/emmet-vim' " html language

" 实用工具
Plug 'Shougo/denite.nvim'
Plug 'tpope/vim-repeat'
Plug 'mattn/calendar-vim'

" ------------------------------------------------------------------------
" <Dash文档查询>
" gd - go to docsets
" ------------------------------------------------------------------------
Plug 'sunaku/vim-dasht'
nnoremap gd :call Dasht([expand('<cword>'), expand('<cWORD>')])<Return>
vnoremap gd y:<C-U>call Dasht(getreg(0))<Return>
" let g:dasht_filetype_docsets['python'] = ['(num|sci)py', 'pandas'] " When in Python, also search NumPy, SciPy, and Pandas:
let g:dasht_results_window = 'botright vnew' " create panel at right-most edge

" ------------------------------------------------------------------------
" <Markdown>
" ------------------------------------------------------------------------
Plug 'rhysd/nyaovim-markdown-preview' " markdown 预览
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() } } " markdown 预览
nmap <c-m>p <Plug>MarkdownPreview
nmap <c-m>t <Plug>MarkdownPreviewToggle
nmap <c-m>c <Plug>MarkdownPreviewClose

" ------------------------------------------------------------------------
" <VimWiki> 
" ------------------------------------------------------------------------
" set nocompatible
" Plug 'vimwiki/vimwiki'
" Plug 'WnP/vimwiki_markdown'
" let g:vimwiki_menu = ''         " 不在菜单栏上显示Vimwiki
" let g:vimwiki_use_mouse = 1     " 使用鼠标
" let g:vimwiki_diary_months = {
"     \ 1: '一月', 2: '二月', 3: '三月', 4: '四月', 5: '五月', 6: '六月',
"     \ 7: '七月', 8: '八月', 9: '九月', 10: '十月', 11: '十一月', 12: '十二月'
"     \ }                         " 设置日期显示文字
" autocmd FileType vimwiki setlocal wrap " 折行
" let g:vimwiki_valid_html_tags = 'b,i,s,u,sub,sup,kbd,br,hr,img' " 设置可以在笔记中使用的Html Tag
" let wiki_notes = {}          " 笔记
" let wiki_notes.path = '~/Documents/notes/'                       " 笔记文件路径
" let wiki_notes.path_html = '~/Documents/notes/output/'                       " 笔记转换为HTML输出路径
" let wiki_notes.syntax = 'markdown'                               " markdown 语法
" let wiki_notes.ext = '.md'
" let wiki_notes.custom_wiki2html = 'vimwiki_markdown'
" let wiki_notes.auto_export = 0
" let notes.template_path = '~/Documents/notes/template/'                 " 用于生成HTML页面的模板
" let notes.template_default = 'kesco.tpl'                                " 默认模板
" let notes.nested_syntaxes = {'ruby': 'ruby', 'python': 'python', 'c++': 'cpp', 'java': 'java',
"    \ 'sh': 'sh', 'viml': 'vim', 'xml': 'xml' }                         " 启用的代码语法高亮
" let g:vimwiki_list = [wiki_notes]                                            " 笔记列表
" nmap <leader>wc <Plug>VimwikiAll2HTML
" map <C-\>       <Plug>VimwikiToggleListItem

" ------------------------------------------------------------------------
" <Tag配置>
" ------------------------------------------------------------------------
Plug 'matt-snider/vim-tagquery', { 'do': 'bash install.sh' }
Plug 'majutsushi/tagbar'
nmap <C-\> :TagbarToggle<CR>
" 启动时自动focus
let g:tagbar_autofocus = 1
" for ruby, delete if you do not need
let g:tagbar_type_ruby = {
      \ 'kinds' : [
      \ 'm:modules',
      \ 'c:classes',
      \ 'd:describes',
      \ 'C:contexts',
      \ 'f:methods',
      \ 'F:singleton methods'
      \ ]
  \}

call plug#end()

" ------------------------------------------------------------------------
" <语言配置>
" ------------------------------------------------------------------------
let g:ruby_host_prog = '/home/liush/.rvm/rubies/ruby-2.5.3/bin/ruby' " ruby complier
let g:python3_host_prog = '/home/liush/miniconda3/bin/python' " python3 complier
" disbale syntax highlighting to prevent performence issue
let g:defx_icons_enable_syntax_highlight = 1
let g:deoplete#enable_at_startup = 1 " 自动启动 deoplete 自动补全

" ------------------------------------------------------------------------
" <外观配置>
" ------------------------------------------------------------------------
set cursorline " 高亮当前行
set number "显示行号
set laststatus=2                                      "启用状态栏信息
" set cmdheight=2                                       "设置命令行的高度为2，默认为1
set cursorline                                        "突出显示当前行
set nowrap                                            "设置不自动换行
" 设置代码配色方案
set nu
set t_Co=256
colorscheme gruvbox  "use the theme gruvbox
set background=dark "use the light version of gruvbox
" change the color of chars over the width of 80 into blue
" (uncomment to enable it)
"au BufWinEnter * let w:m2=matchadd('Underlined', '\%>' . 80 . 'v.\+', -1)
let $NVIM_TUI_ENABLE_TRUE_COLOR=1

" ------------------------------------------------------------------------
"  < 编辑器底栏>
" ------------------------------------------------------------------------
nmap t1 <Plug>AirlineSelectTab1
nmap t2 <Plug>AirlineSelectTab2
nmap t3 <Plug>AirlineSelectTab3
nmap t4 <Plug>AirlineSelectTab4
nmap t5 <Plug>AirlineSelectTab5
nmap t6 <Plug>AirlineSelectTab6
nmap t7 <Plug>AirlineSelectTab7
nmap t8 <Plug>AirlineSelectTab8
nmap t9 <Plug>AirlineSelectTab9
nmap t[ <Plug>AirlineSelectPrevTab
nmap t] <Plug>AirlineSelectNextTab

" ------------------------------------------------------------------------
" <编码配置>
" ------------------------------------------------------------------------
set encoding=utf-8                                    "设置gvim内部编码，默认不更改
set fileencoding=utf-8                                "设置当前文件编码，可以更改，如：gbk（同cp936）
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1     "设置支持打开的文件的编码

" ------------------------------------------------------------------------
"  < 编写文件时的配置 >
" ------------------------------------------------------------------------
syntax on
filetype on                                           "启用文件类型侦测
filetype plugin on                                    "针对不同的文件类型加载对应的插件
filetype plugin indent on                             "启用缩进
set smartindent                                       "启用智能对齐方式
set expandtab                                         "将Tab键转换为空格
set tabstop=2                                         "设置Tab键的宽度，可以更改，如：宽度为2
set shiftwidth=2                                      "换行时自动缩进宽度，可更改（宽度同tabstop）
set smarttab                                          "指定按一次backspace就删除shiftwidth宽度
set foldenable                                        "启用折叠
set foldlevel=1                                       " 折叠 level
set foldmethod=indent                                 "indent 折叠方式
" set foldmethod=syntax                                 "syntax 折叠方式
set ignorecase                                        "搜索模式里忽略大小写
set smartcase                                         "如果搜索模式包含大写字符，不使用 'ignorecase' 选项，只有在输入搜索模式并且打开 'ignorecase' 选项时才会使用
" set noincsearch                                     "在输入要搜索的文字时，取消实时匹配
set autoread                                          "当文件在外部被修改，自动更新该文件

noremap nt :tabnew<CR>
" 常规模式下用空格键来开关光标行所在折叠（注：zR 展开所有折叠，zM 关闭所有折叠）
" nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zo')<CR>
nnoremap <space> @=((foldclosed(line('.')) < 0) ? 'zc' : 'zA')<CR>
" 可用t<k,j,h,l>切换到上下左右的窗口中去
noremap <c-k> <c-w>k
noremap <c-j> <c-w>j
noremap <c-h> <c-w>h
noremap <c-l> <c-w>l

" ctrl + e 开关目录
nmap <c-e> :NERDTreeToggle<CR>
" 代码对齐
xmap ga <Plug>(EasyAlign)
nmap ga <Plug>(EasyAlign)

" 文件来回跳转
noremap H <c-^>
noremap L <c-^>

" 自动将quickfix输出放入vim
augroup quickfix
  autocmd!
  autocmd QuickFixCmdPre silent
  autocmd QuickFixCmdPost [^l]* cwindow | redraw!
augroup END

" S - Search word in current dictory
nnoremap S :silent grep! -r <cword> . <Return>
" <C-r>" is paste command in commend mode.
vnoremap S y:<C-U>silent grep! --line-number -R --exclude=*.log <C-r>" . <Return> 
