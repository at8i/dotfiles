﻿" Make the Leader key , instead of the default \
let mapleader=","

" ########################################################################
" ######## Vim Plug and Plugins
" ########################################################################
call plug#begin('~/.vim/plugged')

" Misc.
Plug 'gruvbox-community/gruvbox'
Plug 'christoomey/vim-tmux-navigator'
Plug 'ruanyl/vim-gh-line'
Plug 'ap/vim-buftabline'

" Feature Enhancers
Plug 'scrooloose/nerdtree', { 'on': ['NERDTreeToggle', 'NERDTreeFind'] }
Plug 'sbernheim4/vim-ripgrep'
Plug 'mhinz/vim-signify'
Plug 'romainl/vim-qf'
Plug 'neoclide/coc.nvim', { 'branch': 'release', 'on': [] }

" Telescope.vim --> https://github.com/nvim-lua/telescope.nvim
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-lua/telescope.nvim'

" Text Manipulation
Plug 'Raimondi/delimitMate'
Plug 'tpope/vim-surround'
Plug 'AndrewRadev/sideways.vim'
Plug 'FooSoft/vim-argwrap'

" FZF
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'

" Syntax
Plug 'peitalin/vim-jsx-typescript'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'gabrielelana/vim-markdown'
Plug 'HerringtonDarkholme/yats.vim'
Plug 'hardcoreplayers/dashboard-nvim'
Plug 'heavenshell/vim-jsdoc', {
  \ 'for': ['javascript', 'javascript.jsx','typescript'],
  \ 'do': 'make install'
\}
call plug#end()

let g:javascript_plugin_jsdoc=1

" https://github.com/junegunn/vim-plug/wiki/tips#loading-plugins-manually
augroup LazyLoadCoc
  autocmd!
  autocmd InsertEnter * call plug#load('coc.nvim')
augroup END

autocmd FileType help wincmd L
autocmd FileType gitcommit setlocal spell

" ########################################################################
" ######## NERDTree
" ########################################################################
nnoremap <silent> <Leader>d :NERDTreeToggle<CR>
nnoremap <silent> <Leader>nt :NERDTree<CR>
nnoremap <silent> <Leader>nf :NERDTreeFind <CR>

let g:NERDTreeWinPos = 'right'

" ########################################################################
" ######## Telescope
" ########################################################################
nnoremap ff :lua require'telescope.builtin'.git_files{}<CR>
nnoremap aa :lua require'telescope.builtin'.buffers{}<CR>
nnoremap <Leader>f :Rg

" Open vim in pop up window instead of using fzf preview
let g:fzf_layout = { 'window': {'width': 0.8, 'height': 0.6} }
let $FZF_DEFAULT_OPTS='--layout=reverse --preview-window=:noborder --color=gutter:-1'
let g:fzf_preview_window = 'right:40%'

" ########################################################################
" ######## Coc
" ########################################################################
function! s:check_back_space() abort
	let col = col('.') - 1
	return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" Use <CR> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <CR> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <silent> <silent> tt :<C-u>CocList outline<CR>
nmap <silent> <Leader>s :<C-u>CocList symbols<CR>
nmap <silent> <Leader>gd <C-w>v<Plug>(coc-definition)
nmap <silent> <Leader>td <Plug>(coc-type-definition)
nmap <silent> <Leader>rn <Plug>(coc-rename)
nmap <silent> <Leader>ac <Plug>(coc-codeaction)
nmap <silent> <Leader>fr <Plug>(coc-references)
nmap <silent> <Leader>ee <Plug>(coc-refactor)
nmap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
    if (index(['vim','help'], &filetype) >= 0)
        execute 'h '.expand('<cword>')
    else
        call CocAction('doHover')
    endif
endfunction

let g:coc_global_extensions = [
    \ 'coc-snippets',
    \ 'coc-eslint',
    \ 'coc-prettier',
    \ 'coc-css',
    \ 'coc-html',
    \ 'coc-json',
    \ 'coc-tsserver',
    \ ]

" ########################################################################
" ######## Vim-Signify
" ########################################################################
nnoremap <Leader>st :SignifyToggle<CR>
nnoremap <Leader>sh :SignifyToggleHighlight<CR>

let g:signify_sign_add = '▐'
let g:signify_sign_delete = '▐'
let g:signify_sign_change = '▐'
let g:signify_line_highlight = 0
let g:signify_disable_by_default = 1

highlight SignifySignAdd  guifg=#b8ba25 cterm=NONE gui=NONE
highlight SignifySignDelete guifg=#fa4933 cterm=NONE gui=NONE
highlight SignifySignChange guifg=#458488 cterm=NONE gui=NONE

" ########################################################################
" ######## Vim-Quickfix
" ########################################################################
nmap cm <Plug>(qf_qf_toggle)
nmap cl <Plug>(qf_loc_toggle)

let g:qf_mapping_ack_style = 1
let g:qf_shorten_path = 0

" ########################################################################
" ######## Sideways
" ########################################################################
nnoremap <Leader><Leader>s :SidewaysLeft<CR>
nnoremap <Leader><Leader>l :SidewaysRight<CR>

" ########################################################################
" ######## ArgWrap
" ########################################################################
let g:argwrap_padded_braces = '{'
nmap <silent> <leader>aw <Plug>(ArgWrapToggle)

" ########################################################################
" ######## Dashboard Nvim
" ########################################################################
let g:dashboard_default_executive ='fzf'
let g:dashboard_default_header='lambada'

let g:dashboard_custom_shortcut={
            \ 'new_file'           : '         e',
            \ 'find_file'          : '       f f',
            \ 'last_session'       : '   SPC s l',
            \ 'find_history'       : '  :History',
            \ 'change_colorscheme' : '   :Colors',
            \ 'find_word'          : '       :Rg',
            \ 'book_marks'         : ':Bookmarks',
            \ }

" ########################################################################
" ######## Color Scheme Settings
" ########################################################################
syntax enable
syntax on
set termguicolors
set background=dark
colorscheme gruvbox
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

highlight Visual guifg=#575757 guibg=#d1d1d1
highlight QuickFixLine guibg=#707070 guifg=#e8d8c5

source ~/dotfiles/vim/mappings.vim
source ~/dotfiles/vim/settings.vim
source ~/dotfiles/vim/statusLine.vim
source ~/dotfiles/vim/tabLine.vim
