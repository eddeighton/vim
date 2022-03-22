
" Allow hidden buffers so can switch away from modified buffers
set hidden

set number

" Set 7 lines to the cursor - when moving vertically using j/k
set so=7

" Turn on the Wild menu
set wildmenu


set wildmode=list:longest

" Use spaces instead of tabs
set expandtab

" Be smart when using tabs ;)
set smarttab

" 1 tab == 4 spaces
set shiftwidth=4
set tabstop=4

set ai "Auto indent
set si "Smart indent

" Map the leader key to backslash - which is xmodmapped to capslock key
nnoremap '\' <nop>
let mapleader = '\' 

" reset search highlight using space
nnoremap <enter> <nop>
map <enter> :noh<enter>

nnoremap <space> <nop>
map <space> /

" remove the toolbar
" set guioptions-=T

" remove the menubar
" set guioptions-=m

" disable autoselect
" set guioptions-=a
" set guioptions-=P
" set guioptions-=A

" add tab pages
" set guioptions+=e

" use dark theme
set guioptions+=d

" enable left vertical scroll bar
set guioptions+=l

" enable right hand scroll bar
set guioptions+=r

" enable mouse
set mouse=a

" attempt to get clipboard working with OS
set clipboard=unnamed,unnamedplus

" bind ctrl-q to delete current buffer
map <leader>q :bd<CR>

" bind ctrl-s to save current buffer
" map <C-s> :w<CR>

map <leader>t :Fern . -drawer -toggle -reveal=% -width=41<CR>

function! s:init_fern() abort
  " Define NERDTree like mappings
  nmap <buffer> o <Plug>(fern-action-open:edit)
  nmap <buffer> go <Plug>(fern-action-open:edit)<C-w>p
  nmap <buffer> t <Plug>(fern-action-open:tabedit)
  nmap <buffer> T <Plug>(fern-action-open:tabedit)
  nmap <buffer> i <Plug>(fern-action-open:split)
  nmap <buffer> gi <Plug>(fern-action-open:split)<C-w>p
  nmap <buffer> s <Plug>(fern-action-open:vsplit)
  nmap <buffer> gs <Plug>(fern-action-open:vsplit)<C-w>p
  nmap <buffer> ma <Plug>(fern-action-new-path)

  nmap <buffer> C <Plug>(fern-action-enter)
  nmap <buffer> u <Plug>(fern-action-leave)
  nmap <buffer> r <Plug>(fern-action-reload)
  nmap <buffer> R<Plug>(fern-action-reload)<C-o>
  nmap <buffer> cd <Plug>(fern-action-cd)
  nmap <buffer> CD<Plug>(fern-action-cd)<C-o>

  nmap <buffer> I <Plug>(fern-action-hidden-toggle)

  nmap <buffer> q :<C-u>quit<CR>
endfunction

augroup fern-custom
  autocmd! *
  autocmd FileType fern call s:init_fern()
augroup END


" set the default ctrlp command to load most recently used files list
let g:ctrlp_cmd = 'CtrlPMRU :pwd'

" use ctrp in directory mode - use ctrl-t to set global cwd
" map <C-G> :CtrlPDir<CR>

" use ctrlp to select current buffer using mru stack of buffers
" map <leader><tab> :CtrlPBuffer<CR>
map <leader>\  :CtrlPBuffer<CR>

" prevent ctrlp from auto setting cwd
let g:ctrlp_working_path_mode = ""

" attempt to ignore files in ctrlp like git folders and binaries
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ }

" configure the match windows including increasing size to  40 by default and
" not specifying results: so that it syncs with max height
let g:ctrlp_match_window = 'bottom,order:btt,min:1,max:40'

" greatly limit search depth since want this for cwd selection
" while use fuzzy finder to actually load files
let g:ctrlp_max_depth = 40

" do not show .files or .directories in ctrlp
let g:ctrlp_show_hidden = 0

" enable caching - hopefully speeds up
let g:ctrlp_cache_dir = $HOME.'/.cache/ctrlp'

" enabled openning multiple files using ctrl-z to select
" and then ctrl-o to open.  r means open in current window
let g:ctrlp_open_multiple_files = 'ir'
let g:ctrlp_open_new_file = 'ir'

let g:ctrlp_prompt_mappings = {
    \ 'PrtBS()':              ['<bs>', '<c-]>'],
    \ 'PrtDelete()':          ['<c-del>'],
    \ 'PrtDeleteWord()':      ['<c-w>'],
    \ 'PrtClear()':           ['<c-u>'],
    \ 'PrtSelectMove("j")':   ['<c-j>', '<down>'],
    \ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
    \ 'PrtSelectMove("t")':   ['<Home>', '<kHome>'],
    \ 'PrtSelectMove("b")':   ['<End>', '<kEnd>'],
    \ 'PrtSelectMove("u")':   ['<PageUp>', '<kPageUp>'],
    \ 'PrtSelectMove("d")':   ['<PageDown>', '<kPageDown>'],
    \ 'PrtHistory(-1)':       ['<c-n>'],
    \ 'PrtHistory(1)':        ['<c-p>'],
    \ 'AcceptSelection("e")': ['<cr>', '<2-LeftMouse>','\'],
    \ 'AcceptSelection("h")': ['<c-x>', '<c-cr>', '<c-s>'],
    \ 'AcceptSelection("t")': ['<c-t>'],
    \ 'AcceptSelection("v")': ['<c-v>', '<RightMouse>'],
    \ 'ToggleFocus()':        ['<s-tab>'],
    \ 'ToggleRegex()':        ['<c-r>'],
    \ 'ToggleByFname()':      ['<c-d>'],
    \ 'ToggleType(1)':        ['<c-f>', '<c-up>'],
    \ 'ToggleType(-1)':       ['<c-b>', '<c-down>'],
    \ 'PrtExpandDir()':       ['<c-q>'],
    \ 'PrtInsert("c")':       ['<MiddleMouse>', '<insert>'],
    \ 'PrtInsert()':          ['<c-\>'],
    \ 'PrtCurStart()':        ['<c-a>'],
    \ 'PrtCurEnd()':          ['<c-e>'],
    \ 'PrtCurLeft()':         ['<c-h>', '<c-^>'],
    \ 'PrtCurRight()':        ['<c-l>'],
    \ 'PrtClearCache()':      ['<F5>'],
    \ 'PrtDeleteEnt()':       ['<del>'],
    \ 'CreateNewFile()':      ['<c-y>'],
    \ 'MarkToOpen()':         ['<left>'],
    \ 'OpenMulti()':          ['<right>'],
    \ 'PrtExit()':            ['<esc>', '<c-c>', '<c-g>'],
    \ }

" attempt to enable fullscreen gvim mode
"map <silent> <F11>
"\    :call system("wmctrl -ir " . v:windowid . " -b toggle,fullscreen")<CR>

" attempt to set wildignore
set wildignore+=*/.git/*

" Attempt to setup ripgrep as the default grep tool
if executable("rg")
  set grepprg=rg\ --vimgrep\ --smart-case\ --hidden
  set grepformat=%f:%l:%c:%m
endif

map <leader><n>    :cnext<CR>
map <leader><m>    :cprevious<CR>

map <leader>l      :set number!<CR>
map <leader><S-l>  :set relativenumber!<CR>

" switch back to previous buffer easily
" map <Tab>    :BufMRUNext<CR>
" map <S-Tab>  :BufMRUPrev<CR>
" map <home>   :BufMRUCommit<CR>

" map <C-S-tab> :tabprevious<CR>
" map <C-tab>   :tabnext<CR>
map <C-tab>       :bprev<CR>
map <C-S-tab>     :bnext<CR>

" map <tab> <cmd>Telescope buffers<cr>

" use nifty help command to show help in vertical split
command -nargs=* -complete=help Help vertical belowright help <args>
map <F1> :Help<CR>

" use easy to read large font
set guifont=Monospace\ 11

" launch fuzzy finder using ctrl-f
nmap <C-F> :FZF<CR>

" Get the title bar to display the current working directory
set title
" set titlestring=%{getcwd()}

"" AirLine stuff lightline
"let g:airline#extensions#tabline#enabled = 1
"" let g:airline_theme='jellybeans'
"let g:airline_inactive_collapse=1
"let g:airline#extensions#fern#enabled = 1
"let g:airline#extensions#fzf#enabled = 1
"let g:airline#extensions#quickfix#quickfix_text = 'Quickfix'
"let g:airline#extensions#quickfix#location_text = 'Location'
"let g:airline#extensions#tabline#show_tabs = 1
"let g:airline#extensions#tabline#formatter = 'jsformatter'
"let g:airline#extensions#tabline#fnamecollapse = 0 
"let g:airline#extensions#tabline#fnamemod = ':p:.'

" yoink
let g:yoinkIncludeDeleteOperations = 1

" s for substitute
" p for paste without old replacing register
nmap s <plug>(SubversiveSubstitute)
nmap ss <plug>(SubversiveSubstituteLine)
nmap S <plug>(SubversiveSubstituteToEndOfLine)
"nmap p <plug>(SubversiveSubstitute)
"nmap P <plug>(SubversiveSubstitute)

xmap s <plug>(SubversiveSubstitute)
xmap ss <plug>(SubversiveSubstituteLine)
xmap S <plug>(SubversiveSubstituteToEndOfLine)
"xmap p <plug>(SubversiveSubstitute)
"xmap P <plug>(SubversiveSubstitute)

let g:subversivePreserveCursorPosition = 1

" Telescope mappings
nnoremap <leader>f <cmd>Telescope find_files<cr>
nnoremap <leader>g <cmd>Telescope live_grep<cr>
nnoremap <leader>bb <cmd>Telescope buffers<cr>
nnoremap <leader>h <cmd>Telescope help_tags<cr>

call plug#begin()

Plug 'junegunn/vim-plug'
" Plug 'junegunn/vim-easy-align'

" Plug 'tpope/vim-fugitive'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

" Plug 'mildred/vim-bufmru'

Plug 'svermeulen/vim-cutlass'
Plug 'svermeulen/vim-yoink'
Plug 'svermeulen/vim-subversive'

Plug 'lambdalisue/fern.vim'
Plug 'lambdalisue/fern-git-status.vim'
Plug 'lambdalisue/glyph-palette.vim'
Plug 'lambdalisue/nerdfont.vim'
Plug 'lambdalisue/fern-renderer-nerdfont.vim'
" Plug 'lambdalisue/fern-hijack.vim'

Plug 'flazz/vim-colorschemes'

" Plug 'akinsho/bufferline.nvim'

Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'

Plug 'folke/which-key.nvim'

Plug 'kien/ctrlp.vim'

Plug 'jlanzarotta/bufexplorer'

Plug 'nvim-lualine/lualine.nvim'
Plug 'kyazdani42/nvim-web-devicons'

Plug 'akinsho/bufferline.nvim'

call plug#end()

" Set a colour scheme
color Benokai 

set cursorline
set cursorlineopt=number

