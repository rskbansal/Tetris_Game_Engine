build:
	bison -d -r all a2version2.y ; flex extetrickscanner.l ;  gcc -o x2021A7PS2430G extetrickstype.c lex.yy.c a2version2.tab.c
tests:
	./x2021A7PS2430G < testinput.tetris 2>/dev/null > game.py
run:
	python3 game.py
clean:
	rm -f a2version2.output a2version2.tab.c a2version2.tab.h lex.yy.c x2021A7PS2430G game.py
