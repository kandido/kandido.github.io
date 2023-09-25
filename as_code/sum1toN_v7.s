### Programa: sum1toN_v7.
### Descripción: Macros con la directiva .equ
###              Inicializar una array de datos con los diez primeros números enteros impares y sumarlos
###		 bucle con la instrucción "cmp"
###              Visualizar el resultado con la función printf() de la librería standard de C
###              Pasar los dos argumentos a través de la pila insertando primero el último argumento printf(1º arg,2º arg) 
### gcc -m32 -o sum1toN_7p sum1toN_v7.s
### Ensamblaje as --32  -o sum1toN_v7.o  sum1toN_v7.s
### linker -> ld  -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2  -o  sum1toN_v7  sum1toN_v7.o -lc

### manual de instrucciones x86 -> https://www.felixcloutier.com/x86/

	##  Parámetros
        .equ N,10   # Elementos del array
        .equ LONG,4 # Tamaño de cada elemento
	
        ##  Comienzo de la sección con las variables
        .section .data
matriz:	.space  N*LONG,0   # Tamaño de la matriz e inicialización
saludo:	.string "Hola"
msn:    .string "El resultado de la suma es %d \n" 
       
	## main: Etiqueta de la primera instrucción del programa
        ##       Accesible externamente por el linker
        .global main
        ##  Comienzo de la sección con las instrucciones
        .section .text
main:
	## inicializo el frame main de la pila
	push %ebp
	mov %esp,%ebp

        ## utilizamos la función puts() de la librería standard de C: libc
	push $saludo   #argumento de puts(dirección del string)  
	call puts	
        ## Escritura en el array matriz de N elementos
	## Estructura del bucle de Escritura y Suma
	mov $1,%ecx	# primer elemento impar
	xor %esi,%esi	# indice del primer elemento
	mov $0,%edx     # inicio de la suma
bucle:
        mov %ecx,matriz(,%esi,LONG)
        add matriz(,%esi,LONG),%edx
	add $2,%ecx
	inc %esi
	cmp $N,%esi
        jb  bucle

	# Visualización del resultado de la suma con printf
	push %edx
        push $msn
	call printf
	
fin:                
        ## salida: utilizamos la función exit() de la librería standard de C: libc
        push %ebx    #argumento de exit(valor del estado de salida "exit status" del comando o programa linux shell)
        call exit

	# finalizo el frame de la pila
	mov %esp,%ebp
        pop %ebp        
        .end
