[org 0x0100]

    jmp start

message:     db   'P200563'  
length:      dw   7

setcursor:
   
    mov  dx, 0C23h    
    mov  bh, 0        
    mov  ah, 02h      
    int  10h

            
ret

clrscr:     
    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 0

    black:
        mov  word [es:di], 0x0720
        add  di, 2
        cmp  di, 2000
        jne  black

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 1920

    magneta:
        mov  word [es:di], 0xd720
        add  di, 2
        cmp  di, 4000
        jne  magneta

	

    pop  di 
    pop  ax
    pop  es
    ret

printstr:
    push bp
    mov  bp, sp
    push es
    push ax
    push cx 
    push si 
    push di 

    mov ax, 0xb800 ; video memory base
    mov es, ax 
    mov di, 1990           


    mov si, [bp + 6]
    mov cx, [bp + 4]
    mov ah, 0x07 ;only need to do this once ; for color, 07 is code of  Dark gray

    nextchar: 
        mov al, [si]
        mov [es:di], ax 
        add di, 2 
        add si, 1 
        
        ; dec cx 
        ; jnz nextchar     

        ; alternatively 
        loop nextchar 


    pop di 
    pop si 
    pop cx 
    pop ax 
    pop es 
    pop bp 
    ret 4 
printnum: 
    

    push es
    push ax
    push di

    mov  ax, 0xb800
    mov  es, ax
    mov  di, 320

    next1:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 322
        jne  next1


	  mov  ax, 0xb800
    mov  es, ax
    mov  di, 480

    next2:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 484
        jne  next2


	mov  ax, 0xb800
    mov  es, ax
    mov  di, 640

    nextloc3:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 646
        jne  nextloc3
	
	mov  ax, 0xb800
    mov  es, ax
    mov  di, 800

    nextloc4:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 808
        jne  nextloc4

	mov  ax, 0xb800
    mov  es, ax
    mov  di, 960

    nextloc5:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 970
        jne  nextloc5
	
	
	mov  ax, 0xb800
    mov  es, ax
    mov  di, 1120

    nextloc6:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1128
        jne  nextloc6
	
	mov  ax, 0xb800
    mov  es, ax
    mov  di, 1280

    nextloc7:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1286
        jne  nextloc7

	mov  ax, 0xb800
    mov  es, ax
    mov  di, 1440

    nextloc8:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1444
        jne  nextloc8

	  mov  ax, 0xb800
    mov  es, ax
    mov  di, 1600

    nextloc9:
        mov  word [es:di], 0x072A
        add  di, 2
        cmp  di, 1602
        jne  nextloc9

    pop  di 
    pop  ax
    pop  es
    ret


start: 

 call setcursor
    call clrscr 
	 ;call clrscr2
    mov ax, message 
    push ax 
    push word [length]
    call printstr 	
call printnum
    ; wait for keypress 
    mov ah, 0x1        ; input char is 0x1 in ah 
    int 0x21 

    mov ax, 0x4c00 
    int 0x21 