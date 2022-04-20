.data
	v: .space 408
	poz: .space 500
	k: .space 128
	n: .long 0
	m: .long 0
	p: .long 0
	i: .long 0
	j: .long 0
	x: .long 0
	y: .long 0
	z: .long 0
	nn: .long 0
	gump: .long 0
	citire: .asciz "%d"
	afis_nr: .asciz "%d "
	afis_enter: .asciz "\n"
.text

bk:
	movl p, %eax
	movl (%edi,%eax,4),%ecx
	cmp $0, %ecx	
	jne sari
	
	movl $0, i
	
	jmp pune
	
	ret

verif:
	movl $0, %ebx
	
	movl i, %eax
	movl $k, %edi
	movl (%edi,%eax,4), %ecx
	movl %ecx, x
	movl $v, %edi
	
	cmp $3, %ecx
	je return
	
	movl $0, j
	
	jmp vezi 

vezi:
	movl j, %eax
	cmp x, %eax
	je e_ok
	
	movl i, %eax
	movl $3, %ecx
	mull %ecx
	addl j, %eax
	movl (%esi,%eax,4), %ecx
	movl %ecx, y
	
	cmp p, %ecx
	jl caz1
	
	jmp caz2
	
caz1:
	movl y, %ecx
	addl m, %ecx
	
	cmp %ecx, p
	jle return
	
	addl $1, j
	
	jmp vezi
	
caz2:
	movl y, %ecx
	subl m, %ecx
	
	cmp p, %ecx
	jle return
	
	addl $1, j
	
	jmp vezi
	
e_ok:
	movl $1, %ebx
	ret

pune:
	movl i, %eax
	cmp n, %eax
	je return
	
	addl $1, i
	
	call verif
	
	cmp $1, %ebx
	jne pune 
	
	movl i, %eax
	movl p, %ecx
	movl %eax,(%edi,%ecx,4)
	
	cmp nn, %ecx
	je solutie
	
	movl $k, %edi
	movl i, %eax
	movl (%edi,%eax,4), %ecx
	movl %ecx, x
	movl $3, %ecx
	mull %ecx
	addl x, %eax
	movl p, %ecx
	movl %ecx, (%esi,%eax,4)
	
	movl i, %eax
	addl $1,(%edi,%eax,4)
	
	addl $1, p
	
	movl $v, %edi
	
	pushl i
	call bk
	popl i
	
	movl $k, %edi
	movl i, %eax
	subl $1,(%edi,%eax,4)
	
	subl $1, p
	 
	movl $v, %edi
	movl p, %eax
	movl $0,(%edi,%eax,4)
	
	jmp pune

sari:
	movl p, %eax
	cmp %eax, nn
	je solutie
	
	addl $1, p
	pushl i
	call bk
	popl i
	subl $1, p
	
	ret

solutie:
	movl $0, j
	jmp afis

afis:
	movl j, %eax
	cmp nn, %eax
	je exit
	
	addl $1, j
	
	movl j, %eax
	movl (%edi,%eax,4),%ecx
	
	pushl %ecx
	pushl $afis_nr
	call printf
	popl gump
	popl gump

	jmp afis

return:
	ret


.global main

main:
	pushl $n
	pushl $citire
	call scanf
	popl gump
	popl gump
	
	pushl $m
	pushl $citire
	call scanf
	popl gump
	popl gump
	
	movl $v, %edi
	
	xorl %eax,%eax
	movl n, %eax
	movl $3, %ecx
	mull %ecx
	movl %eax, nn
	
	movl $0, i
	
citeste_v:
	movl i, %eax
	cmp nn, %eax
	je init
	
	addl $1, i
	
	pushl $x
	pushl $citire
	call scanf
	popl gump
	popl gump
	
	movl i, %eax
	movl x, %ecx
	movl %ecx, (%edi,%eax,4)
	
	jmp citeste_v

init:
	movl $poz, %esi
	movl $0, i
	movl $0, j
	jmp init_poz
	
init_poz:
	movl i, %eax
	cmp n, %eax
	je fa_rez
	
	addl $1, i
	
	movl i, %eax
	movl $3, %ecx
	mull %ecx
	
	movl $1000, (%esi,%eax,4)
	addl $1, %eax
	movl $1000, (%esi,%eax,4)
	addl $1, %eax
	movl $1000, (%esi,%eax,4)
	
	movl i, %eax
	movl $k, %edi
	movl $0, (%edi,%eax,4)
	movl $v, %edi
	
	jmp init_poz
	
fa_rez:
	movl $0, i
	jmp rez

rez:
	movl i, %eax
	cmp nn, %eax
	je solve
	
	addl $1, i
	
	movl i, %eax
	movl (%edi,%eax,4), %ecx
	cmp $0, %ecx
	jne calc
	
	jmp rez

calc:
	movl i, %eax
	movl (%edi,%eax,4), %ecx
	movl %ecx, x
	
	movl $k, %edi
	movl x, %eax
	movl (%edi,%eax,4), %ecx
	movl %ecx, y
	movl $v, %edi
	
	movl x, %eax
	movl $3, %ecx
	mull %ecx
	addl y, %eax
	movl i ,%ecx
	movl %ecx, (%esi,%eax,4)
	
	movl $k, %edi
	movl x, %eax
	movl (%edi,%eax,4), %ecx
	addl $1, %ecx
	movl %ecx, (%edi,%eax,4)
	movl $v, %edi
	
	jmp rez

solve:
	movl $1, p
	call bk
	
	pushl $-1
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	jmp exit

exit:
	pushl $afis_enter
	call printf
	popl gump
	movl $1, %eax
	xorl %ebx,%ebx
	int $0x80
