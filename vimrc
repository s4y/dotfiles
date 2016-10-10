" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I

if has('vim_starting')
	set rtp+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'Shougo/vimproc.vim', {
	\ 'build' : {
	\     'windows' : 'tools\\update-dll-mingw',
	\     'cygwin' : 'make -f make_cygwin.mak',
	\     'mac' : 'make',
	\     'linux' : 'make',
	\     'unix' : 'gmake',
	\    },
	\ }

NeoBundle 'vim-coffee-script'
NeoBundle 'rhysd/vim-clang-format'
NeoBundle 'noc7c9/vim-iced-coffee-script'
NeoBundle 'bufexplorer.zip'
NeoBundle 'altercation/vim-colors-solarized'
NeoBundle 'repeat.vim'
NeoBundle 'xolox/vim-misc'
NeoBundle 'xolox/vim-session'
NeoBundle 'linediff.vim'
NeoBundle 'surround.vim'
NeoBundle 'commentary.vim'
NeoBundle 'fugitive.vim'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'ctrlpvim/ctrlp.vim'
NeoBundle 'Cpp11-Syntax-Support'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'easymotion/vim-easymotion'
NeoBundle 'fatih/vim-go'
" NeoBundle 'suan/vim-instant-markdown'
NeoBundle 'reedes/vim-pencil'
NeoBundle 'moll/vim-node'
NeoBundle 'scrooloose/syntastic'
NeoBundle 'derekwyatt/vim-fswitch'
NeoBundle 'Sidnicious/vim-lasso'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck

syntax on

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
set backupcopy=yes
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

" Use jk to exit insert mode
imap jk <Esc>

" Highlight searches, but make <esc> clear the highlights
set hls
noremap <silent> <leader><esc> :noh<cr>

noremap <silent> <leader>v :vnew<cr>
noremap <silent> <leader>f gqip

noremap <silent> <leader>l :set list!<cr>
set pastetoggle=<leader>p

let g:session_autoload = 'no'
let g:session_autosave = 'no'
let g:instant_markdown_slow = 1

let g:syntastic_javascript_checkers = ['jshint']

let g:clang_format#style_options = {
	\ "Standard" : "C++11",
	\ "UseTab" : "ForIndentation",
	\ "TabWidth" : "4",
	\ "AlignAfterOpenBracket" : "false"
\ }


" MacVim
if has("gui_running")
	let g:solarized_visibility="low"
	set bg=light
	colorscheme solarized
    set guioptions=e
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
