### Programa: sum1toN_v2.s
### Descripción: realiza la suma de la serie 1,2,3,...5
###              Novedades: sección de variables ó datos: variables y su inicialización
###                         directiva .byte : reserva memoria para un número entero de tamaño 1 byte
###                         instruccion jnz ó jne
### gcc -m32 -nostartfiles -o sum1toN_v2 sum1toN_v2.s
### Ensamblaje as --32  -o sum1toN_v2.o  sum1toN_v2.s
### linker -> ld -melf_i386  -o  sum1toN_v2  sum1toN_v2.o 

        ##  Comienzo de la sección con las variables
        .section .data
cinco:	.byte 5
cero:	.byte 0
       
	## _start: Etiqueta de la primera instrucción del programa
        ##         Accesible externamente por el linker
        .global _start
        ##  Comienzo de la sección con las instrucciones
        .section .text
_start:
        mov cero,%ebx # EBX implementa la variable suma ; suma=0
        mov cinco,%eax # EAX implementa la variable n ; n=5
bucle:
        add %eax,%ebx # sum +=n
        sub $1,%eax   # --n
        jnz bucle     # while(n!=0)
	
fin:                
        ## salida     # exit(suma)
        mov $1, %eax  # código en EAX para que el Sistema operativo ejecute la funcion exit
                      # El argumento de la función exit se pasa a través de EBX
        int $0x80     # INTerrupción del programa sum1toN y llamada al Sistema Operativo
        .end

        
