.include "macrolib.asm"

.text
.globl input_x
input_x:  # return: x in fa0
    print_str("Enter x to calculate cos(x): ")  # print promt
    input_double(fa0)  # write x to fa0
    ret
