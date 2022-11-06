:autocmd BufNewFile *.c 0r ~/.config/nvim/templates/template.c
autocmd FileType c,cpp setlocal equalprg=clang-format "autoformat with clang using G=gg keyboard shortcut
set nocompatible
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

:abbr #b /************************************************
:abbr #e ************************************************/

"colorscheme embark
colorscheme onedark
"colorscheme gruvbox
hi Normal guibg=NONE ctermbg=NONE

:hi CursorLine   cterm=underline ctermbg=darkred
:set cursorline

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

"Open NERDTree with F6"
nmap <F6> :NERDTreeToggle<CR>
