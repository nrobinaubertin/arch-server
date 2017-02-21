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

"" Tabs commands
noremap <C-k> :tabnext<CR>
nnoremap <C-k> :tabnext<CR>
inoremap <C-k> <Esc>:tabnext<CR>i

noremap <C-j> :tabprevious<CR>
nnoremap <C-j> :tabprevious<CR>
inoremap <C-j> <Esc>:tabprevious<CR>i

" force writing with sudo
cmap w!! %!sudo tee >/dev/null %

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" vim-plug
call plug#begin('~/.config/nvim/plugged')

" essentials

Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin'

" visuals

Plug 'vim-airline/vim-airline'

" syntax highlighting

Plug 'leafgarland/typescript-vim'
Plug 'lumiliet/vim-twig'
Plug 'cakebaker/scss-syntax.vim'

" testing

Plug 'easymotion/vim-easymotion'
Plug 'https://github.com/ctrlpvim/ctrlp.vim'

" disabled

"Plug 'vim-airline/vim-airline-themes'
"Plug 'Valloric/YouCompleteMe'
"Plug 'vitalk/vim-simple-todo'

call plug#end()

"Remap leader Key
let mapleader=","

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
let g:ctrlp_cmd = 'CtrlPMixed' "'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"easymotion options
map <Leader> <Plug>(easymotion-prefix)

" no separation for airline (visually acceptable even without airline font)
let g:airline_left_sep = ''
let g:airline_right_sep = ''
