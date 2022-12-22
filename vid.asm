[org 0x0100]

mov ax, 0xB800
mov es, ax
mov di,0

clrscn:
	mov word [es:di], 0x4276
	
	add di, 2
	cmp di, 4000
	
	jne clrscn
	
mov ax,0x4c00
int 0x21
