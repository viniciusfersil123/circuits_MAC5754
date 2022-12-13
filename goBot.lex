structure Tokens = Tokens

type pos = int
type svalue = Tokens.svalue
type ('a,'b) token = ('a,'b) Tokens.token
type lexresult= (svalue,pos) token

val pos = ref 0
fun teste() = print "oi";
fun eof () = Tokens.EOF(!pos,!pos)
fun error (e,l : int,_) = TextIO.output (TextIO.stdOut, String.concat[
	"line ", (Int.toString l), ": ", e, "\n"
      ])

%%
%header (functor GoBotLexFun(structure Tokens: GoBot_TOKENS));
letra=[A-Za-z];
digito=[0-9];
(*aqui começo a criação dos tipos int e float*)
int = {digito}+;
float = {int}["."]({digito}{digito});

operador =[-+*/%><=^];
ws = [\ \t];
dots =[.,;:~!?];
alls = {letra}|{digito}|{operador}|{ws}|{dots};
%%
\n       => (pos := (!pos) + 1; lex());
{ws}+    => (lex());

(*criação do tipo float separando do int. Obs: antes era NUM*)
{int} => (Tokens.INT (valOf (Int.fromString yytext), !pos, !pos));
{float} => (Tokens.FLOAT ( valOf (Float.fromString yytext), !pos, !pos));

(*criação das unidades elétricas - verificar sintaxe de para a unidade*)
({int}|{float})["ohm"] => (Tokens.OHM ( valOf (Ohm.fromString yytext), !pos, !pos));
({int}|{float})["ampere"] => (Tokens.AMPERE( valOf (Ampere.fromString yytext), !pos, !pos));
({int}|{float})["volts"] => (Tokens.VOLTS ( valOf (Volts.fromString yytext), !pos, !pos));


(*criação da lista com todos os tipos da linguagem*)
"int"|"float"|"resistor"|"current"|"voltage" => (Tokens.TYPE(yytext,!pos,!pos));


"getEnergy"   => (Tokens.GET_ENERGY(!pos,!pos));
"getLight"   => (Tokens.GET_LIGHT(!pos,!pos));
"getTemp"   => (Tokens.GET_TEMP(!pos,!pos));

"moveA"   => (Tokens.MOVEA(!pos,!pos));
"moveB"   => (Tokens.MOVEB(!pos,!pos));
"moveE"   => (Tokens.MOVEE(!pos,!pos));
"moveD"   => (Tokens.MOVED(!pos,!pos));

{operador}|"or"|">="|"<="|"!="|"and"|"++"|"//"  => (Tokens.OPERB(yytext,!pos,!pos));
";"      => (Tokens.SEMI(!pos,!pos));
"<-"      => (Tokens.ATR(!pos,!pos));

"("		=> (Tokens.LPAR(!pos,!pos));
")"		=> (Tokens.RPAR(!pos,!pos));
"delay"       => (Tokens.HOWAMI(!pos,!pos));
"show"      => (Tokens.SHOW(!pos,!pos));
"mapa"      => (Tokens.MAPA(!pos,!pos));
"noop"      => (Tokens.NOOP(!pos,!pos));
"not"      => (Tokens.NOT(!pos,!pos));
"true"      => (Tokens.TRUE(!pos,!pos));
"false"      => (Tokens.FALSE(!pos,!pos));

"print"   => (Tokens.PRINT(!pos,!pos));

{letra}({letra}|{digito})* => (Tokens.ID(yytext,!pos,!pos));
\" {alls}* \" =>   (Tokens.TEXTO(yytext,!pos,!pos) ); 

"."      => (error ("ignoring bad character "^yytext,!pos,!pos);
             lex());