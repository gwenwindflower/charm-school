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
lua << END
require'lualine'.setup {
    options = {theme = 'rose-pine'},
    component_separators = {left = '', right = ''},
    tabline = {
      lualine_a = {'buffers'},
      lualine_b = {'branch'},
      lualine_c = {'filename'},
      lualine_x = {},
      lualine_y = {},
      lualine_z = {'tabs'}
    },
}
END

" Specs
lua << EOF
    require('specs').setup{ 
        show_jumps  = true,
        popup = {
            delay_ms = 0, -- delay before popup displays
            inc_ms = 10, -- time increments used for fade/resize effects 
            blend = 10, -- starting blend, between 0-100 (fully transparent), see :h winblend
            width = 20,
            winhl = "PMenu",
            fader = require('specs').linear_fader,
            resizer = require('specs').shrink_resizer
        },
        ignore_filetypes = {},
        ignore_buftypes = {
            nofile = true,
        },
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
  org_agenda_files = { "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/*" },
  org_default_notes_file = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/refile.org",
  org_agenda_templates = { 
    t = { description = 'task', template = '* TODO %?\n %u', target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/todos.org" },
    j = { description = 'journal', template ='* princess diary ~ stardate %U\n %?', target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/journal.org" },
    r = { description = 'reading list', template = '* %^ [[%x]]', target = "~/Library/Mobile Documents/iCloud~com~appsonthemove~beorg/Documents/org/reading_list.org" },
  },
  org_todo_keyword_faces = {
    TODO = ':background #c694ff :foreground #002635',
    DONE = ':background #7fc06e :slant italic :foreground #002635',
  },
  mappings = {
    org = {
      org_toggle_checkbox = '<Leader>we'
    }
  }
})
EOF

" lua << EOF
    " require("org-bullets").setup {
        " symbols = {"🌸","🌱","💧","✨","💗" },
        " -- indent = true,
    " }
" EOF

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
