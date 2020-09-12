"""""OMNISHARP""""

Plug 'OmniSharp/omnisharp-vim'                         " coc-omnisharp does not yet have this fixed
Plug 'Shougo/echodoc.vim'

let g:OmniSharp_selector_ui = 'fzf'                  " Use fzf.vim
let g:OmniSharp_popup_options = {
      \ 'highlight': 'Normal',
      \ 'padding': [1],
      \ 'border': [1]
      \}
let g:OmniSharp_popup_mappings = {
      \ 'sigNext': '<C-n>',
      \ 'sigPrev': '<C-p>',
      \ 'lineDown': ['<C-e>', 'j'],
      \ 'lineUp': ['<C-y>', 'k']
      \}

Plug 'w0rp/ale'
Plug 'nickspoons/vim-sharpenup'

"let g:OmniSharp_popup_position = 'center'

" Possible solution to get vscode omnisharp extension
let g:OmniSharp_server_path = fnamemodify(findfile('run',$HOME . '/.vscode-insiders/extensions/*/.omnisharp/*/'),':p')

let g:ale_linters = {
  \ 'cs': ['OmniSharp']
\}

let g:ale_sign_error = '•'

let g:ale_sign_warning = '•'

let g:ale_sign_info = '·'

let g:ale_sign_style_error = '·'

let g:ale_sign_style_warning = '·'

augroup omnisharp_commands
  autocmd!

  " Show type information automatically when the cursor stops moving.
  " Note that the type is echoed to the Vim command line, and will overwrite
  " any other messages in this space including e.g. ALE linting messages.
  autocmd CursorHold *.cs OmniSharpTypeLookup

  " The following commands are contextual, based on the cursor position.
  autocmd FileType cs nmap <silent> <buffer> <Leader>cgd <Plug>(omnisharp_go_to_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cgh <Plug>(omnisharp_documentation)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cpd <Plug>(omnisharp_preview_definition)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cpi <Plug>(omnisharp_preview_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cfu<Plug>(omnisharp_find_usages)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cfi <Plug>(omnisharp_find_implementations)
  autocmd FileType cs nmap <silent> <buffer> <Leader>ct <Plug>(omnisharp_type_lookup)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cfs <Plug>(omnisharp_find_symbol)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cfu <Plug>(omnisharp_fix_usings)
  autocmd FileType cs nmap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)
  autocmd FileType cs imap <silent> <buffer> <C-\> <Plug>(omnisharp_signature_help)

  " Navigate up and down by method/property/field
  autocmd FileType cs nmap <silent> <buffer> [[ <Plug>(omnisharp_navigate_up)
  autocmd FileType cs nmap <silent> <buffer> ]] <Plug>(omnisharp_navigate_down)
  " Find all code errors/warnings for the current solution and populate the quickfix window
  autocmd FileType cs nmap <silent> <buffer> <Leader>cgcc <Plug>(omnisharp_global_code_check)
  " Contextual code actions (uses fzf, CtrlP or unite.vim when available)
  autocmd FileType cs nmap <silent> <buffer> <Leader>cca <Plug>(omnisharp_code_actions)
  autocmd FileType cs xmap <silent> <buffer> <Leader>cca <Plug>(omnisharp_code_actions)

  autocmd FileType cs nmap <silent> <buffer> <Leader>ccf <Plug>(omnisharp_code_format)

  autocmd FileType cs nmap <silent> <buffer> <Leader>cr <Plug>(omnisharp_rename)

  autocmd FileType cs nmap <silent> <buffer> <Leader>csr <Plug>(omnisharp_restart_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>css <Plug>(omnisharp_start_server)
  autocmd FileType cs nmap <silent> <buffer> <Leader>csx <Plug>(omnisharp_stop_server)
augroup END


set completeopt=longest,menuone,preview
set previewheight=5
