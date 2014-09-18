"CtrlP
let g:ctrlp_extensions            = ['tag']
let g:ctrlp_map                   = ',,'
let g:ctrlp_match_window_bottom   = 0
let g:ctrlp_match_window_reversed = 0
let g:ctrlp_user_command          = ['.git/', 'cd %s && git ls-files -co --exclude-standard']
let g:ctrlp_working_path_mode     = 'r'

"airline
let g:airline_theme              = 'powerlineish'
let g:airline_powerline_fonts    = 1
let g:airline_enable_branch      = 1
let g:airline_symbols            =  get(g:, 'airline_symbols', {})
let g:airline_left_sep           = '⮀'
let g:airline_left_alt_sep       = '⮁'
let g:airline_right_sep          = '⮂'
let g:airline_right_alt_sep      = '⮃'
let g:airline_symbols.branch     = '⭠'
let g:airline_symbols.readonly   = '⭤'
let g:airline_symbols.linenr     = '⭡'
let g:airline_symbols.linenr     = '¶'
let g:airline_symbols.whitespace = 'Ξ'
let g:airline_section_c          = '%F'

"ultsnips
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsSnippetDirectories  = ["snips"]