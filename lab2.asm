[org 0x0100]
	mov ax,0x8787
	xor ax,ax
	
	mov ah,[num1]
	
	mov bl,[num1+1]
	add ah,bh
	
	mov bh,[num1+2]
	add ah,bh
	
	mov [num1+3],ah
	
	mov ax,0x4c00
	int 0x21
	
num1: db 5,10,15,0
	
