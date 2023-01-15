autocmd BufNewFile *.c 0r ~/.config/nvim/templates/template.c
autocmd FileType c,cpp setlocal equalprg=clang-format "autoformat with clang using G=gg keyboard shortcut
autocmd BufRead,BufNewFile *.c set syntax=c
autocmd BufWritePre *.c %s/\s\+$//e "clear all white space when saved .c file
"auto-format *.c files on save
autocmd BufWritePre *.c :normal gg=G
set nocompatible
filetype plugin on
syntax on
set number
set autoindent
set tabstop=4
set shiftwidth=4
set smarttab
set softtabstop=4
set mouse=a
set expandtab
set ai
set termguicolors
":set textwidth=80
:set ic "ignore case
"set noic "case-sensitive
:set smartcase "smart-case search

if (has("termguicolors"))
  set termguicolors
endif

call plug#begin()

Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'https://github.com/preservim/nerdtree' " NerdTree
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'https://github.com/ryanoasis/vim-devicons' " Developer Icons
Plug 'https://github.com/tc50cal/vim-terminal' " Vim Terminal
Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)
Plug 'https://github.com/neoclide/coc.nvim'  " Auto Completion
Plug 'embark-theme/vim', { 'as': 'embark', 'branch': 'main' }
Plug 'joshdick/onedark.vim'
Plug 'gruvbox-community/gruvbox'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'https://github.com/tpope/vim-fugitive' "GIT support for nvim
Plug 'drewtempelmeyer/palenight.vim'
Plug 'https://github.com/rakr/vim-one'
Plug 'https://github.com/dracula/vim'
Plug 'shaunsingh/nord.nvim'

call plug#end()

:set completeopt-=preview " For No Previews
let g:NERDTreeDirArrowExpandable="+"
let g:NERDTreeDirArrowCollapsible="~"

nnoremap <C-f> :NERDTreeFocus<CR>
nnoremap <C-n> :NERDTree<CR>
nnoremap <C-t> :NERDTreeToggle<CR>
nmap <leader>ac  <Plug>(coc-codeaction)
" use <tab> for trigger completion and navigate to the next complete item
function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :
      \ coc#refresh()

" Use enter for auto-completion
inoremap <silent><expr> <CR> coc#pum#visible() ? coc#pum#confirm() : "\<CR>"

:abbr #b /************************************************
:abbr #e ************************************************/

"Fix theme dracula italic issues
let g:dracula_italic = 0

set background=dark

"Colorschemes
"===================================
"colorscheme embark
"colorscheme onedark
"colorscheme gruvbox
"colorscheme palenight
"colorscheme nord
colorscheme dracula
"===================================

" both guibg= and ctermbg= should be NONE for transparency
"#171421
"#22272e
"#282a36
hi Normal guibg=NONE ctermbg=NONE

"Remove comments to have highlighted cursor
":hi CursorLine   cterm=underline ctermbg=0
:set cursorline
"fix to make the cursor only underline without highlight. Remove to have
"underline and highlight
:hi clear CursorLine
:hi CursorLine gui=underline cterm=underline

"Display trailing white space as symbol
set list
set listchars+=trail:◦

"Remove all trailing whitespace by pressing F5
nnoremap <F5> :let _s=@/<Bar>:%s/\s\+$//e<Bar>:let @/=_s<Bar><CR>

"Highlight trainling white spaces with red color
:highlight ExtraWhitespace ctermbg=red guibg=red
:match ExtraWhitespace /\s\+$/

"Show non-space whitespaces
set list

"Show spaces as .
set lcs+=space:.

"Show file name on top bar
set title

"Vim airline shows current working directory
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#'

"Set ariline to corresponding color theme
let g:airline_theme = "dracula"

"Set g:python3_host_prog
let g:python3_host_prog = "/usr/bin/python3"

"Open NERDTree with F6"
nmap <F6> :NERDTreeToggle<CR>

"Overwrite dracula colorscheme for comments
:hi Comment guifg=#63f05b

" provide hjkl movements in Insert mode and Command-line mode via the <Alt> modifier key
noremap! <A-h> <Left>
noremap! <A-j> <Down>
noremap! <A-k> <Up>
noremap! <A-l> <Right>

"\+qf - auto fix line
"\+ac - bring suggestion option menu
nmap <leader>qf <Plug>(coc-fix-current)
nmap <leader>ac  <Plug>(coc-codeaction)
"trigger auto completion with c + space (must be in insert mode)
inoremap <silent><expr> <c-space> coc#refresh()
