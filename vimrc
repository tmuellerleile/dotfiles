" basic settings:
set nocompatible
syntax on
set showmatch
set ruler
set number
set showcmd
set ignorecase
set incsearch
set smartcase
set linebreak
set nofoldenable

" never show vim's intro screen
set shortmess+=I

" no swap for files on certain volumes:
autocmd BufRead,BufNewFile /Volumes/dav/* set noswapfile
autocmd BufRead,BufNewFile ~/Dropbox/* set noswapfile
" and no writing backups:
set nobackup
set nowritebackup

" no error bells:
set noerrorbells
set novisualbell
set t_vb=

" show trailing whitespaces as · in list mode
set listchars=trail:·

" code formatting:
set tabstop=4
set shiftwidth=4
set expandtab
set autoindent

" file type detection
au BufNewFile,BufRead *.zcml set filetype=xml
au BufNewFile,BufRead *.md   set filetype=markdown

" special rules for special file types
autocmd FileType javascript setlocal shiftwidth=2 tabstop=2
autocmd FileType tex setlocal shiftwidth=2 tabstop=2

" command line completion options:
set wildmode=longest:full
set wildmenu

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

map <F2> :NERDTreeToggle<CR>
