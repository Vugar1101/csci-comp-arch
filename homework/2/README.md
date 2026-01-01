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
