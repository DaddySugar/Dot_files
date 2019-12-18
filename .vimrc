" line enables syntax highlighting by default.
if has("syntax")
  syntax on
endif

" Specify a directory for plugins
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.vim/plugged')

" Multiple Plug commands can be written in a single line using | separators


Plug 'SirVer/ultisnips' "| Plug 'honza/vim-snippets'
"Plug 'honza/vim-snippets'


Plug 'scrooloose/nerdtree', { 'on':  'NERDTreeToggle' }
Plug 'tpope/vim-fireplace', { 'for': 'clojure' }


function! BuildComposer(info)
  if a:info.status != 'unchanged' || a:info.force
    if has('nvim')
      !cargo build --release --locked
    else
      !cargo build --release --locked --no-default-features --features json-rpc
    endif
  endif
endfunction

Plug 'euclio/vim-markdown-composer', { 'do': function('BuildComposer') }


call plug#end()

let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"


" Background
set background=dark

" Searching
set hlsearch		" hlsearch
"set ignorecase		" Do case insensitive matching

" Mouse Integration
set mouse=a		" Enable mouse usage

" Display
set showmatch		" Show matching brackets
set number		" show line numbers
"set cursorline		" Highlight current line
set wildmenu		" visual autocomplete for command menu

" Movements
set whichwrap+=<,>,h,l,[,] " left/right wrap movement

" Tabs
set tabstop=8          " how many columns a tab counts for
set softtabstop=0       " tabulation=0spaces
set expandtab           " Replace tab by spaces
set shiftwidth=4        " nb columns text is indented with << and >>
set smarttab            " active smart-tabs (better auto-indentation)
set smartindent         " active smart-indent (better auto-indent of paste)


" Display whitespace characters
set list
set listchars=tab:>─,eol:¬,trail:\ ,nbsp:¤
set fillchars=vert:│

" Netrw (default filebrowser in vim)
let g:netrw_banner = 0          " Removing the banner
let g:netrw_winsize = 25        " Windows width
" let g:netrw_browse_split = 1  " Changing how files are opened
                                " (1:hsplit/2:vsplit/3:tab/4:previousWindows)
" let g:netrw_altv = 1
" let g:netrw_hide = 1

" Ctrl-arrays D/G
map ^[[D <C-Left>
map ^[[C <C-Right>
map! ^[[D <C-Left>
map! ^[[C <C-Right>

" ---column limit (80)
" --simple way
" set colorcolumn=80 ctermbg=magenta
" background warning one char
highlight ColorColumn ctermbg=magenta
call matchadd('ColorColumn', '\%81v', 100)
if exists('+colorcolumn')
  set colorcolumn=79
else
  au BufWinEnter * let w:m2=matchadd('ErrorMsg', '\%>80v.\+', -1)
endif
" --mark all char overlength
"highlight OverLength ctermbg=red ctermfg=white guibg=#592929
"match OverLength /\%81v.\+/

"automatic folding
" use zo to open a fold
" use zc to close it
" use zf to manually fold a selection
"et foldmethod=syntax

"see 8 lines above a below the current one
set scrolloff=8

"auto reindent all file using <F7>
map <F7> mzgg=G`z


set guifont=Monospace:h30

ia mainst int main(void)
ia definest #ifndefine#define#endif
