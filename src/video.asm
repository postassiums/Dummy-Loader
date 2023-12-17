
set_video_mode:
    push bp
    mov bp,sp
    mov ah,0x00 
    mov al,[bp+4] ; Get the video mode from the stack
    int 0x10
    leave
    ret

