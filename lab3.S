    .section .note.GNU-stack,""
    .text

    .global abs_value
abs_value:
    mov %rdi, %rax
    cmp $0, %rax
    jge abs_done
    neg %rax
abs_done:
    ret

    .global power2
power2:
    push %rbx
    push %r12
    push %r13
    mov %rdi, %r13
    mov $1, %rbx
    mov $0, %r12
power2_print:
    mov %rbx, %rdi
    call print_uint64
    cmp %r13, %r12
    je power2_done
    add %rbx, %rbx
    add $1, %r12
    jmp power2_print
power2_done:
    pop %r13
    pop %r12
    pop %rbx
    ret

    .global hailstone_length
hailstone_length:
    mov $0, %rax
hailstone_loop:
    cmp $1, %rdi
    je hailstone_done
    add $1, %rax
    mov %rdi, %rcx
    and $1, %rcx
    jz hailstone_even
    imul $3, %rdi
    add $1, %rdi
    jmp hailstone_loop
hailstone_even:
    shr $1, %rdi
    jmp hailstone_loop
hailstone_done:
    ret
