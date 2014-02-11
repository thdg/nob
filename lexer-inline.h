/* scanner for Nob language */

%option noyywrap

%{
#include <math.h>
#include <cstring>
#include <string>
#include <iostream>

using namespace std;

#define YYSTRTYPE string
string yylval;

#define ID 1
#define GLOBAL 2
#define INT 3
#define FLOAT 4
#define STRING 5
#define OP 6
#define COMP 7
#define SEP 8
#define EOL 9
#define ASS 10
#define T 11
#define FUN 12

#define ERROR -1

int line;

/* Hjálparfall til að afrita les (lexeme) yfir í breytuna yylval,
 * sem er breyta sem bison/yacc kannast við.  Þetta auðveldar seinni
 * tengingu lesgreinisins við bison/yacc þáttara.
 */
static void copy() {
	char temptext[32768];
	strncpy(temptext,yytext,yyleng);
	temptext[yyleng] = 0;
	yylval = temptext;
}

%}

DIGIT    [0-9]
GLOBAL   [A-Z][A-Z0-9_]*
ID       [a-z][a-z0-9_]*
STRING   \"([^\"]|\\\")*\"

%x IN_COMMENT

%%

y[ ]?=                  { copy(); return(FUN); printf("DIFINE\n"); }
":"                     { copy(); return(ASS); printf("ASS\n"); }

{DIGIT}+                { copy(); return(INT); printf("INT(%s)\n",yytext); }
{DIGIT}+"."{DIGIT}*     { copy(); return(FLOAT); printf("FLOAT(%s)\n",yytext); }
{GLOBAL}                { copy(); return(GLOBAL); printf("GLOBAL(%s)\n",yytext); }
{ID}                    { copy(); return(ID); printf("VAL(%s)\n",yytext); }
{STRING}                { copy(); return(STRING); printf("STRING(%s)\n",yytext); }

"+"|"-"|"*"|"/"|"^"     { copy(); return(OP); printf("OP(%s)\n",yytext); }


"<"|">"|"="             { copy(); return(COMP); printf("COMP(%s)\n",yytext); }
"<="|">="|"~"           { copy(); return(COMP); printf("COMP(%s)\n",yytext); }

"("                     { copy(); return(T); printf("T('%s')\n",yytext); }
")"                     { copy(); return(T); printf("T('%s')\n",yytext); }
"["                     { copy(); return(T); printf("T('%s')\n",yytext); }
"]"                     { copy(); return(T); printf("T('%s')\n",yytext); }

","                     { copy(); return(SEP); printf("SEP\n"); }


\n                      { line++; copy(); return(EOL); printf("EOL\n");}

"!".*$                  /* eat up one-line comments */

[ \t]                   /* eat up whitespace */

.                       { copy(); return(ERROR); printf("?\n"); }

"<!"                    BEGIN(IN_COMMENT);
<IN_COMMENT>{
    "!>"                BEGIN(INITIAL);
    \n                  line++;
    [^!]+
    "!" 
}

%%

int main( int argc, char **argv ) {

    /*
    ++argv, --argc;  // skip over program name
    if ( argc > 0 )
        yyin = fopen( argv[0], "r" );
    else
        yyin = stdin;

    yylex();
    */
	int token;
	while( (token=yylex()) ) {
		//cout << "Line " << line << ", text \"" << yylval << "\", token " << token << endl;
        cout << "[" << token << "]" << yylval;
	}
	return 0;
}