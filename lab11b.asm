[org 0x0100]

jmp start

clearscreen:
	mov ah, 07h			;scroll down func
	xor al , al			;number of lines to scroll
	xor cx , cx			;upper left corner CH = row, CL = column
	mov dx , 174Fh		;lower right corner DH = row, DL = column
	mov bh, 00h			;Black on Black
	int 10h
	ret
	
topborder:
	mov ah, 07h
	xor al,al
	mov ch, 0
	mov cl, 0
	mov dh, 4
	mov dl, 79
	mov bh ,70h
	int 10h
	ret
	
leftborder:
	mov ah, 07h
	xor al,al
	mov ch, 0
	mov cl, 0
	mov dh, 24
	mov dl, 2
	mov bh ,70h
	int 10h
	ret

	

start:
	call clearscreen
	call topborder
	call leftborder
	mov ax, 0x4c00
	int 21h
		

