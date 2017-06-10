" <Tab> clears the highlighted search.
" <Tab><Tab> highlights the word under the cursor.
" The complexity avoids delaying <Tab> by `timeoutlen`.

" One <Tab> clears the search highlight and emits <SID><Plug> to prime
" Vim for the following mappings.
noremap <script> <silent> <Tab> :noh<CR><SID><Plug>

" A second <Tab> highlights the word under the cursor and adds it to search
" history.
noremap <script> <silent> <SID><Plug><Tab> :let @/="\\<<C-R>=expand('<cword>')<CR>\\>"<CR>:call histadd("/", @/)<CR>:set hls<CR>

" Anything other than <Tab> is a no-op. Without this mapping, Vim beeps if
" <Tab> isn't pressed a second time after `timeoutlen`.
noremap <script> <silent> <SID><Plug> <Nop>
