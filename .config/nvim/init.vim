set nocompatible

"---------- General ----------"
let mapleader=" "

set tabstop=4
set softtabstop=4
set expandtab
set shiftwidth=4

set foldmethod=indent
set nofoldenable
set spelllang=en_us,es
set number
set relativenumber
set wildmode=longest,list
set clipboard=unnamedplus
set cursorline
set ttyfast
set mouse =

filetype plugin on

if has('filetype')
    filetype indent plugin on
endif

if has('syntax')
    syntax on
endif

"---------- Mappings ----------"
" Movement
noremap gl $
noremap gh 0
noremap <S-h> b
noremap <S-l> w
noremap <S-k> {
noremap <S-j> }

" Tab managment
" noremap <silent><S-t> :tabnew<CR>
" noremap <silent><S-n> :tabnext<CR>
" noremap <silent><S-w> :tabclose<CR>

" Move block
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Quick save and exit
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>a :qa<CR>

" Remove highlight
nnoremap <silent><leader><BS> :noh<CR>

" Spell
nnoremap <leader>S :set nospell<CR>
nnoremap <leader>s :set spell<CR>
noremap ss z=
noremap sn ]s
noremap sp [s

" Splits
nnoremap <leader>h :split<Space>
nnoremap <leader>v :vsplit<Space>
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-A-h> <C-w><S-h>
noremap <C-A-j> <C-w><S-j>
noremap <C-A-k> <C-w><S-k>
noremap <C-A-l> <C-w><S-l>

" Quick replace
nnoremap S :%s///g<left><left><left>

"---------- AutoCMD's ----------"
" Autobrackets
"autocmd Filetype c,cpp,arduino,css call Cpp_options()
"function Cpp_options()
inoremap { {<CR>}<Esc>ko
inoremap ( ()<Esc>i
inoremap " ""<Esc>i
inoremap [ []<Esc>i
"endfunction

" autocmd Filetype dtml call html_completion()
" function html_completion()
    " inoremap < <></><Esc>hhhi
" endfunction

" Return cursor to previous location
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

" "---------- Vim-plug ----------"
call plug#begin("$HOME/.config/nvim/plugged")
    Plug 'sbdchd/neoformat'
    Plug 'scrooloose/nerdtree'
    Plug 'preservim/nerdcommenter'
    Plug 'neoclide/coc.nvim', {'branch': 'release'}
    Plug 'lukas-reineke/indent-blankline.nvim'
    Plug 'nvim-lualine/lualine.nvim'
    Plug 'mhinz/vim-signify'
    Plug 'elkowar/yuck.vim'
    " Plug 'Mofiqul/dracula.nvim'
"     Plug 'ryanoasis/vim-devicons'
"     Plug 'normen/vim-pio'
"     Plug 'kyazdani42/nvim-web-devicons'
    Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
"     Plug 'nvim-lua/plenary.nvim'
    Plug 'luckasRanarison/tree-sitter-hyprlang'
call plug#end()

lua require("init")

" NERDTree
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() > 0 || exists('s:std_in') | NERDTree | wincmd p | endif
autocmd BufEnter * if winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 1
let g:NERDTrimTrailingWhitespace = 0
let g:NERDToggleCheckAllLines = 1
let g:NERDCompactSexyComs = 1

" Coc
inoremap <silent><expr> <TAB>
            \ coc#pum#visible() ? coc#pum#next(1) :
            \ CheckBackspace() ? "\<Tab>" :
            \ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"

inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm()
            \: "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"

function! CheckBackspace() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" " Platformio
" noremap <leader>mm :w<CR>:make<CR>
" noremap <leader>pu :w<CR>:tabnew<CR>:make upload<CR>:tabclose<CR>
" noremap <leader>pm :tabnew<CR>:PIOMonitor -b 115200<CR>G

" "---------- Theme ----------"
set background=dark
" colorscheme dracula
