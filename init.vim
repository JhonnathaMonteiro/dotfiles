set encoding=UTF-8

call plug#begin('~/.local/share/nvim/plugged')

" Git stuff
Plug 'tpope/vim-fugitive'

" Autocomplete
Plug 'davidhalter/jedi-vim'
Plug 'Shougo/deoplete.nvim', {'do': ':UpdateRemotePlugins'}
Plug 'zchee/deoplete-jedi'
Plug 'jiangmiao/auto-pairs'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'

" Formater
Plug 'Chiel92/vim-autoformat'

" File Tree
Plug 'scrooloose/nerdtree'

" Syntax checker
Plug 'w0rp/ale'

" UI related
Plug 'morhetz/gruvbox'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

call plug#end()

filetype plugin indent on

" UI configuration
syntax on
syntax enable

" colorscheme
"let base16colorspace=256
"colorscheme base16-gruvbox-dark-hard
colorscheme gruvbox
set background=dark

" True Color Support if it's avaiable in terminal
if has("termguicolors")
    set termguicolors
endif

" To dysplay Relative line numbers
set relativenumber

set hidden
set mouse=a
set noshowmode
set noshowmatch
set nolazyredraw

" Turn off backup
set nobackup
set noswapfile
set nowritebackup

" Search configuration
set ignorecase   " ignore case when searching
set smartcase    " turn on smartcase

" Tab and ident configuration
set expandtab
set tabstop=4
set shiftwidth=4

" Ale
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%] %s [%severity%]'
let g:ale_linters = {'python': ['flake8']}

" Airline
let g:airline#extensions#branch#enabled=1
let g:airline_theme = 'powerlineish'
let g:airline_powerline_fonts = 1


" My shortcuts 
:nnoremap <Leader> s:%s/\<<C-r><C-w>\>//g<Left><Left>
map <F2> :NERDTreeToggle<CR>
noremap <F3> :Autoformat<CR>

" Virtual envirovment configuration
let g:python_host_prog = 'python'
let g:python3_host_prog = 'python3'
set shortmess+=A

" Clipboard to SO with: "*y
set clipboard=unnamed


" disable autocompletion, cause we use deoplete for completion
let g:jedi#completions_enabled = 0

" Trigger configuration. Do not use < tab > if you use https: // github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"

" Deseable jedi preview
autocmd FileType python setlocal completeopt-=preview

" Deoplete config
let g:deoplete#enable_at_startup = 1
autocmd InsertLeave,CompleteDone * if pumvisible() == 0 | pclose | endif

" Some system dependencies
"curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs \
"    https: // raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"
" pip3 install pynvim
" pip3 install flake8
" pip3 install autopep8
" pip3 install jedi
" pip3 install yapf
