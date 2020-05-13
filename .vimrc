lua package.loaded['lazygit'] = nil

set nocompatible              " be iMproved, required
filetype off                  " required

if empty(glob('~/.local/share/nvim/site/autoload/plug.vim'))
  silent !curl -fLo ~/.local/share/nvim/site/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif
"
" Specify a directory for plugins
" - For Neovim:
" - Avoid using standard Vim directory names like 'plugin'
call plug#begin('~/.local/share/nvim/plugged')

""""                                                                  | " ### vim integration with external tools
Plug 'junegunn/fzf'                                                   | " main fzf
Plug 'junegunn/fzf.vim'                                               | " fuzzy finding plugin
Plug 'itchyny/calendar.vim'                                           | " calendar application
Plug 'glacambre/firenvim', { 'do': function('firenvim#install') }     | " turn your browser into a Neovim client.
Plug 'Lokaltog/neoranger'                                             | " neoranger is a simple ranger wrapper script for neovim.
Plug 'kassio/neoterm'                                                 | " use the same terminal for everything. The main reason for this plugin is to reuse the terminal easily.
Plug 'wincent/terminus'                                               | " terminal integration improvements
""""                                                                  | " ### git
Plug 'tyru/open-browser.vim'                                          | " opens url in browser
Plug 'tyru/open-browser-unicode.vim'                                  | " opens current character or unicode in browser
Plug 'tyru/open-browser-github.vim'                                   | " opens github repo or github issue in browser
Plug 'rhysd/git-messenger.vim'                                        | " reveal a hidden message from git under the cursor quickly
Plug 'tpope/vim-fugitive'                                             | " vim plugin for Git that is so awesome, it should be illegal
Plug 'tpope/vim-rhubarb'                                              | " vim plugin for github
Plug 'samoshkin/vim-mergetool'                                        | " Merge tool for git
Plug '~/gitrepos/lazygit.vim'                                         | " lazygit
""""                                                                  | " ### tmux
Plug 'edkolev/tmuxline.vim'                                           | " tmux statusline generator with support for powerline symbols and vim/airline/lightline statusline integration
Plug 'wellle/tmux-complete.vim'                                       | " insert mode completion of words in adjacent tmux panes
Plug 'tmux-plugins/vim-tmux'                                          | " vim plugin for editing .tmux.conf files
Plug 'christoomey/vim-tmux-navigator'                                 | " navigate seamlessly between vim and tmux splits using a consistent set of hotkeys
Plug 'tmux-plugins/vim-tmux-focus-events'                             | " focusGained and FocusLost autocommand events are not working in terminal vim. This plugin restores them when using vim inside Tmux
Plug 'jpalardy/vim-slime'                                             | " you can type text in a file, send it to a live REPL, and avoid having to reload all your code every time you make a change
Plug 'Vigemus/nvimux'                                                 | " allows neovim to work as a tmux replacement
""""                                                                  | " vim themes
Plug 'airblade/vim-gitgutter'                                         | " shows a git diff in the 'gutter' (sign column)
Plug 'vim-airline/vim-airline'                                        | " airline status bar
Plug 'vim-airline/vim-airline-themes'                                 | " official theme repository
Plug '~/gitrepos/vim-one'                                             | " light and dark vim colorscheme
""""                                                                  | " ### vim extensions features
Plug 'liuchengxu/vim-which-key'                                       | " remember which key does what
Plug 'bkad/CamelCaseMotion'                                           | " motions for inside camel case
Plug 'norcalli/nvim-colorizer.lua'                                    | " a high-performance color highlighter for Neovim which has no external dependencies
Plug 'machakann/vim-highlightedyank'                                  | " make the yanked region apparent!
Plug 'junegunn/vim-peekaboo'                                          | " extends double quote and at sign in normal mode and <CTRL-R> in insert mode so you can see the contents of the registers
Plug 'itchyny/vim-cursorword'                                         | " underlines the word under the cursor
Plug 'junegunn/vim-easy-align'                                        | " helps alignment
Plug 'godlygeek/tabular'                                              | " line up text
Plug 'tpope/vim-commentary'                                           | " comment and uncomment stuff
Plug 'tpope/vim-unimpaired'                                           | " complementary pairs of mappings
Plug 'tpope/vim-surround'                                             | " all about surroundings: parentheses, brackets, quotes, XML tags, and more.
Plug 'tpope/vim-repeat'                                               | " repeat.vim remaps . in a way that plugins can tap into it.
Plug 'tpope/vim-tbone'                                                | " basic tmux support for vim
Plug 'tpope/vim-jdaddy'                                               | " mappings for working with json in vim
Plug 'tpope/vim-obsession'                                            | " no hassle vim sessions
Plug 'tpope/vim-speeddating'                                          | " Tools for working with dates
Plug 'dhruvasagar/vim-zoom'                                           | " toggle zoom of current window within the current tab
Plug 'kana/vim-niceblock'                                             | " makes blockwise Visual mode more useful and intuitive
Plug 'mbbill/undotree'                                                | " visualizes undo history and makes it easier to browse and switch between different undo branches
Plug 'reedes/vim-wordy'                                               | " uncover usage problems in your writing
Plug 'farmergreg/vim-lastplace'                                       | " intelligently reopen files at your last edit position
Plug 'ntpeters/vim-better-whitespace'                                 | " causes all trailing whitespace characters to be highlighted
Plug 'nathanaelkane/vim-indent-guides'                                | " displaying thin vertical lines at each indentation level for code indented with spaces
Plug 'jeffkreeftmeijer/vim-numbertoggle'                              | " numbertoggle switches to absolute line numbers (:set number norelativenumber) automatically when relative numbers don't make sense
Plug 'dhruvasagar/vim-table-mode'                                     | " automatic table creator & formatter allowing one to create neat tables as you type
Plug 'airblade/vim-rooter'                                            | " rooter changes the working directory to the project root when you open a file or directory
Plug 'joom/latex-unicoder.vim'                                        | " a plugin to type Unicode chars in Vim, using their LaTeX names
Plug 'editorconfig/editorconfig-vim'                                  | " editorconfig plugin for vim
Plug 'haya14busa/vim-asterisk'                                        | " asterisk.vim provides improved * motions.
Plug 'google/vim-searchindex'                                         | " this plugin shows how many times a search pattern occurs in the current buffer.
Plug 'ryanoasis/vim-devicons'                                         | " adds icons to plugins
Plug 'segeljakt/vim-isotope'                                          | " insert characters such as ˢᵘᵖᵉʳˢᶜʳⁱᵖᵗˢ, u͟n͟d͟e͟r͟l͟i͟n͟e͟, s̶t̶r̶i̶k̶e̶t̶h̶r̶o̶u̶g̶h̶, 𝐒𝐄𝐑𝐈𝐅-𝐁𝐎𝐋𝐃, 𝐒𝐄𝐑𝐈𝐅-𝐈𝐓𝐀𝐋𝐈𝐂, 𝔉ℜ𝔄𝔎𝔗𝔘ℜ, 𝔻𝕆𝕌𝔹𝕃𝔼-𝕊𝕋ℝ𝕌ℂ𝕂, ᴙƎVƎᴙꙄƎD, INΛƎᴚ⊥Ǝᗡ, ⒸⒾⓇⒸⓁⒺⒹ,
Plug 'pbrisbin/vim-mkdir'                                             | " automatically create any non-existent directories before writing the buffer
Plug 'kshenoy/vim-signature'                                          | " toggle display and navigate marks
Plug 'Yilin-Yang/vim-markbar'                                         | " sidebar that shows every mark
Plug 'wellle/targets.vim'                                             | " Move text objects
Plug 'sedm0784/vim-you-autocorrect'                                   | " Automatic autocorrect
""""                                                                  | " ### vim programming language features
Plug 'neovim/nvim-lsp'                                                | " neovim built in lsp
Plug 'vim-vdebug/vdebug'                                              | " Debugging, loaded manually
Plug 'roxma/nvim-yarp'                                                | " yet another remote plugin framework for neovim
Plug 'raimon49/requirements.txt.vim', {'for': 'requirements'}         | " vim-plug with on-demand support for the Requirements File Format syntax for vim
Plug 'Vimjas/vim-python-pep8-indent'                                  | " a nicer Python indentation style for vim
Plug 'rust-lang/rust.vim'                                             | " rust file detection, syntax highlighting, formatting, Syntastic integration, and more
Plug 'JuliaEditorSupport/julia-vim'                                   | " julia support for vim
Plug 'kdheepak/gridlabd.vim'                                          | " gridlabd syntax support
Plug 'zah/nim.vim'                                                    | " syntax highlighting auto indent for nim in vim
Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }         | " dark powered asynchronous completion framework for neovim/Vim8
Plug 'ncm2/float-preview.nvim'                                        | " completion preview window based on neovim's floating window
Plug 'gpanders/vim-medieval'                                          | " evaluate markdown code blocks within vim
Plug '~/gitrepos/JuliaFormatter.vim'                                  | " formatter for Julia
Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app & yarn install'} | " Markdown preview
Plug 'inkarkat/vim-ingo-library'                                      | " Spellcheck dependency
Plug 'inkarkat/vim-spellcheck'                                        | " Spelling errors to quickfix list
Plug 'prettier/vim-prettier', {
  \ 'do': 'yarn install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'python',
    \ 'html', ] }

" Initialize plugin system
call plug#end()

filetype plugin indent on    " required

syntax enable | " enable syntax processing

set encoding=utf-8      | " Default file encoding
set fileencoding=utf-8  | " Default file encoding
set fileencodings=utf-8 | " Default file encoding
set noautochdir         | " Don't change dirs automatically
set noerrorbells        | " No sound
set hidden              | " Make buffers hidden then abandoned

set tabstop=4                    | " Number of spaces a <Tab> is
set softtabstop=4                | " Fine tunes the amount of white space to be added
set shiftwidth=4                 | " Number of spaces for indentation
set expandtab                    | " Expand tab to spaces
set spelllang=en                 | " Spell checking
set timeoutlen=500               | " Wait less time for mapped sequences
set smarttab                     | " <Tab> in front of line inserts blanks according to shiftwidth
set autoindent                   | " copy indent from current line
set smartindent                  | " do smart indenting when starting a new line
" set backspace=indent,eol,start | "allow backspacing over autoindent, line breaks, the start of insert

let &showbreak='↳ ' | " string to put at the start of lines that have been wrapped
set breakindent     | " every wrapped line will continue visually indented
set linebreak       | " wrap long lines at a character in breakat
set wrap            | " lines longer than the width of the window will wrap
set showcmd         | " display an incomplete command in the lower right of the vim window

let g:one_allow_italics = 1              | " I love italic for comments
set termguicolors                        | " enables 24bit colors
set background=light                     | " for the light version
colorscheme one                          | " sets theme to one
set novisualbell                         | " don't display visual bell
set noshowmode                           | " don't show mode changes
let &colorcolumn=121                     | " add indicator for 120
set display+=lastline                    | " as much as possible of the last line in a window will be displayed
set diffopt+=vertical                    | " Always use vertical diffs
set laststatus=2                         | " show status at the bottom
set number relativenumber                | " use line numbers and relative line numn
set cursorline                           | " highlight current line
set showcmd                              | " show command in bottom bar
set showmatch                            | " highlight matching [{()}]
set lazyredraw                           | " redraw only when we need to.
set ignorecase                           | " Ignore case when searching
set smartcase                            | " When searching try to be smart about cases
set incsearch                            | " search as characters are entered
set hlsearch                             | " highlight matches
set inccommand=split                     | " live search and replace
set wildmenu                             | " visual autocomplete for command menu
set autoread                             | " automatically read files that have been changed outside of vim
set nobackup                             | " no backup before overwriting a file
set nowritebackup                        | " no backups when writing a file
set autowrite                            | " Automatically :write before running commands
set list listchars=tab:»·,trail:·,nbsp:· | " Display extra whitespace
set mouse=a                              | " Enables mouse support
set nofoldenable                         | " disable folding
set signcolumn=yes                       | " Always show git gutter / sign column
set scrolloff=20                         | " Minimal number of lines to keep above and below the cursor
set nojoinspaces                         | " Use one space, not two, after punctuation
set splitright                           | " split windows right
set splitbelow                           | " split windows below
set viminfo+=n~/.config/nvim/viminfo     | " viminfo file
set virtualedit+=all                     | " allow virtual editing in all modes
set nomodeline                           | " no lines are checked for set commands
set grepprg=rg\ --vimgrep                | " use ripgrep
set redrawtime=10000                     | " set higher redrawtime so that vim does not hang on difficult syntax highlighting
set updatetime=100                       | " set lower updatetime so that vim git gutter updates sooner
set cmdheight=1                          | " default space for displaying messages
set completeopt=menuone    " Use the popup menu also when there is only one match.
set completeopt+=noinsert  " Do not insert any text for a match until the user selects a match from the menu.
set completeopt+=noselect  " Do not select a match in the menu, force the user to select one from the menu.
set completeopt-=preview   " Remove extra information about the currently selected completion in the preview window.
                           " Only works in combination with "menu" or "menuone".
set shortmess+=c   " Shut off completion messages
set shortmess+=I   " no intro message
" set noswapfile                         | " Don't write .swp files

if has("persistent_undo")
    set undodir=~/.local/share/nvim/undo//
    set backupdir=~/.local/share/nvim/backup//
    set directory=~/.local/share/nvim/swap//
    set undofile
endif

" Ensure comments don't go to beginning of line by default
autocmd! FileType vim,python setl nosmartindent
" Disable autocomment
autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
" resize panes when host window is resized
autocmd VimResized * wincmd =

" jsonc comment syntax highlighting
autocmd FileType json syntax match Comment +\/\/.\+$+
" disable indent line plugin for json
" autocmd Filetype json :IndentLinesDisable

" autocmd BufEnter,BufWinEnter,WinEnter term://* startinsert
" autocmd BufLeave term://* stopinsert

autocmd TermOpen * setlocal nonumber
autocmd TermOpen * setlocal norelativenumber
autocmd TermOpen term://* startinsert
autocmd TermOpen * let g:last_terminal_job_id = b:terminal_job_id | IndentGuidesDisable
autocmd BufWinEnter term://* startinsert | IndentGuidesDisable

" Use :wq or :x instead of :w | bd for git commit messages when using nvr
autocmd FileType gitcommit,gitrebase,gitconfig set bufhidden=delete

" remove highlight on the cursorline when moving out of the window
augroup BgHighlight
    autocmd!
    autocmd WinEnter * set cursorline
    autocmd WinLeave * set nocursorline
augroup END

autocmd BufEnter * EnableStripWhitespaceOnSave
let g:strip_whitespace_confirm=0

" autocmd! BufWritePost * make

" vim-airline
let g:airline_theme = 'one'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#branch#enabled = 1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tagbar#enabled = 1
let g:airline#extensions#virtualenv#enabled = 1
" let g:airline_skip_empty_sections = 1 " causes json to crash
let g:airline_section_c = '%<%F%m %#__accent_red#%{airline#util#wrap(airline#parts#readonly(),0)}%#__restore__#' " display the full filename for all files

let g:airline#extensions#tabline#left_sep = ''
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'unique_tail'

" air-line
" let g:airline_powerline_fonts = 1

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif

" unicode symbols
let g:airline_left_sep = '»'
let g:airline_left_sep = '▶'
let g:airline_right_sep = '«'
let g:airline_right_sep = '◀'
let g:airline_symbols.linenr = '␊'
let g:airline_symbols.linenr = '␤'
let g:airline_symbols.linenr = '¶'
let g:airline_symbols.branch = '⎇'
let g:airline_symbols.paste = 'ρ'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.paste = '∥'
let g:airline_symbols.whitespace = 'Ξ'

" airline symbols
let g:airline_left_sep = ''
let g:airline_left_alt_sep = ''
let g:airline_right_sep = ''
let g:airline_right_alt_sep = ''
let g:airline_symbols.branch = ''
let g:airline_symbols.readonly = ''
let g:airline_symbols.linenr = ''

let g:VtrStripLeadingWhitespace = 0
let g:VtrClearEmptyLines = 0
let g:VtrAppendNewline = 1

let g:autoformat_autoindent = 0
let g:autoformat_retab = 0
let g:autoformat_remove_trailing_spaces = 0

" vim-markdown
let g:vim_markdown_conceal = 0
let g:vim_markdown_emphasis_multiline = 0
let g:vim_markdown_folding_disabled = 1

" vim gitgutter
let g:gitgutter_override_sign_column_highlight = 1

let g:gitgutter_sign_added = '▎'
let g:gitgutter_sign_modified = '▎'
let g:gitgutter_sign_removed = '▏'
let g:gitgutter_sign_removed_first_line = '▔'
let g:gitgutter_sign_modified_removed = '▋'

let g:latex_to_unicode_auto = 1
let g:latex_to_unicode_tab = 0
let g:latex_to_unicode_cmd_mapping = ['<C-J>']

" TODO: add shortcut to transform string
let g:unicoder_cancel_normal = 1
let g:unicoder_cancel_insert = 1
let g:unicoder_cancel_visual = 1
let g:unicoder_no_map = 1

" 'Yggdroot/indentLine'
let g:indentLine_char_list = ['|', '¦', '┆', '┊']

let mapleader = " "      | " Map leader to space
let maplocalleader = " " | " Map localleader to space

" Markdown Preview
" Don't start markdown preview automatically, use :MarkdownPreview
let g:mkdp_auto_start = 0

" Merge Tool
" 3-way merge
let g:mergetool_layout = 'bmr'
let g:mergetool_prefer_revision = 'local'

" Camelcase Motion
" Sets up within word motions to use ,
let g:camelcasemotion_key = ','

" Indent Guides {{{
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_guide_size = 1
let g:indent_guides_start_level = 2
let g:indent_guides_color_change_percent = 1
let g:indent_guides_exclude_filetypes = ['help', 'fzf', 'openterm', 'neoterm', 'calendar']

" Use virtual replace mode all the time
nnoremap r gr
nnoremap R gR

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" visual shifting (does not exit Visual mode)
vnoremap < <gv
vnoremap > >gv
nnoremap > >>_
nnoremap < <<_

" Use tab for indenting in visual mode
vnoremap <Tab> >gv
vnoremap <S-Tab> <gv

" highlight last inserted text
nnoremap gV `[v`]

" move vertically by visual line
nnoremap j gj
nnoremap k gk

" move vertically by actual line
nnoremap J j
nnoremap K k
nnoremap H ^
nnoremap L $

"" Move visual block
vnoremap J :m '>+1<CR>gv=gv
vnoremap K :m '<-2<CR>gv=gv

" copy to the end of line
nnoremap Y y$

" allow W, Q to be used instead of w and q
command! W w
command! -bang Q q
command! -bang Qa qa

" " Tabs
" nnoremap <Tab> :bn<CR>
" nnoremap <S-Tab> :bp<CR>

" kakoune like mapping
noremap gj G
noremap gk gg
noremap gh ^
noremap gl $

" Macros
nnoremap Q @@
vnoremap Q :norm @@<CR>

" Select last paste
nnoremap <expr> gp '`['.strpart(getregtype(), 0, 1).'`]'

function! ExecuteMacroOverVisualRange()
  echo "@".getcmdline()
  execute ":'<,'>normal @".nr2char(getchar())
endfunction

xnoremap @ :<C-u>call ExecuteMacroOverVisualRange()<CR>

" redo
nnoremap U <C-R>

" Buffers

" Display an error message.
function! s:Warn(msg)
  echohl ErrorMsg
  echomsg a:msg
  echohl NONE
endfunction

" Repurpose cursor keys
nnoremap <silent> <Up> :cprevious<CR>
nnoremap <silent> <Down> :cnext<CR>
nnoremap <silent> <Left> :cpfile<CR>
nnoremap <silent> <Right> :cnfile<CR>

nmap <silent> tt :tabnew<CR>
nmap <silent> [g :tabprevious<CR>
nmap <silent> ]g :tabnext<CR>
nmap <silent> [G :tabrewind<CR>
nmap <silent> ]G :tablast<CR>

" delete buffer
" works nicely in terminal mode as well
nnoremap <silent> <C-d><C-d> :confirm bdelete<CR>

function s:AddTerminalNavigation()

    echom &filetype
    if &filetype ==# ''
        tnoremap <buffer> <silent> <c-h> <c-\><c-n>:TmuxNavigateLeft<cr>
        tnoremap <buffer> <silent> <c-j> <c-\><c-n>:TmuxNavigateDown<cr>
        tnoremap <buffer> <silent> <c-k> <c-\><c-n>:TmuxNavigateUp<cr>
        tnoremap <buffer> <silent> <c-l> <c-\><c-n>:TmuxNavigateRight<cr>
    endif

endfunction

augroup TerminalNavigation
    autocmd!
    autocmd TermEnter * call s:AddTerminalNavigation()
augroup END

let g:fzf_preview_floating_window_winblend = 5
let g:fzf_preview_command = 'bat --theme=OneHalfLight --color=always --style=grid {-1}'
let g:fzf_preview_lines_command = 'bat --color=always --style=grid --theme=OneHalfLight'
let g:fzf_preview_grep_preview_cmd = expand('~/.config/bat/bin/preview_fzf_grep')

" for setting ranger viewmode values
let g:neoranger_viewmode='miller' " supported values are ['multipane', 'miller']

" for setting any extra option passed to ranger params
let g:neoranger_opts='--cmd="set show_hidden true"' " this line makes ranger show hidden files by default
" tmuxline
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '%a',
      \'y'    : '%Y-%m-%d  %R',
      \'z'    : '#(~/.tmux/plugins/tmux-battery/scripts/battery_percentage.sh)'
\ }

let g:tmuxline_status_justify = 'left'

" PromptlineSnapshot! ~/config/.promptline.sh airline<CR>

if has('nvim') && executable('nvr')
  " pip install neovim-remote
  let $GIT_EDITOR = "nvr -cc split --remote-wait +'set bufhidden=wipe'"
endif

let g:prettier#config#prose_wrap = 'always'

" vim-asterisk
map *  <Plug>(asterisk-z*)
map #  <Plug>(asterisk-z#)
map g* <Plug>(asterisk-gz*)
map g# <Plug>(asterisk-gz#)

let g:asterisk#keeppos = 1

let g:medieval_langs = ['python=python3', 'julia', 'sh', 'console=bash']
nnoremap <buffer> Z! :<C-U>EvalBlock<CR>
let g:slime_target = "neovim"

" automatically enable table mode when using || or __
function! s:isAtStartOfLine(mapping)
    let text_before_cursor = getline('.')[0 : col('.')-1]
    let mapping_pattern = '\V' . escape(a:mapping, '\')
    let comment_pattern = '\V' . escape(substitute(&l:commentstring, '%s.*$', '', ''), '\')
    return (text_before_cursor =~? '^' . ('\v(' . comment_pattern . '\v)?') . '\s*\v' . mapping_pattern . '\v$')
endfunction

inoreabbrev <expr> <bar><bar>
            \ <SID>isAtStartOfLine('\|\|') ?
            \ '<c-o>:TableModeEnable<CR><bar><space><bar><left><left>' : '<bar><bar>'
inoreabbrev <expr> __
            \ <SID>isAtStartOfLine('__') ?
            \ '<c-o>:silent! TableModeDisable<CR>' : '__'

let g:float_preview#docked = 0

" Help: Open a `help` page in a new tab, or replace the current buffer if it
" is unnamed and empty.
function! Help( query )
    " Is the current buffer empty?
    let l:empty = line( '$' ) ==# 1 && getline( 1 ) ==# ''
    " Store the current tab number so we can close it later if need be.
    let l:tabnr = tabpagenr()
    let l:bufname = bufname( winbufnr( 0 ) )
    try
        " Open the help page in a new tab. (or bail if it's not found)
        execute "tab help " . a:query
        " The help page opened successfully. Close the original tab if it's empty.
        if l:bufname ==# '' && l:empty
            execute "tabclose " . l:tabnr
        endif
    endtry
endfunction

command! -nargs=1 Help call Help( <f-args> )

"""""""""""""""""""""""""""""""""""""""" lsp

"""""""""""""""""""""""""""""""""""""""" fzf

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9, 'highlight': 'Todo', 'border': 'sharp' } }
let g:fzf_buffers_jump = 1
let g:fzf_command_prefix = 'Fzf'

" Path completion with custom source command
inoremap <expr> <c-x><c-f> fzf#vim#complete#path('rg --files')
" Word completion with custom spec with popup layout option
inoremap <expr> <c-x><c-k> fzf#vim#complete#word({'window': { 'width': 0.2, 'height': 0.9, 'xoffset': 1 }})

" Insert mode completion
imap <c-x><c-k> <Plug>(fzf-complete-word)
imap <c-x><c-f> <Plug>(fzf-complete-path)
imap <c-x><c-l> <Plug>(fzf-complete-line)

"""""""""""""""""""""""""""""""""""""""" which key

if !exists('g:which_key_map') | let g:which_key_map = {} | endif

"""""""""""""""""""""""""""""""""""""""" leader mappings

call which_key#register("<space>", "g:which_key_map")

" Map leader to which_key
nnoremap <silent> <leader> :silent WhichKey '<Space>'<CR>
vnoremap <silent> <leader> :silent <c-u> :silent WhichKeyVisual '<Space>'<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" Clear highlighting
nnoremap <leader><leader> :nohl<CR>:delmarks! \| delmarks a-zA-Z0-9<CR><ESC>

command! -nargs=0 Fzf call Help( <f-args> )

" fzf selecting mappings
nmap <leader>? :FzfMaps<CR>
let g:which_key_map['?'] = 'fzf-find-mappings'

nmap <Leader>m <Plug>ToggleMarkbar
let g:which_key_map.m = 'toggle-markbar'

" Split terminal
nnoremap <silent> <leader>\ :vsplit\|wincmd l\|terminal<CR>
let g:which_key_map['\'] = 'split-horizontal-terminal'

nnoremap <silent> <leader>/ :split\|wincmd l\|terminal<CR>
let g:which_key_map['/' ]= 'split-vertical-terminal'

vnoremap <leader>y "+y
let g:which_key_map.y = 'copy-to-clipboard'

vnoremap <leader>d "+ygvd
let g:which_key_map.d = 'cut-to-clipboard'

nnoremap <leader>p "+p<CR>
vnoremap <leader>p "+p<CR>
let g:which_key_map.p = 'paste-from-clipboard'

nnoremap <leader>P "+P<CR>
vnoremap <leader>P "+P<CR>
let g:which_key_map.P = 'paste-from-clipboard'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.w = { 'name': '+windows' }

nnoremap <silent> <leader>ww <C-W>w<CR>
let g:which_key_map.w.w = 'other-window'

nnoremap <silent> <leader>wc :close<CR>
let g:which_key_map.w.c = 'delete-window'

nnoremap <silent> <leader>w/ :split<CR>
let g:which_key_map.w['/'] = 'split-window-below'

nnoremap <silent> <leader>w\ :vsplit<CR>
let g:which_key_map.w['\'] = 'split-window-right'

nnoremap <silent> <leader>wh <C-w>h
let g:which_key_map.w.h = 'window-left'

nnoremap <silent> <leader>wj <C-w>j
let g:which_key_map.w.j = 'window-below'

nnoremap <silent> <leader>wl <C-w>l
let g:which_key_map.w.l = 'window-right'

nnoremap <silent> <leader>wk <C-w>k
let g:which_key_map.w.k = 'window-up'

nnoremap <silent> <leader>wH <C-w>H
let g:which_key_map.w.H = 'move-window-left'

nnoremap <silent> <leader>wJ <C-w>J
let g:which_key_map.w.J = 'move-window-bottom'

nnoremap <silent> <leader>wL <C-w>L
let g:which_key_map.w.L = 'move-window-right'

nnoremap <silent> <leader>wK <C-w>K
let g:which_key_map.w.K = 'move-window-top'

nnoremap <silent> <leader>wo :only<CR>
let g:which_key_map.w.o = 'maximize-window'

nnoremap <silent> <leader>w= <C-w>=
let g:which_key_map.w['='] = 'balance-window'

nnoremap <silent> <leader>wp :wincmd P<CR>
let g:which_key_map.w.p = 'preview-window'

nnoremap <silent> <leader>wz :wincmd z<CR>
let g:which_key_map.w.z = 'quickfix-window'

nnoremap <silent> <leader>w? :FzfWindows<CR>
let g:which_key_map.w['?'] = 'fzf-window'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.o = { 'name': '+open' }

nnoremap <silent> <leader>oq  :copen<CR>
let g:which_key_map.o.q = 'open-quickfix'

nnoremap <silent> <leader>ol  :lopen<CR>
let g:which_key_map.o.l = 'open-locationlist'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" reformat paragraph

let g:which_key_map.q = { 'name': '+format' }
nnoremap <leader>qt :Tabularize<CR>
nnoremap <leader>qt :Tabularize<CR>
nnoremap <leader>qjf :<C-u>call JuliaFormatter#Format(0)<CR>
vnoremap <leader>qjf :<C-u>call JuliaFormatter#Format(1)<CR>

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.v = { 'name': '+vim' }

nnoremap <silent> <leader>ve :e $MYVIMRC<CR>
let g:which_key_map.v.e = 'edit-vimrc'

nnoremap <silent> <leader>vs :source $MYVIMRC<CR>
let g:which_key_map.v.s = 'source-vimrc'

nnoremap <silent> <leader>vl :luafile %<CR>
let g:which_key_map.v.l = 'source-luafile'

nnoremap <silent> <leader>vz :e ~/.zshrc<CR>
let g:which_key_map.v.z = 'open-zshrc'

nnoremap <silent> <leader>v- :RangerCurrentFile<CR>
let g:which_key_map.v['-'] = 'ranger-current-file'

nnoremap <silent> <leader>v= :terminal<CR>
let g:which_key_map.v['='] = 'terminal-current-buffer'

nnoremap          <leader>v. :cd %:p:h<CR>:pwd<CR>
let g:which_key_map.v['.'] = 'set-current-working-directory'

nnoremap <leader>vx <Plug>(openbrowser-open)
vnoremap <leader>vx <Plug>(openbrowser-open)
let g:which_key_map.v.x = 'open-link-in-browser'

nnoremap <leader>vu :UndotreeToggle<CR>
let g:which_key_map.v.u = 'open-undo-tree'

nnoremap <leader>vz <Plug>(zoom-toggle)
let g:which_key_map.v.z = 'zoom-toggle'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.g = { 'name': '+git' }

"" Git
noremap <leader>gw :Gwrite<CR>
let g:which_key_map.g.w = 'git-write'

noremap <leader>gs :LazyGit<CR>
let g:which_key_map.g.s = 'git-status'

noremap <leader>gc :Gcommit<CR>
let g:which_key_map.g.c = 'git-commit'

noremap <leader>gp :Gpush<CR>
let g:which_key_map.g.p = 'git-push'

noremap <leader>gP :Gpull<CR>
let g:which_key_map.g.P = 'git-pull'

noremap <leader>gb :Gblame<CR>
let g:which_key_map.g.b = 'git-blame'

noremap <leader>gd :Gvdiff<CR>
let g:which_key_map.g.d = 'git-diff'

noremap <leader>gr :Gremove<CR>
let g:which_key_map.g.r = 'git-remove'

noremap <leader>gl ]c
let g:which_key_map.g.l = 'git-next-hunk'

noremap <leader>gh [c
let g:which_key_map.g.h = 'git-prev-hunk'

noremap <leader>g? :FzfCommits<CR>
let g:which_key_map.g['?'] = 'fzf-git-commit-log'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.b = { 'name': '+buffer' }

nnoremap <silent> <leader>bd :confirm bdelete<CR>
let g:which_key_map.b.d = 'buffer-delete'

nnoremap <silent> <leader>bw :write<CR>
let g:which_key_map.b.w = 'buffer-write'

nnoremap <silent> <leader>bl :bnext<CR>
let g:which_key_map.b.l = 'buffer-next'

nnoremap <silent> <leader>bh :bprev<CR>
let g:which_key_map.b.h = 'buffer-previous'

nnoremap <silent> <leader>bq :copen<CR>
let g:which_key_map.b.q = 'buffer-quickfix-open'

nnoremap <silent> <leader>bQ :cclose<CR>
let g:which_key_map.b.q = 'buffer-quickfix-close'

nnoremap <silent> <leader>b? :FzfBuffers<CR>
let g:which_key_map.b['?'] = 'fzf-buffer-all'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""

let g:which_key_map.f = { 'name': '+find' }

nnoremap <silent> <leader>fs :<c-u>FzfRg <C-r>=expand("<cword>")<CR><CR>
xnoremap          <leader>fs "sy:FzfRg<Space><C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR><CR>
let g:which_key_map.f.s = 'find-in-files'

nnoremap <silent> <leader>f* :<c-u>FzfLines <C-r>=expand("<cword>")<CR><CR>
let g:which_key_map.f['*'] = 'find-in-current-file'

nnoremap <silent> <leader>fb :<c-u>FzfBuffers<CR>
let g:which_key_map.f.b = 'find-buffers'

nnoremap <silent> <leader>fc :<c-u>FzfCommits<CR>
let g:which_key_map.f.c = 'find-commits'

nnoremap <silent> <leader>ff :<c-u>FzfFiles<CR>
let g:which_key_map.f.f = 'find-files'

nnoremap <silent> <leader>fh :<c-u>FzfHistory<CR>
let g:which_key_map.f.h = 'find-history'

nnoremap <silent> <leader>fm :<c-u>FzfMarks<CR>
let g:which_key_map.f.m = 'find-marks'

nnoremap <silent> <leader>ft :<c-u>FzfTags<CR>
let g:which_key_map.f.t = 'find-marks'

""""""""""""""""""""""""""""""""""""""""""""""""""""""""
