structure Tokens = Tokens

type pos = int
type svalue = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult= (svalue,pos) token

val pos = ref 0
fun eof () = Tokens.EOF(!pos,!pos)
fun error (e,l : int,_) = TextIO.output (TextIO.stdOut, String.concat[
	"line ", (Int.toString l), ": ", e, "\n"
      ])

%%
%header (functor CircuitsLexFun(structure Tokens: Circuits_TOKENS));
letra=[A-Za-z];
digito=[0-9];
int = {digito}+;
float = {digito}+\.{digito}+;

operador =[-+*/%><=^];
ws = [\ \t];
dots =[.,;:~!?];
alls = {letra}|{digito}|{operador}|{ws}|{dots};
%%
\n       => (pos := (!pos) + 1; lex());
{ws}+    => (lex());

{int} => (Tokens.INT (valOf (Int.fromString yytext), !pos, !pos));
{float} => (Tokens.FLOAT ( valOf (Real.fromString yytext), !pos, !pos));

"ohm"   => (Tokens.OHM(!pos,!pos));
"ampere"   => (Tokens.AMPERE(!pos,!pos));
"volts"   => (Tokens.VOLTS(!pos,!pos));

"int"|"float"|"resistor"|"current"|"voltage" => (Tokens.TYPE(yytext,!pos,!pos));

{operador}|"or"|">="|"<="|"!="|"and"|"++"|"//"  => (Tokens.OPERB(yytext,!pos,!pos));
";"      => (Tokens.SEMI(!pos,!pos));
"<-"      => (Tokens.ATR(!pos,!pos));

"("		=> (Tokens.LPAR(!pos,!pos));
")"		=> (Tokens.RPAR(!pos,!pos));
"noop"      => (Tokens.NOOP(!pos,!pos));
"not"      => (Tokens.NOT(!pos,!pos));
"true"      => (Tokens.TRUE(true, !pos,!pos));
"false"      => (Tokens.FALSE(false, !pos,!pos));

"print"   => (Tokens.PRINT(!pos,!pos));

{letra}({letra}|{digito})* => (Tokens.ID(yytext,!pos,!pos));
\" {alls}* \" =>   (Tokens.TEXTO(yytext,!pos,!pos) ); 

"."      => (error ("ignoring bad character "^yytext,!pos,!pos);
             lex());