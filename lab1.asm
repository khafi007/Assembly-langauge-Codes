[org 0x0100]

mov ax, [num1]
mov bx, [num1 + 2]
mov ax,bx
mov bx,[num1 + 4]
add ax,bx
mov [num1 +6],ax

mov ax,0x4c00
int 0x21

num1:	dw 5
	dw 10
	dw 15

