###Programa: sum1toN_v4.s
###Deskribapena: 1,2,3 serie,... 5
##Nobedadeak: exit funtzioa () de la librería standard de C
###
##gcc -m32 -o sum1toN_v4 sum1toN_v4.s
###Mihiztadura --32 -o sum1toN_v4.o sum1toN_v4.s
###linker -> ld -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2 -o sum1toN_v4 sum1toN_v4.o -lc

##Atalaren hasiera aldagaiekin
	.section .data				
n: .byte 0xF
zero: .byte 0
agurra: .string "Kaixo"

##main: Programaren lehen instrukzioaren etiketa
##Kanpotik linkerretik eskuragarria
	.global main
##Sekzioaren hasiera jarraibideekin
	.section .text
main:
##C: libc liburutegi estandarraren puts () funtzioa erabiltzen dugu
	push $agurra # puts (string helbidea) argudioa
	call puts
	mov zero, %ebx #EBXk batura aldagaia inplementatzen du; batura = 0
	mov n, %eax #EAX n; n = 5 aldagaia txertatzen du
begizta:
	add %eax, %ebx #sum + = n
	sub $1, %eax
	jnz begizta

amaiera:
##irteera: C: libc liburutegi estandarraren exit () funtzioa erabiltzen dugu
	push %ebx #exit (komandoaren edo linux shell programaren "exit status" irteera-egoeraren balioa) argudioa
	call exit
.end


