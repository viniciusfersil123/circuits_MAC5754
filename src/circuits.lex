%name CircuitsLexer;

%let digito = [0-9];
%let int = {digito}+;
%let float = {int}["."]({digit}+|{digit});
%let letra = [a-zA-Z];
%let alfaCaracteres = [a-zA-Z:\" !@#.$/%*záàâãéèêíïóôõöúçñÁÀÂÃÉÈÍÏÓÔÕÖÚÇÑ&0-9]*;
%let bool = ("true"|"false");
%let numero = ({int}|{float});
%let valor = ({numero}|{bool});
%let identificador = {letra}({letra}|{digito}|"_")*;
%let string = ["]{alfaCaracteres}["];

%let unidade = ("ohm"|"ampere"|"volts");
%let valUnidade = ({int}|{float})

%let resistor = ({int}|{float})[" "]{unidade};
%let current = ({int}|{float}[" "]{unidade};
%let voltage = ({int}|{float}[" "]{unidade};

%let tipoGenerico = ("int"|"float"|"bool");
%let valorGenerico = ({int}|{float}|{bool});

%let tipoFisico = ("resistor"|"current"|"voltage");
%let valFisico = ({int}|{float});

%let tipoPrimitivo = ({tipoGenerico}|{tipoFisico});
%let valPrimitivo = ({valorGenerico}|{valFisico});

%let vazio = "{}";

%defs (
    structure T = CircuitsTokens
    type lex_result = T.token
    fun eof() = T.EOF
);