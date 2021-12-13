" Helper scripts to make vim even better by Rüdiger Franke

" Automatic switching between relative and norelative linenumbers
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set number relativenumber list&
  autocmd BufLeave,FocusLost,InsertEnter   * set number norelativenumber list
augroup END

au BufEnter * set fo-=c fo-=r fo-=o                     " stop annoying auto commenting on new lines
au FileType help wincmd L                               " open help in vertical split
au BufWritePre * :%s/\s\+$//e                           " remove trailing whitespaces before saving

" Add run macro on visual range
" https://www.rockyourcode.com/run-macro-on-multiple-lines-in-vim/

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

:command! -nargs=1 -range SC
      \ <line1>,<line2>call s:SubstituteCase(
      \<f-args>[0] . '\c' . strpart(<f-args>, 1))

" Show CocList grep for selected text
function! s:GrepFromSelected(type)
  let saved_unnamed_register = @@
  if a:type ==# 'v'
    normal! `<v`>y
  elseif a:type ==# 'char'
    normal! `[v`]y
  else
    return
  endif
  let word = substitute(@@, '\n$', '', 'g')
  let word = escape(word, '| ')
  let @@ = saved_unnamed_register
  execute 'CocList grep '.word
endfunction
