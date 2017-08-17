set nocompatible              " be iMproved, required
filetype off                  " required

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'tpope/vim-fugitive'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

call vundle#end()            " required
filetype plugin indent on    " required
if v:progname =~? "evim"
  finish
endif

source $VIMRUNTIME/defaults.vim

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file (restore to previous version)
  if has('persistent_undo')
    set undofile	" keep an undo file (undo changes after closing)
  endif
endif

if &t_Co > 2 || has("gui_running")
  " Switch on highlighting the last used search pattern.
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Add optional packages.
"
" The matchit plugin makes the % command work better, but it is not backwards
" compatible.
if has('syntax') && has('eval')
  packadd matchit
endif

set shortmess=atI
set nu
set syntax=on
set helplang=cn
set ruler
set completeopt=preview,menu
filetype plugin on
set clipboard+=unnamed
set tabstop=4
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
        exec "!g++ % -o %<"
        exec "! ./%<"
    elseif &filetype == 'python' 
        exec "!python %"
    elseif &filetype == 'sh'
        :!./%
    endif
endfunc

map zz :q!<CR>
imap <S-e> <ESC>
map cc @a
map cx @b


Bundle 'Valloric/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '/root/.vim/bundle/YouCompleteMe/third_party/ycmd/cpp/ycm/.ycm_extra_conf.py' 
set background=dark
color wombat256mod
