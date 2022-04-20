.data
	a: .space 2000
	n: .long 0
	m: .long 0
	nr: .long 0
	x: .long 0
	y: .long 0
	z: .long 0
	i: .long 0
	j: .long 0
	gump: .long 0                # forrest gump
	s: .space 100
	citire_nr: .asciz "%d"
	citire_sir: .asciz "%s"
	afis_nr: .asciz "%d "
	afis_enter: .asciz "\n"
.text

.global main

main:
	pushl $s
	pushl $citire_sir
	call scanf
	popl gump
	popl gump
	
	pushl $n
	pushl $citire_nr
	call scanf
	popl gump
	popl gump
	
	pushl $m
	pushl $citire_nr
	call scanf
	popl gump
	popl gump
	
	movl $0, i
	movl $0, j
	
	xorl %eax,%eax
	xorl %edx,%edx
	
	movl n, %eax
	mull m
	movl %eax, nr
	
	movl $a, %edi
	
along:
	movl i, %eax
	cmp nr, %eax
	je alalong
	
	pushl $x
	pushl $citire_nr
	call scanf
	popl gump
	popl gump
	
	xorl %edx, %edx
	movl i, %eax
	
	movl x, %ecx
	movl %ecx, (%edi,%eax,4)
	
	addl $1, i
	
	jmp along
	
alalong:
	pushl $s
	pushl $citire_sir
	call scanf
	popl gump
	popl gump
	
	pushl $s
	pushl $citire_sir
	call scanf
	popl gump
	popl gump
	
	movl $s, %esi
	xorl %ecx,%ecx
	xorl %eax,%eax
	movb (%esi,%ecx,1),%al
	
	movl $0, i
	movl $a, %edi
	
	cmp $114, %eax
	je alalalalalalalalong
	
	xorl %eax,%eax
	pushl $s
	call atoi
	popl gump
	
	movl %eax,x
	
	pushl $s
	pushl $citire_sir
	call scanf
	popl gump
	popl gump
	
	movl $s, %esi
	xorl %ecx,%ecx
	xorl %eax,%eax
	movb (%esi,%ecx,1),%al
	
	pushl %eax
	pushl n
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	popl %eax
	
	pushl %eax
	pushl m
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	popl %eax
	
	cmp $97, %eax
	je alalalalong
	
	cmp $115, %eax
	je alalalalalong
	
	cmp $109, %eax
	je alalalalalalong
	
	cmp $100, %eax
	je alalalalalalalong

alalalalalalalalong:
	movl n, %eax
	subl $1, %eax
	movl %eax, z
	movl %eax, i
	movl $0, j
	movl $a, %edi
	
	pushl m
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	pushl n
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	xorl %eax, %eax
	xorl %edx, %edx
	
	jmp alalalong

alalalong:
	movl j, %eax
	cmp m, %eax
	je alalalalalalalalalalong
	
	xorl %edx, %edx
	movl i, %eax
	mull m
	addl j, %eax
	
	movl (%edi,%eax,4), %ecx
	movl %ecx, x
	
	pushl x
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	subl $1, i
	movl i, %eax
	cmp $-1, %eax
	je alalalalalalalalalong
	
	jmp alalalong
	
alalalalalalalalalong:
	movl z, %eax
	movl %eax, i
	addl $1, j
	jmp alalalong

alalalalong:
	movl i, %eax
	cmp nr, %eax
	je alalalalalalalalalalong
	
	xorl %edx, %edx
	movl i, %eax
	
	movl (%edi,%eax,4), %ecx
	movl %ecx, y
	
	movl y, %eax
	xorl %edx,%edx
	
	addl x, %eax
	
	movl %eax, y
	
	pushl y
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	addl $1, i
	
	jmp alalalalong
	
alalalalalong:
	movl i, %eax
	cmp nr, %eax
	je alalalalalalalalalalong
	
	xorl %edx, %edx
	movl i, %eax
	
	movl (%edi,%eax,4), %ecx
	movl %ecx, y
	
	movl y, %eax
	xorl %edx,%edx
	
	subl x, %eax
	
	movl %eax, y
	
	pushl y
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	addl $1, i
	
	jmp alalalalalong
	
alalalalalalong:
	movl i, %eax
	cmp nr, %eax
	je alalalalalalalalalalong
	
	xorl %edx, %edx
	movl i, %eax
	
	movl (%edi,%eax,4), %ecx
	movl %ecx, y
	
	movl y, %eax
	xorl %edx,%edx
	
	imull x
	
	movl %eax, y
	
	pushl y
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	addl $1, i
	
	jmp alalalalalalong
	
alalalalalalalong:
	movl i, %eax
	cmp nr, %eax
	je alalalalalalalalalalong
	
	xorl %edx, %edx
	movl i, %eax
	
	movl (%edi,%eax,4), %ecx
	movl %ecx, y
	
	movl y, %eax
	xorl %edx,%edx
	
	cdq
	idivl x
	
	movl %eax, y
	
	pushl y
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	addl $1, i
	
	jmp alalalalalalalong

alalalalalalalalalalong:
	pushl $afis_enter
	call printf
	popl gump
	movl $1, %eax
	xorl %ebx,%ebx
	int $0x80

