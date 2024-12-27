section .data
    msg db "Hello world", 0xA ; Hello world followed by /n
    msglength equ $ - msg ; Store message length

section .bss
    console_handle resd 1 ; reserve 1 Double worth of memory

section .text
    global_start ; defined start i think idrk
    extern GetStdHandle ;     **imports**
    extern WriteConsoleA ;
    extern ExitProcess ; 

_start:
    mov rcx, -11 ; Load -11 into rax (-11 is STD_OUTPUT_HANDLE)
    call GetStdHandle ; Call function that loads console handle into eax

    mov rcx, rax ; Move into rbx value of our msg (hello world)
    mov rdx, msg ; move message length into rcx
    mov r8, msglength ; move null into edx (calling convention)
    mov r9, 0;

    call WriteConsoleA ; print out contents of ebx

    mov rcx, 0 ; exit with code 0 
    call ExitProcess
    

    