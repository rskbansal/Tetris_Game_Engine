%debug
%define parse.error detailed
%{
#include <math.h>
#include <stdlib.h>
#include <stddef.h>
#include <stdio.h>
#include <string.h>
#include <error.h>
#include <errno.h>

#include "extetrickstype.h"

void yyerror(char *s)
{
fprintf(stderr,"%s\n",s);
return;
}

int yywrap()
{
    return 1;
}

char* indent(char* body) {
	char* ans = malloc(1024);
	memset(ans, 0, 1024);
	char* line = strtok(body, "\n");
	while(line != NULL) {
		sprintf(ans, "%s    %s\n", ans, line);
		line = strtok(NULL, "\n");
	}
	free(body);
	return ans;
}

char *verbatim="import sys\nsys.path.append('../')\nfrom game_engine.engine import *\n";
char *verbatim1="import sys\nsys.path.append('../')\nfrom game_engine.engine import *\nfrom game_engine.board import *\nfrom game_engine.allextetrominoes import *\nfrom game_engine.shape import *\n";
char *main_func="if __name__ == '__main__':\n\ttetris_engine = TetrisEngine()\n";
char *object_name="tetris_engine";

%}

%token SECTION1 SECTION2 SECTION3 NEWLINE NUM ID IF THEN ELSE END WHILE CALL WITH OR AND NOT NEG PLAY

%%
START : SECTION1 NEWLINE PRIMITIVE SECTION2 NEWLINE FUNCTIONS SECTION3 NEWLINE ENGINE { printf("START  ->  SECTION1 NEWLINE PRIMITIVE SECTION2 NEWLINE FUNCTIONS SECTION3 NEWLINE ENGINE\n"); }
			;

PRIMITIVE : ID '=' EXPR NEWLINE PRIMITIVE { printf("PRIMITIVE -> ID '=' EXPR NEWLINE PRIMITIVE\n"); }
					| { printf("PRIMITIVE -> #\n"); }
					;

ENGINE : '[' PLAY ']' { printf("ENGINE -> '[' PLAY ']'\n"); }
			 | '[' PLAY WITH PARAM PARAMLIST ']' { printf("ENGINE -> '[' PLAY WITH PARAM PARAMLIST ']'\n"); }
			 ;

FUNCTIONS : FUNCTION NEWLINE FUNCTIONS { printf("FUNCTIONS -> FUNCTION NEWLINE FUNCTIONS\n"); }
					| { printf("FUNCTIONS -> #\n"); }
					;

FUNCTION : '{' ID BODY '}' { printf("FUNCTION -> '{' ID BODY '}'\n"); }
				 ;

BODY : STATEMENT BODY { printf("BODY -> STATEMENT BODY\n"); }
		 | STATEMENT { printf("BODY -> STATEMENT\n"); }
		 ;

STATEMENT : IFSTATEMENT { printf("STATEMENT -> IFSTATEMENT\n"); }
					| WHILELOOP { printf("STATEMENT -> WHILELOOP\n"); }
					| ID '=' EXPR { printf("STATEMENT -> ID '=' EXPR\n"); }
					;

IFSTATEMENT : IF '(' EXPR ')' THEN STATEMENT END { printf("IFSTATEMENT -> IF '(' EXPR ')' THEN STATEMENT END\n"); }
						| IF '(' EXPR ')' THEN STATEMENT ELSE STATEMENT END { printf("IFSTATEMENT -> IF '(' EXPR ')' THEN STATEMENT ELSE STATEMENT END\n"); }
						;

WHILELOOP : WHILE '(' EXPR ')' STATEMENT END { printf("WHILELOOP -> WHILE '(' EXPR ')' STATEMENT END\n"); }
					;

EXPR : ARITHLOGIC { printf("EXPR -> ARITHLOGIC\n"); }
		 | '[' CALL ID ']' { printf("EXPR -> '[' CALL ID ']'\n"); }
		 | '[' CALL ID WITH PARAM PARAMLIST ']' { printf("EXPR -> '[' CALL ID WITH PARAM PARAMLIST ']'\n"); }
		 ;

ARITHLOGIC : TERM ARITH1 { printf("ARITHLOGIC -> TERM ARITH1\n"); }
					 ;

TERM : FACTOR TERM1 { printf("TERM -> FACTOR TERM1\n"); }
		 ;

ARITH1 : '+' TERM ARITH1 { printf("ARITH1 -> '+' TERM ARITH1\n"); }
			 | '-' TERM ARITH1 { printf("ARITH1 -> '-' TERM ARITH1\n"); }
			 | OR TERM ARITH1 { printf("ARITH1 -> OR TERM ARITH1\n"); }
			 | { printf("ARITH1 -> #\n"); }
			 ;

FACTOR : ID { printf("FACTOR -> ID\n"); }
			 | NUM { printf("FACTOR -> NUM\n"); }
			 | '(' EXPR ')' { printf("FACTOR -> '(' EXPR ')'\n"); }
			 | '(' NEG EXPR ')' { printf("FACTOR -> '(' NEG EXPR ')'\n"); } 
			 | '(' NOT EXPR ')' { printf("FACTOR -> '(' NOT EXPR ')'\n"); }
			 ;

TERM1 : '*' FACTOR TERM1 { printf("TERM1 -> '*' FACTOR TERM1\n"); }
			| AND FACTOR TERM1 { printf("TERM1 -> AND FACTOR TERM1\n"); }
			| { printf("TERM1 -> #\n"); }
			;

PARAM : ID '=' EXPR { printf("PARAM -> ID '=' EXPR\n"); }
			;

PARAMLIST : PARAM PARAMLIST { printf("PARAMLIST -> PARAM PARAMLIST\n"); }
					| { printf("PARAMLIST -> #\n"); }
					;
%%

int main(int argc, char *argv[])
{
yyparse();
return 0;
}
