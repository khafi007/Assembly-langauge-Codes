[org 0x0100]
jmp start
data: db'Assembly Language - Course, FAST'
msg1end
data1: db 'FASTTT'
msg2end


clearscreen:
	mov ah, 07h			;scroll down func
	xor al , al			;number of lines to scroll
	xor cx , cx			;upper left corner CH = row, CL = column
	mov dx , 174Fh		;lower right corner DH = row, DL = column
	mov bh, 00h			;Black on Black
	int 10h
	ret
	
printstrr:
	mov cx, msg1end - data 
	mov al , 1
	mov bh, 0
	mov bl , 07
	mov dh , 5
	mov dl , 13
	push cs
	pop es
	mov bp ,data
	mov ah , 13h
	int 10h
	ret
	

start:
	call clearscreen
	call printstrr
	mov ax, 0x4c00
	int 21h
		

