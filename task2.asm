[org 0x0100]

xor ax,ax

mov al, [num1]
add al , [num1 +2]

mov ah, [num2]
add ah, [num2 + 1]

add ah,al

mov [result],ax


mov ax,0x4c00
int 0x21


num1: dw 2,3 	
num2: db 1,2
result: dw 0
