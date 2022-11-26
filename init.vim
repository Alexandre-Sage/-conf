set expandtab 
set shiftwidth=2
set autoindent
set smartindent
set number
set tags=tags,./tags

"colorscheme neovim
filetype indent off 
command! -nargs=0 Prettier :call CocAction('runCommand', 'prettier.formatFile')
call plug#begin('~/"neovim".config/nvim/plugins')

Plug 'neoclide/coc.nvim', {'branch': 'release'}
"FILE TREE
Plug 'preservim/nerdtree'
Plug 'ryanoasis/vim-devicons'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'PhilRunninger/nerdtree-buffer-ops'
Plug 'PhilRunninger/nerdtree-visual-selection'

"UTILS
Plug 'Raimondi/delimitMate'
Plug 'preservim/nerdcommenter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ap/vim-buftabline'
"NOVIM
Plug 'tombh/novim-mode'

Plug 'dense-analysis/ale'

"bash
Plug 'WolfgangMehner/bash-support'
Plug 'koalaman/shellcheck'

call plug#end()
"call coc#refresh()
"call plug#helptags()


function! CheckBackspace() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
"KEY
inoremap <silent><expr> <Tab>
      \ coc#pum#visible() ? coc#pum#next(1) :
      \ CheckBackspace() ? "\<Tab>" :      \ coc#refresh()
inoremap <silent><expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>


"CtrlP

"let g:ctrlp_map = '<Leader>t'
"let g:ctrlp_match_window_bottom = 0
"let g:ctrlp_match_window_reversed = 0
let g:ctrlp_working_path_mode = 'ra' 
let g:ctrlp_root_markers = ['.ctrlp']
let g:ctrlp_dotfiles = 0                                                                                                                                           
let g:ctrlp_switch_buffer = 0
let g:ctrlp_max_files=0

let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git'

"Color
highlight clear
if exists("syntax_on")
  syntax reset
endif
syntax on
highlight Constant guifg=#eb3434
highlight String guifg=#eb3434
highlight Character guifg=#eb3434
highlight Conditional guifg=#eb3434
highlight Function guifg=#eb3434
