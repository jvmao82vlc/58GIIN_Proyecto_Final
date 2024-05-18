%{
	//includes

	#include <stdio.h>
	#include <stdlib.h>
	#include <string.h>
	#include <ctype.h>
	#include <locale.h>
    #include <math.h>

	//defines 
    #define MAX_LENGTH 100 
	#define BUFER_SIZE 1024
	#define YYSTYPE double


	//funciones 
	int yywrap();
	int yylex(void);
	void yyerror(char* mensaje);

	//variables globales 
	extern FILE *yyin;
	extern FILE *yyout;
%}


/* tokens */

%token DIGITO LETRAS
%token CADENA
%token AUMENTA DISMINUYE
%token COMENTARIO
%token SUMA RESTA MULT DIV
%token EQUAL NE LE GE GT LT
%token L_PAREN R_PAREN L_KEY R_KEY L_COR R_COR
%token AND OR
%token SEMIC COMA PUNTO
%token INT DOUBLE CHAR
%token PRINTF SCANF
%token FIN
%token VOID
%token RETURN
%token FOR WHILE DO
%token IF ELSE THEN SWITCH CASE BREAK
%token DEFAULT
%token MAIN
%token INCLUDE
%token NUMBER DOUBLE_NUM STRING CHARACTER ID
%token TRUE FALSE


%left SUMA RESTA
%left MULT DIV
%left NE LE GE GT LT
%left AND OR

%start programa

%%

programa: cabecera main L_PAREN R_PAREN L_KEY cuerpo return R_KEY
;

cabecera: 
		| cabecera INCLUDE 
;

main: tipoDato MAIN
;


cuerpo: /*empty*/
		| cuerpo declaracion
		| cuerpo condiciones
		| cuerpo bucles
		| cuerpo salida
		| cuerpo COMENTARIO
;

declaracion: tipoDato ID SEMIC
			| tipoDato ID EQUAL valor SEMIC
			| ID EQUAL valor SEMIC
			| ID AUMENTA SEMIC
			| ID DISMINUYE SEMIC
;

condiciones: IF L_PAREN condicion R_PAREN L_KEY cuerpo R_KEY
			| IF L_PAREN condicion R_PAREN L_KEY cuerpo R_KEY ELSE L_KEY cuerpo R_KEY
;

bucles: WHILE L_PAREN condicion R_PAREN L_KEY cuerpo R_KEY
| DO L_KEY cuerpo R_KEY WHILE L_PAREN condicion R_PAREN SEMIC
| FOR L_PAREN control_bucle SEMIC condicion SEMIC control_bucle R_PAREN L_KEY cuerpo R_KEY
;


salida: PRINTF L_PAREN STRING R_PAREN SEMIC 
| PRINTF L_PAREN STRING COMA valor R_PAREN SEMIC
;	

condicion: valor EQUAL valor
| valor NE valor
| valor GT valor
| valor GE valor
| valor LT valor
| valor LE valor
| condicion OR condicion
| condicion AND condicion
;

control_bucle: ID EQUAL valor
| ID AUMENTA
| ID DISMINUYE
;


tipoDato: INT 
			| DOUBLE 
			| CHAR
			| VOID
;

valor: NUMBER 			{ $$=$1;}
		| DOUBLE_NUM	{ $$=$1;}
		| CHARACTER		
		| ID			
		| valor SUMA valor   { $$ = $1 + $3;  }
        | valor RESTA valor  { $$ = $1 - $3;  }
        | valor MULT valor   { $$ = $1 * $3;  }
        | valor DIV valor    { $$ = $1 / $3;  }
;

return: RETURN valor SEMIC 
|
;


%%



void yyerror(char *mensaje){
    printf("Error: %s \n", mensaje);
	exit(1);
}

int main(int argc, char **argv){
	printf("Inicio Compilación \n");
	printf("------------------ \n");

	yyin = fopen("test.txt","r"); //carga fichero texto test.txt

	if (NULL == yyin) {
        printf("No se puede abrir el fichero \n");
    } else {
		// Parser
		switch (yyparse()){
			case 0: printf("Proceso Compilación finalizado Correctamente \n");
			break;
			case 1: printf("Errores en compilacion \n");
			break;
			case 2: printf("No hay suficiente memoria \n");
			break;
		}
	}

	printf("------------------ \n");
	printf("Fin Compilación \n");

	fclose(yyin);
	fclose(yyout);
	return 0;
}