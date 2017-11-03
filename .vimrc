set undodir=~/.vim_undo
set undofile
set nobackup
set noswapfile

set shortmess=atI
set nu
set syntax=on
set helplang=cn
set ruler
set completeopt=menu
filetype plugin on
set clipboard+=unnamed
set tabstop=8
set softtabstop=2
set shiftwidth=2
set smarttab
set autoindent
set expandtab
set enc=utf-8
set ignorecase
set noexpandtab

map <F5> :call CompileRunGcc()<CR>
map ru :call CompileRunGcc()<CR>
func! CompileRunGcc()
    exec "w"
    if &filetype == 'c'
        exec "!gcc % -o %<"
        exec "! ./%<"
    elseif &filetype == 'cpp'
        exec "!g++ % -o %< -pthread -std=c++11"
        exec "! ./%<"
    elseif &filetype == 'python' 
        exec "!python %"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

map zz :q!<CR>
imap <A-e> <ESC>
map vb <C-]>
map vv <C-T>
map <C-w> :tabc<CR>
map gn :tabe 
map <S-j> gT
map <S-k> gt

set background=dark
color wombat256mod
set tags=/usr/ceph/src/tags
set autochdir
set nobackup
set laststatus=2
set cursorline
hi CursorLine ctermfg=white
highlight StatusLine cterm=bold ctermfg=grey ctermbg=black
set statusline=[PATH:\ \"%F\"\ ]%y%r%m%*%=[Line:%l/%L,Column:%c][%p%%]
