" vim-plug configuration by Rüdiger Franke

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'

Plug 'psliwka/vim-smoothie'

Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'pbogut/fzf-mru.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'wakatime/vim-wakatime'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'itchyny/lightline.vim'
" Plug 'josa42/vim-lightline-coc'

Plug 'rakr/vim-one'

Plug 'ryanoasis/vim-devicons'

Plug 'mhinz/vim-startify'
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }

Plug 'bogado/file-line'

" Testing
Plug 'liuchengxu/vim-clap'
Plug 'AndrewRadev/tagalong.vim'
Plug 'mg979/vim-visual-multi', {'branch': 'master'}

Plug 'kyazdani42/nvim-web-devicons'
Plug 'romgrk/barbar.nvim'

call plug#end()
