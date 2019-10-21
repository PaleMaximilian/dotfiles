set nocompatible " Required by vundle
filetype off     " Required by vundle

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'

Plugin 'ctrlpvim/ctrlp.vim' " Fuzzy search plugin
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-repeat'
Plugin 'vim-ruby/vim-ruby'
Plugin 'bling/vim-airline' "Status bar customization
Plugin '907th/vim-auto-save'
Plugin 'slim-template/vim-slim.git'
Plugin 'chemzqm/vim-jsx-improve'

Plugin 'nanotech/jellybeans.vim'

call vundle#end()            " required
filetype plugin indent on    " required


syntax on                 " Enable syntax highlighting
syntax enable

augroup myfiletypes
  " Clear old autocmds in group
  autocmd!
  " autoindent with two spaces, always expand tabs
  autocmd FileType ruby,eruby,yaml setlocal ai sw=2 sts=2 et
  autocmd FileType ruby,eruby,yaml setlocal path+=lib
  autocmd FileType ruby,eruby,yaml setlocal colorcolumn=120
  " Make ?s part of words
  autocmd FileType ruby,eruby,yaml setlocal iskeyword+=?

  " Clojure
  autocmd FileType clojure setlocal colorcolumn=80
  autocmd FileType clojure map <Leader>t :!lein test<cr>

  " Elm
  autocmd FileType elm map <Leader>t :ElmMake<cr>
  autocmd FileType elm map <Leader>d :ElmErrorDetail<cr>
  autocmd FileType elm map <Leader>o :!elm-test<cr>
  autocmd FileType elm map <Leader>i :ElmFormat<cr>

  autocmd FileType slim setlocal foldmethod=indent
  autocmd BufNewFile,BufRead *.slim set filetype=slim
  autocmd FileType slim setlocal sts=2 sw=2 et
augroup END

colorscheme jellybeans


" No annoying sound on errors
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Remap leader key
let mapleader = "\<Space>"

nmap <leader>vr :sp $MYVIMRC<cr>

" Source (reload) your vimrc. Type space, s, o in sequence to trigger
nmap <leader>so :source $MYVIMRC<cr>

"timeout length for leader key
:set timeoutlen=2000

" Get to NORMAL mode with 'jj'
:imap jj <Esc>

" Map Ctrl-s to save file in normal and insert modes
nmap <C-s> :w<CR>
imap <C-s> <esc>:w<CR>

"0 jumps to beginning of line
nmap 0 ^

filetype indent on "activates indenting for files
set autoindent " auto indenting
set number
set relativenumber
set nobackup " get rid of anoying ~file
set clipboard=unnamed " Use the OS clipboard by default (on versions compiled with `+clipboard`)

" Make CtrlP use ag for listing the files. Way faster and no useless files.
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 1

" Don't jump to a different place just because the file is already open, dingus
let g:ctrlp_switch_buffer = 0

let g:auto_save = 1  " enable AutoSave on Vim startup

