### Programa: preservar.s
### Descripcion: 
###             
### gcc -m32 -o preservar preservar.s
### Ensamblaje as --32  -o preservar.o  preservar.s
### linker -> ld  -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2  -o  sum1toN_v8  sum1toN_v8.o 

### manual de instrucciones x86 -> https://www.felixcloutier.com/x86/

	
## Subrutina sumMtoN.s

## Subrutina sumMtoN.s

	.section .data
M:	.byte 3
N:	.byte 10
resultado: .byte 0

	## el shell de linux llama a main()
	## el shell como funcion llamante ha preservado eax, ecx y edx

	.global main
	.section .text
main:
	## prologo de main
	push %ebp
	mov %esp,%ebp
	## variable local de main
	sub $4,%esp
	## como funcion que ha sido llamada por el shell preserva ebx, esi y edi para el shell
        push %edi
	push %esi
	push %ebx

	## capturar argumentos de la funcion llamante (linea de comandos del shell)
	##   en este caso no utilizo los argumentos
	## procesar los argumentos del shell (utilizar eax,ebx,ecx,esi,edi)
        ##   en este caso no hay proceso

	## Voy a llamar a suma() y empiezan los preparativos	
	## preservar los registros que puede utilizar suma() libremente
	push %edx
	push %ecx
	push %eax
	
	## pasar los argumentos a suma()
	movb N,%ecx   ## segundo argumento
        push %ecx
	movb M,%edx  ## primer argumento
        push %edx

	
	## Llamar a la subrutina        
        call suma

	## Guardar el resultado de suma()
	movb %al,resultado

	## recuperar los registros salvados antes de la llamada suma()
	pop %eax
	pop %ecx
	pop %edx

	## podría procesar datos y utilizar cualquiera de los registros eax,ebx,ecx,esi,edi y  la variable resultado
	## En este caso no proceso nada, tengo el resultado en AL

	## Finalizo la funcion main() como toda subrutina retornando a la función llamante, en este caso el shell de linux
        ## como funcion que ha sido llamada por el shell recupera ebx, esi y edi para el shell
        pop %ebx
	pop %esi
	pop %edi

	## Retorna un valor al shell a traves de EAX por CONVENIO
	movb resultado,%al

	## epilogo de main
	mov %ebp,%esp           # frame anterior
	pop %ebp
        
        ret



### Funcion que calcula la suma de numeros de enteros en la secuencia entre dos limites dados
	.type suma, @function
	.section .text
suma:
	## Pasos iniciales antes del procesamiento de los argumentos de suma()
	## prologo: genera un nuevo frame para suma()
	push %ebp
	movl %esp,%ebp
        
        # una variable local de 4 bytes para suma()
	subl $4,%esp            

	## preserva los registros utilizados por main()
	push %edi
	push %esi
	push %ebx
	
        ## captura de argumentos de la función suma()
	movb 8(%ebp),%al      #1º argumento 
	movb 12(%ebp),%cl     #2º argumento


	## algoritmo de la subrutina suma(): suma desde el 1º arg hasta el 2º arg
        ## se pueden utilizar cualquiera de los registros eax,ebx,ecx,edx,esi,edi
	## utilizo al como suma parcial y bl como sumando
	movb %al,%bl
bucle:
	inc %bl
	addb %bl,%al
	cmpb %bl,%cl
	jg  bucle         
	
	## el resultado esta en AL  por CONVENIO

	## Comienza el retorno a la función llamante main()
	## recupera los  registros salvados para main()
	pop %ebx
	pop %esi
	pop %edi

	## epilogo
	mov %ebp,%esp           # frame anterior
	pop %ebp
	ret                     # recuperar dirección de retorno	
	
	.end
