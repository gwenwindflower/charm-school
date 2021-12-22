" Map Leader - Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" NERD Tree
nnoremap <leader>n :NERDTreeToggle<CR>

" Goyo / Limelight
nnoremap <leader>j :Goyo<CR>

" Quick Split Navigation
" nnoremap <C-j> <C-w>j
" nnoremap <C-k> <C-w>k
" nnoremap <C-h> <C-w>h
" nnoremap <C-l> <C-w>l
" nnoremap <C-x> <C-w>q

"buffer nav
nnoremap <Leader>bp :bp<CR>
nnoremap <Leader>bn :bn<CR>

" Terminal
noremap <leader>s :term<CR>

" CoC
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <C-l> for trigger snippet expand.
imap <C-l> <Plug>(coc-snippets-expand)

" Use <C-j> for select text for visual placeholder of snippet.
vmap <C-j> <Plug>(coc-snippets-select)

" Use <C-j> for jump to next placeholder, it's default of coc.nvim
let g:coc_snippet_next = '<c-j>'
  
" Use <C-k> for jump to previous placeholder, it's default of coc.nvim
let g:coc_snippet_prev = '<c-k>'

" Use <C-j> for both expand and jump (make expand higher priority.))
imap <C-j> <Plug>(coc-snippets-expand-jump)

" Whale
nmap <Leader>wh :w<CR>:exec '!/usr/local/bin/wh run %'<CR>:e<CR>
"" set a substition string in the above to re-run

" dbt
nmap <Leader>dt :w<CR>:call VimuxRunCommand('dbt run -m ' . expand('%:t:r'))<CR>
nmap <Leader>da :w<CR>:call VimuxRunCommand('dbt run -m +' . expand('%:t:r'))<CR>
nmap <Leader>dd :w<CR>:call VimuxRunCommand('dbt run -m ' . expand('%:t:r') . '+')<CR>
nmap <Leader>de :w<CR>:call VimuxRunCommand('dbt run -m +' . expand('%:t:r') . '+')<CR>
nmap <Leader>dc :w<CR>:call VimuxRunCommand('dbt compile -m +' . expand('%:t:r'))<CR>
nmap <Leader>dv :w<CR>:execute 'vsplit ' . substitute(expand('%:p'), 'models', 'target/compiled/models', '')<CR>
nmap <Leader>dcv :w<CR>:call VimuxRunCommand('dbt compile -m +' . expand('%:t:r'))<CR>:execute 'vsplit ' . substitute(expand('%:p'), 'models', 'target/compiled/models', '')<CR>
nmap <Leader>dp :w<CR>:call VimuxRunCommand('dbt compile -m ' . expand('%:t:r') && wh run substitute(expand('%:p'), 'models', 'target/compiled', ''))<CR>

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)

" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <leader>ft :TodoTelescope<CR>
nnoremap <leader>fr :TodoTrouble<CR>

" Reload vimrc
nnoremap <leader>sv :source $MYVIMRC<CR>

" Vimux
map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>

" Move text
nnoremap ∆ :m .+1<CR>==
nnoremap ˚ :m .-2<CR>==
inoremap ∆ <Esc>:m .+1<CR>==gi
inoremap ˚ <Esc>:m .-2<CR>==gi
vnoremap ∆ :m '>+1<CR>gv=gv
vnoremap ˚ :m '<-2<CR>gv=gv

" Delete all buffers but current
command! BufOnly execute '%bdelete|edit #|normal `"'

" SnipRun
nmap <leader>fs <Plug>SnipRun
nmap <leader>f <Plug>SnipRunOperator
vmap f <Plug>SnipRun
