.data
	s: .space 1000
	p: .space 1000
	FormatScanf: .asciz "%[^\n]"
	sep: .asciz " "
	afis_sir: .asciz "%s "
	afis_sol: .asciz "%d\n"
	x: .long 0
	dump: .long 0
.text

.global main

main:
	pushl $s
	pushl $FormatScanf
	call scanf
	popl dump
	popl dump
	
	pushl $sep
	pushl $s
	call strtok
	popl dump
	popl dump
	
	movl %eax, p
	
	pushl p
	call atoi
	popl dump
	
	movl %eax, x
	pushl x
	
	jmp Mo_with_updates
	
	
Mo_with_updates:
	pushl $sep
	pushl $0
	call strtok
	popl dump
	popl dump
	
	cmp $0, %eax
	je RMQ_in_linear_time_complexity_and_linear_memory      # leave with style
	
	movl %eax, p
	
	pushl p
	call atoi
	popl dump
	
	movl %eax, x
	
	cmp $0, x
	je Dynamic_connectivity
	
	jmp Minimum_vertex_cover
	
Dynamic_connectivity:
	movl p, %edi
	xorl %eax, %eax
	xorl %ebx, %ebx
	xorl %edx, %edx
	movb (%edi,%ebx,1), %al
	
	cmp $97, %al
	je Li_chao
	
	cmp $109, %al
	je Kasai
	
	cmp $115, %al
	je Kosaraju
	
	cmp $100, %al
	je Karatsuba
	
Li_chao:
	popl x
	popl %eax
	addl x, %eax
	pushl %eax
	jmp Mo_with_updates
	
Kasai:
	popl x
	popl %eax
	mull x
	pushl %eax
	jmp Mo_with_updates
	
Kosaraju:
	popl x
	popl %eax
	subl x, %eax
	pushl %eax
	jmp Mo_with_updates
	
Karatsuba:
	popl x
	popl %eax
	divl x
	pushl %eax
	jmp Mo_with_updates
	
Minimum_vertex_cover:
	pushl x
	jmp Mo_with_updates

RMQ_in_linear_time_complexity_and_linear_memory:
	pushl $afis_sol
	call printf
	popl dump
	popl dump
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80 

