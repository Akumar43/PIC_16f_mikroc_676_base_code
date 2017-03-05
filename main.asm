
_main:

;main.c,10 :: 		void main()
;main.c,13 :: 		InitTimer0();
	CALL       _InitTimer0+0
;main.c,14 :: 		InitTimer1();
	CALL       _InitTimer1+0
;main.c,15 :: 		Port_init();
	CALL       _port_init+0
;main.c,16 :: 		Adc_init();
	CALL       _ADC_Init+0
;main.c,17 :: 		while(1)
L_main0:
;main.c,19 :: 		pulse_width =30;  // setting the pusle width here
	MOVLW      30
	MOVWF      _pulse_width+0
	MOVLW      0
	MOVWF      _pulse_width+1
;main.c,20 :: 		BLINK_CHK_PIN=~BLINK_CHK_PIN;     // blink check
	MOVLW      1
	XORWF      PORTA+0, 1
;main.c,21 :: 		delay_ms(100);
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
;main.c,24 :: 		if(TEST_BIT(PORTA,3))       // using PORTA.f3 MCLR latched pin / this PIn cannot be used for output
	BTFSS      PORTA+0, 3
	GOTO       L_main3
	MOVLW      1
	MOVWF      ?FLOC___mainT5+0
	GOTO       L_main4
L_main3:
	CLRF       ?FLOC___mainT5+0
L_main4:
	MOVF       ?FLOC___mainT5+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;main.c,26 :: 		SET_BIT(PORTA,1) ;
	BSF        PORTA+0, 1
;main.c,27 :: 		}
	GOTO       L_main6
L_main5:
;main.c,30 :: 		CLEAR_BIT(PORTA,1) ;
	BCF        PORTA+0, 1
;main.c,31 :: 		}
L_main6:
;main.c,33 :: 		if(ADC_Read(7) > 512)        // ADC cheeck
	MOVLW      7
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	MOVF       R0+1, 0
	SUBLW      2
	BTFSS      STATUS+0, 2
	GOTO       L__main10
	MOVF       R0+0, 0
	SUBLW      0
L__main10:
	BTFSC      STATUS+0, 0
	GOTO       L_main7
;main.c,35 :: 		SET_BIT(PORTA,4) ;
	BSF        PORTA+0, 4
;main.c,36 :: 		}
	GOTO       L_main8
L_main7:
;main.c,39 :: 		CLEAR_BIT(PORTA,4) ;
	BCF        PORTA+0, 4
;main.c,40 :: 		}
L_main8:
;main.c,44 :: 		}
	GOTO       L_main0
;main.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
