" set commands
syntax on

" no conitnuation of comment on next line:
autocmd FileType * set formatoptions-=cro
" won't show insert | visual | normal mode at bottom
" left
set noshowmode
" show line numbers
set nu
" relative numbers
set rnu
set smartindent

" enables mouse selection invim

set mouse=a " to disable set mouse-=a

" background transparent
autocmd vimenter * hi Normal guibg=NONE ctermbg=NONE

" does not highlight the searched text
set nohlsearch

" ignore case while searching
set ignorecase

" Re-mapping ESC to jf
inoremap jf <Esc>
call plug#begin("~/.vim/plugged")

  " Themes 
  Plug 'haishanh/night-owl.vim'
  Plug 'junegunn/seoul256.vim'
  Plug 'sonph/onehalf', { 'rtp': 'vim' }
  Plug 'joshdick/onedark.vim'
  Plug 'NLKNguyen/papercolor-theme'
  Plug 'rakr/vim-one'
  Plug 'kyoz/purify', { 'rtp': 'vim' }
  Plug 'folke/tokyonight.nvim', { 'branch': 'main' }
  Plug 'sainnhe/gruvbox-material'
  Plug 'EdenEast/nightfox.nvim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'overcache/NeoSolarized'
  " Plug 'scrooloose/nerdtree'
  " Plug 'ryanoasis/vim-devicons'
  "fzf ( fuzzy finder )
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " for fzf file preview
  Plug 'vim-scripts/bats.vim'
  " for auto completion in nvim 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}

  " working with tags
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'
" Alternative to airline
 Plug 'itchyny/lightline.vim'
  " for commenting
  Plug 'tpope/vim-commentary'
  "  js syntax highlighting
  " Plug 'yuezk/vim-js'
  " Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ap/vim-css-color'
  Plug 'sheerun/vim-polyglot'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}


  "  for highlight todo, hack in the comments 
  Plug 'nvim-lua/plenary.nvim'
  Plug 'folke/todo-comments.nvim'

 " git plugin for vim
 Plug 'tpope/vim-fugitive'

 Plug 'preservim/nerdtree'
 " For transparent background
 Plug 'tribela/vim-transparent'
call plug#end()


" for todo-comments plugin
lua << EOF
  require("todo-comments").setup {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
  }
EOF


let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pairs'] 

" For the theme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable

" seoul256 (dark):
"   Range:   233 (darkest) ~ 239 (lightest)
"   Default: 237

" let g:seoul256_background = 233
" colo seoul256

" seoul256 (light):
"   Range:   252 (darkest) ~ 256 (lightest)
"   Default: 253
" let g:seoul256_background = 256
" colo seoul256

" onehalf onedark papercolor ( bg light )  one purify tokyonight nightfox gruvbox gruvbox-material NeoSolarized nightowl
"
colorscheme NeoSolarized 

set background=dark
" set background=light


" " For the nerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" " Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <leader>g :NERDTreeToggle<CR>
" nerdTree window size
let g:NERDTreeWinSize=53
"Automatically start nerdTree when vim starts
autocmd VimEnter * NERDTree


" bug : square brackets after sourcing the init.vim
" if exists('g:loaded_webdevicons')
"     call webdevicons#refresh()
" endif




" For integrated terminal ( amazing )
" open new split panes to right and below
set splitright
set splitbelow
" turn terminal to normal mode with escape
tnoremap <Esc><Esc> <C-\><C-n>
" start terminal in insert mode
au BufEnter * if &buftype == 'terminal' | :startinsert | endif
" open terminal on ctrl+n
function! OpenTerminal()
  split term://zsh
  resize 10
endfunction
nnoremap <c-n> :call OpenTerminal()<CR>



" custom mapping for moving between panes
nnoremap <leader>w <C-w>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k


" to move between tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt
noremap <leader>4 4gt

" fzf settings
" fzf preview window theme
" themes can be found ( bat --list-themes ) in the term
" directly ( the name should be exactly same)
let $BAT_THEME='Solarized (dark)'
nnoremap <C-p> :FZF<CR>
nnoremap <leader>ff :Files<CR>
nnoremap <silent> <Leader>f :Ag<CR>

let g:fzf_action = {
  \ 'ctrl-t': 'tab split',
  \ 'ctrl-s': 'split',
  \ 'ctrl-v': 'vsplit'
  \}

" to ignore node modules
let $FZF_DEFAULT_COMMAND = 'ag -g ""'


" to show the preview window
let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

" ESC to close FZF
if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif



" Closing tag bindings 
" " filenames like *.xml, *.html, *.xhtml, ...
" These are the file extensions where this plugin is enabled.
"
let g:closetag_filenames = '*.html,*.xhtml,*.phtml,*.js,*.tsx'

" filenames like *.xml, *.xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filenames = '*.xhtml,*.jsx,*.js'

" filetypes like xml, html, xhtml, ...
" These are the file types where this plugin is enabled.
"
let g:closetag_filetypes = 'html,xhtml,phtml,js,tsx'

" filetypes like xml, xhtml, ...
" This will make the list of non-closing tags self-closing in the specified files.
"
let g:closetag_xhtml_filetypes = 'xhtml,jsx,js'

" integer value [0|1]
" This will make the list of non-closing tags case-sensitive (e.g. `<Link>` will be closed while `<link>` won't.)
"
let g:closetag_emptyTags_caseSensitive = 1

" Dealing with buffers
" to show buffer tab number at top
" tab-shift to move between buffers
nnoremap  <silent>   <tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bnext<CR>
nnoremap  <silent> <s-tab>  :if &modifiable && !&readonly && &modified <CR> :write<CR> :endif<CR>:bprevious<CR>



" Lightline configurations
" Available colorscheme for lightline
" https://github.com/itchyny/lightline.vim/blob/master/colorscheme.md
let g:lightline = {
      \ 'colorscheme': 'Tomorrow_Night_Eighties',
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'gitbranch', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'gitbranch': 'FugitiveHead'
      \ },
      \ }


" Vim fugitive maps


" current line number color 
hi CursorLineNr guifg=#d33682
set cursorline
set cursorlineopt=number


