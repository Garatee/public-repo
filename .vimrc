"SETUP
set autoindent smartindent
set softtabstop=2 tabstop=2 shiftwidth=2
set expandtab                       "Insert space characters when tab key is pressed
set nowrap                          "Don't wrap to next line when line out of screen
set ignorecase smartcase            "Search case insensitive unless capitalizing
set number                          "Line numbers
set relativenumber                  "Relative line number
set cursorline                      "Highlight the line the cursor is on
set incsearch                       "incremental search
set visualbell                      "No sounds
set scrolloff=8                     "always keep 8 spaces at the bottom
set autoread                        "Reload files changed outside vim
set laststatus=2                    "Enabling statusline at all times
if &encoding != 'utf-8'
  set encoding=utf-8                "Necessary to show Unicode glyphs
endif
set noshowmode                      "Don't show the mode(airline is handling this)
set signcolumn=yes                  "side column for linting, git
set noswapfile
set nobackup
set undodir=~/.vim/undodir
set undofile
set rtp+=/usr/local/opt/fzf
set ve+=onemore                     "Allow cursor to move an extra character more at the end of every line
noremap $ $l
filetype plugin on                  "Allow local options to override global ones
filetype indent on                  "Allow local options to override global ones
let g:airline_powerline_fonts = 1

" Installs vim-plug if not already present
if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
        \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif


"Plugins
call plug#begin()

"NerdComment
Plug 'preservim/nerdcommenter'

"Syntastic
Plug 'vim-syntastic/syntastic'

"TPOPE
Plug 'tpope/vim-sensible'           "A universal set of defaults that everyone can agree on
Plug 'tpope/vim-fugitive'           "Allows git commands
Plug 'tpope/vim-commentary'         "Makes commenting easier: use gcc to comment out a line, gcap for a whole paragraph. In visual mode, gcc to comment out selected
Plug 'tpope/vim-surround'           "Allows changing of surrounding brackets, quotes, etc by typing cs <prev> <next> ex. cs'`
Plug 'ctrlpvim/ctrlp.vim'           "Use ctrl-p to switch files

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

"Auto Pair
Plug 'jiangmiao/auto-pairs'

"Undo Tree
Plug 'mbbill/undotree'

"Nerd Tree
Plug 'preservim/nerdtree'

"YouCompleteMe
"With pyenv installed python, you will need to add this: export PYTHON_CONFIGURE_OPTS="--enable-framework"
"You will then need to run: ~/.vim/plugged/YouCompleteMe/install.py --all
Plug 'ycm-core/YouCompleteMe'
let g:ycm_global_ycm_extra_conf = '~/.vim/plugged/YouCompleteMe/.ycm_extra_conf.py'
"let g:ycm_confirm_extra_conf = 0


"Tree Icons
"Always load vim-devicons as the last one
Plug 'ryanoasis/vim-devicons'

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

"Exit
"noremap <C-w> :q<CR>

"Ctrl-p
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_custom_ignore = '\v[\/](node_modules|target|dist|build|bin)|(\.(swp|ico|git|dSYM|svn|class|o))$'
let g:ctrlp_working_path_mode = 'ra'

"For NerdTree
"autocmd vimenter * NERDTree
set mouse=a
let g:NERDTreeMouseMode=3
let NERDTreeShowHidden=1
let NERDTreeIgnore=['\.DS_Store$','\.vscode'] " ignore files in nerd tree
command NE NERDTree
function! NerdTreeToggleFind()
    if exists("g:NERDTree") && g:NERDTree.IsOpen()
        NERDTreeClose
    elseif filereadable(expand('%'))
        NERDTreeFind
    else
        NERDTree
    endif
endfunction


"For regex expression when typing /
nnoremap / /\v
vnoremap / /\v

"Press ff for <Esc>
imap ff <Esc>


"Copy Clipboard Key bindings
map <C-c> :w !pbcopy<CR><CR>

"Copy current path
let @+ = expand('%:p')

""Syntastic
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
