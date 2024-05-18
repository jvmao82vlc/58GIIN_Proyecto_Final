/* A Bison parser, made by GNU Bison 2.3.  */

/* Skeleton interface for Bison's Yacc-like parsers in C

   Copyright (C) 1984, 1989, 1990, 2000, 2001, 2002, 2003, 2004, 2005, 2006
   Free Software Foundation, Inc.

   This program is free software; you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation; either version 2, or (at your option)
   any later version.

   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.

   You should have received a copy of the GNU General Public License
   along with this program; if not, write to the Free Software
   Foundation, Inc., 51 Franklin Street, Fifth Floor,
   Boston, MA 02110-1301, USA.  */

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

/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     DIGITO = 258,
     LETRAS = 259,
     CADENA = 260,
     AUMENTA = 261,
     DISMINUYE = 262,
     COMENTARIO = 263,
     SUMA = 264,
     RESTA = 265,
     MULT = 266,
     DIV = 267,
     EQUAL = 268,
     NE = 269,
     LE = 270,
     GE = 271,
     GT = 272,
     LT = 273,
     L_PAREN = 274,
     R_PAREN = 275,
     L_KEY = 276,
     R_KEY = 277,
     L_COR = 278,
     R_COR = 279,
     AND = 280,
     OR = 281,
     SEMIC = 282,
     COMA = 283,
     PUNTO = 284,
     INT = 285,
     DOUBLE = 286,
     CHAR = 287,
     PRINTF = 288,
     SCANF = 289,
     FIN = 290,
     VOID = 291,
     RETURN = 292,
     FOR = 293,
     WHILE = 294,
     DO = 295,
     IF = 296,
     ELSE = 297,
     THEN = 298,
     SWITCH = 299,
     CASE = 300,
     BREAK = 301,
     DEFAULT = 302,
     MAIN = 303,
     INCLUDE = 304,
     NUMBER = 305,
     DOUBLE_NUM = 306,
     STRING = 307,
     CHARACTER = 308,
     ID = 309,
     TRUE = 310,
     FALSE = 311
   };
#endif
/* Tokens.  */
#define DIGITO 258
#define LETRAS 259
#define CADENA 260
#define AUMENTA 261
#define DISMINUYE 262
#define COMENTARIO 263
#define SUMA 264
#define RESTA 265
#define MULT 266
#define DIV 267
#define EQUAL 268
#define NE 269
#define LE 270
#define GE 271
#define GT 272
#define LT 273
#define L_PAREN 274
#define R_PAREN 275
#define L_KEY 276
#define R_KEY 277
#define L_COR 278
#define R_COR 279
#define AND 280
#define OR 281
#define SEMIC 282
#define COMA 283
#define PUNTO 284
#define INT 285
#define DOUBLE 286
#define CHAR 287
#define PRINTF 288
#define SCANF 289
#define FIN 290
#define VOID 291
#define RETURN 292
#define FOR 293
#define WHILE 294
#define DO 295
#define IF 296
#define ELSE 297
#define THEN 298
#define SWITCH 299
#define CASE 300
#define BREAK 301
#define DEFAULT 302
#define MAIN 303
#define INCLUDE 304
#define NUMBER 305
#define DOUBLE_NUM 306
#define STRING 307
#define CHARACTER 308
#define ID 309
#define TRUE 310
#define FALSE 311




#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef int YYSTYPE;
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
# define YYSTYPE_IS_TRIVIAL 1
#endif

extern YYSTYPE yylval;

