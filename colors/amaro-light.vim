highlight clear
if exists("syntax_on")
  syntax reset
endif

set background=light
set colorcolumn=80

let g:colors_name="amaro-light"

" colors {{{
let s:white = "#ffffff"
let s:dark_jungle_green = "#121714"
let s:dark_slate_gray = "#3f504e"
let s:light_gray = "#dbd1d1"
let s:spanish_gray = "#8d9190"
let s:medium_carmine = "b84c36"
let s:fire_opal = "#da5a40"
let s:illuminating_emerald = "#349378"
let s:mountain_meadow = "#45c29f"
let s:harvest_gold = "#d2943e"
let s:yellow_orange = "#fab14a"
let s:celadon_blue = "#3177a2"
let s:carolina_blue = "#429fd8"
let s:violet_crayola = "#a03f85"
let s:frostbite = "#d655b2 "
let s:verdigris = "#5bb0b0"
let s:medium_turquoise = "#71dada"
" }}}

"variables {{{
" fg color variables {{{
let s:foreground = s:dark_slate_gray
let s:foreground_alt = s:dark_jungle_green
let s:muted = s:spanish_gray
" }}}

" bg color variables {{{
let s:background = s:light_gray
let s:bg_barely_lighter = "#ff0000"
let s:bg_light = "#00ff00"
let s:bg_dark = "#0000ff"
" }}}

" syntax color variables {{{
let s:keyword = s:celadon_blue
let s:keyword_alt = s:carolina_blue
let s:string = s:illuminating_emerald
let s:string_alt = s:mountain_meadow
let s:accent_1 = s:harvest_gold
let s:accent_1_alt = s:yellow_orange
let s:accent_2 = s:medium_carmine
let s:accent_2_alt = s:fire_opal
let s:accent_3 = s:violet_crayola
let s:accent_3_alt = s:frostbite
let s:accent_4 = s:verdigris
let s:accent_4_alt = s:medium_turquoise
" }}}

" misc color variables {{{
let s:selected = s:bg_light
let s:invisibles = s:black
let s:alert = s:candy_pink
let s:warning = s:mellow_apricot
let s:success = s:mantis
let s:info = s:sky_blue_crayola
" }}}
" }}}

function! s:create_highlight(group, style)
  execute "highlight" a:group
    \ "guifg=" (has_key(a:style, "fg") ? a:style.fg : "NONE")
    \ "guibg=" (has_key(a:style, "bg") ? a:style.bg : "NONE")
    \ "guisp=" (has_key(a:style, "sp") ? a:style.sp : "NONE")
    \ "gui=" (has_key(a:style, "gui") ? a:style.gui : "NONE")
endfunction

" popup menu {{{
call s:create_highlight("Pmenu", { "fg": s:foreground,"bg": s:bg_dark })
call s:create_highlight("PmenuThumb", { "bg": s:muted })
call s:create_highlight("PmenuSBar", { "bg": s:bg_light })
call s:create_highlight("PmenuSel", { "fg": s:keyword_alt, "bg": s:bg_dark,"gui": "bold" })
" }}}

" spelling {{{
call s:create_highlight("SpellBad", { "sp": s:warning, "gui": "undercurl" })
hi! link SpellCap Normal
hi! link SpellRare Normal
hi! link SpellLocal Normal
" }}}

" editor {{{
call s:create_highlight("ColorColumn", { "bg": s:bg_barely_darker })
call s:create_highlight("MatchParen",  { "fg": s:background, "bg": s:muted })
call s:create_highlight("Visual", { "bg": s:selected })

call s:create_highlight("IncSearch", { "gui": "reverse" })
call s:create_highlight("Search", { "gui": "bold,underline" })
hi! link WildMenu IncSearch

call s:create_highlight("StatusLine", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("StatusLineNC", { "fg": s:muted })
call s:create_highlight("TabLine", { "fg": s:muted })
call s:create_highlight("TabLineSel", { "fg": s:foreground, "gui": "bold" })

call s:create_highlight("LineNr", { "fg": s:foreground_alt, "bg": s:bg_dark })
call s:create_highlight("CursorLine", { "bg": s:background })
call s:create_highlight("CursorLineNr", { "fg": s:accent_1_alt, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("VertSplit", { "fg": s:background, "bg": s:background })
call s:create_highlight("Folded", { "fg": s:accent_2, "bg": s:bg_barely_darker })
call s:create_highlight("FoldColumn", { "fg": s:accent_2,"bg": s:bg_dark })
" call s:create_highlight("SignColumn", { "fg": s:orange,"bg": s:red })
hi! link TabLineFill StatusLineNC
hi! link SignColumn LineNr

call s:create_highlight("Title", { "fg": s:accent_3_alt, "gui": "bold" })
call s:create_highlight("ErrorMsg", { "fg": s:alert })
call s:create_highlight("WarningMsg", { "fg": s:warning })
call s:create_highlight("MoreMsg", { "fg": s:info })
hi! link Question MoreMsg
hi! link ModeMsg MoreMsg

call s:create_highlight("QfError", { "fg": s:alert, "bg": s:bg_dark })

call s:create_highlight("DiffAdd", { "bg": s:success })
call s:create_highlight("DiffChange", { "bg": s:warning })
call s:create_highlight("DiffDelete", { "fg": s:alert })
call s:create_highlight("DiffText", { "bg": s:info })
" }}}

" NERDTree {{{
call s:create_highlight("Directory", { "fg": s:accent_3 })

call s:create_highlight("NERDTreeDirSlash", { "fg": s:accent_3_alt })
hi! link NERDTreeOpenable NERDTreeDirSlash
hi! link NERDTreeClosable NERDTreeDirSlash
" }}}

" general highlighting rules {{{
call s:create_highlight("Normal", { "fg": s:foreground, "bg": s:background })
call s:create_highlight("NonText", { "fg": s:invisibles })
hi! link SpecialKey NonText

call s:create_highlight("String", { "fg": s:string })
hi! link Character String

call s:create_highlight("Number", { "fg": s:accent_1 })
hi! link Float Number
hi! link Boolean Number
hi! link Constant Number

call s:create_highlight("Keyword", { "fg": s:keyword })
hi! link Statement Keyword
hi! link Conditional Keyword
hi! link Repeat Keyword
hi! link Label Keyword

call s:create_highlight("Exception", { "fg": s:accent_3_alt })
hi! link PreProc Exception

call s:create_highlight("Comment", { "fg": s:muted, "gui": "italic" })
hi! link SpecialComment Comment
hi! link Delimeter Comment

call s:create_highlight("Operator", { "fg": s:foreground_alt })
hi! link Special Operator

call s:create_highlight("Type", { "fg": s:accent_3 })
hi! link Function Type

call s:create_highlight("Todo", { "gui": "reverse" })

hi! link Identifier Normal
hi! link Underlined Normal
" }}}

" typescript {{{
call s:create_highlight("TypescriptImport", { "fg": s:accent_2 })
hi! link TypescriptExport TypescriptImport

call s:create_highlight("TypescriptGlobal", { "fg": s:accent_4 })
hi! link TypescriptAsyncFuncKeyword TypescriptGlobal
hi! link TypescriptConstraint TypescriptGlobal
hi! link typescriptInterfaceExtends TypescriptConstraint
hi! link typescriptTypeQuery TypescriptGlobal

call s:create_highlight("typescriptAmbientDeclaration", { "fg": s:accent_1_alt })
call s:create_highlight("typescriptModule", { "fg": s:accent_1 })

call s:create_highlight("typescriptTemplateSB", { "fg": s:string_alt })
call s:create_highlight("typescriptTemplateSubstitution", { "fg": s:string_alt })

hi! link TypescriptTry Number
hi! link TypescriptExceptions TypescriptTry
hi! link TypescriptTypeReference Type
hi! link TypescriptVariable Keyword
hi! link typescriptArrowFunc Keyword
hi! link TypescriptTypeBrackets Exception
hi! link typescriptTypeBracket TypescriptTypeBrackets
hi! link TypescriptObjectLabel Operator

hi! link TypescriptObjectLiteral Normal
hi! link TypescriptBraces Normal
hi! link TypescriptMember Normal
hi! link typescriptRequestProp Normal
hi! link typescriptResponseProp Normal
hi! link typescriptPaymentShippingOptionProp Normal
hi! link typescriptHeadersMethod Normal
hi! link typescriptTestGlobal Normal
hi! link typescriptDOMFormProp Normal
hi! link typescriptArrayMethod Normal
hi! link typescriptES6SetMethod typescriptArrayMethod
" }}}

" ALE {{{
call s:create_highlight("ALEError", { "fg": s:alert, "bg": s:background, "gui": "bold" })
call s:create_highlight("ALEErrorSign", { "fg": s:alert, "bg": s:bg_dark, "gui": "bold" })
call s:create_highlight("ALEWarning", { "fg": s:warning, "gui": "bold" })
hi! link ALEWarningSign ALEWarning
" }}}

" git gutter {{{
call s:create_highlight("GitGutterAdd", { "fg": s:success, "bg": s:bg_dark })
call s:create_highlight("GitGutterDelete", { "fg": s:alert, "bg": s:bg_dark })
call s:create_highlight("GitGutterChange", { "fg": s:warning, "bg": s:bg_dark })
call s:create_highlight("GitGutterChangeDelete", { "fg": s:info, "bg": s:bg_dark })
" }}}
