" NERDTree
let NERDTreeHighlightCursorline = 1
let NERDTreeShowHidden = 1
let NERDTreeHijackNetrw = 1

" NERDCommenter
let NERDDefaultNesting = 0
let NERDRemoveExtraSpaces = 1
let NERDSpaceDelims = 1
filetype plugin on

" FZF
let $FZF_DEFAULT_COMMAND = 'ag -l -g ""'

" Let ack/vim use ag for search
let g:ackprg = 'ag --nogroup --nocolor --column'

" Goyo / Limelight
autocmd! User GoyoEnter Limelight
autocmd! User GoyoLeave Limelight!

" todo-comments
lua << EOF
  require("todo-comments").setup {

}
EOF

" airline
let g:rigel_airline = 1
let g:airline_theme = 'rigel'
let g:airline#extensions#tabline#enabled = 1 " Enable the list of buffers
let g:airline#extensions#tabline#buffer_nr_show = 1
let g:airline_powerline_fonts = 1


" vim-markdown
let g:vim_markdown_conceal = 2
let g:vim_markdown_conceal_code_blocks = 0
let g:vim_markdown_math = 1
let g:vim_markdown_toml_frontmatter = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_strikethrough = 1
let g:vim_markdown_autowrite = 1
let g:vim_markdown_edit_url_in = 'tab'
let g:vim_markdown_follow_anchor = 1
let g:vim_markdown_folding_disabled = 1

"delimitmate
let delimitMate_expand_cr = 2
let delimitMate_expand_space = 1
let delimitMate_jump_expansion = 1
