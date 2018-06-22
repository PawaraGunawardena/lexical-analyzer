comp: lex.yy.o comp.tab.o
	gcc -o comp $^

comp.tab.h: comp.y
	bison --debug --verbose -d comp.y

comp.tab.c: comp.y
	bison -d comp.y

lex.yy.c: comp.flex comp.tab.h
	flex  comp.flex