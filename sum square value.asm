
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
ar db 1,1,2
sum db ?

.code
main proc
    mov ax,@data
    mov ds,ax
    
    mov cx,3
    mov si,offset ar
    
    l:
    mov al,[si]               ; putting multiplicand to al register  / here [si] value is the multiplicand
    mul [si]                  ; multiplication done by multiplier [si]   
    add sum,al                ; then adding multiplication value with sum variable and store 
    
    mov dl,al
    add dl,48                 ; convert ascii value to number by adding 48
    mov ah,2                  ; printing multiplication result
    int 21h                   
     
    inc si                    ; incrementing memory address value 
    
    loop l                    ; calling loop 
    
    mov dl,sum
    add dl,48                 ; converting ascii value to natural number
    mov ah,2                  ; finally printing total sum value
    int 21h
    
    
    
    exit:
    mov ah,4ch                ; exit the programme
    int 21h
    
    main endp
end main
    

ret




