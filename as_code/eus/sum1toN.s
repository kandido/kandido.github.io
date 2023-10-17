###Programa: sum1toN.s
###Deskribapena: 1,2,3 serie,... 5
##gcc -m32 -nostartfiles -o sum1toN sum1toN.s
### -nostartfiles: beharrezkoa da programaren lehen jarraibidean sartzea
###_start etiketaren bidez
###Mihiztadura --32 -o sum1toN.o sum1toN.s
###linker -> ld -melf_i386 -I/lib/i386-linux-gnu/ld-linux.so.2 -o sum1toN sum1toN.s.o -lc

##Atalaren hasiera aldagaiekin
	.section .data
##Programa honetan ez dago aldagairik:
##ez da beharrezkoa memoria gorde aldagaietarako


##_start: Programaren lehen instrukzioaren etiketa
##Kanpotik linkerretik eskuragarria
	.global _start
# #Sekzioaren hasiera jarraibideekin
	.sectiion .text
_start:
	mov $0, %ebx #EBXk batura aldagaia inplementatzen du; batura = 0
	mov $5, %eax #EAXk n; n = 5 aldagaia inplementatzen du
begizta:
	add %eax,%ebx #sum + = n
	sub $1,%eax
	je amaiera
	jmp begizta
amaiera:
	##irteera
	mov $1, %eax #kodea EAXn, sistema eragileak exit funtzioa bete dezan
#Exit funtzioaren argumentua EBX bidez pasatzen da
	int $0x80 #SUM1TON programaren urratzea eta sistema eragilera deitzea
.end


