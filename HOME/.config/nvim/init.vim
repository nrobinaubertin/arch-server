" some common stuff (nvim version)
set nu
set showcmd
set magic
set ruler
" show matching brackets
set showmatch
set mat=2
" NO FUCKING BELLS PLEASE
set novisualbell
set noerrorbells
"" encoding and colorscheme
set background=dark
" do spaces instead of tabs
" number of spaces for a tab
set shiftwidth=4
set tabstop=4

"" switch to previous used tab (not the same as :tabp)
let g:lasttab = 1
nmap gb :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

map <C-S-Tab> :tabprevious<CR>
nmap <C-S-Tab> :tabprevious<CR>
imap <C-S-Tab> <Esc>:tabprevious<CR>i

"" Tabs commands
map <C-k> :tabnext<CR>
nmap <C-k> :tabnext<CR>
imap <C-k> <Esc>:tabnext<CR>i

map <C-j> :tabprevious<CR>
nmap <C-j> :tabprevious<CR>
imap <C-j> <Esc>:tabprevious<CR>i

" force writing with sudo
cmap w!! %!sudo tee >/dev/null %

" keep cursor centered
:nnoremap j jzz
:nnoremap k kzz

" space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" vim-plug
call plug#begin('~/.config/nvim/plugged')
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'https://github.com/ctrlpvim/ctrlp.vim'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'easymotion/vim-easymotion'
Plug 'vim-airline/vim-airline'
"Plug 'Valloric/YouCompleteMe'
call plug#end()


"NERDTree options
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"ctrlp options
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPMixed' "'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

"easymotion options
map <Leader> <Plug>(easymotion-prefix)
