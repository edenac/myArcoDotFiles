"--------------------setting---------------------------------
let g:skip_defaults_vim = 1
:set number
:set relativenumber
:set autoindent
:set tabstop=4
:set shiftwidth=4
:set smarttab
:set softtabstop=4
:set splitbelow
:set splitright
:set showcmd
:set encoding=utf-8
:set fileencoding=utf-8
:set backspace=indent,eol,start
:set smartindent
:set expandtab
:set hidden
:set hlsearch
:set incsearch
:set ignorecase
:set smartcase
:set fileformats=unix,dos,mac
:set wildmenu
:set mousemodel=popup
:set t_Co=256
:set guioptions=egmrti
:set gfn=Monospace\ 10
:set ruler
:set scrolloff=3
:set laststatus=2
:set modeline
:set modelines=10
:set title
:set titleold="Terminal"
:set titlestring=%F
:set statusline=%F%m%r%h%w%=(%{&ff}/%Y)\ (line\ %l\/%L,\ col\ %c)\
:set clipboard=unnamedplus
:set shell=sh
:set mouse=a
:autocmd InsertEnter,InsertLeave * set cul!
set matchpairs+=<:>

"--------------------setting--------------------------------

"------funciones para la inastalacion de plugin-------------

let vimplug_exists=expand('~/.config/nvim/autoload/plug.vim')
if has('win32')&&!has('win64')
  let curl_exists=expand('C:\Windows\Sysnative\curl.exe')
else 
    :let curl_exists=expand('curl')
endif

let g:vim_bootstrap_langs = ""
let g:vim_bootstrap_editor = "neovim"				" nvim or vim
let g:vim_bootstrap_theme = "molokai"
let g:vim_bootstrap_frams = ""
 
if !filereadable(vimplug_exists)
  if !executable(curl_exists)
    echoerr "You have to install curl or first install vim-plug yourself!"
    execute "q!"
  endif
  echo "Installing Vim-Plug..."
  echo ""
  silent exec "!"curl_exists" -fLo " . shellescape(vimplug_exists) . " --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim"
  let g:not_finish_vimplug = "yes"
  autocmd VimEnter * PlugInstall
endif

"------funciones para la inastalacion de plugin-------------

" --------------------PLUGS---------------------------------

" Required:
call plug#begin(expand('~/.config/nvim/plugged'))

" git
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-rhubarb' " required by fugitive to :Gbrowse
Plug 'rbong/vim-flog'
Plug 'airblade/vim-gitgutter'

" themes & look
Plug 'vim-airline/vim-airline-themes'
Plug 'https://github.com/rafi/awesome-vim-colorschemes' " Retro Scheme
Plug 'tomasr/molokai'
Plug 'https://github.com/vim-airline/vim-airline' " Status bar
Plug 'ryanoasis/vim-devicons'
Plug 'xuyuanp/scrollbar.nvim'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'} "hightlighting
Plug 'camspiers/animate.vim'
Plug 'camspiers/lens.vim'
Plug 'antoinemadec/FixCursorHold.nvim'
Plug 'dracula/vim'


" web
Plug 'kyazdani42/nvim-web-devicons'
Plug 'vim-scripts/CSApprox'
Plug 'editor-bootstrap/vim-bootstrap-updater'
Plug 'https://github.com/ap/vim-css-color' " CSS Color Preview
Plug 'leafgarland/typescript-vim'
Plug 'peitalin/vim-jsx-typescript'
Plug 'plasticboy/vim-markdown'
" Plug 'phpactor/phpactor', {'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}

"Vim tools
Plug 'Yggdroot/indentLine'
Plug 'https://github.com/tpope/vim-commentary' " For Commenting gcc & gc
Plug 'https://github.com/terryma/vim-multiple-cursors' " CTRL + N for multiple cursors:
Plug 'wesQ3/vim-windowswap'
Plug 'rcarriga/nvim-notify'
Plug 'Raimondi/delimitMate'
Plug 'michaelb/sniprun', {'do': 'bash install.sh'}
Plug 'dense-analysis/ale' "corrector
Plug 'sharkdp/fd' "command line completion
Plug 'nvim-lua/plenary.nvim' "lua recognize too required
Plug 'folke/trouble.nvim'
Plug 'folke/todo-comments.nvim'


"file-browser/searching's
Plug 'vim-scripts/grep.vim'
Plug 'https://github.com/preservim/tagbar' " Tagbar for code navigation
Plug 'easymotion/vim-easymotion' "easymotion = vim sneak
Plug 'scrooloose/nerdtree'
Plug 'jistr/vim-nerdtree-tabs'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'https://github.com/PhilRunninger/nerdtree-buffer-ops'
Plug 'https://github.com/PhilRunninger/nerdtree-visual-selection'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'nvim-telescope/telescope.nvim'
Plug 'ThePrimeagen/harpoon'
Plug 'mhinz/vim-startify'
Plug 'nvim-telescope/telescope-file-browser.nvim'
Plug 'nvim-telescope/telescope-project.nvim'
Plug 'cljoly/telescope-repo.nvim'
Plug 'windwp/nvim-spectre'

"IDE
Plug 'neoclide/coc.nvim', {'branch': 'release'} "autocompletado de lenguajes de programacion

Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'williamboman/nvim-lsp-installer'
Plug 'hrsh7th/nvim-cmp' 
Plug 'mfussenegger/nvim-jdtls'
Plug 'puremourning/vimspector'
" Plug 'artur-shaik/jc.nvim'



" rest = soapui o postman = para checar el backend de las peticiones sin UI 
" requiere packer.nvim  https://github.com/rest-nvim/rest.nvim lua maybe?

" Plug 'https://github.com/lifepillar/pgsql.vim' " PSQL Pluging needs :SQLSetType pgsql.vim
" Plug 'http://github.com/tpope/vim-surround' " Surrounding ysw)

if isdirectory('/usr/local/opt/fzf')
 Plug '/usr/local/opt/fzf' | Plug 'junegunn/fzf.vim'
else
 Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --bin' }
 Plug 'junegunn/fzf.vim'
endif
let g:make = 'gmake'
if exists('make')
        let g:make = 'make'
endif
Plug 'Shougo/vimproc.vim', {'do': g:make}

" Vim-Session
Plug 'xolox/vim-misc'
Plug 'xolox/vim-session'

" Snippets
"Plug 'SirVer/ultisnips' ver si de alguna manera puede ser compatible con coc
"por lo del tab
Plug 'honza/vim-snippets'
Plug 'Shougo/neocomplete'

" Include user's extra bundle
if filereadable(expand("~/.config/nvim/local_bundles.vim"))
  source ~/.config/nvim/local_bundles.vim
endif

call plug#end()

" Auto Commands py format % inconsistences with scss
augroup auto_commands
    autocmd BufWrite *.py call CocAction('format')
    autocmd FileType scss setlocal iskeyword+=@-@
augroup END


" theme dracula
" if (has("termguicolors"))
"  set termguicolors
" endif
" syntax enable
" colorscheme dracula
" theme dracula


" markdown settings
" Disable math tex conceal feature
let g:tex_conceal = ''
let g:vim_markdown_math = 1
"vimspector
nmap <F1> :CocCommand java.debug.vimspector.start<CR>

" Markdown
let g:vim_markdown_folding_disabled = 1
let g:vim_markdown_frontmatter = 1
let g:vim_markdown_conceal = 0
let g:vim_markdown_fenced_languages = ['tsx=typescriptreact']
" markdown settings

" ----comandos modo escritura inoremaps-------------------
imap <F12> <C-R>=expand('%:p:h')<CR>
imap <c-s> <Esc>:w<CR>a
imap <C-Del> <Esc>:normal lcw<CR>a
imap <m-bs> <C-R>=expand('')<CR> <Esc>:normal ldb<CR>i
imap <c-s-del> <esc> :normal d$<CR>a
imap <m-0> <esc> :normal d0<CR>i
imap <c-d> <esc> :normal dd<CR>i
imap <m-'> <esc> :normal gcc<CR>i
" ----comandos modo escritura inoremaps-------------------
" --------------------PLUGS---------------------------------
"-- startify --
let g:startify_lists = [
    \ { 'type': 'bookmarks', 'header': ['   Bookmarks']      },
    \ { 'type': 'sessions',  'header': ['   Sessions']       },
    \ { 'type': 'files',     'header': ['   MRU']            },
    \ { 'type': 'dir',       'header': ['   MRU '. getcwd()] },
    \ { 'type': 'commands',  'header': ['   Commands']       },
    \ ]

let g:startify_bookmarks = [
    \{ 'a': '~/.config/nvim/init.vim' },
    \{ 's': '~/tujak' },
    \]

   " \{ 'd': '~/aqui' },ir agregando rutas puestas en bookmark
   " \{ 'f': '~/aqui' },ir agregando rutas que vaya poniendo en bookmark
"-- startify --
"-----------------------coc-----------------------------------

" Required:
inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"
" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr><cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"
"esto mismo de arriba hacer con tab checar si no choca con lo que quiero de
"agregar 4 espacios al tab al escribir

" GoTo code navigation.
nmap <silent> cd <Plug>(coc-definition)
nmap <silent> cu <Plug>(coc-implementation)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gr <Plug>(coc-references)
nmap <leader> qf <Plug>(coc-fix-current)
" gf abre el archivo que se esta llamando tomado por vim
" gd go to definition tomado por vim
" gi go to implementation tomado por vim


" Use K to show documentation in preview window.
function! s:show_documentation()
  if CocAction('hasProvider', 'hover')
    call CocActionAsync('doHover')
  else
    call feedkeys('K', 'in')
  endif
endfunction
"refrescar el autocompletado para que aparezcan opciones
noremap <silent><expr> <c-space> coc#refresh()

"-----------------------coc-----------------------------------

"-------shortcuts customized without lider--------------------

"nerdtree
map <F2> :NERDTreeFind<CR>
map <F3> :NERDTreeToggle<CR>

" open explorer, restart neovim 
" poner aqui los atajos que esplico la linea anterior
" resize split,  + = se agranda , - = se achica


"animate
noremap <silent> <right> :call animate#window_delta_width(40)<CR> 
noremap <silent> <left> :call animate#window_delta_width(-40)<CR>
noremap <silent> <up> :call animate#window_delta_height(40)<CR>
noremap <silent> <down> :call animate#window_delta_height(-40)<CR>

"Ventanas nuevas derecha y abajo por defectos debido a los seteos que hice
nmap <c-t> :<C-u>vsplit tabnew<CR>
nmap <c-n> :<C-u>tabnew<CR>

"ir al final de la linea
nmap<silent>¿ :normal $<CR>
nmap <silent>d¿ :normal d$<CR>
nmap <silent>y¿ :normal y$<CR>
"buffers adelante y atras
nnoremap <a-h> :bp<CR>
nnoremap <a-l> :bn<CR> 
" nnoremap <C-Tab> :bn<CR> intentar el c-tab para cambiar por ahi
" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

"-------shortcuts customized without lider--------------------

"------shortcuts customized lider: espacio--------------------

let mapleader=" "
nmap <Leader>f <Plug>(easymotion-sn)
"nmap es que funciona solamente en modo normal
"Atajos personalizados
nmap <Leader>w :w<CR>
nmap <Leader>q :q<CR>
nmap <Leader>a :wq<CR>
nmap <Leader>W :wq!<CR>
nmap <Leader>Q :q!<CR>

"para //guardar como// un archivo una vez crear a la espera de que teclee como
"lo quiero guardar en el modo comando 
"antes de aplicar este comando verificar que estoy parado donde quiero
"guardarlo o definir la ruta desde home si lo tengo a la mano pero con un ,-
"lo tengo o un :pwd en consola 
nmap <Leader>sa :lcd %:p:h<CR>:saveas 

"Ejecutar archivo actual en toggletermina con java con TermExec
nmap <Leader>J :w<CR>:TermExec cmd='clear; javac % ; java %'<CR>
nmap <Leader>j :w<CR>:TermExec cmd='clear; java %'<CR>

" shortcut para abrir terminal limpia con toggleterminal
nmap <Leader>t :TermExec cmd='clear'<CR>


"splits
noremap <Leader>h :<C-u>split<CR>
noremap <Leader>v :<C-u>vsplit<CR>
noremap <Leader>n :<C-u>tabnew<CR>

" Close currently buffer
noremap <leader>c :bd<CR>

"hacer bookmarks en nerdtre
"Hace bookmark de donde esta el cursor
noremap <leader>nb :Bookmark<CR>
"borra un bookmark
" noremap <leader>nob :Bookmark<CR>
"borra todos los bookmarks
" noremap <leader>nab :Bookmark<CR>

"-- startify --
nmap<leader>st :Startify<CR>
nmap<leader>ss :SSave<CR>
nmap<leader>sd :SDelete<CR>
nmap<leader>sl :SLoad<CR>
nmap<leader>sc :SClose<CR>
"-- startify --

"-- spectre --

nnoremap <leader>S <cmd>lua require('spectre').open()<CR>

"search current word

nnoremap <leader>sw <cmd>lua require('spectre').open_visual({select_word=true})<CR>

vnoremap <leader>so <cmd>lua require('spectre').open_visual()<CR>

"  search in current file

nnoremap <leader>sp viw:lua require('spectre').open_file_search()<cr>

" run command :Spectre"})

"-- spectre --

" -- windowswap --
let g:windowswap_map_keys = 0 "prevent default bindings

" nnoremap <silent> <leader>yw :call WindowSwap#MarkWindowSwap()<CR>

" nnoremap <silent> <leader>pw :call WindowSwap#DoWindowSwap()<CR>

nnoremap <silent> <leader>ww :call WindowSwap#EasyWindowSwap()<CR>

" -- windowswap --

" -- sniprun --
nmap <leader>sr <Plug>SnipRun

nmap <leader>sR <Plug>SnipRunOperator

" vmap f <Plug>SnipRun
" -- sniprun --

"------shortcuts customized lider: espacio--------------------

"----------------shortcuts customized.-----------------------

"------------shortcuts customized lider:, --------------------

"Required:
filetype plugin indent on
" Map leader to ,
let mapleader=','
if exists('$SHELL')
   set shell=$SHELL
else
   set shell=/bin/sh
endif

"borrar busqueda para desmarcar la palabra resaltada
noremap <leader><space> :nohlsearch<CR>

"----------------------------------------git ---------------------------
" Git y fugitive

"Git init (necesario instalar el Flog para inresar comandos directos de git
"desde vim) (%:p:h = hace referecia a la carpeta donde estoy parado en el
"archivo actual)
noremap <Leader>gi :Git init %:p:h<CR>

" abre una ventana para ver el estado ed git que tenemos donde podemos interactuar con git
noremap <Leader>gs :Git<CR>

" muestra una comparativa de com va el codigo agregado con el que estaba a
" modo de historial con los datos del autor, del commit, fecha y sus metadatos
" de todo
noremap <Leader>gb :Git blame<CR>

" es un add. en git con la diferencia que primero guarda el archivo o hace el
" :write y luego el git add . se le puede agregar un directorio en seguida
noremap <Leader>ga :Gwrite<CR>

" muestra una ventana vertical con las diferencias mostradas por el git  de lo
" hecho vs lo que estaba
noremap <Leader>gd :Gvdiffsplit<CR>

"hacer commit del codigo
noremap <Leader>gc :Git commit --verbose<CR>

"push del codigo
noremap <Leader>gsh :Git push<CR>

"pull del codigo
noremap <Leader>gll :Git pull<CR>

"Git remove
noremap <Leader>gr :GRemove<CR>

"Git browse
noremap <Leader>go :GBrowse<CR>

" Git-Flog
noremap <Leader>gf :Flogsplit<CR>

"----------------------------------------git ---------------------------
"cerrar sesion de o buffer que lo tengo con cierra la sesion por completo de
"todos los buffers por completo
" nnoremap <leader>sc :CloseSession<CR>
" Set working directory
nnoremap <leader>. :lcd %:p:h<CR>

"cambiar donde estoy parado al archivo seleccionado
nnoremap <leader>- :lcd<CR>

"listas de busqueda en pantalla buffers y archivo en la carpeta donde estoy
nnoremap <leader>b :Buffers<CR>
nnoremap <leader>e :FZF -m<CR>

"Recovery commands from history through FZF
nmap <leader>y :History:<CR>

"------------------------------------- telescope ----------------------------
"---normal files---
nnoremap <leader>tff <cmd>Telescope find_files<cr>

"---buffers---
nnoremap <leader>tbf <cmd>Telescope buffers<cr>

"---git---
"files
nnoremap <leader>tgf <cmd>Telescope git_files<cr>

"branches
"tiene mas integraciones dentro pues se puede hacer reset hard con c-t
nnoremap <leader>tgb <cmd>Telescope git_branches<cr>

"commits
nnoremap <leader>tgc <cmd>Telescope git_commits<cr>

"difs
nnoremap <leader>tgd <cmd>Telescope git_bcommits<cr>

"status
nnoremap <leader>tgs <cmd>Telescope git_status<cr>

"-- telescope file browser --
nnoremap <leader>tfb <cmd>lua require("telescope").load_extension('file_browser')<CR><cmd>Telescope file_browser<CR>

"-- telescope project
nnoremap <leader>tpj <cmd>:lua require'telescope'.load_extension('project')<CR><cmd>Telescope project<CR>

"-- telescope repo

nnoremap <leader>trl <cmd>:lua require'telescope'.load_extension('repo')<CR><cmd>Telescope repo list<CR>

"-- telescope todolist (al lista of all tags that are like kind of this)
nnoremap <leader>tdl <cmd>:lcd %:p:h<CR><cmd>:TodoTelescope <CR>

"abre una ventana telescope con las notificaciones que me han salido pudiendo
"elegir una y volviendola a mostrar 
noremap <leader>tnt <cmd>:Telescope notify <CR>
"muestra log de notificaciones
nmap <leader>nl <cmd>:Notifications <CR>
"------------------------------------- telescope ----------------------------


"-------------------------------------- harpoon -----------------------------
" require("telescope").load_extension('harpoon') --harpoo agregado como
" extension de telescope con fin de mostrar previews
"menu de harpoon como extension de telescope para los previews
" nnoremap<leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>
" menu de harpo con previews
nnoremap<leader>thm :Telescope harpoon marks<CR>

"por si se ocupa cambiar de posicion las markas para accesos directos
nnoremap<leader>hm :lua require("harpoon.ui").toggle_quick_menu()<CR>

"add marks/file
nmap<leader>ha :lua require("harpoon.mark").add_file()<CR>

"ir ir directo a las markas de harpoon como el cambio de ventanas con ctrl
nmap <leader>h1 :lua require("harpoon.ui").nav_file(1)<CR>
nmap <leader>h2 :lua require("harpoon.ui").nav_file(2)<CR>
nmap <leader>h3 :lua require("harpoon.ui").nav_file(3)<CR>
nmap <leader>h4 :lua require("harpoon.ui").nav_file(4)<CR>


"-------------------------------------- harpoon -----------------------------

"------------------------shortcuts customized lider:, -----------------------

"----------------------------visualmode--------------------------------------

" Vmap for maintain Visual Mode after shifting > and < (identado para dar o quitar tabs)
vmap < <gv
vmap > >gv

" Move visual block, mayusculas osea shift + j,k para mover arriba o abajo la linea (identado)
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

"----------------------------visualmode------------------------------------

"----------------------------Rules-----------------------------------------

" session management
let g:session_directory = "~/.config/nvim/session"
let g:session_autoload = "no"
let g:session_autosave = "no"
let g:session_command_aliases = 1

"*****************************************************************************
" Visual Settings
"*****************************************************************************
syntax on

let no_buffers_menu=1
colorscheme molokai

if has("gui_running")
  if has("gui_mac") || has("gui_macvim")
    set guifont=Menlo:h12
    set transparency=7
  endif
else
 let g:CSApprox_loaded = 1

   " IndentLine
 let g:indentLine_enabled = 1
 " let g:indentLine_concealcursor = 0
 let g:indentLine_char = '┆'
 let g:indentLine_faster = 1

"-----------------nerdtree rules-----------------
  let g:NERDTreeGitStatusUseNerdFonts = 1 " you should install nerdfonts by yourself. default: 0"
  let g:NERDTreeGitStatusUntrackedFilesMode = 'all' " a heavy feature too. default: normal
  let g:NERDTreeGitStatusBinPath ='/your/file/path' " default: git (auto find in path)
  let NERDTreeMinimalUI=1    " Start NERDTree in minimal UI mode (No help lines)"
  let NERDTreeShowBookmarks=1   " Show NERDTree bookmarks

  let g:NERDTreeGitStatusIndicatorMapCustom = {
                   \ 'Modified'  :'✹',
                   \ 'Staged'    :'✚',
                   \ 'Untracked' :'✭',
                   \ 'Renamed'   :'➜',
                   \ 'Unmerged'  :'═',
                   \ 'Deleted'   :'✖',
                   \ 'Dirty'     :'✗',
                   \ 'Clean'     :'✔︎',
                   \ 'Ignored'   :'☒',
                   \ 'Unknown'   :'?',
                   \}


" nerdtree higlights
" let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
" let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1
" let g:NERDTreeDisableFileExtensionHighlight = 1
" let g:NERDTreeDisableExactMatchHighlight = 1
" let g:NERDTreeDisablePatternMatchHighlight = 1
let g:NERDTreeFileExtensionHighlightFullName = 1
let g:NERDTreeExactMatchHighlightFullName = 1
let g:NERDTreePatternMatchHighlightFullName = 1
let g:NERDTreeHighlightFolders = 1 " enables folder icon highlighting using exact match
let g:NERDTreeHighlightFoldersFullName = 1 " highlights the folder name
" you can add these colors to your .vimrc to help customizing
let s:brown = "905532"
let s:aqua =  "3AFFDB"
let s:blue = "689FB6"
let s:darkBlue = "44788E"
let s:purple = "834F79"
let s:lightPurple = "834F79"
let s:red = "AE403F"
let s:beige = "F5C06F"
let s:yellow = "F09F17"
let s:orange = "D4843E"
let s:darkOrange = "F16529"
let s:pink = "CB6F6F"
let s:salmon = "EE6E73"
let s:green = "8FAA54"
let s:lightGreen = "31B53E"
let s:white = "FFFFFF"
let s:rspec_red = 'FE405F'
let s:git_orange = 'F54D27'

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue

let g:NERDTreeExactMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExactMatchHighlightColor['.gitignore'] = s:git_orange " sets the color for .gitignore files

let g:NERDTreePatternMatchHighlightColor = {} " this line is needed to avoid error
let g:NERDTreePatternMatchHighlightColor['.*_spec\.rb$'] = s:rspec_red " sets the color for files ending with _spec.rb

let g:WebDevIconsDefaultFolderSymbolColor = s:beige " sets the color for folders that did not match any rule
let g:WebDevIconsDefaultFileSymbolColor = s:blue " sets the color for files that did not match any rule
let g:NERDTreeLimitedSyntax = 1
" let g:NERDTreeSyntaxDisableDefaultExactMatches = 1
" let g:NERDTreeSyntaxDisableDefaultPatternMatches = 1
let g:NERDTreeHighlightCursorline = 0
" let g:NERDTreeSyntaxDisableDefaultExtensions = 1 " arregla el pedo de nerdtree


" nerdtree higlights

"-----------------nerdtree rules-----------------

 if $COLORTERM == 'gnome-terminal'
   set term=gnome-256color
 else
   if $TERM == 'xterm'
     set term=xterm-256color
   endif
 endif
  
endif


if &term =~ '256color'
  set t_ut=
endif

if exists("*fugitive#statusline")
  set statusline+=%{fugitive#statusline()}
endif

" vim-airline
let g:airline_theme = 'powerlineish'
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#ale#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline_skip_empty_sections = 1

let g:airline_powerline_fonts=1

"*****************************************************************************
" Abbreviations
"*****************************************************************************
" no one is really happy until you have this shortcuts
cnoreabbrev W! w!
cnoreabbrev Q! q!
cnoreabbrev Qall! qall!
cnoreabbrev Wq wq
cnoreabbrev Wa wa
cnoreabbrev wQ wq
cnoreabbrev WQ wq
cnoreabbrev W w
cnoreabbrev Q q
cnoreabbrev Qall qall

let Grep_Default_Options = '-IR'
let Grep_Skip_Files = '*.log *.db'
let Grep_Skip_Dirs = '.git node_modules'

"*****************************************************************************
" Commands
"*****************************************************************************
" remove trailing whitespaces
command! FixWhitespace :%s/\s\+$//e

"*****************************************************************************
" Functions
"*****************************************************************************
if !exists('*s:setupWrapping')
  function s:setupWrapping()
    set wrap
    set wm=2
    set textwidth=79
  endfunction
endif

"*****************************************************************************
" Autocmd Rules
"*****************************************************************************
" The PC is fast enough, do syntax highlight syncing from start unless 200 lines
augroup vimrc-sync-fromstar
  autocmd!
  autocmd BufEnter * :syntax sync maxlines=200
augroup END

" Remember cursor position
augroup vimrc-remember-cursor-position
  autocmd!
  autocmd BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g`\"" | endif
augroup END

" txt
augroup vimrc-wrapping
  autocmd!
  autocmd BufRead,BufNewFile *.txt call s:setupWrapping()
augroup END

" make/cmake
augroup vimrc-make-cmake
  autocmd!
  autocmd FileType make setlocal noexpandtab
  autocmd BufNewFile,BufRead CMakeLists.txt setlocal filetype=cmake
augroup END

"set autoread

" fzf.vim
set wildmode=list:longest,list:full
set wildignore+=*.o,*.obj,.git,*.rbc,*.pyc,__pycache__
let $FZF_DEFAULT_COMMAND =  "find * -path '*/\.*' -prune -o -path 'node_modules/**' -prune -o -path 'target/**' -prune -o -path 'dist/**' -prune -o  -type f -print -o -type l -print 2> /dev/null"

" The Silver Searcher
if executable('ag')
  let $FZF_DEFAULT_COMMAND = 'ag --hidden --ignore .git -g ""'
  set grepprg=ag\ --nogroup\ --nocolor
endif

" ripgrep
if executable('rg')
  let $FZF_DEFAULT_COMMAND = 'rg --files --hidden --follow --glob "!.git/*"'
  set grepprg=rg\ --vimgrep
  command! -bang -nargs=* Find call fzf#vim#grep('rg --column --line-number --no-heading --fixed-strings --ignore-case --hidden --follow --glob "!.git/*" --color "always" '.shellescape(<q-args>).'| tr -d "\017"', 1, <bang>0)
endif

" "cnoremap <C-P> <C-R>=expand("%:p:h") . "/" <CR>
" snippets
" let g:UltiSnipsExpandTrigger="<tab>"
" let g:UltiSnipsJumpForwardTrigger="<tab>"
" let g:UltiSnipsJumpBackwardTrigger="<c-b>"
" let g:UltiSnipsEditSplit="vertical"

" ale
let g:ale_linters = {}

" Tagbar
nmap <silent> <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1

" Disable visualbell
set noerrorbells visualbell t_vb=
if has('autocmd')
  autocmd GUIEnter * set visualbell t_vb=
endif

" Copy/Paste/Cut
if has('unnamedplus')
  set clipboard=unnamed,unnamedplus
endif

noremap YY "+y<CR>
noremap <leader>p "+gP<CR>
noremap XX "+x<CR>

" Buffer nav
noremap <leader>z :bp<CR>
noremap <leader>q :bp<CR>
noremap <leader>x :bn<CR>
noremap <leader>w :bn<CR>

" Switching windows
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l
noremap <C-h> <C-w>h

"---------------------------------Rules----------------------------------------

"--------------------Include user's local vim config---------------------------

if filereadable(expand("~/.config/nvim/local_init.vim"))
  source ~/.config/nvim/local_init.vim
endif

"--------------------Include user's local vim config---------------------------

"-------------------------------------scrollbar -------------------------------
augroup ScrollbarInit
    autocmd!
    autocmd CursorMoved,VimResized,QuitPre * silent! lua require('scrollbar').show()
    autocmd WinEnter,FocusGained           * silent! lua require('scrollbar').show()
    autocmd WinLeave,BufLeave,BufWinLeave,FocusLost            * silent! lua require('scrollbar').clear()
augroup end
let g:scrollbar_right_offset = 1
let g:scrollbar_width = 1

 let g:scrollbar_shape = {
   \ 'head': '▲',
   \ 'body': '█',
   \ 'tail': '▼',
   \ }

"-------------------------------------scrollbar -------------------------------

"---------------------------------lens ----------------------------------------
let g:lens#disabled_filetypes = ['nerdtree', 'fzf']
let g:lens#height_resize_max = 55
let g:lens#height_resize_min =20
let g:lens#width_resize_max = 200
let g:lens#width_resize_min = 20
"---------------------------------lens ----------------------------------------
"----------------------Marcos visuales-----------------------------------------

" vim-airline
if !exists('g:airline_symbols')
  let g:airline_symbols = {}
endif

if !exists('g:airline_powerline_fonts')
  let g:airline#extensions#tabline#left_sep = ' '
  let g:airline#extensions#tabline#left_alt_sep = '|'
  let g:airline_left_sep          = '▶'
  let g:airline_left_alt_sep      = '»'
  let g:airline_right_sep         = '◀'
  let g:airline_right_alt_sep     = '«'
  let g:airline#extensions#branch#prefix     = '⤴' "➔, ➥, ⎇
  let g:airline#extensions#readonly#symbol   = '⊘'
  let g:airline#extensions#linecolumn#prefix = '¶'
  let g:airline#extensions#paste#symbol      = 'ρ'
  let g:airline_symbols.linenr    = '␊'
  let g:airline_symbols.branch    = '⎇'
  let g:airline_symbols.paste     = 'ρ'
  let g:airline_symbols.paste     = 'Þ'
  let g:airline_symbols.paste     = '∥'
  let g:airline_symbols.whitespace = 'Ξ'
else
  let g:airline#extensions#tabline#left_sep = ''
  let g:airline#extensions#tabline#left_alt_sep = ''

  " powerline symbols
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.readonly = ''
  let g:airline_symbols.linenr = ''
endif

" air-line
let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
    endif

     " unicode symbols
    let g:airline_left_sep = '»'
    let g:airline_left_sep = '▶'
    let g:airline_right_sep = '«'
    let g:airline_right_sep = '◀'
    let g:airline_symbols.linenr = '␊'
    let g:airline_symbols.linenr = '␤'
    let g:airline_symbols.linenr = '¶'
    let g:airline_symbols.branch = '⎇'
    let g:airline_symbols.paste = 'ρ'
    let g:airline_symbols.paste = 'Þ'
    let g:airline_symbols.paste = '∥'
    let g:airline_symbols.whitespace = 'Ξ'

     " airline symbols
    let g:airline_left_sep = ''
    let g:airline_left_alt_sep = ''
    let g:airline_right_sep = ''
    let g:airline_right_alt_sep = ''
    let g:airline_symbols.branch = ''
    let g:airline_symbols.readonly = ''
    let g:airline_symbols.linenr = ''

"----------------------Marcos visuales-----------------------------------------

"vundle
set nocompatible              " be iMproved, required
filetype off                  " required
 
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
 
Plugin 'VundleVim/Vundle.vim'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
" Plugin 'garbas/vim-snipmate'
" Plugin 'ddgrvcoelho/vim-javascript-snippets'
" Plugin 'puremourning/vimspector'

call vundle#end()            " required
filetype plugin indent on    " required



 " lua -> packer
lua require('luaplugins.plugins')

 " lua ->settings
lua require('settings.settings')

 " configs de plugins
lua require('luaplugins.toggleterm')
lua require('luaplugins.trouble')
lua require('luaplugins.todo-comments')
lua require('luaplugins.nvim-notify')

" lua require('luaplugins.java')
" lua require("nvim-lsp-installer")
" lua require('luaplugins.java')
" lua require("nvim-lsp-installer")
" lua require('jc')





" plug = guarda los plugs en la carpeta de home/.config/nvim/plugged
" vundle = guarda lkos plugins en home/.vim/bundle/Vundle
" packer = guarda los plugs en home/.local/share/nvim/site/pack/packer/start
" sabiendo esto todas las configs de los plugins se pueden editar en sus
" archivos mismos y tambien en la carpeta home/.config/nvim/lua/luaplugins con
" la invocacion de lua de aqui arriba ahi mismo esta el archivo que instala
" packer en donde se instalan las extensiones con su sintaxis, solo que al ser
" mucha la configuracion la prefiero tener guardada en aquel archivo
" notify-coc
