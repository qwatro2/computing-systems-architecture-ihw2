.macro print_str (%x)  # macro for printing screen in-place
   .data
		str: .asciz %x
   .text
   		li a7, 4
   		la a0, str
   		ecall
   .end_macro

.macro print_double(%reg)  # macro for printing float from register %reg
    fmv.d fa0 %reg
    li a7 3
    ecall
.end_macro

.macro input_double(%reg)  # macro for reading float and writing to register %reg
    li a7 7
    ecall
    fmv.d %reg fa0
.end_macro

.macro input_int(%reg)  # macro for reading int and writing to register %reg
	li a7 5
	ecall
	mv %reg a0
.end_macro

.macro stack_push(%reg)  # macro for push value from register reg on stack
	addi sp sp -4
	sw %reg (sp)
.end_macro

.macro stack_pop(%reg)  # macro for pop address from stack to register reg
	lw %reg (sp)
	addi sp sp 4
.end_macro
