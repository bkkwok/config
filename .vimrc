set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle, requireu
Plugin 'VundleVim/Vundle.vim'
Plugin 'valloric/youcompleteme'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'morhetz/gruvbox'
Plugin 'pangloss/vim-javascript'
Plugin 'Raimondi/delimitMate'
Plugin 'prettier/vim-prettier', { 'do': 'npm  install' }
Plugin 'SirVer/ultisnips'
" Add maktaba and codefmt to the runtimepath.
" (The latter must be installed before it can be used.)
Plugin 'google/vim-maktaba'
Plugin 'google/vim-codefmt'
" Also add Glaive, which is used to configure codefmt's maktaba flags. See
" `:help :Glaive` for usage.
Plugin 'google/vim-glaive'
Plugin 'tell-k/vim-autopep8'
" All of your Plugins must be added before the following line
call vundle#end()            " required
" the glaive#Install() should go after the "call vundle#end()"
call glaive#Install()
filetype plugin indent on    " required
"enable syntax modifiers
syntax on

" show line numbers
set number
" horizontal splits below
set splitbelow
" vertical splits split right
set splitright
" auto resize splits on window resize
:autocmd VimResized * wincmd =
" enable mouse mode
:set mouse=n

set tabstop=2
set shiftwidth=2
set laststatus=2

let g:prettier#autoformat = 1
autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

let g:sessions_dir = '~/.vim/sessions'
exec 'nnoremap <Leader>ss :mks! ' . g:sessions_dir . '/'
exec 'nnoremap <Leader>sr :so ' . g:sessions_dir . '/'

" ctrlp
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git]'

" morhetz/gruvbox
colorscheme gruvbox
set background=dark
set t_Co=256
"let g:gruvbox_contrast_dark='hard' 

" key-maps
imap <expr> <CR> pumvisible() ? "\<c-y>" : "<Plug>delimitMateCR"

" ctrl + directional to navigate tabs
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" ultisnips

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
" Put swap files in .vim/tmp
set directory^=$HOME/.vim/tmp//

augroup autoformat_settings
  autocmd FileType c,cpp AutoFormatBuffer clang-format
augroup END
" autopep8
let g:autopep8_on_save = 1 
let g:autopep8_disable_show_diff=1
