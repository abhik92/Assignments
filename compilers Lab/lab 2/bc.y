%{

#include <stdio.h>
#include <math.h>

extern FILE* yyin;

extern int yyparse();

void yyerror(const char* s);
%}

%union{
	double dval; // integers
	char  *kw; // such as class, int, boolean etc
	char *symbol; // Such as (, ), {, }, and so on
	char *op; // such as +, -, * etc
    char *string;
}


%type <dval> exp
%token NL
%token <dval> DOUBLE
%token <kw> KEYWORD
%token <symbol> SYMBOL
%token <op> OPERATOR
%token LP
%token RP
%token COMMA 

%left ADD SUB
%left MUL DIV

%% 
// Grammar section. Right now it is just a 
// dummy rule to parse all the macrojava text

input:
      | input exp NL { printf("%lf\n",$2);}
      ;

exp:
   DOUBLE {$$ = $1;
		}
   
   |  exp MUL exp {$$ = $1*$3;
			}
   |  exp DIV exp {
                   if($3!=0)
                       $$ = $1/$3;
                   else
                       printf("Divide by Zero\n");
                  }
   |  exp ADD exp { $$ = $1 + $3; }
   |  exp SUB exp {$$ = $1 - $3;}
   |  KEYWORD LP exp COMMA exp RP  {
            if(strcmp($1,"pow")==0)
                $$ = pow($3,$5);
            else if(strcmp($1,"nroot")==0)
            {
                $$ = pow($3,1.0/$5);
            
            }
            else
               printf("Error\n");
                       
          }
   
   |  LP exp RP  { $$ = $2;}
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

