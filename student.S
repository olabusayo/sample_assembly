/* ARM Assembly
*  For each lab, use only the instructions/registers already discussed
*/

#include <asm/unistd.h>
	
.syntax unified

.global Lab1_1
.global Lab1_2 
.global Lab1_3
.global Lab2_1
.global Lab2_2
.global Lab2_3
.global Lab2_4
.global Lab3_1
.global Lab3_2
.global Lab3_3
.global Lab3_4
.global Lab4_1
.global Lab4_2
.global Lab5_1
.global Lab5_2
.global Lab5_3
.global Lab5_4
.global Lab5_5
.global Lab5_6
.global Lab5_7
.global Lab5_7_Bonus
.global Lab6_1
.global Lab6_2
.global Lab6_3
.global Lab7_1
.global Lab7_2
.global Lab7_3
.global Lab7_4
.global Lab8_1
.global Lab9_1
.global Lab9_2
.global Lab9_3
.global HelloWorld


 
.arm

/********************************************************
*	Lab 0			  	                *
*       Hello, World                                    *
*********************************************************/
	
HelloWorld:
	push {r0-r12, lr}
	ldr r0, =message
	mov r1, #1
	//bkpt
	bl printf
	pop {r0-r12, pc}

	
/********************************************************
*	Lab 1_1			  	                *
*	move the values 256, 257, and 0xffffffff into   *
*	r0, r1, r2 respectively	                        * 
*       NOTE:  If you get stuck on one, move on for now *
*********************************************************/

Lab1_1:
        push {r5-r11, lr}

        /**** Your code below here ****/
	/*mov r0, #0
	mov r1, #1
	cmp r0, r1
	ite eq
	addeq r0, #1
	subne r1, #1*/
	mov r0, #8
	eor r1, r1
	add r1, #1
	lsl r1, #4
	cmp r0, r1
	/*bgt go
	mvn r3, #0
	b else
	#bhi gobhi
	#bne gobne
	
	go:
	mov r3, #1

	else:*/
	

	//movw r1, #0x2a09
	//movt r1, #0xe3a0
	#mov r0, #2569
	//add r0, r1, r2, lsl#2
	/*mov r0, #2
	1:
	add r0, #1
	b 1f
	2:
	sub r0, #1
	b 1b
	1:
	sub r0, #2*/

	mov r0, #256
	/*movw r0, #4096
	movw r0, #4097*/

	movw r1, #257
	mov r2, #0xffffffff
	/**** Your code above here ****/

        pop {r5-r11, pc}

/********************************************************
*	Lab 1_2						*
*	exchange values in registers r0 and r1		*
*	REGISTERS: r0, r1, r2				*
*	PRESERVE: nothing				*
*********************************************************/

Lab1_2:
        push {r2, r4-r8, r10-r11, lr }

	/**** Your code below here ****/
	mov r2, r0
	mov r0, r1
	mov r1, r2
	/**** Your code above here ****/

        pop {r2, r4-r8, r10-r11, pc}


/********************************************************
*	Lab 1_3						*
*	Perform this action:				*
*	r0 = r1 + r2 + 0x42				*
*	REGISTERS: r0, r1, r2				*
*	PRESERVE: do not use any other registers	*
*							*
*	NOTE: If you didn’t complete all of the MOV’s   *
*             in Lab 1_1, consider going back after 	*
*             this lab and using a combination of 	*
*	      instructions to accomplish the goal	*
*********************************************************/

Lab1_3:
	push {r2, r3, r5, lr}

	/**** Your code below here ****/
	add r2, #0x42
	add r0, r1, r2
	/**** Your code above here ****/

	pop {r2, r3, r5, pc}


/********************************************************************************
*	Lab 2_1									*
*	Perform this action:							*
*	Multiply the value in r0 by 4, exclusive OR r0 with key in r1		*
*	Use only the instructions provided so far				*
*	REGISTERS: r0, r1							*
*********************************************************************************/
Lab2_1:
	push {r2, r3, r4, r5, lr}

	/**** Your code below here ****/
	//bkpt
	lsl r0, #2
	eor r0, r1
	/**** Your code above here ****/

	pop {r2-r5, pc}

/********************************************************************************
*	Lab 2_2									*
*	Perform this action:							*
*	Take the top byte in r0 and place it in the bottom of r1		*
*	zero extended								*
*********************************************************************************/
Lab2_2:
	push {r2-r5, lr}

	/**** Your code below here ****/
	lsr r1, r0, #24 
	/**** Your code above here ****/

	pop {r2-r5, pc}

/********************************************************************************
*	Lab 2_3									*
*	Perform this action:							*
*	Reverse the value in r0 (host byte order to network byte order)		*
*	E.g. 0x87654321 to 0x21436587						*
*	You may use r0, r1, r2, and r3						*
*********************************************************************************/
Lab2_3:
	push {r1-r5, lr}

	/**** Your code below here ****/
	/*ror r1, r0, #24
	ror r2, r0, #16
	ror r3, r0, #8*/
	
	//ADD r1, r0 #8
	ror r1, r0, #8
	bic r1, #0x00FFFFFF
	ror r2, r0, #16
	bic r2, #0x00FFFFFF
	ror r3, r0, #24
	bic r3, #0x00FFFFFF
	lsr r0, #24
	lsr r3, #16
	lsr r2, #8
	eor r0, r2
	eor r0, r3
	eor r0, r1

	/*
	mov r1, #0
	mov r2, #0
	add r2, r1, r0, lsr #24
	add r2, r1, r0, lsr #16
	add r2, r1, r0, lsr #24
	 
	*/
	/**** Your code above here ****/

	pop {r1-r5, pc}

/****************************************************************************************
*	Lab 2_4										*
*	Perform this action:								*
*	Modify lab 2_1 to use  your own key of 0x41414141 by placing that value in r1	*
*	Remember to only use the instructions you have been provided thus far		*
*****************************************************************************************/
Lab2_4:
	push {r1-r5, lr}

	/**** Your code below here ****/
	movw r1, #0x4141
	movt r1, #0x4141
	/**** Your code above here ****/

        bl Lab2_1
	pop {r1-r5, pc}

/********************************************************************************
*	Lab 3_1									*
*	Perform this action:							*
*	If r0 == 42, r1 = 2, else r1 = 1. If r2 == 42, r3 =1, else r3 = 2	*
*********************************************************************************/
Lab3_1:
	push {lr}

	/**** Your code below here ****/
	
	cmp r0, #42
	beq 1f
	mov r1, #1
	b 2f
	
	1:
		mov r1, #2

	2:
		cmp r2, #42
		bne 3f
		mov r3, #1
		b 4f

	3:
		mov r3, #2

	4:
	/**** Your code above here ****/

	pop {pc}

/********************************************************************************
*	Lab 3_2									* 
*	Perform this action:							*
*	Multiply value in r0 by value in r1 with result in r0			*
*		dont forget the edge cases such as multiplying by 0 or 1	*
*		use only the instructions provided so far			*
*********************************************************************************/
Lab3_2:
	
	push {lr}

	/**** Your code below here ****/
	mov r2, r0

	4:
	cmp r1, #0
	bne 1f
	mov r0, #0
	b 10f

	1:
	cmp r1, #1
	bne 2f
	// if equal r0 stays the same
	b 10f
	2:	
	add r0, r2
	sub r1, #1
	b 4b

	10://end 
	/**** Your code above here ****/

	pop {pc}

/*  STOP HERE - Additional Instruction Before Lab3_3, Lab3_4  */

/****************************************************************************************
*	Lab 3_3										* 
*	Redo Lab 3_1 below utilizing "intrinsic" conditional execution (e.g. MOVEQ etc.)*
*	If r0 == 42, r1 = 2, else r1 = 1. If r2 == 42, r3 =1, else r3 = 2		*	
*****************************************************************************************/
Lab3_3:
	
	push {lr}
	/**** Your code below here ****/
	mov r1, #1
	mov r3, #2

	cmp r0, #42
	moveq r1, #2
	
	cmp r2, #42
	moveq r3, #1
	/**** Your code above here ****/
	pop {pc}

/****************************************************************************************
*	Lab 3_4										* 
*	Utilize the appropriate MSR/MRS instruction to determine exactly which		*
*	bits of the CPSR are writable in user mode					*
*	HINT: This lab will crash your executable, therefore, there is no		*
*	regular test code for it.  You will need to use your GDB tools to 		*
*	identify the correct answers and fill out the appropriate slide...		*
*****************************************************************************************/
Lab3_4:
	
	push {lr}
	/**** Your code below here ****/
	mvn r1, #0
	mrs r0, cpsr
	eor r1, r0
	//msr cpsr_cxsf, r1 

	/**** Your code above here ****/
	pop {pc}

/****************************************************************
*	Lab 4_1							*
*	redo Lab 3_2 using a multiplication instruction		*
*****************************************************************/
Lab4_1:
	push {lr}

	/**** Your code below here ****/
	mul r0, r1
	/**** Your code above here ****/

	pop {pc}

/********************************************************************************
*	Lab 4_2									*
*	Perform this action:							*
*	Divide r0 by r1 with the result in r0 - this is integer division	*
*	Example:  12/5 = 2   							*
*	you do not need to check for division by 0  				*
*********************************************************************************/
Lab4_2:
	stmfd sp!, {r1-r12, lr}

	/**** Your code below here ****/
	mov r2, r0
	mov r0, #0
	
	1:
	cmp r2, r1
	subge r2, r1
	addge r0, #1
	bge 1b

	2: 
	/**** Your code above here ****/

	ldmfd sp!, {r1-r12, pc}

/****************************************************************************************
*	Lab 5_1										*
*	swap r0 and r1 using only those registers and the memory pointed to by r3	*
*****************************************************************************************/
Lab5_1:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	str r0, [r3]
	mov r0, r1
	ldr r1, [r3]
	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/************************************************************************************************
*	Lab 5_2											*
*	Set the byte pointed to by r0 to the value of the lowest byte pointed to by r1		*
*	The rest of the value in r0 must remain the same					*
*************************************************************************************************/
Lab5_2:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	ldrb r2, [r1]
	strb r2, [r0]

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/************************************************************************************************
*	Lab 5_3											*
*	Fill the buffer pointed to by r0 with the byte-sized integers from 0-63 inclusive so	*
*	that a memory dump of [r0] will look like: 00 01 02 03 04....				*
*************************************************************************************************/
Lab5_3:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	mov r1, #0
	mov r2, r0

	1:
	cmp r1, #64
	strblt r1, [r2]
	addlt r1, #1
	addlt r2, #1
	blt 1b 
	

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/********************************************************************************************************
*	Implement strncpy with a small twist - Place the size of the string into the first byte of	*
*	the destination buffer										*
*	- Destination will be in r0									*
*	- Source will be in r1										*
*	- Size of R1 will be in r2.									*
*	Remember to only use the instructions you have been provided thus far				*
*********************************************************************************************************/
Lab5_4:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	mov r3, #0 //src index
	mov r4, r0 //dest addr
	mov r6, #0 //our src byte

	add r4, #1 //move to next index

	1:
	cmp r3, r2 //check index against src size
	bge 2f //if greater than or equal to size, leave
	
	ldrb r6, [r1] //load byte in intermediate if index less than size 
	strb r6, [r4] //store byte in dest (whether null or not)
	cmplt r6, #0 //check if null byte
	beq 2f //if null byte jump to end

	addne r4, #1 //move to next dest addr; 
	addne r1, #1 //move to next src adde
	addne r3, #1 //move to next dest index
	bne 1b
	
	2:
	strb r3, [r0] //put size at first index

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/********************************************************************************
*	Lab 5_5									*
*	rework lab 2_3 with the value to be reversed pointed to in r1		*
*	utilize setend instructioni						*
* 	Reverse the value in r0 (host byte order to network byte order)		*	
*********************************************************************************/
Lab5_5:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	setend be
	ldr r0, [r1]
	setend le
	str r0, [r1]

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/****************************************************************************************
*	Lab 5_6										*
*	Implement strcpy utilizing Pre or Post indexing form of LDX/STX instructions	*
*	r0 will have the address of the destination buffer				*
*	r1 will have the address of the source string					*
*****************************************************************************************/
Lab5_6:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	eor r3, r3 // byte
	
	1:
	ldrb r3, [r1], #1 //load what is in src index into r3, then move to next src byte
	cmp r3, #0
	strb r3, [r0], #1 //Store at dest index what is in r3, the move to next src byte
	bne 1b
	
	

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/************************************************************************************************
*	Lab 5_7											*
*	Transfer a block of data using the ldm/stm instructions and registers r3-r12		*
*	Pointer to destination will be in r0							*
*	Pointer to source will be in r1								*
*	Size in bytes will be in r2								*
*	Data size will be a multiple of 10 words to make it easy				*
*	PRESERVE: all registers                        						*
*************************************************************************************************/
Lab5_7:
	stmfd sp!, {r0-r12, lr}

	/**** Your code below here ****/
	1:
	cmp r2, #0 //compare data counter if 0 bytes left
	ldmiane r1!, {r3-r12} //load data into r3-r12 from r1, change r1
	stmiane r0!, {r3-r12} //store data from r3-r12 into r0, change r0
	subne r2, #40 // decrease bytes left bt 40
	bne 1b
	
	/**** Your code above here ****/
	
	ldmfd sp!, {r0-r12, pc}


/********************************************************************************
*	Lab 5_7_Bonus								*
*	Same as above, but the data size may not be in 10 word chunks.		*
*	Your code should be able to handle any size data, while still		*
*	making use of the ldm/stm instructions for the bulk of the work.	*
*********************************************************************************/
Lab5_7_Bonus:
	stmfd sp!, {r0-r12, lr}

	/**** Your code below here ****/
	1:
	cmp r2, #0 //compare data counter if 0 bytes left
	ldmiagt r1!, {r3-r12} //load data into r3-r12 from r1, change r1
	stmiagt r0!, {r3-r12} //store data from r3-r12 into r0, change r0
	subgt r2, #40 // decrease bytes left bt 40
	bgt 1b

	/**** Your code above here ****/
	
	ldmfd sp!, {r0-r12, pc}

/************************************************************************
*	Lab 6_1								*
*	Exchange r0 and r1 using ONLY push and pop instructions		*
*	PRESERVE:  all but r0 and r1 					*
*************************************************************************/
Lab6_1:
	stmfd sp!, {r4-r12, lr}

	/**** Your code below here ****/
	push {r0}
	push {r1}
	pop {r0}
	pop {r1}

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/********************************************************
*	Lab 6_2						*
*	push r0-r12, then exchange r1 and r2 		*
*	PRESERVE: all but r1 and r2 and ensure		*
*	you leave the stack the way you found it	*
*********************************************************/
Lab6_2:
	stmfd sp!, {r4-r12, lr}
	/**** Your code below here ****/
	push {r0-r12}
	pop {r0}
	pop {r2}
	pop {r1}
	pop {r3-r12}

	/**** Your code above here ****/

	ldmfd sp!, {r4-r12, pc}

/****************************************************************
*	Lab 6_3							*
*	remove 0x100 bytes from the top of the stack		*
*	preserve all but SP					*
*	If done incorrectly, you will likely crash!		*
*****************************************************************/
Lab6_3:

	/**** Your code below here ****/
	add sp, #0x100
	mov pc, lr
	/**** Your code above here ****/

/********************************************************************************************************
*	Lab7_1												*
*	Mode changes...write a simple function to change modes to Thumb from ARM			*
*	Confirm that you have changed modes by examining the CPSR register while stepping		*
*	through the function.  Return to ARM mode upon exit. 						*
*	From here on - you are responsible for preserving the appropriate registers!		 	*
*	Bonus - make mode changes using arithmetic instructions						*
*													*
*********************************************************************************************************/
Lab7_1:
	/**** Your code below here ****/
	push {r4-r12, lr}
/*may need a directive here*/
	from_arm_to_thumb:
	blx to_thumb
	to_thumb:
	.thumb
	.align 2
	blx to_arm
	to_arm:
	
/* probably need to massage things here */
	.arm
	.align 4
	pop {r4-r12, pc}
	/**** Your code above here ****/

/****************************************************************************************
*	Lab 7_2										*
*	Mode changes...Redo Lab3_1 in Thumb mode.					*
*		Lab 3_1									*
*		Perform this action:							*
*		If r0 == 42, r1 = 2, else r1 = 1. If r2 == 42, r3 =1, else r3 = 2	*
*****************************************************************************************/
Lab7_2:

	/**** Your code below here ****/
	push {r4-r12, lr}
	blx 1f
	1://to_thumb
	.thumb
	.align 2
	/*mov r0, #1
	mov r1, #1
	cmp r0, r1
	it eq
	addeq r0, #1

	mov r0, r0*/
	cmp.w r0, #42
	ite eq
	moveq r1, #1
	movne r1, #2
	
	cmp.w r2, #42
	ite eq
	moveq r3, #2
	movne r3, #1

	blx 2f
	2://to_arm:
	.arm
	.align 4
	pop {r4-r12, pc}	

/*may need a directive here*/

/* probably need to massage things here */

	/**** Your code above here ****/

/********************************************************************************************************
*	Lab7_3												*
*	Write to stdout by executing a system call.							*
*	Your buffer is at the symbol string_7_3.  Standard file descriptors - 1 is stdout		*
* 	Syscall numbers are found in asm/unistd.h							*
*********************************************************************************************************/
Lab7_3:
	
	/**** Your code below here ****/
	push {r4-r12, lr}
	mov r0, #1
	ldr r1, =string_7_3
	ldr r2, =string_7_3_size
	mov r7, #4
	svc 0

	pop {r4-r12, pc}
	/**** Your code above here ****/
	

string_7_3:
	.ascii "--->Lab 7_3 Passed!\n"
	.set string_7_3_size, .-string_7_3
	.align 4


Function1:
	push {r4, r11, lr}
	add r11, sp, #8
	
	add r0, r1
	sub r0, r2
	eor r0, r3
	ldr r4, [r11, #4]
	mul r0, r4

	sub sp, r11, #8
	pop {r4, r11, lr}
	bx lr

/********************************************************************************************************
*	Lab7_4												*
*	You have been passed 5 numbers according to the ARM calling convention				*	
*	Call the function: Function1(int a, int b, int c, int d, int e) in your code.			*
*	Call the function with the values you have been passed.						*
*	Take the value it returns and multiply it by 4							*
*	and return the result										*
*													*
*	If you get stuck, look at Function1 for guidance on convention					*
*********************************************************************************************************/
Lab7_4:
	/**** Your code below here ****/
	/*push {r4-r12, lr}
	add r11, sp, #48
	sub sp, #4
	ldr sp, [r11], #4
	
	bl Function1
	mov r1, #4
	mul r0, r1
	pop {r4-r12, pc}*/

	/**** Your code above here ****/


message:
	.asciz "Hello ARM World %d!\n"
	.align 4

	
/********************************************************************************************************
*	Lab 8_1												*
*	Use the appropriate manual to research instructions to use to accomplish the following:		*
*	copy 32 bits each from r0 and r1 to vector register d0 and r2, r3 to d1.  			*
*													*
*	In one instruction, add each 8 bit vector component together.  Return the results		*
*	to r0 and r1.  You will need to use NEON instructions.  					*
*********************************************************************************************************/
Lab8_1:

	/**** Your code below here ****/
	push {r4-r12, lr}
	vmov d0, r0, r1

	vmov d1, r2, r3

	vadd.i8 d0, d0, d1
	vmov r0, r1, d0
	pop {r4-r13, pc}

	/**** Your code above here ****/


/*********************************************************************************************************
*	Lab 9_1	                                                                                         *
*	Write a function that takes as a single argument (N) and returns the Nth fibonacci number.       *
*	Assume the sequence starts at 0, and is 1-based (that is, the first number is 0, the second is   *
*	1, and there is no 0th number).  				 		       		 *
**********************************************************************************************************/
.align 4
Lab9_1:
	/**** Your code below here ****/
	/**** Your code above here ****/



/********************************************************************************************************
*	Lab 9_2	
*	Write a function that takes as a single argument (N) and returns the sum of the natural numbers
*	from 0 to N that are multiples of both 3 and 5.  Bonus if you only use add/sub (no mul/divide)
**********************************************************************************************************/
Lab9_2:
	/**** Your code below here ****/
	
	/**** Your code above here ****/



/********************************************************************************************************
	Lab 9_3
	Write a function that takes as arguments:
	1) an integer N representing the length of
	2) a pointer to an array of integers.
	Return the largest product of five consecutive integers.
  	Worded another way: find the largest product of five consecutive
	integers within an N-length array of integers.
*********************************************************************************************************/
Lab9_3:
	/**** Your code below here ****/

	/**** Your code above here ****/

