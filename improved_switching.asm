;;; it's gonna emulate 8k CHR CN-ROM banking
;;; by MMC3 assuming that CN-ROM CHR #BANK stored in X
;;; ~160 cpu's ticks required
;;; compiled to 77 bytes
PHA ; store A ; 3
TYA ; A = Y ; 2
PHA ; store Y ; 3
TXA ; A = X ; 2
;
ASL A ; ; 2
ASL A ; ; 2
ASL A ; ; 2
;
LDY #$00 ; ; 2
BSLCT:
    STY $8000 ; issue MMC3 bank select ; 4
    ORA bank_data,Y ; fill bank page data ; 4+
    STA $8001 ; set new bank value ; 4
    AND #$18 ; ; 2
    INY ; select CHR bank (Y) ; 2
    CPY $#06 ; 2
    BNE BSLCT ; 2-4
;
PLA ; restore Y ; 4
TAY ; restore Y ; 2
PLA ; restore A ; 4
CLC ; ; 2
RTS ; ; 6
;
bank_data:
    dcb 0, 2, 4, 5, 6, 7;
;
