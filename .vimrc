" **************************************************************************** "
"                                                                              "
"                                                                              "
"    .vimrc                                                                    "
"                                                         ________             "
"    By: bulliby <wellsguillaume@gmail.com>              /   ____/_  _  __     "
"                                                       /    \  _\ \/ \/ /     "
"    Created: 2017/09/26 19:56:48 by bulliby            \     \_\ \     /      "
"    Updated: 2020/04/12 18:04:21 by bulliby             \________/\/\_/       "
"                                                                              "
" **************************************************************************** "


:let mapleader=","
:let maplocalleader=","

" Mapping {{{
"j:nnoremap _ ddkP
"j:nnoremap - ddp
"j:inoremap <c-d> <esc>ddi
":inoremap <c-x> <esc>xi
"supressed for completion stuff
":inoremap <c-u> <esc>veUi
":nnoremap <c-u> veU
:inoreabbrev @@ wellsguillaume@gmail.com
":vnoremap <leader>" <esc>`<i"<esc>`>la"<esc>
":vnoremap <leader>' <esc>`<i'<esc>`>la'<esc>
":vnoremap <leader>< <esc>`<i<<esc>`>la><esc>
:inoremap jk <esc>
":onoremap ip( :<C-U>normal! F)vi(<cr>
":onoremap in( :<C-U>normal! f(vi(<CR>
":onoremap in" :<C-U>normal! f"vi"<CR>
":onoremap ip" :<C-U>normal! F"vi"<CR>
":onoremap in' :<C-U>normal! f'vi'<CR>
":onoremap ip' :<C-U>normal! F'vi'<CR>
:nnoremap <leader>ev :vsplit ~/.vimrc<CR>
:nnoremap <leader>he :help quickref.txt<CR>
:nnoremap <leader>sv :source ~/dev/Tools/DotFiles/.vimrc<CR>
:nnoremap <leader>sp :vsplit $HOME/.vim/bundle/vim-snippets/UltiSnips<CR>
"::nnoremap <leader>; mqA;<ESC>`q
:noremap <leader>f :CommandT<CR>
:noremap <leader>b :CommandTBuffer<CR>
:noremap <leader>t :CommandTTag<CR>
" }}}

" Auto commands (comment snippet wrap fold) {{{
:aug wrap
:   au!
:   autocmd BufNewFile,BufRead *.html setlocal wrap
:   autocmd BufNewFile,BufRead *.html.twig setlocal wrap
:   autocmd BufNewFile,BufRead *.vue setlocal nowrap
:aug END

:aug comment
:   au!
   "Single Line
:   autocmd FileType css                    vnoremap <buffer> <localleader>c I//<esc>
:   autocmd FileType python,sh,yaml         vnoremap <buffer> <localleader>c I#<esc>
:   autocmd FileType vim                    vnoremap <buffer> <localleader>c I"<esc>
   "Multi Line
:   autocmd FileType javascript,c,cpp,php   vnoremap <buffer> <localleader>c <ESC>`<I/*<ESC>`>A*/<ESC>
:   autocmd FileType html                   vnoremap <buffer> <localleader>c <ESC>`<I<!--<ESC>`>A--><ESC>
:   autocmd FileType html.twig              vnoremap <buffer> <localleader>c <ESC>`<I{#<ESC>`>A#}<ESC>
:
:aug END

:aug snippet
:   au!
:   autocmd FileType c,php,js,cpp           iabbrev <buffer> _i if()<CR>{<CR>}<ESC>2k0f(
:   autocmd FileType c,php,js,cpp           iabbrev <buffer> _e else if()<CR>{<CR>}<ESC>2k0f(
:   autocmd FileType php,cpp                iabbrev <buffer> _pu public
:   autocmd FileType php,cpp                iabbrev <buffer> _pr private
:   autocmd FileType javascript             iabbrev <buffer> _C console.log()<ESC>2h
:   autocmd FileType javascript,php,c,cpp   iabbrev <buffer> _F function()<ESC>2h
:aug END

augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

" }}}

" Config {{{
:execute pathogen#infect()
:Helptags
:set t_Co=256
:set background=dark
:syntax on
:filetype plugin indent on
:set rnu
:set nu
:set showcmd
:set numberwidth=4
:set shiftwidth=4
:set ignorecase
:set incsearch
:set hidden
:set tabstop=4
:set softtabstop=4
:set ruler
:set title
:set smartcase
:set hlsearch
:set novisualbell
:set noerrorbells
:set expandtab
:set backspace=indent,eol,start
:set nobackup
:set noswapfile
:hi Normal ctermbg=none
:set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.pyc,*.db,*.sqlite
:set foldlevel=99
" }}}

" Windows Buffers {{{
:noremap <leader>n :NERDTreeToggle<CR>
:noremap <leader>q :q <CR>
:noremap <leader>x :bd <CR>
:noremap <leader>w :w <CR>
:noremap <leader>g :tabprev <CR>
:noremap <leader>h :tabnext <CR>
:noremap <leader>f <C-W><RIGHT>
:noremap <leader>a <C-W><LEFT>
:noremap <leader>s <C-W><DOWN>
:noremap <leader>d <C-W><UP>
:noremap <leader>p :set paste!<CR>
:noremap <leader>y "+y<CR>
:noremap <leader><space> :nohlsearch<CR>
" }}}

" Abbreviatons {{{
:cnoreabbrev W! w!
:cnoreabbrev Q! q!
:cnoreabbrev q1 q!
:cnoreabbrev Qall! qall!
:cnoreabbrev Wq wq
:cnoreabbrev Wa wa
:cnoreabbrev wQ wq
:cnoreabbrev WQ wq
:cnoreabbrev W w
:cnoreabbrev Q q
:cnoreabbrev Qall qall
" }}}

" Ultisnips {{{
let g:UltiSnipsExpandTrigger="<Tab>"
let g:UltiSnipsListSnippets="<C-l>"
let g:UltiSnipsEditSplit="vertical"
" }}}

"Avoid annoying higlithing
let g:dracula_italic = 0
colorscheme dracula
