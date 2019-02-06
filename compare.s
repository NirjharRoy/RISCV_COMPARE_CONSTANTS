	.text
	
	.globl _start
_start:
.equ CONSTANT1, 0x00000002
.equ CONSTANT2, 0x00000003

        li a0,CONSTANT1
        li a1,CONSTANT2
        
        
        
	addi sp, sp,-16
	sw ra, 12(sp)
	
	BEQ a0,a1,equ
	
	
	li a0, 0                    # stdout
1:      auipc a1, %pcrel_hi(string2)    # load msg(hi)
        addi a1, a1, %pcrel_lo(1b)  # load msg(lo)       
        li a2, 8                   # length
        li a3, 0
        li a7, 64                   # _NR_sys_write
        ecall                       # system call
	j ex
	
	
	
	
	
	
	
	
	
	
	
	
equ:	li a0, 0                    # stdout
1:      auipc a1, %pcrel_hi(string1)    # load msg(hi)
        addi a1, a1, %pcrel_lo(1b)  # load msg(lo)       
        li a2, 6                   # length
        li a3, 0
        li a7, 64                   # _NR_sys_write
        ecall                       # system call
	j ex
	
	
	
	
	
	
ex:	li a0, 0
        li a1, 0
        li a2, 0
        li a3, 0
        li a7, 93                   # _NR_sys_exit
        ecall                       # system call

loop:
        j loop



.section .rodata
	
string1:
	.string "EQUAL\n"
string2:
	.string "UNEQUAL\n"
