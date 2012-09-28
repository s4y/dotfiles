" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible

call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme blackboard

" Line wrapping
set nowrap linebreak nolist

" Line numbering
set number

" Nicer invisible characters (:set list)
" From http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Status line
set laststatus=2 statusline=[%c,%l]\ %y\ %t

" Smart case sentitivity for searches
set ignorecase smartcase

" Undo/backup files
set backupdir=~/.vim/backup
if version >= 703
    set undodir=~/.vim/backup
endif
set directory=~/.vim/backup

" Mouse
set mouse=a

" Shit just got real
" Disable the arrow keys
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>
imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>

" MacVim
if has("gui_running")
    set guioptions=egmrt
    set guifont=Inconsolata\-g:h18
    set guicursor=a:blinkon0
    if version >= 703
        set undofile
    endif
endif
