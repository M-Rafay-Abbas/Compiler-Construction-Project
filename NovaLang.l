%option noyywrap

%{
#include <iostream>
#include <string>
using namespace std;

int token_count = 0;
int line_no = 1;
%}


identifier      \$[A-Za-z][A-Za-z0-9.@]*
integer         [1-9][0-9](-[0-9]+)
float_val       [0-9]+_[0-9]+\.[0-9]+
string_val      \"[A-Za-z0-9_,.!?@#%&()\[\]\-/\\]\"
single_comment  \/\/@.*
multi_comment   \/@([^@]|\n|@[^\/])*@\/
new_line        \n
white_space     [ \t\r]+

kw              (check|otherwise|repeatwhile|doTask|until|define|giveBack|readIn|showOut|number|word|logic|constant|continueTo|stopAll)
data_type       (numberX|realNum|alphaWord|tinyChar|flagLogic|constantX|arrayBox|autoVal|voidX|pointerTo)


add_op          _\+\+\+
sub_op          ---\_
mul_op          _\\\*
div_op          \/\/\/

assign_op       ==
not_equal_op    \!\=\=
less_op         <<
greater_op      >>


end_line        ;;;
separator       ::: 
block_start     _<<<
block_end       >>>_

%%


{new_line}              { line_no++; }

{white_space}           { /* ignore */ }

{single_comment}        { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] COMMENT_SINGLE\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{multi_comment}         { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] COMMENT_MULTI\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{kw}                    { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] KEYWORD\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{data_type}             { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] DATA_TYPE\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{add_op}                { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{sub_op}                { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{mul_op}                { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{div_op}                { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{assign_op}             { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{not_equal_op}          { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{less_op}               { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{greater_op}            { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] OPERATOR\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{end_line}              { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] PUNCTUATION\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{separator}             { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] PUNCTUATION\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{block_start}           { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] PUNCTUATION\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{block_end}             { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] PUNCTUATION\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{float_val}             { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] FLOAT_LITERAL\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{integer}               { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] INT_LITERAL\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{string_val}            { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] STRING_LITERAL\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }

{identifier}            { token_count++; cout << "[Line " << line_no << " | Token " << token_count 
                                               << "] IDENTIFIER\t\t" << yytext 
                                               << " (Total Tokens: " << token_count << ")" << endl; }
 
.                       { }

%%

int main() {
    yylex();

    cout << "\n----------------------------------------\n";
    cout << "Total Tokens: " << token_count << endl;
    cout << "Total Lines : " << line_no << endl;
    cout << "----------------------------------------\n";

     return 0;
}