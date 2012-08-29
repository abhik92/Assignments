%{
#include<stdio.h>

extern FILE* yyin;

extern int yyparse();
%}

%union{
	int ival; // integers
	char *bval;// true and false
	char  *kw; // such as class, int, boolean etc
	char *op; // such as +, -, * etc
	char *id; // identifiers
}

%token <ival> INTVAL
%token <bval> BOOLVAL
%token <kw> KEYWORD
%token <op> OPERATOR
%token <id> IDENTIFIER
%token THIS
%token NEW
%token RETURN
%token CLASS
%token DEFINE
%token PUBLIC
%token STATIC
%token VOID
%token INT
%token BOOLEAN
%token IF
%token ELSE
%token WHILE
%token EXTENDS
%token EndOfFile
%token STRING
%token length

%left '<' '>' '=' NE LE GE
%left '+' '-'
%left '*' '/' '%'


%% 

Goal: MacroDefinition MainClass TypeDeclaration {printf("Success");} ;

MainClass :	CLASS IDENTIFIER '{' PUBLIC STATIC VOID IDENTIFIER '(' STRING '[' ']' IDENTIFIER ')' '{' recursiveStatement '}' '}' {};

TypeDeclaration	: TypeDeclaration CLASS IDENTIFIER '{' TypeISC MethodDeclaration '}' {}
                | TypeDeclaration CLASS IDENTIFIER EXTENDS IDENTIFIER '{' TypeISC MethodDeclaration '}' {}
                | /*epsilon*/
                ;

MethodDeclaration : MethodDeclaration PUBLIC Type IDENTIFIER '(' Type IDENTIFIER CTID ')' '{' TypeISC recursiveStatement RETURN Expression ';' '}' {} 
                  |	MethodDeclaration PUBLIC Type IDENTIFIER '('  ')' '{' TypeISC recursiveStatement RETURN Expression ';' '}' {}
                  | /*epsilon*/
                  ;

Type :	INT '[' ']' {}
     |  BOOLEAN {}
     |	INT {}
     |	IDENTIFIER {}
     ;

DOT: DOT '.' IDENTIFIER {}
   | DOT '.' IDENTIFIER '(' Expression ')' ';' {}
   |
   ;

recursiveStatement: 
                  | Statement recursiveStatement
                  
                  ;

Statement : /*epsilon*/
          | '{' recursiveStatement '}' {}
          | IDENTIFIER '=' Expression ';'{}
          |	IDENTIFIER '[' Expression ']' '=' Expression ';' {}
          |	IF '(' Expression ')' Statement {}
          |	IF '(' Expression ')' Statement ELSE Statement {}
          |	WHILE '(' Expression ')' Statement {}
          |	IDENTIFIER '(' Expression ComExp ')' ';' {}
          |	IDENTIFIER '('  ')' ';' {}
          | IDENTIFIER DOT {}
          ;

MacroDefExpression  : '#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '(' Expression ')' {}
                    | '#' DEFINE IDENTIFIER '(' ')' '(' Expression ')' {}
                    ;

MacroDefStatement :	'#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '{' recursiveStatement '}' {}
                  |	'#' DEFINE IDENTIFIER '(' ')' '{' recursiveStatement '}' {}
                  ;

ComExp : ComExp ',' Expression {}
       |/*epsilon*/
       ;

ComIden : ComIden ';' IDENTIFIER {}
        |/*epsilon*/
        ;

MacroDefinition : MacroDefinition MacroDefExpression {}
                | MacroDefinition MacroDefStatement {}
                | /*epsilon*/ 
                ;

TypeISC : TypeISC  Type IDENTIFIER ';' {}
        | /*epsilon*/
        ;

CTID : CTID ',' Type IDENTIFIER {}
     | /*epsilon*/
     ;


Expression  :	PrimaryExpression '&' PrimaryExpression {}
            |   PrimaryExpression '<' PrimaryExpression {}
            |   PrimaryExpression '+' PrimaryExpression {}
            |   PrimaryExpression '-' PrimaryExpression {}
            |   PrimaryExpression '*' PrimaryExpression {}
            |   PrimaryExpression '/' PrimaryExpression {}
            |	PrimaryExpression '[' PrimaryExpression ']' {}
            |	PrimaryExpression '.' length {}
            |	PrimaryExpression '.' IDENTIFIER '(' Expression ComExp ')' {}
            |	PrimaryExpression '.' IDENTIFIER '(' ')' {}
            |	IDENTIFIER '(' Expression ComExp ')'  {}
            |	IDENTIFIER '(' ')' {}
            |   PrimaryExpression {}
            ;

PrimaryExpression   :	INTVAL {}
                    |   BOOLVAL {}
                    |	IDENTIFIER {}
                    |	THIS {}
                    |	NEW INT '[' Expression ']' {}
                    |	NEW IDENTIFIER '(' ')' {}
                    |	'!' Expression {}
                    |	'(' Expression ')' {} 
                    ;

%%
main(){
	// parse through the input until there is no more.
	do {
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s){
	printf ("Parse error: %s\n" , s)	;
    
}
