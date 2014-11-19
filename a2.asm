section .data
	string1: db "Enter a digit between 0 and 9",0Ah
	length1: equ $-string1		
	string2: db "Divisible by two",0Ah
	length2: equ $-string2	
	string3: db "Not divisible by two",0Ah
	length3: equ $-string3

section .bss
	digit: resb 1

section .text
	global _start:
	_start:
	
	mov eax,4
	mov ebx,1
	mov ecx,string1
	mov edx,length1
	int 80h
	
	mov eax, 3
	mov ebx, 0
	mov ecx, digit
	mov edx, 2
	int 80h
	
	sub byte[digit], 30h
	movzx ax, byte[digit]
	mov bl,2
	div bl

	cmp ah, 0
	je l1
	jmp x

x:
		mov eax, 4
		mov ebx, 1
		mov ecx, string3
		mov edx, length3
		int 80h
		jmp exit
		
	l1:
		mov eax, 4
		mov ebx, 1
		mov ecx, string2
		mov edx, length2
		int 80h
		jmp exit
exit:
	mov eax, 1
	mov ebx, 0
	int 80h
