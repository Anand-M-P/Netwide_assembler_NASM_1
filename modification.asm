section .data
	string1: db "enter number 1 : ",0Ah
	length1: equ $-string1
	string2: db "enter number 2 : ",0Ah
	length2: equ $-string2
	string3: db "enter number 3 : ",0Ah
	length3: equ $-string3
	string4: db "Middle value : ",0Ah
	length4: equ $-string4

section .bss
	digit1: resb 1
	digit2: resb 1
	digit3: resb 1
	digit4: resb 1
	digit5: resb 1
	digit6: resb 1
	num1: resb 1
	num2: resb 1
	num3: resb 1

section .text
global _start:
_start:

;reading first number
	 mov eax, 4
	 mov ebx, 1
	 mov ecx, string1
	 mov edx, length1
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit1
	 mov edx, 1
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit2
	 mov edx, 2
	 int 80h
	 
	 sub byte[digit1],30h
	 sub byte[digit2],30h
	 mov al,byte[digit1]
	 mov bl, 10
	 mul bl
	 movzx bx,byte[digit2]
	 add ax, bx
	 mov byte[num1], al
	
	
;reading second number
	 mov eax, 4
	 mov ebx, 1
	 mov ecx, string2
	 mov edx, length2
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit3
	 mov edx, 1
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit4
	 mov edx, 2
	 int 80h
	 
	 sub byte[digit3],30h
	 sub byte[digit4],30h
	 mov al,byte[digit3]
	 mov bl, 10
	 mul bl
	 movzx bx,byte[digit4]
	 add ax, bx
	 mov byte[num2], al
	 
;reading third number
	 mov eax, 4
	 mov ebx, 1
	 mov ecx, string3
	 mov edx, length3
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit5
	 mov edx, 1
	 int 80h
	 
	 mov eax, 3
	 mov ebx, 0
	 mov ecx, digit6
	 mov edx, 2
	 int 80h
	 
	 sub byte[digit5],30h
	 sub byte[digit6],30h
	 mov al,byte[digit5]
	 mov bl, 10
	 mul bl
	 movzx bx,byte[digit6]
	 add ax, bx
	 mov byte[num3], al

;starting comparison

	mov eax, 4
	mov ebx, 1
	mov ecx, string4
	mov edx, length4
	int 80h
	
	
	mov al, byte[num2]
	cmp byte[num1],al
	ja l1
	jmp l2
l1:
	mov al,byte[num3]
	cmp byte[num1],al
	jb print1
	cmp byte[num2],al
	jna print2
	jmp print3
	
l2:
	mov al,byte[num3]
	cmp byte[num2],al
	jna print2
	cmp byte[num1],al
	ja print1
	jmp print3


print1: 
	movzx ax,byte[num1]
	mov bl,10
	div bl
	mov byte[digit1],al
	mov byte[digit2],ah

	add byte[digit1],48
	add byte[digit2],48
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit1
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit2
	mov edx, 1
	int 80h
	jmp exit

print2:
	movzx ax,byte[num2]
	mov bl,10
	div bl
	mov byte[digit1],al
	mov byte[digit2],ah

	add byte[digit1],48
	add byte[digit2],48
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit1
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit2
	mov edx, 1
	int 80h
	jmp exit

print3:
	movzx ax,byte[num3]
	mov bl,10
	div bl
	mov byte[digit1],al
	mov byte[digit2],ah

	add byte[digit1],48
	add byte[digit2],48
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit1
	mov edx, 1
	int 80h
	
	mov eax, 4
	mov ebx, 1
	mov ecx, digit2
	mov edx, 1
	int 80h
	jmp exit
	
exit:
	mov eax, 1
	mov ebx, 0
	int 80h	 
	 
	 
	 
	 
	 
	 
	 
	 
