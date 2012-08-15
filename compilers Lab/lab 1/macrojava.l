%{
    #include "macrojava.tab.h"
    #include<stdlib.h>
%}

KEYWORD ("int"|"boolean"|"public"|"class"|"define"|"if"|"this"|"static"|"void"|"new"|"else"|"while"|"return"|"for"|"do"|"abstract"|"continue"|"break"|"switch"|"assert"|"default"|"case"|"goto"|"package"|"long"|"const"|"super"|"throw"|"throws"|"final"|"finally"|"extends"|"interface"|"try"|"catch"|"enum"|"private"|"protected"|"implements"|"float"|"double"|"byte"|"do"|"goto")
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
