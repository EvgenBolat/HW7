.text 

addi	sp, sp, -8
li	t0, 0 #number to be displayed on the indicator
li	t1, 0 #0 - to the left indicator, 1- to the right indicator
sw	t0, 4(sp)
sw	t1, (sp)

loop:
lw	a0, 4(sp)
lw	a1, (sp)
jal	ShowNumberOnIndex # a0 – number to be displayed on the indicator, a1 – 0 - to the left indicator, 1- to the right indicator
			  # Returns nothing
			  
lw	t0, 4(sp)
addi	t0, t0, 1 #increase the number
sw	t0, 4(sp)

lw	t0, (sp)
addi	t0, t0, 1 #increase the choosing of the indicator
li	t1, 2
rem 	t0, t0, t1 #take the remainder to save the input logic
sw	t0, (sp)

li	a7, 32 #call the waiting for 1 second
li	a0, 1000
ecall
j	loop #infinite loop
