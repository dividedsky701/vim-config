"
" dividedsky701's .vimrc  
"
" Can't remember the original source of the file, but they deserve most of the
" credit.
" I've tweaked it a few times over the years.
"

" Setup pathogen stuff
runtime bundle/vim-pathogen/autoload/pathogen.vim
execute pathogen#infect()

" Basic Settings
set nocompatible                " if I wanted compatible mode...I'd use Vi
set background=dark             " we are using a dark background
syntax on                       " syntax hilighting on
set history=1000                " remember 1000 lines of history
set clipboard+=unnamed          " shared clipboard if on windows
set fileformats=unix,dos,mac    " supported filetypes
set viminfo+=!                  " make sure it can save viminfo
set iskeyword+=_,$,@,%,#        " none of these should be word dividers
set nostartofline               " don't move cursor
let mapleader=","               " , makes a much better mapleader than \

" File options
set backup 
set backupdir=~/.vim/backup
set directory=~/.vim/temp
set makeef=error.err
set sessionoptions+=globals
set sessionoptions+=localoptions
set sessionoptions+=resize
set sessionoptions+=winpos

" File Ignores
set wildignore=*.dll,*.o,*.obj,*.bak,*.exe,*.pyc,*.swp,*.jpg,*.gif,*.png


" UI Settings
set popt+=syntax:y          " Syntax when printing
set showcmd                 " show the command being typed
set linespace=0             " space it out a little more (easier to read)
set wildmenu                " turn on wild menu
set wildmode=list:longest   " turn on wild menu in special format (long format)
set ruler                   " Always show current positions along the bottom
set cmdheight=1             " the command bar is 1 high
set number                  " turn on line numbers
set numberwidth=4           " max 9999 lines
set lazyredraw              " redraw lazily
set hidden                  " move between buffers sans saving
set backspace=2             " normal backspace
set whichwrap+=<,>,[,],h,l  " backspace and cursor keys wrap to
set mouse=a                 " use mouse everywhere
set shortmess=atI           " shorter messages
set report=0                " keep track of changes
set noerrorbells            " stay quiet on errors


" Display settings
set showmatch           " show matching brackets
set matchtime=5         " how many tenths of a second to blink matching brackets for
set nohlsearch          " do not highlight searched for phrases
set incsearch           " BUT do highlight as you type you search phrase
set scrolloff=5         " Keep 5 lines (top/bottom) for scope
set sidescrolloff=5     " Keep 5 lines at the size
set novisualbell        " don't blink
set laststatus=2        " always show the status line

" Deprecated when using powerline
set statusline=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [ASCII=\%03.3b]\ [HEX=\%02.2B]\ [POS=%04l,%04v][%p%%]\ [LEN=%L]


" Indenting
set nosmartindent           " smartindent (filetype indenting instead)
set autoindent              " autoindent (should be overwrote by cindent or filetype indent)
set cindent                 " do c-style indenting
set softtabstop=2           " unify
set shiftwidth=2            " unify
set tabstop=2               " real tabs should be 4, but they will show with set list on
filetype plugin indent on   " load filetype plugins and indent settings

" Text Formatting
set formatoptions=tcrq
set shiftround 
set expandtab           
set nowrap             
set preserveindent    
set ignorecase
set smartcase
set completeopt=menu,longest,preview

" Folding
set foldenable
set foldmarker={,}
set foldcolumn=4
set foldmethod=manual
set foldlevel=100
set foldopen-=search
set foldopen-=undo



" Special Grep Function
function! Edgrep()
    call inputsave()
    let rgx = input('Enter regex: ')
    call inputrestore()
    execute "vimgrep /" . rgx . "/j % | cw"
endfunction

" KeyBindings
map <up> <ESC>:bp<RETURN>                   " up arrow (normal mode) switches to previous buffer
map <down> <ESC>:bn<RETURN>                 " down arrow (normal mode) switches to next buffer
map <right> <ESC>:Tlist<RETURN>             " right arrow (normal mode) toggles taglist
map <left> <ESC>:NERDTreeToggle<RETURN>     " left arrow (normal mode) toggles nerdtree
map <F8> <ESC>:execute Edgrep()<RETURN>     " custom grep function for regexps
map <F6> <ESC>:cn<RETURN>                   " cnext
map <F7> <ESC>:cp<RETURN>                   " cprevious


" Settings for GVim
if has("gui_running")
  if has("win32") || has("win16")
    set guifont=Consolas:h11:cANSI
  else
    set guifont=Monospace\ 10          
  endif
    set guioptions=acgm "special gui options.  see :help go
    set nomousehide
    set lines=60
    set columns=240
    colorscheme wombat
    let do_syntax_sel_menu = 1|runtime! synmenu.vim
else
    set t_Co=256
    colorscheme wombat256mod
endif

" ------------ PLUGIN SETTINGS -------------------"

" Taglist Settings
let Tlist_Ctags_Cmd = 'ctags'                       " Location of ctags
let Tlist_Sort_Type = "name"                        " order by
let Tlist_Auto_Open=0                               " let the tag list open automagically
let Tlist_Use_Right_Window = 1                      " split to the right side of the screen
let Tlist_Compact_Format = 1                        " show small menu
let Tlist_Exist_OnlyWindow = 1                      " if you are the last, kill yourself
let Tlist_File_Fold_Auto_Close = 0                  " Do not close tags for other files
let Tlist_Enable_Fold_Column = 1                    " Do show folding tree
let Tlist_Show_One_File=1                           " Only show the current file
let Tlist_WinWidth = 40                             " make it 40 columns wide by default
let tlist_c_settings = 'c;f:function'               " custom settings for C files
let tlist_cpp_settings = 'c++;f:function;c:class'   " custom settings for C++ files
hi MyTagListFileName guibg=black guifg=yellow " Custom color for the taglist filename
let b:match_ignorecase = 1

" NerdTree Settings
let g:NERDTreeIgnore = ['\~$','\.d$','\.o$']  " ignore certain filetypes in nerdtree

" Powerline Settings
let g:Powerline_symbols='compatible'


" vim:set ts=2 sts=2 sw=2
