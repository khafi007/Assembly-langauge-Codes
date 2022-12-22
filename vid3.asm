[org 0x0100]

jmp start

clrscn:
	push es
	push ax
	push cx
	push di
	
	mov ax, 0xB800
	mov es, ax
	
	xor di,di
	mov ax, 0x0720
	mov cx, 2000
	
	cld 
	rep stosw
	
	pop di
	pop cx
	pop ax
	pop es
	ret
	
start:
	call clrscn
	
mov ax, 0x4c00
int 0x21\
	
	
