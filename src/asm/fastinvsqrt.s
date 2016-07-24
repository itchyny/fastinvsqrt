fmt0:	.string	"%f"
fmt1:	.string	"%f\n"

.globl	main
main:
	pushl	%ebp
	movl	%esp, %ebp
	andl	$-16, %esp
	subl	$32, %esp
	jmp	.L4
.L5:
	movl	28(%esp), %eax
	movl	%eax, (%esp)
	call	fastInvSqrt
	fstpl	4(%esp)
	movl	$fmt1, (%esp)
	call	printf
.L4:
	leal	28(%esp), %eax
	movl	%eax, 4(%esp)
	movl	$fmt0, (%esp)
	call	__isoc99_scanf
	cmpl	$-1, %eax
	jne	.L5
	movl	$0, %eax
	leave
	ret

fastInvSqrt:
	pushl	%ebp
	movl	%esp, %ebp
	subl	$8, %esp
	movd	8(%ebp), %xmm0
	rsqrtps	%xmm0, %xmm0
	movd	%xmm0, -4(%ebp)
	flds	-4(%ebp)
	leave
	ret
