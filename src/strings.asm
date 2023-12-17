
print:
    push bp ; Save BP
    mov bp, sp ; Set up stack frame
    mov si, [bp + 4] ; Get address of string from stack 
    mov bl, [bp+6] ; Get color from stack
    .next_char:
        lodsb ; Load next character into AL and increment SI
        test al, al ; Test if AL is zero (end of string)
        jz .done ; If it is, jump to end
        mov ah, 0x0E ; Function 0x0E: teletype output
        int 0x10 ; BIOS interrupt
        jmp .next_char ; Repeat for next character

    .done:
    leave
    ret ; Return from function