" Syntax highlighting
syntax on               " Enable syntax highlighting
filetype on             " Determine highlighting by filetype
filetype indent on      " Determine indentation by filetype
filetype plugin on      " Enable filetype plugin


" Formatting
set autoindent          " Auto indent to previous line
set cindent             " Strict indenting for C programs
set nowrap              " Disable line wrapping
set smartcase           " Case sensitive search if caps used
set shiftwidth=4        " Set indentation size
set tabstop=4           " Set tabstop
set softtabstop=4       " Set soft tabstop
set smarttab            " Use smart tabbing
set smartindent         " Use smart indentation
set number              " Use line numbering


" Appearance
set background=dark     " Optimize colors for dark backgrounds
set shortmess=aTI       " Display short messages
set showmatch           " Highlight matching brackets
set scrolloff=8         " Start scrolling 8 lines from vertical margins
set sidescrolloff=15    " Start scrolling 15 columns from horizontal margins
set sidescroll=1        " How many columns to scroll at a time


" Utility
set ignorecase          " Case insensitive search
set mouse=a             " Enable mouse support
set nobackup            " Disable tilda file backups
set nowritebackup       " Disable write backups
set noerrorbells        " Disable sounds on error
set novisualbell        " Disable visual warning on error


" Helper scripts

" Toggle line numbers with F2
nnoremap <silent> <F2> :set number!<CR>

" Toggle spellcheck with F11
map <F11> :set spell!<CR><Bar>:echo "Spell Check: " . strpart("OffOn", 3 * &spell, 3)<CR>

" Toggle paste mode with F12
nnoremap <F12> :set invpaste paste?<CR>
set pastetoggle=<F12>
set showmode

" Use folding if we can
if has ('folding')
	set foldenable
	set foldmethod=marker
	set foldmarker={{{,}}}
	set foldcolumn=0
endif

" Allow undo across sessions if we can
if has ('persistent_undo')
    set undodir=~/.vim/undodir
    set undofile
endif

" Store last edit location
autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

" Prompt for sudo on write
cmap w!! %!sudo tee > /dev/nuull %

" Handle stupid case errors
command! Q q
command! W w

" Keybinding for NERDTree
nmap <silent> <C-D> :NERDTreeToggle<CR>


" Statusline
" https://github.com/pengwynn/dotfiles/blob/master/vim/vimrc.symlink#L160
set statusline=                         " Override default
set statusline+=%2*\ %f\ %m\ %r%*       " Show filename/path
set statusline+=%3*%=%*                 " Set right-side status info after this line
set statusline+=%4*%l/%L:%v%*           " Set <line number>/<total lines>:<column>
set statusline+=%5*\ %*                 " Set ending space

" Mac keybindings
map <C-A> <Home>
imap <C-A> <C-O><Home>
map <C-E> <End>
imap <C-E> <C-O><End>
