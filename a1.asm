
section .data
	string1: db "Enter a character",0Ah
	length1: equ $-string1
	string2: db "Caps Lock is on",0Ah
	length2: equ $-string2
	string3: db "Caps Lock is not on",0Ah
	length3: equ $-string3

section .bss
	char: resb 1

section .text
	global _start:
	_start:
	
	mov eax, 4
	mov ebx, 1
	mov ecx, string1
	mov edx, length1
	int 80h
	

	mov eax, 3
	mov ebx, 0
	mov ecx, char
	mov edx, 2
	int 80h
	
	movzx ax, byte[char]
	cmp byte[char], 41h
	jnb l1
	jmp l3
		
	l1:
		cmp byte[char], 5Ah
		jna l2
		jmp l3
	l2:
		mov eax, 4
		mov ebx, 1
		mov ecx, string2
		mov edx, length2
		int 80h
		jmp exit

	l3:
		mov eax, 4
		mov ebx, 1
		mov ecx, string3
		mov edx, length3
		int 80h
		jmp exit

exit:
	mov eax, 1
	mov ebx, 0
	int 80h
