.text
.globl main
main:
  li $s2, 0 # Sum = 0
  li $s0, 1 # i = 1
  li $s1, 5 # N = 5
  
 LOOP:
   bgt $s0, $s1, END
   add $s2, $s2, $s0
   addi $s0, $s0, 1
   j LOOP
 END:
   li $v0, 10
 syscall