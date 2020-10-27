" Theme configuration by Rüdiger Franke



" vim-one
" GitHub link: https://github.com/rakr/vim-one
"
"Use 24-bit (true-color) mode in Vim/Neovim when outside tmux.
"If you're using tmux version 2.2 or later, you can remove the outermost $TMUX check and use tmux's 24-bit color support
"(see < http://sunaku.github.io/tmux-24bit-color.html#usage > for more information.)
if (empty($TMUX))
  if (has("nvim"))
  "For Neovim 0.1.3 and 0.1.4 < https://github.com/neovim/neovim/pull/2198 >
  let $NVIM_TUI_ENABLE_TRUE_COLOR=1
  endif
  "For Neovim > 0.1.5 and Vim > patch 7.4.1799 < https://github.com/vim/vim/commit/61be73bb0f965a895bfb064ea3e55476ac175162 >
  "Based on Vim patch 7.4.1770 (`guicolors` option) < https://github.com/vim/vim/commit/8a633e3427b47286869aa4b96f2bfc1fe65b25cd >
  " < https://github.com/neovim/neovim/wiki/Following-HEAD#20160511 >
  if (has("termguicolors"))
    set termguicolors
  endif
endif


set background=dark " for the dark version
" set background=light " for the light version
let g:one_allow_italics = 1 " I love italic for comments
colorscheme one

hi htmlArg     cterm=italic, gui=italic
hi Comment     cterm=italic, gui=italic
hi Type        cterm=italic, gui=italic
hi Conditional cterm=italic, gui=italic
hi Repeat      cterm=italic, gui=italic
hi Label       cterm=italic, gui=italic
hi Exception   cterm=italic, gui=italic

hi ColorColumn ctermbg=0 guibg=#643636



" Airline
" GitHub link: https://github.com/vim-airline/vim-airline

let g:airline_theme='one'

let g:airline_powerline_fonts = 1
" let g:airline#extensions#branch#enabled=1
let g:airline_extensions = ['branch', 'coc', 'tabline']
let g:airline#extensions#tabline#enabled = 1

" Do not draw separators for empty sections (only for the active window) >
let g:airline_skip_empty_sections = 1



" " Lightline

" let g:lightline = {
"   \   'colorscheme': 'one',
"   \   'active': {
"   \     'left': [[ 'coc_errors', 'coc_warnings', 'coc_ok' ], [ 'coc_status'  ]]
"   \   }
"   \ }

" " register compoments:
" call lightline#coc#register()
