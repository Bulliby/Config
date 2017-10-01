" **************************************************************************** "
"                                                                              "
"                                                                              "
"    .vimrc                                                                    "
"                                                         ________             "
"    By: bulliby <wellsguillaume@gmail.com>              /   ____/_  _  __     "
"                                                       /    \  _\ \/ \/ /     "
"    Created: 2017/09/26 19:56:48 by bulliby            \     \_\ \     /      "
"    Updated: 2017/09/28 21:24:06 by bulliby             \________/\/\_/       "
"                                                                              "
" **************************************************************************** "
let mapleader=","

set nu rnu
set numberwidth=4
set shiftwidth=4
nnoremap - ddp
nnoremap _ ddkP
inoremap <c-d> <esc>ddi
inoremap <c-x> <esc>xi
inoremap <c-u> <esc>veUi
nnoremap <c-u> veU
nnoremap <leader>ev :split $MYVIMRC<CR>
nnoremap <leader>sv :source $MYVIMRC<CR>
inoreabbrev __c public function __construct()
inoreabbrev @@ wellsguillaume@gmail.com
inoreabbrev __p public function() {<CR>}
inoreabbrev __P private function() {<CR>}
inoreabbrev __e private function() {<CR>}
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>< <esc>`<i<<esc>`>la><esc>
:inoremap jk <esc>
inoremap <esc> <nop>

execute pathogen#infect()
:set t_Co=256
:set background=light
:syntax on
:filetype plugin indent on
:colorscheme molokai
:set nu
:set showcmd
:set ignorecase
:set incsearch
:set hidden
:set tabstop=4
:set softtabstop=4
:set ruler
set ruler 
set scrolloff=3
set title
set smartcase
set hlsearch
set visualbell
set noerrorbells
set expandtab
set wrap!
set backspace=indent,eol,start

":nmap <F4> :nohlsearch<CR>
"let g:ackprg="ack -H --nocolor --nogroup --column"
"nmap <leader>j mA:ack<space>
"nmap <leader>ja mA:ack "<C-r>=expand("<cword>")<cr>"
"nmap <leader>jA mA:ack "<C-r>=expand("<CWORD>")<cr>"

let g:ctrlp_map = '<leader>c'
map <leader>n :NERDTreeToggle<CR>
map <leader>q :q <CR>
map <leader>x :x <CR>
map <leader>w :w <CR>
map <leader>g :tabprev <CR>
map <leader>h :tabnext <CR>
map <leader>f <C-W><RIGHT>
map <leader>a <C-W><LEFT>
map <leader>s <C-W><DOWN>
map <leader>d <C-W><UP>

hi Normal ctermbg=none
"let g:airline#extensions#tabline#enabled = 1
"let g:airline_theme='term'

"Ajout du 10/06/2017 Inspired from https://github.com/eko/dotfiles/blob/master/.vimrc
"need test :!pbcopy on MAC
"
"For xterm Terminal
:set ttyfast

:set nobackup
:set noswapfile

"Show file path always
:set laststatus=2 

"Abbreviations
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

"Don't autocomplete this files
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite

"Plugin from https://github.com/yegappan/grep.git 
nnoremap <silent> <leader>F :Rgrep<CR>
let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"Delete Buffer
map <leader>c :bd<CR>

map <leader><space> :nohlsearch<CR>
au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"For don't lost precedent yank
xnoremap p pgvy
"Set path of file
