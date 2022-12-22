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
	loop l1

mov ax,0x4c00
int 0x21

data: dw 2,0,0,1,6,7
