set guifont=OperatorMonoSSm\ Nerd\ Font:h13

let g:neovide_input_use_logo=v:true
let g:neovide_cursor_animation_length=0

inoremap <D-v> <C-r>+
vnoremap <D-c> "+y
vnoremap <D-x> "+d

nnoremap <silent> <D-1> :BufferGoto 1<CR>
nnoremap <silent> <D-2> :BufferGoto 2<CR>
nnoremap <silent> <D-3> :BufferGoto 3<CR>
nnoremap <silent> <D-4> :BufferGoto 4<CR>
nnoremap <silent> <D-5> :BufferGoto 5<CR>
nnoremap <silent> <D-6> :BufferGoto 6<CR>
nnoremap <silent> <D-7> :BufferGoto 7<CR>
nnoremap <silent> <D-8> :BufferGoto 8<CR>
nnoremap <silent> <D-9> :BufferLast<CR>
" Close buffer
nnoremap <silent> <D-w> :BufferClose<CR>
" Close vim
nnoremap <silent> <D-q> :q<CR>
