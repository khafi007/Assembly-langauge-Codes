[org 0x0100]
jmp start

data: db 'Assembly Language - Course, FAST University Peshawar Campus'
msg1end:
data1:db 'I Love Pakistan'
msg2end:

;clearscreen
clearscreen: 
    MOV AH,06h  ;scroll up function
    XOR AL,AL   ;number of lines by which to scroll up
    XOR CX,CX   ;Upper left corner CH=row, CL=column
    MOV DX,184FH    ;Lower right corner Di=row, DL=column 
    MOV BH,07h  ;WhiteOnBlack
    INT 10H 
ret 

;Set mode
setmode:
	;mov ax, 0003h ; BIOS.setvideomode 20x25 16-color
	mov al, 03h		;
	mov ah, 00h		;set mode
	int 10h

ret 

;Set Cursor Mode
setcursor:
	;;mov dx,0C23h	;DH is row(13), D	L is Column (35)
	mov dh, 13		
	mov dl, 35
	mov bh, 0		;display page
	mov ah, 02h		;BIOS.setcursorposition
	int 10h			; interrupt to BIOS display memory service
ret 

;Print Character
printchr:
    mov cx,5    ;ReplicationCount
    mov bx,0007h ;BH is DisplayPage(0)
    ;BL is Attribute (BrightWhiteOnGreen)
    mov ah,09h ;BIOS.WriteCharacterAttribute
    mov al,2ah; 2a==*, character to be display
    int 10h 
ret 

;Print 
printstr:
    mov cx,msg1end-data ;calculate message size 
    ;mov bx,0001h   ;BH is DisplayPage(0),BL is At 
    mov al,1 
    mov bh,0  
    mov bl,07   ;Color the text and background
    mov dh,5    ;Row No 5
    mov dl,13   ;Column No 13
    push cs 
    pop es 
    mov bp,data 
    mov ah,13h  ;To print string on screen we use  
    int 10h 

    ;mov ah,00h ;BIOS.WaitKeyboardKey
    ;int 16h    ;->AX

setbordercolor1:
	;LEFTCORNER
	mov ah, 06h	;Scroll up func
	mov al, al	;
	xor cx, cx
	;mov dx, 3501h	
	mov dh, 24
	mov dl, 01
	mov bh, 05fh
	int 10h
	;;RIGHT CORNER
	mov ch, 0
	mov cl, 78
	mov dh, 24
	mov dl, 79
	mov bh, 05fh
	int 10h

ret

setbordercolor2:
	;;BOTTOM CORNER
	mov ah, 06h	;Scroll up func
	mov al, al	
	xor cx, cx
	mov ch, 24
	mov cl ,0
	mov dh, 25
	mov dl, 80
	mov bh, 05fh
	int 10h
	;;TOP CORNER
	mov ah, 06h
	xor al, al
	xor cx, cx
	mov dh, 01
	mov dl,79
	mov bh, 05fh
	int 10h
	
ret
    
drawRectang:
    MOV AH,06h  ;Scroll down function 
    XOR AL,AL   ;number of lines by which to scroll up
    mov ch,7    ;upper left corner CH=row
    mov cl,20   ;upper left corner CL=column 
    mov dh,15   ;lower right corner DH=row
    mov dl,60   ;lower left corner DL=column
    mov bh, 0Afh ;text color white, background magneta
    int 10H  

ret

drawRectang2:
    MOV AH,06h  ;Scroll down function 
    XOR AL,AL   ;number of lines by which to scroll up
    mov ch,7    ;upper left corner CH=row
    mov cl,20   ;upper left corner CL=column 
    mov dh,15   ;lower right corner DH=row
    mov dl,30   ;lower left corner DL=column
    mov bh, 07fh ;text color white, background magneta
    int 10H  

ret
writer:
    ;//print msg in rectangle.
    mov cx,msg2end-data1 ;calculate message size 
    ;mov bx,0001h   ;BH is DisplayPage(0),BL is At 
    mov al,1 
    mov bh,0  
    mov bl,07   ;Color the text and background
    mov dh,11    ;Row No 5
    mov dl,31   ;Column No 13
    push cs 
    pop es 
    mov bp,data1 
    mov ah,13h  ;To print string on screen we use  
    int 10h 

    ;mov ah,00h ;BIOS.WaitKeyboardKey
    ;int 16h    ;->AX

ret

start:
call clearscreen 
;call SetCursorPosition
; call printchr
;call printstr
call setbordercolor1
call setbordercolor2
call drawRectang
call drawRectang2
call writer
call printstr
call setcursor
mov ax,0x4c00   ;termninate program 
int 0x21

