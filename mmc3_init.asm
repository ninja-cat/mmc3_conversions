;;;
; perform mmc3 init
STA $E000 ; IRQ disable
LDA #$00 ;
STA $A000 ; Mirroring: vertical
LDA #$06 ; 
STA $8000 ; Select 8 KB PRG ROM bank at $8000-$9FFF 
LDA #$00 ;
STA $8001; 
LDA #$07 ;
STA $8000 ; Select 8 KB PRG ROM bank at $A000-$BFFF
LDA #$01 ;
STA $8001 ;
JMP $8000 ;
