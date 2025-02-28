%{
#include "myscanner.h"
%}

%option yylineno

%%
":"                return COLON; /* Detecta el carácter ':' */
"db_type"          return TYPE;
"db_name"          return NAME;
"db_table_prefix"  return TABLE_PREFIX;
"db_port"          return PORT;

[a-zA-Z][_a-zA-Z0-9]* return IDENTIFIER;
[1-9][0-9]*           return INTEGER;
[ \t\n]               ; /* Ignorar espacios, tabulaciones y saltos de línea */
.                     printf("unexpected character: %s\n", yytext);

%%

int yywrap(void) {
    return 1;
}
