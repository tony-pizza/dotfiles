" https://github.com/tashian/dotfiles/blob/master/vimrc
" https://github.com/skwp/dotfiles/blob/master/vimrc

set nocompatible                " choose no compatibility with legacy vi
filetype off                    " required!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

"" Vundle
Bundle 'gmarik/vundle'
Bundle 'mileszs/ack.vim'
Bundle 'vim-ruby/vim-ruby'
Bundle 'tpope/vim-rails'
Bundle 'tpope/vim-haml'
Bundle 'tpope/vim-endwise'
Bundle 'tpope/vim-surround'
Bundle 'tpope/vim-fugitive'
Bundle 'kien/ctrlp.vim'
Bundle 'scrooloose/nerdtree'
" Bundle 'myusuf3/numbers.vim' " relative line numbers
Bundle 'Lokaltog/vim-powerline'
Bundle 'kchmck/vim-coffee-script'
Bundle 'jpalardy/vim-slime'
Bundle 'vim-scripts/ZoomWin'
" Colors
Bundle 'chriskempson/vim-tomorrow-theme'
Bundle 'altercation/vim-colors-solarized.git'
Bundle 'uguu-org/vim-matrix-screensaver' " gotta have it

filetype plugin indent on       " load file type plugins + indentation

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
set statusline+=%<\                       " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\        " flags and buf no
set statusline+=%-40f\                    " path
set statusline+=%=%1*%y%*%*\              " file type
set statusline+=%10((%l,%c)%)\            " line and column
set statusline+=%P                        " percentage of file
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

"" Colorschemes
set t_Co=256
set background=dark

" Solarized
let g:solarized_termcolors = 256
let g:solarized_visibility = "high"
let g:solarized_contrast = "high"
" colorscheme solarized

" Zenburn
let g:zenburn_high_Contrast = 1
" colorscheme zenburn

colorscheme tom

"" Keymappings
map ,n :NERDTreeToggle<CR>
map ,t :CtrlP<CR>

map <Leader><Leader> :ZoomWin<CR>
map zz :ZoomWin<CR>
map ,z :ZoomWin<CR>

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
map <C-l> <C-w>l

imap jj <Esc>

map vv :vsplit<CR>
map ss :split<CR>

if $VIM_CRONTAB == "true"
  set nobackup
  set nowritebackup
endif

au BufRead,BufNewFile *.hamlc set ft=haml

let g:ctrlp_by_filename = 0
