.include "macrolib.asm"

# this macro is using for simplify writing tests, I deliberately did not place it in the macrolib
.macro test(%x)
	.data
		x: .float %x
	.text
		flw fa0 x t0
		jal solve  # call function for solving problem (params: x in fa0; return: result in fa1)
		jal output_result  # call function for printing result (params: x in fa0, cos(x) in fa1)
.end_macro

.text
.globl run_test
run_test:
	stack_push(ra) # write ra because we will use jal later

	print_str("Simple tests:\n")
	test(0)
	test(0.5235987)  # pi / 6
	test(0.7853981)  # pi / 4
	test(1.0471975)  # pi / 3
	test(1.5707963)  # pi / 2
	test(2.0943951)  # 2pi / 3
	
	print_str("\nRandom tests:\n")
	test(0.44863573385016364)
	test(-0.4468032468449707)
	test(0.49066211590664083)
	test(-1.8466392695751883)
	test(1.9686554829554352)
	test(2.033168849468953)
	test(0.9642963700634886)
	test(-2.1348406582948445)
	test(0.1298694167983847)
	test(-1.0821353395129152)
		
	stack_pop(ra)  # recover ra
	ret


	
