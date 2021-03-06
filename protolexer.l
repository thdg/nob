/*
 *  Beinagrind fyrir lesgreini.
 *
 *  H�fundur: Snorri Agnarsson
 *
 *  Athugi� a� h�r er veri� a� nota C++ � sta� C.
 *  �essa skr� m� ���a t.d. me� Cygwin me� eftirfarandi skipunum:
 *     flex -oprotolexer.cpp protolexer.l
 *     g++ -o fprotolexer.exe protolexer.cpp -lfl
 */

%{
#include <cstring>
#include <string>
#include <iostream>

using namespace std;

#define YYSTYPE string
string yylval;

#define NAFN 1
#define ADGERD 2
#define ERROR -1
int line;

/* Hj�lparfall til a� afrita les (lexeme) yfir � breytuna yylval,
 * sem er breyta sem bison/yacc kannast vi�.  �etta au�veldar seinni
 * tengingu lesgreinisins vi� bison/yacc ��ttara.
 */
static void copy() {
	char temptext[32768];
	strncpy(temptext,yytext,yyleng);
	temptext[yyleng] = 0;
	yylval = temptext;
}

%}

  /* Reglulegar skilgreiningar */

TOLUSTAFUR	[0-9]
WS			[ \t\n]
ADGSTAFUR	[!%\-&/=?~^+*:<>|]
NAFNSTAFUR	[a-zA-Z��������������������]

%%

  /* Flex/Lex reglur -- athugi� a� h�r vantar miki� � til
   * a� �etta n�lgist a� vera lexgreinir fyrir Fj�lni
   */

\n {
	line++;
}

{WS} {
	/* WS flokkast sem athugasemd - engu skila� */
}

";;".*$ {
	/* Athugasemdir - engu skila� */
}

ef {
    copy(); return(2);
}

annars {
    copy(); return(3);
}

{NAFNSTAFUR}({NAFNSTAFUR}|{TOLUSTAFUR})* {
	copy();
	return(NAFN);
}

{ADGSTAFUR}+ {
	copy();
	return(ADGERD);
}

. {
	copy();
	return(ERROR);
}

%%

int main( int argc, char **argv ) {
	int token;
	while( (token=yylex()) ) {
		cout << "Line " << line << ", text \"" << yylval << "\", token " << token << endl;
	}
	return 0;
}
