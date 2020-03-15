TITLE Addressing Modes		(main.asm)

include irvine32.inc

.stack 4096

.data
	Prompt BYTE "Please input a value: ", 0
	Spacing BYTE ", ", 0
	String1 BYTE "The target value is: ", 0
	String2 BYTE "and is located at index: ", 0

.code
main proc
	mov eax, 0
	mov ebx, 0
	mov ecx, 0
	mov edx, 0

	mov ecx, 2
	L1:
		mov edx, offset Prompt
		call writestring
		call readint
		push ax
	loop L1

	mov edx, offset String1
	call writestring
	call readint
	pop ax

	call search

	mov edx, offset string2
	call writestring
	call writeint
	
	invoke ExitProcess, 0
main endp

search proc
	mov edx, offset String2
	call writestring

	mov ecx, 2
	L2:
		cmp ax, [ax - 1]
		je L4

	L3:
		inc bx

	L4:
		ret

search endp

end main