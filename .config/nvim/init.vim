set nocompatible

"---------- General ----------"
let mapleader=" "

set tabstop=2
set softtabstop=2
set expandtab
set shiftwidth=2

set foldmethod=expr
set foldexpr=nvim_treesitter#foldexpr()
set nofoldenable
set spelllang=en_us,es
set number
set relativenumber
set wildmode=longest,list
set clipboard=unnamedplus
set cursorline
set ttyfast
set mouse =

set background=dark
hi MatchParen cterm=bold ctermfg=white ctermbg=blue

filetype plugin on

if has('filetype')
  filetype indent plugin on
endif

if has('syntax')
  syntax on
endif

"---------- Mappings ----------"
" Movement
noremap <silent>gl $
noremap <silent>gh 0
noremap <silent><S-h> b
noremap <silent><S-l> w
noremap <silent><S-j> }
noremap <silent><S-k> {

" Move block
inoremap <silent><A-j> <Esc>:m .+1<CR>==gi
inoremap <silent><A-k> <Esc>:m .-2<CR>==gi
vnoremap <silent><A-j> :m '>+1<CR>gv=gv
vnoremap <silent><A-k> :m '<-2<CR>gv=gv

" Quick save and exit
nnoremap <C-q> :q<CR>
nnoremap <C-s> :w<CR>

" Remove highlight
nnoremap <silent><leader><BS> :noh<CR>

" Spell
nnoremap <leader>S :set nospell<CR>
nnoremap <leader>s :set spell<CR>
noremap ss z=
noremap sn ]sz=
noremap sp [sz=

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
" Return cursor to previous location
autocmd BufReadPost * if line("'\"") > 0 && line("'\"") <= line("$") | exe "normal! g`\"" | endif

" Remove trailing white spaces
autocmd BufWritePre * %s/\s\+$//e

"---------- Vim-plug ----------"
call plug#begin("$HOME/.config/nvim/plugged")
  Plug 'sbdchd/neoformat'
  Plug 'scrooloose/nerdtree'
  Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
  Plug 'ryanoasis/vim-devicons'
  Plug 'preservim/nerdcommenter'
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'nvim-tree/nvim-web-devicons'
  Plug 'mhinz/vim-signify'
  Plug 'elkowar/yuck.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.5' }
  Plug 'vimwiki/vimwiki'
  Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && npx --yes yarn install' }
call plug#end()

" Neoformat
" Format on exit
" augroup fmt
"   autocmd!
"   autocmd BufWritePre * undojoin | Neoformat
" augroup END

let g:neoformat_basic_format_align = 1 " Align
let g:neoformat_basic_format_retab = 1 " Convert tab to spaces
let g:neoformat_basic_format_trim = 1  " Enable trimmming of trailing whitespace

" NERDTree
let g:NERDTreeFileLines = 1
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * NERDTree | wincmd p
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif

" NERDCommenter
let g:NERDCreateDefaultMappings = 1
let g:NERDSpaceDelims = 1
let g:NERDCompactSexyComs = 1
let g:NERDDefaultAlign = 'left'
let g:NERDCommentEmptyLines = 0
let g:NERDTrimTrailingWhitespace = 1
let g:NERDToggleCheckAllLines = 1     " Enable NERDCommenterToggle to check all selected lines is commented or not

" Coc
inoremap <expr> <Tab> coc#pum#visible() ? coc#pum#next(1) : "\<Tab>"
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<C-g>u\<CR>\<C-r>=coc#on_enter()\<CR>"
inoremap <silent><expr> <C-r> coc#pum#visible() ? coc#pum#next(1) : CheckBackspace() ? "\<Tab>" : coc#refresh()

let g:coc_global_extensions = ['coc-marketplace', 'coc-json', 'coc-css', 'coc-yaml', 'coc-texlab', 'coc-clangd', 'coc-html', 'coc-html-css-support', 'coc-jedi', 'coc-lua', 'coc-sh']

function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>

let g:vimwiki_list = [{'path': '$HOME/Documents/Notes/', 'syntax': 'markdown', 'ext': 'md'}]
let g:vimwiki_global_ext = 0

" Markdown preview
let g:mkdp_auto_start = 1
let g:mkdp_auto_close = 0
let g:mkdp_browser = '/usr/bin/firefox'
let g:mkdp_preview_options = {
      \ 'mkit': {},
      \ 'katex': {},
      \ 'uml': {},
      \ 'maid': {},
      \ 'disable_sync_scroll': 0,
      \ 'sync_scroll_type': 'relative',
      \ 'hide_yaml_meta': 1,
      \ 'sequence_diagrams': {},
      \ 'flowchart_diagrams': {},
      \ 'content_editable': v:false,
      \ 'disable_filename': 0,
      \ 'toc': {}
      \ }
let g:mkdp_markdown_css = ''
let g:mkdp_port = '9000'
let g:mkdp_page_title = '${name}'
let g:mkdp_images_path = '$HOME/Documents/Notes/.images'
let g:mkdp_filetypes = ['markdown']
let g:mkdp_combine_preview = 1
let g:mkdp_combine_preview_auto_refresh = 1

lua require("init")
