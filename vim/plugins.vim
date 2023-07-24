" vim-plug configuration by Rüdiger Franke

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'
Plug 'styled-components/vim-styled-components', { 'branch': 'main' }

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-abolish'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-haml'

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'pbogut/fzf-mru.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

" Wakatime time tracking
Plug 'wakatime/vim-wakatime'

" Better open file with jump to line
Plug 'bogado/file-line'

" Helpers
Plug 'AndrewRadev/tagalong.vim'
Plug 'junegunn/vim-easy-align'

" Gitlab extention for fugitive
Plug 'shumphrey/fugitive-gitlab.vim'

" Testing
Plug 'liuchengxu/vim-clap'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}
Plug 'ap/vim-css-color'

if has('nvim')
  " Gitlab copilot for faster coding
  Plug 'github/copilot.vim'

  " Telescope & Telescope COC
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-lua/popup.nvim'
  Plug 'nvim-telescope/telescope.nvim'
  Plug 'fannheyward/telescope-coc.nvim'
  Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

  " BarBar tab bar for neovim
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  " Plug 'datwaft/bubbly.nvim'

  " Smooth scrolling
  Plug 'karb94/neoscroll.nvim'

  " Treesitter for better syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  " One Dark theme for neovim & treesitter
  Plug 'navarasu/onedark.nvim'
  " Lualine for neovim
  Plug 'nvim-lualine/lualine.nvim'

  Plug 'stevearc/dressing.nvim'
  " Plug 'nvim-telescope/telescope-ui-select.nvim'
else
  " One Dark theme for vim
  Plug 'rakr/vim-one'
  " Smooth scrolling
  Plug 'psliwka/vim-smoothie'
  " Airline for vim
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'
  Plug 'ryanoasis/vim-devicons'
end

call plug#end()
