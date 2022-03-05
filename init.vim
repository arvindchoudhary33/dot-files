syntax on
    
" All set commands
set scrolloff=10
set nu
" tabs are shown with \"periods\"
set list lcs=tab:\.\
set ignorecase
set relativenumber
set tabstop=1 softtabstop=1
set smartindent
set nowrap
set nohlsearch
set noswapfile
set incsearch
set path+=**
set wildignore+=**/node_modules/**
set wildmenu
set sidescroll=1
set mouse=a
"  to unset mouse selection : set mouse-=a
" Cursor
set guicursor=n-v-c:block-Cursor
set guicursor+=i:ver100-iCursor
set guicursor+=n-v-c:blinkon0
set guicursor+=i:blinkwait10
highlight Cursor guifg=white guibg=black
highlight iCursor guifg=white guibg=steelblue


" some netrw settings ( not in use, currently )
" Highlight marked files in the same way search matches are.
"hi! link netrwMarkFile Search
" to hide dot files on load
"let g:netrw_list_hide = '\(^\|\s\s\)\zs\.\S\+'
" when the current directory (in the buffer) and the directory we are 
" browsing don't match. To fix this you can set the global variable g:netrw_keepdir to zero
"let g:netrw_keepdir = 0

"let g:netrw_banner = 0
" to set file explorer to opt 3 ( there are four types )
"let g:netrw_liststyle = 3
" to set the size of opened file explorer to 25
"let g:netrw_winsize = 20
"let g:netrw_browse_split = 3

" ---------------------------PLUGINS---------------------------
call plug#begin()
Plug 'gruvbox-community/gruvbox'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'nvim-lua/plenary.nvim'
Plug 'psf/black', { 'tag': '*' }
" file explorer ( nerdtree ) 
Plug 'preservim/nerdtree'
" git for nerd tree
Plug 'Xuyuanp/nerdtree-git-plugin'
" Color preview for css 
Plug 'ap/vim-css-color'
Plug 'ryanoasis/vim-devicons'
" for JSX highlighting
Plug 'maxmellon/vim-jsx-pretty'
" For commenting 
Plug 'tpope/vim-commentary'
" Adds closing tags automatically
Plug 'alvan/vim-closetag'
" Adds colors to icons with different extensions
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
" to add preview highlighting for fzf
Plug 'vim-scripts/bats.vim'
call plug#end()

let g:fzf_layout = { 'window': { 'width': 0.8, 'height': 0.8}}
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"
nnoremap <C-p> :Files<Cr>


colorscheme gruvbox

" To have a transparent background
hi Normal guibg=NONE ctermbg=NONE

" ------------------------COMMON KEY BINDING------------------------------------
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l
nnoremap <leader>ff :Files<CR>
nnoremap <leader>fg :GFiles<CR>
nnoremap <leader>bb :Bookmark<CR>
nnoremap <leader>w <C-w>
nnoremap <leader>g :NERDTreeToggle<CR>
" to move between tabs
noremap <leader>1 1gt
noremap <leader>2 2gt
noremap <leader>3 3gt

" to close a tab
noremap <leader>q tabclose

" to open file explorer with vim opens
autocmd VimEnter * NERDTree

" the  change the focus to vim ( before it was to nerdtree ) 
autocmd VimEnter * wincmd p

" to close nertree if last file is closed 
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

"
" highlighting for git files in nerd tree 
let g:NERDTreeGitStatusIndicatorMapCustom = {
    \ "Modified"  : "✹",
    \ "Staged"    : "✚",
    \ "Untracked" : "✭",
    \ "Renamed"   : "➜",
    \ "Unmerged"  : "═",
    \ "Deleted"   : "✖",
    \ "Dirty"     : "✗",
    \ "Clean"     : "✔︎",
    \ 'Ignored'   : '☒',
    \ "Unknown"   : "?"
    \ }


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

" dict
" Disables auto-close if not in a "valid" region (based on filetype)
"
let g:closetag_regions = {
    \ 'typescript.tsx': 'jsxRegion,tsxRegion',
    \ 'javascript.jsx': 'jsxRegion',
    \ 'typescriptreact': 'jsxRegion,tsxRegion',
    \ 'javascriptreact': 'jsxRegion',
    \ }

" Shortcut for closing tags, default is '>'
"
let g:closetag_shortcut = '>'

" Add > at current position without closing the current tag, default is ''
"
let g:closetag_close_shortcut = '<leader>>'



" bug : square brackets after sourcing the init.vim
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif


" nerd tree/ vimDevIcons different icon coloring and other settings 
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



" Disable unmatched folder and file icons having the same color as their labels (normally green and white),
" if set by this plugin (it could have been set by some other plugin that you are using).
let g:WebDevIconsDisableDefaultFolderSymbolColorFromNERDTreeDir = 1
let g:WebDevIconsDisableDefaultFileSymbolColorFromNERDTreeFile = 1

let g:NERDTreeExtensionHighlightColor = {} " this line is needed to avoid error
let g:NERDTreeExtensionHighlightColor['css'] = s:blue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['json'] = s:darkBlue " sets the color of css files to blue
let g:NERDTreeExtensionHighlightColor['py'] = s:green " sets the color of python files to blue

let g:NERDTreeLimitedSyntax = 1

let g:NERDTreeHighlightCursorline = 0

let g:NERDTreeWinSize=52




