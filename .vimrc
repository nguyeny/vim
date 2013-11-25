set nocompatible
syntax on
filetype plugin indent on

""" Vim GUI"""
" Show line numbers
set number

" Ignore binary files
set wildignore=*.o,*~,*.pyc

" Always show current position
set ruler

" Ignore case when searching
set ignorecase

" Highlight search results
set hlsearch

" Show matching brackets
set showmatch

""" Tab and indentation"""
" Convert tabs to spaces
set expandtab

" Use smart tabs
set smarttab

" Tab width
set shiftwidth=4
set tabstop=4

" Indentation
set autoindent
set smartindent

" Wrap lines
set wrap
set softtabstop=4
map <F3> :retab <CR>

" NERDTree settings
" autocmd vimenter * if !argc() | NERDTree | endif
autocmd VimEnter * NERDTree
"autocmd BufEnter NERDTreeMirror
autocmd VimEnter * wincmd p
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" Highlight errors and long lines
au BufRead,BufNewFile *.c,*.h,*.s,*.S,*.py match Error /\%>80v/
au Syntax *.c,*.py syn match Error /\s\+$/ | syn match Error /\(^\s*\)\@<= \+\ze\t\+/ | syn match Error /\ \{8,}/ |

autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red guibg=red
autocmd BufWinEnter * match ExtraWhitespace /^\s+$\|\s\+$/

autocmd BufRead,BufNewfile *.c,*.h set formatoptions=croql
autocmd BufRead,BufNewFile *.c,*.h set cindent
autocmd BufRead,BufNewFile *.c,*.h set cinoptions=t0(0+4

map <f11> :nohlsearch<CR>

autocmd BufRead *.py set autoindent
autocmd BufRead *.py set smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class,0#


au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

" Mappings
" Delete trailing white space on save, useful for Python and CoffeeScript
func! DeleteTrailingWS()
  exe "normal mz"
  %s/\s\+$//ge
  exe "normal `z"
endfunc
autocmd BufWrite *.py :call DeleteTrailingWS()
autocmd BufWrite *.coffee :call DeleteTrailingWS()

" Colour scheme
set t_Co=256
set background=dark
colorscheme molokai

