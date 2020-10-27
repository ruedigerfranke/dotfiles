" Some addtional keybindings for convienence by Rüdiger Franke
"

imap jj <ESC>
imap jk <ESC>
imap kk <ESC>

" Join lines with K
nnoremap K i<CR><Esc>

" nnoremap <silent>,bd :<C-u>bd<cr>
" nnoremap <silent><space>w :<C-u>bd<CR>
" nnoremap <silent>,bda :<C-u>bufdo bd<cr>
" nnoremap <silent>,bdo :<C-u>BufOnly<cr>

nnoremap <space>/ :<C-u>nohlsearch<cr>

" Move selection up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"" Better navigation using ctrl + {h,j,k,l}
inoremap <C-h> <C-\><C-N><C-w>h
inoremap <C-j> <C-\><C-N><C-w>j
inoremap <C-k> <C-\><C-N><C-w>k
inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
noremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

"" To train me to not use the arrow keys!:
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>

nnoremap <space>r :<C-u>so $MYVIMRC<CR>
