execute pathogen#infect()
syntax on
filetype plugin indent on

"noremap l h
"noremap ; l
"noremap h ;

imap jj <Esc>

" Tab switching curser in Vim split windows
nnoremap <tab> <C-w>
nnoremap <tab><tab> <C-w><C-w>

" Try to make Ctrl-O easier on Kinesis keyboard
":inoremap <Alt> <C>
":inoremap <Alt> <C>

:set tabstop=4
:set shiftwidth=4
:set expandtab

:set showcmd

set relativenumber
set number
set clipboard+=unnamedplus

"Set margin to 80 on certain file types, like .md
"au BufRead,BufNewFile *.md setlocal textwidth=80
:set formatoptions+=t
:set textwidth=80
:set wrapmargin=2
"Autofit text with gqG, gq}, or just gq on highlighted text in Vim

"autocmd BufNewFile,BufReadPost *.md set filetype=markdown

" Indent Python in the Google way.
:match ErrorMsg '\%>80v.\+'
au BufRead,BufNewFile *.py setlocal indentexpr=GetGooglePythonIndent(v:lnum)
let s:maxoff = 50 " maximum number of lines to look backwards.
function GetGooglePythonIndent(lnum)
  " Indent inside parens.
  " Align with the open paren unless it is at the end of the line.
  " E.g.
  "   open_paren_not_at_EOL(100,
  "                         (200,
  "                          300),
  "                         400)
  "   open_paren_at_EOL(
  "       100, 200, 300, 400)
  call cursor(a:lnum, 1)
  let [par_line, par_col] = searchpairpos('(\|{\|\[', '', ')\|}\|\]', 'bW',
        \ "line('.') < " . (a:lnum - s:maxoff) . " ? dummy :"
        \ . " synIDattr(synID(line('.'), col('.'), 1), 'name')"
        \ . " =~ '\\(Comment\\|String\\)$'")
  if par_line > 0
    call cursor(par_line, 1)
    if par_col != col("$") - 1
      return par_col
    endif
  endif
  " Delegate the rest to the original function.
  return GetPythonIndent(a:lnum)
endfunction

" Turn on HTML/CSS syntax highlighting in JS files
let g:javascript_enable_domhtmlcss = 1
" Turn on JS code folding
augroup jsfolding
  autocmd!
  autocmd FileType javascript setlocal foldenable|setlocal foldmethod=syntax
augroup END

" Save folds upon quit and auto load them on open
autocmd BufWinLeave *.* mkview
autocmd BufWinEnter *.* silent loadview
set viewoptions-=options

let pyindent_nested_paren="&sw-1"
let pyindent_open_paren="&sw-1"

let &colorcolumn=join(range(81,999),",")

"Powerline
let $PYTHONPATH='/usr/local/lib/python2.7'
python from powerline.vim import setup as powerline_setup
python powerline_setup()
python del powerline_setup
set laststatus=2
set t_Co=256
set guifont=Liberation\ Mono\ Powerline
let g:Powerline_symbols = 'fancy'
let g:airline_powerline_fonts = 1
if !exists('g:airline_symbols')
      let g:airline_symbols = {}
endif
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

syntax enable
let g:solarized_termtrans = 1
set background=dark
colorscheme solarized
