.include "macrolib.asm"

.text
.globl output_result
output_result:  # params: x in fa0, cos(x) in fa1
    print_str("x = ")  # print promt
	print_double(fa0)
	print_str(", therefore cos(x) = ")
	print_double(fa1)
    print_str("\n")
    ret
