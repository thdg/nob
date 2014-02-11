/*
 *  Beinagrind fyrir lesgreini.
 *
 *  Höfundur: Snorri Agnarsson
 *
 *  Athugið að hér er verið að nota C++ í stað C.
 *  Þessa skrá má þýða t.d. með Cygwin með eftirfarandi skipunum:
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

  /* Reglulegar skilgreiningar */

TOLUSTAFUR	[0-9]
WS			[ \t\n]
ADGSTAFUR	[!%\-&/=?~^+*:<>|]
NAFNSTAFUR	[a-zA-ZþæöðáéýúíóÞÆÖÐÁÉÝÚÍÓ]

%%

  /* Flex/Lex reglur -- athugið að hér vantar mikið á til
   * að þetta nálgist að vera lexgreinir fyrir Fjölni
   */

\n {
	line++;
}

{WS} {
	/* WS flokkast sem athugasemd - engu skilað */
}

";;".*$ {
	/* Athugasemdir - engu skilað */
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
