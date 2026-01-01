.global _start
_start:
	
	mov r1, #0  //1110 0011 1010 0000 0001 0000 0000 0000 never used, no need
	mov r2, #10 //1110 0011 1010 0000 0010 0000 0000 1010 r2 = 10
	mov r3, #0 //1110 0011 1010 0000 0011 0000 0000 0000 r3 = 0
	mov r4, #5 //1110 0011 1010 0000 0100 0000 0000 0101 r4 = 5
loop1:       // loop1 loops 5 times and increasing r0 from 0 to 50
	subs r5, r3, r4  //1110 0000 0101 0011 0101 0000 0000 0100 condition flags are set. Subtract r4 from r3 and store in r5
	addlt r0, r0, r2 //1011 0000 1000 0000 0000 0000 0000 0010 r0  is not initialized. So it can contain garbage value. If r3 is less than r4, add r2 to r0 and store in r0
	addlt r3, r3, #1 // 1011 0010 1000 0011 0011 0000 0000 0001 If r3 is less than r4, add 1 to r3 and store in r3
	blt loop1 //1011 1010 1111 1111 1111 1111 1111 1011 If r3 is less than r4, branch to loop1 (branch back)
	bl loop2 //1110 1011 1111 1111 1111 1111 1111 1111 branch to loop2 and store address of the next instruction in lr (link register)
loop2:
	str r14, [r13,#-4]! //1110 0101 0010 1101 1110 0000 0000 0100 store r14 (lr) in the stack
	mov r4, #15 //1110 0011 1010 0000 0100 0000 0000 1111 r4 = 15 , overwrite
	mov r5, #10 //1110 0011 1010 0000 0101 0000 0000 1010   r5 =10 , overwrite
	add r6, r5, r4 //1110 0000 1000 0101 0110 0000 0000 0100 add r4 to r5 and store in r6
	subs r5, r3, r4 //1110 0000 0101 0011 0101 0000 0000 0100 condition flags are set. Subtract r4 from r3 and store in r5
	b loop2 //1110 1010 1111 1111 1111 1111 1111 1001 branch to loop2, infinite loop