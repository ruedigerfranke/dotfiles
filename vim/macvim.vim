" MacVim specific configuration by Rüdiger Franke

set macligatures
set guifont=OperatorMonoSSm\ Nerd\ Font:h12
" set guifont=Operator\ Mono\ SSm\ Lig:h12
" set guifont=JetBrains\ Mono\ Medium:h13

set linespace=3

set background=dark

" Disable scrollbars (https://til.hashrocket.com/posts/1bcac01e65-remove-both-scrollbars-from-macvim)
set guioptions=

" Disable default menu key bindings
" macmenu &File.New\ Tab key=<nop>
" macmenu &Tools.Make key=<nop>

" Mac-like key mapping (VSCode inspired)
nnoremap <silent> <D-p> :<C-u>CocList files<cr>
nnoremap <silent> <D-l> :<C-u>CocList outline<cr>
nnoremap <silent> <D-b> :NERDTreeToggle<CR>

" Press Ctrl-Tab to switch between open tabs (like browser tabs) to
" the right side. Ctrl-Shift-Tab goes the other way.
noremap <C-Tab> :bnext<CR>
noremap <C-S-Tab> :bprevious<CR>

" Switch to specific tab numbers with Command-number
noremap <D-1> :tabn 1<CR>
noremap <D-2> :tabn 2<CR>
noremap <D-3> :tabn 3<CR>
noremap <D-4> :tabn 4<CR>
noremap <D-5> :tabn 5<CR>
noremap <D-6> :tabn 6<CR>
noremap <D-7> :tabn 7<CR>
noremap <D-8> :tabn 8<CR>
noremap <D-9> :tabn 9<CR>
" Command-0 goes to the last tab
noremap <D-0> :tablast<CR>

autocmd! GUIEnter * set vb t_vb=
