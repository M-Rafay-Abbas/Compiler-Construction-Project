%{
#include "novalangp2.tab.h"  
#include <iostream>


using namespace std;

void yyerror(const char *s);
%}


%%


"check"          { return CHECK; }
"otherwise"      { return OTHERWISE; }
"repeatwhile"    { return REPEATWHILE; }
"showOut"        { return SHOWOUT; }


"++"             { return ADD_OP; }
"=="             { return EQ_OP; }


";"              { return TERMINATOR; }
"<<<_"            { return BLOCK_START; }
"_>>>"            { return BLOCK_END; }


"("              { return '('; }
")"              { return ')'; }


[0-9]+           { return NUMBER; }           
\"[^\"]*\"       { return LITERAL; }         


[a-zA-Z_][a-zA-Z0-9_]* { return IDENTIFIER; } 


[ \t\r\n]+       { /* skip */ }


.                { yyerror("Lexical Error: Unknown token"); }

%%

int yywrap() { return 1; }