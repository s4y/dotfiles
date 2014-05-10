" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I


" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-coffee-script'
Plugin 'bufexplorer.zip'
Plugin 'blackboard.vim'
Plugin 'repeat.vim'
Plugin 'xolox/vim-misc'
Plugin 'xolox/vim-session'
Plugin 'linediff.vim'
Plugin 'surround.vim'
Plugin 'commentary.vim'
Plugin 'fugitive.vim'
Plugin 'airblade/vim-gitgutter'
Plugin 'ctrlp.vim'
Plugin 'Cpp11-Syntax-Support'

call vundle#end()            " required
filetype plugin indent on    " required
" /Vundle

syntax on
colorscheme blackboard

au BufNewFile,BufRead *.cpp setf cpp11

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
noremap <up>     <c-w>k
noremap <down>   <c-w>j
noremap <left>   <c-w>h
noremap <right>  <c-w>l
inoremap <up>    <c-o><c-w>k
inoremap <down>  <c-o><c-w>j
inoremap <left>  <c-o><c-w>h
inoremap <right> <c-o><c-w>l

" Highlight searches, but make <esc> clear the highlights
set hls
noremap <silent> <leader><esc> :noh<cr>

noremap <silent> <leader>l :set list!<cr>
set pastetoggle=<leader>p

let g:session_autoload='no'

" MacVim
if has("gui_running")
    set guioptions=egmrt
    set guifont=Source\ Code\ Pro:h11
    set guicursor=a:blinkon0
    if version >= 703
        set undofile
    endif
endif
