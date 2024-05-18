%{

  //includes
  #include <stdio.h>
  #include <stdlib.h>
  #include <string.h>
  #include <math.h>
  #include <ctype.h>
  #include "sintactico.tab.h"


  //defines
  #define MAX_LENGTH 100 
  #define BUFER_SIZE 1024

  //funciones 
  int checkSimbolo(char c);
  int checkReservado(char* cadena);
  void checkError(char *mensaje);

  //variables globales
  FILE *yyin;
  int lineno = 1;

%} 

%option noyywrap
%option yylineno

/*expresiones regulares*/
DIGITO [0-9]+
LETRAS [a-zA-Z]+
CADENA "\""({LETRAS}|{DIGITO}|.)*"\""
AUMENTA   "++"
DISMINUYE "--"
COMENTARIO "//".*"\n"  

%%

"+"       { checkSimbolo('+');
            return SUMA;}
"-"       { checkSimbolo('-');
            return RESTA;}
"*"       { checkSimbolo('*');
            return MULT;}
"/"       { checkSimbolo('/');
            return DIV;}
"="       { checkSimbolo('=');
            return EQUAL;}
"!="      { checkSimbolo('!');
            return NE; }
"<="      { return LE; }
">="      { return GE; }
">"	      { checkSimbolo('>');
            return GT; }
"<"	      { checkSimbolo('<');
            return LT; }
"("       { checkSimbolo('(');
            return L_PAREN;}
")"       { checkSimbolo(')');
            return R_PAREN;}
"{"       { checkSimbolo('{');
            return L_KEY;}
"}"       { checkSimbolo('}');
            return R_KEY;}
"["       { checkSimbolo('[');
            return L_COR;}
"]"       { checkSimbolo(']');
            return R_COR;}
"&&"	  { checkSimbolo('&');
            return AND; }
"||"	  { checkSimbolo('|');
            return OR; }
";"       { checkSimbolo(';');
            return SEMIC;}
","       { checkSimbolo(',');
            return COMA;}
"."       { checkSimbolo('.');
            return PUNTO;}

"true"  {  checkReservado("true"); 
            return TRUE;}

"false"  {  checkReservado("false"); 
            return FALSE;}

"exit"	                    {  checkReservado("exit"); 
                            return FIN;}
"int"                       {  checkReservado("int");  
                            return INT; }
"double"                     {  checkReservado("double");  
                            return DOUBLE; }
"char"                      {  checkReservado("char");  
                            return CHAR; }
"printf"                    {checkReservado("printf"); 
                             return PRINTF; }
"scanf"                     { checkReservado("scanf"); 
                            return SCANF; }
"void"                      { checkReservado("void"); 
                            return VOID; }
"return"                    {  checkReservado("return"); 
                            return RETURN; }
"for"	                    {  checkReservado("for"); 
                            return FOR; }
"while"                     {  checkReservado("while"); 
                            return WHILE;} 
"do"                        {  checkReservado("do"); 
                            return DO;} 
"if"	                    {  checkReservado("if"); 
                            return IF; }
"else"	                    {  checkReservado("else"); 
                            return ELSE; }
"switch"                    {  checkReservado("switch"); 
                            return SWITCH;} 
"case"                      {  checkReservado("case");  
                            return CASE;} 
"break"                     {  checkReservado("break");  
                            return BREAK;}
"default"                   {  checkReservado("default");  
                            return DEFAULT;}
"main"                      {  checkReservado("main");  
                            return MAIN;}
^"#include"[ ]*<.+\.h>      { return INCLUDE; }


([+-]?{DIGITO}+)                                  { return NUMBER; }
[-]?{DIGITO}+\.{DIGITO}{1,6}                      { return DOUBLE_NUM; }
["].*["]                                          { return STRING; }
['].[']                                           { return CHARACTER; }
{LETRAS}({LETRAS}|{DIGITO})*                      { return ID; }
{COMENTARIO}                                      { return COMENTARIO; }
{AUMENTA}                                         { return AUMENTA;}
{DISMINUYE}                                       { return DISMINUYE; }

                                                                                                         
"\n"
"\r\n"
"\t"
" "
.           { checkError("Caracter desconocido"); }

%%
 
//Función para comprobar que los símbolos son correctos
int checkSimbolo(char c) {
	if (
        c == '+' || c == '-' || c == '*' || c == '/' || c == '=' ||  
        c == '<' || c == '>' || c == '!' || c == '&' || c == '|' || 
        c == ';' || c == ',' || c == '.' || c == '(' || c == ')' || 
        c == ',' || c == '{' || c == '}' || c == '[' || c == ']' 
      ) 
    {
		return 1;
	} else 
        printf("Error Símbolo: %c ", c);
		return 0;
}

//Función para comprobar las palabras reservadas
int checkReservado(char* cadena) 
{ 
    const char* keywords[] 
        = { "true","false","exit", "int","double",
            "char","printf","scanf","void","return",
            "for","while","do","if","else","switch","case",
            "break","default","main"  
          }; 
    
    for (int i = 0; i < sizeof(keywords) / sizeof(keywords[0]); i++) { 
        if (strcmp(cadena, keywords[i]) == 0) { 
            return 1; 
        } 
    } 
    printf("Error Palabra Reservada: %s ", cadena);
    return 0; 
} 

//Comprobación ERRORES
void checkError(char *mensaje){
    printf("Error: \"%s\" en linea %d. Token = %s\n", mensaje, lineno, yytext);
	exit(1);
}



