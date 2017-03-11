
_main:

;main.c,16 :: 		void main()
;main.c,19 :: 		InitTimer0();
	CALL       _InitTimer0+0
;main.c,20 :: 		InitTimer1();
	CALL       _InitTimer1+0
;main.c,21 :: 		Adc_init();
	CALL       _ADC_Init+0
;main.c,22 :: 		port_init();
	CALL       _port_init+0
;main.c,24 :: 		while(1)
L_main0:
;main.c,26 :: 		pulse_width =30;                                                // setting the pusle width here
	MOVLW      30
	MOVWF      _pulse_width+0
	MOVLW      0
	MOVWF      _pulse_width+1
;main.c,27 :: 		TOGGLE_BIT(port_a,0);                                          // blink check
	MOVLW      1
	XORWF      _port_a+0, 1
	MOVLW      0
	XORWF      _port_a+1, 1
;main.c,28 :: 		delay_ms(100);
	MOVLW      130
	MOVWF      R12+0
	MOVLW      221
	MOVWF      R13+0
L_main2:
	DECFSZ     R13+0, 1
	GOTO       L_main2
	DECFSZ     R12+0, 1
	GOTO       L_main2
	NOP
	NOP
;main.c,30 :: 		if(TEST_BIT(PORTA,3))       // using PORTA.f3 MCLR latched pin / this PIn cannot be used for output
	BTFSS      PORTA+0, 3
	GOTO       L_main3
	MOVLW      1
	MOVWF      ?FLOC___mainT2+0
	GOTO       L_main4
L_main3:
	CLRF       ?FLOC___mainT2+0
L_main4:
	MOVF       ?FLOC___mainT2+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main5
;main.c,32 :: 		SET_BIT(port_a,1) ;
	BSF        _port_a+0, 1
;main.c,33 :: 		}
	GOTO       L_main6
L_main5:
;main.c,36 :: 		CLEAR_BIT(port_a,1) ;
	BCF        _port_a+0, 1
;main.c,37 :: 		}
L_main6:
;main.c,39 :: 		if(ADC_Read(7) > 512)        // ADC cheeck
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
;main.c,41 :: 		SET_BIT(port_a,4) ;
	BSF        _port_a+0, 4
;main.c,42 :: 		}
	GOTO       L_main8
L_main7:
;main.c,45 :: 		CLEAR_BIT(port_a,4) ;
	BCF        _port_a+0, 4
;main.c,46 :: 		}
L_main8:
;main.c,47 :: 		PORTA = port_a;
	MOVF       _port_a+0, 0
	MOVWF      PORTA+0
;main.c,48 :: 		}
	GOTO       L_main0
;main.c,49 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
