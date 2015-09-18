" some common stuff
syntax on
"set rnu
set nu
set hlsearch
set showcmd
set magic
set ruler
set ttyfast
set autoindent
filetype on
" show matching brackets
set showmatch
set mat=2
" NO FUCKING BELLS PLEASE
set novisualbell
set noerrorbells
" encoding and colorscheme
set background=dark
colo solarized
set encoding=utf8
" do spaces instead of tabs and do it smartly
" set expandtab
set smarttab
" number of spaces for a tab
set shiftwidth=4
set tabstop=4
set autoread

"" commands for the Tlist plugin
let Tlist_Compact_Format = 1
let Tlist_GainFocus_On_ToggleOpen = 1
let Tlist_Close_On_Select = 1
" C-p is the same as k usually, so no problem overriding this.
nnoremap <C-p> :TlistToggle<CR>

"" switch to previous used tab (not the same as :tabp)
let g:lasttab = 1
nmap gb :exe "tabn ".g:lasttab<CR>
au TabLeave * let g:lasttab = tabpagenr()

"" cursorline
"set cursorline
:hi CursorLine cterm=NONE ctermfg=White

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

