" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I


" Vundle
filetype off

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

Bundle 'gmarik/vundle'

Bundle "vim-coffee-script"
Bundle "bufexplorer.zip"
Bundle 'blackboard.vim'
Bundle "repeat.vim"
Bundle "xolox/vim-misc"
Bundle "xolox/vim-session"
Bundle "linediff.vim"
Bundle "surround.vim"
Bundle "commentary.vim"
Bundle "fugitive.vim"
Bundle "airblade/vim-gitgutter"
Bundle "ctrlp.vim"

filetype plugin indent on
" /Vundle
"
syntax on
colorscheme blackboard

" Line wrapping
set nowrap linebreak nolist

" Line numbering
set number

" Nicer invisible characters (:set list)
" From http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬
set list

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Status line
set laststatus=2 statusline=[%c,%l]\ %y\ %t\ %m

" Smart case sentitivity for searches
set ignorecase smartcase

" Frieldlier split defaults
" set splitbelow
set splitright

" http://stackoverflow.com/a/526940/84745
set wildmode=longest,list,full
set wildmenu

" Undo/backup files
set backupdir=~/.vim/backup
if version >= 703
    set undodir=~/.vim/backup
endif

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
    set guifont=Source\ Code\ Pro:h11
    set guicursor=a:blinkon0
    if version >= 703
        set undofile
    endif
endif
