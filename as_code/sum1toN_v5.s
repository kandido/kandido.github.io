### Programa: sum1toN_v5.s
### Descripción: Macros con la directiva .equ
###              Inicializar una array de datos con los diez primeros números enteros impares y sumarlos
###                          
### gcc -m32 -o sum1toN_v5 sum1toN_v5.s
### Ensamblaje as --32  -o sum1toN_v5.o  sum1toN_v5.s
### linker -> ld  -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2  -o  sum1toN_v5  sum1toN_v5.o -lc

	##  Parámetros
        .equ N,10   # Elementos del array
        .equ LONG,4 # Tamaño de cada elemento
	
        ##  Comienzo de la sección con las variables
        .section .data
matriz:	.space  N*LONG,0   # Tamaño de la matriz e inicialización
saludo:	.string "Hola"
       
	## main: Etiqueta de la primera instrucción del programa
        ##       Accesible externamente por el linker
        .global main
        ##  Comienzo de la sección con las instrucciones
        .section .text
main:
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
fin:                
        ## salida: utilizamos la función exit() de la librería standard de C: libc
        push %ebx    #argumento de exit(valor del estado de salida "exit status" del comando o programa linux shell)
        call exit        
        .end

        
