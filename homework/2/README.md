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
&nbsp;I`P U B W L  
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






