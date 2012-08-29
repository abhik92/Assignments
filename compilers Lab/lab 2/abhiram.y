%{
#include<stdio.h>
#include<string.h>
#include<stdlib.h>
#include<math.h>

extern FILE* yyin;

extern int yyparse();

void yyerror(const char*);
%}

%union{
	int ival; // integers
	char *bval;// true and false
	char  *kw; // such as class, int, boolean etc
	char *symbol; // Such as (, ), {, }, and so on
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
%token STRING

%left '<' '>' '=' NE LE GE
%left '+' '-'
%left '*' '/' '%'
%% 
// Grammar section. Right now it is just a 
// dummy rule to parse all the macrojava text


Goal : MacroG MainClass TypeDG 
{
    printf("Goal success");
}
;

/* Expanding the regular expressions MacroG and TypeDG */
MacroG : /*empty*/
        | MacroDefinition MacroG 
;

TypeDG : /*empty*/
        | TypeDeclaration TypeDG
;
     
/* The main class definition here */       
MainClass : CLASS IDENTIFIER '{' PUBLIC STATIC VOID IDENTIFIER '(' STRING '[' ']' IDENTIFIER ')' '{' IDENTIFIER '.' IDENTIFIER '.' IDENTIFIER '(' Expression ')' ';' '}' '}' {if(strcmp($7, "main") != 0 ) yyerror("Error : No main function");}
{
    if( strcmp($15, "System") != 0 || strcmp($17, "out") != 0 || strcmp($19, "println") != 0) yyerror("Error : Not System.out.println");  
}          
;

TypeDeclaration : CLASS IDENTIFIER '{' TypeIdG MethodDeclarationG '}'
        | CLASS IDENTIFIER EXTENDS IDENTIFIER '{' TypeIdG MethodDeclarationG '}' 
;

/* defines the regular expression (Type IDENTIFIER ;)*  */
TypeIdG : /*empty*/ 
        | TypeIdG Type IDENTIFIER ';' 
;

/* defines the regular expression (MethodDeclaration)* */
MethodDeclarationG : /*empty*/
        | MethodDeclaration MethodDeclarationG      
;

MethodDeclaration : PUBLIC Type IDENTIFIER '(' Type IDENTIFIER CommaTIG ')' '{' TypeIdG StatementG RETURN Expression ';' '}'
    | PUBLIC Type IDENTIFIER '(' ')' '{' TypeIdG StatementG RETURN Expression ';' '}'
;

/* definition of the regular expression (, Type IDENTIFIER)* */
CommaTIG : /*empty*/
        |',' Type IDENTIFIER CommaTIG
;

/* definition of the regular expression (Statement)* */
StatementG : /*empty*/
        | Statement StatementG        
;

Type : INT '[' ']'
    | BOOLEAN
    | INT
    | IDENTIFIER
;

Statement : '{' StatementG '}'
        | IDENTIFIER '=' Expression ';'
        | IDENTIFIER '[' Expression ']' '=' Expression ';'
        | IF '(' Expression ')' Statement 
        | IF '(' Expression ')' Statement ELSE Statement 
        | WHILE '(' Expression ')' Statement
        | IDENTIFIER '(' Expression CommaEG ')' ';'
        | IDENTIFIER '(' ')' ';'
        | IDENTIFIER '.' IDENTIFIER '.' IDENTIFIER '(' Expression ')' ';'{
    if( strcmp($1, "System") != 0 || strcmp($3, "out") != 0 || strcmp($5, "println") != 0) yyerror("Error : Not System.out.println");  
} 
;

/*defines the regular expression (,Expression)*  */
CommaEG : /*empty*/
        | CommaEG ',' Expression
;
        
Expression : PExp
        | PExp '&' PExp
        | PExp '<' PExp          
        | PExp '+' PExp
        | PExp '-' PExp
        | PExp '*' PExp
        | PExp '/' PExp
        | PExp '[' PExp ']'
        | PExp '.' IDENTIFIER {if (strcmp($3, "length") != 0 ) yyerror("Error : Not length");}      
        | PExp '.' IDENTIFIER '(' Expression CommaEG ')'
        | PExp '.' IDENTIFIER '(' ')'
        | IDENTIFIER '(' Expression CommaEG ')'
        | IDENTIFIER '(' ')'
;

PExp : INTVAL
       | BOOLVAL
       | IDENTIFIER
       | THIS
       | NEW INT '[' Expression ']'
       | NEW IDENTIFIER '(' ')'
       | '!' Expression
       | '(' Expression ')'
;

MacroDefinition : MacroDefExpression
        | MacroDefStatement
;

MacroDefStatement : '#' DEFINE IDENTIFIER '(' IDENTIFIER CommaIdG ')' '{' StatementG '}' {printf("macro defined");}  
        | '#' DEFINE IDENTIFIER '(' ')' '{' StatementG '}'     {printf("macro type 2 defined");}   
          
;

CommaIdG : /*empty*/
    | ',' IDENTIFIER CommaIdG
;

MacroDefExpression : '#' DEFINE IDENTIFIER '(' IDENTIFIER CommaIdG ')' '(' Expression ')'  {printf("macro defined");}
        | '#' DEFINE IDENTIFIER '(' ')' '(' Expression ')'  {//printf("macro type 2 defined");}
};                               
        
        
%%
main()
{
	// parse through the input until there is no more.
	do 
	{
		yyparse();
	} 
	while (!feof(yyin));
}

void yyerror(const char *s)
{
	printf ("Parse error: %s\n" , s)	;
}
