
_port_init:

;board.c,2 :: 		void port_init(void)
;board.c,4 :: 		TRISC=0x00;
	CLRF       TRISC+0
;board.c,5 :: 		TRISA=0x00;
	CLRF       TRISA+0
;board.c,6 :: 		PORTC=0x00;
	CLRF       PORTC+0
;board.c,7 :: 		ANSEL=0b00000000;    // use ansel to change
	CLRF       ANSEL+0
;board.c,8 :: 		SET_BIT(ANSEL,7) ;   // setting a bit as analogue  // this pin will not act as GPIO and acts like a analogue pin
	MOVLW      128
	MOVWF      ANSEL+0
;board.c,9 :: 		SET_BIT(TRISC,3) ;     // analogue pin is set to output before analog read
	BSF        TRISC+0, 3
;board.c,10 :: 		}
L_end_port_init:
	RETURN
; end of _port_init
