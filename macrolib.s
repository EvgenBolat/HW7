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
	j	FinishMacro
	notTwo:
	li	t1, 3
	bne 	t0, t1, notThree
	li	%answerind, 79
	j	FinishMacro
	notThree:
	li	t1, 4
	bne 	t0, t1, notFour
	li	%answerind, 102
	j	FinishMacro
	notFour:
	li	t1, 5
	bne 	t0, t1, notFive
	li	%answerind, 109
	j	FinishMacro
	notFive:
	li	t1, 6
	bne 	t0, t1, notSix
	li	%answerind, 125
	j	FinishMacro
	notSix:
	li	t1, 7
	bne 	t0, t1, notSeven
	li	%answerind, 7
	j	FinishMacro
	notSeven:
	li	t1, 8
	bne 	t0, t1, notEight
	li	%answerind, 127
	j	FinishMacro
	notEight:
	li	t1, 9
	bne 	t0, t1, notNine
	li	%answerind, 111
	j	FinishMacro
	notNine:
	li	t1, 10
	bne 	t0, t1, notA
	li	%answerind, 119
	j	FinishMacro
	notA:
	li	t1, 11
	bne 	t0, t1, notB
	li	%answerind, 124
	j	FinishMacro
	notB:
	li	t1, 12
	bne 	t0, t1, notC
	li	%answerind, 57
	j	FinishMacro
	notC:
	li	t1, 13
	bne 	t0, t1, notD
	li	%answerind, 94
	j	FinishMacro
	notD:
	li	t1, 14
	bne 	t0, t1, notE
	li	%answerind, 121
	j	FinishMacro
	notE:
	li	t1, 15
	bne 	t0, t1, FinishMacro
	li	%answerind, 113
	j	FinishMacro
	FinishMacro:
	lw	t1, 4(sp)
	beqz	t1, NotAdd
	addi	%answerind, %answerind, 128
	NotAdd:
	addi	sp, sp, 8
.end_macro
