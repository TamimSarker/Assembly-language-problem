
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

.data
array db 0,1,2,3,4,5,6,7,8,9    ; Initializing an aray with values.

.code 
main proc
    mov ax,@data                ; Asign data segments vairable 
    mov ds,ax                   ; Putting ax registers value to ds register
    
    mov cx,10                   ; Initializing how many times loop will run.
    mov si,offset array         ; Put the first elements address of an array in SI register using offset commend.
                                 
                                 
    l:                          ; Creating lebel for loop
    mov dl,[si]                 ; Putting SI registers value to dl register
    add dl,48                   ; Adding 48 to dl register for converting ascii value to number
    mov ah,2                    ; mov ah,2 command for print single key charecter
    int 21h                     ; Execution previus print command line 
    inc si                      ; Incrementing arrays address that was hold by SI register.
   
    
    mov ah,2                    ;This 
    mov dl,10                   ;   segment
    int 21h                     ;      for
    mov dl,13                   ;         printing
    int 21h                     ;            new line
               
               
    loop l                      ; Calling loop l
    
    exit:
    mov ah,4ch
    int 21h
    
    main endp
end main
ret




