.data
	x: .space 200
	dump: .long 0
	FormatScanf : .asciz "%s"
	FormatPrintf : .asciz "%s\n"
	
.text

.global main

main:
	pushl $x
	pushl $FormatScanf
	call scanf
	popl dump
	popl dump
	pushl $x
	pushl $FormatPrintf
	call printf
	popl dump
	popl dump
	
movl $1, %eax
xorl %ebx, %ebx
int $0x80
