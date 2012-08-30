%{
#include<stdio.h>
#include<stdlib.h>
#include <string.h>
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
%token <id> THIS
%token <id> NEW
%token <id> RETURN
%token <id> CLASS
%token <id> DEFINE
%token <id> PUBLIC
%token <id> STATIC
%token <id> VOID
%token <id> INT
%token <id> BOOLEAN
%token <id> IF
%token <id> ELSE
%token <id> WHILE
%token <id> EXTENDS
%token <id> EndOfFile
%token <id> STRING
%token <id> length

%type <id> MainClass
%type <id> Expression
%type <id> Goal
%type <id> MacroDefinition 
%type <id> TypeDeclaration
%type <id> MethodDeclaration
%type <id> Type
%type <id> DOT
%type <id> recursiveStatement
%type <id> Statement
%type <id> MacroDefExpression
%type <id> MacroDefStatement
%type <id> ComExp
%type <id> ComIden
%type <id> TypeISC
%type <id> CTID
%type <id> PrimaryExpression


%left '<' '>' '=' NE LE GE
%left '+' '-'
%left '*' '/' '%'

%% 

Goal: MacroDefinition MainClass TypeDeclaration EndOfFile {
                                        
                                        $$ = (char*) malloc(sizeof(char)*(strlen($1)+strlen($2)+strlen($3)+1));
                                        $$[0] = '\0';
                                        strcat($$,$1);
                                        strcat($$,$2);
                                        strcat($$,$3);
                                        printf("%s",$$);
                                        exit(0);
                                        
                                } ;


MainClass :	CLASS IDENTIFIER '{' PUBLIC STATIC VOID IDENTIFIER '(' STRING '[' ']' IDENTIFIER ')' '{' recursiveStatement '}' '}' {
                $1="class";
                $4="public";
                $5="static";
                $6="void";
                $9="string";
                
                $$ = (char*)malloc(sizeof(char)*(strlen($1) + strlen($2)+ 1+ strlen($4)+ strlen($5)+ strlen($6)+ strlen($7)+ 1+ strlen($9)+ 1+ 1+ strlen($12)+ 1+ 1+ strlen($15)+ 1+ 1+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,$2);
                strcat($$,"{");
                strcat($$,$4);
                strcat($$,$5);
                strcat($$,$6);
                strcat($$,$7);
                strcat($$,"(");
                strcat($$,$9);
                strcat($$,"[");
                strcat($$,"]");
                strcat($$,$12);
                strcat($$,")");
                strcat($$,"{");
                strcat($$,$15);
                strcat($$,"}");
                strcat($$,"}");

          
          };

TypeDeclaration	: TypeDeclaration CLASS IDENTIFIER '{' TypeISC MethodDeclaration '}' {
                    
                    $2="class";

                    $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+strlen($3)+1+strlen($5)+strlen($6)+1+1));
                    $$[0] = '\0';
                    strcat($$,$1);
                    strcat($$,$2);
                    strcat($$,$3);
                    strcat($$,"{");
                    strcat($$,$5);
                    strcat($$,$6);
                    strcat($$,"}");
                
                
                }
                | TypeDeclaration CLASS IDENTIFIER EXTENDS IDENTIFIER '{' TypeISC MethodDeclaration '}' {
                    $2="class";
                    $4="extends";
                    $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+strlen($3)+strlen($4)+strlen($5)+1+strlen($7)+strlen($8)+1+1));
                    $$[0] = '\0';
                    strcat($$,$1);
                    strcat($$,$2);
                    strcat($$,$3);
                    strcat($$,$4);
                    strcat($$,$5);
                    strcat($$,"{");
                    strcat($$,$7);
                    strcat($$,$8);
                    strcat($$,"}");
                
                
                }
                | /*epsilon*/ {
                    $$ = (char*)malloc(sizeof(char)*1);
                    $$[0] = '\0';
                
                }
                ;

MethodDeclaration : MethodDeclaration PUBLIC Type IDENTIFIER '(' Type IDENTIFIER CTID ')' '{' TypeISC recursiveStatement RETURN Expression ';' '}' {
                    
                    $2="public";
                    $13="return";

                    $$ = (char*)malloc(sizeof(char)*(strlen($1) + strlen($2) + strlen($3)+ strlen($4)+ 1+ strlen($6)+ strlen($7)+ strlen($8)+ 1+ 1+ strlen($11)+ strlen($12)+ strlen($13)+ strlen($14)+ 1+ 1+1));
                    $$[0] = '\0';
                    strcat($$,$1);
                    strcat($$,$2);
                    strcat($$,$3);
                    strcat($$,$4);
                    strcat($$,"(");
                    strcat($$,$6);
                    strcat($$,$7);
                    strcat($$,$8);
                    strcat($$,")");
                    strcat($$,"{");
                    strcat($$,$11);
                    strcat($$,$12);
                    strcat($$,$13);
                    strcat($$,$14);
                    strcat($$,";");
                    strcat($$,"}");
                  
                  } 
                  |	MethodDeclaration PUBLIC Type IDENTIFIER '('  ')' '{' TypeISC recursiveStatement RETURN Expression ';' '}' {
                        
                        $2="public";
                        $10="return";
                        
                        $$ = (char*)malloc(sizeof(char)*(strlen($1) + strlen($3)+ strlen($4)+ 3+ strlen($8)+ strlen($9)+ strlen($10)+ strlen($11)+ 2+1));
                        $$[0] = '\0';
                        strcat($$,$1);
                        strcat($$,$2);
                        strcat($$,$3);
                        strcat($$,$4);
                        strcat($$,"(");
                        strcat($$,")");
                        strcat($$,"{");
                        strcat($$,$8);
                        strcat($$,$9);
                        strcat($$,$10);
                        strcat($$,$11);
                        strcat($$,";");
                        strcat($$,"}");
                  
                  }
                  | /*epsilon*/ {
                    $$ = (char*)malloc(sizeof(char)*1);
                    $$[0] = '\0';

                  
                  }
                  ;

Type :	INT '[' ']' {
            
            $1 = "int";
            $$ = (char*)malloc(sizeof(char)*(strlen($1)+2+1));
            $$[0] = '\0';
            
            strcat($$,$1);
            strcat($$,"[");
            strcat($$,"]");
     
     }
     |  BOOLEAN {
        $1="bool";

        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
        $$[0] = '\0';
        strcat($$,$1);
     
     }
     |	INT {
        $1="int";

        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
        $$[0] = '\0';
        strcat($$,$1);

     
     }
     |	IDENTIFIER {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
        $$[0] = '\0';
        strcat($$,$1);
     
     }
     ;

DOT : DOT '.' IDENTIFIER {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
        $$[0] = '\0';
        strcat($$,$1);
        strcat($$,".");
        strcat($$,$3);
    
    
    }
    | DOT '.' IDENTIFIER '(' Expression ')' ';' {
        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($5)+1+1+1));
        $$[0] = '\0';
        strcat($$,$1);
        strcat($$,".");
        strcat($$,$3);
        strcat($$,"(");
        strcat($$,$5);
        strcat($$,")");
        strcat($$,";");
    
    }
    | /*epsilon*/ {
        $$ = (char*)malloc(sizeof(char)*1);
        $$[0] = '\0';

    
    }
    ;

recursiveStatement: /*epsilon*/ {
                    $$ = (char*)malloc(sizeof(char)*1);
                    $$[0] = '\0';

                    
                  }
                  | Statement recursiveStatement {
                        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1));
                        $$[0] = '\0';
                        strcat($$,$1);
                        strcat($$,$2);
                  
                  }
                  ;

Statement : '{' recursiveStatement '}' {
              $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+1+1));
              $$[0] = '\0';
              strcat($$,"{");
              strcat($$,$2);
              strcat($$,"}");

          
          }
          | IDENTIFIER '=' Expression ';'{
              $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+1));
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"=");
              strcat($$,$3);
              strcat($$,";");
 
          
          }
          |	IDENTIFIER '[' Expression ']' '=' Expression ';' {
              $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+1+strlen($6)+1+1));
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"[");
              strcat($$,$3);
              strcat($$,"]");
              strcat($$,"=");
              strcat($$,$6);
              strcat($$,";");

          }
          |	IF '(' Expression ')' Statement {
              
              $1="if";
              $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($5)+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"(");
              strcat($$,$3);
              strcat($$,")");
              strcat($$,$5);

          
          }
          |	IF '(' Expression ')' Statement ELSE Statement {
              
              $1="if";
              $6="else";

              $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($5)+strlen($6)+strlen($7)+1));
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"(");
              strcat($$,$3);
              strcat($$,")");
              strcat($$,$5);
              strcat($$,$6);
              strcat($$,$7);

          
          
          
          }
          |	WHILE '(' Expression ')' Statement {
              $1="while";
              
              $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($5)+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"(");
              strcat($$,$3);
              strcat($$,")");
              strcat($$,$5);

          
          
          
          }
          |	IDENTIFIER '(' Expression ComExp ')' ';' {
               $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+strlen($4)+2+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"(");
              strcat($$,$3);
              strcat($$,$4);
              strcat($$,")");
              strcat($$,";");

          
          
          }
          |	IDENTIFIER '('  ')' ';' {
               $$ = (char*)malloc(sizeof(char)*(strlen($1)+3+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,"(");
              strcat($$,")");
              strcat($$,";");
                       
          }
          | IDENTIFIER DOT {
             $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,$2);
          
          }
          ;

MacroDefExpression  : '#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '(' Expression ')' {
                          
                          $2="define";

                          
                          $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+strlen($3)+1+strlen($5)+strlen($6)+2+strlen($9)+1+1));
                          $$[0] = '\0';
                          strcat($$,"#");
                          strcat($$,$2);
                          strcat($$,$3);
                          strcat($$,"(");
                          strcat($$,$5);
                          strcat($$,$6);
                          strcat($$,")");
                          strcat($$,"(");
                          strcat($$,$9);
                          strcat($$,")");
       
                      }
                    | '#' DEFINE IDENTIFIER '(' ')' '(' Expression ')' {
                          
                          $2="define";
                          $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+strlen($3)+2+strlen($7)+1+1));
                          $$[0] = '\0';
                          strcat($$,"#");
                          strcat($$,$2);
                          strcat($$,$3);
                          strcat($$,"(");
                          strcat($$,")");
                          strcat($$,"(");
                          strcat($$,$7);
                          strcat($$,")");
                          
                       }
                    ;

MacroDefStatement :	'#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '{' recursiveStatement '}' {
                        
                        $2="define";
                        $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+strlen($3)+1+strlen($5)+strlen($6)+2+strlen($9)+1+1));
                        $$[0] = '\0';
                          strcat($$,"#");
                          strcat($$,$2);
                          strcat($$,$3);
                          strcat($$,"(");
                          strcat($$,$5);
                          strcat($$,$6);
                          strcat($$,")");
                          strcat($$,"{");
                          strcat($$,$9);
                          strcat($$,"}");

                  }
                  |	'#' DEFINE IDENTIFIER '(' ')' '{' recursiveStatement '}' {
                        
                        $2="define";
                        $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+strlen($3)+3+strlen($7)+1+1));
                          $$[0] = '\0';
                          strcat($$,"#");
                          strcat($$,$2);
                          strcat($$,$3);
                          strcat($$,"(");
                          strcat($$,")");
                          strcat($$,"{");
                          strcat($$,$7);
                          strcat($$,"}");
                  }
                  ;

ComExp : ComExp ',' Expression {
            $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
            $$[0] = '\0';
            strcat($$,$1);
            strcat($$,",");
            strcat($$,$3);
       
       }
       |/*epsilon*/ {
            $$ = (char*)malloc(sizeof(char)*1);
            $$[0] = '\0';
       
       }
       ;

ComIden : ComIden ';' IDENTIFIER {
            $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
            $$[0] = '\0';
            strcat($$,$1);
            strcat($$,";");
            strcat($$,$3);
        
        }
        |/*epsilon*/ {
            $$ = (char*)malloc(sizeof(char)*1);
            $$[0] = '\0';

        
        }
        ;

MacroDefinition : MacroDefinition MacroDefExpression {
                    $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1));
                    $$[0] = '\0';
                    strcat($$,$1);
                    strcat($$,$2);
                
                }
                | MacroDefinition MacroDefStatement {
                    $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1));
                    $$[0] = '\0';
                    strcat($$,$1);
                    strcat($$,$2);
                
                }
                | /*epsilon*/ {
                    $$ = (char*)malloc(sizeof(char)*1);
                    $$[0] = '\0';
                
                }
                ;

TypeISC : TypeISC  Type IDENTIFIER ';' {
            $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+strlen($3)+1+1));
            $$[0] = '\0';
            strcat($$,$1);
            strcat($$,$2);
            strcat($$,$3);
            strcat($$,";");
 
        
        }
        | /*epsilon*/ {
            $$ = (char*)malloc(sizeof(char)*1);
            $$[0] = '\0';

        
        }
        ;

CTID : CTID ',' Type IDENTIFIER {
            $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+strlen($4)+1));
            $$[0] = '\0';
            strcat($$,$1);
            strcat($$,",");
            strcat($$,$3);
            strcat($$,$4);

     
     }
     | /*epsilon*/ {
        $$ = (char*)malloc(sizeof(char)*1);
        $$[0] = '\0';

     }
     ;


Expression  :	PrimaryExpression '&' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"&");
                strcat($$,$3);
            }
            |   PrimaryExpression '<' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"<");
                strcat($$,$3);

            
            
            }
            |   PrimaryExpression '+' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"+");
                strcat($$,$3);

            
            
            }
            |   PrimaryExpression '-' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"-");
                strcat($$,$3);

            
            }
            |   PrimaryExpression '*' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"*");
                strcat($$,$3);

            
            
            }
            |   PrimaryExpression '/' PrimaryExpression {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"/");
                strcat($$,$3);

            
            
            
            }
            |	PrimaryExpression '[' PrimaryExpression ']' {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"[");
                strcat($$,$3);
                strcat($$,"]");

            
            }
            |	PrimaryExpression '.' length {
                $3="length";
                
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,".");
                strcat($$,$3);

            
            }
            |	PrimaryExpression '.' IDENTIFIER '(' Expression ComExp ')' {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+1+strlen($5)+strlen($6)+1+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,".");
                strcat($$,$3);
                strcat($$,"(");
                strcat($$,$5);
                strcat($$,$6);
                strcat($$,")");

            
            
            }
            |	PrimaryExpression '.' IDENTIFIER '(' ')' {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+2+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,".");
                strcat($$,$3);
                strcat($$,"(");
                strcat($$,")");
            
            }
            |	IDENTIFIER '(' Expression ComExp ')'  {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1+strlen($3)+strlen($4)+1+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"(");
                strcat($$,$3);
                strcat($$,$4);
                strcat($$,")");

            
            }
            |	IDENTIFIER '(' ')' {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+2+1));
                $$[0] = '\0';
                strcat($$,$1);
                strcat($$,"(");
                strcat($$,")");
            
            }
            |   PrimaryExpression {
            
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
                $$[0] = '\0';
                strcat($$,$1);
            
            }
            ;

PrimaryExpression   :	INTVAL {
                        $$ = (char*)malloc(sizeof(char)*(18));
                        sprintf($$,"%d",$1);

                    
                    }
                    |   BOOLVAL {
                        $$ = (char*)malloc(sizeof(char)*(strlen($1) + 1));
                        $$[0] = '\0';
                        strcat($$,$1);

                    
                    }
                    |	IDENTIFIER {
                        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
                        $$[0] = '\0';
                        strcat($$,$1);
                    
                    }
                    |	THIS {
                        $1 = "this";
                        
                        $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
                        $$[0] = '\0';
                        strcat($$,$1);
 
                    }
                    |	NEW INT '[' Expression ']' {
                        
                        $1="new";
                        $2="int";
                        
                        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1+strlen($4)+1+1));
                        $$[0] = '\0';
                        strcat($$,$1);
                        strcat($$,$2);
                        strcat($$,"[");
                        strcat($$,$4);
                        strcat($$,"]");

                    
                    
                    }
                    |	NEW IDENTIFIER '(' ')' {
                        
                        $1 = "new";    
                        $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+2+1));
                        $$[0] = '\0';
                        strcat($$,$1);
                        strcat($$,$2);
                        strcat($$,"(");
                        strcat($$,")");
                    
                    }
                    |	'!' Expression {
                        $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+1));
                        $$[0] = '\0';
                        strcat($$,"!");
                        strcat($$,$2);
 
                    
                    }
                    |	'(' Expression ')' {
                        $$ = (char*)malloc(sizeof(char)*(1+strlen($2)+1+1));
                        $$[0] = '\0';
                        strcat($$,"(");
                        strcat($$,$2);
                        strcat($$,")");
                    } 
                    ;

%%
main(){
	// parse through the input until there is no more.
	do {
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s){
	printf ("Parse error: %s\n" , s);
    exit(0);
    
}
