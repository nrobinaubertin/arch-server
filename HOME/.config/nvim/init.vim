" some common stuff (nvim version)
set nu
set showcmd
set ruler
" do we still need to remove mouse support when using tmux ?
"set mouse=
set showmatch
set mat=2
set novisualbell
set noerrorbells
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab

" temporary fix for neovim 0.2
" https://github.com/neovim/neovim/issues/6166
set notimeout

" ignore some files
set wildignore+=*/.git/*,*/tmp/*,*.swp,*.orig

"Remap leader Key
let mapleader=","

" I need the 'Ç' sometimes...
inoremap çç Ç

"" Windows commands
noremap <C-Up> :wincmd k<CR>
inoremap <C-Up> <Esc>:wincmd k<CR>i
tnoremap <C-Up> <C-\><C-n>:wincmd k<CR>i

noremap <C-Down> :wincmd j<CR>
inoremap <C-Down> <Esc>:wincmd j<CR>i
tnoremap <C-Down> <C-\><C-n>:wincmd j<CR>i

noremap <C-Left> :wincmd h<CR>
inoremap <C-Left> <Esc>:wincmd h<CR>i
tnoremap <C-Left> <C-\><C-n>:wincmd h<CR>i

noremap <C-Right> :wincmd l<CR>
inoremap <C-Right> <Esc>:wincmd l<CR>i
tnoremap <C-Right> <C-\><C-n>:wincmd l<CR>i

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

" space bar un-highlights search
:noremap <silent> <Space> :silent noh<Bar>echo<CR>

" update plugins
command Update execute "PlugUpgrade | PlugUpdate"

" vim-plug
call plug#begin('~/.config/nvim/plugged')

" essentials
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'airblade/vim-gitgutter'
Plug 'w0rp/ale'
Plug 'itchyny/lightline.vim'
Plug 'morhetz/gruvbox'
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'

" fzf TODO: switch to full blown fzf and enable it conditionally here
" https://github.com/junegunn/fzf
Plug 'junegunn/fzf', { 'on': 'FZF', 'dir': '~/.config/fzf', 'do': './install --all' }

" testing
Plug 'junegunn/gv.vim'
Plug 'kepbod/quick-scope'

call plug#end()

" quick-scope
let g:qs_highlight_on_keys = ['f', 'F', 't', 'T']

" NERDTree options
map <C-n> :NERDTreeToggle<CR>
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Tabs command for NERDTree
autocmd FileType nerdtree noremap <buffer> <C-k> :tabnext<CR>
autocmd FileType nerdtree noremap <buffer> <C-j> :tabprevious<CR>

" fzf
let $FZF_DEFAULT_COMMAND = 'find . 2>/dev/null'
map <C-p> :FZF<CR>

" if ripgrep is present
if executable('rg')
    set grepprg=rg\ --vimgrep
    let $FZF_DEFAULT_COMMAND = 'rg . --files --color=never --hidden --glob "!.git/*" 2>/dev/null'
endif

" lightline
let g:lightline = {'colorscheme': 'gruvbox'}

" some styling
set background=dark
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2
set noshowmode
colors gruvbox
set termguicolors
