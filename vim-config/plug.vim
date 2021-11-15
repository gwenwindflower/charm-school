call plug#begin()

" General
Plug 'tpope/vim-sensible'

Plug 'scrooloose/nerdcommenter'
Plug 'scrooloose/nerdtree'
Plug 'xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'

Plug 'neomake/neomake'

Plug 'tpope/vim-fugitive'

"Colors
Plug 'Rigellute/rigel'
" Plug 'kaicataldo/material.vim', { 'branch': 'main' }
" Plug 'junegunn/seoul256.vim'
" Plug 'arcticicestudio/nord-vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}

Plug 'folke/todo-comments.nvim'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'nvim-lualine/lualine.nvim'

Plug 'michaelb/sniprun', {'do': 'bash install.sh'}

Plug 'airblade/vim-gitgutter'
Plug 'junegunn/vim-easy-align'
Plug 'tpope/vim-surround'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

" Plug 'kristijanhusak/vim-dadbod-ui'

Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'folke/trouble.nvim'

Plug 'christoomey/vim-tmux-navigator'
Plug 'preservim/vimux'
Plug 'edkolev/tmuxline.vim'

Plug 'raimondi/delimitmate'

Plug 'andymass/vim-matchup'

Plug 'dhruvasagar/vim-table-mode'

"blogging and markdown
Plug 'plasticboy/vim-markdown'
Plug 'junegunn/goyo.vim'
Plug 'junegunn/limelight.vim'
Plug 'oberblastmeister/neuron.nvim', { 'branch': 'unstable' }

Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}  " We recommend updating the parsers on update
Plug 'kristijanhusak/orgmode.nvim'
Plug 'lukas-reineke/headlines.nvim'
" Plug 'akinsho/org-bullets.nvim'

" Dev Icons must be last
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ryanoasis/vim-devicons'

call plug#end()
