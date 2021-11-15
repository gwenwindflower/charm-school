"General
syntax enable                              " Turn on syntax highlighting
set number                                 " Show line numbers
set noswapfile                             " Disable creation of *.swp files
set shiftwidth=4                           " Number of spaces to use in each autoindent step
set tabstop=2                              " Two tab spaces
set softtabstop=4                          " Number of spaces to skip or insert when <BS>ing or <Tab>ing
set expandtab                              " Spaces instead of tabs for better cross-editor compatibility
set autoindent                             " Keep the indent when creating a new line
set smarttab                               " Use shiftwidth and softtabstop to insert or delete (on <BS>) blanks
set cindent                                " Recommended seting for automatic C-style indentation
set autoindent                             " Automatic indentation in non-C files
set nowrap                                 " Dont wrap lines
set wildmenu                               " Make tab completion act more like bash
set wildmode=longest,list,full             " Tab complete to longest common string, like bash
set completeopt+=longest                   " Tab complete type to search
set switchbuf=useopen                      " Don't re-open already opened buffers
set splitbelow                             " More natural splits
set splitright                             " More natural splits
set bs=2                                   " Allow backspace to eat up EOL and indent
set clipboard=unnamed                      " Use system clipboard
set ignorecase                             " Required for smartcase to work
set smartcase                              " Case insensitve search on all lowercase strings

" Backups
set backupdir=$HOME/.dotfiles/vim-config/backups

" Undo
set undodir=$HOME/.dotfiles/vim-config/undo
set undofile
set undolevels=10000
set undoreload=10000

" Theme
colorscheme rigel
" colo seoul256
" let g:material_terminal_italics = 1
" let g:material_theme_style = 'default'
" colorscheme material
" colorscheme nord

" enable 24bit true color
set termguicolors
