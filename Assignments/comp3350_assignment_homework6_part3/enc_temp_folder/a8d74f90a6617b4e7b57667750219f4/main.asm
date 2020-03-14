TITLE Addressing Modes		(main.asm)

include irvine32.inc

.stack 4096

.data
	Prompt BYTE "Please input a value: ", 0
	Spacing BYTE ", ", 0
	String1 BYTE "The target value is: ", 0
	String2 BYTE "and is located at index: ", 0
	String3 BYTE "is not located in the list.", 0
	String4 BYTE "Value: ", 0
	TargetValue BYTE 0, 0

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
	mov TargetValue, al
	pop ax

	mov ecx, 2
	L2:
		mov edx, offset String4
		call writestring
		pop ax
		call writeint
	loop L2
	
	invoke ExitProcess, 0
main endp

search proc
search endp

end main