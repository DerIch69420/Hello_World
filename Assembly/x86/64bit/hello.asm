;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONSTANTS

; syscalls
%define SYS_WRITE 1
%define SYS_EXIT 60

; file descriptors
%define STDOUT 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SECTIONS

section .data
    msg db "Hello, World!", 0xA
    len equ $ - msg

section .text
    global _start ; must be declared for linker (ld)

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAM

_start: ; tells linker (ld) entry point
    ; write(STDOUT, msg, len)
    mov rax, SYS_WRITE
    mov rdi, STDOUT
    mov rsi, msg
    mov rdx, len
    syscall

    ; exit(0)
    mov rax, SYS_EXIT
    xor rdi, rdi
    syscall

