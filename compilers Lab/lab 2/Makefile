make:
	bison -d -t -v macrojava.y
	flex macrojava.l
	gcc macrojava.tab.c lex.yy.c -lfl -o macrojava
