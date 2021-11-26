set nu rnu ts=4 sts=4 sw=4 et ci si
syntax enable
filetype plugin indent on

" -> vim-plug plugin manager
" Automatic installation(https://github.com/junegunn/vim-plug/wiki/tips#automatic-installation)
let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
if empty(glob(data_dir . '/autoload/plug.vim'))
  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

" Auto install missing plugins at the startup of vim, this increase vim
" startup time
" Run PlugInstall if there are missing plugins
autocmd VimEnter * if len(filter(values(g:plugs), '!isdirectory(v:val.dir)'))
  \| PlugInstall --sync | source $MYVIMRC
\| endif
" Setup leader key
let g:mapleader = "\<Space>"
let g:maplocalleader = ','
nnoremap <silent> <leader>      :<c-u>WhichKey '<Space>'<CR>
nnoremap <silent> <localleader> :<c-u>WhichKey  ','<CR>

" Make <tab> used for trigger completion, completion confirm, snippet expand and jump like VSCode.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? coc#_select_confirm() :
      \ coc#expandableOrJumpable() ? "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction
let g:coc_snippet_next = '<tab>'


" Mapping for moving cursor in insert mode
imap <C-h> <C-\><C-o>h
imap <C-j> <C-\><C-o>j
imap <C-k> <C-\><C-o>k
imap <C-l> <C-\><C-o>l

call plug#begin('~/.vim/plugged')
" ultisnips 
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" telescope - brew install fd rg
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
" lightspeed
Plug 'ggandor/lightspeed.nvim'
" floatterm
Plug 'voldikss/vim-floaterm'
Plug 'arcticicestudio/nord-vim'
Plug 'rakr/vim-one'
Plug 'morhetz/gruvbox'
" Need install Nerd Fonts to have a nice looking airline status line
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'liuchengxu/vim-which-key'
" Coc to load Ultisnips snippets install coc-snippets extension: CocInstall coc-snippets
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'tpope/vim-fugitive'
Plug 'editorconfig/editorconfig-vim'
call plug#end()

" Customize colors for coc suggestion popmenu
" friendly dark mode 
func! s:my_colors_setup() abort
    " this is an example
    hi Pmenu ctermfg=248
    hi Pmenu ctermbg=237
    hi PmenuSel ctermfg=229
    hi PmenuSel ctermbg=66
    hi PmenuSbar ctermfg=White
    hi PmenuSbar ctermbg=DarkGray
endfunc

augroup colorscheme_coc_setup | au!
    au ColorScheme * call s:my_colors_setup()
augroup END

"let g:airline_theme='one'
let g:airline#extensions#tabline#enabled = 1
colorscheme one
set background=dark " for the dark version
let g:airline_powerline_fonts = 1 " enable nice looking status line

" vim-floaterm
" Configuration example
let g:floaterm_keymap_new    = '<F5>'
let g:floaterm_keymap_prev   = '<F6>'
let g:floaterm_keymap_next   = '<F7>'
let g:floaterm_keymap_toggle = '<F8>'
noremap  <leader>t  :FloatermToggle<CR>
noremap! <leader>t  <Esc>:FloatermToggle<CR>
tnoremap <leader>t  <C-\><C-n>:FloatermToggle<CR>
let g:floaterm_width = 0.9 
let g:floaterm_height = 0.9
let g:floaterm_winblend = 0

" coc-explorer
nmap <space>e <Cmd>CocCommand explorer<CR>

" telescope configuration
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" List all snippets in INSERT mode
inoremap <F9> <C-R>=UltiSnips#ListSnippets()<CR>
inoremap <leader>ls <C-R>=UltiSnips#ListSnippets()<CR>

"let g:UltiSnipsExpandTrigger="<nop>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
