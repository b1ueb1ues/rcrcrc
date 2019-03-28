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
se dir=~/.vim/swp// ",/tmp//
se undofile
se undodir=~/.vim/undo// ",/tmp//
se nobackup
"se backupdir=~/.vim/bak//,/tmp//

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
set colorcolumn=80 " wrap80
hi cursorline cterm=NONE ctermbg=black ctermfg=white
se ru "ruler
se sc "showcmd
se ar "autoread
se history=1000
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
nmap <leader> :
nmap <leader>; :
nmap <leader>. :<up><cr>
nmap <leader>p :w !python<cr>
nmap <leader>l :w !lua<cr>
nmap <leader>w :w<cr>
nmap <leader>wq :wq
nmap <leader>q :q!
"nmap <leader>s :so $MYVIMRC<return>

nnoremap Q q  "use gQ to exmode
nnoremap q <esc>
nmap ZQ <esc>
nmap ZZ <esc>
"nmap g: :<c-f> "to q: mode
"nmap :: :<c-f>

nmap <a-w> <c-w>

nmap <c-c> :%y+<cr>
nnoremap <c-v> o<esc>"+p
vmap <c-c> "+y
inoremap <c-v> <c-r>+
inoremap <c-z> <c-v>

nnoremap vv <c-v>
vnoremap vv <c-v>

nmap k gk
nmap j gj
nmap U gUaw

nmap <a-j> 3j
nmap <a-k> 3k
vmap <a-j> 3j
vmap <a-k> 3k

nmap <a-d> <c-d>
nmap <a-u> <c-u>

nmap <esc> :nohl<cr>
nmap <f5> :nohl<cr>

imap <a-u> <esc>gUawea
imap <a-j> <esc>j
imap <a-k> <esc>k
imap <a-i> ()<esc>
imap <a-9> (
imap <a-0> )
imap <a-[> {<cr>}<esc>O
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
        se sw=4 "shiftwidth
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

"{{{ vim-plug
call plug#begin('~/.vim/plugged')

Plug 'suan/vim-instant-markdown'
Plug 'rhysd/nyaovim-markdown-preview'
Plug 'godlygeek/tabular'

"Plug 'bling/vim-airline'
"Plug 'vim-airline/vim-airline-themes'
Plug 'sjl/gundo.vim'
Plug 'mbbill/undotree'
Plug 'lilydjwg/fcitx.vim'
Plug 'will133/vim-dirdiff'
Plug 'scrooloose/nerdtree'
Plug 'majutsushi/tagbar'
Plug 'artnez/vim-wipeout'

"Plug 'roxma/nvim-yarp'
"Plug 'roxma/vim-hug-neovim-rpc'
"Plug 'Shougo/deoplete.nvim'
"Plug 'zchee/deoplete-jedi'
"Plug 'tenfyzhong/CompleteParameter.vim'
"" Make sure you use single quotes
"
"" Shorthand notation; fetches https://github.com/junegunn/vim-easy-align
"Plug 'junegunn/vim-easy-align'
"
"" Any valid git URL is allowed
"Plug 'https://github.com/junegunn/vim-github-dashboard.git'
"
"" Multiple Plug commands can be written in a single line using | separators
"Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
"
"" On-demand loading
"Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
"Plug 'tpope/vim-fireplace', { 'for': 'clojure' }
"
"" Using a non-master branch
"Plug 'rdnetto/YCM-Generator', { 'branch': 'stable' }
"
"" Using a tagged release; wildcard allowed (requires git 1.9.2 or above)
"Plug 'fatih/vim-go', { 'tag': '*' }
"
"" Plugin options
"Plug 'nsf/gocode', { 'tag': 'v.20150303', 'rtp': 'vim' }
"
"" Plugin outside ~/.vim/plugged with post-update hook
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"
"" Unmanaged plugin (manually installed and updated)
"Plug '~/my-prototype-plugin'

" Initialize plugin system
call plug#end()
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
"{{{ deoplete
inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"
let g:deoplete#enable_at_startup = 1
"}}}
"{{{ compelteparameter
let g:racer_experimental_completer = 1
let g:deoplete#sources#jedi#python_path = '/usr/bin/python3'
"}}}
"{{{ jedi
"inoremap <silent><expr> (( complete_parameter#pre_complete("()")
"smap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"imap <c-j> <Plug>(complete_parameter#goto_next_parameter)
"smap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"imap <c-k> <Plug>(complete_parameter#goto_previous_parameter)
"}}}
"{{{ instant_markdown
let g:instant_markdown_autostart = 0
"}}}

""{{{  vundle
"filetype off                  " required
"
"" set the runtime path to include Vundle and initialize
"set rtp+=~/.vim/bundle/Vundle.vim
"call vundle#begin()
"" alternatively, pass a path where Vundle should install plugins
""call vundle#begin('~/some/path/here')
"
"" let Vundle manage Vundle, required
"Plugin 'VundleVim/Vundle.vim'
""Plugin 'justinmk/vim-dirvish'
"
"
"Plugin 'suan/vim-instant-markdown'
"Plugin 'rhysd/nyaovim-markdown-preview'
"Plugin 'godlygeek/tabular'
""Plugin 'plasticboy/vim-markdown'
"
"Plugin 'bling/vim-airline'
"Plugin 'fidian/hexmode'
"Plugin 'vim-airline/vim-airline-themes'
""Plugin 'Shougo/neocomplete.vim'
""Plugin 'klen/python-mode'
""Plugin 'scrooloose/syntastic'
""Plugin 'Valloric/YouCompleteMe'
"Plugin 'sjl/gundo.vim'
"Plugin 'lilydjwg/fcitx.vim'
"Plugin 'will133/vim-dirdiff'
"Plugin 'scrooloose/nerdtree'
"" The following are examples of different formats supported.
"" Keep Plugin commands between vundle#begin/end.
"" plugin on GitHub repo
""Plugin 'tpope/vim-fugitive'
"
"" plugin from http://vim-scripts.org/vim/scripts.html
""Plugin 'L9'
"Plugin 'Tagbar'
"Plugin 'wipeout'
""Asheq/close-buffers.vim
"
"" Git plugin not hosted on GitHub
""Plugin 'git://git.wincent.com/command-t.git'
"
"" git repos on your local machine (i.e. when working on your own plugin)
""Plugin 'file:///home/gmarik/path/to/plugin'
"
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
""Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"
"" Avoid a name conflict with L9
""Plugin 'user/L9', {'name': 'newL9'}
"
"" All of your Plugins must be added before the following line
"call vundle#end()            " required
"filetype plugin indent on    " required
"" To ignore plugin indent changes, instead use:
""filetype plugin on
""
"" Brief help
"" :PluginList       - lists configured plugins
"" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
"" :PluginSearch foo - searches for foo; append `!` to refresh local cache
"" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
""
"" see :h vundle for more details or wiki for FAQ
"" Put your non-Plugin stuff after this line
"
""}}}
