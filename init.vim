
" set commands

" no conitnuation of comment on next line:
set formatoptions-=cro

" show line numbers
set nu
" relative numbers
set rnu

set smartindent

" enables mouse selection invim
set mouse=a " to disable set mouse-=a


" To have a transparent background
hi Normal guibg=NONE ctermbg=NONE

" does not highlight the searched text
set nohlsearch
" ignore case while searching

set ignorecase

call plug#begin("~/.vim/plugged")
"  Plug 'dracula/vim'
  Plug 'gruvbox-community/gruvbox'
  Plug 'scrooloose/nerdtree'
  Plug 'ryanoasis/vim-devicons'
  "fzf ( fuzzy finder )
  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  " for fzf file preview
  Plug 'vim-scripts/bats.vim'
  " for auto completion in nvim 
  Plug 'neoclide/coc.nvim', {'branch': 'release'}
  Plug 'leafgarland/typescript-vim'
  Plug 'peitalin/vim-jsx-typescript'

  " working with tags
  Plug 'alvan/vim-closetag'
  Plug 'tpope/vim-surround'

  " for commenting
  Plug 'tpope/vim-commentary'
  "  js syntax highlighting
  Plug 'yuezk/vim-js'
  Plug 'maxmellon/vim-jsx-pretty'
  Plug 'ap/vim-css-color'
  Plug 'sheerun/vim-polyglot'
call plug#end()



let g:coc_global_extensions = ['coc-emmet', 'coc-css', 'coc-html', 'coc-json', 'coc-prettier', 'coc-tsserver', 'coc-pairs', 'coc-vimtex'] 

" For the theme
if (has("termguicolors"))
 set termguicolors
endif
syntax enable
colorscheme gruvbox


" For the nerdTree
let g:NERDTreeShowHidden = 1
let g:NERDTreeMinimalUI = 1
let g:NERDTreeIgnore = []
let g:NERDTreeStatusline = ''
" Automaticaly close nvim if NERDTree is only thing left open
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
" Toggle
nnoremap <silent> <leader>g :NERDTreeToggle<CR>
" nerdTree window size
let g:NERDTreeWinSize=52

" bug : square brackets after sourcing the init.vim
if exists('g:loaded_webdevicons')
    call webdevicons#refresh()
endif




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


" fzf settings
nnoremap <C-p> :FZF<CR>
nnoremap <leader>ff :Files<CR>

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




" To disable continuation of comment
autocmd BufNewFile,BufRead * setlocal formatoptions-=cro


