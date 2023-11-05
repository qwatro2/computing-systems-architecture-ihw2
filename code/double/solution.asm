.include "macrolib.asm"
.data
	eps: .double 0.001  # 0.1%

.text
.globl solve
solve:  # params: x in fa0; return: result in fa1
	fld ft0 eps t0 # epsilon
	li t1 1
	li t2 -1
	fcvt.d.w ft7 t2  # const -1
	fcvt.d.w fa1 t1  # result
	fcvt.d.w ft1 t1  # previous term
	fcvt.d.w ft2 zero  # current term
	
	li t1 1  # iteration variable
	
	while:
		add t2 t1 t1
		addi t3 t2 -1
		mul t2 t2 t3
		fcvt.d.w ft3 t2  # denumerator 2k*(2k - 1)
		fmul.d ft4 fa0 fa0
		fmul.d ft4 ft4 ft7  # numerator -x^2
		fdiv.d ft5 ft4 ft3  # m
		
		fmul.d ft2 ft1 ft5  # cur = prev * m
		
		fdiv.d ft6 ft2 fa1  # ft6 = cur / res
		fabs.d ft6 ft6  # ft6 = abs(cur / res)
		flt.d t2 ft6 ft0
		bnez t2 break  # t2 = 1 <=> ft6 < ft0 <=> abs(cur / res) < eps
		
		fadd.d fa1 fa1 ft2  # res += ft2
		fmv.d ft1 ft2  # prev = cur
		addi t1 t1 1  # k += 1
		j while
				
	break:
		fadd.d fa1 fa1 ft2  # res += ft2
		
		ret
