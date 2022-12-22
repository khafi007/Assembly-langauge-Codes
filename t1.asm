[org 0x0100]

jmp start

add2:
	add dx ,[bp +4]
	add dx , [bp +6]
	pop dx
	pop bx
	pop ax
	ret
add1:
	mov bp, sp
	mov ax , [bp +2]
	add ax , [bp +4]
	mov dx, ax
	push dx
	
	call add2
	ret

start:
	mov ax, 2
	mov bx, 2
	push ax
	push bx
	call add1
	
mov ax, 0x4c00
int 0x21

