section .data
	string1: db "Enter n", 0Ah
	length1: equ $-string1

	m2: db 10
	l2: equ $-m2

section .bss
	n: resb 1
	temp: resb 1
	t1: resb 1
	t2: resb 1

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
	mov byte[temp],1
	sub byte[n],48
	

print:
	mov al,byte[n]
	mov bl,byte[temp]
	mul bl
	
	mov bl,10
	div bl
	mov byte[t1],al
	mov byte[t2],ah
	add byte[t1], 48
	add byte[t2], 48
		
	mov eax, 4
	mov ebx, 1
	mov ecx, t1
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, t2
	mov edx, 1
	int 80h

	mov eax, 4
	mov ebx, 1
	mov ecx, m2
	mov edx, l2
	int 80h

	inc byte[temp]
	cmp byte[temp],11
	je exit
	jmp print
		
	
exit:
	
	mov eax, 1
	mov ebx, 0
	int 80h
