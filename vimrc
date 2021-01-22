" basic settings:
set nocompatible
set ignorecase
set incsearch
set smartcase
set modelines=0

filetype off
filetype plugin indent on

" and no writing backups:
set nobackup
set nowritebackup

" command line completion options:
set wildmode=longest:full
set wildmenu

" display options
syntax on
set ruler
set number
set nofoldenable
set showcmd
set showmatch
set showmode
set laststatus=2
set scrolloff=3

" text wrapping:
set wrap
set textwidth=79
set formatoptions=qrn1
set colorcolumn=80

" never show vim's intro screen
set shortmess+=I

" no error bells:
set noerrorbells
set visualbell
set t_vb=

" special char display in list mode
set listchars=trail:·,tab:▸\ ,eol:¬

" code formatting:
set tabstop=2
set shiftwidth=2
set softtabstop=4
set expandtab
set autoindent

" file type detection
au BufNewFile,BufRead *.zcml set filetype=xml
au BufNewFile,BufRead *.mkd,*.markdown,*.mdwn,*.md set filetype=markdown

set background=dark

let mapleader = ","

" quick reST/Markdown headings:
nnoremap <leader>1 yypVr=
nnoremap <leader>2 yypVr-

" remove trailing whitespace:
nnoremap <leader>W :%s/\s\+$//<cr>:let @/=''<CR>

" select last pasted text:
nnoremap <leader>v V`]

" fix search regex syntax:
nnoremap / /\v
vnoremap / /\v
set gdefault

nnoremap <tab> %
vnoremap <tab> %
