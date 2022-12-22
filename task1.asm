[org 0x0100]

xor ax ,ax
mov cx ,6
mov bx , 0
	l1:
		add al, [data + bx	]
		add bx , 1
		sub cx ,1
		jnz l1 


	mov ax, 0x4c00
	int 0x21



data: db 1,2,1,1,2,2
