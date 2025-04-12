;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; CONSTANTS

; syscalls
SYS_EXIT  equ 1
SYS_WRITE equ 4

; file descriptors
STDOUT equ 1

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; SECTIONS

section .data
    msg db "Hello, World!", 0xA ; msg
    len equ $ - msg ; lenght of msg

;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;
; PROGRAM

section .text
    global _start ; must be declared for linker (ld)

_start: ; tells linker (ld) entry point
   ; print message
   mov edx, len ; message lenght
   mov ecx, msg ; message to write
   mov ebx, STDOUT
   mov eax, SYS_WRITE
   int 0x80 ; make syscall

   ; exit program
   mov eax, SYS_EXIT
   xor ebx, ebx ; exit code 0
   int 0x80 ;make syscall
