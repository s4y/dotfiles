" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I


" Vundle
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'

Plugin 'vim-coffee-script'
Plugin 'noc7c9/vim-iced-coffee-script'
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
Plugin 'Valloric/YouCompleteMe'
Plugin 'easymotion/vim-easymotion'
Plugin 'fatih/vim-go'
Plugin 'suan/vim-instant-markdown'
Plugin 'reedes/vim-pencil'
Plugin 'moll/vim-node'

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

" Make * and # respect smartcase
nnoremap <silent> * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap <silent> # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" Highlight searches, but make <esc> clear the highlights
set hls
noremap <silent> <leader><esc> :noh<cr>

noremap <silent> <leader>v :vnew<cr>
noremap <silent> <leader>f gqip

noremap <silent> <leader>l :set list!<cr>
set pastetoggle=<leader>p

let g:session_autoload = 'no'
let g:instant_markdown_slow = 1

" MacVim
if has("gui_running")
    set guioptions=egmrt
    set guifont=Source\ Code\ Pro:h11
    set guicursor=a:blinkon0
    if version >= 703
        set undofile
    endif
endif

" Stolen from omni5cience
command! -nargs=? -complete=help Lhelp :
	\ vertical topleft help <args> |
	\ vertical resize 80


" Stolen from oconnor663
let g:EasyMotion_keys = "asdghklqwertyuiopzxcvbnmfj"  " get rid of ;
let g:EasyMotion_do_mapping = 0
map <Leader>w <Plug>(easymotion-bd-w)
