%{
	#include <stdarg.h>
	#include "comp_shared.h"
	#define YYSTYPE char *
	int yydebug=1;
	int indent=0;
	char *iden_dum;
%}
%token INT
%token VOID
%token ID
%token NUM
%token IF
%token ELSE
%token WHILE
%token RETURN
%token EQ
%token NE
%token LE
%token GE
%token COMMENT
 
%% /* Grammar rules and actions follow */
program:
	declaration-list
		{ printf("%3d: FROM BISON declaration-list\n", line_number); } 
;
declaration-list:
	declaration-list declaration
		{ printf("%3d: FROM BISON declaration-list declaration\n", line_number); }
	| declaration
		{ printf("%3d: FROM BISON declaration\n", line_number); }
;                                            
declaration:
	var-declaration
		{ printf("%3d: FROM BISON var-declaration\n", line_number); }
	| fun-declaration
		{ printf("%3d: FROM BISON fun-declaration\n", line_number); }                   
;    
var-declaration:
	type_specifier ID ';'
	| type_specifier ID '[' NUM ']' ';' 
;                                                                             
type_specifier:
	VOID
		{ printf("%3d: FROM BISON VOID\n", line_number); }
	|  INT
		{ printf("%3d: FROM BISON INT\n", line_number); }                           
;   
fun-declaration:
	type_specifier ID '(' params ')' compound-stmt
;
params:
	param_list
	| VOID
;
param_list:
	param_list ',' param
	| param
;
param:
	type_specifier ID
	| type_specifier ID '[' ']'
;
compound-stmt:
	'{' local-declarations statement-list '}'
;
local-declarations:
	local-declarations var-declaration
	| %empty
;
statement-list:
	statement-list statement
	| %empty
;
statement:
	expression-stmt
	| compound-stmt
	| selection-stmt
	| iteration-stmt
	| return-stmt
;
expression-stmt:
	expression ';'
	| ';'
;
selection-stmt:
	IF '(' expression ')' statement
	| IF '(' expression ')' statement ELSE statement
;
iteration-stmt:
	WHILE '(' expression ')' statement
;
return-stmt:
	RETURN ';'
	| RETURN expression ';'
;
expression:
	var '=' expression
	| simple-expression
;
var:
	ID
	| ID '[' expression ']'
;
simple-expression:
	additive-expression relop additive-expression
	| additive-expression
;
relop:
	'<' 
	| LE
	| '>'
	| GE
	| EQ
	| NE 
;   
additive-expression:
	additive-expression addop term
	| term 
;
addop:
	'+'
	| '-'
;
term:
	term mulop factor
	| factor
;
mulop:
	'*'
	| '/'
;
factor:
	'(' expression ')'
	| var
	| call
	| NUM
;
call:
	ID '(' args ')'
;
args:
	arg-list
	| %empty 
;
arg-list:
	arg-list ',' expression
	| expression
;                                                                                  
%%                                                                                   
 
main ()                                                                              
{
	if (yyparse ()==0){
		printf("Correct syntax in the given program!");
	}else{
		printf("In-correct syntax in the given program");
	};                                                                        
}
