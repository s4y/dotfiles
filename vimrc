" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I

if has('vim_starting')
	set rtp+=~/.vim/bundle/neobundle.vim
endif

call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

NeoBundle 'octol/vim-cpp-enhanced-highlight'
NeoBundle 'Sidnicious/vim-lasso'
NeoBundle 'Valloric/YouCompleteMe'
NeoBundle 'airblade/vim-gitgutter'
NeoBundle 'bufexplorer.zip'
NeoBundle 'commentary.vim'
NeoBundle 'wincent/Command-T'
NeoBundle 'fatih/vim-go'
NeoBundle 'fugitive.vim'
NeoBundle 'NLKNguyen/papercolor-theme'

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

" Join lines with a single space, even after '.', '?', or '!'.
set nojoinspaces

" Status line
set laststatus=2 statusline=[%c,%l]\ %y\ %t\ %m

" Smart case sentitivity for searches
set ignorecase smartcase

" Frieldlier split defaults
set splitright

" http://stackoverflow.com/a/526940/84745
set wildmode=longest,list,full
set wildmenu

" Mouse
set mouse=a

" Quicker timeout for multi-key mappings
set timeoutlen=250

" Arrow keys navigate splits.
noremap <up>     <c-w>k
noremap <down>   <c-w>j
noremap <left>   <c-w>h
noremap <right>  <c-w>l
inoremap <up>    <c-o><c-w>k
inoremap <down>  <c-o><c-w>j
inoremap <left>  <c-o><c-w>h
inoremap <right> <c-o><c-w>l

set autoindent
set formatoptions+=n
set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*\\\|^-\ 

" * and # respect smartcase
nnoremap <silent> * /\<<C-R>=expand('<cword>')<CR>\><CR>
nnoremap <silent> # ?\<<C-R>=expand('<cword>')<CR>\><CR>

" YouCompleteMe shortcuts (replaces ctags)
nnoremap <C-]> :YcmCompleter GoTo<CR>
" nnoremap <C-[> :YcmCompleter GoToDeclaration<CR>

" Highlight searches
set hls

" Tab clears the current search highlight
noremap <silent> <Tab> :noh<cr>

" \f formats the current paragraph.
noremap <silent> <leader>f gwap

noremap <silent> <leader>l :set list!<cr>
set pastetoggle=<leader>p

" Don't allow read only files to be modified
autocmd BufRead * let &l:modifiable = !&readonly

let g:ycm_global_ycm_extra_conf = '~/src/dotfiles/ycm_extra_conf.py'

set bg=light
colorscheme PaperColor

" MacVim
if has("gui_running")
  set guioptions=e
  set guifont=Source\ Code\ Variable\ Regular:h12
  set guicursor=a:blinkon0
endif

exe 'set rtp+=' . expand('<sfile>:h') . "/vim.d"
