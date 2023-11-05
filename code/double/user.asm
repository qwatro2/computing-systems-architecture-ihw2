.include "macrolib.asm" 

.text
.globl run_user
run_user:
	stack_push(ra)  # write ra because we will use jal later

    jal input_x  # call function for reading x (return: x in fa0)
    jal solve  # call function for solving problem (params: x in fa0; return: result in fa1)
    jal output_result  # call function for printing result (params: x in fa0, cos(x) in fa1)

	stack_pop(ra)  # recover ra
    ret
