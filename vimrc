""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vundle
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required

filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'easymotion/vim-easymotion'
Bundle 'ctrlpvim/ctrlp.vim'
Bundle 'The-NERD-Commenter'
Bundle 'winmanager'
Bundle 'scrooloose/syntastic'
Bundle 'The-NERD-tree'
Bundle 'pangloss/vim-javascript'
Bundle 'mxw/vim-jsx'
Bundle 'SirVer/ultisnips'
Bundle 'w0rp/ale'
Bundle 'mileszs/ack.vim'
Bundle 'ternjs/tern_for_vim'
Bundle 'tpope/vim-surround'
Bundle 'prettier/vim-prettier'

Bundle 'vim-airline/vim-airline'
Bundle 'vim-airline/vim-airline-themes'
Bundle 'Valloric/YouCompleteMe'

" quick write html
Bundle 'mattn/emmet-vim'

Bundle 'airblade/vim-gitgutter'
call vundle#end() 


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set ttyfast
set lazyredraw
set encoding=utf-8
filetype plugin on 
filetype indent on
set sessionoptions=blank,buffers,curdir,folds,tabpages,winsize,resize
" if filereadable("Session.vim")
	" source Session.vim	
	call feedkeys("\<cr>")
" endif
" if filereadable("viminfo")
	" rviminfo viminfo
" endif


let mapleader = "`"
" colorscheme evening
"auto complete
set completeopt=longest,menu
syntax on

set nu
set autoindent
set smartindent
set nohls
set foldmethod=syntax
" cursor color
"set visual mode selected color
hi Visual cterm=NONE ctermbg=green ctermfg=red

" set cuc
set cul

hi CursorLine cterm=NONE ctermbg=darkgrey ctermfg=lightgreen
hi Tablinefill cterm=NONE ctermbg=black ctermfg=black
hi tabline cterm=NONE ctermbg=white ctermfg=black
hi tablinesel cterm=NONE ctermbg=darkblue ctermfg=lightred
set backspace=indent,eol,start
"do not fold the code automatically
set foldlevelstart=99
"set prompt
set confirm


"set to auto read when a file is changed from outside
"split the window 
nnoremap <leader>z :vsplit<cr> 
nnoremap <leader>Z :split<cr> 
"save file
nnoremap <leader>s :w<cr>
nnoremap <leader>S :wa<cr>
"close current window
nnoremap <c-w> :q<cr>
"quit vim
nnoremap <leader>w :qa<cr>
"open a new tab
nnoremap <C-T> :tabnew<cr>
"move between tabs
nnoremap <C-pageUp> <NOP>
nnoremap <C-pageDown> <NOP>
nnoremap <leader><left> gT
nnoremap <leader><right> gt
"find something
nnoremap <SPACE> `
"open a file
nnoremap <leader>o :CtrlP<CR>
"adjust the size of the window
"about the height
nnoremap <F1> :res -1<cr>
nnoremap <F2> :res +1<cr>
"about the width
nnoremap <F7> :vertical res -1<cr>
nnoremap <F8> :vertical res +1<cr>
"move between windows
nnoremap <C-H> <C-W>h
nnoremap <C-L> <C-W>l
nnoremap <C-K> <C-W>k
nnoremap <C-J> <C-W>j
"make
nnoremap M s:make<cr><cr>
"open the quickfix 
nnoremap <C-C> :Errors<cr>
"Insert date at current position
nnoremap <F9> "=strftime("%F %H:%M")<CR>P
"Open cursor pointed file in a new tag
nnoremap gf <C-W>gf
vnoremap gf <C-W>gf



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use P to see the register list
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>p :registers<cr>


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Nurd_Commenter           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let NERDSpaceDelims=1 "Nurd_commenter 在注释的开头和末尾都添加一个空格来美观一下

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" WinManager           
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"open the WinManager Window
" nnoremap <leader>wm :WMToggle<cr>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" nerdtree
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nnoremap <leader>wm :NERDTree<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" syntastic
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:syntastic_mode_map = { 'passive_filetypes': ['arduino'] }
let g:syntastic_cpp_checkers = ['clang_check'] 
let g:syntastic_cpp_clang_check_post_args = '-- -fshow-column -fshow-source-location -fno-caret-diagnosti  -std=c++11'



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" run the .vimrc in the current directore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check Spelling When Editing Markdown File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""*
autocmd BufRead,BufNewFile *.md setlocal spell

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set syntastic to aggregate all the errors
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""*
let g:syntastic_aggregate_errors=1


"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Settings of CtrlP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""*
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git|test|'
let g:ctrlp_working_path_mode = 'w'
let g:ctrlp_max_height=30
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_prompt_mappings = { 'PrtClearCache()': ['<c-r>'] }

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Switching tabs
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""*
nnoremap <leader>1 1gt
nnoremap <leader>2 2gt
nnoremap <leader>3 3gt
nnoremap <leader>4 4gt
nnoremap <leader>5 5gt
nnoremap <leader>6 6gt
nnoremap <leader>7 7gt
nnoremap <leader>8 8gt
nnoremap <leader>9 9gt



""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Show Tab Number
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Rename tabs to show tab number.
" (Based on http://stackoverflow.com/questions/5927952/whats-implementation-of-vims-default-tabline-function)
if exists("+showtabline")
    function! MyTabLine()
        let s = ''
        let wn = ''
        let t = tabpagenr()
        let i = 1
        while i <= tabpagenr('$')
            let buflist = tabpagebuflist(i)
            let winnr = tabpagewinnr(i)
            let s .= '%' . i . 'T'
            let s .= (i == t ? '%1*' : '%2*')
            let s .= ' '
            let wn = tabpagewinnr(i,'$')

            let s .= '%#TabNum#'
            let s .= i
            " let s .= '%*'
            let s .= (i == t ? '%#TabLineSel#' : '%#TabLine#')
            let bufnr = buflist[winnr - 1]
            let file = bufname(bufnr)
            let buftype = getbufvar(bufnr, 'buftype')
            if buftype == 'nofile'
                if file =~ '\/.'
                    let file = substitute(file, '.*\/\ze.', '', '')
                endif
            else
                let file = fnamemodify(file, ':p:t')
            endif
            if file == ''
                let file = '[No Name]'
            endif
            let s .= ' ' . file . ' '
            let i = i + 1
        endwhile
        let s .= '%T%#TabLineFill#%='
        let s .= (tabpagenr('$') > 1 ? '%999XX' : 'X')
        return s
    endfunction
    set stal=2
    set tabline=%!MyTabLine()
    set showtabline=1
    highlight link TabNum Special
endif
"
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set tab indent
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=2
" " when indenting with '>', use 4 spaces width
set shiftwidth=2
" " On pressing tab, insert 4 spaces
set expandtab

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"For Iterm Under Mac
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Esc>[D <left>
map <Esc>[C <right>
map <Esc>[A <up>
map <Esc>[B <down>
nnoremap <leader><Esc>[D gT
nnoremap <leader><Esc>[C gt
" You complete me
let g:ycm_key_list_select_completion = ['<Up>', '<Down>']

set clipboard=unnamed

let g:ale_emit_conflict_warnings = 0
let g:ale_open_list = '0'

let g:UltiSnipsExpandTrigger="<tab>"

" configurations for vim airline
set laststatus=2
let g:airline_section_z = ''  " show no position info
let g:airline_theme='molokai'  "set the thme to molokai

" auto refresh a file when it is changed
au FocusGained,BufEnter * :silent! !

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"easy-motion
"Mappings for simultaneously pressed keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:EasyMotion_do_mapping = 0 " Disable default mappings

nmap <space> <Plug>(easymotion-overwin-f2)

" Turn on case insensitive feature
let g:EasyMotion_smartcase = 1

" JK motions: Line motions
map <Leader>j <Plug>(easymotion-j)
map <Leader>k <Plug>(easymotion-k)

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"ale and vim-gitgutter
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set updatetime=250
let g:ale_fixers ={
      \ 'javascript':['eslint'],
      \ 'less':['stylelint']
      \ }
let g:SignMode=1
" Turn off gitgutter by default
let g:gitgutter_enabled = 0
function! SignToggle()
  " turn on vim-gitgutter
  if g:SignMode == 1
    let g:SignMode = 0
    GitGutterEnable
    GitGutterLineHighlightsEnable
    ALEDisable
  " turn Ale
  else
    let g:SignMode = 1
    GitGutterDisable
    ALEEnable
  endif
endfunction
nnoremap m :call SignToggle()<cr>
nnoremap Y :ALEFix<cr>
