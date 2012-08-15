KEYWORD ("int"|"boolean"|"public"|"class"|"define"|"if"|"this"|"static"|"void"|"new"|"else"|"while"|"return"|"for"|"do")
IDENTIFIER [a-zA-Z][a-z0-9A-Z_$]*
DIGIT [0-9]*
BOOLEAN ("false"|"true")
COMMENT \/\/(.*)$
SYMBOL (";"|"{"|"}"|"["|"]"|"("|")"|"#"|"."|",")
OPERATOR ("+"|"-"|"*"|"/"|"="|"<"|">"|"!"|"%"|"&&"|"||"|"&"|"|"|"^"|"?"|":")
SKIP (\t|\n|" "|.)

%%

{COMMENT}       {}
{KEYWORD}       { printf("<KEYWORD %s>",yytext); }
{DIGIT}         { printf("<INT %s>",yytext); }
{BOOLEAN}       { printf("<BOOLEAN %s>",yytext); }
{IDENTIFIER}    { printf("<IDENTIFIER %s>",yytext); }
{SYMBOL}        { printf("<SYMBOL %s>",yytext); }
{OPERATOR}      { printf("<OPERATOR %s>",yytext); }
{SKIP}          {}
