%{
#include <stdio.h>
#include <stdlib.h>

int yylex();
void yyerror(const char *s);
%}

/* ---------- Tokens ---------- */

%token CHECK OTHERWISE REPEATWHILE SHOWOUT
%token NUMBER
%token IDENTIFIER
%token INT_LITERAL FLOAT_LITERAL STRING_LITERAL

%token BLOCK_START BLOCK_END
%token END_LINE
%token ADD_OP EQ_OP
%token LPAREN RPAREN

%%

Program
    : Block
    ;

Block
    : BLOCK_START StmtList BLOCK_END
    ;

StmtList
    : Stmt StmtList
    | /* empty */
    ;

Stmt
    : Decl
    | Assign
    | CondMatched
    | Loop
    | Output
    ;

Decl
    : NUMBER IDENTIFIER END_LINE
    ;

Assign
    : IDENTIFIER ADD_OP Expr END_LINE
    ;

CondMatched
    : CHECK LPAREN Expr RPAREN Block OTHERWISE Block
    ;

Loop
    : REPEATWHILE LPAREN Expr RPAREN Block
    ;

Output
    : SHOWOUT LPAREN Literal RPAREN END_LINE
    ;

Expr
    : SimpleExpr
    ;

SimpleExpr
    : IDENTIFIER
    | Literal
    | IDENTIFIER EQ_OP IDENTIFIER
    ;

Literal
    : INT_LITERAL
    | FLOAT_LITERAL
    | STRING_LITERAL
    ;

%%

void yyerror(const char *s)
{
    printf("\n❌ Syntax Error: Invalid NovaLang Code!\n");
}

int main()
{
    printf("\n--- NovaLang Parser Started ---\n");

    if (yyparse() == 0)
        printf("✔ Parsing Successful — No Syntax Errors\n");
    else
        printf("❌ Parsing Failed\n");

    return 0;

}

