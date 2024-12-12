" Custom Settings {{{
colorscheme darcula                       " https://github.com/blueshirts/darcula
syntax enable                             " enable syntax processing
set number                                " show line numbers
set tabstop=4                             " tabs are equivalent to 'x' spaces
set softtabstop=4                         " tab expansion will create 'x' spaces
set expandtab                             " tabs are spaces
set shiftwidth=4                          " shifting should be the same as tabbing
set spell spelllang=en_ca                 " enable spell check
set spellcapcheck=                        " disable capital at start of sentence check
set colorcolumn=80                        " mark 'x' column visually
set showcmd                               " show last command in bottom right
set cursorline                            " indicate which line the cursor is on
set wildmenu                              " visual of auto complete for command menu
set lazyredraw                            " redraw only when needed (for example, not during macro iterations)
set showmatch                             " highlight matching bracket pairs
set incsearch                             " search as characters are entered
set hlsearch                              " highlight matches
let mapleader=","                         " remap leader key '\' to 'x'
nnoremap <leader><space> :nohlsearch<CR>  " remap comma-space to turn of search highlights
set foldenable                            " enable code folding
set foldlevelstart=10                     " open 'x' fold levels by default
set foldnestmax=10                        " only allow 'x' amount of nested folds
set foldmethod=marker                     " fold on {{{ }}}
set pastetoggle=<F3>                      " toggle paste mode with F3 key
set lcs+=space:·                          " add spaces to characters shown by :set list
set mouse=a                               " mouse scrolling
let g:netrw_banner=0                      " hide banner in netrw explorer
let g:netrw_liststyle=3                   " select list style for netrw explorer
let g:terraform_align=1                   " Allow vim-terraform to align settings automatically with Tabularize.
let g:terraform_fmt_on_save=1             " Allow vim-terraform to automatically format *.tf and *.tfvars files with terraform fmt

" Cursor Settings {{{
if &term =~ "xterm\\|rxvt"
  " use a pipe in insert mode
  let &t_SI = "\<Esc>[6 q"
  " use a block otherwise
  let &t_EI = "\<Esc>[2 q"
  " reset cursor when vim exits
  autocmd VimLeave * silent !echo -ne "\033]112\007"
endif
" }}}
" }}}
