
_port_init:

;board.c,5 :: 		void port_init(void)
;board.c,7 :: 		TRISC=0x00;
	CLRF       TRISC+0
;board.c,8 :: 		TRISA=0x00;
	CLRF       TRISA+0
;board.c,9 :: 		PORTC=0x00;
	CLRF       PORTC+0
;board.c,10 :: 		ANSEL=0b00000000;    // use ansel to change
	CLRF       ANSEL+0
;board.c,11 :: 		SET_BIT(ANSEL,7) ;   // setting a bit as analogue  // this pin will not act as GPIO and acts like a analogue pin
	MOVLW      128
	MOVWF      ANSEL+0
;board.c,12 :: 		SET_BIT(TRISC,3) ;     // analogue pin is set to output before analog read
	BSF        TRISC+0, 3
;board.c,13 :: 		}
L_end_port_init:
	RETURN
; end of _port_init

_protocol_init:

;board.c,15 :: 		void protocol_init()
;board.c,17 :: 		InitTimer0();
	CALL       _InitTimer0+0
;board.c,18 :: 		InitTimer1();
	CALL       _InitTimer1+0
;board.c,19 :: 		Port_init();
	CALL       _port_init+0
;board.c,20 :: 		Adc_init();
	CALL       _ADC_Init+0
;board.c,21 :: 		}
L_end_protocol_init:
	RETURN
; end of _protocol_init
