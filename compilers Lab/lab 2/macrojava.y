%{
/*
    Author : Karthik Abinav S
    Roll : CS10B057
*/
#include<stdio.h>
#include<stdlib.h>
#include <string.h>

extern FILE* yyin;

char symbol[100][100];
char expansion[100][100];
char parameters[100][100][10];//Allowing 10 parameters utmost in the macro
int numOfParams[100];
int numberOfMacros = 0;

//Initialise all the number of paramters for each macro to 0
void initialize(){
    int i;
    for(i=0;i<100;i++)
        numOfParams[i] = 0;
}

// To check if a particular identifier is present as a macr0
int isPresent(char key[])
{
    int i;
    for(i=0;i<numberOfMacros;i++)
    {
        if(strcmp(key,symbol[i]) == 0)
            return 1;

    }

    return 0;

}

//Replace a particular macro with its macro statement
char* findAndReplace(char key[],char params[100][10])
{
    int i; 
    for(i=0;i<numberOfMacros;i++)
    {
        if(strcmp(key,symbol[i]) == 0)
        {
            
            int k;
            char *retVal= (char*)malloc(sizeof(char)*100);
            retVal[0] = '\0';
            int retvalC = 0;

            if(numOfParams[i] == 0)
                strcpy(retVal,expansion[i]);
            
            for(k=0;k<numOfParams[i];k++)
            {
                int rr;
                for(rr=0;rr<strlen(expansion[i]);rr++)
                {
                    int temp = 0;
                    char tempString[100];
                    
                    int prevR = rr;
                    while(expansion[i][rr] == parameters[i][k][temp])
                    {
                        tempString[temp] = expansion[i][rr];
                        temp++;
                        rr++;

                    }
                    tempString[temp] = '\0';
                    if(strcmp(parameters[i][k],tempString) == 0)
                    {
                        strcat(retVal,params[k]);
                        retvalC += strlen(params[k]);
                        rr--;
                    }
                    else
                    {
                        rr = prevR;
                        retVal[retvalC++] = expansion[i][rr];


                    }

                }
            }
            if(numOfParams[i]!=0)
            retVal[retvalC] = '\0';
            return retVal;
        }

    }
    return '\0';
}

//Push a new macro in to the symbol table
void push(char key[] , char value[] , char parameter[100][10])
{
    strcpy(symbol[numberOfMacros] , key);
    strcpy(expansion[numberOfMacros] , value);
    int i;
    for(i=0;i<numOfParams[numberOfMacros];i++)
    {
        strcpy(parameters[numberOfMacros][i] , parameter[i]);
    }
    numberOfMacros++; 
}


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
                                        
                                        $$ = (char*) malloc(sizeof(char)*(strlen($2)+strlen($3)+1));
                                        $$[0] = '\0';
                                        
                                        printf("// Macrojava code parsed and minijava code generated successfully.\n");
                                        strcat($$,$2);
                                        strcat($$,$3);
                                        printf("%s\n",$$);
                                        
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
                        
                        $$ = (char*)malloc(sizeof(char)*(strlen($1) + strlen($2) + strlen($3)+ strlen($4)+ 3+ strlen($8)+ strlen($9)+ strlen($10)+ strlen($11)+ 2+1));
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
        $1="boolean";

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
             if(isPresent($1) == 0){
                  strcat($$,$1);
                  strcat($$,"(");
                  strcat($$,$3);
                  strcat($$,$4);
                  strcat($$,")");
                  strcat($$,";");
              }
              else
              {
                      char paramsConcat[100][10];
                      int i;
                      strcpy(paramsConcat[0], $3);
                      int temp = 1;
                      int r =0;
                      for(i=0;i<=strlen($4);i++)
                      {
                        if($4[i] == ',' || $4[i] == '\0')
                        {
                            paramsConcat[temp][r++] = '\0';
                            temp++;
                            r=0;
                        }
                        else
                        {
                            paramsConcat[temp][r++] = $4[i]; 

                        }

                       }
                    
                      strcat($$,findAndReplace($1,paramsConcat));
            }

          
          
          }
          |	IDENTIFIER '('  ')' ';' {
               $$ = (char*)malloc(sizeof(char)*(strlen($1)+3+1));
            
              $$[0] = '\0';

              if(isPresent($1) == 0){
                strcat($$,$1);
                strcat($$,"(");
                strcat($$,")");
                strcat($$,";");
              }

              else
              {
                   char tt[100][10];
                   strcat($$,findAndReplace($1,tt));
                   strcat($$,";");

               }
                       
          }
          | IDENTIFIER DOT {
             $$ = (char*)malloc(sizeof(char)*(strlen($1)+strlen($2)+1));
            
              $$[0] = '\0';
              strcat($$,$1);
              strcat($$,$2);
          
          }
          ;

MacroDefExpression  : '#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '(' Expression ')' {
                          
                          char tt[100][10];
                          strcpy(tt[0],$5);
                          
                          int temp = 1;
                          int i,r=0;
                          for(i=0;i<=strlen($6);i++)
                          {     
                                if($6[i] == ',' || $6[i] =='\0')
                                {
                                    tt[temp][r++] = '\0';;
                                    temp++;
                                    r = 0;
                                    numOfParams[numberOfMacros]++;

                                }
                                else
                                {
                                    tt[temp][r++] = $6[i];
                                }

                            }
                          
                          push($3,$9,tt);
       
                      }
                    | '#' DEFINE IDENTIFIER '(' ')' '(' Expression ')' {
                          
                          numOfParams[numberOfMacros] = 0;
                          char tt[100][10];
                          push($3,$7,tt);

                       }
                    ;

MacroDefStatement :	'#' DEFINE IDENTIFIER '(' IDENTIFIER ComIden ')' '{' recursiveStatement '}' {
                          char tt[100][10];
                          strcpy(tt[0],$5);
                          int temp = 1;
                          int i,r=0;
                          for(i=0;i<=strlen($6);i++)
                          {     
                                if($6[i] == ',' || $6[i] =='\0')
                                {
                                    tt[temp][r++] = '\0';;
                                    temp++;
                                    r = 0;
                                    numOfParams[numberOfMacros]++;

                                }
                                else
                                {
                                    tt[temp][r++] = $6[i];
                                }

                            }

                          push($3,$9,tt);

                  }
                  |	'#' DEFINE IDENTIFIER '(' ')' '{' recursiveStatement '}' {
                          numOfParams[numberOfMacros] = 0;
                          char tt[100][10];
                          push($3,$7,tt);
 
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
                                    
                }
                | MacroDefinition MacroDefStatement {
                                    
                }
                | /*epsilon*/ {
                                    
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
                
                if(!isPresent($1)){
                    strcat($$,$1);
                    strcat($$,"(");
                    strcat($$,$3);
                    strcat($$,$4);
                    strcat($$,")");
                }
                else
                {   
                      char paramsConcat[100][10];
                      int i;
                      strcpy(paramsConcat[0], $3);
                      int temp = 1;
                      int r =0;
                      for(i=0;i<=strlen($4);i++)
                      {
                        if($4[i] == ',' || $4[i] == '\0')
                        {
                            paramsConcat[temp][r++] = '\0';
                            temp++;
                            r=0;
                        }
                        else
                        {
                            paramsConcat[temp][r++] = $4[i]; 

                        }

                       }
                        
                      strcat($$,findAndReplace($1,paramsConcat));
            }


            }
            |	IDENTIFIER '(' ')' {
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+2+1));
                $$[0] = '\0';
                if(!isPresent($1)){
                    strcat($$,$1);
                    strcat($$,"(");
                    strcat($$,")");
                }
                else
                {
                    char tt[100][10];
                    strcat($$,findAndReplace($1,tt));
                }
            
            }
            |   PrimaryExpression {
            
                $$ = (char*)malloc(sizeof(char)*(strlen($1)+1));
                $$[0] = '\0';
                strcat($$,$1);
            
            }
            ;

PrimaryExpression   :	INTVAL {
                        $$ = (char*)malloc(sizeof(char)*(18));
                        $$[0] = '\0';
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
    initialize();
	
    // parse through the input until there is no more.
	do {
		yyparse();
	} while (!feof(yyin));
}

void yyerror(const char *s){
	printf ("// Failed to parse macrojava code.");
    exit(0);
    
}
