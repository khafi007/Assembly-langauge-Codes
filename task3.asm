[org 0x0100]

xor ax, ax
xor dx, dx
mov cx ,10
mov bx , 0

	l1:
		mov dl, [data + bx]
		add bx ,1
		cmp dx ,2
		jz l1
		
		l2:
			add al , dl
			sub cx,1
			jnz l1
		

mov ax ,0x4c00
int 0x21


data: db 1, 2,3,2,1,2, 3,0, 1, 2
