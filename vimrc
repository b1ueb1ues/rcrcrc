se nocp "nocompatible
colorscheme Tomorrow-Night
"se viminfo=:1000,@1000
"se go=
"se guifont=Monospace\ 12
se guifont=DejaVu\ Sans\ Mono\ for\ Powerline\ 13
se fileencodings=utf-8,ucs-bom,gbk,gb2312
se laststatus=2
"autocmd bufwritepost .vimrc source $MYVIMRC
nmap <leader>s :so $MYVIMRC<return>


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
"}}}

"keymap {{{
vmap <c-c> "+y
nmap <c-v> <esc>"+<s-p>
imap <c-v> <esc>"+<s-p>
nmap k gk
nmap j gj
nmap <space> :
imap kj <ESC>

nmap <c-j> <c-w>j
nmap <c-k> <c-w>k
nmap <c-h> <c-w>h
nmap <c-l> <c-w>l
nmap <a-k> <c-w>j
nmap <a-i> <c-w>k
nmap <a-j> <c-w>h
nmap <a-l> <c-w>l
imap <a-u> <esc>gUaw


nmap <f5> :nohl<return>
nmap <leader>p :w !python<return>

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
"indent
	se si "smartindent
	se ai "autoindent
	"se cin "cindent
	"se sw=4 "shiftwidth
"scrolloff
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
Plugin 'bling/vim-airline'
"Plugin 'Shougo/neocomplete.vim'
"Plugin 'klen/python-mode'
"Plugin 'scrooloose/syntastic'
"Plugin 'Valloric/YouCompleteMe'
Plugin 'sjl/gundo.vim'
" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
"Plugin 'tpope/vim-fugitive'

" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
Plugin 'Tagbar'

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
let g:airline#extensions#whitespace#trailing_format = 'w_t[%s]'
let g:airline#extensions#tagbar#enabled = 1

let g:airline#extensions#tabline#enabled = 1
"let g:airline#extensions#tabline#tab_nr_type = 2
"let g:airline#extensions#tabline#show_tab_nr = 1
let g:airline#extensions#tabline#show_tabs = 1
let g:airline#extensions#tabline#buffer_idx_mode = 1

let g:airline_section_c=''
let g:airline#extensions#tagbar#flags = 's'
"let g:airline_left_sep=' '
"let g:airline_left_alt_sep='|'
"let g:airline_right_sep=' '
"let g:airline_right_alt_sep='|'
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
"
"{{{ YCM
let g:ycm_global_ycm_extra_conf = '~/.vim/.ycm_extra_conf.py'

"}}}
