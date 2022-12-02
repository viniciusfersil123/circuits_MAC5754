(* Load content from a file into a string *)
fun loadFile(filename) =
    let
        val file = TextIO.openIn filename
        val content = TextIO.inputAll file
        val _ = TextIO.closeIn file
    in
        content
    end

fun isWordSeparator c = Char.isSpace c orelse c = #"\n" orelse c = #"\t"

fun splitText(text) = String.tokens isWordSeparator text

datatype token =
    PLUS
    | MINUS
    | TIMES
    | DIV
    | SERIES
    | LPAREN
    | RPAREN
    | LBRACKET
    | RBRACKET
    | GT
    | LT
    | EQUAL
    | DIFF
    | DQUOTE
    | SEMICOLON
    | LEQ
    | GEQ
    | OR
    | AND
    | NOT
    | TRUE
    | FALSE
    | LITERAL of string
    | INT_TYPE
    | FLOAT_TYPE
    | BOOL_TYPE
    | STRING_TYPE
    | OHMS
    | AMPERE
    | VOLTS
    (* | INTEGER of int
    | REAL of real *)

	(* | substituí  INTEGER_TYPE por INT_TYPE, REAL_TYPE por FLOAT_TYPE e 
	/ BOOLEAN_TYPE por BOOL_TYPE para manter padrão do lex *)

fun tokenize nil = nil
    | tokenize ("+" :: strList) = (PLUS :: tokenize strList)
    | tokenize ("-" :: strList) = (MINUS :: tokenize strList)
    | tokenize ("*" :: strList) = (TIMES :: tokenize strList)
    | tokenize ("/" :: strList) = (DIV :: tokenize strList)
    | tokenize ("++" :: strList) = (SERIES :: tokenize strList)
    | tokenize ("(" :: strList) = (LPAREN :: tokenize strList)
    | tokenize (")" :: strList) = (RPAREN :: tokenize strList)
    | tokenize ("]" :: strList) = (LBRACKET :: tokenize strList)
    | tokenize ("[" :: strList) = (RBRACKET :: tokenize strList)
    | tokenize ("\"" :: strList) = (DQUOTE :: tokenize strList)
    | tokenize (";" :: strList) = (SEMICOLON :: tokenize strList)
    | tokenize ("<=" :: strList) = (LEQ :: tokenize strList)
    | tokenize (">=" :: strList) = (GEQ :: tokenize strList)
    | tokenize (">" :: strList) = (GT :: tokenize strList)
    | tokenize ("<" :: strList) = (LT :: tokenize strList)
    | tokenize ("==" :: strList) = (EQUAL :: tokenize strList)
    | tokenize ("!=" :: strList) = (DIFF :: tokenize strList)
    | tokenize ("OR" :: strList) = (OR :: tokenize strList)
    | tokenize ("AND" :: strList) = (AND :: tokenize strList)
    | tokenize ("NOT" :: strList) = (NOT :: tokenize strList)
    | tokenize ("true" :: strList) = (TRUE :: tokenize strList)
    | tokenize ("false" :: strList) = (FALSE :: tokenize strList)
    | tokenize ("int" :: strList) = (INT_TYPE :: tokenize strList)
    | tokenize ("float" :: strList) = (FLOAT_TYPE :: tokenize strList)
    | tokenize ("bool" :: strList) = (BOOL_TYPE :: tokenize strList)
    | tokenize ("string" :: strList) = (STRING_TYPE :: tokenize strList)
    | tokenize ("ohms" :: strList) = (OHMS :: tokenize strList)
    | tokenize ("ampere" :: strList) = (AMPERE :: tokenize strList)
    | tokenize ("volts" :: strList) = (VOLTS :: tokenize strList)
    | tokenize (s :: strList) = LITERAL s :: tokenize strList

(* Main flow *)
val program = loadFile "examples/operations.cts"
val splited = splitText program
val tokenized = tokenize splited