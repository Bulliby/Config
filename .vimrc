execute pathogen#infect()
:set background=dark
:set t_Co=256
:syntax on
:filetype plugin indent on
:colorscheme molokai
:set nu
:set showcmd
:set ignorecase
:set incsearch
:set hidden
:set tabstop=4
:set shiftwidth=4
:set softtabstop=4
set ruler 
set wrap
set scrolloff=3
set title
set smartcase
set hlsearch
set visualbell
set noerrorbells
set expandtab
set backspace=indent,eol,start
:nmap <F4> :nohlsearch<CR>
nnoremap <f2> :0r ~/dev/prog/header/header.txt<cr>:%s/!!DATEEE!!/\=strftime("%d-%m-%Y")<cr>
let mapleader=","
map <up> <nop>
map <down> <nop>
map <left> <nop>
map <right> <nop>

imap <up> <nop>
imap <down> <nop>
imap <left> <nop>
imap <right> <nop>
imap ,, <Esc>
map ,, <Esc>

let g:ackprg="ack -H --nocolor --nogroup --column"
nmap <leader>j mA:Ack<space>
nmap <leader>ja mA:Ack"<C-r>=expand("<cword>")<cr>"
nmap <leader>jA mA:Ack"<C-r>=expand("<CWORD>")<cr>"

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
