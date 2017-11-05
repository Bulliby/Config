" **************************************************************************** "
"                                                                              "
"                                                                              "
"    .vimrc                                                                    "
"                                                         ________             "
"    By: bulliby <wellsguillaume@gmail.com>              /   ____/_  _  __     "
"                                                       /    \  _\ \/ \/ /     "
"    Created: 2017/09/26 19:56:48 by bulliby            \     \_\ \     /      "
"    Updated: 2017/11/05 21:25:19 by bulliby             \________/\/\_/       "
"                                                                              "
" **************************************************************************** "


:let mapleader=","
:let maplocalleader=","

" Mapping {{{
:nnoremap _ ddkP
:nnoremap - ddp
:inoremap <c-d> <esc>ddi
:inoremap <c-x> <esc>xi
:inoremap <c-u> <esc>veUi
:nnoremap <c-u> veU
:inoreabbrev @@ wellsguillaume@gmail.com
:vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
:vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
:vnoremap <leader>< <esc>`<i<<esc>`>la><esc>
:inoremap jk <esc>
:onoremap ip( :<C-U>normal! F)vi(<cr>
:onoremap in( :<C-U>normal! f(vi(<CR>
:onoremap in" :<C-U>normal! f"vi"<CR>
:onoremap ip" :<C-U>normal! F"vi"<CR>
:onoremap in' :<C-U>normal! f'vi'<CR>
:onoremap ip' :<C-U>normal! F'vi'<CR>
:nnoremap <leader>ev :vsplit ~/.vimrc<CR>
:nnoremap <leader>sv :source ~/.vimrc<CR>
" }}}

" Auto commands (comment snippet wrap fold) {{{
:aug wrap
:   au!
:   autocmd BufNewFile,BufRead *.html setlocal wrap
:   autocmd BufNewFile,BufRead *.html.twig setlocal wrap
:aug END

:aug comment
:   au!
   "Single Line
:   autocmd FileType css                    vnoremap <buffer> <localleader>c I//<esc>
:   autocmd FileType python,sh,yaml         vnoremap <buffer> <localleader>c I#<esc>
:   autocmd FileType vim                    vnoremap <buffer> <localleader>c I"<esc>
   "Multi Line
:   autocmd FileType javascript,c,cpp       vnoremap <buffer> <localleader>c <ESC>`<I/*<ESC>`>A*/<ESC>
:   autocmd FileType html                   vnoremap <buffer> <localleader>c <ESC>`<I<!--<ESC>`>A--><ESC>
:   autocmd FileType html.twig              vnoremap <buffer> <localleader>c <ESC>`<I{#<ESC>`>A#}<ESC>
:
:aug END

:aug snippet
:   au!
:   autocmd FileType c,php,js,cpp           iabbrev <buffer> _i if()<CR>{<CR>}<ESC>2k0f(
:   autocmd FileType c,php,js,cpp           iabbrev <buffer> _e else if()<CR>{<CR>}<ESC>2k0f(
:   autocmd FileType php,js                 iabbrev <buffer> _f function ()<CR>{<CR>}<ESC>2k0f(
:   autocmd FileType php,cpp                iabbrev <buffer> _pu public
:   autocmd FileType php,cpp                iabbrev <buffer> _pr private
:aug END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
" }}}

" Config {{{
:execute pathogen#infect()
:set t_Co=256
:set background=light
:syntax on
:filetype plugin indent on
:colorscheme molokai
:set rnu
:set showcmd
:set numberwidth=4
:set shiftwidth=4
:set ignorecase
:set incsearch
:set hidden
:set tabstop=4
:set softtabstop=4
:set ruler
:set scrolloff=3
:set title
:set smartcase
:set hlsearch
:set visualbell
:set noerrorbells
:set expandtab
:set backspace=indent,eol,start
:set nobackup
:set noswapfile
:hi Normal ctermbg=none
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
:xnoremap p pgvy
:set foldlevel=99
" }}}

" Windows Buffers {{{
:noremap <leader>n :NERDTreeToggle<CR>
:noremap <leader>q :q <CR>
:noremap <leader>x :x <CR>
:noremap <leader>w :w <CR>
:noremap <leader>g :tabprev <CR>
:noremap <leader>h :tabnext <CR>
:noremap <leader>f <C-W><RIGHT>
:noremap <leader>a <C-W><LEFT>
:noremap <leader>s <C-W><DOWN>
:noremap <leader>d <C-W><UP>
:noremap <leader><space> :nohlsearch<CR>
" }}}

" Abbreviatons {{{
:cnoreabbrev W! w!
:cnoreabbrev Q! q!
:cnoreabbrev Qall! qall!
:cnoreabbrev Wq wq
:cnoreabbrev Wa wa
:cnoreabbrev wQ wq
:cnoreabbrev WQ wq
:cnoreabbrev W w
:cnoreabbrev Q q
:cnoreabbrev Qall qall
" }}}

set statusline=%-100F%m\{%c\:%l\}
