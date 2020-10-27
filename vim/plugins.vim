" vim-plug configuration by Rüdiger Franke

call plug#begin('~/.vim/plugged')

Plug 'sheerun/vim-polyglot'

Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-fugitive'

Plug 'junegunn/fzf', {'dir': '~/.fzf','do': './install --all'}
Plug 'junegunn/fzf.vim' " needed for previews
Plug 'pbogut/fzf-mru.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'antoinemadec/coc-fzf', {'branch': 'release'}

Plug 'wakatime/vim-wakatime'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'rakr/vim-one'

Plug 'ryanoasis/vim-devicons'

" Testing
Plug 'liuchengxu/vim-clap'

call plug#end()
