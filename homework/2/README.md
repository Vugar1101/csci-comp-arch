# e3a01000 -> 1110 0011 1010 0000 0001 0000 0000 0000 

1110 00 1 1101 0 0000 0001 0000 00000000

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0001 - destination register **(r1)**  
0000 - rotation (since it is 0, **no rotation**)  
00000000 - immediate value **(0)**  

### mov r1, #0  
---------------------------------------------------------------------------------  
# e3a0200a -> 1110 0011 1010 0000 0010 0000 0000 1010

1110 00 1 1101 0 0000 0010 0000 00001010

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0010 - destination register **(r2)**  
0000 - rotation (since it is 0, **no rotation**)  
00001010 - immediate value **(10)**  

### mov r2, #10  
----------------------------------------------------------------------------------  
# e3a03000 -> 1110 0011 1010 0000 0011 0000 0000 0000

1110 00 1 1101 0 0000 0011 0000 00000000

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0011 - destination register **(r3)**  
0000 - rotation (since it is 0, **no rotation**)  
00000000 - immediate value **(0)**  

### mov r3, #0
--------------------------------------------------------------------------------------
# e3a04005 -> 1110 0011 1010 0000 0100 0000 0000 0101

1110 00 1 1101 0 0000 0100 0000 00000101

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0100 - destination register **(r4)**  
0000 - rotation (since it is 0, **no rotation**)  
00000101 - immediate value **(5)**  

### mov r4, #5
--------------------------------------------------------------------------------------
# e0535004 -> 1110 0000 0101 0011 0101 0000 0000 0100

1110 00 0 0010 1 0011 0101 00000 00 0 0100

1110 - unconditional  
00 - data processing operation  
0 - immediate value does not exist  
0010 - *cmd* value for **sub** operation  
1 - **s**  
0011 - the first source register Rn **(r3)**  
0101 - destination register Rd **(r5)**  
00000 - shamt5 (shift amount five) **(0)**  
00 - LSL (logical shift left)  ***Note: Since shift amount is 0, nothing will change.***  
0 - constant for Register type  
0100 - the second source register Rm **(r4)**  

### subs r5,r3,r4
------------------------------------------------------------------------------------------  
# b0800002 -> 1011 0000 1000 0000 0000 0000 0000 0010

1011 00 0 0100 0 0000 0000 00000 00 0 0010

1011 - LT (less than)  
00 - data processing operation  
0 - immediate value does not exist  
0100 - *cmd* value for **add** operation  
0 - no **s**  
0000 - the first source register Rn **(r0)**  
0000 - destination register Rd **(r0)**  
00000 - shamt5 (shift amount five) **(0)**    
00 - LSL (logical shift left)  ***Note: Since shift amount is 0, nothing will change.***    
0 - constant for Register type    
0010 - the second source register Rm **(r2)**  

### addlt r0,r0,r2  
--------------------------------------------------------------------------------------------  
# b2833001 -> 1011 0010 1000 0011 0011 0000 0000 0001

1011 00 1 0100 0 0011 0011 0000 00000001

1011 - LT (less than)  
00 - data processing operation  
1 - immediate value exists  
0100 - *cmd* value for **add** operation  
0 - no **s**  
0011 - the first source register Rn **(r3)**  
0011 - destination register Rd **(r3)**  
0000 - rotation **(0)**  
00000001 - immediate value **(1)**  

### addlt r3, r3, #1  
--------------------------------------------------------------------------------------------  
# bafffffb -> 1011 1010 1111 1111 1111 1111 1111 1011

1011 10 10 111111111111111111111011

1011 - LT (less than)  
10 - branch operation  
10 - branch **without** link  
111111111111111111111011 - signed 2's complement immediate value  
***Converting process is below:***
Replace 1s and 0s with each other, then add 1  
111111111111111111111011  
000000000000000000000101  
(pc+8-5*4)  

### blt loop1  
---------------------------------------------------------------------------------------------  
# ebffffff -> 1110 1011 1111 1111 1111 1111 1111 1111

1110 10 11 111111111111111111111111

1110 - unconditional  
10 - branch operation  
11 - branch with link  
111111111111111111111111 - signed 2's complement immediate value  
***Converting process is below:***
Replace 1s and 0s with each other, then add 1  
111111111111111111111111  
000000000000000000000001  
(pc+8-1*4)  

### bl loop2  
---------------------------------------------------------------------------------------------  
# e52de004 -> 1110 0101 0010 1101 1110 0000 0000 0100

1110 01 0 1 0 0 1 0 1101 1110 000000000100  
---------I`P U B W L  
1110 - unconditional  
01 - memory operation  
I'  
0  -> **immediate exists**  
LB  
00 -> **STR**  
PW  
11 -> **pre-index**  
U  
0  -> **subtract**  
1101 - the first source register Rn **(r13)**  
1110 - destination register Rd **(r14)**  
000000000100 - immediate value **(4)**

### str r14, [r13,#-4]!  
---------------------------------------------------------------------------------------------  
# e3a0400f -> 1110 0011 1010 0000 0100 0000 0000 1111

1110 00 1 1101 0 0000 0100 0000 00001111  

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0100 - destination register **(r4)**  
0000 - rotation (since it is 0, **no rotation**)  
00001111 - immediate value **(15)**  

### mov r4, #15  
---------------------------------------------------------------------------------------------  
# e3a0500a -> 1110 0011 1010 0000 0101 0000 0000 1010  

1110 00 1 1101 0 0000 0101 0000 00001010  

1110 - unconditional  
00 - data processing operation  
1 - immediate value exists  
1101 - *cmd* value for **mov** operation    
0 - no **s**  
0000 - *the first source register will be ignored since it is **mov** operation*  
0101 - destination register **(r5)**  
0000 - rotation (since it is 0, **no rotation**)  
00001010 - immediate value **(10)**  

### mov r5, #10  
--------------------------------------------------------------------------------------------  
# e0856004 -> 1110 0000 1000 0101 0110 0000 0000 0100

1110 00 0 0100 0 0101 0110 00000 00 0 0100

1110 - unconditional    
00 - data processing operation  
0 - immediate value does not exist  
0100 - *cmd* value for **add** operation  
0 - no **s**  
0101 - the first source register Rn **(r5)**  
0110 - destination register Rd **(r6)**  
00000 - shamt5 (shift amount five) **(0)**    
00 - LSL (logical shift left)  ***Note: Since shift amount is 0, nothing will change.***    
0 - constant for Register type    
0100 - the second source register Rm **(r4)**  

### add r6, r5, r4  
--------------------------------------------------------------------------------------------  
# e0535004 -> 1110 0000 0101 0011 0101 0000 0000 0100

1110 00 0 0010 1 0011 0101 00000 00 0 0100

1110 - unconditional  
00 - data processing operation  
0 - immediate value does not exist  
0010 - *cmd* value for **sub** operation  
1 - **s**  
0011 - the first source register Rn **(r3)**  
0101 - destination register Rd **(r5)**  
00000 - shamt5 (shift amount five) **(0)**  
00 - LSL (logical shift left)  ***Note: Since shift amount is 0, nothing will change.***  
0 - constant for Register type  
0100 - the second source register Rm **(r4)**  

### subs r5, r3, r4  
--------------------------------------------------------------------------------------------  
# eafffff9 -> 1110 1010 1111 1111 1111 1111 1111 1001

1110 10 10 111111111111111111111001

1110 - unconditional  
10 - branch operation  
10 - branch **without** link  
111111111111111111111001 - signed 2's complement immediate value  
***Converting process is below:***
Replace 1s and 0s with each other, then add 1  
000000000000000000000111  
(pc+8-7*4)  

### b loop2  
-------------------------------------------------------------------------------------------
.global _start  
_start:  
	
	mov r1, #0  //never used, no need  
	mov r2, #10 // r2 = 10  
	mov r3, #0 // r3 = 0  
	mov r4, #5 // r4 = 5  
loop1:       // loop1 loops 5 times and increasing r0 from 0 to 50  
	subs r5, r3, r4  // condition flags are set. Subtract r4 from r3 and store in r5  
	addlt r0, r0, r2 // r0  is not initialized. So it can contain garbage value. If r3 is less than r4, add r2 to r0 and store in r0  
	addlt r3, r3, #1 // If r3 is less than r4, add 1 to r3 and store in r3  
	blt loop1 // If r3 is less than r4, branch to loop1 (branch back)  
	bl loop2 // branch to loop2 and store address of the next instruction in lr (link register)  
loop2:  
	str r14, [r13,#-4]! //store r14 (lr) in the stack  
	mov r4, #15 // r4 = 15 , overwrite  
	mov r5, #10 // r5 =10 , overwrite  
	add r6, r5, r4 // add r4 to r5 and store in r6  
	subs r5, r3, r4 //condition flags are set. Subtract r4 from r3 and store in r5  
	b loop2 // branch to loop2, infinite loop  

  Crash factors:  
  1.Pushing r14 to the stack in the 266th line, but not poping. Push-pop  
  2. Infinite loop (loop2)  
  3. Not storing calee-saved registers in the stack  

  Note: There are redundant and missing code lines. For example, since we do not change **lr**, no need storing it in loop2. No need 255th line.No need condition flags in 270th line. However, we need to initialize **r0 = 0** and lr (r13) to any memory address (suggested 0x8000). We need to add **svc #2** after **bl loop2** due to end the program after **loop2** is executed. Adding **bx lr** to branch link register.  

## Below is suggested correct form:  

.global _start  
_start:  
	mov r0, #0  
	mov r1, #10  
	mov r2, #0  
	mov r3, #5  
	ldr r13, =0x8000 //this part can be interpreted as clobbered register by cpulator but actually we need this.  
loop1:  
	subs r5, r2, r3  
	addlt r0, r0, r1  
	addlt r2, r2, #1  
	blt loop1  
	bl loop2  
  svc #2  
  /* I learned from GPT that, this code can be used for svc exception handling.  
	mov  r0, #0x18          @ angel_SWIreason_ReportException  
  ldr  r1, =0x20026       @ ADP_Stopped_ApplicationExit  
  svc  0x123456           @ semihosting call (CPUlator-supported)  
 */  
loop2:  
	stmfd sp!, {r4-r6}  
	mov r4, #15  
	mov r5, #10  
	mov r6, #0  
	add r6, r5, r4  
	subs r5, r3, r4  
	ldmfd sp!,{r4-r6}  
	bx lr  





