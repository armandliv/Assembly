.data
	x: .long 0
	sol: .long 0
	citire_nr: .asciz "%d"
	afis_nr: .asciz "%d "
	afis_enter: .asciz "\n"

.text
f:
	pushl %ebp
	movl %esp, %ebp
	
	xorl %edx, %edx
	movl 8(%ebp), %eax
	
	cmp $1, %eax
	je return
	
	addl $1, sol
	
	movl $2, %ecx
	divl %ecx
	
	cmp $1, %edx
	je impar
	
	pushl %eax
	call f
	popl %ebx      # pe ebx nu il folosesc explicit, nu imi trebuie valoarea lui
	               # deci nu il mai restaurez
	jmp return
	
impar:
	xorl %edx, %edx
	movl 8(%ebp), %eax
	
	movl $3, %ecx
	mull %ecx
	addl $1, %eax
	
	pushl %eax
	call f
	popl %ebx     # puteam sa pun popl %eax, dar nu imi mai trebuie valoarea lui eax dupa
	
	jmp return

return:
	popl %ebp
	ret

.global main

main:
	pushl $x
	pushl $citire_nr
	call scanf
	popl %ebx
	popl %ebx
	
	movl $0, sol
	
	pushl x
	call f
	popl %ebx
	
	pushl sol
	pushl $afis_nr
	call printf
	popl %ebx
	popl %ebx
	
	jmp exit   # putem sa nu il mai pun
	
exit:
	pushl $afis_enter
	call printf
	popl %ebx
	
	movl $1, %eax
	xorl %ebx,%ebx
	int $0x80
