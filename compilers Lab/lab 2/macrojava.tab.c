/* A Bison parser, made by GNU Bison 2.5.  */

/* Bison implementation for Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2011 Free Software Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */

/* C LALR(1) parser skeleton written by Richard Stallman, by
   simplifying the original so-called "semantic" parser.  */

/* All symbols defined below should begin with yy or YY, to avoid
   infringing on user name space.  This should be done even for local
   variables, as they might otherwise be expanded by user macros.
   There are some unavoidable exceptions within include files to
   define necessary library symbols; they are noted "INFRINGES ON
   USER NAME SPACE" below.  */

/* Identify Bison output.  */
#define YYBISON 1

/* Bison version.  */
#define YYBISON_VERSION "2.5"

/* Skeleton name.  */
#define YYSKELETON_NAME "yacc.c"

/* Pure parsers.  */
#define YYPURE 0

/* Push parsers.  */
#define YYPUSH 0

/* Pull parsers.  */
#define YYPULL 1

/* Using locations.  */
#define YYLSP_NEEDED 0



/* Copy the first part of user declarations.  */

/* Line 268 of yacc.c  */
#line 1 "macrojava.y"

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


/* Line 268 of yacc.c  */
#line 187 "macrojava.tab.c"

/* Enabling traces.  */
#ifndef YYDEBUG
# define YYDEBUG 1
#endif

/* Enabling verbose error messages.  */
#ifdef YYERROR_VERBOSE
# undef YYERROR_VERBOSE
# define YYERROR_VERBOSE 1
#else
# define YYERROR_VERBOSE 0
#endif

/* Enabling the token table.  */
#ifndef YYTOKEN_TABLE
# define YYTOKEN_TABLE 0
#endif


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     INTVAL = 258,
     BOOLVAL = 259,
     KEYWORD = 260,
     OPERATOR = 261,
     IDENTIFIER = 262,
     THIS = 263,
     NEW = 264,
     RETURN = 265,
     CLASS = 266,
     DEFINE = 267,
     PUBLIC = 268,
     STATIC = 269,
     VOID = 270,
     INT = 271,
     BOOLEAN = 272,
     IF = 273,
     ELSE = 274,
     WHILE = 275,
     EXTENDS = 276,
     EndOfFile = 277,
     STRING = 278,
     length = 279,
     GE = 280,
     LE = 281,
     NE = 282
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union YYSTYPE
{

/* Line 293 of yacc.c  */
#line 116 "macrojava.y"

	int ival; // integers
	char *bval;// true and false
	char  *kw; // such as class, int, boolean etc
	char *op; // such as +, -, * etc
	char *id; // identifiers



/* Line 293 of yacc.c  */
#line 260 "macrojava.tab.c"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif


/* Copy the second part of user declarations.  */


/* Line 343 of yacc.c  */
#line 272 "macrojava.tab.c"

#ifdef short
# undef short
#endif

#ifdef YYTYPE_UINT8
typedef YYTYPE_UINT8 yytype_uint8;
#else
typedef unsigned char yytype_uint8;
#endif

#ifdef YYTYPE_INT8
typedef YYTYPE_INT8 yytype_int8;
#elif (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
typedef signed char yytype_int8;
#else
typedef short int yytype_int8;
#endif

#ifdef YYTYPE_UINT16
typedef YYTYPE_UINT16 yytype_uint16;
#else
typedef unsigned short int yytype_uint16;
#endif

#ifdef YYTYPE_INT16
typedef YYTYPE_INT16 yytype_int16;
#else
typedef short int yytype_int16;
#endif

#ifndef YYSIZE_T
# ifdef __SIZE_TYPE__
#  define YYSIZE_T __SIZE_TYPE__
# elif defined size_t
#  define YYSIZE_T size_t
# elif ! defined YYSIZE_T && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#  include <stddef.h> /* INFRINGES ON USER NAME SPACE */
#  define YYSIZE_T size_t
# else
#  define YYSIZE_T unsigned int
# endif
#endif

#define YYSIZE_MAXIMUM ((YYSIZE_T) -1)

#ifndef YY_
# if defined YYENABLE_NLS && YYENABLE_NLS
#  if ENABLE_NLS
#   include <libintl.h> /* INFRINGES ON USER NAME SPACE */
#   define YY_(msgid) dgettext ("bison-runtime", msgid)
#  endif
# endif
# ifndef YY_
#  define YY_(msgid) msgid
# endif
#endif

/* Suppress unused-variable warnings by "using" E.  */
#if ! defined lint || defined __GNUC__
# define YYUSE(e) ((void) (e))
#else
# define YYUSE(e) /* empty */
#endif

/* Identity function, used to suppress warnings about constant conditions.  */
#ifndef lint
# define YYID(n) (n)
#else
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static int
YYID (int yyi)
#else
static int
YYID (yyi)
    int yyi;
#endif
{
  return yyi;
}
#endif

#if ! defined yyoverflow || YYERROR_VERBOSE

/* The parser invokes alloca or malloc; define the necessary symbols.  */

# ifdef YYSTACK_USE_ALLOCA
#  if YYSTACK_USE_ALLOCA
#   ifdef __GNUC__
#    define YYSTACK_ALLOC __builtin_alloca
#   elif defined __BUILTIN_VA_ARG_INCR
#    include <alloca.h> /* INFRINGES ON USER NAME SPACE */
#   elif defined _AIX
#    define YYSTACK_ALLOC __alloca
#   elif defined _MSC_VER
#    include <malloc.h> /* INFRINGES ON USER NAME SPACE */
#    define alloca _alloca
#   else
#    define YYSTACK_ALLOC alloca
#    if ! defined _ALLOCA_H && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
#     include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#     ifndef EXIT_SUCCESS
#      define EXIT_SUCCESS 0
#     endif
#    endif
#   endif
#  endif
# endif

# ifdef YYSTACK_ALLOC
   /* Pacify GCC's `empty if-body' warning.  */
#  define YYSTACK_FREE(Ptr) do { /* empty */; } while (YYID (0))
#  ifndef YYSTACK_ALLOC_MAXIMUM
    /* The OS might guarantee only one guard page at the bottom of the stack,
       and a page size can be as small as 4096 bytes.  So we cannot safely
       invoke alloca (N) if N exceeds 4096.  Use a slightly smaller number
       to allow for a few compiler-allocated temporary stack slots.  */
#   define YYSTACK_ALLOC_MAXIMUM 4032 /* reasonable circa 2006 */
#  endif
# else
#  define YYSTACK_ALLOC YYMALLOC
#  define YYSTACK_FREE YYFREE
#  ifndef YYSTACK_ALLOC_MAXIMUM
#   define YYSTACK_ALLOC_MAXIMUM YYSIZE_MAXIMUM
#  endif
#  if (defined __cplusplus && ! defined EXIT_SUCCESS \
       && ! ((defined YYMALLOC || defined malloc) \
	     && (defined YYFREE || defined free)))
#   include <stdlib.h> /* INFRINGES ON USER NAME SPACE */
#   ifndef EXIT_SUCCESS
#    define EXIT_SUCCESS 0
#   endif
#  endif
#  ifndef YYMALLOC
#   define YYMALLOC malloc
#   if ! defined malloc && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void *malloc (YYSIZE_T); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
#  ifndef YYFREE
#   define YYFREE free
#   if ! defined free && ! defined EXIT_SUCCESS && (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
void free (void *); /* INFRINGES ON USER NAME SPACE */
#   endif
#  endif
# endif
#endif /* ! defined yyoverflow || YYERROR_VERBOSE */


#if (! defined yyoverflow \
     && (! defined __cplusplus \
	 || (defined YYSTYPE_IS_TRIVIAL && YYSTYPE_IS_TRIVIAL)))

/* A type that is properly aligned for any stack member.  */
union yyalloc
{
  yytype_int16 yyss_alloc;
  YYSTYPE yyvs_alloc;
};

/* The size of the maximum gap between one aligned stack and the next.  */
# define YYSTACK_GAP_MAXIMUM (sizeof (union yyalloc) - 1)

/* The size of an array large to enough to hold all stacks, each with
   N elements.  */
# define YYSTACK_BYTES(N) \
     ((N) * (sizeof (yytype_int16) + sizeof (YYSTYPE)) \
      + YYSTACK_GAP_MAXIMUM)

# define YYCOPY_NEEDED 1

/* Relocate STACK from its old location to the new one.  The
   local variables YYSIZE and YYSTACKSIZE give the old and new number of
   elements in the stack, and YYPTR gives the new location of the
   stack.  Advance YYPTR to a properly aligned location for the next
   stack.  */
# define YYSTACK_RELOCATE(Stack_alloc, Stack)				\
    do									\
      {									\
	YYSIZE_T yynewbytes;						\
	YYCOPY (&yyptr->Stack_alloc, Stack, yysize);			\
	Stack = &yyptr->Stack_alloc;					\
	yynewbytes = yystacksize * sizeof (*Stack) + YYSTACK_GAP_MAXIMUM; \
	yyptr += yynewbytes / sizeof (*yyptr);				\
      }									\
    while (YYID (0))

#endif

#if defined YYCOPY_NEEDED && YYCOPY_NEEDED
/* Copy COUNT objects from FROM to TO.  The source and destination do
   not overlap.  */
# ifndef YYCOPY
#  if defined __GNUC__ && 1 < __GNUC__
#   define YYCOPY(To, From, Count) \
      __builtin_memcpy (To, From, (Count) * sizeof (*(From)))
#  else
#   define YYCOPY(To, From, Count)		\
      do					\
	{					\
	  YYSIZE_T yyi;				\
	  for (yyi = 0; yyi < (Count); yyi++)	\
	    (To)[yyi] = (From)[yyi];		\
	}					\
      while (YYID (0))
#  endif
# endif
#endif /* !YYCOPY_NEEDED */

/* YYFINAL -- State number of the termination state.  */
#define YYFINAL  3
/* YYLAST -- Last index in YYTABLE.  */
#define YYLAST   226

/* YYNTOKENS -- Number of terminals.  */
#define YYNTOKENS  48
/* YYNNTS -- Number of nonterminals.  */
#define YYNNTS  18
/* YYNRULES -- Number of rules.  */
#define YYNRULES  63
/* YYNRULES -- Number of states.  */
#define YYNSTATES  185

/* YYTRANSLATE(YYLEX) -- Bison symbol number corresponding to YYLEX.  */
#define YYUNDEFTOK  2
#define YYMAXUTOK   282

#define YYTRANSLATE(YYX)						\
  ((unsigned int) (YYX) <= YYMAXUTOK ? yytranslate[YYX] : YYUNDEFTOK)

/* YYTRANSLATE[YYLEX] -- Bison symbol number corresponding to YYLEX.  */
static const yytype_uint8 yytranslate[] =
{
       0,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    47,     2,    44,     2,    35,    46,     2,
      37,    40,    33,    31,    45,    32,    43,    34,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,    42,
      25,    27,    26,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,    38,     2,    39,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,    36,     2,    41,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     2,     2,     2,     2,
       2,     2,     2,     2,     2,     2,     1,     2,     3,     4,
       5,     6,     7,     8,     9,    10,    11,    12,    13,    14,
      15,    16,    17,    18,    19,    20,    21,    22,    23,    24,
      28,    29,    30
};

#if YYDEBUG
/* YYPRHS[YYN] -- Index of the first RHS symbol of rule number YYN in
   YYRHS.  */
static const yytype_uint16 yyprhs[] =
{
       0,     0,     3,     8,    26,    34,    44,    45,    62,    76,
      77,    81,    83,    85,    87,    91,    99,   100,   101,   104,
     108,   113,   121,   127,   135,   141,   148,   153,   156,   167,
     176,   187,   196,   200,   201,   205,   206,   209,   212,   213,
     218,   219,   224,   225,   229,   233,   237,   241,   245,   249,
     254,   258,   266,   272,   278,   282,   284,   286,   288,   290,
     292,   298,   303,   306
};

/* YYRHS -- A `-1'-separated list of the rules' RHS.  */
static const yytype_int8 yyrhs[] =
{
      49,     0,    -1,    61,    50,    51,    22,    -1,    11,     7,
      36,    13,    14,    15,     7,    37,    23,    38,    39,     7,
      40,    36,    55,    41,    41,    -1,    51,    11,     7,    36,
      62,    52,    41,    -1,    51,    11,     7,    21,     7,    36,
      62,    52,    41,    -1,    -1,    52,    13,    53,     7,    37,
      53,     7,    63,    40,    36,    62,    55,    10,    64,    42,
      41,    -1,    52,    13,    53,     7,    37,    40,    36,    62,
      55,    10,    64,    42,    41,    -1,    -1,    16,    38,    39,
      -1,    17,    -1,    16,    -1,     7,    -1,    54,    43,     7,
      -1,    54,    43,     7,    37,    64,    40,    42,    -1,    -1,
      -1,    56,    55,    -1,    36,    55,    41,    -1,     7,    27,
      64,    42,    -1,     7,    38,    64,    39,    27,    64,    42,
      -1,    18,    37,    64,    40,    56,    -1,    18,    37,    64,
      40,    56,    19,    56,    -1,    20,    37,    64,    40,    56,
      -1,     7,    37,    64,    59,    40,    42,    -1,     7,    37,
      40,    42,    -1,     7,    54,    -1,    44,    12,     7,    37,
       7,    60,    40,    37,    64,    40,    -1,    44,    12,     7,
      37,    40,    37,    64,    40,    -1,    44,    12,     7,    37,
       7,    60,    40,    36,    55,    41,    -1,    44,    12,     7,
      37,    40,    36,    55,    41,    -1,    59,    45,    64,    -1,
      -1,    60,    42,     7,    -1,    -1,    61,    57,    -1,    61,
      58,    -1,    -1,    62,    53,     7,    42,    -1,    -1,    63,
      45,    53,     7,    -1,    -1,    65,    46,    65,    -1,    65,
      25,    65,    -1,    65,    31,    65,    -1,    65,    32,    65,
      -1,    65,    33,    65,    -1,    65,    34,    65,    -1,    65,
      38,    65,    39,    -1,    65,    43,    24,    -1,    65,    43,
       7,    37,    64,    59,    40,    -1,    65,    43,     7,    37,
      40,    -1,     7,    37,    64,    59,    40,    -1,     7,    37,
      40,    -1,    65,    -1,     3,    -1,     4,    -1,     7,    -1,
       8,    -1,     9,    16,    38,    64,    39,    -1,     9,     7,
      37,    40,    -1,    47,    64,    -1,    37,    64,    40,    -1
};

/* YYRLINE[YYN] -- source line where rule number YYN was defined.  */
static const yytype_uint16 yyrline[] =
{
       0,   172,   172,   187,   217,   233,   250,   257,   282,   304,
     312,   323,   331,   340,   348,   357,   369,   377,   383,   392,
     401,   411,   423,   437,   456,   472,   513,   534,   544,   571,
     580,   605,   613,   621,   628,   636,   644,   647,   650,   655,
     665,   673,   683,   691,   698,   708,   718,   727,   737,   748,
     758,   769,   783,   793,   832,   847,   856,   863,   870,   876,
     884,   900,   911,   919
};
#endif

#if YYDEBUG || YYERROR_VERBOSE || YYTOKEN_TABLE
/* YYTNAME[SYMBOL-NUM] -- String name of the symbol SYMBOL-NUM.
   First, the terminals, then, starting at YYNTOKENS, nonterminals.  */
static const char *const yytname[] =
{
  "$end", "error", "$undefined", "INTVAL", "BOOLVAL", "KEYWORD",
  "OPERATOR", "IDENTIFIER", "THIS", "NEW", "RETURN", "CLASS", "DEFINE",
  "PUBLIC", "STATIC", "VOID", "INT", "BOOLEAN", "IF", "ELSE", "WHILE",
  "EXTENDS", "EndOfFile", "STRING", "length", "'<'", "'>'", "'='", "GE",
  "LE", "NE", "'+'", "'-'", "'*'", "'/'", "'%'", "'{'", "'('", "'['",
  "']'", "')'", "'}'", "';'", "'.'", "'#'", "','", "'&'", "'!'", "$accept",
  "Goal", "MainClass", "TypeDeclaration", "MethodDeclaration", "Type",
  "DOT", "recursiveStatement", "Statement", "MacroDefExpression",
  "MacroDefStatement", "ComExp", "ComIden", "MacroDefinition", "TypeISC",
  "CTID", "Expression", "PrimaryExpression", 0
};
#endif

# ifdef YYPRINT
/* YYTOKNUM[YYLEX-NUM] -- Internal token number corresponding to
   token YYLEX-NUM.  */
static const yytype_uint16 yytoknum[] =
{
       0,   256,   257,   258,   259,   260,   261,   262,   263,   264,
     265,   266,   267,   268,   269,   270,   271,   272,   273,   274,
     275,   276,   277,   278,   279,    60,    62,    61,   280,   281,
     282,    43,    45,    42,    47,    37,   123,    40,    91,    93,
      41,   125,    59,    46,    35,    44,    38,    33
};
# endif

/* YYR1[YYN] -- Symbol number of symbol that rule YYN derives.  */
static const yytype_uint8 yyr1[] =
{
       0,    48,    49,    50,    51,    51,    51,    52,    52,    52,
      53,    53,    53,    53,    54,    54,    54,    55,    55,    56,
      56,    56,    56,    56,    56,    56,    56,    56,    57,    57,
      58,    58,    59,    59,    60,    60,    61,    61,    61,    62,
      62,    63,    63,    64,    64,    64,    64,    64,    64,    64,
      64,    64,    64,    64,    64,    64,    65,    65,    65,    65,
      65,    65,    65,    65
};

/* YYR2[YYN] -- Number of symbols composing right hand side of rule YYN.  */
static const yytype_uint8 yyr2[] =
{
       0,     2,     4,    17,     7,     9,     0,    16,    13,     0,
       3,     1,     1,     1,     3,     7,     0,     0,     2,     3,
       4,     7,     5,     7,     5,     6,     4,     2,    10,     8,
      10,     8,     3,     0,     3,     0,     2,     2,     0,     4,
       0,     4,     0,     3,     3,     3,     3,     3,     3,     4,
       3,     7,     5,     5,     3,     1,     1,     1,     1,     1,
       5,     4,     2,     3
};

/* YYDEFACT[STATE-NAME] -- Default reduction number in state STATE-NUM.
   Performed when YYTABLE doesn't specify something else to do.  Zero
   means the default is an error.  */
static const yytype_uint8 yydefact[] =
{
      38,     0,     0,     1,     0,     0,     6,    36,    37,     0,
       0,     0,     0,     0,     0,     2,     0,     0,     0,     0,
      35,     0,     0,    40,     0,     0,    17,     0,     0,     9,
       0,     0,     0,    16,     0,     0,    17,     0,    17,    56,
      57,    58,    59,     0,     0,     0,     0,    55,    40,    13,
      12,    11,     0,     0,     0,    17,     0,    34,     0,     0,
       0,    27,     0,     0,     0,    31,    18,     0,     0,     0,
       0,    62,    29,     0,     0,     0,     0,     0,     0,     0,
       0,     9,     0,     0,     4,     0,     0,     0,     0,     0,
       0,    33,     0,     0,     0,     0,    19,    54,    33,     0,
       0,    63,    58,    44,    45,    46,    47,    48,     0,     0,
      50,    43,     0,    10,     0,    39,     0,    30,    28,    20,
      26,     0,     0,    14,     0,     0,     0,    61,     0,    49,
       0,     5,     0,     0,     0,     0,     0,     0,    22,    24,
      53,    60,    52,    33,     0,     0,    25,    32,     0,     0,
       0,     0,     0,     0,     0,    21,     0,    23,    51,    40,
      42,    17,    15,    17,     0,     0,    16,     0,     0,     0,
       0,     0,    40,     0,     3,     0,    17,    41,     0,     0,
       8,     0,     0,     0,     7
};

/* YYDEFGOTO[NTERM-NUM].  */
static const yytype_int16 yydefgoto[] =
{
      -1,     1,     6,    11,    52,    53,    61,    37,    38,     7,
       8,   121,    25,     2,    29,   164,    46,    47
};

/* YYPACT[STATE-NUM] -- Index in YYTABLE of the portion describing
   STATE-NUM.  */
#define YYPACT_NINF -110
static const yytype_int16 yypact[] =
{
    -110,    37,    17,  -110,    10,    11,  -110,  -110,  -110,    70,
      46,    61,    68,    51,   106,  -110,   109,    29,    72,   111,
    -110,   -26,   127,  -110,   132,    69,    96,    40,   108,   105,
     112,    94,   134,    80,   120,   122,    96,   107,    96,  -110,
    -110,   123,  -110,    66,    40,    40,   121,   104,  -110,  -110,
     124,  -110,    -8,   138,   140,    96,    40,  -110,    40,     5,
      40,   103,    40,    40,   125,  -110,  -110,    23,   128,   126,
     129,  -110,  -110,    47,    47,    47,    47,    47,    47,    52,
      47,   105,   131,   105,  -110,   130,   133,   135,   137,   136,
     139,  -110,   141,   160,   142,   143,  -110,  -110,  -110,   144,
      40,  -110,  -110,  -110,  -110,  -110,  -110,  -110,   146,   149,
    -110,  -110,    45,  -110,   161,  -110,   148,  -110,  -110,  -110,
    -110,    34,   147,   151,    96,    96,    35,  -110,   150,  -110,
      31,  -110,   153,   166,   152,    40,    40,    40,   156,  -110,
    -110,  -110,  -110,  -110,    50,   155,  -110,  -110,   154,   157,
      96,    65,   162,   172,   163,  -110,   158,  -110,  -110,  -110,
    -110,    96,  -110,    84,    79,   164,    58,   181,   165,   105,
     167,    40,  -110,   185,  -110,   168,    84,  -110,   170,   183,
    -110,    40,   171,   173,  -110
};

/* YYPGOTO[NTERM-NUM].  */
static const yytype_int16 yypgoto[] =
{
    -110,  -110,  -110,  -110,   145,   -80,  -110,   -36,  -109,  -110,
    -110,   -97,  -110,  -110,   -44,  -110,   -38,    78
};

/* YYTABLE[YYPACT[STATE-NUM]].  What to do in state STATE-NUM.  If
   positive, shift that token.  If negative, reduce the rule which
   number is the opposite.  If YYTABLE_NINF, syntax error.  */
#define YYTABLE_NINF -14
static const yytype_int16 yytable[] =
{
      64,   126,    66,   114,    81,    83,    70,    71,    39,    40,
      26,    27,    41,    42,    43,   138,   139,     9,    88,    87,
      89,    91,    92,    10,    94,    95,    39,    40,     4,    98,
      41,    42,    43,    84,    39,    40,    20,     3,    41,    42,
      43,   157,    44,    39,    40,    90,   151,    41,    42,    43,
      39,    40,    45,    13,   102,    42,    43,    49,    83,   109,
      44,     5,   128,    97,   153,   -13,    50,    51,    44,    21,
      45,   142,    14,    68,   134,   140,   110,    44,    45,   135,
     135,    16,    69,    15,    44,    58,   131,    45,    17,   173,
     152,   166,   143,    22,    45,    59,    60,   147,   148,   149,
      50,    51,    34,    33,    35,   158,    12,    58,    23,    31,
     135,    32,    49,    18,    34,   163,    35,    59,    60,   168,
      36,    50,    51,    19,   169,   165,    24,   167,   176,    73,
      55,    56,    36,   175,    28,    74,    75,    76,    77,    30,
     179,    57,    78,   182,    48,    85,    93,    79,    65,    54,
      80,   103,   104,   105,   106,   107,   108,    62,   111,    63,
      67,    72,    82,    86,   100,    99,    96,   123,   132,   101,
     113,   116,   115,   145,   136,   150,   117,   118,   119,   160,
     122,   120,   124,   125,   127,   129,   130,   133,   137,   141,
     144,   171,   177,   181,   146,   154,   155,   156,   159,   161,
     162,   172,     0,     0,     0,   170,     0,     0,   174,     0,
     178,   180,     0,   183,   184,     0,     0,     0,     0,     0,
       0,     0,     0,     0,     0,     0,   112
};

#define yypact_value_is_default(yystate) \
  ((yystate) == (-110))

#define yytable_value_is_error(yytable_value) \
  YYID (0)

static const yytype_int16 yycheck[] =
{
      36,    98,    38,    83,    48,    13,    44,    45,     3,     4,
      36,    37,     7,     8,     9,   124,   125,     7,    56,    55,
      58,    59,    60,    12,    62,    63,     3,     4,    11,    67,
       7,     8,     9,    41,     3,     4,     7,     0,     7,     8,
       9,   150,    37,     3,     4,    40,   143,     7,     8,     9,
       3,     4,    47,     7,     7,     8,     9,     7,    13,     7,
      37,    44,   100,    40,   144,     7,    16,    17,    37,    40,
      47,    40,    11,     7,    40,    40,    24,    37,    47,    45,
      45,    13,    16,    22,    37,    27,    41,    47,    37,   169,
      40,     7,   130,    21,    47,    37,    38,   135,   136,   137,
      16,    17,    18,     7,    20,    40,    36,    27,    36,    40,
      45,    42,     7,     7,    18,   159,    20,    37,    38,    40,
      36,    16,    17,    14,    45,   161,    15,   163,   172,    25,
      36,    37,    36,   171,     7,    31,    32,    33,    34,     7,
     176,     7,    38,   181,    36,     7,    43,    43,    41,    37,
      46,    73,    74,    75,    76,    77,    78,    37,    80,    37,
      37,    40,    38,    23,    38,    37,    41,     7,     7,    40,
      39,    38,    42,     7,    27,    19,    41,    40,    42,     7,
      39,    42,    40,    40,    40,    39,    37,    39,    37,    39,
      37,    10,     7,    10,    42,    40,    42,    40,    36,    36,
      42,    36,    -1,    -1,    -1,    41,    -1,    -1,    41,    -1,
      42,    41,    -1,    42,    41,    -1,    -1,    -1,    -1,    -1,
      -1,    -1,    -1,    -1,    -1,    -1,    81
};

/* YYSTOS[STATE-NUM] -- The (internal number of the) accessing
   symbol of state STATE-NUM.  */
static const yytype_uint8 yystos[] =
{
       0,    49,    61,     0,    11,    44,    50,    57,    58,     7,
      12,    51,    36,     7,    11,    22,    13,    37,     7,    14,
       7,    40,    21,    36,    15,    60,    36,    37,     7,    62,
       7,    40,    42,     7,    18,    20,    36,    55,    56,     3,
       4,     7,     8,     9,    37,    47,    64,    65,    36,     7,
      16,    17,    52,    53,    37,    36,    37,     7,    27,    37,
      38,    54,    37,    37,    55,    41,    55,    37,     7,    16,
      64,    64,    40,    25,    31,    32,    33,    34,    38,    43,
      46,    62,    38,    13,    41,     7,    23,    55,    64,    64,
      40,    64,    64,    43,    64,    64,    41,    40,    64,    37,
      38,    40,     7,    65,    65,    65,    65,    65,    65,     7,
      24,    65,    52,    39,    53,    42,    38,    41,    40,    42,
      42,    59,    39,     7,    40,    40,    59,    40,    64,    39,
      37,    41,     7,    39,    40,    45,    27,    37,    56,    56,
      40,    39,    40,    64,    37,     7,    42,    64,    64,    64,
      19,    59,    40,    53,    40,    42,    40,    56,    40,    36,
       7,    36,    42,    62,    63,    55,     7,    55,    40,    45,
      41,    10,    36,    53,    41,    64,    62,     7,    42,    55,
      41,    10,    64,    42,    41
};

#define yyerrok		(yyerrstatus = 0)
#define yyclearin	(yychar = YYEMPTY)
#define YYEMPTY		(-2)
#define YYEOF		0

#define YYACCEPT	goto yyacceptlab
#define YYABORT		goto yyabortlab
#define YYERROR		goto yyerrorlab


/* Like YYERROR except do call yyerror.  This remains here temporarily
   to ease the transition to the new meaning of YYERROR, for GCC.
   Once GCC version 2 has supplanted version 1, this can go.  However,
   YYFAIL appears to be in use.  Nevertheless, it is formally deprecated
   in Bison 2.4.2's NEWS entry, where a plan to phase it out is
   discussed.  */

#define YYFAIL		goto yyerrlab
#if defined YYFAIL
  /* This is here to suppress warnings from the GCC cpp's
     -Wunused-macros.  Normally we don't worry about that warning, but
     some users do, and we want to make it easy for users to remove
     YYFAIL uses, which will produce warnings from Bison 2.5.  */
#endif

#define YYRECOVERING()  (!!yyerrstatus)

#define YYBACKUP(Token, Value)					\
do								\
  if (yychar == YYEMPTY && yylen == 1)				\
    {								\
      yychar = (Token);						\
      yylval = (Value);						\
      YYPOPSTACK (1);						\
      goto yybackup;						\
    }								\
  else								\
    {								\
      yyerror (YY_("syntax error: cannot back up")); \
      YYERROR;							\
    }								\
while (YYID (0))


#define YYTERROR	1
#define YYERRCODE	256


/* YYLLOC_DEFAULT -- Set CURRENT to span from RHS[1] to RHS[N].
   If N is 0, then set CURRENT to the empty location which ends
   the previous symbol: RHS[0] (always defined).  */

#define YYRHSLOC(Rhs, K) ((Rhs)[K])
#ifndef YYLLOC_DEFAULT
# define YYLLOC_DEFAULT(Current, Rhs, N)				\
    do									\
      if (YYID (N))                                                    \
	{								\
	  (Current).first_line   = YYRHSLOC (Rhs, 1).first_line;	\
	  (Current).first_column = YYRHSLOC (Rhs, 1).first_column;	\
	  (Current).last_line    = YYRHSLOC (Rhs, N).last_line;		\
	  (Current).last_column  = YYRHSLOC (Rhs, N).last_column;	\
	}								\
      else								\
	{								\
	  (Current).first_line   = (Current).last_line   =		\
	    YYRHSLOC (Rhs, 0).last_line;				\
	  (Current).first_column = (Current).last_column =		\
	    YYRHSLOC (Rhs, 0).last_column;				\
	}								\
    while (YYID (0))
#endif


/* This macro is provided for backward compatibility. */

#ifndef YY_LOCATION_PRINT
# define YY_LOCATION_PRINT(File, Loc) ((void) 0)
#endif


/* YYLEX -- calling `yylex' with the right arguments.  */

#ifdef YYLEX_PARAM
# define YYLEX yylex (YYLEX_PARAM)
#else
# define YYLEX yylex ()
#endif

/* Enable debugging if requested.  */
#if YYDEBUG

# ifndef YYFPRINTF
#  include <stdio.h> /* INFRINGES ON USER NAME SPACE */
#  define YYFPRINTF fprintf
# endif

# define YYDPRINTF(Args)			\
do {						\
  if (yydebug)					\
    YYFPRINTF Args;				\
} while (YYID (0))

# define YY_SYMBOL_PRINT(Title, Type, Value, Location)			  \
do {									  \
  if (yydebug)								  \
    {									  \
      YYFPRINTF (stderr, "%s ", Title);					  \
      yy_symbol_print (stderr,						  \
		  Type, Value); \
      YYFPRINTF (stderr, "\n");						  \
    }									  \
} while (YYID (0))


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_value_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_value_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (!yyvaluep)
    return;
# ifdef YYPRINT
  if (yytype < YYNTOKENS)
    YYPRINT (yyoutput, yytoknum[yytype], *yyvaluep);
# else
  YYUSE (yyoutput);
# endif
  switch (yytype)
    {
      default:
	break;
    }
}


/*--------------------------------.
| Print this symbol on YYOUTPUT.  |
`--------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_symbol_print (FILE *yyoutput, int yytype, YYSTYPE const * const yyvaluep)
#else
static void
yy_symbol_print (yyoutput, yytype, yyvaluep)
    FILE *yyoutput;
    int yytype;
    YYSTYPE const * const yyvaluep;
#endif
{
  if (yytype < YYNTOKENS)
    YYFPRINTF (yyoutput, "token %s (", yytname[yytype]);
  else
    YYFPRINTF (yyoutput, "nterm %s (", yytname[yytype]);

  yy_symbol_value_print (yyoutput, yytype, yyvaluep);
  YYFPRINTF (yyoutput, ")");
}

/*------------------------------------------------------------------.
| yy_stack_print -- Print the state stack from its BOTTOM up to its |
| TOP (included).                                                   |
`------------------------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_stack_print (yytype_int16 *yybottom, yytype_int16 *yytop)
#else
static void
yy_stack_print (yybottom, yytop)
    yytype_int16 *yybottom;
    yytype_int16 *yytop;
#endif
{
  YYFPRINTF (stderr, "Stack now");
  for (; yybottom <= yytop; yybottom++)
    {
      int yybot = *yybottom;
      YYFPRINTF (stderr, " %d", yybot);
    }
  YYFPRINTF (stderr, "\n");
}

# define YY_STACK_PRINT(Bottom, Top)				\
do {								\
  if (yydebug)							\
    yy_stack_print ((Bottom), (Top));				\
} while (YYID (0))


/*------------------------------------------------.
| Report that the YYRULE is going to be reduced.  |
`------------------------------------------------*/

#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yy_reduce_print (YYSTYPE *yyvsp, int yyrule)
#else
static void
yy_reduce_print (yyvsp, yyrule)
    YYSTYPE *yyvsp;
    int yyrule;
#endif
{
  int yynrhs = yyr2[yyrule];
  int yyi;
  unsigned long int yylno = yyrline[yyrule];
  YYFPRINTF (stderr, "Reducing stack by rule %d (line %lu):\n",
	     yyrule - 1, yylno);
  /* The symbols being reduced.  */
  for (yyi = 0; yyi < yynrhs; yyi++)
    {
      YYFPRINTF (stderr, "   $%d = ", yyi + 1);
      yy_symbol_print (stderr, yyrhs[yyprhs[yyrule] + yyi],
		       &(yyvsp[(yyi + 1) - (yynrhs)])
		       		       );
      YYFPRINTF (stderr, "\n");
    }
}

# define YY_REDUCE_PRINT(Rule)		\
do {					\
  if (yydebug)				\
    yy_reduce_print (yyvsp, Rule); \
} while (YYID (0))

/* Nonzero means print parse trace.  It is left uninitialized so that
   multiple parsers can coexist.  */
int yydebug;
#else /* !YYDEBUG */
# define YYDPRINTF(Args)
# define YY_SYMBOL_PRINT(Title, Type, Value, Location)
# define YY_STACK_PRINT(Bottom, Top)
# define YY_REDUCE_PRINT(Rule)
#endif /* !YYDEBUG */


/* YYINITDEPTH -- initial size of the parser's stacks.  */
#ifndef	YYINITDEPTH
# define YYINITDEPTH 200
#endif

/* YYMAXDEPTH -- maximum size the stacks can grow to (effective only
   if the built-in stack extension method is used).

   Do not make this value too large; the results are undefined if
   YYSTACK_ALLOC_MAXIMUM < YYSTACK_BYTES (YYMAXDEPTH)
   evaluated with infinite-precision integer arithmetic.  */

#ifndef YYMAXDEPTH
# define YYMAXDEPTH 10000
#endif


#if YYERROR_VERBOSE

# ifndef yystrlen
#  if defined __GLIBC__ && defined _STRING_H
#   define yystrlen strlen
#  else
/* Return the length of YYSTR.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static YYSIZE_T
yystrlen (const char *yystr)
#else
static YYSIZE_T
yystrlen (yystr)
    const char *yystr;
#endif
{
  YYSIZE_T yylen;
  for (yylen = 0; yystr[yylen]; yylen++)
    continue;
  return yylen;
}
#  endif
# endif

# ifndef yystpcpy
#  if defined __GLIBC__ && defined _STRING_H && defined _GNU_SOURCE
#   define yystpcpy stpcpy
#  else
/* Copy YYSRC to YYDEST, returning the address of the terminating '\0' in
   YYDEST.  */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static char *
yystpcpy (char *yydest, const char *yysrc)
#else
static char *
yystpcpy (yydest, yysrc)
    char *yydest;
    const char *yysrc;
#endif
{
  char *yyd = yydest;
  const char *yys = yysrc;

  while ((*yyd++ = *yys++) != '\0')
    continue;

  return yyd - 1;
}
#  endif
# endif

# ifndef yytnamerr
/* Copy to YYRES the contents of YYSTR after stripping away unnecessary
   quotes and backslashes, so that it's suitable for yyerror.  The
   heuristic is that double-quoting is unnecessary unless the string
   contains an apostrophe, a comma, or backslash (other than
   backslash-backslash).  YYSTR is taken from yytname.  If YYRES is
   null, do not copy; instead, return the length of what the result
   would have been.  */
static YYSIZE_T
yytnamerr (char *yyres, const char *yystr)
{
  if (*yystr == '"')
    {
      YYSIZE_T yyn = 0;
      char const *yyp = yystr;

      for (;;)
	switch (*++yyp)
	  {
	  case '\'':
	  case ',':
	    goto do_not_strip_quotes;

	  case '\\':
	    if (*++yyp != '\\')
	      goto do_not_strip_quotes;
	    /* Fall through.  */
	  default:
	    if (yyres)
	      yyres[yyn] = *yyp;
	    yyn++;
	    break;

	  case '"':
	    if (yyres)
	      yyres[yyn] = '\0';
	    return yyn;
	  }
    do_not_strip_quotes: ;
    }

  if (! yyres)
    return yystrlen (yystr);

  return yystpcpy (yyres, yystr) - yyres;
}
# endif

/* Copy into *YYMSG, which is of size *YYMSG_ALLOC, an error message
   about the unexpected token YYTOKEN for the state stack whose top is
   YYSSP.

   Return 0 if *YYMSG was successfully written.  Return 1 if *YYMSG is
   not large enough to hold the message.  In that case, also set
   *YYMSG_ALLOC to the required number of bytes.  Return 2 if the
   required number of bytes is too large to store.  */
static int
yysyntax_error (YYSIZE_T *yymsg_alloc, char **yymsg,
                yytype_int16 *yyssp, int yytoken)
{
  YYSIZE_T yysize0 = yytnamerr (0, yytname[yytoken]);
  YYSIZE_T yysize = yysize0;
  YYSIZE_T yysize1;
  enum { YYERROR_VERBOSE_ARGS_MAXIMUM = 5 };
  /* Internationalized format string. */
  const char *yyformat = 0;
  /* Arguments of yyformat. */
  char const *yyarg[YYERROR_VERBOSE_ARGS_MAXIMUM];
  /* Number of reported tokens (one for the "unexpected", one per
     "expected"). */
  int yycount = 0;

  /* There are many possibilities here to consider:
     - Assume YYFAIL is not used.  It's too flawed to consider.  See
       <http://lists.gnu.org/archive/html/bison-patches/2009-12/msg00024.html>
       for details.  YYERROR is fine as it does not invoke this
       function.
     - If this state is a consistent state with a default action, then
       the only way this function was invoked is if the default action
       is an error action.  In that case, don't check for expected
       tokens because there are none.
     - The only way there can be no lookahead present (in yychar) is if
       this state is a consistent state with a default action.  Thus,
       detecting the absence of a lookahead is sufficient to determine
       that there is no unexpected or expected token to report.  In that
       case, just report a simple "syntax error".
     - Don't assume there isn't a lookahead just because this state is a
       consistent state with a default action.  There might have been a
       previous inconsistent state, consistent state with a non-default
       action, or user semantic action that manipulated yychar.
     - Of course, the expected token list depends on states to have
       correct lookahead information, and it depends on the parser not
       to perform extra reductions after fetching a lookahead from the
       scanner and before detecting a syntax error.  Thus, state merging
       (from LALR or IELR) and default reductions corrupt the expected
       token list.  However, the list is correct for canonical LR with
       one exception: it will still contain any token that will not be
       accepted due to an error action in a later state.
  */
  if (yytoken != YYEMPTY)
    {
      int yyn = yypact[*yyssp];
      yyarg[yycount++] = yytname[yytoken];
      if (!yypact_value_is_default (yyn))
        {
          /* Start YYX at -YYN if negative to avoid negative indexes in
             YYCHECK.  In other words, skip the first -YYN actions for
             this state because they are default actions.  */
          int yyxbegin = yyn < 0 ? -yyn : 0;
          /* Stay within bounds of both yycheck and yytname.  */
          int yychecklim = YYLAST - yyn + 1;
          int yyxend = yychecklim < YYNTOKENS ? yychecklim : YYNTOKENS;
          int yyx;

          for (yyx = yyxbegin; yyx < yyxend; ++yyx)
            if (yycheck[yyx + yyn] == yyx && yyx != YYTERROR
                && !yytable_value_is_error (yytable[yyx + yyn]))
              {
                if (yycount == YYERROR_VERBOSE_ARGS_MAXIMUM)
                  {
                    yycount = 1;
                    yysize = yysize0;
                    break;
                  }
                yyarg[yycount++] = yytname[yyx];
                yysize1 = yysize + yytnamerr (0, yytname[yyx]);
                if (! (yysize <= yysize1
                       && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
                  return 2;
                yysize = yysize1;
              }
        }
    }

  switch (yycount)
    {
# define YYCASE_(N, S)                      \
      case N:                               \
        yyformat = S;                       \
      break
      YYCASE_(0, YY_("syntax error"));
      YYCASE_(1, YY_("syntax error, unexpected %s"));
      YYCASE_(2, YY_("syntax error, unexpected %s, expecting %s"));
      YYCASE_(3, YY_("syntax error, unexpected %s, expecting %s or %s"));
      YYCASE_(4, YY_("syntax error, unexpected %s, expecting %s or %s or %s"));
      YYCASE_(5, YY_("syntax error, unexpected %s, expecting %s or %s or %s or %s"));
# undef YYCASE_
    }

  yysize1 = yysize + yystrlen (yyformat);
  if (! (yysize <= yysize1 && yysize1 <= YYSTACK_ALLOC_MAXIMUM))
    return 2;
  yysize = yysize1;

  if (*yymsg_alloc < yysize)
    {
      *yymsg_alloc = 2 * yysize;
      if (! (yysize <= *yymsg_alloc
             && *yymsg_alloc <= YYSTACK_ALLOC_MAXIMUM))
        *yymsg_alloc = YYSTACK_ALLOC_MAXIMUM;
      return 1;
    }

  /* Avoid sprintf, as that infringes on the user's name space.
     Don't have undefined behavior even if the translation
     produced a string with the wrong number of "%s"s.  */
  {
    char *yyp = *yymsg;
    int yyi = 0;
    while ((*yyp = *yyformat) != '\0')
      if (*yyp == '%' && yyformat[1] == 's' && yyi < yycount)
        {
          yyp += yytnamerr (yyp, yyarg[yyi++]);
          yyformat += 2;
        }
      else
        {
          yyp++;
          yyformat++;
        }
  }
  return 0;
}
#endif /* YYERROR_VERBOSE */

/*-----------------------------------------------.
| Release the memory associated to this symbol.  |
`-----------------------------------------------*/

/*ARGSUSED*/
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
static void
yydestruct (const char *yymsg, int yytype, YYSTYPE *yyvaluep)
#else
static void
yydestruct (yymsg, yytype, yyvaluep)
    const char *yymsg;
    int yytype;
    YYSTYPE *yyvaluep;
#endif
{
  YYUSE (yyvaluep);

  if (!yymsg)
    yymsg = "Deleting";
  YY_SYMBOL_PRINT (yymsg, yytype, yyvaluep, yylocationp);

  switch (yytype)
    {

      default:
	break;
    }
}


/* Prevent warnings from -Wmissing-prototypes.  */
#ifdef YYPARSE_PARAM
#if defined __STDC__ || defined __cplusplus
int yyparse (void *YYPARSE_PARAM);
#else
int yyparse ();
#endif
#else /* ! YYPARSE_PARAM */
#if defined __STDC__ || defined __cplusplus
int yyparse (void);
#else
int yyparse ();
#endif
#endif /* ! YYPARSE_PARAM */


/* The lookahead symbol.  */
int yychar;

/* The semantic value of the lookahead symbol.  */
YYSTYPE yylval;

/* Number of syntax errors so far.  */
int yynerrs;


/*----------.
| yyparse.  |
`----------*/

#ifdef YYPARSE_PARAM
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void *YYPARSE_PARAM)
#else
int
yyparse (YYPARSE_PARAM)
    void *YYPARSE_PARAM;
#endif
#else /* ! YYPARSE_PARAM */
#if (defined __STDC__ || defined __C99__FUNC__ \
     || defined __cplusplus || defined _MSC_VER)
int
yyparse (void)
#else
int
yyparse ()

#endif
#endif
{
    int yystate;
    /* Number of tokens to shift before error messages enabled.  */
    int yyerrstatus;

    /* The stacks and their tools:
       `yyss': related to states.
       `yyvs': related to semantic values.

       Refer to the stacks thru separate pointers, to allow yyoverflow
       to reallocate them elsewhere.  */

    /* The state stack.  */
    yytype_int16 yyssa[YYINITDEPTH];
    yytype_int16 *yyss;
    yytype_int16 *yyssp;

    /* The semantic value stack.  */
    YYSTYPE yyvsa[YYINITDEPTH];
    YYSTYPE *yyvs;
    YYSTYPE *yyvsp;

    YYSIZE_T yystacksize;

  int yyn;
  int yyresult;
  /* Lookahead token as an internal (translated) token number.  */
  int yytoken;
  /* The variables used to return semantic value and location from the
     action routines.  */
  YYSTYPE yyval;

#if YYERROR_VERBOSE
  /* Buffer for error messages, and its allocated size.  */
  char yymsgbuf[128];
  char *yymsg = yymsgbuf;
  YYSIZE_T yymsg_alloc = sizeof yymsgbuf;
#endif

#define YYPOPSTACK(N)   (yyvsp -= (N), yyssp -= (N))

  /* The number of symbols on the RHS of the reduced rule.
     Keep to zero when no symbol should be popped.  */
  int yylen = 0;

  yytoken = 0;
  yyss = yyssa;
  yyvs = yyvsa;
  yystacksize = YYINITDEPTH;

  YYDPRINTF ((stderr, "Starting parse\n"));

  yystate = 0;
  yyerrstatus = 0;
  yynerrs = 0;
  yychar = YYEMPTY; /* Cause a token to be read.  */

  /* Initialize stack pointers.
     Waste one element of value and location stack
     so that they stay on the same level as the state stack.
     The wasted elements are never initialized.  */
  yyssp = yyss;
  yyvsp = yyvs;

  goto yysetstate;

/*------------------------------------------------------------.
| yynewstate -- Push a new state, which is found in yystate.  |
`------------------------------------------------------------*/
 yynewstate:
  /* In all cases, when you get here, the value and location stacks
     have just been pushed.  So pushing a state here evens the stacks.  */
  yyssp++;

 yysetstate:
  *yyssp = yystate;

  if (yyss + yystacksize - 1 <= yyssp)
    {
      /* Get the current used size of the three stacks, in elements.  */
      YYSIZE_T yysize = yyssp - yyss + 1;

#ifdef yyoverflow
      {
	/* Give user a chance to reallocate the stack.  Use copies of
	   these so that the &'s don't force the real ones into
	   memory.  */
	YYSTYPE *yyvs1 = yyvs;
	yytype_int16 *yyss1 = yyss;

	/* Each stack pointer address is followed by the size of the
	   data in use in that stack, in bytes.  This used to be a
	   conditional around just the two extra args, but that might
	   be undefined if yyoverflow is a macro.  */
	yyoverflow (YY_("memory exhausted"),
		    &yyss1, yysize * sizeof (*yyssp),
		    &yyvs1, yysize * sizeof (*yyvsp),
		    &yystacksize);

	yyss = yyss1;
	yyvs = yyvs1;
      }
#else /* no yyoverflow */
# ifndef YYSTACK_RELOCATE
      goto yyexhaustedlab;
# else
      /* Extend the stack our own way.  */
      if (YYMAXDEPTH <= yystacksize)
	goto yyexhaustedlab;
      yystacksize *= 2;
      if (YYMAXDEPTH < yystacksize)
	yystacksize = YYMAXDEPTH;

      {
	yytype_int16 *yyss1 = yyss;
	union yyalloc *yyptr =
	  (union yyalloc *) YYSTACK_ALLOC (YYSTACK_BYTES (yystacksize));
	if (! yyptr)
	  goto yyexhaustedlab;
	YYSTACK_RELOCATE (yyss_alloc, yyss);
	YYSTACK_RELOCATE (yyvs_alloc, yyvs);
#  undef YYSTACK_RELOCATE
	if (yyss1 != yyssa)
	  YYSTACK_FREE (yyss1);
      }
# endif
#endif /* no yyoverflow */

      yyssp = yyss + yysize - 1;
      yyvsp = yyvs + yysize - 1;

      YYDPRINTF ((stderr, "Stack size increased to %lu\n",
		  (unsigned long int) yystacksize));

      if (yyss + yystacksize - 1 <= yyssp)
	YYABORT;
    }

  YYDPRINTF ((stderr, "Entering state %d\n", yystate));

  if (yystate == YYFINAL)
    YYACCEPT;

  goto yybackup;

/*-----------.
| yybackup.  |
`-----------*/
yybackup:

  /* Do appropriate processing given the current state.  Read a
     lookahead token if we need one and don't already have one.  */

  /* First try to decide what to do without reference to lookahead token.  */
  yyn = yypact[yystate];
  if (yypact_value_is_default (yyn))
    goto yydefault;

  /* Not known => get a lookahead token if don't already have one.  */

  /* YYCHAR is either YYEMPTY or YYEOF or a valid lookahead symbol.  */
  if (yychar == YYEMPTY)
    {
      YYDPRINTF ((stderr, "Reading a token: "));
      yychar = YYLEX;
    }

  if (yychar <= YYEOF)
    {
      yychar = yytoken = YYEOF;
      YYDPRINTF ((stderr, "Now at end of input.\n"));
    }
  else
    {
      yytoken = YYTRANSLATE (yychar);
      YY_SYMBOL_PRINT ("Next token is", yytoken, &yylval, &yylloc);
    }

  /* If the proper action on seeing token YYTOKEN is to reduce or to
     detect an error, take that action.  */
  yyn += yytoken;
  if (yyn < 0 || YYLAST < yyn || yycheck[yyn] != yytoken)
    goto yydefault;
  yyn = yytable[yyn];
  if (yyn <= 0)
    {
      if (yytable_value_is_error (yyn))
        goto yyerrlab;
      yyn = -yyn;
      goto yyreduce;
    }

  /* Count tokens shifted since error; after three, turn off error
     status.  */
  if (yyerrstatus)
    yyerrstatus--;

  /* Shift the lookahead token.  */
  YY_SYMBOL_PRINT ("Shifting", yytoken, &yylval, &yylloc);

  /* Discard the shifted token.  */
  yychar = YYEMPTY;

  yystate = yyn;
  *++yyvsp = yylval;

  goto yynewstate;


/*-----------------------------------------------------------.
| yydefault -- do the default action for the current state.  |
`-----------------------------------------------------------*/
yydefault:
  yyn = yydefact[yystate];
  if (yyn == 0)
    goto yyerrlab;
  goto yyreduce;


/*-----------------------------.
| yyreduce -- Do a reduction.  |
`-----------------------------*/
yyreduce:
  /* yyn is the number of a rule to reduce with.  */
  yylen = yyr2[yyn];

  /* If YYLEN is nonzero, implement the default value of the action:
     `$$ = $1'.

     Otherwise, the following line sets YYVAL to garbage.
     This behavior is undocumented and Bison
     users should not rely upon it.  Assigning to YYVAL
     unconditionally makes the parser a bit smaller, and it avoids a
     GCC warning that YYVAL may be used uninitialized.  */
  yyval = yyvsp[1-yylen];


  YY_REDUCE_PRINT (yyn);
  switch (yyn)
    {
        case 2:

/* Line 1806 of yacc.c  */
#line 172 "macrojava.y"
    {
                                        
                                        (yyval.id) = (char*) malloc(sizeof(char)*(strlen((yyvsp[(2) - (4)].id))+strlen((yyvsp[(3) - (4)].id))+1));
                                        (yyval.id)[0] = '\0';
                                        
                                        printf("// Macrojava code parsed and minijava code generated successfully.\n");
                                        strcat((yyval.id),(yyvsp[(2) - (4)].id));
                                        strcat((yyval.id),(yyvsp[(3) - (4)].id));
                                        printf("%s\n",(yyval.id));
                                        
                                        exit(0);
                                        
                                }
    break;

  case 3:

/* Line 1806 of yacc.c  */
#line 187 "macrojava.y"
    {
                (yyvsp[(1) - (17)].id)="class";
                (yyvsp[(4) - (17)].id)="public";
                (yyvsp[(5) - (17)].id)="static";
                (yyvsp[(6) - (17)].id)="void";
                (yyvsp[(9) - (17)].id)="string";
                
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (17)].id)) + strlen((yyvsp[(2) - (17)].id))+ 1+ strlen((yyvsp[(4) - (17)].id))+ strlen((yyvsp[(5) - (17)].id))+ strlen((yyvsp[(6) - (17)].id))+ strlen((yyvsp[(7) - (17)].id))+ 1+ strlen((yyvsp[(9) - (17)].id))+ 1+ 1+ strlen((yyvsp[(12) - (17)].id))+ 1+ 1+ strlen((yyvsp[(15) - (17)].id))+ 1+ 1+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (17)].id));
                strcat((yyval.id),(yyvsp[(2) - (17)].id));
                strcat((yyval.id),"{");
                strcat((yyval.id),(yyvsp[(4) - (17)].id));
                strcat((yyval.id),(yyvsp[(5) - (17)].id));
                strcat((yyval.id),(yyvsp[(6) - (17)].id));
                strcat((yyval.id),(yyvsp[(7) - (17)].id));
                strcat((yyval.id),"(");
                strcat((yyval.id),(yyvsp[(9) - (17)].id));
                strcat((yyval.id),"[");
                strcat((yyval.id),"]");
                strcat((yyval.id),(yyvsp[(12) - (17)].id));
                strcat((yyval.id),")");
                strcat((yyval.id),"{");
                strcat((yyval.id),(yyvsp[(15) - (17)].id));
                strcat((yyval.id),"}");
                strcat((yyval.id),"}");

          
          }
    break;

  case 4:

/* Line 1806 of yacc.c  */
#line 217 "macrojava.y"
    {
                    
                    (yyvsp[(2) - (7)].id)="class";

                    (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (7)].id))+strlen((yyvsp[(2) - (7)].id))+strlen((yyvsp[(3) - (7)].id))+1+strlen((yyvsp[(5) - (7)].id))+strlen((yyvsp[(6) - (7)].id))+1+1));
                    (yyval.id)[0] = '\0';
                    strcat((yyval.id),(yyvsp[(1) - (7)].id));
                    strcat((yyval.id),(yyvsp[(2) - (7)].id));
                    strcat((yyval.id),(yyvsp[(3) - (7)].id));
                    strcat((yyval.id),"{");
                    strcat((yyval.id),(yyvsp[(5) - (7)].id));
                    strcat((yyval.id),(yyvsp[(6) - (7)].id));
                    strcat((yyval.id),"}");
                
                
                }
    break;

  case 5:

/* Line 1806 of yacc.c  */
#line 233 "macrojava.y"
    {
                    (yyvsp[(2) - (9)].id)="class";
                    (yyvsp[(4) - (9)].id)="extends";
                    (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (9)].id))+strlen((yyvsp[(2) - (9)].id))+strlen((yyvsp[(3) - (9)].id))+strlen((yyvsp[(4) - (9)].id))+strlen((yyvsp[(5) - (9)].id))+1+strlen((yyvsp[(7) - (9)].id))+strlen((yyvsp[(8) - (9)].id))+1+1));
                    (yyval.id)[0] = '\0';
                    strcat((yyval.id),(yyvsp[(1) - (9)].id));
                    strcat((yyval.id),(yyvsp[(2) - (9)].id));
                    strcat((yyval.id),(yyvsp[(3) - (9)].id));
                    strcat((yyval.id),(yyvsp[(4) - (9)].id));
                    strcat((yyval.id),(yyvsp[(5) - (9)].id));
                    strcat((yyval.id),"{");
                    strcat((yyval.id),(yyvsp[(7) - (9)].id));
                    strcat((yyval.id),(yyvsp[(8) - (9)].id));
                    strcat((yyval.id),"}");
                
                
                }
    break;

  case 6:

/* Line 1806 of yacc.c  */
#line 250 "macrojava.y"
    {
                    (yyval.id) = (char*)malloc(sizeof(char)*1);
                    (yyval.id)[0] = '\0';
                
                }
    break;

  case 7:

/* Line 1806 of yacc.c  */
#line 257 "macrojava.y"
    {
                    
                    (yyvsp[(2) - (16)].id)="public";
                    (yyvsp[(13) - (16)].id)="return";

                    (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (16)].id)) + strlen((yyvsp[(2) - (16)].id)) + strlen((yyvsp[(3) - (16)].id))+ strlen((yyvsp[(4) - (16)].id))+ 1+ strlen((yyvsp[(6) - (16)].id))+ strlen((yyvsp[(7) - (16)].id))+ strlen((yyvsp[(8) - (16)].id))+ 1+ 1+ strlen((yyvsp[(11) - (16)].id))+ strlen((yyvsp[(12) - (16)].id))+ strlen((yyvsp[(13) - (16)].id))+ strlen((yyvsp[(14) - (16)].id))+ 1+ 1+1));
                    (yyval.id)[0] = '\0';
                    strcat((yyval.id),(yyvsp[(1) - (16)].id));
                    strcat((yyval.id),(yyvsp[(2) - (16)].id));
                    strcat((yyval.id),(yyvsp[(3) - (16)].id));
                    strcat((yyval.id),(yyvsp[(4) - (16)].id));
                    strcat((yyval.id),"(");
                    strcat((yyval.id),(yyvsp[(6) - (16)].id));
                    strcat((yyval.id),(yyvsp[(7) - (16)].id));
                    strcat((yyval.id),(yyvsp[(8) - (16)].id));
                    strcat((yyval.id),")");
                    strcat((yyval.id),"{");
                    strcat((yyval.id),(yyvsp[(11) - (16)].id));
                    strcat((yyval.id),(yyvsp[(12) - (16)].id));
                    strcat((yyval.id),(yyvsp[(13) - (16)].id));
                    strcat((yyval.id),(yyvsp[(14) - (16)].id));
                    strcat((yyval.id),";");
                    strcat((yyval.id),"}");
                  
                  }
    break;

  case 8:

/* Line 1806 of yacc.c  */
#line 282 "macrojava.y"
    {
                        
                        (yyvsp[(2) - (13)].id)="public";
                        (yyvsp[(10) - (13)].id)="return";
                        
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (13)].id)) + strlen((yyvsp[(2) - (13)].id)) + strlen((yyvsp[(3) - (13)].id))+ strlen((yyvsp[(4) - (13)].id))+ 3+ strlen((yyvsp[(8) - (13)].id))+ strlen((yyvsp[(9) - (13)].id))+ strlen((yyvsp[(10) - (13)].id))+ strlen((yyvsp[(11) - (13)].id))+ 2+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (13)].id));
                        strcat((yyval.id),(yyvsp[(2) - (13)].id));
                        strcat((yyval.id),(yyvsp[(3) - (13)].id));
                        strcat((yyval.id),(yyvsp[(4) - (13)].id));
                        strcat((yyval.id),"(");
                        strcat((yyval.id),")");
                        strcat((yyval.id),"{");
                        strcat((yyval.id),(yyvsp[(8) - (13)].id));
                        strcat((yyval.id),(yyvsp[(9) - (13)].id));
                        strcat((yyval.id),(yyvsp[(10) - (13)].id));
                        strcat((yyval.id),(yyvsp[(11) - (13)].id));
                        strcat((yyval.id),";");
                        strcat((yyval.id),"}");
                  
                  }
    break;

  case 9:

/* Line 1806 of yacc.c  */
#line 304 "macrojava.y"
    {
                    (yyval.id) = (char*)malloc(sizeof(char)*1);
                    (yyval.id)[0] = '\0';

                  
                  }
    break;

  case 10:

/* Line 1806 of yacc.c  */
#line 312 "macrojava.y"
    {
            
            (yyvsp[(1) - (3)].id) = "int";
            (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+2+1));
            (yyval.id)[0] = '\0';
            
            strcat((yyval.id),(yyvsp[(1) - (3)].id));
            strcat((yyval.id),"[");
            strcat((yyval.id),"]");
     
     }
    break;

  case 11:

/* Line 1806 of yacc.c  */
#line 323 "macrojava.y"
    {
        (yyvsp[(1) - (1)].id)="boolean";

        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
        (yyval.id)[0] = '\0';
        strcat((yyval.id),(yyvsp[(1) - (1)].id));
     
     }
    break;

  case 12:

/* Line 1806 of yacc.c  */
#line 331 "macrojava.y"
    {
        (yyvsp[(1) - (1)].id)="int";

        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
        (yyval.id)[0] = '\0';
        strcat((yyval.id),(yyvsp[(1) - (1)].id));

     
     }
    break;

  case 13:

/* Line 1806 of yacc.c  */
#line 340 "macrojava.y"
    {
        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
        (yyval.id)[0] = '\0';
        strcat((yyval.id),(yyvsp[(1) - (1)].id));
     
     }
    break;

  case 14:

/* Line 1806 of yacc.c  */
#line 348 "macrojava.y"
    {
        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
        (yyval.id)[0] = '\0';
        strcat((yyval.id),(yyvsp[(1) - (3)].id));
        strcat((yyval.id),".");
        strcat((yyval.id),(yyvsp[(3) - (3)].id));
    
    
    }
    break;

  case 15:

/* Line 1806 of yacc.c  */
#line 357 "macrojava.y"
    {
        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (7)].id))+1+strlen((yyvsp[(3) - (7)].id))+1+strlen((yyvsp[(5) - (7)].id))+1+1+1));
        (yyval.id)[0] = '\0';
        strcat((yyval.id),(yyvsp[(1) - (7)].id));
        strcat((yyval.id),".");
        strcat((yyval.id),(yyvsp[(3) - (7)].id));
        strcat((yyval.id),"(");
        strcat((yyval.id),(yyvsp[(5) - (7)].id));
        strcat((yyval.id),")");
        strcat((yyval.id),";");
    
    }
    break;

  case 16:

/* Line 1806 of yacc.c  */
#line 369 "macrojava.y"
    {
        (yyval.id) = (char*)malloc(sizeof(char)*1);
        (yyval.id)[0] = '\0';

    
    }
    break;

  case 17:

/* Line 1806 of yacc.c  */
#line 377 "macrojava.y"
    {
                    (yyval.id) = (char*)malloc(sizeof(char)*1);
                    (yyval.id)[0] = '\0';

                    
                  }
    break;

  case 18:

/* Line 1806 of yacc.c  */
#line 383 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (2)].id))+strlen((yyvsp[(2) - (2)].id))+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (2)].id));
                        strcat((yyval.id),(yyvsp[(2) - (2)].id));
                  
                  }
    break;

  case 19:

/* Line 1806 of yacc.c  */
#line 392 "macrojava.y"
    {
              (yyval.id) = (char*)malloc(sizeof(char)*(1+strlen((yyvsp[(2) - (3)].id))+1+1));
              (yyval.id)[0] = '\0';
              strcat((yyval.id),"{");
              strcat((yyval.id),(yyvsp[(2) - (3)].id));
              strcat((yyval.id),"}");

          
          }
    break;

  case 20:

/* Line 1806 of yacc.c  */
#line 401 "macrojava.y"
    {
              (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+1+strlen((yyvsp[(3) - (4)].id))+1+1));
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (4)].id));
              strcat((yyval.id),"=");
              strcat((yyval.id),(yyvsp[(3) - (4)].id));
              strcat((yyval.id),";");
 
          
          }
    break;

  case 21:

/* Line 1806 of yacc.c  */
#line 411 "macrojava.y"
    {
              (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (7)].id))+1+strlen((yyvsp[(3) - (7)].id))+1+1+strlen((yyvsp[(6) - (7)].id))+1+1));
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (7)].id));
              strcat((yyval.id),"[");
              strcat((yyval.id),(yyvsp[(3) - (7)].id));
              strcat((yyval.id),"]");
              strcat((yyval.id),"=");
              strcat((yyval.id),(yyvsp[(6) - (7)].id));
              strcat((yyval.id),";");

          }
    break;

  case 22:

/* Line 1806 of yacc.c  */
#line 423 "macrojava.y"
    {
              
              (yyvsp[(1) - (5)].id)="if";
              (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (5)].id))+1+strlen((yyvsp[(3) - (5)].id))+1+strlen((yyvsp[(5) - (5)].id))+1));
            
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (5)].id));
              strcat((yyval.id),"(");
              strcat((yyval.id),(yyvsp[(3) - (5)].id));
              strcat((yyval.id),")");
              strcat((yyval.id),(yyvsp[(5) - (5)].id));

          
          }
    break;

  case 23:

/* Line 1806 of yacc.c  */
#line 437 "macrojava.y"
    {
              
              (yyvsp[(1) - (7)].id)="if";
              (yyvsp[(6) - (7)].id)="else";

              (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (7)].id))+1+strlen((yyvsp[(3) - (7)].id))+1+strlen((yyvsp[(5) - (7)].id))+strlen((yyvsp[(6) - (7)].id))+strlen((yyvsp[(7) - (7)].id))+1));
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (7)].id));
              strcat((yyval.id),"(");
              strcat((yyval.id),(yyvsp[(3) - (7)].id));
              strcat((yyval.id),")");
              strcat((yyval.id),(yyvsp[(5) - (7)].id));
              strcat((yyval.id),(yyvsp[(6) - (7)].id));
              strcat((yyval.id),(yyvsp[(7) - (7)].id));

          
          
          
          }
    break;

  case 24:

/* Line 1806 of yacc.c  */
#line 456 "macrojava.y"
    {
              (yyvsp[(1) - (5)].id)="while";
              
              (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (5)].id))+1+strlen((yyvsp[(3) - (5)].id))+1+strlen((yyvsp[(5) - (5)].id))+1));
            
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (5)].id));
              strcat((yyval.id),"(");
              strcat((yyval.id),(yyvsp[(3) - (5)].id));
              strcat((yyval.id),")");
              strcat((yyval.id),(yyvsp[(5) - (5)].id));

          
          
          
          }
    break;

  case 25:

/* Line 1806 of yacc.c  */
#line 472 "macrojava.y"
    {
               (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (6)].id))+1+strlen((yyvsp[(3) - (6)].id))+strlen((yyvsp[(4) - (6)].id))+2+1));
            
              (yyval.id)[0] = '\0';
             if(isPresent((yyvsp[(1) - (6)].id)) == 0){
                  strcat((yyval.id),(yyvsp[(1) - (6)].id));
                  strcat((yyval.id),"(");
                  strcat((yyval.id),(yyvsp[(3) - (6)].id));
                  strcat((yyval.id),(yyvsp[(4) - (6)].id));
                  strcat((yyval.id),")");
                  strcat((yyval.id),";");
              }
              else
              {
                      char paramsConcat[100][10];
                      int i;
                      strcpy(paramsConcat[0], (yyvsp[(3) - (6)].id));
                      int temp = 1;
                      int r =0;
                      for(i=0;i<=strlen((yyvsp[(4) - (6)].id));i++)
                      {
                        if((yyvsp[(4) - (6)].id)[i] == ',' || (yyvsp[(4) - (6)].id)[i] == '\0')
                        {
                            paramsConcat[temp][r++] = '\0';
                            temp++;
                            r=0;
                        }
                        else
                        {
                            paramsConcat[temp][r++] = (yyvsp[(4) - (6)].id)[i]; 

                        }

                       }
                    
                      strcat((yyval.id),findAndReplace((yyvsp[(1) - (6)].id),paramsConcat));
            }

          
          
          }
    break;

  case 26:

/* Line 1806 of yacc.c  */
#line 513 "macrojava.y"
    {
               (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+3+1));
            
              (yyval.id)[0] = '\0';

              if(isPresent((yyvsp[(1) - (4)].id)) == 0){
                strcat((yyval.id),(yyvsp[(1) - (4)].id));
                strcat((yyval.id),"(");
                strcat((yyval.id),")");
                strcat((yyval.id),";");
              }

              else
              {
                   char tt[100][10];
                   strcat((yyval.id),findAndReplace((yyvsp[(1) - (4)].id),tt));
                   strcat((yyval.id),";");

               }
                       
          }
    break;

  case 27:

/* Line 1806 of yacc.c  */
#line 534 "macrojava.y"
    {
             (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (2)].id))+strlen((yyvsp[(2) - (2)].id))+1));
            
              (yyval.id)[0] = '\0';
              strcat((yyval.id),(yyvsp[(1) - (2)].id));
              strcat((yyval.id),(yyvsp[(2) - (2)].id));
          
          }
    break;

  case 28:

/* Line 1806 of yacc.c  */
#line 544 "macrojava.y"
    {
                          
                          char tt[100][10];
                          strcpy(tt[0],(yyvsp[(5) - (10)].id));
                          
                          int temp = 1;
                          int i,r=0;
                          for(i=0;i<=strlen((yyvsp[(6) - (10)].id));i++)
                          {     
                                if((yyvsp[(6) - (10)].id)[i] == ',' || (yyvsp[(6) - (10)].id)[i] =='\0')
                                {
                                    tt[temp][r++] = '\0';;
                                    temp++;
                                    r = 0;
                                    numOfParams[numberOfMacros]++;

                                }
                                else
                                {
                                    tt[temp][r++] = (yyvsp[(6) - (10)].id)[i];
                                }

                            }
                          
                          push((yyvsp[(3) - (10)].id),(yyvsp[(9) - (10)].id),tt);
       
                      }
    break;

  case 29:

/* Line 1806 of yacc.c  */
#line 571 "macrojava.y"
    {
                          
                          numOfParams[numberOfMacros] = 0;
                          char tt[100][10];
                          push((yyvsp[(3) - (8)].id),(yyvsp[(7) - (8)].id),tt);

                       }
    break;

  case 30:

/* Line 1806 of yacc.c  */
#line 580 "macrojava.y"
    {
                          char tt[100][10];
                          strcpy(tt[0],(yyvsp[(5) - (10)].id));
                          int temp = 1;
                          int i,r=0;
                          for(i=0;i<=strlen((yyvsp[(6) - (10)].id));i++)
                          {     
                                if((yyvsp[(6) - (10)].id)[i] == ',' || (yyvsp[(6) - (10)].id)[i] =='\0')
                                {
                                    tt[temp][r++] = '\0';;
                                    temp++;
                                    r = 0;
                                    numOfParams[numberOfMacros]++;

                                }
                                else
                                {
                                    tt[temp][r++] = (yyvsp[(6) - (10)].id)[i];
                                }

                            }

                          push((yyvsp[(3) - (10)].id),(yyvsp[(9) - (10)].id),tt);

                  }
    break;

  case 31:

/* Line 1806 of yacc.c  */
#line 605 "macrojava.y"
    {
                          numOfParams[numberOfMacros] = 0;
                          char tt[100][10];
                          push((yyvsp[(3) - (8)].id),(yyvsp[(7) - (8)].id),tt);
 
                  }
    break;

  case 32:

/* Line 1806 of yacc.c  */
#line 613 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
            (yyval.id)[0] = '\0';
            strcat((yyval.id),(yyvsp[(1) - (3)].id));
            strcat((yyval.id),",");
            strcat((yyval.id),(yyvsp[(3) - (3)].id));
       
       }
    break;

  case 33:

/* Line 1806 of yacc.c  */
#line 621 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*1);
            (yyval.id)[0] = '\0';
       
       }
    break;

  case 34:

/* Line 1806 of yacc.c  */
#line 628 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
            (yyval.id)[0] = '\0';
            strcat((yyval.id),(yyvsp[(1) - (3)].id));
            strcat((yyval.id),";");
            strcat((yyval.id),(yyvsp[(3) - (3)].id));
        
        }
    break;

  case 35:

/* Line 1806 of yacc.c  */
#line 636 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*1);
            (yyval.id)[0] = '\0';

        
        }
    break;

  case 36:

/* Line 1806 of yacc.c  */
#line 644 "macrojava.y"
    {
                                    
                }
    break;

  case 37:

/* Line 1806 of yacc.c  */
#line 647 "macrojava.y"
    {
                                    
                }
    break;

  case 38:

/* Line 1806 of yacc.c  */
#line 650 "macrojava.y"
    {
                                    
                }
    break;

  case 39:

/* Line 1806 of yacc.c  */
#line 655 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+strlen((yyvsp[(2) - (4)].id))+strlen((yyvsp[(3) - (4)].id))+1+1));
            (yyval.id)[0] = '\0';
            strcat((yyval.id),(yyvsp[(1) - (4)].id));
            strcat((yyval.id),(yyvsp[(2) - (4)].id));
            strcat((yyval.id),(yyvsp[(3) - (4)].id));
            strcat((yyval.id),";");
 
        
        }
    break;

  case 40:

/* Line 1806 of yacc.c  */
#line 665 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*1);
            (yyval.id)[0] = '\0';

        
        }
    break;

  case 41:

/* Line 1806 of yacc.c  */
#line 673 "macrojava.y"
    {
            (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+1+strlen((yyvsp[(3) - (4)].id))+strlen((yyvsp[(4) - (4)].id))+1));
            (yyval.id)[0] = '\0';
            strcat((yyval.id),(yyvsp[(1) - (4)].id));
            strcat((yyval.id),",");
            strcat((yyval.id),(yyvsp[(3) - (4)].id));
            strcat((yyval.id),(yyvsp[(4) - (4)].id));

     
     }
    break;

  case 42:

/* Line 1806 of yacc.c  */
#line 683 "macrojava.y"
    {
        (yyval.id) = (char*)malloc(sizeof(char)*1);
        (yyval.id)[0] = '\0';

     }
    break;

  case 43:

/* Line 1806 of yacc.c  */
#line 691 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"&");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));
            }
    break;

  case 44:

/* Line 1806 of yacc.c  */
#line 698 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"<");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            
            }
    break;

  case 45:

/* Line 1806 of yacc.c  */
#line 708 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"+");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            
            }
    break;

  case 46:

/* Line 1806 of yacc.c  */
#line 718 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"-");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            }
    break;

  case 47:

/* Line 1806 of yacc.c  */
#line 727 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"*");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            
            }
    break;

  case 48:

/* Line 1806 of yacc.c  */
#line 737 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),"/");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            
            
            }
    break;

  case 49:

/* Line 1806 of yacc.c  */
#line 748 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+1+strlen((yyvsp[(3) - (4)].id))+1+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (4)].id));
                strcat((yyval.id),"[");
                strcat((yyval.id),(yyvsp[(3) - (4)].id));
                strcat((yyval.id),"]");

            
            }
    break;

  case 50:

/* Line 1806 of yacc.c  */
#line 758 "macrojava.y"
    {
                (yyvsp[(3) - (3)].id)="length";
                
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+1+strlen((yyvsp[(3) - (3)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (3)].id));
                strcat((yyval.id),".");
                strcat((yyval.id),(yyvsp[(3) - (3)].id));

            
            }
    break;

  case 51:

/* Line 1806 of yacc.c  */
#line 769 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (7)].id))+1+strlen((yyvsp[(3) - (7)].id))+1+strlen((yyvsp[(5) - (7)].id))+strlen((yyvsp[(6) - (7)].id))+1+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (7)].id));
                strcat((yyval.id),".");
                strcat((yyval.id),(yyvsp[(3) - (7)].id));
                strcat((yyval.id),"(");
                strcat((yyval.id),(yyvsp[(5) - (7)].id));
                strcat((yyval.id),(yyvsp[(6) - (7)].id));
                strcat((yyval.id),")");

            
            
            }
    break;

  case 52:

/* Line 1806 of yacc.c  */
#line 783 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (5)].id))+1+strlen((yyvsp[(3) - (5)].id))+2+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (5)].id));
                strcat((yyval.id),".");
                strcat((yyval.id),(yyvsp[(3) - (5)].id));
                strcat((yyval.id),"(");
                strcat((yyval.id),")");
            
            }
    break;

  case 53:

/* Line 1806 of yacc.c  */
#line 793 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (5)].id))+1+strlen((yyvsp[(3) - (5)].id))+strlen((yyvsp[(4) - (5)].id))+1+1));
                (yyval.id)[0] = '\0';
                
                if(!isPresent((yyvsp[(1) - (5)].id))){
                    strcat((yyval.id),(yyvsp[(1) - (5)].id));
                    strcat((yyval.id),"(");
                    strcat((yyval.id),(yyvsp[(3) - (5)].id));
                    strcat((yyval.id),(yyvsp[(4) - (5)].id));
                    strcat((yyval.id),")");
                }
                else
                {   
                      char paramsConcat[100][10];
                      int i;
                      strcpy(paramsConcat[0], (yyvsp[(3) - (5)].id));
                      int temp = 1;
                      int r =0;
                      for(i=0;i<=strlen((yyvsp[(4) - (5)].id));i++)
                      {
                        if((yyvsp[(4) - (5)].id)[i] == ',' || (yyvsp[(4) - (5)].id)[i] == '\0')
                        {
                            paramsConcat[temp][r++] = '\0';
                            temp++;
                            r=0;
                        }
                        else
                        {
                            paramsConcat[temp][r++] = (yyvsp[(4) - (5)].id)[i]; 

                        }

                       }
                        
                      strcat((yyval.id),findAndReplace((yyvsp[(1) - (5)].id),paramsConcat));
            }


            }
    break;

  case 54:

/* Line 1806 of yacc.c  */
#line 832 "macrojava.y"
    {
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (3)].id))+2+1));
                (yyval.id)[0] = '\0';
                if(!isPresent((yyvsp[(1) - (3)].id))){
                    strcat((yyval.id),(yyvsp[(1) - (3)].id));
                    strcat((yyval.id),"(");
                    strcat((yyval.id),")");
                }
                else
                {
                    char tt[100][10];
                    strcat((yyval.id),findAndReplace((yyvsp[(1) - (3)].id),tt));
                }
            
            }
    break;

  case 55:

/* Line 1806 of yacc.c  */
#line 847 "macrojava.y"
    {
            
                (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
                (yyval.id)[0] = '\0';
                strcat((yyval.id),(yyvsp[(1) - (1)].id));
            
            }
    break;

  case 56:

/* Line 1806 of yacc.c  */
#line 856 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(18));
                        (yyval.id)[0] = '\0';
                        sprintf((yyval.id),"%d",(yyvsp[(1) - (1)].ival));

                    
                    }
    break;

  case 57:

/* Line 1806 of yacc.c  */
#line 863 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].bval)) + 1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (1)].bval));

                    
                    }
    break;

  case 58:

/* Line 1806 of yacc.c  */
#line 870 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (1)].id));
                    
                    }
    break;

  case 59:

/* Line 1806 of yacc.c  */
#line 876 "macrojava.y"
    {
                        (yyvsp[(1) - (1)].id) = "this";
                        
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (1)].id))+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (1)].id));
 
                    }
    break;

  case 60:

/* Line 1806 of yacc.c  */
#line 884 "macrojava.y"
    {
                        
                        (yyvsp[(1) - (5)].id)="new";
                        (yyvsp[(2) - (5)].id)="int";
                        
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (5)].id))+strlen((yyvsp[(2) - (5)].id))+1+strlen((yyvsp[(4) - (5)].id))+1+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (5)].id));
                        strcat((yyval.id),(yyvsp[(2) - (5)].id));
                        strcat((yyval.id),"[");
                        strcat((yyval.id),(yyvsp[(4) - (5)].id));
                        strcat((yyval.id),"]");

                    
                    
                    }
    break;

  case 61:

/* Line 1806 of yacc.c  */
#line 900 "macrojava.y"
    {
                        
                        (yyvsp[(1) - (4)].id) = "new";    
                        (yyval.id) = (char*)malloc(sizeof(char)*(strlen((yyvsp[(1) - (4)].id))+strlen((yyvsp[(2) - (4)].id))+2+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),(yyvsp[(1) - (4)].id));
                        strcat((yyval.id),(yyvsp[(2) - (4)].id));
                        strcat((yyval.id),"(");
                        strcat((yyval.id),")");
                    
                    }
    break;

  case 62:

/* Line 1806 of yacc.c  */
#line 911 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(1+strlen((yyvsp[(2) - (2)].id))+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),"!");
                        strcat((yyval.id),(yyvsp[(2) - (2)].id));
 
                    
                    }
    break;

  case 63:

/* Line 1806 of yacc.c  */
#line 919 "macrojava.y"
    {
                        (yyval.id) = (char*)malloc(sizeof(char)*(1+strlen((yyvsp[(2) - (3)].id))+1+1));
                        (yyval.id)[0] = '\0';
                        strcat((yyval.id),"(");
                        strcat((yyval.id),(yyvsp[(2) - (3)].id));
                        strcat((yyval.id),")");
                    }
    break;



/* Line 1806 of yacc.c  */
#line 2744 "macrojava.tab.c"
      default: break;
    }
  /* User semantic actions sometimes alter yychar, and that requires
     that yytoken be updated with the new translation.  We take the
     approach of translating immediately before every use of yytoken.
     One alternative is translating here after every semantic action,
     but that translation would be missed if the semantic action invokes
     YYABORT, YYACCEPT, or YYERROR immediately after altering yychar or
     if it invokes YYBACKUP.  In the case of YYABORT or YYACCEPT, an
     incorrect destructor might then be invoked immediately.  In the
     case of YYERROR or YYBACKUP, subsequent parser actions might lead
     to an incorrect destructor call or verbose syntax error message
     before the lookahead is translated.  */
  YY_SYMBOL_PRINT ("-> $$ =", yyr1[yyn], &yyval, &yyloc);

  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);

  *++yyvsp = yyval;

  /* Now `shift' the result of the reduction.  Determine what state
     that goes to, based on the state we popped back to and the rule
     number reduced by.  */

  yyn = yyr1[yyn];

  yystate = yypgoto[yyn - YYNTOKENS] + *yyssp;
  if (0 <= yystate && yystate <= YYLAST && yycheck[yystate] == *yyssp)
    yystate = yytable[yystate];
  else
    yystate = yydefgoto[yyn - YYNTOKENS];

  goto yynewstate;


/*------------------------------------.
| yyerrlab -- here on detecting error |
`------------------------------------*/
yyerrlab:
  /* Make sure we have latest lookahead translation.  See comments at
     user semantic actions for why this is necessary.  */
  yytoken = yychar == YYEMPTY ? YYEMPTY : YYTRANSLATE (yychar);

  /* If not already recovering from an error, report this error.  */
  if (!yyerrstatus)
    {
      ++yynerrs;
#if ! YYERROR_VERBOSE
      yyerror (YY_("syntax error"));
#else
# define YYSYNTAX_ERROR yysyntax_error (&yymsg_alloc, &yymsg, \
                                        yyssp, yytoken)
      {
        char const *yymsgp = YY_("syntax error");
        int yysyntax_error_status;
        yysyntax_error_status = YYSYNTAX_ERROR;
        if (yysyntax_error_status == 0)
          yymsgp = yymsg;
        else if (yysyntax_error_status == 1)
          {
            if (yymsg != yymsgbuf)
              YYSTACK_FREE (yymsg);
            yymsg = (char *) YYSTACK_ALLOC (yymsg_alloc);
            if (!yymsg)
              {
                yymsg = yymsgbuf;
                yymsg_alloc = sizeof yymsgbuf;
                yysyntax_error_status = 2;
              }
            else
              {
                yysyntax_error_status = YYSYNTAX_ERROR;
                yymsgp = yymsg;
              }
          }
        yyerror (yymsgp);
        if (yysyntax_error_status == 2)
          goto yyexhaustedlab;
      }
# undef YYSYNTAX_ERROR
#endif
    }



  if (yyerrstatus == 3)
    {
      /* If just tried and failed to reuse lookahead token after an
	 error, discard it.  */

      if (yychar <= YYEOF)
	{
	  /* Return failure if at end of input.  */
	  if (yychar == YYEOF)
	    YYABORT;
	}
      else
	{
	  yydestruct ("Error: discarding",
		      yytoken, &yylval);
	  yychar = YYEMPTY;
	}
    }

  /* Else will try to reuse lookahead token after shifting the error
     token.  */
  goto yyerrlab1;


/*---------------------------------------------------.
| yyerrorlab -- error raised explicitly by YYERROR.  |
`---------------------------------------------------*/
yyerrorlab:

  /* Pacify compilers like GCC when the user code never invokes
     YYERROR and the label yyerrorlab therefore never appears in user
     code.  */
  if (/*CONSTCOND*/ 0)
     goto yyerrorlab;

  /* Do not reclaim the symbols of the rule which action triggered
     this YYERROR.  */
  YYPOPSTACK (yylen);
  yylen = 0;
  YY_STACK_PRINT (yyss, yyssp);
  yystate = *yyssp;
  goto yyerrlab1;


/*-------------------------------------------------------------.
| yyerrlab1 -- common code for both syntax error and YYERROR.  |
`-------------------------------------------------------------*/
yyerrlab1:
  yyerrstatus = 3;	/* Each real token shifted decrements this.  */

  for (;;)
    {
      yyn = yypact[yystate];
      if (!yypact_value_is_default (yyn))
	{
	  yyn += YYTERROR;
	  if (0 <= yyn && yyn <= YYLAST && yycheck[yyn] == YYTERROR)
	    {
	      yyn = yytable[yyn];
	      if (0 < yyn)
		break;
	    }
	}

      /* Pop the current state because it cannot handle the error token.  */
      if (yyssp == yyss)
	YYABORT;


      yydestruct ("Error: popping",
		  yystos[yystate], yyvsp);
      YYPOPSTACK (1);
      yystate = *yyssp;
      YY_STACK_PRINT (yyss, yyssp);
    }

  *++yyvsp = yylval;


  /* Shift the error token.  */
  YY_SYMBOL_PRINT ("Shifting", yystos[yyn], yyvsp, yylsp);

  yystate = yyn;
  goto yynewstate;


/*-------------------------------------.
| yyacceptlab -- YYACCEPT comes here.  |
`-------------------------------------*/
yyacceptlab:
  yyresult = 0;
  goto yyreturn;

/*-----------------------------------.
| yyabortlab -- YYABORT comes here.  |
`-----------------------------------*/
yyabortlab:
  yyresult = 1;
  goto yyreturn;

#if !defined(yyoverflow) || YYERROR_VERBOSE
/*-------------------------------------------------.
| yyexhaustedlab -- memory exhaustion comes here.  |
`-------------------------------------------------*/
yyexhaustedlab:
  yyerror (YY_("memory exhausted"));
  yyresult = 2;
  /* Fall through.  */
#endif

yyreturn:
  if (yychar != YYEMPTY)
    {
      /* Make sure we have latest lookahead translation.  See comments at
         user semantic actions for why this is necessary.  */
      yytoken = YYTRANSLATE (yychar);
      yydestruct ("Cleanup: discarding lookahead",
                  yytoken, &yylval);
    }
  /* Do not reclaim the symbols of the rule which action triggered
     this YYABORT or YYACCEPT.  */
  YYPOPSTACK (yylen);
  YY_STACK_PRINT (yyss, yyssp);
  while (yyssp != yyss)
    {
      yydestruct ("Cleanup: popping",
		  yystos[*yyssp], yyvsp);
      YYPOPSTACK (1);
    }
#ifndef yyoverflow
  if (yyss != yyssa)
    YYSTACK_FREE (yyss);
#endif
#if YYERROR_VERBOSE
  if (yymsg != yymsgbuf)
    YYSTACK_FREE (yymsg);
#endif
  /* Make sure YYID is used.  */
  return YYID (yyresult);
}



/* Line 2067 of yacc.c  */
#line 928 "macrojava.y"

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

