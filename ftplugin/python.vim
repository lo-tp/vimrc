let g:syntastic_python_checkers=["pep8"]
syntax off
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
nnoremap <buffer> Y :Autopep8<CR>
