" Some addtional keybindings for convienence by Rüdiger Franke
"

imap jj <ESC>
imap jk <ESC>
imap kj <ESC>
imap kk <ESC>

" Join lines with K
nnoremap K i<CR><Esc>

" Move selection up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

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

nnoremap <silent> <C-p>          :<C-u>CocList files<CR>
nnoremap <silent> <space><space> :<C-u>CocList<CR>
nnoremap <silent> <space>a       :<C-u>CocList diagnostics<CR>
nnoremap <silent> <space>b       :<C-u>CocList buffers<CR>
nnoremap <silent> <space>c       :<C-u>CocList commands<CR>
nnoremap <silent> <space>d       :<C-u>CocList diagnostics --current-buf<CR>
nnoremap <silent> <space>e       :<C-u>CocCommand explorer<CR>
nnoremap <silent> <space>f       :<C-u>CocCommand explorer --preset floating<CR>
nnoremap <silent> <space>g       :<C-u>CocList grep<CR>
nnoremap <silent> <space>G       :<C-u>Git<CR>
nnoremap <silent> <space>h       :<C-u>CocList mru<CR>
nnoremap <silent> <space>l       :<C-u>CocList location<CR>
nnoremap <silent> <space>o       :<C-u>CocList outline<CR>
nnoremap <silent> <space>p       :<C-u>CocListResume<CR>
" nnoremap <silent> <space>q       :<C-u>qall<CR>
nnoremap <space>r                :<C-u>so $MYVIMRC<CR>
nnoremap <silent> <space>s       :<C-u>CocList symbols<CR>
" nnoremap <silent> <space>w       :<C-u>bd<CR>
" nnoremap <silent> <space>W       :<C-u>w\|bd<CR>
nnoremap <silent> <space>y       :<C-u>CocList -A --normal yank<CR>
nnoremap <silent> <space>/       :<C-u>nohlsearch<CR>

