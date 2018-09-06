" Thanks to nicholasbs and omni5cience for parts of this

set nocompatible
set shortmess+=I

" To install:
" curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
"     https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
call plug#begin('~/.vim/plugged')

Plug 'octol/vim-cpp-enhanced-highlight'
Plug 'Sidnicious/vim-lasso'
Plug 'Valloric/YouCompleteMe'
Plug 'airblade/vim-gitgutter'
Plug 'vim-scripts/bufexplorer.zip'
Plug 'vim-scripts/commentary.vim'
Plug 'wincent/Command-T'
Plug 'fatih/vim-go'
Plug 'vim-scripts/fugitive.vim'
Plug 'NLKNguyen/papercolor-theme'

call plug#end()
filetype plugin indent on

syntax on

" Line wrapping
set nowrap linebreak nolist

" Line numbering
set number

" Nicer invisible characters (:set list)
" From http://vimcasts.org/episodes/show-invisibles/
set listchars=tab:▸\ ,eol:¬
set list

" Two spaces. RIP tabs.
set ts=2 sts=2 sw=2 expandtab

" Join lines with a single space, even after '.', '?', or '!'.
set nojoinspaces

" Status line
set laststatus=2 statusline=[%c,%l]\ %y\ %t\ %m

" When searching, only be case sensitive if there's at least one uppercase
" character in the search string.
set ignorecase smartcase

" Split to the right by default.
set splitright

" http://stackoverflow.com/a/526940/84745
set wildmode=longest,list,full
set wildmenu

" Mouse support on.
set mouse=a

" Quicker timeout for saving swap files, updating the gutter, etc.
set updatetime=500

" Arrow keys navigate splits.
noremap <up>     <c-w>k
noremap <down>   <c-w>j
noremap <left>   <c-w>h
noremap <right>  <c-w>l
inoremap <up>    <c-o><c-w>k
inoremap <down>  <c-o><c-w>j
inoremap <left>  <c-o><c-w>h
inoremap <right> <c-o><c-w>l

" Auto indent (incl. while reformatting) in a way that's friendly to lists.
set autoindent
set formatoptions+=n
set formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*\\\|^-\ 

" YouCompleteMe shortcuts
nnoremap <C-]> :YcmCompleter GoTo<CR>
nnoremap \| :YcmCompleter FixIt<cr>

" Highlight search results.
set hls

" Tab clears the current search highlight.
noremap <silent> <Tab> :noh<cr>

" \f formats the current paragraph.
noremap <silent> <leader>f gwap

noremap <silent> <leader>l :set list!<cr>
set pastetoggle=<leader>p

" Don't allow read only files to be modified — it confuses me.
autocmd BufRead * let &l:modifiable = !&readonly

let g:ycm_global_ycm_extra_conf = '~/src/dotfiles/ycm_extra_conf.py'

set bg=light
colorscheme PaperColor

if has("gui_running")
  set guioptions=e
  set guifont=Source\ Code\ Variable\ Regular:h12
  set guicursor=a:blinkon0
endif
