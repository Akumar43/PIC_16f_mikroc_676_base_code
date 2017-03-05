
_main:

;wireless.c,6 :: 		void main()
;wireless.c,8 :: 		InitTimer0();
	CALL       _InitTimer0+0
;wireless.c,9 :: 		ANSEL=0b00000000;    // use ansel to change
	CLRF       ANSEL+0
;wireless.c,10 :: 		SET_BIT(ANSEL,7) ;   // setting a bit as analogue
	MOVLW      128
	MOVWF      ANSEL+0
;wireless.c,13 :: 		TRISC=0x00;
	CLRF       TRISC+0
;wireless.c,14 :: 		TRISA=0x00;
	CLRF       TRISA+0
;wireless.c,15 :: 		PORTA=0x00;
	CLRF       PORTA+0
;wireless.c,16 :: 		PORTC=0x00;
	CLRF       PORTC+0
;wireless.c,17 :: 		while(1)
L_main0:
;wireless.c,19 :: 		PORTA.f0=~PORTA.f0;
	MOVLW      1
	XORWF      PORTA+0, 1
;wireless.c,20 :: 		delay_ms(100);
	MOVLW      2
	MOVWF      R11+0
	MOVLW      4
	MOVWF      R12+0
	MOVLW      186
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	DECFSZ     R11+0, 1
	GOTO       L_main2
	NOP
;wireless.c,22 :: 		if(TEST_BIT(PORTA,3))
	BTFSS      PORTA+0, 3
	GOTO       L_main3
	MOVLW      1
	MOVWF      ?FLOC___mainT6+0
	GOTO       L_main4
L_main3:
	CLRF       ?FLOC___mainT6+0
L_main4:
	MOVF       ?FLOC___mainT6+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;wireless.c,24 :: 		SET_BIT(PORTA,1) ;
	BSF        PORTA+0, 1
;wireless.c,25 :: 		}
	GOTO       L_main6
L_main5:
;wireless.c,28 :: 		CLEAR_BIT(PORTA,1) ;
	BCF        PORTA+0, 1
;wireless.c,29 :: 		}
L_main6:
;wireless.c,30 :: 		}
	GOTO       L_main0
;wireless.c,31 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
