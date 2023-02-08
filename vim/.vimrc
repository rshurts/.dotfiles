set nocompatible      " skip vi compatibility
set t_Co=256          " use 256 colors
syntax enable         " enable syntax highlighting
set encoding=utf-8    " use UTF-8
set fileformat=unix   " use unix line endings
set laststatus=2      " show the status bar
set number            " show line numbers
set relativenumber    " use relative line number
set autoread          " reload files when changed on disk
set ai                " auto-indent
set expandtab         " change tabs to spaces
set shiftwidth=2      " use 2 space indents
set softtabstop=2     " insert mode tab and backspace use 2 spaces
set tabstop=2         " actual tabs use 2 spaces
set list!             " show trailing whitespace, tabs, and long lines
set listchars=""
set listchars+=tab:\▸\ ,trail:▫,extends:→,precedes:←
set ignorecase        " case insensitive search
set smartcase         " case sensitive search is used if a capital letter is entered
set hlsearch          " highlight during searches
set incsearch         " start searching during typing
set mouse=a           " allow mouse use everywhere, prevent selecting line numbers
set wildmenu          " use Tab completion in menus
set wildmode=list:longest,list:full
set visualbell t_vb=  " turn off visual bell
set cursorline        " highlight the current line
set colorcolumn=""    " turn off column highlight
set scrolloff=8       " show lines around cursor

" keybindings
let mapleader = "\<Space>"

inoremap kj <Esc>

" because I hold shift too long
command W w
command Wq wq
command WQ wq
command Q q

" get rid of search highlights
nnoremap <leader><space> :noh<cr>

" split windows
nnoremap <leader>s :sp<cr><C-w><C-w>
nnoremap <leader>v :vsp<cr><C-w><C-w>
nnoremap <leader>ss :new<cr><C-w><C-w>
nnoremap <leader>vv :vnew<cr><C-w><C-w>

" switch between windows
nnoremap <leader>h :wincmd h<cr>
nnoremap <leader>j :wincmd j<cr>
nnoremap <leader>k :wincmd k<cr>
nnoremap <leader>l :wincmd l<cr>

" change cursor type based on mode
let &t_SI = "\e[6 q"
let &t_EI = "\e[2 q"

" handle italic escape codes
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"

" switch line numbers
function! LineNumberToggle()
  if(&relativenumber == 1)
    set norelativenumber
  else
    set relativenumber
  endif
endfunc
nnoremap <leader>n :call LineNumberToggle()<cr>

" make OSX backspace work for more than current insert
set backspace=indent,eol,start

" move temp files to specific directories
set backupdir=~/.vim/backup//
set directory+=~/.vim/swap//
set undodir=~/.vim/undo//
set viminfo+=n~/.vim/viminfo

" pretty print JSON
command Pretty %!python -m json.tool

" vundle setup
filetype off
set rtp+=~/.vim/bundle/Vundle.vim/
call vundle#begin()
Plugin 'gmarik/Vundle.vim'

" my bundles
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'sheerun/vim-polyglot'
Plugin 'tpope/vim-markdown'
Plugin 'tpope/vim-fugitive'
Plugin 'airblade/vim-gitgutter'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'scrooloose/nerdcommenter'
Plugin 'w0rp/ale'
Plugin 'chriskempson/base16-vim'
Plugin 'haishanh/night-owl.vim'
Plugin 'junegunn/goyo.vim'
Plugin 'junegunn/limelight.vim'
Plugin 'reedes/vim-pencil'
Plugin 'reedes/vim-colors-pencil'
Plugin 'editorconfig/editorconfig-vim'

call vundle#end()
filetype plugin indent on

" airline config
let g:airline_powerline_fonts = 1

" vim-polyglot config
let g:jsx_ext_required=0  " allow jsx in js files

" gitgutter config
set updatetime=180

" NERDTRee config
let NERDTreeShowHidden = 1
nnoremap <leader><Tab> :NERDTreeToggle<cr>

" NERDCommenter config
let NERDSpaceDelims = 1

" ale config
let g:ale_sign_error = '✗'
let g:ale_sign_warning = '▰'
highlight link ALEErrorSign Todo
highlight link ALEWarningSign Todo
let g:ale_echo_msg_format = '[%linter%] %s'
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_insert_leave = 1
let g:ale_fix_on_save = 1
let g:ale_fixers = {'javascript': ['eslint', 'prettier']}

" colorscheme config
if has("termguicolors")
  set termguicolors
endif

set background=dark

colorscheme base16-ocean
let g:airline_theme = 'base16'

" colorscheme night-owl
" let g:airline_theme = 'night_owl'


" function! SwapPalette()
  " if(&background == "dark")
    " set background=light
    " colorscheme base16-solarized-light
    " let g:airline_theme = 'base16'
  " else
    " set background=dark
    " colorscheme base16-ocean
    " let g:airline_theme = 'base16'
  " endif
" endfunc
" nnoremap <leader>pp :call SwapPalette()<cr>

" set the proper font and increase line spacing
if has("gui_macvim")
  set linespace=1
  set guifont=Source\ Code\ Pro:h14
  set background=dark
  set colorscheme base16-ocean
  let g:airline_theme = 'base16'
endif

" goyo config
function! s:goyo_enter()
  Pencil
  Limelight
  " colorscheme pencil
  " set background=light
  set spell spelllang=en_us
  set lbr
endfunc
function! s:goyo_leave()
  PencilOff
  Limelight!
  " colorscheme base16-ocean
  " colorscheme night-owl
  " set background=dark
  set nospell
  set nolbr
endfunc
autocmd! User GoyoEnter nested call <SID>goyo_enter()
autocmd! User GoyoLeave nested call <SID>goyo_leave()

" use 4 space tabs for python and markdown
au BufEnter *.py,*.pyw,*.md,*.markdown,*.feature setlocal shiftwidth=4     " use 4 space indents
au BufEnter *.py,*.pyw,*.md,*.markdown,*.feature setlocal softtabstop=4    " insert mode tab and backspace use 4 spaces
au BufEnter *.py,*.pyw,*.md,*.markdown,*.feature setlocal tabstop=4        " actual tabs use 4 spaces

" use 8 space hard tabs for golang
au BufEnter *.go setlocal noexpandtab        " use tabs
au BufEnter *.go setlocal shiftwidth=8       " use 8 columns indents
au BufEnter *.go setlocal softtabstop=8      " insert mode tab and backspace use 8 columns
au BufEnter *.go setlocal tabstop=8          " actual tabs are 8 columns

" set column lines to match style guides
au BufEnter *.py,*.pyw setlocal colorcolumn=80                " PEP-8
au BufEnter *.js,*.jsx,*.ts,*.tsx setlocal colorcolumn=100    " Airbnb JS style guide
