"" startify

" returns all modified files of the current git repo
" `2>/dev/null` makes the command fail quietly, so that when we are not
" in a git repo, the list will be empty
function! s:gitModified()
    let files = systemlist('git ls-files -m 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

" same as above, but show untracked files, honouring .gitignore
function! s:gitUntracked()
    let files = systemlist('git ls-files -o --exclude-standard 2>/dev/null')
    return map(files, "{'line': v:val, 'path': v:val}")
endfunction

let g:startify_padding_left = 10
let g:startify_session_persistence = 1
let g:startify_enable_special = 1
let g:startify_change_to_vcs_root = 1
let g:startify_lists = [
        \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
        \ { 'type': 'files',     'header': ['   MRU']            },
        \ { 'type': 'sessions',  'header': ['   Sessions']       },
        \ { 'type': function('s:gitModified'),  'header': ['   git modified']},
        \ { 'type': function('s:gitUntracked'), 'header': ['   git untracked']},
        \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
        \ { 'type': 'commands',  'header': ['   Commands']       },
        \ ]

" bookmark examples
let  g:startify_bookmarks =  [
    \ {'v': '~/.config/nvim'},
    \ {'d': '~/dotfiles' }
    \ ]

" custom commands
let g:startify_commands = [
    \ {'ch':  ['Health Check', ':checkhealth']},
    \ {'ps': ['Plugins status', ':PlugStatus']},
    \ {'pu': ['Update vim plugins',':PlugUpdate | PlugUpgrade']},
    \ {'uc': ['Update coc Plugins', ':CocUpdate']},
    \ {'h':  ['Help', ':help']},
    \ ]

" custom banner
let g:startify_custom_header=[
                \ "                      .            .      ",
                \ "                    .,;'           :,.    ",
                \ "                  .,;;;,,.         ccc;.  ",
                \ "                .;c::::,,,'        ccccc: ",
                \ "                .::cc::,,,,,.      cccccc.",
                \ "                .cccccc;;;;;;'     llllll.",
                \ "                .cccccc.,;;;;;;.   llllll.",
                \ "                .cccccc  ';;;;;;'  oooooo.",
                \ "                'lllllc   .;;;;;;;.oooooo'",
                \ "                'lllllc     ,::::::looooo'",
                \ "                'llllll      .:::::lloddd'",
                \ "                .looool       .;::coooodo.",
                \ "                  .cool         'ccoooc.  ",
                \ "                    .co          .:o:.    ",
                \ "                      .           .'      ",
                \]

" startify if no passed argument or all buffers are closed
augroup noargs
    " startify when there is no open buffer left
    " autocmd BufDelete * if empty(filter(tabpagebuflist(), '!buflisted(v:val)')) | Startify | endif

    " open startify on start if no argument was passed
    autocmd VimEnter * if argc() == 0 | Startify | endif

    " autocmd BufEnter * if line2byte('.') == -1 && len(tabpagebuflist()) == 1 | Startify | endif
augroup END
