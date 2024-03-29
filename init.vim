let mapleader = ","
let maplocalleader = "\\"
" https://github.com/fannheyward/coc-pyright/issues/600 Getting error Unknown function: coc#util#echo_line #600
"
"Cntl-W J = bottom, L = right

" Specify a directory for plugins
call plug#begin('~/.local/share/nvim/site/plugged')
"Plug 'neoclide/coc.nvim', {'commit': 'e7d5d35980868fc0a9dd1eb30f1165c111346e60'}           " do CocInstall coc-metals, coc-python
Plug 'github/copilot.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}          
" do CocInstall coc-metals, coc-python
Plug 'yelled1/coc-python', {'do': 'yarn install --frozen-lockfile'}
Plug 'joshdick/onedark.vim'                              " Color Theme 
Plug 'liuchengxu/vista.vim'                              " Show cTags
Plug 'itchyny/lightline.vim'                             " status tabline bottom
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'tiagofumo/vim-nerdtree-syntax-highlight'
Plug 'ryanoasis/vim-devicons'                            " adds icons in nerdtree 
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'                                " fuzzy find files
Plug 'scrooloose/nerdcommenter'
"Plug 'tsony-tsonev/nerdtree-git-plugin'
"Plug 'numirias/semshi', {'do': ':UpdateRemotePlugins'}   " py syntax highlight
"Plug 'prettier/vim-prettier', { 'do': 'yarn install' }
"Plug 'hkupty/iron.nvim',  {'branch': 'direct-invoke'}    " repl w/ fix #162
"Plug 'christoomey/vim-tmux-navigator'                   " interphere w/ NERDTreeToggle <c-\>
Plug 'morhetz/gruvbox'                                   " colorscheme that came w/ init.vim 
"Plug 'HerringtonDarkholme/yats.vim' " TypeScript Syntax
" Initialize plugin system
Plug 'rittelle/vim-repl'
call plug#end()

call coc#config('python', {'pythonPath': $PYENV_VIRTUAL_ENV})

set laststatus=2
  let g:lightline = {
    \ 'colorscheme': 'wombat',
    \ 'active': {
    \   'left': [ [ 'mode', 'paste' ],
    \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
    \ },
    \ 'component_function': {
    \   'cocstat': 'coc#status'
    \ },
    \ }
"\   'cocfunc': 'get(b:,\'coc_current_function\',\'\')',
" set runtimepath^=~/Prj/gitIt/coc-terminal " Make local work
"ignore files in nerdtree
let nerdtreeignore=['\.pyc$', '\~$','^node_modules$']
"map <c-w>t :NERDTreeToggle<cr>
map <C-\> :NERDTreeToggle<CR>

"inoremap jk <ESC>
"comments sections out by visual or by line 
vmap "" <plug>NERDCommenterToggle
nmap "" <plug>NERDCommenterToggle

" open NERDTree automatically
"autocmd StdinReadPre * let s:std_in=1
"autocmd VimEnter * NERDTree

let g:NERDTreeGitStatusWithFlags = 1
"let g:WebDevIconsUnicodeDecorateFolderNodes = 1
let g:NERDTreeGitStatusNodeColorization = 1


" vim-pEMR:/home/hadoop/xJarerettier
"let g:prettier#quickfix_enabled = 0
"let g:prettier#quickfix_auto_focus = 0
" prettier command for coc
"
"run prettier on save
"let g:prettier#autoformat = 0
"autocmd BufWritePre *.js,*.jsx,*.mjs,*.ts,*.tsx,*.css,*.less,*.scss,*.json,*.graphql,*.md,*.vue,*.yaml,*.html PrettierAsync

"command! -nargs=0 Prettier :CocCommand prettier.formatFile


" ctrlp
let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

" j/k will move virtual lines (lines that wrap)
noremap <silent> <expr> j (v:count == 0 ? 'gj' : 'j')
noremap <silent> <expr> k (v:count == 0 ? 'gk' : 'k')

":set number relativenumber
":augroup numbertoggle
":  autocmd!
":  autocmd BufEnter,FocusGained,InsertLeave * set relativenumber
":  autocmd BufLeave,FocusLost,InsertEnter   * set norelativenumber
":augroup END

"set smarttab
set cindent
set shiftwidth=2

au BufRead,BufNewFile *.scala   set expandtab
au BufRead,BufNewFile *.sc      set expandtab
au BufRead,BufNewFile *.py      set expandtab
au BufRead,BufNewFile *.c       set noexpandtab
au BufRead,BufNewFile *.h       set noexpandtab
au BufRead,BufNewFile Makefile* set noexpandtab

filetype on
filetype plugin indent on
au VimEnter,BufRead,BufNewFile *.jl set filetype=julia
au VimEnter,BufRead,BufNewFile *.scala set filetype=scala
au VimEnter,BufRead,BufNewFile *.sc set filetype=scala
au VimEnter,BufRead,BufNewFile *.py set filetype=python
"
au BufNewFile,BufRead *.py
    \ set tabstop=4 |
    \ set softtabstop=4 |
    \ set shiftwidth=4 |
    \ set textwidth=79 |
    \ set expandtab |
    \ set autoindent |
    \ set fileformat=unix

au BufNewFile,BufRead *.js,*.html,*.css,*.scala,*.sc,*.jl
    \ set tabstop=2 |
    \ set softtabstop=2 |
    \ set expandtab |
    \ set shiftwidth=2

"colorscheme gruvbox " this came with init.vim
syntax on
colorscheme onedark

" sync open file with NERDTree
" " Check if NERDTree is open or active
function! IsNERDTreeOpen()        
  return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction

" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
  if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
    NERDTreeFind
    wincmd p
  endif
endfunction

" Highlight currently open buffer in NERDTree : This cased 2 trees open
"autocmd BufEnter * call SyncTree()

"___ coc.nvim _________________________________________________________

"  \ 'coc-pyright', 
"  \ 'coc-python', 
let g:coc_global_extensions = [
  \ 'coc-snippets',
  \ 'coc-metals',
  \ 'coc-eslint', 
  \ 'coc-json', 
  \ ] " coc config
"  \ 'coc-prettier', 
"\ 'coc-pairs', "don't want
" from readme
" if hidden is not set, TextEdit might fail.
set hidden " Some servers have issues with backup files, see #649 set nobackup set nowritebackup 
" Better display for messages set cmdheight=2 " You will have bad experience for diagnostic messages when it's default 4000.
set updatetime=300

" don't give |ins-completion-menu| messages.
set shortmess+=c

" always show signcolumns
set signcolumn=yes

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

" Use `[g` and `]g` to navigate diagnostics
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Remap keys for gotos
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window
nnoremap <silent> K :call <SID>show_documentation()<CR>

" Used to expand decorations in worksheets
nmap <Leader>ws <Plug>(coc-metals-expand-decoration)

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

" Remap for rename current word
nmap <F2> <Plug>(coc-rename)

" Remap for format selected region
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)

augroup mygroup
  autocmd!
  " Setup formatexpr specified filetype(s).
  autocmd FileType typescript,json setl formatexpr=CocAction('formatSelected')
  " Update signature help on jump placeholder
  autocmd User CocJumpPlaceholder call CocActionAsync('showSignatureHelp')
augroup end

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)

" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)

" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)

" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python, coc-metals
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)

" Use `:Format` to format current buffer
command! -nargs=0 Format :call CocAction('format')

" Use `:Fold` to fold current buffer
command! -nargs=? Fold :call     CocAction('fold', <f-args>)

" use `:OR` for organize import of current buffer
command! -nargs=0 OR   :call     CocAction('runCommand', 'editor.action.organizeImport')

" Add status line support, for integration with other plugin, checkout `:h coc-status`
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>a  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

"_______________________________________________________________________

" Notify coc.nvim that <enter> has been pressed.
" Currently used for the formatOnType feature.
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
      \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" Toggle panel with Tree Views
nnoremap <silent> <space>t :<C-u>CocCommand metals.tvp<CR>
" Toggle Tree View 'metalsPackages'
nnoremap <silent> <space>tp :<C-u>CocCommand metals.tvp metalsPackages<CR>
" Toggle Tree View 'metalsCompile'
nnoremap <silent> <space>tc :<C-u>CocCommand metals.tvp metalsCompile<CR>
" Toggle Tree View 'metalsBuild'
nnoremap <silent> <space>tb :<C-u>CocCommand metals.tvp metalsBuild<CR>
" Reveal current current class (trait or object) in Tree View 'metalsPackages'
nnoremap <silent> <space>tf :<C-u>CocCommand metals.revealInTreeView metalsPackages<CR>

"_______________________________________________________________________

if has("win64")
  nnoremap <silent> <leader>te :e ~/AppData/Local/nvim/init.vim<CR>
else
  "nnoremapi <silent> <leader>te :e $XDG_CONFIG_HOME/nvim/init.vim<CR>
  nnoremap <silent> <leader>te :e $HOME/.config/nvim/init.vim<CR>
endif

"_______________________________________________________________________
let g:vista_default_executive = 'coc'
function! NearestMethodOrFunction() abort
    return get(b:, 'vista_nearest_method_or_function', '')
endfunction

set statusline+=%{NearestMethodOrFunction()}
autocmd VimEnter * call vista#RunForNearestMethodOrFunction()

"___ keyMaps for coc-python ____________________________________________
autocmd FileType json syntax match Comment +\/\/.\+$+ "Not sure this is from sillybun

"autocmd FileType python noremap <localleader>\ : CocCommand python.execSelectionInTerminal<Cr> 
"autocmd FileType python map <localleader>\ :<,'> CocCommand python.execSelectionInTerminal<Cr>
"autocmd FileType python nnoremap <localeader>r :CocCommand python.stopREPL<CR>
"autocmd FileType scala nnoremap <localleader>r :CocCommand python.<CR>

"":'<,'>CocCommand python.execSelectionInTerminal
autocmd FileType python nnoremap <leader>l :CocCommand python.upgradePythonLanguageServer<Cr>
autocmd FileType python nnoremap <leader>r :CocCommand python.startREPL<CR>
autocmd FileType python vmap <localleader>\ mY:CocCommand python.execSelectionInTerminal<Cr>'Yj
autocmd Filetype python imap <localleader>\ <Esc>0v$:CocCommand python.execSelectionInTerminal<Cr>j
autocmd Filetype python nmap <localleader>\ 0v$:CocCommand python.execSelectionInTerminal<Cr>j
autocmd FileType python vmap <S_CR> mY:CocCommand python.execSelectionInTerminal<Cr>'Yj
autocmd Filetype python imap <S_CR> <Esc>0v$:CocCommand python.execSelectionInTerminal<Cr>j
autocmd Filetype python nmap <S_CR> 0v$:CocCommand python.execSelectionInTerminal<Cr>j

let g:sendtorepl_invoke_key = '<localleader>\\'

"_______________________________________________________________________
" Repl.js in $VIMCONFIG/coc-extensions/

"let mill_rep = $HOME . '/bin/mill_repl.sh'
"let g:neoterm_repl_scala = $HOME . '/bin/mill_repl.sh' . ' console'
"autocmd FileType scala xmap <silent> <localleader>\ <Plug>(coc-repl-sendtext) 
autocmd FileType scala vmap <silent> <S-CR> mY:CocCommand repl.sendtext<CR>'Yj
autocmd Filetype scala imap <S-CR> <Esc>0v$:CocCommand repl.sendtext<CR>j
autocmd Filetype scala nmap <S-CR> 0v$:CocCommand repl.sendtext<CR>j

autocmd FileType scala vmap <silent> <localleader>\ m0:CocCommand repl.sendtext<CR>'0j
autocmd Filetype scala imap <localleader>\ <Esc>0v$:CocCommand repl.sendtext<CR>j
autocmd Filetype scala nmap <localleader>\ 0v$:CocCommand repl.sendtext<CR>j
autocmd FileType scala nnoremap <leader>r :CocCommand repl.openTerminal<CR>
autocmd FileType scala nnoremap <localleader>r :CocCommand repl.disposeTerminal<CR>

"___ keyMaps ___________________________________________________________
"(:h CTRL-W_w) lists both mappings as being equivalent.
noremap <C-w>+ :resize +10<CR>
noremap <C-w>- :resize -10<CR>
noremap <C-w>< :vertical:resize -5<CR>
noremap <C-w>> :vertical:resize +5<CR>

noremap <C-`> <C-W>w
inoremap <C-`> <C-O><C-W>w
tnoremap <C-`> <c-\><c-n><c-w><c-w>
" :echo 'Use Ctrl-W w :' . strftime('%c')<CR>
noremap  <c-x>o <Nop> 
tnoremap <c-x>o <Nop> 
inoremap <c-x>o <Nop> 
tnoremap <c-x>o <Nop>

"tnoremap <C-n> <C-w>N
"tnoremap <Esc> <C-\><C-n>
set mouse=a
tnoremap <Esc> <C-\><C-n><C-w><C-w> " To make sure one can getout of terminal after interacting
tnoremap <ScrollWheelUp> <C-w>Nk
tnoremap <ScrollWheelDown> <C-w>Nj
tnoremap <Middlemouse> :call coc#float#close_all()<CR>
