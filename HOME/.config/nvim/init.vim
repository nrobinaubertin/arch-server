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
set noshowmode

" some styling
set background=dark
set fillchars=vert:\ ,stl:\ ,stlnc:\ 
set laststatus=2

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

Plug 'itchyny/lightline.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --key-bindings --completion --no-update-rc' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/gv.vim'
Plug 'mhinz/vim-signify'
Plug 'morhetz/gruvbox'
Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'sheerun/vim-polyglot'
Plug 'tpope/vim-fugitive'
Plug 'w0rp/ale'
Plug 'xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }

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
map <C-t> :FZF<CR>
" if ripgrep is present
if executable('rg')
    set grepprg=rg\ --vimgrep
    let $FZF_DEFAULT_COMMAND = 'rg . --files --color=never --hidden --glob "!.git/*" 2>/dev/null'
endif

" lightline
let g:lightline = {'colorscheme': 'gruvbox'}

" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_change = '~'
let g:signify_realtime = 1 

" terminal colors; waiting for gruvbox patch to be merged :
" https://github.com/morhetz/gruvbox/pull/93

if has('nvim')
    " dark0 + gray
    let g:terminal_color_0 = "#282828"
    let g:terminal_color_8 = "#928374"

    " neurtral_red + bright_red
    let g:terminal_color_1 = "#cc241d"
    let g:terminal_color_9 = "#fb4934"

    " neutral_green + bright_green
    let g:terminal_color_2 = "#98971a"
    let g:terminal_color_10 = "#b8bb26"

    " neutral_yellow + bright_yellow
    let g:terminal_color_3 = "#d79921"
    let g:terminal_color_11 = "#fabd2f"

    " neutral_blue + bright_blue
    let g:terminal_color_4 = "#458588"
    let g:terminal_color_12 = "#83a598"

    " neutral_purple + bright_purple
    let g:terminal_color_5 = "#b16286"
    let g:terminal_color_13 = "#d3869b"

    " neutral_aqua + faded_aqua
    let g:terminal_color_6 = "#689d6a"
    let g:terminal_color_14 = "#8ec07c"

    " light4 + light1
    let g:terminal_color_7 = "#a89984"
    let g:terminal_color_15 = "#ebdbb2"
endif

"let g:gruvbox_terminal_colors = 1
colors gruvbox
