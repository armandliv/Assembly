# testele le-am luat de pe site-ul acesta:    http://lipas.uwasa.fi/~timan/sudoku/
# deci testele ar trebui sa fie sub forma unei matrici cu 9 linii si 9 coloane
# datele de intrare sunt de forma unei matrici de 9x9 ce reprezinta o tabla sudoku 
# incompleta(sau chiar si completa), unde pozitiile ce nu au fost completate sunt marcate cu 0
# datele de iesire sunt sub forma unei matrici de 9x9 ce reprezinta tabla sudoku din input 
# completata corect

.data
	a: .space 800
	fvlinie: .space 800
	fvcol: .space 800
	fvzona: .space 800
	i: .long 0
	j: .long 0
	x: .long 0
	y: .long 0
	z: .long 0
	zz: .long 0
	gump: .long 0
	citire_nr: .asciz "%d"
	afis_nr: .asciz "%d "
	afis_enter: .asciz "\n"
	
.text

zona:
	xorl %edx, %edx
	xorl %eax, %eax
	
	movl 8(%esp), %eax
	subl $1, %eax
	movl $3, z
	divl z
	addl $1, %eax
	
	movl %eax, %ecx
	
	xorl %edx, %edx
	xorl %eax, %eax
	
	movl 4(%esp), %eax
	subl $1, %eax
	movl $3, z
	divl z
	xorl %edx, %edx
	mull z
	
	addl %ecx, %eax
	
	ret


bk:
	movl x, %eax
	movl $9, %ecx
	mull %ecx
	addl y, %eax
	movl (%edi,%eax,4), %ecx
	cmp $0, %ecx
	jne sari
	
	pushl y
	pushl x
	call zona
	popl gump
	popl gump
	
	movl %eax, zz
	movl $1, i
	
	jmp pune

pune:
	movl i, %eax
	cmp $10, %eax
	je return
	
	xorl %ebx, %ebx
	
	movl $fvlinie, %esi
	movl x, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	addl (%esi,%eax,4), %ebx
	
	movl $fvcol, %esi
	movl y, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	addl (%esi,%eax,4), %ebx
	
	movl $fvzona, %esi
	
	movl zz, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	addl (%esi,%eax,4), %ebx
	
	cmp $0, %ebx
	je incearca
	
	addl $1, i
	jmp pune

incearca:
	movl x, %eax
	movl $9, %ecx
	mull %ecx
	addl y, %eax
	movl i, %ecx
	movl %ecx, (%edi,%eax,4)
	
	movl x, %eax
	cmp $9, %eax
	jne vezi
	
	movl y, %eax
	cmp $9, %eax
	jne vezi
	
	jmp solutie
	
vezi:
	movl $fvlinie, %esi
	movl x, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $1, (%esi,%eax,4)
	
	movl $fvcol, %esi
	movl y, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $1,(%esi,%eax,4)
	
	movl $fvzona, %esi
	
	movl zz, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $1,(%esi,%eax,4)
	
	addl $1, y
	movl y, %eax
	cmp $10, %eax
	je schimba_linie
	
	
	pushl i
	pushl zz
	call bk
	popl zz
	popl i
	
	
	subl $1, y
	
	movl $fvlinie, %esi
	movl x, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0, (%esi,%eax,4)
	
	movl $fvcol, %esi
	movl y, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0,(%esi,%eax,4)
	
	movl $fvzona, %esi
	
	movl zz, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0,(%esi,%eax,4)
	
	movl x, %eax
	movl $9, %ecx
	mull %ecx
	addl y, %eax
	movl $0, %ecx
	movl %ecx, (%edi,%eax,4)
	
	addl $1, i
	jmp pune

schimba_linie:
	movl $1, y
	addl $1, x
	
	
	pushl i
	pushl zz
	call bk
	popl zz
	popl i
	
	
	movl $9, y
	subl $1, x
	
	movl $fvlinie, %esi
	movl x, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0, (%esi,%eax,4)
	
	movl $fvcol, %esi
	movl y, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0,(%esi,%eax,4)
	
	movl $fvzona, %esi
	
	movl zz, %eax
	movl $10, %ecx
	mull %ecx
	addl i, %eax
	movl $0,(%esi,%eax,4)
	
	movl x, %eax
	movl $9, %ecx
	mull %ecx
	addl y, %eax
	movl $0, %ecx
	movl %ecx, (%edi,%eax,4)
	
	addl $1, i
	jmp pune


sari:
	movl x, %eax
	cmp $9, %eax
	jne mareste_y
	
	movl y, %eax
	cmp $9, %eax
	jne mareste_y
	
	jmp solutie

mareste_y:
	addl $1, y
	movl y, %eax
	cmp $10, %eax
	je mareste_x
	
	pushl i
	pushl zz
	call bk
	popl zz
	popl i
	
	subl $1, y
	ret
	
mareste_x:
	movl $1, y
	addl $1, x
	
	pushl i
	pushl zz
	call bk
	popl zz
	popl i
	
	movl $9, y
	sub $1, x
	ret

solutie:
	movl $1, i
	movl $1, j
	jmp afis

afis:
	movl i, %eax
	cmp $10, %eax
	je exit
	
	movl i, %eax
	movl $9, %ecx
	mull %ecx
	addl j, %eax
	movl (%edi,%eax,4), %ecx
	movl %ecx, x
	
	pushl x
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	addl $1, j
	movl j, %eax
	cmp $10, %eax
	je afis_linie_noua
	
	jmp afis

afis_linie_noua:
	addl $1, i
	movl $1, j
	
	pushl $afis_enter
	call printf
	popl gump
	
	jmp afis

return:
	ret

.global main

main:
	movl $1, i
	movl $1, j
	movl $a, %edi
	
	jmp citire
	
citire:
	movl i, %eax
	cmp $10, %eax
	je rez
	
	movl i, %eax
	movl $9, %ecx
	mull %ecx
	addl j, %eax
	movl %eax, x
	
	pushl $y
	pushl $citire_nr
	call scanf
	popl gump
	popl gump
	
	movl x, %eax
	movl y, %ecx
	movl %ecx, (%edi,%eax,4)
	
	movl $fvlinie, %esi
	movl i, %eax
	movl $10, %ecx
	mull %ecx
	addl y, %eax
	movl $1, (%esi,%eax,4)
	
	movl $fvcol, %esi
	movl j, %eax
	movl $10, %ecx
	mull %ecx
	addl y, %eax
	movl $1, (%esi,%eax,4)
	
	movl $fvzona, %esi
	
	pushl j
	pushl i
	call zona
	popl gump
	popl gump
	
	movl $10, %ecx
	mull %ecx
	addl y, %eax
	movl $1, (%esi,%eax,4)
	
	addl $1, j
	movl j, %eax
	cmp $10, %eax
	je linie_noua
	
	jmp citire
	
linie_noua:
	addl $1, i
	movl $1, j
	jmp citire

rez:
	movl $1, x
	movl $1, y
	
	call bk
	
	pushl $-1
	pushl $afis_nr
	call printf
	popl gump
	popl gump
	
	pushl $afis_enter
	call printf
	popl gump
	
	jmp exit

exit:
	movl $1, %eax
	xorl %ebx,%ebx
	int $0x80
	
	
	
	
	
	
