.include "macrolib.s"

.data 
errorName: .asciz "incorrect choose"

.text 

.global ShowNumberOnIndex
ShowNumberOnIndex:
	addi 	sp, sp, -4
	sw	ra, (sp)
	
	li	t0, 16
	li	t1, 0
	
	blt   	a0, t0, Less # check if the 16-digit digit is greater than
	rem	a0, a0, t0 # take the lowest 4 digits (remainder of division by 16)
	addi	t1, t1, 1 #increase the flag
	
	Less:
	ReturnDigitForInd(a0, t2, t1) #a0 – the digit, t2 – register for recording the answer
				      #t1 – register with 1 if the number is greater than 16, 0 otherwise
				      #Returns what number should be written to the indicator based on the digit
	li	t0, 1
	beqz  	a1, Left #check which indicator we need
	beq 	a1, t0, Right
	
	j	error 
	
	Left:
	lui   t3, 0xffff0
    	sb    t2, 0x11(t3)
    	j Finish
    	
	Right:
	lui   t3, 0xffff0
    	sb    t2, 0x10(t3)
	Finish:
	lw	ra, (sp)
	addi	sp, sp 4
	ret 
error:
	la	a0, errorName
	li	a7, 4
	ecall
	li	a7, 10
	ecall
	
