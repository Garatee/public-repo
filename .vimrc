call pathogen#infect() 

"add tabs as spaces, and make them 4 spaces
set autoindent
set smartindent
set smarttab
set shiftwidth=4
set softtabstop=4
set tabstop=4
set expandtab

"Respect line wrapping
nnoremap k gk
nnoremap j gj
nnoremap gk k
nnoremap gj j

filetype plugin on
filetype indent on

"SETUP
set visualbell                      "No sounds
set autoread                        "Reload files changed outside vim
set laststatus=2                    "Enabling statusline at all times
if &encoding != 'utf-8'
    set encoding=utf-8              "Necessary to show Unicode glyphs
endif
set noshowmode                      "Don't show the mode(airline is handling this)

imap jj <Esc>                       " Use jj to leave insert mode
set cursorline                      "Highlight the line the cursor is on
set number                          "Line numbers

" Installs vim-plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

"Plugins
call plug#begin()
"TPOPE
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'           "Allows git commands
Plug 'tpope/vim-commentary'       "Makes commenting easier
Plug 'tpope/vim-surround'           "Allows changing of surrounding brackets, quotes, etc

Plug 'ctrlpvim/ctrlp.vim'            "Use ctrl-p to switch files

"Airine 
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

"Autoformat
Plug 'chiel92/vim-autoformat'

"Syntax Highlight
Plug 'sheerun/vim-polyglot'

"Style
Plug 'flazz/vim-colorschemes'
Plug 'airblade/vim-gitgutter'

call plug#end()

"Setting the colorscheme
if &t_Co >= 256 || has("gui_running")
    set background=dark
    if !empty(glob('~/.vim/plugged/vim-colorschemes/'))
        colorscheme gruvbox
    endif
endif
if &t_Co > 2 || has("gui_running")
    "switch syntax highlighting on, when the terminal has colors
    syntax on
endif

"Airline
let g:airline_powerline_fonts = 0
let g:airline#extensions#tabline#formatter='unique_tail_improved'
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='deus'

"Ale
let g:airline#extensions#ale#enabled = 1

"AutoFormat
noremap <C-I> :Autoformat<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'


"Git Gutter
let g:gitgutter_realtime = 1
set updatetime=500



" For NerdTree
" autocmd vimenter * NERDTree
set mouse=a
let g:NERDTreeMouseMode=3 
:command NE NERDTree

" For regex expression when typing /
nnoremap / /\v
vnoremap / /\v

" For moving lines
nnoremap <S-Up> :m-2<CR>
nnoremap <S-Down> :m+<CR>
inoremap <S-Up> <Esc>:m-2<CR>
inoremap <S-Down> <Esc>:m+<CR>

"Copy Clipboard Key bindings
map <C-c> :w !pbcopy<CR><CR>
map y : <C-c>


"Syntastic
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
