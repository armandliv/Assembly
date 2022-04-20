.data
	s: .space 1000
	FormatScanf: .asciz "%[^\n]"
	sep: .asciz " "
	afis_sir: .asciz "%s "
	afis_sol: .asciz "%d\n"
	x: .long 0
	dump: .long 0
	fv: .space 240
	p: .space 4
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
	xorl %ecx,%ecx
	movl $fv, %edi
	
Dynamic_programming_optimizations:
	cmp $26, %ecx
	je Flux_maxim_de_cost_minim
	movl $-1, (%edi,%ecx,4)
	addl $1,%ecx
	jmp Dynamic_programming_optimizations
	
Flux_maxim_de_cost_minim:
	pushl %ecx
	pushl p
	call atoi
	popl dump
	popl %ecx
	
	movl %eax, x
	
	cmp $0, x
	je Aho_Corasick
	
	pushl x
	
	jmp Mo_with_updates
	
	
Mo_with_updates:
	pushl %ecx
	pushl $sep
	pushl $0
	call strtok
	popl dump
	popl dump
	popl %ecx
	
	cmp $0, %eax
	je RMQ_in_linear_time_complexity_and_linear_memory      # leave with style
	
	movl %eax, p
	
	pushl p
	call atoi
	popl dump
	
	movl %eax, x
	
	cmp $0, x
	je Treapunealta_secreta
	
	jmp Minimum_vertex_cover
	

Treapunealta_secreta:
	pushl %ecx
	pushl p
	call strlen
	popl dump
	popl %ecx
	
	movl %eax, x
	
	cmp $1, x
	je Aho_Corasick
	
	jmp Dynamic_connectivity

Aho_Corasick:
	xorl %ecx,%ecx
	xorl %eax,%eax
	movl p, %esi
	movb (%esi,%ecx,1), %al
	sub $97, %eax
	movl %eax, %ecx
	movl (%edi,%ecx,4), %eax
	movl %eax,x
	cmp $-1, x
	je heavy_path_decomposition
	
	jmp centroid_decomposition

heavy_path_decomposition:
	pushl %ecx
	jmp Mo_with_updates

centroid_decomposition:
	pushl x
	jmp Mo_with_updates

Dynamic_connectivity:
	movl p, %esi
	xorl %eax, %eax
	xorl %ebx, %ebx
	xorl %edx, %edx
	movb (%esi,%ebx,1), %al
	
	cmp $97, %al
	je Li_chao
	
	cmp $109, %al
	je Kasai
	
	cmp $115, %al
	je Kosaraju
	
	cmp $100, %al
	je Karatsuba
	
	cmp $108, %al
	je Manacher
	
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

Manacher:
	popl x
	popl %ecx
	movl x, %eax
	movl %eax, (%edi,%ecx,4)
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
# x 1 let 2 x add y 3 let x y add mul
