call plug#begin('~/.vim/plugged')

" Utils
" Plug 'gmarik/vundle'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-fugitive'
" Plug 'kien/ctrlp.vim'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'benmills/vimux'
Plug 'skalnik/vim-vroom'
Plug 'toyamarinyon/vim-swift'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
" Plug 'vim-syntastic/syntastic'
" Plug 'mamut/vim-css-hex'
" Plug 'skammer/vim-css-color'
" Plug 'bling/vim-airline'
" Plug 'basepi/vim-conque'
" Plug 'yerdle/vim-ruby-conque'
" Plug 'myusuf3/numbers.vim'
" Plug 'jpalardy/vim-slime'
" Plug 'vim-scripts/ZoomWin'
" Plug 'Lokaltog/vim-powerline'
" Plug 'terryma/vim-multiple-cursors'
" Plug 'FredKSchott/CoVim'
" Plug 'junegunn/vim-easy-align'
" Plug 'junegunn/vim-github-dashboard'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'

if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  let g:deoplete#enable_at_startup = 1
endif

" Langs
" Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-haml'
Plug 'kchmck/vim-coffee-script'
Plug 'groenewege/vim-less'
Plug 'slim-template/vim-slim'
" Plug 'mxw/vim-jsx'
" Plug 'isRuslan/vim-es6'
" Plug 'othree/yajs.vim'
Plug 'pangloss/vim-javascript'
Plug 'mxw/vim-jsx'
Plug 'sheerun/vim-polyglot'

" Colors
Plug 'jnurmine/Zenburn'
Plug 'chriskempson/vim-tomorrow-theme'
Plug 'peeinears/vim-tomorrow-night-dark'
Plug 'altercation/vim-colors-solarized'
Plug 'MaxSt/FlatColor'
Plug 'mhartington/oceanic-next'
Plug 'joshdick/onedark.vim'

Plug 'uguu-org/vim-matrix-screensaver' " gotta have it

call plug#end()


set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required!

" set rtp+=~/.vim/bundle/vundle/
" call vundle#rc()

filetype plugin indent on       " load file type plugins + indentation

" Set <leader> key to ,
let mapleader = ","

" Slime plugin config
let g:slime_target = "tmux"

syntax enable
set encoding=utf-8
set showcmd                     " display incomplete commands
set mouse=a
set number                      " Enable line numbers

"" Show Invisibles
" Shortcut to rapidly toggle `set list`
nmap <leader>l :set list!<CR>
nmap <leader>f :Ack 
nmap <leader>n :NERDTreeToggle<CR>

" Powerline font
let g:Powerline_symbols = 'fancy'

" Use the same symbols as TextMate for tabstops and EOLs
" set listchars=tab:▸\ ,eol:¬

" Some keyboard mappings from Janus
" use :w!! to write to a file using sudo if you forgot to 'sudo vim file'
" (it will prompt for sudo password when writing)
cmap w!! %!sudo tee > /dev/null %

nmap <silent> ,. :bnext<CR>             " Next buffer
nmap <silent> ,m :bprev<CR>             " Previous buffer
set visualbell t_vb=                    " Silence bells
set nostartofline                       " When paging, don't go to the start of the line
set laststatus=2                        " show status line all the time
set statusline=
set statusline+=%<\                     " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\      " flags and buf no
set statusline+=%-40f\                  " path
set statusline+=%=%1*%y%*%*\            " file type
set statusline+=%10((%l,%c)%)\          " line and column
set statusline+=%P                      " percentage of file
set scrolloff=5                         " don't scroll any closer to top/bottom
set backspace=2                         " Set for maximum backspace smartness

" Invisible character colors
highlight NonText guifg=#4a4a59
highlight SpecialKey guifg=#4a4

"" Whitespace
set tabstop=2 shiftwidth=2      " a tab is two spaces (or set this to 4)
set expandtab                   " use spaces, not tabs (optional)
set smarttab                    " fix <BS> key
set backspace=indent,eol,start  " backspace through everything in insert mode

"" Searching
set hlsearch                    " highlight matches
set incsearch                   " incremental searching
set ignorecase                  " searches are case insensitive...
set smartcase                   " ... unless they contain at least one capital letter

"" Dealing with unsaved buffers
set hidden                      " Allow unsaved buffers
set confirm                     " Confirm all unsaved buffers on exit

"" tab bar color
hi TabLineFill ctermfg=234 ctermbg=234
hi TabLine ctermfg=235  ctermbg=250
hi TabLineSel ctermfg=255 ctermbg=238

"" Colorschemes

"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
" if (empty($TMUX))
  if (has("nvim"))
    "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
    let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
" endif

" set t_Co=256
set background=dark

" Solarized
" let g:solarized_termcolors = 256
" let g:solarized_visibility = "high"
" let g:solarized_contrast = "high"
" colorscheme solarized

" Zenburn
" let g:zenburn_high_Contrast = 1
" colorscheme zenburn

" colorscheme Tomorrow-Night-Dark
let g:onedark_color_overrides = { "black": {"gui": "#181A1F", "cterm": "235", "cterm16": "0" } }
colorscheme onedark

"" Keymappings
map ,n :NERDTreeToggle<CR>
" map ,t :CtrlP<CR>
map ,t :FZF<CR>

" map <Leader><Leader> :ZoomWin<CR>
" map zz :ZoomWin<CR>
" map ,z :ZoomWin<CR>

nmap <tab><tab> :tabnext<CR>
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
nmap <Tab>p :tabprevious<CR>
nmap <Tab>h :tabprevious<CR>
nmap <Tab>l :tabnext<CR>
nmap <Tab><Space> :tabnext<CR>
nmap <C-space> :tabnext<CR>

nmap <Tab><Left> :execute 'silent! tabmove ' . (tabpagenr()-2)<CR>
nmap <Tab><Right> :execute 'silent! tabmove ' . tabpagenr()<CR>

map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

imap <C-l> <Space>=><Space>

imap jj <Esc>

map vv :vsplit<CR>
map ss :split<CR>

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

au BufRead,BufNewFile *.hamlc set ft=haml

" let g:ctrlp_max_files = 0
" let g:ctrlp_by_filename = 0
" let g:ctrlp_max_depth = 40
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\.git$\|\.hg$\|\.svn$\|\.yardoc\|public\/images\|public\/system\|data\|log\|tmp$',
"   \ 'file': '\.exe$\|\.so$\|\.dat$'
"   \ }

let g:vroom_use_vimux=1
let g:vroom_use_spring=1
let g:vroom_use_bundle_exec=1
let g:vroom_clear_screen=0
map <leader>r :VroomRunTestFile<CR>
map <leader>l :VroomRunNearestTest<CR>


"" allow jsx highlighting in .js files
" let g:jsx_ext_required = 0

"" syntastic recommended settings
" set statusline+=%#warningmsg#
" set statusline+=%{SyntasticStatuslineFlag()}
" set statusline+=%*
" 
" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 1
" let g:syntastic_check_on_wq = 0

"" ctags
" open ctag in vertical pane
" nnoremap <C-]> :execute "vertical ptag " . expand("<cword>")<CR>
" open ctag in new tab
nnoremap <silent><Leader><C-]> :execute "tag " . expand("<cword>")<CR>
" nnoremap <C-]> :tabnew<CR>:execute("tag " . expand("<cword>"))<CR>
