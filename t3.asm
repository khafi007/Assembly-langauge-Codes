[org 0x0100]

jmp start 

data:   dw  2, 2, 1, 2 ,4 ,3, 1,3,3,4
swap:   db  0 
moderes: dw 0


bubblesort: 
    dec  cx
    shl  cx, 1                   

    mainloop:  
        mov  si, 0             
        mov  byte[swap], 0       

        innerloop: 
            mov  ax, [bx + si]
            cmp  ax, [bx + si + 2]
            jbe  noswap 

                mov  dx, [bx + si + 2]
                mov  [bx + si], dx 
                mov  [bx + si + 2], ax 
                mov  byte[swap], 1 

            noswap: 
            add  si, 2 
            cmp  si, cx
            jne  innerloop

        cmp  byte[swap], 1 
        je   mainloop 

    ret   

mode: 


	mov bx , 0
	mov cx ,10
	l11:
			mov ax , [data + bx]
			cmp ax,[data +bx +2]
			je addop
			
				add bx, 2
				sub cx ,1
				jnz mode
				ret
			
			
	addop:
	add ax ,[data +bx + 2]
	mov [moderes] , ax
	l1
	


start: 
    mov  bx, data 
    mov  cx, 10

    call bubblesort 
    
    call mode


    mov ax, 0x4c00 
    int 0x21 
