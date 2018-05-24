se nocp "nocompatible

colorscheme Tomorrow-Night
"se viminfo=:1000,@1000
"se go=
"se guifont=Monospace\ 13
"se guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
se guifont=DejaVu\ Sans\ Mono\ Book\ 13
se fileencodings=utf-8,ucs-bom,gbk,gb2312
se encoding=utf-8
se laststatus=2
se autochdir "chdir when edit file
se dir=~/.vim/swp,~/tmp
autocmd BufEnter * setlocal fo-=o

" ./ tells Vim to use the directory of the current file rather than Vim's working directory. 
" The last semicolon indicate find tags in parents dir
se tags=./tags;,./TAGS;


"source $VIMRUNTIME/vimrc_example.vim
"se paste "paste with no indent
se foldmethod=marker

"basic{{{
syntax on
se nu "number
se cul "cursor line
hi cursorline cterm=NONE ctermbg=black ctermfg=white
se ru "ruler
se sc "showcmd
se ar "autoread
se history=1000
se nobackup
se showmatch
se mouse=a
se backspace=eol,start,indent
se magic

"nobell
        se noerrorbells
        se novisualbell
        se belloff=all
"}}}
"keymap {{{

let mapleader=" " 
nmap <leader><leader> :
nmap <leader>p :w !python<cr>
nmap <leader>l :w !lua<cr>
nmap <leader>w :w<cr>
nmap <leader>wq :wq
nmap <leader>q :q
nmap <leader>. :<up><cr>
nmap <leader>s :so $MYVIMRC<return>
nmap <leader>; :
"nmap <leader>q :wq<cr>

nmap <a-w> <c-w>

vmap <c-c> "+y
nmap <c-c> :%y+<cr>

inoremap <c-z> <c-v>
inoremap <c-v> <esc>"+p
nnoremap <c-v> o<esc>"+p

nnoremap vv <c-v>
vnoremap vv <c-v>

nmap k gk
nmap j gj
nmap U gUaw
nmap qq <esc>
nmap q: <esc>:
nmap q/ <esc>/
nmap Q <esc>
nmap ZQ <esc>
nmap ZZ <esc>
"nmap g: :<c-f>
"nmap :: :<c-f>
"nnoremap <space><cr> :<up><cr>

nmap <a-j> 3j
nmap <a-k> 3k
vmap <a-j> 3j
vmap <a-k> 3k

nmap <a-d> <c-d>
nmap <a-u> <c-u>



nmap <f5> :nohl<return>

imap <a-u> <esc>gUawea
imap <a-j> <esc>j
imap <a-k> <esc>k

imap <a-i> ()<esc>
imap <a-9> (
imap <a-0> )
imap <a-[> {
imap <a-]> }
imap <a-o> <esc>o

imap <a-c> <esc>
imap <a-f> <esc>
imap <a-v> <esc>
"}}}


"hl tab i so wild{{{
"hl
        se hls "highlight search
        se is "incsearch
        se ic "ignorecase
        se scs "smartcase
"tab
        se sta "smarttab
        "se ts=4 "tabstop
        se et "expandtab with space
"indent
        se si "smartindent
        se ai "autoindent
        "se cin "cindent
        "se sw=4 "shiftwidth
"scrollofft
        se so=3
"complete
        se wildmenu
        se completeopt=longest,menu
"}}}

"misc {{{
autocmd BufReadPost *
\ if line("'\"") > 1 && line("'\"") <= line("$") |
\   exe "normal! g`\"" |
\ endif
"}}}

"windows {{{
"source $VIMRUNTIME/mswin.vim
"behave mswin
if has("gui_running")
        set guioptions-=T
        let psc_style='cool'
        se guioptions-=m
endif
"}}}


"{{{  vundle
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'
"Plugin 'justinmk/vim-dirvish'


Plugin 'suan/vim-instant-markdown'
Plugin 'rhysd/nyaovim-markdown-preview'
"Plugin 'godlygeek/tabular'
"Plugin 'plasticboy/vim-markdown'

Plugin 'bling/vim-airline'
Plugin 'fidian/hexmode'
Plugin 'vim-airline/vim-airline-themes'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'klen/python-mode'
"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'
Plugin 'lilydjwg/fcitx.vim'
Plugin 'will133/vim-dirdiff'
Plugin 'scrooloose/nerdtree'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'Tagbar'
Plugin 'wipeout'
"Asheq/close-buffers.vim

" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}

" Avoid a name conflict with L9
"Plugin 'user/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

"}}}

"{{{ airline
let g:airline_powerline_fonts = 1
let g:airline#extensions#whitespace#enabled = 0
"let g:airline#extensions#whitespace#trailing_format = 'w_t[%s]'
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#enabled = 0
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tabs = 0
let g:airline#extensions#tabline#buffer_idx_mode = 0

let g:airline_section_c=''
let g:airline#extensions#tagbar#flags = 's'
let g:airline_left_sep=' '
let g:airline_left_alt_sep='|'
let g:airline_right_sep=' '
let g:airline_right_alt_sep='|'
"}}}
"{{{neocomplete
"let g:neocomplete#enable_at_startup = 1
"inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
"}}}
"{{{tagbar
"let g:tagbar_autoclose=1
let g:tagbar_left=1
let g:tagbar_width=20
"}}}
"{{{ YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'
let g:ycm_disable_for_files_larger_than_kb = 1000
"}}}

"{{{
let g:instant_markdown_autostart = 0
"}}}
