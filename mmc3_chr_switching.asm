;;; it's gonna emulate 8k CHR CN-ROM banking
;;; by MMC3 assuming that CN-ROM CHR #BANK stored in X
;;; ~116 cpu's ticks required
;;; compiled obj size: 77 bytes
PHA ; store A ; 3
TYA ; A = Y ; 2
PHA ; store Y ; 3
TXA ; A = X ; 2
;
ASL A ; ; 2
ASL A ; ; 2
ASL A ; ; 2
;
LDY #$00 ; select 2 KB CHR bank at PPU $0000-$07FF (#0) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$00 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
AND #$18 ; ; 2
;
INY ; select 2 KB CHR bank at PPU $0800-$0FFF (#1) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$02 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
AND #$18 ; ; 2
;
INY ; select 1 KB CHR bank at PPU $1000-$13FF (#2) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$04 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
AND #$18 ; ; 2
;
INY ; select 1 KB CHR bank at PPU $1400-$17FF (#3) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$05 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
AND #$18 ; ; 2
;
INY ; select 1 KB CHR bank at PPU $1800-$1BFF (#4) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$06 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
AND #$18 ; ; 2
;
INY ; select Select 1 KB CHR bank at PPU $1C00-$1FFF (#5) ; 2
STY $8000 ; issue MMC3 bank select ; 4
ORA #$07 ; fill bank page data ; 2
STA $8001 ; set new bank value ; 4
;
PLA ; restore Y ; 4
TAY ; restore Y ; 2
PLA ; restore A ; 4
CLC ; ; 2
RTS ; ; 6
