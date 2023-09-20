### Programa: sum1toN_v4.s
### Descripción: realiza la suma de la serie 1,2,3,...5
###              Novedades: función exit() de la librería standard de C
###                          
### gcc -m32 -o sum1toN_v4 sum1toN_v4.s
### Ensamblaje as --32  -o sum1toN_v4.o  sum1toN_v4.s
### linker -> ld  -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2  -o  sum1toN_v4  sum1toN_v4.o -lc

        ##  Comienzo de la sección con las variables
        .section .data
n:	.byte 0xF
cero:	.byte 0
saludo:	.string "Hola"
       
	## main: Etiqueta de la primera instrucción del programa
        ##         Accesible externamente por el linker
        .global main
        ##  Comienzo de la sección con las instrucciones
        .section .text
main:
        ## utilizamos la función puts() de la librería standard de C: libc
	push $saludo   #argumento de puts(dirección del string)  
	call puts
        mov cero,%ebx # EBX implementa la variable suma ; suma=0
        mov n,%eax # EAX implementa la variable n ; n=5
bucle:
        add %eax,%ebx # sum +=n
        sub $1,%eax
        jnz bucle
	
fin:                
        ## salida: utilizamos la función exit() de la librería standard de C: libc
        push %ebx    #argumento de exit(valor del estado de salida "exit status" del comando o programa linux shell)
        call exit        
        .end

        
