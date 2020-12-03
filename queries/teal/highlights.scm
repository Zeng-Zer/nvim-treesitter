(if_statement [ "if" "then" "end" ] @conditional)
(elseif_block [ "elseif" "then" ] @conditional)
(else_block [ "else" ] @conditional)

[ "else" "elseif" ] @conditional
(for_statement [ "for" ] @repeat)
(for_statement "in" @keyword)
(for_body [ "do" "end" ] @repeat)
(while_statement [ "while" ] @repeat)
(while_body [ "do" "end" ] @repeat)
(repeat_statement [ "repeat" "until" ] @repeat)
(do_statement [ "do" "end" ] @keyword)
(record_declaration [ "record" "end" ] @keyword)
(enum_declaration [ "enum" "end" ] @keyword)

[ "in" "local" "return" (break) (goto) ] @keyword
(label) @label

; Global isn't a real keyword, but it gets special treatment
(var_declaration "global" @keyword)
(function_statement "global" @keyword)


;; Ops
[ "not" "and" "or" "as" "is" ] @keyword.operator

[ "=" "~=" "==" "<=" ">=" "<" ">"
"+" "-" "%" "/" "//" "*" "^"
"&" "~" "|" ">>" "<<"
".." "#"
 ] @operator

[ "," "." ":"] @punctuation.delimiter
[ "(" ")" "[" "]" "{" "}" ] @punctuation.bracket
(typeargs ["<" ">"] @punctuation.bracket)

(identifier) @variable
(boolean) @boolean
(nil) @constant.builtin
(varargs) @constant

;; function stuffs;

(function_statement (function_name) @function)
(function_statement ["function" "end"] @keyword.function)

(function_call
   (identifier) @function . (arguments))

(arg
  name: (identifier) @parameter)

;; type stuffs
(type_declaration "type" @keyword)
(type_declaration (type_name) @type)
(simple_type) @type
(function_type "function" @type)
(record_declaration
    name: (identifier) @type)
(enum_declaration
    name: (identifier) @type)
(typeargs (identifier) @parameter)

(table_constructor ["{" "}"] @constructor)
(comment) @comment
(string) @string
(number) @number
;; TODO (label_statement) @label

(ERROR) @error
