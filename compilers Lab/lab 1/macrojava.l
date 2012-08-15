/*
    Author: Karthik Abinav
    Roll: CS10B057
*/

%{
    #include "macrojava.tab.h"
    #include<stdlib.h>
%}

KEYWORD ("abstract"|"assert"|"boolean"|"break"|"byte"|"case"|"catch"|"char"|"class"|"const"|"continue"|"default"|"do"|"double"|"define"|"else"|"enum"|"extends"|"final"|"finally"|"float"|"for"|"goto"|"if"|"implements"|"import"|"instanceof"|"int"|"interface"|"long"|"native"|"new"|"package"|"private"|"protected"|"public"|"return"|"short"|"static"|"strictfp"|"super"|"switch"|"synchronized"|"this"|"throw"|"throws"|"transient"|"try"|"void"|"volatile"|"while"|"null")
IDENTIFIER [a-zA-Z][a-z0-9A-Z_$]*
DIGIT [0-9]*
BOOLEAN ("false"|"true")
COMMENT \/\/(.*)$
SYMBOL (";"|"{"|"}"|"["|"]"|"("|")"|"#"|"."|","|"@")
OPERATOR ("+"|"-"|"*"|"/"|"="|"<"|">"|"!"|"%"|"&&"|"||"|"&"|"|"|"^"|"?"|":")
SKIP (\t|\n|" "|.)

%%

{COMMENT}       {}
{KEYWORD}       { 
                    yylval.kw = yytext;
                    return KEYWORD;
                
                }
{DIGIT}         { 
                    yylval.ival = atoi(yytext);
                    return INT;
                
                }
{BOOLEAN}       { 
                    yylval.bval = yytext;
                    return BOOLEAN;
                }
{IDENTIFIER}    { 
                    yylval.id = yytext;
                    return IDENTIFIER;
                }
{SYMBOL}        { 
                    yylval.symbol = yytext;
                    return SYMBOL;
                }
{OPERATOR}      { 
                    yylval.op = yytext;
                    return OPERATOR;
                }
{SKIP}          {}
%%
