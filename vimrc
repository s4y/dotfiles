" Thanks to nicholasbs and omni5cience for parts of this

call pathogen#infect()
syntax on
filetype plugin indent on
colorscheme blackboard

" Line wrapping
set nowrap linebreak nolist

" Line numbering
set number

" Tabs
set tabstop=4 softtabstop=4 shiftwidth=4 noexpandtab

" Status line
set laststatus=2 statusline=[%c,%l]\ %y

" Undo/backup files
set backupdir=~/.vim/backup
set directory=~/.vim/backup


" MacVim
if has("gui_running")
    set guioptions=egmrt
    set guifont=Consolas\ for\ BBEdit:h16
    " require vim 7.3
    set undofile
endif
