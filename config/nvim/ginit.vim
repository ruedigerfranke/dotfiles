" if exists('g:fvim_loaded')
"     " good old 'set guifont' compatibility
"     " set guifont=Iosevka\ Slab:h16
"     set macligatures
"     set guifont=OperatorMonoSSm\ Nerd\ Font:h13
"     " Ctrl-ScrollWheel for zooming in/out
"     nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
"     nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
"     nnoremap <A-CR> :FVimToggleFullScreen<CR>
" endif

" Enable Mouse
set mouse=a

" Set Editor Font
if exists(':GuiFont')
    " Use GuiFont! to ignore font errors
    GuiFont! OperatorMonoSSm\ Nerd\ Font:h13
endif

" Disable GUI Tabline
if exists(':GuiTabline')
    GuiTabline 0
endif

" Disable GUI Popupmenu
if exists(':GuiPopupmenu')
    GuiPopupmenu 0
endif

" GUI ScrollBar
if exists(':GuiScrollBar')
    GuiScrollBar 0
endif

" Right Click Context Menu (Copy-Cut-Paste)
nnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>
inoremap <silent><RightMouse> <Esc>:call GuiShowContextMenu()<CR>
xnoremap <silent><RightMouse> :call GuiShowContextMenu()<CR>gv
snoremap <silent><RightMouse> <C-G>:call GuiShowContextMenu()<CR>gv

