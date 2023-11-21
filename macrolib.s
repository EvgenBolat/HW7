.macro ReturnDigitForInd(%number, %answerind, %isBigger) 
	addi	sp, sp, -8
	sw	%number, (sp)
	sw	%isBigger, 4(sp)
	lw	t0, (sp)
	
	li	t1, 0
	bne 	t0, t1, notZero
	li	%answerind, 63
	j	FinishMacro
	notZero:
	li	t1, 1
	bne 	t0, t1, notOne
	li	%answerind, 6
	j	FinishMacro
	notOne:
	li	t1, 2
	bne 	t0, t1, notTwo
	li	%answerind, 91
	
	notTwo:
	li	t1, 3
	bne 	t0, t1, notThree
	li	%answerind, 79
	
	notThree:
	li	t1, 4
	bne 	t0, t1, notFour
	li	%answerind, 102
	
	notFour:
	li	t1, 5
	bne 	t0, t1, notFive
	li	%answerind, 109
	
	notFive:
	li	t1, 6
	bne 	t0, t1, notSix
	li	%answerind, 125
	
	notSix:
	li	t1, 7
	bne 	t0, t1, notSeven
	li	%answerind, 7
	
	notSeven:
	li	t1, 8
	bne 	t0, t1, notEight
	li	%answerind, 127
	
	notEight:
	li	t1, 9
	bne 	t0, t1, FinishMacro
	li	%answerind, 111
	FinishMacro:
	lw	t1, 4(sp)
	beqz	t1, NotAdd
	addi	%answerind, %answerind, 128
	NotAdd:
	addi	sp, sp, 8
.end_macro
