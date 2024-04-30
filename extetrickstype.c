#include "extetrickstype.h"
#include <math.h>
#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <error.h>
#include <errno.h>

ExtetricksSType NewSymbol(char *lexeme, yytoken_kind_t token) {
	ExtetricksSType newSymbol = (ExtetricksSType) malloc(sizeof(xtetricksSType));
	newSymbol->literalName = (char*) malloc(strlen(lexeme)+1);
	strcpy(newSymbol->literalName,lexeme);
	switch(token) {
		case NUM : newSymbol->value.IntValue = atoi(lexeme); break; /* TODO: floats etc. */
		case ID : newSymbol->value.StringValue = newSymbol->literalName; break;
		default : break;
	}
	return newSymbol;
}
