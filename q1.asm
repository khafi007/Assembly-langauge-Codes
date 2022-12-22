[org 0x0100]

jmp start

data: db 1,2,1,1,1,1,1
result: db 0

	addi:
		add al, [data + bx]
		add bx , 1
		sub cx ,1
		jnz addi
		mov [result], al
		ret




start:
	xor ax ,ax
	mov cx ,7
	mov bx , 0
	call addi
	
mov ax,0x4c00
int 0x21
