[org 0x0100]

jmp main

sum:
	add ax, bx
	
ret

main:
	mov ax,3
	mov bx,4
	
call sum

mov ax, 0x4c00
int ox21
