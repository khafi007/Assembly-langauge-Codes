[org 0x0100]

mov cx, 6
l1:
	mov bx,0

l2:
	mov ax,[data+bx]
	cmp ax ,[data+bx+2]
	jna l3
	mov dx, [data+bx+2]
	mov [data+bx+2], ax
	mov [data+bx], dx

l3:
	add bx,2
	cmp bx,6
	jne l2
	loop l1		;after sorting the array


xor ax,ax
mov ax, [data + 2] ;Second smallest
mov [result],ax

xor ax,ax
mov ax, [data + 8] ;second largest
mov [result], ax

mov ax,0x4c00
int 0x21

data: dw 2,0,0,1,6,7
result: dw 0
