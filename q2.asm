[org 0x0100]

jmp start

data: dw 1,2
result: dw 0

	multi:
		mul bx
		mov [result],bx
		ret

	
	divi:
		div bx
		mov [result],bx
		ret


start:
	xor ax ,ax
	xor bx,bx
	mov ax, [data]
	mov bx , [data +2]
	call multi
	xor ax,ax
	xor bx,bx
	mov ax, [data]
	mov bx, [data +2]
	call divi
	
mov ax,0x4c00
int 0x21
