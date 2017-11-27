opt f-g-h+l+o+
;F - fill the space between memory areas with $FF /255
;G - Atari 5200 mode for hardware register abbreviations
;H - generate Atari executable headers
;L - write to the listing
;O - write to the object file
;U - warn of unused labels

org $1000 ;ORG - change value of the origin counter

start equ *

lda <text ;load the hex value low/high byte of a 16-bit word constant.
; czyli laduje 00?
sta $80 ;store value of a register in memory location 80
lda >text ;high byte
sta $81
ldy #0
lda #$a5 ; load value A5 H 165 DEC 10100101 B
jsr binary ; jump to subroutine

lda <text
ldx >text
jsr $ff80 ;65 408
brk

binary sta byte
ldx #7
bitslp lda #'0'
asl byte ;ASL (Arithmetic Shift Left)
bcc pr ;BCC (Branch on Carry Clear)
lda #'1'
pr sta ($80),y ;the zero page address is dereferenced, and the Y register is added to the resulting address.
iny
dex
bpl bitslp ;BPL (Branch on PLus) 
rts ; return from subroutine

byte dta b(0)

org $2000
text equ *
dta b(0),b(0),b(0),b(0)
dta b(0),b(0),b(0),b(0)
dta b(10) ; '\n'
dta b(0)

org $2E0
dta a(start)

end of file