	.file	"ParseJson.c"
	.text
	.section	.rodata
	.align 8
.LC0:
	.string	"You must include an directory and file path to a valid JSON file as the second argument to the command."
	.text
	.globl	main
	.type	main, @function
main:
.LFB6:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	subq	$32, %rsp
	movl	%edi, -20(%rbp)
	movq	%rsi, -32(%rbp)
	movl	$10, %edi
	call	putchar@PLT
	cmpl	$1, -20(%rbp)
	jne	.L2
	leaq	.LC0(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L3
.L2:
	movq	-32(%rbp), %rdx
	movl	-20(%rbp), %eax
	movq	%rdx, %rsi
	movl	%eax, %edi
	call	ParseArgs
	movl	%eax, -4(%rbp)
	cmpl	$0, -4(%rbp)
	je	.L4
	movl	-4(%rbp), %eax
	jmp	.L3
.L4:
	movl	$0, %eax
.L3:
	leave
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE6:
	.size	main, .-main
	.section	.rodata
.LC1:
	.string	"r"
	.align 8
.LC2:
	.string	"Directory must be enclosed in brackets"
.LC3:
	.string	"%s"
	.align 8
.LC4:
	.string	"Could not locate or read file provided as argument."
	.text
	.globl	ParseArgs
	.type	ParseArgs, @function
ParseArgs:
.LFB7:
	.cfi_startproc
	endbr64
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset 6, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register 6
	pushq	%r15
	pushq	%r14
	pushq	%r13
	pushq	%r12
	pushq	%rbx
	subq	$88, %rsp
	.cfi_offset 15, -24
	.cfi_offset 14, -32
	.cfi_offset 13, -40
	.cfi_offset 12, -48
	.cfi_offset 3, -56
	movl	%edi, -100(%rbp)
	movq	%rsi, -112(%rbp)
	movq	%fs:40, %rax
	movq	%rax, -56(%rbp)
	xorl	%eax, %eax
	movq	%rsp, %rax
	movq	%rax, %r13
	movq	-112(%rbp), %rax
	addq	$8, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movq	%rax, %rbx
	movq	%rbx, %rax
	subq	$1, %rax
	movq	%rax, -80(%rbp)
	movq	%rbx, -128(%rbp)
	movq	$0, -120(%rbp)
	movq	%rbx, %r14
	movl	$0, %r15d
	movl	$16, %eax
	subq	$1, %rax
	addq	%rbx, %rax
	movl	$16, %ecx
	movl	$0, %edx
	divq	%rcx
	imulq	$16, %rax, %rax
	movq	%rax, %rdx
	andq	$-4096, %rdx
	movq	%rsp, %rcx
	subq	%rdx, %rcx
	movq	%rcx, %rdx
.L6:
	cmpq	%rdx, %rsp
	je	.L7
	subq	$4096, %rsp
	orq	$0, 4088(%rsp)
	jmp	.L6
.L7:
	movq	%rax, %rdx
	andl	$4095, %edx
	subq	%rdx, %rsp
	movq	%rax, %rdx
	andl	$4095, %edx
	testq	%rdx, %rdx
	je	.L8
	andl	$4095, %eax
	subq	$8, %rax
	addq	%rsp, %rax
	orq	$0, (%rax)
.L8:
	movq	%rsp, %rax
	addq	$0, %rax
	movq	%rax, -72(%rbp)
	movl	$1, -84(%rbp)
	jmp	.L9
.L19:
	movl	$0, -88(%rbp)
	jmp	.L10
.L18:
	cmpl	$1, -84(%rbp)
	jne	.L11
	movq	-72(%rbp), %rax
	movq	%rbx, %rdx
	movl	$0, %esi
	movq	%rax, %rdi
	call	memset@PLT
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rdx
	movq	-72(%rbp), %rax
	movq	%rdx, %rsi
	movq	%rax, %rdi
	call	strcpy@PLT
	movq	-72(%rbp), %rax
	leaq	.LC1(%rip), %rsi
	movq	%rax, %rdi
	call	fopen@PLT
	movq	%rax, -64(%rbp)
	cmpq	$0, -64(%rbp)
	je	.L12
	movl	$0, -92(%rbp)
	jmp	.L13
.L16:
	cmpl	$0, -92(%rbp)
	jne	.L14
	movq	-72(%rbp), %rax
	movzbl	(%rax), %eax
	cmpb	$34, %al
	je	.L14
	leaq	.LC2(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movl	$-1, %eax
	jmp	.L15
.L14:
	addl	$1, -92(%rbp)
.L13:
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	movl	%eax, %ecx
	movq	-64(%rbp), %rdx
	movq	-72(%rbp), %rax
	movl	%ecx, %esi
	movq	%rax, %rdi
	call	fgets@PLT
	testq	%rax, %rax
	jne	.L16
	movq	-72(%rbp), %rax
	movq	%rax, %rsi
	leaq	.LC3(%rip), %rdi
	movl	$0, %eax
	call	printf@PLT
	movq	-64(%rbp), %rax
	movq	%rax, %rdi
	call	fclose@PLT
	movl	$0, %eax
	jmp	.L15
.L12:
	leaq	.LC4(%rip), %rdi
	call	puts@PLT
	movl	$-1, %eax
	jmp	.L15
.L11:
	addl	$1, -88(%rbp)
.L10:
	movl	-88(%rbp), %eax
	movslq	%eax, %r12
	movl	-84(%rbp), %eax
	cltq
	leaq	0(,%rax,8), %rdx
	movq	-112(%rbp), %rax
	addq	%rdx, %rax
	movq	(%rax), %rax
	movq	%rax, %rdi
	call	strlen@PLT
	cmpq	%rax, %r12
	jb	.L18
	movl	$10, %edi
	call	putchar@PLT
	addl	$1, -84(%rbp)
.L9:
	movl	-84(%rbp), %eax
	cmpl	-100(%rbp), %eax
	jl	.L19
	movl	$10, %edi
	call	putchar@PLT
	movl	$0, %eax
.L15:
	movq	%r13, %rsp
	movq	-56(%rbp), %rcx
	xorq	%fs:40, %rcx
	je	.L21
	call	__stack_chk_fail@PLT
.L21:
	leaq	-40(%rbp), %rsp
	popq	%rbx
	popq	%r12
	popq	%r13
	popq	%r14
	popq	%r15
	popq	%rbp
	.cfi_def_cfa 7, 8
	ret
	.cfi_endproc
.LFE7:
	.size	ParseArgs, .-ParseArgs
	.ident	"GCC: (Ubuntu 9.4.0-1ubuntu1~20.04.2) 9.4.0"
	.section	.note.GNU-stack,"",@progbits
	.section	.note.gnu.property,"a"
	.align 8
	.long	 1f - 0f
	.long	 4f - 1f
	.long	 5
0:
	.string	 "GNU"
1:
	.align 8
	.long	 0xc0000002
	.long	 3f - 2f
2:
	.long	 0x3
3:
	.align 8
4:
