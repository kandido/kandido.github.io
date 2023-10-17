
###Programa: sum1toN_v3.s
###Deskribapena: 1,2,3 serie,... 5
###Berriak:
###direktiba .string: memoria erreserbatu eta string batekin hasten du
## C liburudenda estandarreko funtzio puts ()
###
##gcc -m32 -o sum1toN_v3 sum1toN_v3.s
###Mihiztadura --32 -o sum1toN_v3.o sum1toN_v3.s
###linker -> ld -e main -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2 -o sum1toN_v3 sum1toN_v3.o -lc

##Atalaren hasiera aldagaiekin
	.section .data
bost: .byte 5
zero: .byte 0
agurra: .string "Kaixo"

##main: Programaren lehen instrukzioaren etiketa
##Kanpotik linkerretik eskuragarria
 	.global main
##Sekzioaren hasiera jarraibideekin
	.section .text
main:
##C: libc liburutegi estandarraren puts () funtzioa erabiltzen dugu
	push $agurra #argumento de puts (string helbidea)
	call puts #puts funtziorako deia ()
	mov zero, %ebx #EBXk batura aldagaia inplementatzen du; batura = 0
	mov bost, %eax #EAXk n; n = 5 aldagaia inplementatzen du
begizta:
	add %eax, %ebx #sum + = n
	sub $1, %eax
	jnz begizta

amaiera:
##irteera
	mov $1, %eax #kodea EAXn, sistema eragileak exit funtzioa bete dezan
#Exit funtzioaren argumentua EBX bidez pasatzen da
	int $0x80 #SUM1TON programaren urratzea eta sistema eragilera deitzea
.end


