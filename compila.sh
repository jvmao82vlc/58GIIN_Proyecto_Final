#!/bin/bash

echo "Inicio"
echo "Compilando lexico ..."
flex lexico.l
echo "fin lexico"
echo "----------------------"

echo "Compilando sintactico ..."
Bison -d sintactico.y
echo "fin sintactico"
echo "----------------------"

echo "Generando ejecutable compilador_c ..."
gcc lex.yy.c sintactico.tab.c -o compilador_c
echo "Fin"