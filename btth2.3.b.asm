.data
  prompt1: .asciiz "nhap a: "
  prompt2: .asciiz "nhap b: "
  max: .asciiz "\nso lon hon la: "
  sum: .asciiz "\ntong = "
  subtract: .asciiz "\nhieu = "
  multi: .asciiz "\ntich = "
  divide: .asciiz "\nthuong = "
  error: .asciiz "\error"
.text
.globl main
main:
  # prompt1
  li $v0, 4
  la $a0, prompt1
  syscall
  li $v0, 5
  syscall
  add $t0, $v0, $zero
  # promtp2
  li $v0, 4
  la $a0, prompt2
  syscall
  li $v0, 5
  syscall
  add $t1, $v0, $zero
  # MAXXXXXXXXX
  li $v0, 4
  la $a0, max
  syscall
  bge $t0, $t1, A_GREATER
  add $a0, $t1, $zero
  j PRINT_MAX
A_GREATER:
  add $a0, $t0, $zero
PRINT_MAX:
  li $v0, 1
  syscall
  # SUM
  add $t2, $t0, $t1
  li $v0, 4
  la $a0, sum
  syscall
  li $v0, 1
  add $a0, $t2, $zero
  syscall
  # SUBTRACT
  sub $t3, $t0, $t1
  li $v0, 4
  la $a0, subtract 
  syscall
  li $v0, 1
  add $a0, $t3, $zero
  syscall
  #MULTILATION
  mul $t4, $t0, $t1
  li $v0, 4
  la $a0, multi
  syscall
  li $v0, 1
  add $a0, $t4, $zero
  syscall
  # DIVIDE
  li $v0, 4
  la $a0, divide
  syscall
  beq $t1, $zero, DIV_ZERO
  div $t5, $t0, $t1
  li $v0, 1
  add $a0, $t5, $zero
  syscall
  j END
DIV_ZERO:
  li $v0, 4
  la $a0, error
  syscall
END:
  li $v0, 10
  syscall