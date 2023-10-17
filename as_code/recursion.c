/*
Programa:recursion.c
función recursiva: funsum
                       captura el caracter al que apunta s, convierte el caracter en un número (su código ASCII) y lo suma a la conversión anterior
                       termina cuando el caracter capturado es el NULL (fin de string)
                       Pej : "012" -> 0x30+0x31+0x32 -> 0x93
gcc -g -m32 -o recursion recursion.c
*/

#include <stdio.h> 

// prototipo
long funsum (char *s);

int main(int argc, char **argv) {

char *s = "012";
long resultado=funsum(s); // variable local a main
printf("resultado: 0x%lx\n",resultado);
}

long funsum (char *s){
  if (*s) {
    long temp = (long)*s; //variable local con casting del puntero dereferenciado
    s++; //cada llamada se incrementa la dirección del puntero
    return temp + funsum(s); // retorno=variable local + anterior retorno
  }
  return 0;
}
