" Some addtional keybindings for convienence by Rüdiger Franke

" Get out of insert mode
imap jj <ESC>
imap jk <ESC>
imap kj <ESC>
imap kk <ESC>

" Join lines with K
nnoremap K i<CR><Esc>

" Insert new line below or above without going to insert mode
nnoremap <silent> <leader>o :<C-u>call append(line("."),   repeat([""], v:count1))<CR>
nnoremap <silent> <leader>O :<C-u>call append(line(".")-1, repeat([""], v:count1))<CR>

" Move selection up/down
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" Keep selection when indenting
vnoremap > >gv
vnoremap < <gv

" Y behavior like D, etc.
nnoremap Y y$

" Yank and paste from clipboard
nnoremap <leader>y "+y
nnoremap <leader>yy "+yy
nnoremap <leader>Y "+y$
vnoremap <leader>y "+y
nnoremap <leader>p "+p
nnoremap <leader>P "+P

" Replace selection
xnoremap <leader>p "_dP

" Visually select to end of line and content of line
nnoremap <leader>V v$h
nnoremap <leader>vv ^v$h

"" Better navigation using ctrl + {h,j,k,l}
" inoremap <C-h> <C-\><C-N><C-w>h
" inoremap <C-j> <C-\><C-N><C-w>j
" inoremap <C-k> <C-\><C-N><C-w>k
" inoremap <C-l> <C-\><C-N><C-w>l
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""Better navigation in text in insert mode
inoremap <C-h> <left>
inoremap <C-j> <down>
inoremap <C-k> <up>
inoremap <C-l> <right>

"" Adjust scrolling behavior
" nnoremap <C-u> <C-u>zz
" nnoremap <C-d> <C-d>zz
" nnoremap <C-f> <C-f>zz
" nnoremap <C-b> <C-b>zz

"" To train me to not use the arrow keys!:
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
" imap <left> <nop>
" imap <right> <nop>

let hlstate=0
nnoremap <silent> <leader>/       :if (hlstate == 0) \| nohlsearch \| else \| set hlsearch \| endif \| let hlstate=1-hlstate<cr>
"knnoremap <silent> <leader>/       :<C-u>nohlsearch<CR>

if has('nvim')
  " Leader released keybindings, mainly for Telescope & COC
  nnoremap <silent> <C-p>            :<C-u>Telescope find_files hidden=true<CR>
  nnoremap <silent> <leader><leader> :<C-u>Telescope coc<CR>
  nnoremap <silent> <leader>b        :<C-u>Telescope buffers<CR>
  nnoremap <silent> <leader>c        :<C-u>Telescope coc commands<CR>
  nnoremap <silent> <leader>D        :<C-u>Telescope coc diagnostics<CR>
  nnoremap <silent> <leader>e        :<C-u>CocCommand explorer<CR>
  nnoremap <silent> <leader>E        :<C-u>CocCommand explorer --preset floating<CR>
  nnoremap <silent> <leader>f        :<C-u>Telescope find_files hidden=true<CR>
  nnoremap <silent> <leader>g        :<C-u>Telescope live_grep<CR>
  nnoremap <silent> <leader>h        :<C-u>Telescope coc mru<CR>
  nnoremap <silent> <leader>l        :<C-u>Telescope coc locations<CR>
  nnoremap <silent> <leader>n        <Plug>(coc-diagnostic-next)
  nnoremap <silent> <leader>N        <Plug>(coc-diagnostic-prev)
  " nnoremap <silent> <leader>p        :<C-u>CocList -A --normal yank<CR>
  nnoremap <silent> <leader>r        :<C-u>Telescope resume<CR>
  nnoremap <leader>R                 :<C-u>so $MYVIMRC<CR>
  nnoremap <silent> <leader>s        :<C-u>Telescope coc document_symbols<CR>
  nnoremap <silent> <leader>S        :<C-u>Telescope coc workspace_symbols<CR>
else
  " Leader released keybindings, mainly for COC
  nnoremap <silent> <C-p>            :<C-u>CocList files<CR>
  nnoremap <silent> <leader><leader> :<C-u>CocList<CR>
  nnoremap <silent> <leader>b        :<C-u>CocList buffers<CR>
  nnoremap <silent> <leader>c        :<C-u>CocList commands<CR>
  nnoremap <silent> <leader>D        :<C-u>CocList diagnostics<CR>
  nnoremap <silent> <leader>e        :<C-u>CocCommand explorer<CR>
  nnoremap <silent> <leader>E        :<C-u>CocCommand explorer --preset floating<CR>
  nnoremap <silent> <leader>f        :<C-u>CocList files<CR>
  nnoremap <silent> <leader>g        :<C-u>CocList grep<CR>
  nnoremap <silent> <leader>h        :<C-u>CocList mru<CR>
  nnoremap <silent> <leader>l        :<C-u>CocList location<CR>
  nnoremap <silent> <leader>n        <Plug>(coc-diagnostic-next)
  nnoremap <silent> <leader>N        <Plug>(coc-diagnostic-prev)
  " nnoremap <silent> <leader>p        :<C-u>CocList -A --normal yank<CR>
  nnoremap <silent> <leader>r        :<C-u>CocListResume<CR>
  nnoremap <leader>R                 :<C-u>so $MYVIMRC<CR>
  nnoremap <silent> <leader>s        :<C-u>CocList outline<CR>
  nnoremap <silent> <leader>S        :<C-u>CocList symbols<CR>
endif

" Git related keybindings
nnoremap <silent> <leader>gb       :<c-u>Git blame<CR>
nnoremap <silent> <leader>gd       :<C-u>Gvdiff<CR>
nnoremap <silent> <leader>gf       :<C-u>diffget //2<CR>
nnoremap <silent> <leader>gg       :<C-u>GBrowse<CR>
nnoremap <silent> <leader>gj       :<C-u>diffget //3<CR>

" Mappings for grep (coc-list grep)
vnoremap <leader>g                :<C-u>call <SID>GrepFromSelected(visualmode())<CR>

" Mapping for execute marco for visual selection
xnoremap @                        :<C-u>call ExecuteMacroOverVisualRange()<CR>


"" Mappings for barbar.nvim

" Magic buffer-picking mode
nnoremap <silent> <C-s>           :BufferPick<CR>
" Sort automatically by...
nnoremap <silent> <leader>bd      :BufferOrderByDirectory<CR>
nnoremap <silent> <leader>bl      :BufferOrderByLanguage<CR>
" Move to previous/next
nnoremap <silent> <M-,>           :BufferPrevious<CR>
nnoremap <silent> <M-.>           :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent> <M-<>           :BufferMovePrevious<CR>
nnoremap <silent> <M->>           :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent> <M-1>           :BufferGoto 1<CR>
nnoremap <silent> <M-2>           :BufferGoto 2<CR>
nnoremap <silent> <M-3>           :BufferGoto 3<CR>
nnoremap <silent> <M-4>           :BufferGoto 4<CR>
nnoremap <silent> <M-5>           :BufferGoto 5<CR>
nnoremap <silent> <M-6>           :BufferGoto 6<CR>
nnoremap <silent> <M-7>           :BufferGoto 7<CR>
nnoremap <silent> <M-8>           :BufferGoto 8<CR>
nnoremap <silent> <M-9>           :BufferLast<CR>
" Close buffer
nnoremap <silent> <M-c>           :BufferClose<CR>
" Wipeout buffer
"                          :BufferWipeout<CR>
" Other:
" :BarbarEnable - enables barbar (enabled by default)
" :BarbarDisable - very bad command, should never be used

