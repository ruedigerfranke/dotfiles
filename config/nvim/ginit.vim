if exists('g:fvim_loaded')
    " good old 'set guifont' compatibility
    " set guifont=Iosevka\ Slab:h16
    set macligatures
    set guifont=OperatorMonoSSm\ Nerd\ Font:h13
    " Ctrl-ScrollWheel for zooming in/out
    nnoremap <silent> <C-ScrollWheelUp> :set guifont=+<CR>
    nnoremap <silent> <C-ScrollWheelDown> :set guifont=-<CR>
    nnoremap <A-CR> :FVimToggleFullScreen<CR>
endif
