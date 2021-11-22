set nu rnu ts=4 sts=4 sw=4 et
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

" Mapping for moving cursor in insert mode
imap <C-h> <C-\><C-o>h
imap <C-j> <C-\><C-o>j
imap <C-k> <C-\><C-o>k
imap <C-l> <C-\><C-o>l

call plug#begin('~/.vim/plugged')
" ultisnips
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'BurntSushi/ripgrep'
Plug 'sharkdp/fd'
" lightspeed
Plug 'ggandor/lightspeed.nvim'
" floatterm
Plug 'voldikss/vim-floaterm'
Plug 'rakr/vim-one'
call plug#end()

let g:airline_theme='one'
colorscheme one
set background=dark " for the dark version

" vim-floaterm
" Configuration example
let g:floaterm_keymap_new    = '<F7>'
let g:floaterm_keymap_prev   = '<F8>'
let g:floaterm_keymap_next   = '<F10>'
let g:floaterm_keymap_toggle = '<F12>'

" telescope configuration
" Find files using Telescope command-line sugar.
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>

" List all snippets in INSERT mode
inoremap <F9> <C-R>=UltiSnips#ListSnippets()<CR>

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"
