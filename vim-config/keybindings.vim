" Map Leader - Reset from \ to ,
let mapleader = ","

" Yank from the cursor to the end of the line, to be consistent with C and D.
nnoremap Y y$

" FZF
nnoremap <Leader>t :FZF<CR>

" NERD Tree
nnoremap <leader>n :NERDTreeToggle<CR>

" Goyo / Limelight
nnoremap <leader>j :Goyo<CR>

" Quick Split Navigation
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-x> <C-w>q

" Terminal
nnoremap <leader>s :term<CR>
