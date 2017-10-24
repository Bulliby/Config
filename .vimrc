" **************************************************************************** "
"                                                                              "
"                                                                              "
"    .vimrc                                                                    "
"                                                         ________             "
"    By: bulliby <wellsguillaume@gmail.com>              /   ____/_  _  __     "
"                                                       /    \  _\ \/ \/ /     "
"    Created: 2017/09/26 19:56:48 by bulliby            \     \_\ \     /      "
"    Updated: 2017/10/24 22:12:07 by bulliby             \________/\/\_/       "
"                                                                              "
" **************************************************************************** "

let mapleader=","
let maplocalleader=","
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
inoreabbrev @@ wellsguillaume@gmail.com
vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
vnoremap <leader>< <esc>`<i<<esc>`>la><esc>
:inoremap jk <esc>
inoremap <esc> <nop>

":aug wrap
":   au!
":   autocmd BufNewFile,BufRead *.html setlocal nowrap
":   autocmd BufNewFile,BufRead *.html.twig setlocal nowrap
":aug END
"
":aug comment
":   au!
":   autocmd FileType javascript nnoremap <buffer> <localleader>c I//<esc>
":   autocmd FileType c nnoremap <buffer> <localleader>c I//<esc>
":   autocmd FileType python     nnoremap <buffer> <localleader>c I#<esc>
":   autocmd FileType vim     nnoremap <buffer> <localleader>c I"<esc>
":   autocmd FileType html     nnoremap <buffer> <localleader>c I<!--<esc>A--><esc>
":aug END
"
":aug snippet
":   au!
":   autocmd FileType python     :iabbrev <buffer> iff if:<left>
":   autocmd FileType javascript :iabbrev <buffer> iff if ()<left>
":   autocmd FileType c :iabbrev <buffer> iff if ()<left>
":   autocmd FileType php :iabbrev <buffer> iff if ()<left>
":   autocmd FileType javascript :iabbrev <buffer> eiff else<space>if<space>()<left>
":   autocmd FileType c :iabbrev <buffer> eiff else<space>if<space>()<left>
":   autocmd FileType php :iabbrev <buffer> eiff else<space>if<space>()<left>
":   autocmd filetype php :inoreabbrev <buffer> __pu public function<space>()<CR>{<CR>}<CR><up><up><up>
":   autocmd filetype php :inoreabbrev <buffer> __pr private function()<CR>{<CR>}<CR><up><up><up>
":   autocmd filetype php :inoreabbrev <buffer> __c public function __construct<CR>{<CR>}<CR><up><up><up>
":aug END

execute pathogen#infect()
:set t_Co=256
:set background=dark
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
set ruler 
set scrolloff=3
set title
set smartcase
set hlsearch
set visualbell
set noerrorbells
set expandtab
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
let g:airline#extensions#tabline#enabled = 1
let g:airline_theme='term'

"Ajout du 10/06/2017 Inspired from https://github.com/eko/dotfiles/blob/master/.vimrc
"need test :!pbcopy on MAC
"
"For xterm Terminal
":set ttyfast
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
"nnoremap <silent> <leader>F :Rgrep<CR>
"let Grep_Default_Options = '-IR'
"let Grep_Skip_Files = '*.log *.db'
"let Grep_Skip_Dirs = '.git node_modules'

"Delete Buffer
map <leader>c :bd<CR>
map <leader><space> :nohlsearch<CR>

au FileType yaml setlocal tabstop=2 expandtab shiftwidth=2 softtabstop=2

"For don't lost precedent yank
xnoremap p pgvy
