""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" remove trailing spaces
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
function! StrTrim(txt)
  return substitute(a:txt, '^\n*\s*\(.\{-}\)\n*\s*$', '\1', '')
endfunction
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vim-plug
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible              " be iMproved, required
call plug#begin('~/.local/share/nvim/plugged')
Plug 'easymotion/vim-easymotion'
Plug 'vim-scripts/The-NERD-Commenter'
Plug 'vim-scripts/winmanager'
Plug 'vim-scripts/The-NERD-tree'
Plug 'SirVer/ultisnips'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-surround'
Plug 'prettier/vim-prettier'
Plug 'neomake/neomake'
Plug 'keith/swift.vim'
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'carlitux/deoplete-ternjs', { 'do': 'npm install -g tern' }
Plug 'junegunn/fzf.vim'
Plug 'sheerun/vim-polyglot'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'takac/vim-hardtime'
call plug#end()


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" initialization
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:python_host_prog = '/usr/local/bin/python2'
let g:python3_host_prog = '/usr/local/bin/python3'
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
nnoremap <leader>o :FZF <cr>
nnoremap <leader>b :Buffers <cr>
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
" run the .vimrc in the current directore
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc
set secure


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Check Spelling When Editing Markdown File
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""*
autocmd BufRead,BufNewFile *.md setlocal spell

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
" nnoremap <leader>1 1gt
" nnoremap <leader>2 2gt
" nnoremap <leader>3 3gt
" nnoremap <leader>4 4gt
" nnoremap <leader>5 5gt
" nnoremap <leader>6 6gt
" nnoremap <leader>7 7gt
" nnoremap <leader>8 8gt
" nnoremap <leader>9 9gt



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

set clipboard=unnamed


let g:UltiSnipsExpandTrigger="<tab>"


" auto refresh a file when it is changed
au FocusGained,BufEnter * :silent! !


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"vim-hardtime
"Plugin to help you stop repeating the basic movement keys
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:hardtime_default_on = 1
let g:list_of_insert_keys = []
let g:hardtime_ignore_buffer_patterns = [ "NERD.*" ]


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
"fzf
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set rtp+=/usr/local/opt/fzf


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"deoplete 
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:deoplete#ignore_case = 1

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"deoplete tern
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:deoplete#enable_at_startup = 1

let g:deoplete#sources#ternjs#tern_bin = '/Users/shiqiyang/.nvm/versions/node/v7.7.3/bin/tern'
let g:deoplete#sources#ternjs#timeout = 1

" Whether to include the types of the completions in the result data. Default: 0
let g:deoplete#sources#ternjs#types = 1

" Whether to include the distance (in scopes for variables, in prototypes for 
" properties) between the completions and the origin position in the result 
" data. Default: 0
let g:deoplete#sources#ternjs#depths = 1

" Whether to include documentation strings (if found) in the result data.
" Default: 0
let g:deoplete#sources#ternjs#docs = 1

" When on, only completions that match the current word at the given point will
" be returned. Turn this off to get all results, so that you can filter on the 
" client side. Default: 1
let g:deoplete#sources#ternjs#filter = 0

" Whether to use a case-insensitive compare between the current word and 
" potential completions. Default 0
let g:deoplete#sources#ternjs#case_insensitive = 1

" When completing a property and no completions are found, Tern will use some 
" heuristics to try and return some properties anyway. Set this to 0 to 
" turn that off. Default: 1
let g:deoplete#sources#ternjs#guess = 0

" Determines whether the result set will be sorted. Default: 1
let g:deoplete#sources#ternjs#sort = 0

" When disabled, only the text before the given position is considered part of 
" the word. When enabled (the default), the whole variable name that the cursor
" is on will be included. Default: 1
let g:deoplete#sources#ternjs#expand_word_forward = 0

" Whether to ignore the properties of Object.prototype unless they have been 
" spelled out by at least two characters. Default: 1
let g:deoplete#sources#ternjs#omit_object_prototype = 0

" Whether to include JavaScript keywords when completing something that is not 
" a property. Default: 0
let g:deoplete#sources#ternjs#include_keywords = 1

" If completions should be returned when inside a literal. Default: 1
let g:deoplete#sources#ternjs#in_literal = 0


"Add extra filetypes
let g:deoplete#sources#ternjs#filetypes = [
                \ 'jsx',
                \ 'javascript.jsx',
                \ 'vue',
                \ '...'
                \ ]


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"neomake
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_javascript_enabled_makers = ['eslint']
let g:neomake_javascript_eslint_exe = StrTrim(system('npm bin')).'/eslint'
if filereadable(StrTrim(system('npm prefix')).'/.eslintrc')
  let g:neomake_javascript_eslint_args = neomake#makers#ft#javascript#eslint()['args'] + ["-c", StrTrim(system('npm prefix')).'/.eslintrc']
else
  let g:neomake_javascript_eslint_args = neomake#makers#ft#javascript#eslint()['args'] + ["-c", StrTrim(system('npm prefix')).'/.eslintrc.js']
endif

" When writing a buffer (no delay).
call neomake#configure#automake('w')
" When writing a buffer (no delay), and on normal mode changes (after 750ms).
call neomake#configure#automake('nw', 750)
" When reading a buffer (after 1s), and when writing (no delay).
call neomake#configure#automake('rw', 1000)
" Full config: when writing or reading a buffer, and on changes in insert and
" normal mode (after 1s; no delay when writing).
call neomake#configure#automake('nrwi', 500)
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"airline
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:airline_theme='powerlineish'


""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"toggle relative number feature
"https://jeffkreeftmeijer.com/vim-number/
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set number relativenumber
augroup numbertoggle
  autocmd!
  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
augroup END
