 
; The location of this template is c:\emu8086\inc\0_com_template.txt
print macro p
     mov ah,9                        ; macro section  / macro is like a funtion in another language 
     lea dx,p                        ; to print any strint by calling macro 
     int 21h
  endm
org 100h 

.data
a db 10,13,'the biggest value is $'          ;data segnment 
f db 'Enter first value $'
s db 10,13,'Enter second value $'            ; here all variable are diclared 
t db 10,13,'Enter third value  $' 

.code 
main proc
    mov ax,@data
    mov ds,ax
    
    print f                               ;printint variable f using print macro
    mov ah,1
    int 21h                               ; taking first input
    mov bl,al                             ;moving al register input value to bl register
   
    
    print s                               ;printint variable f using print macro
    mov ah,1                              
    int 21h                               ; taking second  input
    mov bh,al                             ;moving al register input value to bh register
    
    
    print t                               ;printint variable f using print macro
    mov ah,1
    int 21h                               ; taking third input
    mov cl,al                             ;moving al register input value to cl register
    
    
    cmp bl,bh
    jg l 
    
    cmp bh,cl
    jg l2
     
    mov ah,9
    lea dx,a
    int 21h
    
    mov dl,cl
    mov ah,2
    int 21h
    
    jmp exit    
    
    
    l:
    mov ah,9
    lea dx,a
    int 21h
    
    mov ah,2
    mov dl,bl
    int 21h 
    
    jmp exit
    
    l2:
    mov ah,9
    lea dx,a
    int 21h
    
    mov dl,bh
    mov ah,2
    int 21h
    
    jmp exit
    
    
    
    
    
    
    
    
    exit:
    mov ah,4ch
    int 21h
    main endp
end main

ret




