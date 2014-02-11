/* scanner for Nob language */

%option noyywrap

%{
/* need this for the call to atof() below */
#include <math.h>
%}

DIGIT    [0-9]
GLOBAL   [A-Z][A-Z0-9_]*
ID       [a-z][a-z0-9_]*
STRING   \"([^\"]|\\\")*\"

%x IN_COMMENT

%%

y[ ]?=                  { printf("DIFINE\n"); }
":"                     { printf("ASS\n"); }

{DIGIT}+                { printf("INT(%s)\n",yytext); }
{DIGIT}+"."{DIGIT}*     { printf("FLOAT(%s)\n",yytext); }
{GLOBAL}                { printf("GLOBAL(%s)\n",yytext); }
{ID}                    { printf("VAL(%s)\n",yytext); }
{STRING}                { printf("STRING(%s)\n",yytext); }

"+"|"-"|"*"|"/"|"^"     { printf("OP(%s)\n",yytext); }


"<"|">"|"="             { printf("COMP(%s)\n",yytext); }
"<="|">="|"~"           { printf("COMP(%s)\n",yytext); }

"("                     { printf("T('%s')\n",yytext); }
")"                     { printf("T('%s')\n",yytext); }
"["                     { printf("T('%s')\n",yytext); }
"]"                     { printf("T('%s')\n",yytext); }

","                     { printf("SEP\n"); }

if|elif|else            { printf("KW(%s)\n",yytext); }
while|for|end           { printf("KW(%s)\n",yytext); }

\n                      { printf("EOL\n"); }

"!".*$                  /* eat up one-line comments */

[ \t]+                  /* eat up whitespace */

.                       { printf("?\n"); }

"<!"                    BEGIN(IN_COMMENT);
<IN_COMMENT>{
    "!>"                BEGIN(INITIAL);
    [^!]+
    "!" 
}

%%

int main( int argc, char **argv ) {

    ++argv, --argc;  /* skip over program name */
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;

    yylex();
}