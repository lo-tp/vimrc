function! FormatPerl()
	let winview=winsaveview()
	%!perltidy -q -npr
	call winrestview(winview)
endfunction
nnoremap <buffer> M :call Perl_SyntaxCheck()<CR>
nnoremap <buffer> Y :call FormatPerl()<CR>
let g:syntastic_perl_checkers=["perl"]
let g:syntastic_enable_perl_checker = 1
