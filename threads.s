	.text
	.file	"threads.cpp"
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function __cxx_global_var_init
	.type	__cxx_global_var_init,@function
__cxx_global_var_init:                  # @__cxx_global_var_init
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	leaq	_ZStL8__ioinit(%rip), %rdi
	callq	_ZNSt8ios_base4InitC1Ev@PLT
	movq	_ZNSt8ios_base4InitD1Ev@GOTPCREL(%rip), %rdi
	leaq	_ZStL8__ioinit(%rip), %rsi
	leaq	__dso_handle(%rip), %rdx
	callq	__cxa_atexit@PLT
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end0:
	.size	__cxx_global_var_init, .Lfunc_end0-__cxx_global_var_init
	.cfi_endproc
                                        # -- End function
	.text
	.globl	_Z13calculate_sumPv             # -- Begin function _Z13calculate_sumPv
	.p2align	4, 0x90
	.type	_Z13calculate_sumPv,@function
_Z13calculate_sumPv:                    # @_Z13calculate_sumPv
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movq	%rdi, -8(%rbp)
	movq	-8(%rbp), %rax
	movl	(%rax), %eax
	movl	%eax, -12(%rbp)
	movq	_ZSt4cerr@GOTPCREL(%rip), %rdi
	leaq	.L.str(%rip), %rsi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	-12(%rbp), %esi
	callq	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	callq	_ZNSolsEPFRSoS_E@PLT
	movl	$0, -16(%rbp)
	imull	$10000, -12(%rbp), %eax         # imm = 0x2710
	movl	%eax, -20(%rbp)
.LBB1_1:                                # =>This Inner Loop Header: Depth=1
	movl	-20(%rbp), %eax
	movl	-12(%rbp), %ecx
	addl	$1, %ecx
	imull	$10000, %ecx, %ecx              # imm = 0x2710
	cmpl	%ecx, %eax
	jge	.LBB1_4
# %bb.2:                                #   in Loop: Header=BB1_1 Depth=1
	movslq	-20(%rbp), %rcx
	leaq	arr(%rip), %rax
	movl	(%rax,%rcx,4), %eax
	addl	-16(%rbp), %eax
	movl	%eax, -16(%rbp)
# %bb.3:                                #   in Loop: Header=BB1_1 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB1_1
.LBB1_4:
	movl	-16(%rbp), %eax
	addl	sum(%rip), %eax
	movl	%eax, sum(%rip)
	xorl	%eax, %eax
                                        # kill: def $rax killed $eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end1:
	.size	_Z13calculate_sumPv, .Lfunc_end1-_Z13calculate_sumPv
	.cfi_endproc
                                        # -- End function
	.globl	main                            # -- Begin function main
	.p2align	4, 0x90
	.type	main,@function
main:                                   # @main
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	subq	$32, %rsp
	movl	$0, -4(%rbp)
	movl	$0, -8(%rbp)
.LBB2_1:                                # =>This Inner Loop Header: Depth=1
	cmpl	$1000000, -8(%rbp)              # imm = 0xF4240
	jge	.LBB2_4
# %bb.2:                                #   in Loop: Header=BB2_1 Depth=1
	movslq	-8(%rbp), %rcx
	leaq	arr(%rip), %rax
	movl	$1, (%rax,%rcx,4)
# %bb.3:                                #   in Loop: Header=BB2_1 Depth=1
	movl	-8(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -8(%rbp)
	jmp	.LBB2_1
.LBB2_4:
	movl	$400, %edi                      # imm = 0x190
	callq	_Znam@PLT
	movq	%rax, -16(%rbp)
	movl	$0, -20(%rbp)
.LBB2_5:                                # =>This Inner Loop Header: Depth=1
	cmpl	$100, -20(%rbp)
	jge	.LBB2_8
# %bb.6:                                #   in Loop: Header=BB2_5 Depth=1
	movl	-20(%rbp), %edx
	movq	-16(%rbp), %rax
	movslq	-20(%rbp), %rcx
	movl	%edx, (%rax,%rcx,4)
	movslq	-20(%rbp), %rax
	leaq	threads(%rip), %rdi
	shlq	$3, %rax
	addq	%rax, %rdi
	movq	-16(%rbp), %rcx
	movslq	-20(%rbp), %rax
	shlq	$2, %rax
	addq	%rax, %rcx
	xorl	%eax, %eax
	movl	%eax, %esi
	leaq	_Z13calculate_sumPv(%rip), %rdx
	callq	pthread_create@PLT
# %bb.7:                                #   in Loop: Header=BB2_5 Depth=1
	movl	-20(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -20(%rbp)
	jmp	.LBB2_5
.LBB2_8:
	movl	$0, -24(%rbp)
.LBB2_9:                                # =>This Inner Loop Header: Depth=1
	cmpl	$100, -24(%rbp)
	jge	.LBB2_12
# %bb.10:                               #   in Loop: Header=BB2_9 Depth=1
	movslq	-24(%rbp), %rcx
	leaq	threads(%rip), %rax
	movq	(%rax,%rcx,8), %rdi
	xorl	%eax, %eax
	movl	%eax, %esi
	callq	pthread_join@PLT
# %bb.11:                               #   in Loop: Header=BB2_9 Depth=1
	movl	-24(%rbp), %eax
	addl	$1, %eax
	movl	%eax, -24(%rbp)
	jmp	.LBB2_9
.LBB2_12:
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	leaq	.L.str.1(%rip), %rsi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	sum(%rip), %esi
	callq	_ZNSolsEi@PLT
	movq	%rax, %rdi
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	callq	_ZNSolsEPFRSoS_E@PLT
	movq	_ZSt4cout@GOTPCREL(%rip), %rdi
	leaq	.L.str.2(%rip), %rsi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movl	sum(%rip), %ecx
	leaq	.L.str.4(%rip), %rsi
	leaq	.L.str.3(%rip), %rax
	cmpl	$1000000, %ecx                  # imm = 0xF4240
	cmoveq	%rax, %rsi
	callq	_ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc@PLT
	movq	%rax, %rdi
	movq	_ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_@GOTPCREL(%rip), %rsi
	callq	_ZNSolsEPFRSoS_E@PLT
	xorl	%eax, %eax
	addq	$32, %rsp
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end2:
	.size	main, .Lfunc_end2-main
	.cfi_endproc
                                        # -- End function
	.section	.text.startup,"ax",@progbits
	.p2align	4, 0x90                         # -- Begin function _GLOBAL__sub_I_threads.cpp
	.type	_GLOBAL__sub_I_threads.cpp,@function
_GLOBAL__sub_I_threads.cpp:             # @_GLOBAL__sub_I_threads.cpp
	.cfi_startproc
# %bb.0:
	pushq	%rbp
	.cfi_def_cfa_offset 16
	.cfi_offset %rbp, -16
	movq	%rsp, %rbp
	.cfi_def_cfa_register %rbp
	callq	__cxx_global_var_init
	popq	%rbp
	.cfi_def_cfa %rsp, 8
	retq
.Lfunc_end3:
	.size	_GLOBAL__sub_I_threads.cpp, .Lfunc_end3-_GLOBAL__sub_I_threads.cpp
	.cfi_endproc
                                        # -- End function
	.type	_ZStL8__ioinit,@object          # @_ZStL8__ioinit
	.local	_ZStL8__ioinit
	.comm	_ZStL8__ioinit,1,1
	.hidden	__dso_handle
	.type	arr,@object                     # @arr
	.bss
	.globl	arr
	.p2align	4
arr:
	.zero	4000000
	.size	arr, 4000000

	.type	sum,@object                     # @sum
	.globl	sum
	.p2align	2
sum:
	.long	0                               # 0x0
	.size	sum, 4

	.type	threads,@object                 # @threads
	.globl	threads
	.p2align	4
threads:
	.zero	800
	.size	threads, 800

	.type	.L.str,@object                  # @.str
	.section	.rodata.str1.1,"aMS",@progbits,1
.L.str:
	.asciz	"num="
	.size	.L.str, 5

	.type	.L.str.1,@object                # @.str.1
.L.str.1:
	.asciz	"Sum : "
	.size	.L.str.1, 7

	.type	.L.str.2,@object                # @.str.2
.L.str.2:
	.asciz	"Is sum corect: "
	.size	.L.str.2, 16

	.type	.L.str.3,@object                # @.str.3
.L.str.3:
	.asciz	"Yes"
	.size	.L.str.3, 4

	.type	.L.str.4,@object                # @.str.4
.L.str.4:
	.asciz	"No"
	.size	.L.str.4, 3

	.section	.init_array,"aw",@init_array
	.p2align	3
	.quad	_GLOBAL__sub_I_threads.cpp
	.ident	"Ubuntu clang version 14.0.0-1ubuntu1.1"
	.section	".note.GNU-stack","",@progbits
	.addrsig
	.addrsig_sym __cxx_global_var_init
	.addrsig_sym __cxa_atexit
	.addrsig_sym _Z13calculate_sumPv
	.addrsig_sym _ZStlsISt11char_traitsIcEERSt13basic_ostreamIcT_ES5_PKc
	.addrsig_sym _ZNSolsEi
	.addrsig_sym _ZNSolsEPFRSoS_E
	.addrsig_sym _ZSt4endlIcSt11char_traitsIcEERSt13basic_ostreamIT_T0_ES6_
	.addrsig_sym _Znam
	.addrsig_sym pthread_create
	.addrsig_sym pthread_join
	.addrsig_sym _GLOBAL__sub_I_threads.cpp
	.addrsig_sym _ZStL8__ioinit
	.addrsig_sym __dso_handle
	.addrsig_sym arr
	.addrsig_sym sum
	.addrsig_sym threads
	.addrsig_sym _ZSt4cerr
	.addrsig_sym _ZSt4cout
