" basic settings:
set nocompatible
set ignorecase
set incsearch
set smartcase
set modelines=0

filetype off
execute pathogen#infect()
filetype plugin indent on

" no swap for files on certain volumes:
autocmd BufRead,BufNewFile /Volumes/dav/* set noswapfile
autocmd BufRead,BufNewFile ~/Dropbox/* set noswapfile
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
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set autoindent

" file type detection
au BufNewFile,BufRead *.zcml set filetype=xml
au BufRead,BufNewFile *.mkd,*.markdown,*.mdwn,*.md   set filetype=mkd

" special rules for special file types
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2
autocmd FileType html setlocal shiftwidth=2 tabstop=2

" GUI options:
if has("gui_running")
    set background=dark
    let g:solarized_contrast="high"
    let g:solarized_hitrail=1
    colorscheme solarized
    set guifont=Source\ Code\ Pro:h15"
    set lines=35
    set columns=120
    set guioptions-=T " remove toolbar
    set mousehide
    set cursorline

    " fullscreen takes up entire screen
    set fuoptions=maxhorz,maxvert
else
    " non-GUI options:
    set background=dark
endif

" tab completion – taken from 'Hacking VIM 7.2' by Kim Schulz:
function! SuperCleverTab()
    if strpart(getline('.'), 0, col('.') - 1) =~ '^\s*$'
        return "\<Tab>"
    else
        if &omnifunc != ''
            return "\<C-X>\<C-O>"
        elseif &dictionary != ''
            return "\<C-K>"
        else
            return "\<C-N>"
        endif
    endif
endfunction

inoremap <Tab> <C-R>=SuperCleverTab()<cr>

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
