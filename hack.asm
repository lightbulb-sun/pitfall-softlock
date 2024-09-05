CUR_CONTROL_SCHEME = $ff0081

    org 0
    incbin "pitfall.md"

    ; first jump
    org $1355f2
            jsr     my_code

    ; second jump
    org $135606
            jsr     my_code

    org $1e7f00
my_code:
            move.b  CUR_CONTROL_SCHEME, d0
.check_if_b_is_jump
            cmpi.b  #0, d0
            beq     .b_is_jump
            cmpi.b  #3, d0
            beq     .b_is_jump
.check_if_c_is_jump
            cmpi.b  #2, d0
            beq     .c_is_jump
.a_is_jump
            st      $ff4100
            rts
.b_is_jump
            st      $ff4101
            rts
.c_is_jump
            st      $ff4102
            rts
