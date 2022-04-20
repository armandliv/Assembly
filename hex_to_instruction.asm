.data
	dump: .long 0
	h: .space 202
	b: .space 808
	FormatScanf: .asciz "%s"
	afis_let: .asciz "let "
	afis_add: .asciz "add "
	afis_sub: .asciz "sub "
	afis_mul: .asciz "mul "
	afis_div: .asciz "div "
	afis_nr: .asciz "%d "
	afis_ch: .asciz "%c "
	afis_nrn: .asciz "-%d "
	afis_chn: .asciz "-%c "
	afis_enter: .asciz "\n"
	poz: .long 0
	x: .long 0
	y: .long 0
	z: .long 0
.text

.global main

main:
	pushl $h
	pushl $FormatScanf
	call scanf
	popl dump
	popl dump
	
	movl $h, %edi
	movl $b, %esi
	xorl %ecx, %ecx
	xorl %ebx, %ebx
	
slipknot:
	movb (%edi,%ecx,1), %al
	
	cmp $0, %al
	je three_days_grace
	
	cmp $48, %al
	je rammstein_0
	cmp $49, %al
	je system_of_a_down_1
	cmp $50, %al
	je avenged_sevefold_2
	cmp $51, %al
	je disturbed_3
	cmp $52, %al
	je linkin_park_4
	cmp $53, %al
	je skillet_5
	cmp $54, %al
	je thousand_foot_krutch_6
	cmp $55, %al
	je five_finger_death_punch_7
	cmp $56, %al
	je iron_maiden_8
	cmp $57, %al
	je slayer_9
	cmp $65, %al
	je A_guns_n_roses
	cmp $66, %al
	je B_metallica
	cmp $67, %al
	je C_nirvana
	cmp $68, %al
	je D_red_hot_chili_peppers
	cmp $69, %al
	je E_ac_dc
	cmp $70, %al
	je F_bon_jovi
	
motionless_in_white:
	addl $1, %ecx
	jmp slipknot

rammstein_0:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white
		
system_of_a_down_1:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

avenged_sevefold_2:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

disturbed_3:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

linkin_park_4:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

skillet_5:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

thousand_foot_krutch_6:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

five_finger_death_punch_7:
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

iron_maiden_8:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

slayer_9:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

A_guns_n_roses:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

B_metallica:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

C_nirvana:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

D_red_hot_chili_peppers:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

E_ac_dc:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $0, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

F_bon_jovi:
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	movl $1, (%esi,%ebx,1)
	addl $1, %ebx
	jmp motionless_in_white

three_days_grace:
	xorl %ecx, %ecx
	xorl %ebx, %ebx
	jmp queen

queen:
	xorl %eax,%eax
	
	mov (%edi,%ecx,1), %al
	
	cmp $0, %al
	je the_beatles
	
	xorl %edx,%edx
	
	movl $0, x
	addl $1,%ebx
	movb (%esi,%ebx,1), %dl
	addl %edx, x                      # ai grija aici la movl si addl
	
	movl x, %edx
	addl %edx, x
	
	addl $1,%ebx
	movb (%esi,%ebx,1), %dl
	addl %edx, x
	addl $1, %ebx
	
	cmp $0, x
	je rolling_stones
	
	cmp $1, x
	je evanescence
	
	cmp $2, x
	je santana 
	
scorpions:
	addl $1, %ecx
	addl $1, %ecx
	addl $1, %ecx
	jmp queen

rolling_stones:
	movl $0, z
	xorl %edx,%edx
	
	movb (%esi,%ebx,1), %dl
	addl %edx, z
	
	addl $1, %ebx
	
	movl $0,y
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	# movl y, %edx
	# addl %edx, y
	addl $1, %ebx
	
	cmp $1, z
	je pink_floyd
	
	jmp aerosmith
	
pink_floyd:
	pushl %ebx
	pushl %ecx
	pushl y
	pushl $afis_nrn
	call printf
	popl dump
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions
	
aerosmith:
	pushl %ebx
	pushl %ecx
	pushl y
	pushl $afis_nr
	call printf
	popl dump
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

evanescence:
	movl $0, z
	xorl %edx,%edx
	
	movb (%esi,%ebx,1), %dl
	addl %edx, z
	
	addl $1, %ebx
	
	movl $0,y
	xorl %edx,%edx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	# movl y, %edx
	# addl %edx, y
	addl $1, %ebx
	
	cmp $1, z
	je cranberries
	
	jmp led_zeppelin

cranberries:
	pushl %ebx
	pushl %ecx
	pushl y
	pushl $afis_chn
	call printf
	popl dump
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

led_zeppelin:
	pushl %ebx
	pushl %ecx
	pushl y
	pushl $afis_ch
	call printf
	popl dump
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

santana:
	addl $1, %ebx
	addl $1, %ebx
	addl $1, %ebx
	addl $1, %ebx
	addl $1, %ebx
	addl $1, %ebx
	
	movl $0, y
	xorl %edx,%edx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	movl y, %edx
	addl %edx, y
	addl $1, %ebx
	
	movb (%esi,%ebx,1), %dl
	addl %edx,y
	# movl y, %edx
	# addl %edx, y
	addl $1, %ebx
	
	cmp $0, y
	je sting
	cmp $1, y
	je alice_cooper
	cmp $2, y
	je u2
	cmp $3, y
	je marylin_manson
	cmp $4, y
	je deep_purple
	

sting:
	pushl %ebx
	pushl %ecx
	pushl $afis_let
	call printf
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

alice_cooper:
	pushl %ebx
	pushl %ecx
	pushl $afis_add
	call printf
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

u2:
	pushl %ebx
	pushl %ecx
	pushl $afis_sub
	call printf
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

marylin_manson:
	pushl %ebx
	pushl %ecx
	pushl $afis_mul
	call printf
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

deep_purple:
	pushl %ebx
	pushl %ecx
	pushl $afis_div
	call printf
	popl dump
	popl %ecx
	popl %ebx
	jmp scorpions

the_beatles:
	pushl $afis_enter
	call printf
	popl dump
	movl $1, %eax
	xorl %ebx, %ebx
	int $0x80
# A78801C00A7890EC04
