[org 0x0100]

jmp start
message: db 'Welcome to FAST'
length: dw 15

clrscn:
	push es
	push ax
	push di
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	
	nextloc:
		mov word [es:di], 0x0720
		add di, 2
		cmp di, 4000
		jne nextloc
		
	pop di
	pop ax
	pop es
	ret
	
printscn:
	push bp
	mov bp, sp
	push es
	push ax
	push cx
	push si
	push di
	
	mov ax, 0xB800
	mov es, ax
	mov di, 0
	
	mov si, [bp +6]
	mov cx, [bp + 4]
	mov ah, 0x07
	
	nextchar:
		mov al,[si]
		mov [es:di],ax
		add di,2
		add si,1
		
		loop nextchar
	
	pop di
	pop si
	pop cx
	pop ax
	pop es
	pop bp
	ret 4
	

start:
	
	call clrscn
	mov ax, message
	push ax
	push word [length]
	call printscn
	
	mov ah, 0x1
	int 0x21
	
mov ax, 0x4c00
int 0x21
	
