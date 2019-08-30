se nocp "nocompatible

colorscheme Tomorrow-Night
"se viminfo=:1000,@1000
"se go=

"se guifont=DejaVu\ Sans\ Mono\ for\ Powerline:h12
se guifont=DejaVu\ Sans\ Mono\ Book\ 13
se fileencodings=utf-8,ucs-bom,gbk,gb2312
se encoding=utf-8
se laststatus=2
se autochdir "chdir when edit file
se dir=~/.vim/swp//,./ ",/tmp//
se undofile
se undodir=~/.vim/undo//./ ",/tmp//
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
"nnoremap : q:i
nmap <leader><leader> :
nmap <leader> :
nmap <leader>; :
nmap <leader>. :<up><cr>
nmap <leader>p :w !python<cr>
nmap <leader>l :w !lua<cr>
nmap <leader>w :w<cr>
nmap <leader>wq :wq
nmap <leader>q :q!
"nmap <leader>s :so $MYVIMRC<cr>
"nmap <leader>s :w !sh<cr>
nmap <leader>[ :%s/.*\[[^]]\+\].*\n//g

"use gQ to exmode
nnoremap Q q
nnoremap q <esc>
nmap ZQ <esc>
nmap ZZ <esc>
"nmap g: :<c-f> "to q: mode
"nmap :: :<c-f>

nmap <a-w> <c-w>

" ctrl+c ctrl+v !
nnoremap <c-c> <esc>
"nmap <c-c> :%y+<cr>
imap <c-c> <esc>:%y+<cr>
nnoremap <c-v> o<esc>"+p
vmap <c-c> "+y
"inoremap <c-v> <esc>"+pgi
inoremap <c-v> <c-o>:set paste<cr><c-r>+<c-o>:set nopaste<cr>


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

nnoremap <esc><esc> :nohl<cr>
nmap <f5> :nohl<cr>
cmap <c-a> <c-b>

imap <a-u> <esc>gUawgi
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
        se guioptions-=T
        let psc_style='cool'
        se guioptions-=m
        se guioptions+=r
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
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'majutsushi/tagbar'
Plug 'artnez/vim-wipeout'

"if has('nvim')
"  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
"else
"  Plug 'Shougo/deoplete.nvim'
"  Plug 'roxma/nvim-yarp'
"  Plug 'roxma/vim-hug-neovim-rpc'
"endif
"let g:deoplete#enable_at_startup = 1
"Plug 'zchee/deoplete-jedi'
"Plug 'tenfyzhong/CompleteParameter.vim'

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

