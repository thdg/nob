all: lexer.lex

setup: lexer.l
	flex lexer.l
	gcc -o lexer lex.yy.c -lfl

run: test.nob lexer.exe
	./lexer.exe test.nob

clean:
	rm lex.yy.c lexer.exe
