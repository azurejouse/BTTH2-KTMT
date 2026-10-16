.data
  prompt: .asciiz "nhap ki tu: "
  prev: .asciiz "\nki tu truoc: "
  next: .asciiz "\nki tu sau: "
  digit: .asciiz "\nloai: num"
  lower: .asciiz "\nloai: lower"
  upper: .asciiz "\nloai: upper"
  invalid: .asciiz "\ninvalid type"
.text
.globl main
main:
  # prompt
  li $v0, 4
  la $a0, prompt
  syscall
  li $v0, 12
  syscall
  add $t0, $v0, $zero
  # prev
  li $v0, 4
  la $a0, prev
  syscall
  li $v0, 11
  addi $a0, $t0, -1
  syscall
  # next
  li $v0, 4
  la $a0, next
  syscall
  li $v0, 11
  addi $a0, $t0, 1
  syscall
  # check num
  li $t1, 48
  blt $t0, $t1, CHECK_LOWER
  li $t1, 57
  ble $t0, $t1, IS_DIGIT
CHECK_LOWER:
  # check lower
  li $t1, 97
  blt $t0, $t1, CHECK_UPPER
  li $t1, 122
  ble $t0, $t1, IS_LOWER
CHECK_UPPER:
  # check upper
  li $t1, 65
  blt $t0, $t1, IS_INVALID
  li $t1, 90
  ble $t0, $t1, IS_UPPER
IS_INVALID:
  li $v0, 4
  la $a0, invalid
  syscall
  j EXIT
IS_DIGIT:
  li $v0, 4
  la $a0, digit
  syscall
  j EXIT
IS_LOWER:
  li $v0, 4
  la $a0, lower
  syscall
  j EXIT
IS_UPPER:
  li $v0, 4
  la $a0, upper
 syscall
EXIT:
  li $v0, 10
  syscall
