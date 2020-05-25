"vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
"git interface
Plugin 'tpope/vim-fugitive'
"filesystem
Plugin 'scrooloose/nerdtree'
Plugin 'jistr/vim-nerdtree-tabs'
Plugin 'kien/ctrlp.vim'
"python sytax checker
Plugin 'nvie/vim-flake8'
Plugin 'vim-scripts/Pydiction'
Plugin 'vim-scripts/indentpython.vim'
Plugin 'scrooloose/syntastic'
"auto-completion stuff
Plugin 'Valloric/YouCompleteMe'
Plugin 'ervandew/supertab'

" tabular navigation
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

" multiple cursors
Plugin 'terryma/vim-multiple-cursors'

" quick commenting
Plugin 'preservim/nerdcommenter'

" code folding
Plugin 'tmhedberg/SimpylFold'

" easy motion
Plugin 'easymotion/vim-easymotion'

call vundle#end()

filetype plugin indent on    " enables filetype detection
filetype plugin on
let mapleader=" "            " default leader is mapped to <space> key

" color mapping - 
:color desert

" airline plugin settings
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#show_tab_nr = 0
let airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
set t_Co=256
let g:airline_theme='badwolf'
"let g:airline_statusline_ontop=1
" remove the filetype part
let g:airline_section_x=''
let g:airline_section_y=''
let g:airline_section_z = ''
let airline#extensions#tabline#tabs_label = ''
let airline#extensions#tabline#show_splits = 0
"let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
let g:airline#extensions#hunks#enabled=0

" navigation shortcuts
set splitbelow
set splitright

"Folding based on indentation:
autocmd FileType python set foldmethod=indent
set foldlevel=99
"use space to open folds
nnoremap <space> za 
let g:SimpylFold_docstring_preview=1    " show docstring for folded code

"autocomplete
let g:ycm_autoclose_preview_window_after_completion=1
let g:pydiction_location = '/home/anuragmodi/.vim/bundle/Pydiction/complete-dict'

"custom keys
map <leader>g  :YcmCompleter GoToDefinitionElseDeclaration<CR>

let NERDTreeIgnore=['\.pyc$', '\~$', '^__pycache__$'] "ignore files in NERDTree

"I don't like swap files
set noswapfile

" turn hybrid line numbers on
set nu rnu

"------------Start Python PEP 8 stuff----------------
" Number of spaces that a pre-existing tab is equal to.
au BufRead,BufNewFile *py,*pyw,*.c,*.h set tabstop=4

"spaces for indents
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.py,*.pyw set expandtab
au BufRead,BufNewFile *.py set softtabstop=4

" Use the below highlight group when displaying bad whitespace is desired.
highlight BadWhitespace ctermbg=red guibg=red

" Display tabs at the beginning of a line in Python mode as bad.
au BufRead,BufNewFile *.py,*.pyw match BadWhitespace /^\t\+/
" Make trailing whitespace be flagged as bad.
au BufRead,BufNewFile *.py,*.pyw,*.c,*.h match BadWhitespace /\s\+$/

" Wrap text after a certain number of characters
au BufRead,BufNewFile *.py,*.pyw, set textwidth=100

" Use UNIX (\n) line endings.
au BufNewFile *.py,*.pyw,*.c,*.h set fileformat=unix

" Set the default file encoding to UTF-8:
set encoding=utf-8

" For full syntax highlighting:
let python_highlight_all=1
syntax on

" Keep indentation level from previous line:
" autocmd FileType python set autoindent

" make backspaces more powerfull
set backspace=indent,eol,start

"----------Stop python PEP 8 stuff--------------


" custom key mappings

" Easily create new files, just like other editors
nnoremap <C-t> :tabnew<CR>
nnoremap <C-h> gt
nnoremap <C-l> gT
nnoremap <C-S-t> :tabnew#<CR>

nnoremap ,p :set paste
nnoremap ,pyt :-1read $HOME/.vim/header_templates/py_header<CR>
nnoremap ,sht :-1read $HOME/.vim/header_templates/sh_header<CR>
nnoremap <F6> :NERDTreeToggle<CR>
nnoremap ,trim :%s/\s\+$//e
