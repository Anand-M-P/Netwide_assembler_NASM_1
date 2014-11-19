section .data
	string1: db "Enter n", 0Ah
	length1: equ $-string1

section .bss
	n: resb 1
	temp: resb 1

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
	mov ecx, n
	mov edx, 2
	int 80h
	mov byte[temp],48
	

print:
	cmp byte[n], 48
	je exit
	mov eax, 4
	mov ebx, 1
	mov ecx, temp
	mov edx, 1
	int 80h
	inc byte[temp]
	mov al,byte[n]
	cmp byte[temp],al
	je exit
	jmp print
		
	
exit:
	mov eax, 4
	mov ebx, 1
	mov ecx, temp
	mov edx, 1
	int 80h

	mov eax, 1
	mov ebx, 0
	int 80h
