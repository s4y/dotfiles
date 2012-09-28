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
map <up>     <c-w>k
map <down>   <c-w>j
map <left>   <c-w>h
map <right>  <c-w>l
imap <up>    <c-o><c-w>k
imap <down>  <c-o><c-w>j
imap <left>  <c-o><c-w>h
imap <right> <c-o><c-w>l

" MacVim
if has("gui_running")
    set guioptions=egmrt
    set guifont=Inconsolata\-g:h18
    set guicursor=a:blinkon0
    if version >= 703
        set undofile
    endif
endif
