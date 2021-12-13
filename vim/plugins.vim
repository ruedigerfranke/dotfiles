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

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'mhinz/vim-signify'

Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'pbogut/fzf-mru.vim'

Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'wakatime/vim-wakatime'

" Theming
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rakr/vim-one'
Plug 'ryanoasis/vim-devicons'

" Smooth scrolling
Plug 'psliwka/vim-smoothie'

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
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'romgrk/barbar.nvim'
  " Plug 'datwaft/bubbly.nvim'
else
end

call plug#end()
