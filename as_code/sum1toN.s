<meta charset="UTF-8">
<meta http-equiv="Content-type" content="text/html; charset=UTF-8">
### Programa: sum1toN.s
### Descripción: realiza la suma de la serie 1,2,3,...5
### gcc -m32 -nostartfiles -o sum1toN sum1toN.s
###       -nostartfiles: es necesario si la entrada a la primera instrucción del programa es
###                      a través de la etiqueta _start
### Ensamblaje as --32  -o sum1toN.o  sum1toN.s
### linker -> ld -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2   -o  sum1toN  sum1toN.s.o -lc

        ##  Comienzo de la sección con las variables
        .section .data
        ## En este programa no hay variables:
        ## no es necesario reservar memoria para las variables

       
	## _start: Etiqueta de la primera instrucción del programa
        ##         Accesible externamente por el linker
        .global _start
        ##  Comienzo de la sección con las instrucciones
        .section .text
_start:
        mov $0,%ebx # EBX implementa la variable suma ; suma=0
        mov $5,%eax # EAX implementa la variable n ; n=5
bucle:
        add %eax,%ebx # sum +=n
        sub $1,%eax
        je fin
	jmp bucle
fin:                
        ## salida
        mov $1, %eax  # código en EAX para que el Sistema operativo ejecute la funcion exit
                      # El argumento de la función exit se pasa a través de EBX
        int $0x80     # INTerrupción del programa sum1toN y llamada al Sistema Operativo
        .end

        
