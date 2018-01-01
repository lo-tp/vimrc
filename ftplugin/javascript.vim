
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Get local eslint
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" if !exists("g:localEslintDetected")
  " let s:lcd = fnameescape(getcwd())
  " silent! exec "lcd" expand('%:p:h')
  " let s:eslint_path = system('PATH=$(npm bin):$PATH && which eslint')
  " exec "lcd" s:lcd
  " echom s:eslint_path
  " let g:localEslintDetected=1
  " if !empty(s:eslint_path)
    " let g:syntastic_javascript_eslint_exec = substitute(s:eslint_path, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
  " endif
" endif
" nnoremap <buffer> <leader>s :w<cr>:SyntasticCheck javascript eslint<cr>
" nnoremap Y :Autoformat <cr>n
