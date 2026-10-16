.text
.globl main
main:
  li $s0, 3 #i = 3
  li $s1, 5 # j = 5
  li $t0, 10 # g = 10
  li $t1, 3 # h = 3

  bne $s0, $s1, ELSE
  add $s2, $t0, $t1
  j END
ELSE:
  sub $s2, $t0, $t1
END:
  li $v0, 10
  syscall