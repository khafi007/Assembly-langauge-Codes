[org 0x0100]


mov ax ,[dataa]
mov bx ,10
div ax
add dx,ax
mov [result] , dx


xor ax, ax
xor dx ,dx
xor bx ,bx
mov ax ,[dataa + 2]
mov bx ,10
div ax
add dx,ax
mov [result +2] , dx


xor ax, ax
xor dx ,dx
xor bx ,bx
mov ax ,[dataa + 4]
mov bx ,10
div ax
add dx,ax
mov [result +4 ] , dx


mov ax ,0x4c00
int 0x21
dataa: dw 47,72,31
result: dw 0
	
	

	

