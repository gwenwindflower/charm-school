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

" lualine
" lua << END
" require'lualine'.setup {
    " options = {theme = 'seoul256'},
    " extensions = {'nerdtree'}
" }
" END

" Neuron
lua << EOF
require'neuron'.setup {
    virtual_titles = true,
    mappings = true,
    run = nil, -- function to run when in neuron dir
    neuron_dir = "~/dev/personal/blog", -- the directory of all of your notes, expanded by default (currently supports only one directory for notes, find a way to detect neuron.dhall to use any directory)
    leader = "gz", -- the leader key to for all mappings, remember with 'go zettel'
}
EOF

" orgmode.nvim
lua << EOF
local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.org = {
    install_info = {
    url = 'https://github.com/milisims/tree-sitter-org',
    revision = 'main',
    files = {'src/parser.c', 'src/scanner.cc'},
    },
    filetype = 'org',
}

require'nvim-treesitter.configs'.setup {
  -- If TS highlights are not enabled at all, or disabled via `disable` prop, highlighting will fallback to default Vim syntax highlighting
  highlight = {
    enable = true,
    disable = {'org'}, -- Remove this to use TS highlighter for some of the highlights (Experimental)
    additional_vim_regex_highlighting = {'org'}, -- Required since TS highlighter doesn't support all syntax features (conceal)
  },
  ensure_installed = {'org'}, -- Or run :TSUpdate org
}

require('orgmode').setup({
  org_agenda_files = {'~/dev/personal/org-test/*'},
  org_default_notes_file = '~/dev/personal/org-test/refile.org',
})
EOF

lua << EOF
    vim.cmd [[highlight Headline1 guibg=#1e2718]]
    vim.cmd [[highlight Headline2 guibg=#21262d]]
    vim.cmd [[highlight CodeBlock guibg=#1c1c1c]]
    vim.cmd [[highlight Dash guibg=#D19A66 gui=bold]]
    vim.fn.sign_define("Headline1", { linehl = "Headline1" })
    vim.fn.sign_define("Headline2",  { linehl = "Headline2" })
    
    require("headlines").setup {
        markdown = {
            source_pattern_start = "^```",
            source_pattern_end = "^```$",
            dash_pattern = "^---+$",
            headline_pattern = "^#+",
            headline_signs = { "Headline" },
            codeblock_sign = "CodeBlock",
            dash_highlight = "Dash",
        },
        org = {
            source_pattern_start = "#%+[bB][eE][gG][iI][nN]_[sS][rR][cC]",
            source_pattern_end = "#%+[eE][nN][dD]_[sS][rR][cC]",
            dash_pattern = "^-----+$",
            headline_pattern = "^%*+",
            headline_signs = { "Headline" },
            codeblock_sign = "CodeBlock",
            dash_highlight = "Dash",
        },
    }
EOF


" lua << EOF
    " require("org-bullets").setup {
        " symbols = {"🌸","🌱","💧","✨","💗" },
        " -- indent = true,
    " }
" EOF

lua << EOF
    require'sniprun'.setup {
        repl_enable = {Python3_original},
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
