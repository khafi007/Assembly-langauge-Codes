org 100h

jmp start

data : db 'I love Pakistan '
msg1end:

clr:

mov ah ,06h
xor al,al
xor cx,cx
;mov dx ,192Ah  ;dh = row , dl = col
mov dh , 25
mov dl , 40
mov bh ,07h
int 10h

ret

leftborder:
mov ah ,06h
xor al, al
xor cx,cx
mov dh ,25
mov dl ,01
mov bh,05fh
int 10h

ret


rightborder2:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,0
 mov cl ,78
mov dh ,24
mov dl ,79
mov bh,05fh
int 10h

ret


topborder3:
mov ah ,06h
xor al, al
xor cx,cx

mov dh ,0
mov dl ,80
mov bh,05fh
int 10h

ret



bottomborder:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,24
mov cl ,0
mov dh ,25
mov dl ,80
mov bh,05fh
int 10h

ret


rectangle:
mov ah ,06h
xor al, al
xor cx,cx
mov ch ,9
mov cl ,25
mov dh ,13
mov dl ,57
mov bh,02fh
int 10h

ret



set:
mov al ,03h
mov ah, 00h
int 10h

ret

setcursor:

mov dh ,13
mov dl ,35
mov bh, 0
mov ah ,02h
int 10h

ret




printstr:
mov cx, msg1end - data
mov al ,1
mov bh , 0
 mov bl,07
mov dh,11
mov dl,32
push cs
pop es
mov bp ,data
mov ah ,13h
int 10h

ret



start:
call clr
call leftborder
call rightborder
call topborder
call bottomborder
call rectangle
call printstr

mov ah ,0x1
int 21h

mov ax ,0x4c00
int 21h