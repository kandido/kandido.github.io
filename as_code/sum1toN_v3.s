### Programa: sum1toN_v3.s 
### Descripción: realiza la suma de la serie 1,2,3,...5
###              Novedades:
###                        directiva .string: reserva memoria y la inicializa con un string 
###                        función puts() de la librería standard de C
###                         
### gcc -m32 -o sum1toN_v3 sum1toN_v3.s
### Ensamblaje as --32  -o sum1toN_v3.o  sum1toN_v3.s
### linker -> ld  -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2  -o  sum1toN_v3  sum1toN_v3.o -lc

        ##  Comienzo de la sección con las variables
        .section .data
cinco:	.byte 5
cero:	.byte 0
saludo:	.string "Hola"
       
	## main: Etiqueta de la primera instrucción del programa
        ##         Accesible externamente por el linker
        .global main
        ##  Comienzo de la sección con las instrucciones
        .section .text
main:
        ## utilizamos la función puts() de la librería standard de C: libc
	push $saludo  #argumento de puts(dirección del string) 
	call puts     #llamada a la función puts()
        mov cero,%ebx # EBX implementa la variable suma ; suma=0
        mov cinco,%eax # EAX implementa la variable n ; n=5
bucle:
        add %eax,%ebx # sum +=n
        sub $1,%eax
        jnz bucle
	
fin:                
        ## salida
        mov $1, %eax  # código en EAX para que el Sistema operativo ejecute la funcion exit
                      # El argumento de la función exit se pasa a través de EBX
        int $0x80     # INTerrupción del programa sum1toN y llamada al Sistema Operativo
        .end

        
