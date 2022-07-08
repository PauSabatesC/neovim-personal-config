set title  " Muestra el nombre del archivo en la ventana de la terminal
set number  " Muestra los números de las líneas
set mouse=a  " Permite la integración del mouse (seleccionar texto, mover el cursor)

set nowrap  " No dividir la línea si es muy larga

" set cursorline  " Resalta la línea actual
"set colorcolumn=120  " Muestra la columna límite a 120 caracteres

" Indentación a 2 espacios
set tabstop=2
set shiftwidth=2
set softtabstop=2
" set mouse=
set mouse=a
set shiftround
set expandtab  " Insertar espacios en lugar de <Tab>s

set hidden  " Permitir cambiar de buffers sin tener que guardarlos

set ignorecase  " Ignorar mayúsculas al hacer una búsqueda
set smartcase  " No ignorar mayúsculas si la palabra a buscar contiene mayúsculas

"set spelllang=en,es  " Corregir palabras usando diccionarios en inglés y español

set notermguicolors  " Activa true colors en la terminal

set encoding=utf-8
set t_Co=256
set nocompatible

set clipboard+=unnamedplus "makes the yanked lines be in the clipboard too. so 'y' is yanked and copied.



"Hightlith disable when going insert mode.
nnoremap i :noh<cr>i
"<leader-p> to search and open a file
nnoremap <silent> <c-p> :Files<CR>
"<leader-f> to search words in all files
nnoremap <silent> <c-f> :Rg<CR>



call plug#begin('~/.config/nvim')  
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  let g:coc_global_extensions = ['coc-json', 'coc-tsserver', 'coc-jedi', 'coc-tslint', 'coc-prettier', 'coc-emmet', 'coc-yaml', 'coc-docker']
  
  Plug 'hashivim/vim-terraform'
  let g:terraform_fmt_on_save=1
  let g:terraform_align=1

  Plug 'junegunn/fzf.vim'
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  
  Plug 'itchyny/lightline.vim'
  Plug 'mhinz/vim-signify'
  Plug 'sheerun/vim-polyglot'

  Plug 'preservim/nerdtree'  "file explorer side tab, <C-n>
  let g:NERDTreeHijackNetrw=0  "no open when nvim starts
  " Exit Vim if NERDTree is the only window left.
  autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif
  map <C-n> :NERDTreeToggle<CR>
  let NERDTreeShowHidden=1
  
  "Plug 'ryanoasis/vim-devicons' "icons in files

  Plug 'junegunn/goyo.vim' "distraction free, run :Goyo
  
  Plug 'chaoren/vim-wordmotion'
  
  Plug 'fatih/vim-go'
  let g:go_def_mapping_enabled = 0

call plug#end()

colorscheme tokyonight
