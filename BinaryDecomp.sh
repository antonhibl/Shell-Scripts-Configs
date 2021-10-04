#!/bin/bash -
#
# Binary Decomposition Script
# author: Anton Hibl

mkdir $1_decomp
gcc -S $1.c -o $1_decomp/asm_$1.s 
gcc -S $2.c -o $1_decomp/asm_$2.s
gcc -E -P $1.c -o $1_decomp/prcsr_$1.p
gcc -Wall -Werror -Wextra $1_decomp/asm_$1.s $1_decomp/asm_$2.s -o $1_decomp/$1bin -lm
strip --strip-all $1_decomp/$1bin

