.globl main
.globl loop
.globl space
.globl plus
.globl minus
.globl multi
.globl divide
.globl assi
.globl numbers
.globl carry
.globl carryup

.globl ba
.globl ba2

.globl bb
.globl bb2

.globl bc
.globl bc2

.globl bd
.globl bd2

.globl be
.globl be2

.globl end
.globl higherprio
.globl lowerprio1
.globl lowerprio2

.globl actualplus
.globl actualplus2

.globl actualminus
.globl actualminus2

.globl actualmulti
.globl actualmulti2

.globl actualdivide
.globl actualdivide2

.globl actualremain
.globl actualremain2

.globl restorestack

.globl destinationa
.globl destinationb
.globl destinationc
.globl destinationd
.globl destinatione

.globl lookupplus
.globl lookupminus
.globl lookupmulti
.globl lookupdivide
.globl lookupremain

.globl lookdownplus
.globl lookdownminus
.globl lookdownmulti
.globl lookdowndivide
.globl lookdownremain
.globl searchup2
.globl searchdown2

.globl done
.globl save
.globl save2
.globl division
.globl dloop
.globl dbig
.globl dsmall
.globl dmeet
.globl setback

.globl multipli
.globl multiloop
.globl mul_shift

.globl colon

#.data 
#a:           .half 0 
#b:           .half 0xFFFF 
#c:           .half 0xCE20 
#d:           .half 1 
#e:           .half 102 
#exp:       .asciiz   "e:=e   - 43 *     e+   e%17+462    - c   /   4"

#.data 
#a:           .half 541 
#b:           .half 8290 
#c:           .half 0xF0C8 
#d:           .half 12348 
#e:           .half 19 
#exp:       .asciiz   "a:=1428 / e - a     * 9172 + 598*b       + d % 2023 +5000 "

.data 
a:           .half 45 
b:           .half 5 
c:           .half 400 
d:           .half 45 
e:           .half 0xE964 
exp:       .asciiz   "d:=d*d/d+d+14*d-e+6292-a/b"

.text

main:
	lui $t0, 0x1000
	addi $t0, $t0, 10 #location of where exp is
	add $s5, $s5, $sp

loop: lb $a0, ($t0) #loading value t0 => a0
	  add $0, $0, $0
	  
	  xor $t1,$t1,$t1# resetting t1
	  addi $t1,$t1,32 #checking space(ascii=32)
	  beq $a0, $t1, space
	  or $0,$0,$0 # delay slot

	  xor $t1,$t1,$t1 #reset register
	  addi $t1, $t1, 43 # plus=43(ascii)
	  beq $a0, $t1, plus
	  or $0, $0, $0

	  xor $t1,$t1,$t1 #reset register
	  addi $t1, $t1, 58 # plus=43(ascii)
	  beq $a0, $t1, colon
	  or $0, $0, $0



	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,37 #add ascii code for remainder
	  beq $a0, $t1,remain #branch to remainder
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 
	  addi $t1, $t1, 45
	  beq $a0, $t1, minus
	  or $0, $0, $0

	  xor $t1,$t1,$t1 
	  addi $t1, $t1, 42
	  beq $a0, $t1, multi
	  or $0, $0, $0

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,47 #add ascii code for divide
	  beq $a0, $t1,divide #branch to divide
	  or $0,$0,$0 #NOP


	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,61 #add ascii code for assignment
	  beq $a0, $t1,assi #branch to assignment
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset
	  addi $t1, $t1,48 #ascii code for number0
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset $t1
	  addi $t1, $t1,49 #ascii code for number1
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset $t1
	  addi $t1, $t1,50 #ascii code for number2
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset $t1
	  addi $t1, $t1,51 #ascii code for number3
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset $t1
	  addi $t1, $t1,52 #ascii code for number4
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #reset $t1
	  addi $t1, $t1,53 #ascii code for number5
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,54 #add ascii code for number6
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,55 #add ascii code for number7
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,56 #add ascii code for number8
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,57 #add ascii code for number9
	  beq $a0, $t1,numbers #branch to number
	  or $0,$0,$0 #NOP
	
	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,97 #add ascii code for a
	  beq $a0, $t1,ba 
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,98 #add ascii code for b
	  beq $a0, $t1,bb 
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,99 #add ascii code for c
	  beq $a0, $t1,bc 
	  or $0,$0,$0 #NOP

	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,100 #add ascii code for d
	  beq $a0, $t1,bd 
	  or $0,$0,$0 #NOP
	
	  xor $t1,$t1,$t1 #clear $t1
	  addi $t1, $t1,101 #add ascii code for e
	  beq $a0, $t1,be 
	  or $0,$0,$0 #NOP
plus: #plus statrt
	addi $sp, $sp, -4

	xor $t7,$t7,$t7
	addi $t7, $t7, 32767
	sw $t7, ($sp)

	addi $t0, $t0, 1# increase $t0 by 1######where actually indexing part
	
	xor $a0,$a0,$a0
	xor $a0,$a0,$a0

	lb $t7, 0($t0)
	or $0, $0, $0

	beq $t7, $0, end
	or $0, $0, $0
	xor $t7,$t7,$t7
	j loop
	or $0, $0, $0
minus:#minus start
	addi $sp,$sp,-4 #allocate space,pre-Push
    xor $t7,$t7,$t7
    addi $t7,$t7, 32766 
    sw $t7,($sp)
    addi $t0,$t0,1 # increase $t0 by 1######where actually indexing part
    xor $a0,$a0,$a0 #clear $a0
	xor $t7,$t7,$t7#clear t7
	lb $t7, 0($t0)
	or $0,$0,$0 #NOP
	beq $t7, $0,end #jump to null 
	or $0,$0,$0 #NOP
	xor $t7,$t7,$t7 #clear $t7
	j loop
	or $0,$0,$0 #NOP
multi:
	addi $sp,$sp,-4 #allocate space,pre-Push
	xor $t7,$t7,$t7
    addi $t7,$t7, 32765
    sw $t7,($sp)
    addi $t0,$t0,1 # increase $t0 by 1# increase $t0 by 1######where actually indexing part
    xor $a0,$a0,$a0 #clear $a0
	xor $t7,$t7,$t7#clear t7
	lb $t7, 0($t0)
	or $0,$0,$0 #NOP
	beq $t7, $0,end #jump to null 
	or $0,$0,$0 #NOP
	xor $t7,$t7,$t7 #clear $t7        
	j loop
	or $0,$0,$0 #NOP
colon:
	addi $t0, $t0, 1
	xor $a0,$a0,$a0 #clear $a0
	j loop
	or $0, $0, $0


divide:
	addi $sp,$sp,-4 #allocate space,pre-Push
	xor $t7,$t7,$t7
    addi $t7,$t7, 32764
    sw $t7,($sp)
    addi $t0,$t0,1 # increase $t0 by 1# increase $t0 by 1######where actually indexing part
    xor $a0,$a0,$a0 #clear $a0
	xor $t7,$t7,$t7#clear t7
	lb $t7, 0($t0)
	or $0,$0,$0 #NOP
	beq $t7, $0,end #jump to null 
	or $0,$0,$0 #NOP
	xor $t7,$t7,$t7 #clear $t7       
	j loop
	or $0,$0,$0 #NOP

remain:
	 addi $sp,$sp,-4 #allocate space,pre-Push
     xor $t7,$t7,$t7
     addi $t7,$t7, 32763 # this is for remainder
     sw $t7,($sp)
     addi $t0,$t0,1 # increase $t0 by 1
     xor $a0,$a0,$a0 #clear $a0
	xor $t7,$t7,$t7#clear t7
	lb $t7, 0($t0)
	or $0,$0,$0 #NOP
	 beq $t7, $0,end #jump to null 
	or $0,$0,$0 #NOP
	xor $t7,$t7,$t7 #clear $t7        
	j loop

	or $0,$0,$0 #NOP

assi:
	addi $sp,$sp,-4 #allocate space,pre-Push
	xor $t7,$t7,$t7
    addi $t7,$t7, 32761
    sw $t7,($sp)
    addi $t0,$t0,1 # increase $t0 by 1# increase $t0 by 1######where actually indexing part
    xor $a0,$a0,$a0 #clear $a0
	xor $t7,$t7,$t7#clear t7
	lb $t7, 0($t0)
	or $0,$0,$0 #NOP
	beq $t7, $0,end #jump to null 
	or $0,$0,$0 #NOP
	xor $t7,$t7,$t7 #clear $t7    
	j loop
	or $0,$0,$0 #NOP
space: 	

		addi $t0,$t0,1 # increase $t0 , it remains after this loop is done
		xor $a0,$a0,$a0 #clear $a0
		xor $t7,$t7,$t7#clear t7
		lb $t7, 0($t0)
		or $0,$0,$0 #NOP
	 	beq $t7, $0,end #jump to null 
		or $0,$0,$0 #NOP
		xor $t7,$t7,$t7 #clear $t7
		j loop
		or $0,$0,$0 #NOP
numbers: addi $t1, $t1, -48 #ascii value of 0. if any number subtract this is going to be the real number
carry:
	 addi $t0, $t0, 1 # since we are reading left to right, we have to see whether there is more number or not
	 xor $t7,$t7,$t7
	 lb $t7, 0($t0)
	 add $0, $0, $0

	 xor $t2,$t2,$t2
	 addi $t2, $t2, 48 # if t2 is equal to 0
	 beq $t2, $t7, carryup
	 or $0, $0, $0


	 xor $t2,$t2,$t2
	 addi $t2, $t2, 49	# if t2 is equal to 1
	 beq $t2, $t7, carryup
	 or $0, $0, $0


	 xor $t2,$t2,$t2
	 addi $t2, $t2, 50	# if t2 is equal to 2
	 beq $t2, $t7, carryup
	 or $0, $0, $0


	 xor $t2,$t2,$t2
	 addi $t2, $t2, 51	# if t2 is equal to 3
	 beq $t2, $t7, carryup
	 or $0, $0, $0


	 xor $t2,$t2,$t2
	 addi $t2, $t2, 52	# if t2 is equal to 4
	 beq $t2, $t7, carryup
	 or $0, $0, $0


	 xor $t2,$t2,$t2
	 addi $t2, $t2, 53	# if t2 is equal to 5
	 beq $t2, $t7, carryup
	 or $0, $0, $0

	 xor $t2,$t2,$t2
	 addi $t2, $t2, 54	# if t2 is equal to 6
	 beq $t2, $t7, carryup
	 or $0, $0, $0

	 xor $t2,$t2,$t2
	 addi $t2, $t2, 55	# if t2 is equal to 7
	 beq $t2, $t7, carryup
	 or $0, $0, $0

	 xor $t2,$t2,$t2
	 addi $t2, $t2, 56	# if t2 is equal to 8
	 beq $t2, $t7, carryup
	 or $0, $0, $0

	 xor $t2,$t2,$t2
	 addi $t2, $t2, 57	# if t2 is equal to 9
	 beq $t2, $t7, carryup
	 or $0, $0, $0

	 addi $sp, $sp, -4 # ready to push the number
	 sh $t1, ($sp)
	 or $0, $0, $0

	 beq $t7, $0, end # if the string is end, go to end( asccii(null)=0)
	 or $0, $0, $0

	 j loop #otherwise go back to loop
	 or $0, $0, $0

ba: #ba starts
	addi $t0, $t0, 1

	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
	addi $t8, $t8, 58
	
	lb $t7, 0($t0)
	or $0, $0, $0
	
	beq $t7, $t8, destinationa
	or $0, $0, $0
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
	
ba2: #ba2 starts
	xor $t1,$t1,$t1  # branch of a
	lui $t4, 0x1000 #since the location of a is right at 0x10010000
	addi $sp, $sp, -4 #ready to push
	lh $t1, 0($t4) #load halfword of a
	add $0, $0, $0
	
	sh $t1, ($sp) #save t1 in the stack
	add $0, $0, $0
	#addi $t0, $t0, 1 # to read further string(checking end of string)
	
	xor $t1,$t1,$t1##reset register
	xor $t4,$t4,$t4##reset register
	xor $t7,$t7,$t7##reset register
	xor $a0,$a0,$a0##reset register

	lb $t7, 0($t0) #checking next string
	or $0, $0, $0
	beq $t7, $0, end #since end of string is asccii 0
	xor $t7,$t7,$t7

	j loop
	or $0, $0, $0

bb: #bb starts
    addi $t0, $t0, 1
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
	addi $t8, $t8, 58
	
	lb $t7, 0($t0)
	or $0, $0, $0
	
	beq $t7, $t8, destinationb
	or $0, $0, $0
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
bb2: #bb2 starts

	xor $t1,$t1,$t1  # branch of b
	lui $t4, 0x1000 #since the location of a is right at 0x10010002
	addi $t4, $t4, 2 #b's location in memory
	addi $sp, $sp, -4 #ready to push
	lh $t1, 0($t4) #load halfword of b
	add $0, $0, $0
	
	sh $t1, ($sp) #save t1 in the stack
	add $0, $0, $0
	#addi $t0, $t0, 1 # to read further string(checking end of string)
	
	xor $t1,$t1,$t1##reset register
	xor $t4,$t4,$t4##reset register
	xor $t7,$t7,$t7##reset register
	xor $a0,$a0,$a0##reset register

	lb $t7, 0($t0) #checking next string
	or $0, $0, $0
	beq $t7, $0, end #since end of string is asccii 0
	xor $t7,$t7,$t7

	j loop
	or $0, $0, $0
bc: #bc starts
    addi $t0, $t0, 1
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
	addi $t8, $t8, 58
	
	lb $t7, 0($t0)
	or $0, $0, $0
	
	beq $t7, $t8, destinationc
	or $0, $0, $0
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8
bc2: #bc2 starts


	xor $t1,$t1,$t1  # branch of c
	lui $t4, 0x1000 #since the location of a is right at 0x10010004
	addi $t4, $t4, 4 #c's location in memory
	addi $sp, $sp, -4 #ready to push
	lh $t1, 0($t4) #load halfword of c
	add $0, $0, $0
	
	sh $t1, ($sp) #save t1 in the stack
	add $0, $0, $0
	#addi $t0, $t0, 1 # to read further string(checking end of string)
	
	xor $t1,$t1,$t1##reset register
	xor $t4,$t4,$t4##reset register
	xor $t7,$t7,$t7##reset register
	xor $a0,$a0,$a0##reset register

	lb $t7, 0($t0) #checking next string
	or $0, $0, $0
	beq $t7, $0, end #since end of string is asccii 0
	xor $t7,$t7,$t7

	j loop
	or $0, $0, $0
bd: #bd starts

	addi $t0, $t0, 1     # am I inncreasing double???
	xor $t7,$t7,$t7	
	xor $t8,$t8,$t8
	addi $t8, $t8, 58
	
	lb $t7, 0($t0)
	or $0, $0, $0
	
	beq $t7, $t8, destinationd
	or $0, $0, $0
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8

bd2:

	xor $t1,$t1,$t1  # branch of d
	lui $t4, 0x1000 #since the location of a is right at 0x10010006
	addi $t4, $t4, 6 #c's location in memory
	addi $sp, $sp, -4 #ready to push
	lh $t1, 0($t4) #load halfword of d
	add $0, $0, $0
	
	sh $t1, ($sp) #save t1 in the stack
	add $0, $0, $0
	#addi $t0, $t0, 1 # to read further string(checking end of string)
	
	xor $t1,$t1,$t1##reset register
	xor $t4,$t4,$t4##reset register
	xor $t7,$t7,$t7##reset register
	xor $a0,$a0,$a0##reset register

	lb $t7, 0($t0) #checking next string
	or $0, $0, $0
	beq $t7, $0, end #since end of string is asccii 0
	xor $t7,$t7,$t7

	j loop
	or $0, $0, $0

be: #be starts
	addi $t0, $t0, 1     # am I inncreasing double???
	xor $t7,$t7,$t7	
	xor $t8,$t8,$t8
	addi $t8, $t8, 58
	
	lb $t7, 0($t0)
	or $0, $0, $0
	
	beq $t7, $t8, destinatione
	or $0, $0, $0
	xor $t7,$t7,$t7
	xor $t8,$t8,$t8

be2: #be2 starts

	
	

	xor $t1,$t1,$t1  # branch of c
	lui $t4, 0x1000 #since the location of a is right at 0x10010008
	addi $t4, $t4, 8 #c's location in memory
	addi $sp, $sp, -4 #ready to push
	lh $t1, 0($t4) #load halfword of e
	add $0, $0, $0
	
	sh $t1, ($sp) #save t1 in the stack
	add $0, $0, $0
	
	#addi $t0, $t0, 1 # to read further string(checking end of string) ACTUALY incrementing!!!!
	
	xor $t1,$t1,$t1##reset register
	xor $t4,$t4,$t4##reset register
	xor $t7,$t7,$t7##reset register
	xor $a0,$a0,$a0##reset register

	lb $t7, 0($t0) #checking next string

	or $0, $0, $0

	beq $t7, $0, end #since end of string is asccii 0
	xor $t7,$t7,$t7

	j loop
	or $0, $0, $0

destinationa:
	
	xor $t1,$t1,$t1
	lui $t4, 0x1000
	
	addi $sp, $sp, -4

	sw $t4, ($sp)

	add $0, $0, $0
	j loop

destinationb:
	
	xor $t1,$t1,$t1
	lui $t4, 0x1000
	addi $t4, $t4, 2
	addi $sp, $sp, -4

	sw $t4, ($sp)
	add $0, $0, $0
	j loop

destinationc:
	
	xor $t1,$t1,$t1
	lui $t4, 0x1000
	addi $t4, $t4, 4
	addi $sp, $sp, -4

	sw $t4, ($sp)
	add $0, $0, $0
	j loop
destinationd:
	
	xor $t1,$t1,$t1
	lui $t4, 0x1000
	addi $t4, $t4, 6
	addi $sp, $sp, -4

	sw $t4, ($sp)
	add $0, $0, $0

	j loop
	or $0, $0, $0

destinatione:

	xor $t1,$t1,$t1
	lui $t4, 0x1000
	addi $t4, $t4, 8
	addi $sp, $sp, -4

	sw $t4, ($sp)
	add $0, $0, $0
	j loop
	or $0, $0, $0

carryup:

 addi $t2,$t2,-48 #restore it to decimal value let's say 2
 sll $t3,$t1 ,3   #mult by 8
 sll $t5,$t1,1 #mult 2
 add $t1,$t5,$t3 #mult 10, t1=8+2
 add $t1,$t2,$t1 # restored + 2*10
 xor $t2,$t2,$t2

 j carry #repalced with branch
 or $0,$0,$0 #NOP

end:
	xor $t1,$t1,$t1
	xor $t0,$t0,$t0 
	xor $s4,$s4,$s4
	add $s4,$s4,$sp #stack pointer is now in s4
	xor $s0,$s0,$s0
	addi $s5,$s5,-8 # where the equal sign is
	add $s0,$s0,$s5




higherprio:
	lw $t0, ($s4) # this is first top in the stack, 17 in this case
	or $0, $0, $0
	
	
	
	xor $t1,$t1, $t1
	addi $t1, $t1, 32765 #multiplying
	or $0, $0, $0

	beq $t1, $t0, actualmulti #if the unique label is multiplying
	or $0, $0, $0

	xor $t1, $t1, $t1
	addi $t1, $t1, 32764 #unique of divide

	beq $t1, $t0, actualdivide # if it is divide
	or $0, $0, $0

	xor $t1,$t1,$t1
	addi $t1, $t1, 32763

	beq $t1, $t0, actualremain
	or $0, $0, $0
	

	addi $s4, $s4, 4 # if the next string is not equal sign,
	bne $s4, $s5, higherprio
	or $0, $0, $0

	jal restorestack
	or $0, $0, $0

lowerprio1:

	jal lowerpointer

lowerprio2:

	lw $t0, ($t2) #s4 stack poinrt, top

	or $0, $0, $0
	
	xor $t1,$t1,$t1
	addi $t1, $t1, 32767 #plus
	beq $t1, $t0, actualplus
	or $0, $0, $0
	
	xor $t1,$t1,$t1
	addi $t1, $t1, 32766 #minus
	beq $t1, $t0, actualminus
	or $0, $0, $0

	#addi $s4, $s4, -4 # to check if next is = 
	addi $t2, $t2, -4
	bne $s4, $t2, lowerprio2
	or $0, $0, $0

	jal restorestack
	or $0, $0, $0




	
	

assignment:
	lw $t0, ($s4)
	or $0, $0, $0

	xor $t1,$t1,$t1
	addi $t1,$t1,32761
	beq $t1, $t0, save
	or $0, $0, $0

	addi $s4, $s4, 4
	j assignment

lowerpointer:

	  #LOWERPOINTER BEGINS
	xor $t3,$t3,$t3
	xor $t9,$t9,$t9

	
	addi $t2, $t2, 4 #now t2 has address of sp
	
	lw $t3, ($t2)	  #t3 has value of t2 pointer
	or $0, $0, $0
	
	addi $t9, $t9, 32761
	
	bne $t9, $t3, lowerpointer
	or $0, $0, $0

	xor $t3,$t3,$t3
	xor $t9,$t9,$t9
	
	jr $ra
	or $0, $0, $0
	

actualremain:

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6,$s6,$s4
	add $s7,$s7,$s4

	addi $s6, $s6, 4
	addi $s7, $s7, -4

	lw $t3, ($s6)
	lw $t4,	($s7)


actualremain2:

	beq $t3, $0, lookupremain
	or $0, $0, $0

	beq $t4 , $0, lookdownremain
	or $0, $0, $0

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $s4
	add $s7, $s7, $s4
	addi $s6, $s6, 4
	addi $s7, $s7, -4
	
	jal division

		
	sw $s1, ($s4) #s4 does not change
	sw $0, ($s6) #changed in searchup
	sw $0, ($s7) #changed in searchdown

	xor $t3,$t3,$t3
	xor $t4,$t4,$t4
	xor $t5,$t5,$t5

	xor $t8,$t8,$t8
	xor $t9,$t9,$t9

	xor $s0,$s0,$s0
	xor $s1,$s1,$s1
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7
	

	j higherprio

actualmulti:

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6,$s6,$s4
	add $s7,$s7,$s4

	addi $s6, $s6, 4
	addi $s7, $s7, -4

	lw $t3, ($s6)
	lw $t4,	($s7)


actualmulti2:

	beq $t3, $0, lookupmulti
	or $0, $0, $0

	beq $t4 , $0, lookdownmulti
	or $0, $0, $0

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $s4
	add $s7, $s7, $s4
	addi $s6, $s6, 4
	addi $s7, $s7, -4
	
	

	jal multipli
	or $0, $0, $0
	
	sw $s3, ($s4) #s4 does not change
	sw $0, ($s6) #changed in searchup
	sw $0, ($s7) #changed in searchdown

	xor $t3,$t3,$t3
	xor $t4,$t4,$t4
	xor $t5,$t5,$t5
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	j higherprio

actualdivide:

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6,$s6,$s4
	add $s7,$s7,$s4

	addi $s6, $s6, 4
	addi $s7, $s7, -4

	lw $t3, ($s6)
	lw $t4,	($s7)

actualdivide2:
	
	beq $t3, $0, lookupdivide
	or $0, $0, $0

	beq $t4 , $0, lookdowndivide
	or $0, $0, $0

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $s4
	add $s7, $s7, $s4
	addi $s6, $s6, 4
	addi $s7, $s7, -4
	
	

	jal division
	or $0, $0, $0
	
	sw $s0, ($s4) #s4 does not change
	sw $0, ($s6) #changed in searchup
	sw $0, ($s7) #changed in searchdown

	xor $t3,$t3,$t3
	xor $t4,$t4,$t4
	xor $t5,$t5,$t5
	xor $t8,$t8,$t8
	xor $t9,$t9,$t9
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7
	xor $s0,$s0,$s0
	xor $s1,$s1,$s1

	j higherprio

actualplus:

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6,$s6,$t2
	add $s7,$s7,$t2
	
	addi $s6,$s6,4
	addi $s7,$s7,-4
	
	lw $t3, ($s6)
	lw $t4,	($s7)

actualplus2:

	beq $t3, $0, lookupplus
	or $0, $0, $0
	
	beq $t4, $0, lookdownplus
	or $0, $0, $0

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $t2
	add $s7, $s7, $t2
	addi $s6, $s6, 4
	addi $s7, $s7, -4

	add $t5,$t3,$t4
	
	sw $t5, ($t2)
	sw $0, ($s6)
	sw $0, ($s7)

	xor $t3,$t3,$t3
	xor $t4,$t4,$t4
	xor $t5,$t5,$t5
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	j lowerprio1

actualminus:

	
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6,$s6,$t2
	add $s7,$s7,$t2

	addi $s6, $s6, 4
	addi $s7, $s7, -4

	lw $t3, ($s6)
	lw $t4,	($s7)

actualminus2:

	beq $t3, $0, lookupminus
	or $0, $0, $0

	beq $t4 , $0, lookdownminus
	or $0, $0, $0

	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $t2
	add $s7, $s7, $t2
	addi $s6, $s6, 4
	addi $s7, $s7, -4
	
	

	sub $t5,$t3,$t4
	
	sw $t5, ($t2) #s4 does not change
	sw $0, ($s6) #changed in searchup
	sw $0, ($s7) #changed in searchdown

	xor $t3,$t3,$t3
	xor $t4,$t4,$t4
	xor $t5,$t5,$t5
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	j lowerprio1

restorestack:
	xor $s4,$s4,$s4
	xor $t2,$t2,$t2

	add $s4, $s4, $sp
	add $t2, $t2, $s4

	xor $s6,$s6,$s6 # this was used to value in upper
	xor $s7,$s7,$s7 # this is lower one

	add $s6, $s6, $s4 # saving stack pointer ot increment and decrement
	add $s7, $s7, $s4

	addi $s6, $s6, 4 # this is bottome one
	addi $s7, $s7,-4 # upper value

	jr $ra # goback to higherprio
	or $0, $0, $0

lookupminus: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, lookupminus
	lw $t3, ($s6)
	or $0, $0, $0
	sw $0, ($s6)
	j actualminus2

lookdownminus:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, lookdownminus
	lw $t4, ($s7)
	or $0, $0, $0
	sw $0, ($s7)	
	j actualminus2 
lookupdivide: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, lookupdivide
	lw $t3, ($s6)
	or $0, $0, $0
	sw $0, ($s6)
	j actualdivide2

lookdowndivide:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, lookdowndivide
	lw $t4, ($s7)
	or $0, $0, $0
	
	j actualdivide2

lookupplus: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, lookupplus
	lw $t3, ($s6)
	sw $0, ($s6)
	or $0, $0, $0
	
	j actualplus2

lookdownplus:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, lookdownplus
	lw $t4, ($s7)
	or $0, $0, $0
	sw $0,($s7)
	
	j actualplus2 
lookupremain: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, lookupremain
	lw $t3, ($s6)
	or $0, $0, $0
	
	sw $0, ($s6)
	j actualremain2

lookdownremain:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, lookdownremain
	lw $t4, ($s7)
	or $0, $0, $0
	
	j actualremain2

lookupmulti: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, lookupmulti
	lw $t3, ($s6)
	or $0, $0, $0
	sw $s6, ($0)

	j actualmulti2

lookdownmulti:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, lookdownmulti
	lw $t4, ($s7)
	or $0, $0, $0
	
	j actualmulti2 
save: 
	xor $s6,$s6,$s6
	xor $s7,$s7,$s7

	add $s6, $s6, $s4
	add $s7, $s7, $s4

	addi $s6, $s6, 4
	addi $s7, $s7, -4

	lw $t3, ($s6) # around assignment
	lw $t4, ($s7) #maybe it is destination
save2:
	beq $t3, $0, searchup2
	or $0, $0, $0

	beq $t4, $0, searchdown2
	or $0, $0, $0

	

	sh $t4, 0($t3)

	j done



searchup2: 

	xor $t1,$t1,$t1
	addi $s6, $s6, 4
	lw $t1, ($s6)
	beq $t1, $0, searchup2
	lw $t3, ($s6)
	or $0, $0, $0
	
	j save2

searchdown2:
	xor $t1,$t1,$t1
	addi $s7, $s7, -4
	lw $t1, ($s7)
	beq $t1, $0, searchdown2
	lw $t4, ($s7)
	or $0, $0, $0
	
	j save2

multipli:

	xor $t6,$t6,$t6
	xor $t5,$t5,$t5
	xor $s3,$s3,$s3

	addi $t6, $t6, 32

multiloop:

	andi $t5, $t4, 1
	beq $t5, $0, mul_shift
	or $0, $0, $0
	add $s3 $s3, $t3 #s3 is going to be the product

mul_shift:

	sll $t3, $t3, 1
	srl $t4, $t4, 1
	addi $t6, $t6, -1
	bne $t6, $0, multiloop
	or $0, $0, $0
	
	jr $ra
	or $0, $0, $0
muldone:
	jr $ra


division:   # t3=dividend, t4-divisor

	xor $t8,$t8,$t8 #counter 1
	xor $t9,$t9,$t9 #counter 2
	xor $t5,$t5,$t5 #quotient
	xor $s0,$s0,$s0
	xor $s1,$s1,$s1

	sll $t4, $t4, 16 #divisir left to 16(2_4)
	addi $t9, $t9, 17 #loop counter

dloop:
	sub $t3, $t3, $t4 
	bgtz $t3,dbig
	or $0, $0, $0
	j dsmall
	or $0, $0, $0

dbig:
  sll $t5, $t5,1
  addi $t5, $t5, 1
  j dmeet
  or $0, $0, $0

 dsmall:
 add $t3, $t3, $t4
 sll $t5, $t5, 1
 j dmeet
 or $0, $0, $0

 dmeet:

 	srl $t4, $t4, 1
 	addi $t8, $t8, 1
 	bne $t8, $t9, dloop
 	or $0, $0, $0
 	j setback
 	or $0, $0, $0

 setback:
 	add $s0, $t5, $0 #t3 is quotient
 	add $s1, $t3, $0 #t2 is remainder
 	jr $ra
 	or $0, $0, $0

done: or $0, $0, $0


