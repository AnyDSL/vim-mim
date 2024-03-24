if exists("b:current_syntax")
    finish
endif

syn match thorinBin         "[+-]\?0[bB][01]\+\([iI]\d\+\)\?"
syn match thorinOct         "[+-]\?0[oO]\o\+\([iI]\d\+\)\?"
syn match thorinDec         "[+-]\?\d\+\([iI]\d\+\)\?"
syn match thorinHex         "[+-]\?0[xX]\x\+\([iI]\d\+\)\?"
syn match thorinIdx         "\d\+_\d\+"
syn match thorinIdx         "\d\+[₀-₉]\+"
syn match thorinKeyword     "\.[a-zA-Z0-9_]\+"
syn match thorinAxiom       "%[a-zA-Z]\+"
syn match thorinVar         "@[_a-zA-Z][_0-9a-zA-Z]*"
syn match thorinIdentifier  "[_a-zA-Z][_0-9a-zA-Z]*"
syn match thorinDelim       '<'
syn match thorinDelim       '<<'
syn match thorinDelim       '>'
syn match thorinDelim       '>>'
syn match thorinDelim       "«"
syn match thorinDelim       "»"
syn match thorinBool        ".ff"
syn match thorinBool        ".tt"

syn region thorinComment start='/\*' end=`\*/`
syn region thorinComment start='//' end=`$`

let b:current_syntax = "thorin"

hi def link thorinBool          Boolean
hi def link thorinAxiom         Statement
hi def link thorinIdentifier    Identifier
hi def link thorinVar           Label
hi def link thorinKeyword       Keyword
hi def link thorinDelim         Delimiter
hi def link thorinBin           Constant
hi def link thorinOct           Constant
hi def link thorinDec           Constant
hi def link thorinHex           Constant
hi def link thorinIdx           Constant
hi def link thorinComment       Comment
