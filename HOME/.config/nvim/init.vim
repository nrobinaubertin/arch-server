" some common stuff (nvim version)
set nu
set showcmd
set ruler
set mouse=
set background=dark
" show matching brackets
set showmatch
set mat=2
" NO FUCKING BELLS PLEASE
set novisualbell
set noerrorbells
" do spaces instead of tabs
" number of spaces for a tab
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

"Remap leader Key
let mapleader=","

" Escape terminal mode
tnoremap <Leader><Esc> <C-\><C-n>

"" Tabs commands
noremap <C-k> :tabnext<CR>
nnoremap <C-k> :tabnext<CR>
inoremap <C-k> <Esc>:tabnext<CR>i
tnoremap <C-k> <C-\><C-n>:tabnext<CR>i

noremap <C-j> :tabprevious<CR>
nnoremap <C-j> :tabprevious<CR>
inoremap <C-j> <Esc>:tabprevious<CR>i
tnoremap <C-j> <C-\><C-n>:tabprevious<CR>i

" force writing with sudo
cnoremap w!! %!sudo tee >/dev/null %

" open terminal in a new tab
command TabTer execute "tabnew | terminal"
map <Leader>t :TabTer<CR>

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" update plugins
command Update execute "PlugUpgrade | PlugUpdate"

" vim-plug
call plug#begin('~/.config/nvim/plugged')

" essentials

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

" visuals

Plug 'vim-airline/vim-airline'

" syntax highlighting

Plug 'leafgarland/typescript-vim'
Plug 'lumiliet/vim-twig'
Plug 'cakebaker/scss-syntax.vim'

" testing

Plug 'https://github.com/ctrlpvim/ctrlp.vim'

Plug 'francoiscabrol/ranger.vim'
Plug 'rbgrouleff/bclose.vim'

"Plug 'vim-scripts/SearchComplete'
Plug 'tpope/vim-fugitive'
"Plug 'tpope/vim-abolish'

" disabled

"Plug 'vim-airline/vim-airline-themes'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vitalk/vim-simple-todo'
"Plug 'easymotion/vim-easymotion'

call plug#end()

"NERDTree options
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Tabs command for NERDTree
autocmd FileType nerdtree noremap <buffer> <C-k> :tabnext<CR>
autocmd FileType nerdtree noremap <buffer> <C-j> :tabprevious<CR>

"ctrlp options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_user_command = ['.git', 'cd %s && git ls-files -co --exclude-standard']

"easymotion options
"map <Leader> <Plug>(easymotion-prefix)

" no separation for airline (visually acceptable even without airline font)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_symbols_ascii = 1

" Ranger
let g:ranger_map_keys = 0
map <Leader>r :RangerNewTab<CR>
