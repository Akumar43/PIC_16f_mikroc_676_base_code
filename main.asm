
_main:

;main.c,14 :: 		void main()
;main.c,17 :: 		protocol_init();
	CALL       _protocol_init+0
;main.c,18 :: 		port_init();
	CALL       _port_init+0
;main.c,20 :: 		while(1)
L_main0:
;main.c,22 :: 		pulse_width =30;                                                // setting the pusle width here
	MOVLW      30
	MOVWF      _pulse_width+0
	MOVLW      0
	MOVWF      _pulse_width+1
;main.c,23 :: 		TOGGLE_BIT(port_a,0);                                          // blink check
	MOVLW      1
	XORWF      _port_a+0, 1
	MOVLW      0
	XORWF      _port_a+1, 1
;main.c,24 :: 		delay_ms(100);
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
;main.c,26 :: 		if(BUTTON())       // using PORTA.f3 MCLR latched pin / this PIn cannot be used for output
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
;main.c,28 :: 		BUT_LED_TEST(SET_BIT_1);
	BSF        _port_a+0, 1
L_main7:
;main.c,29 :: 		}
	GOTO       L_main8
L_main5:
;main.c,32 :: 		BUT_LED_TEST(CLEAR_BIT_0);
L_main9:
	BCF        _port_a+0, 1
;main.c,33 :: 		}
L_main8:
;main.c,35 :: 		if( VOLT_DIV_MEASURE_CH1() > 5000)   // value in milli volts
	MOVLW      7
	MOVWF      FARG_ADC_Read_channel+0
	CALL       _ADC_Read+0
	CALL       _word2double+0
	MOVLW      26
	MOVWF      R4+0
	MOVLW      103
	MOVWF      R4+1
	MOVLW      28
	MOVWF      R4+2
	MOVLW      129
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVLW      0
	MOVWF      R4+0
	MOVLW      0
	MOVWF      R4+1
	MOVLW      0
	MOVWF      R4+2
	MOVLW      128
	MOVWF      R4+3
	CALL       _Mul_32x32_FP+0
	MOVF       R0+0, 0
	MOVWF      R4+0
	MOVF       R0+1, 0
	MOVWF      R4+1
	MOVF       R0+2, 0
	MOVWF      R4+2
	MOVF       R0+3, 0
	MOVWF      R4+3
	MOVLW      0
	MOVWF      R0+0
	MOVLW      64
	MOVWF      R0+1
	MOVLW      28
	MOVWF      R0+2
	MOVLW      139
	MOVWF      R0+3
	CALL       _Compare_Double+0
	MOVLW      1
	BTFSC      STATUS+0, 0
	MOVLW      0
	MOVWF      R0+0
	MOVF       R0+0, 0
	BTFSC      STATUS+0, 2
	GOTO       L_main11
;main.c,37 :: 		ADC_LED_TEST(1) ;
	BSF        _port_a+0, 4
L_main13:
;main.c,38 :: 		}
	GOTO       L_main14
L_main11:
;main.c,41 :: 		ADC_LED_TEST(0) ;
L_main15:
	BCF        _port_a+0, 4
;main.c,42 :: 		}
L_main14:
;main.c,43 :: 		PORTA = port_a;
	MOVF       _port_a+0, 0
	MOVWF      PORTA+0
;main.c,44 :: 		}
	GOTO       L_main0
;main.c,45 :: 		}
L_end_main:
	GOTO       $+0
; end of _main
