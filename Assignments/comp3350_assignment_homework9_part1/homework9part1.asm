TITLE Addressing Modes		(part1.asm)

include irvine32.inc

.stack 4096

.data
	ProjectTitle BYTE "Matthew's Extended Addition Calculator", 0
	ProjectSubtitle BYTE "Homework 8 Question 5", 0
	CherryAddition BYTE "Cherry = (Apple + Berry)", 0
	CherryDisplay BYTE "Cherry = ", 0
	Apple QWORD 1111222233334444h
	Berry QWORD 13572468ABCD0000h
	Cherry QWORD ?

.code
main proc
	call Intro
	call Input
	call Calculation
	invoke ExitProcess, 0
main endp

Intro PROC
	mov edx, offset ProjectTitle
	call writestring
	call crlf
	mov edx, offset ProjectSubtitle
	call writestring
	call crlf
	call crlf
Intro endp

Input PROC
	mov edx, offset CherryAddition
	call writestring
	call crlf
	mov edx, offset CherryDisplay
	call writestring
Input endp

Calculation PROC
	mov eax, 0
	mov ebx, 0
	mov edx, 0

	mov ax, 1111h
	add ax, 1357h
	mov dx, ax

	mov ax, 2222h
	add ax, 2468h
	shl edx, 16
	mov dx, ax

	mov ax, 3333h
	add ax, 0ABCDh
	mov bx, ax

	mov ax, 4444h
	add ax, 0000h
	shl ebx, 16
	mov bx, ax

	mov eax, edx
	call writehex

	mov eax, ebx
	call writehex
Calculation endp

end main