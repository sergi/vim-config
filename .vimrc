set nocompatible
" allow unsaved background buffers and remember marks/undo for them
set hidden
" remember more commands and search history
set history=1000
set expandtab
set tabstop=4
set shiftwidth=4
set softtabstop=4
set autoindent
set laststatus=2
set lazyredraw       " don't redraw when don't have to
set noerrorbells     " no error bells please
set showmatch
set incsearch
set hlsearch
" make searches case-sensitive only if they contain upper-case characters
set ignorecase smartcase
" highlight current line
set cursorline
set cmdheight=2
set switchbuf=useopen
set numberwidth=5
set showtabline=2
set winwidth=79

" Prevent Vim from clobbering the scrollback buffer. See
" http://www.shallowsky.com/linux/noaltscreen.html
set t_ti= t_te=
" keep more context when scrolling off the end of a buffer
set scrolloff=3
" Store temporary files in a central spot
set backupdir=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
set directory=~/.vim-tmp,~/.tmp,~/tmp,/var/tmp,/tmp
" allow backspacing over everything in insert mode
set backspace=indent,eol,start
" display incomplete commands
set showcmd
" Enable highlighting for syntax
syntax on
" Enable file type detection.
" Use the default filetype settings, so that mail gets 'tw' set to 72,
" 'cindent' is on in C files, etc.
" Also load indent files, to automatically do language-dependent indenting.
filetype plugin indent on
" use emacs-style tab completion when selecting files, etc
set wildmode=longest,list
" make tab completion for files/buffers act like bash
set wildmenu
let mapleader=","

set modelines=0 " prevents some security exploits having to do with modelines in files.

call pathogen#helptags()
call pathogen#runtime_append_all_bundles()

"syntax enable
"set background=light

set showmode                      " Display the mode you're in.
set guifont=Menlo:h17
set number

set smartindent
set gdefault

set wrap
set textwidth=80
set formatoptions=qrn1
set colorcolumn=80

set list

nnoremap <up> <nop>
nnoremap <down> <nop>
nnoremap <left> <nop>
nnoremap <right> <nop>
noremap <up> <nop>
noremap <down> <nop>
noremap <left> <nop>
noremap <right> <nop>
nnoremap j gj
nnoremap k gk

" open a new vertical split and switch over to it.
nnoremap <leader>w <C-w>v<C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

" au FocusLost * :wa " Save on lost focus

inoremap jj <ESC>
inoremap <C-l> <Esc>A
vnoremap . :norm.<CR>

set encoding=utf-8
set fileencoding=utf-8
set relativenumber
set hidden
set ruler                         " Show cursor position.
set backspace=indent,eol,start    " Intuitive backspacing.
set nobackup                      " Don't make a backup before overwriting a file.
set nowritebackup                 " And again.
set undodir=/Volumes/Macintosh\ HD/.vimundo,.
set undofile " tells Vim to create <FILENAME>.un~ files whenever you edit a file. "

nnoremap <C-j> o<Esc>k$
set wildignore+=vendor,log,tmp,*.swp,*.o,*.obj,*.pyc,*.swc,*.DS_STORE,*.bkp
"set lines=60 columns=180
nnoremap <F4> :buffers<CR>:buffer<space>

"Remove MacVim's toolbar
if has("gui_running")
    set guioptions=egmrt
    set guioptions-=T        " no toolbar
    set guioptions-=l        " no left scrollbar
    set guioptions-=L        " no left scrollbar
    set guioptions-=r        " no right scrollbar
    set guioptions-=R        " no right scrollbar
endif

set listchars=tab:▸\ ,eol:¬

" on save any: trim trailing whitespace
autocmd! BufWrite * mark ' | silent! %s/\s\+$// | norm ''

au BufNewFile,BufRead *.json set ft=json
au BufNewFile,BufRead *.sjs set ft=javascript

set complete=.,b,u,]
" Map completion to Tab
"imap <Tab> <C-P>

iab funciton function
" for mistyping :w as :W
command! W :w

" Command-mode completion
colorscheme mayansmoke

" Rainbox Parentheses {{{
nnoremap <leader>R :RainbowParenthesesToggle<cr>
let g:rbpt_colorpairs = [
    \ ['brown',       'RoyalBlue3'],
    \ ['Darkblue',    'SeaGreen3'],
    \ ['darkgray',    'DarkOrchid3'],
    \ ['darkgreen',   'firebrick3'],
    \ ['darkcyan',    'RoyalBlue3'],
    \ ['darkred',     'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['brown',       'firebrick3'],
    \ ['gray',        'RoyalBlue3'],
    \ ['black',       'SeaGreen3'],
    \ ['darkmagenta', 'DarkOrchid3'],
    \ ['Darkblue',    'firebrick3'],
    \ ['darkgreen',   'RoyalBlue3'],
    \ ['darkcyan',    'SeaGreen3'],
    \ ['darkred',     'DarkOrchid3'],
    \ ['red',         'firebrick3'],
    \ ]
let g:rbpt_max = 16

set laststatus=2 " Always show the statusline

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" OPEN FILES IN DIRECTORY OF CURRENT FILE
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
cnoremap %% <C-R>=expand('%:h').'/'<cr>
map <leader>e :edit %%
map <leader>v :view %%
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" InsertTime COMMAND
" Insert the current time
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
command! InsertTime :normal a<c-r>=strftime('%F %H:%M:%S.0 %z')<cr>
