.global _start
_start:
	
	mov r6, pc             
	mov r0, #1 
	mov r1, #4
	mov r2, #0 
	mov r3, #4 
	sub r4, pc, r6 
	add r5, r6, r4 
	cmp r0, r1 
	SVCGT #2
	addle r2, r2, r0
	addle r0, r0, #1
	mov pc, r5
	
	
	/* OPTIMIZED SOLUTION
	mov r0, #1 
	mov r1, #4 
	mov r5, pc
	mov r2, #0 
	cmp r0, r1 
	SVCGT #2
	addle r2, r2, r0
	addle r0, r0, #1 
	mov pc, r5
	*/
