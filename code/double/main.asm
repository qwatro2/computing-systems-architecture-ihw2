.include "macrolib.asm"

.text
	.globl main
    main:
        print_str("Enter 0 to exit, 1 to run the program or 2 to run the tests: ")
        input_int(t2)  # input command

        li t0 1
        li t1 2

        beqz t2 jal_exit  # if t2 == 0 go to exit
        beq t2 t0 jal_user  # if t2 == 1 go to user input
        beq t2 t1 jal_test  # if t2 == 2 go to running tests

        print_str("Wrong choice. You should enter number 0, 1 or 2.\n")  # else wrong command was chosen

        j main  # repeat solution

    jal_exit:
        j exit  # go to exit

    jal_user:
        jal run_user  # call function for user input
        j main  # repeat solution

    jal_test:
        jal run_test  # call function for running tests
        j main  # repeat solution

    exit:  # exit
        li a7 10
        ecall
