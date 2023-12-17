%include "colors.inc"
%include "strings.asm"
%include "video.asm"
org 0x7C00                      ; BIOS loads our programm at this address
bits 16                         ; We're working at 16-bit mode here



message db "Hello Man", 0
section .text



end:
    int 0x20

start:
	xor     ax, ax
	mov     ds, ax
	mov     es, ax

	push 0x13
	call set_video_mode
	push message
	push COLOR(RED, WHITE)
	call print
	jmp end
times 510-($-$$) db 0 
dw 0xAA55
