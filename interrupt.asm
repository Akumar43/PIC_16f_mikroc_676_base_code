
_InitTimer0:

;interrupt.c,5 :: 		void InitTimer0(){
;interrupt.c,6 :: 		OPTION_REG         = 0x82;
	MOVLW      130
	MOVWF      OPTION_REG+0
;interrupt.c,7 :: 		TMR0                 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;interrupt.c,8 :: 		INTCON         = 0xA0;
	MOVLW      160
	MOVWF      INTCON+0
;interrupt.c,9 :: 		}
L_end_InitTimer0:
	RETURN
; end of _InitTimer0

_InitTimer1:

;interrupt.c,16 :: 		void InitTimer1(){
;interrupt.c,17 :: 		T1CON	 = 0x01;
	MOVLW      1
	MOVWF      T1CON+0
;interrupt.c,18 :: 		TMR1IF_bit	 = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;interrupt.c,19 :: 		TMR1H	 = 0xFC;
	MOVLW      252
	MOVWF      TMR1H+0
;interrupt.c,20 :: 		TMR1L	 = 0x18;
	MOVLW      24
	MOVWF      TMR1L+0
;interrupt.c,21 :: 		TMR1IE_bit	 = 1;
	BSF        TMR1IE_bit+0, BitPos(TMR1IE_bit+0)
;interrupt.c,22 :: 		INTCON	 = 0xC0;
	MOVLW      192
	MOVWF      INTCON+0
;interrupt.c,23 :: 		TMR1ON_bit =1;                             // need to be added in extra... doesnt generate from timer generator
	BSF        TMR1ON_bit+0, BitPos(TMR1ON_bit+0)
;interrupt.c,24 :: 		}
L_end_InitTimer1:
	RETURN
; end of _InitTimer1

_Interrupt:
	MOVWF      R15+0
	SWAPF      STATUS+0, 0
	CLRF       STATUS+0
	MOVWF      ___saveSTATUS+0
	MOVF       PCLATH+0, 0
	MOVWF      ___savePCLATH+0
	CLRF       PCLATH+0

;interrupt.c,28 :: 		void Interrupt(){
;interrupt.c,29 :: 		if (TMR0IF_bit){
	BTFSS      TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
	GOTO       L_Interrupt0
;interrupt.c,30 :: 		TMR0IF_bit         = 0;
	BCF        TMR0IF_bit+0, BitPos(TMR0IF_bit+0)
;interrupt.c,31 :: 		TMR0                 = 6;
	MOVLW      6
	MOVWF      TMR0+0
;interrupt.c,32 :: 		PORTC=~PORTC;
	COMF       PORTC+0, 1
;interrupt.c,33 :: 		}
L_Interrupt0:
;interrupt.c,35 :: 		if (TMR1IF_bit){
	BTFSS      TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
	GOTO       L_Interrupt1
;interrupt.c,36 :: 		TMR1IF_bit = 0;
	BCF        TMR1IF_bit+0, BitPos(TMR1IF_bit+0)
;interrupt.c,37 :: 		TMR1H	 = 0xFC;
	MOVLW      252
	MOVWF      TMR1H+0
;interrupt.c,38 :: 		TMR1L	 = 0x18;
	MOVLW      24
	MOVWF      TMR1L+0
;interrupt.c,39 :: 		i=i++;
	INCF       _i+0, 1
	BTFSC      STATUS+0, 2
	INCF       _i+1, 1
;interrupt.c,40 :: 		if(i<pulse_width)
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pulse_width+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt13
	MOVF       _pulse_width+0, 0
	SUBWF      _i+0, 0
L__Interrupt13:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt2
;interrupt.c,41 :: 		PORTA |= 1 << 2;  //setting a bit
	BSF        PORTA+0, 2
	GOTO       L_Interrupt3
L_Interrupt2:
;interrupt.c,43 :: 		else if((i>=pulse_width) && (i< 255))
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	XORWF      _pulse_width+1, 0
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt14
	MOVF       _pulse_width+0, 0
	SUBWF      _i+0, 0
L__Interrupt14:
	BTFSS      STATUS+0, 0
	GOTO       L_Interrupt6
	MOVLW      128
	XORWF      _i+1, 0
	MOVWF      R0+0
	MOVLW      128
	SUBWF      R0+0, 0
	BTFSS      STATUS+0, 2
	GOTO       L__Interrupt15
	MOVLW      255
	SUBWF      _i+0, 0
L__Interrupt15:
	BTFSC      STATUS+0, 0
	GOTO       L_Interrupt6
L__Interrupt8:
;interrupt.c,44 :: 		PORTA &= ~(1 << 2);
	BCF        PORTA+0, 2
	GOTO       L_Interrupt7
L_Interrupt6:
;interrupt.c,47 :: 		i=0;
	CLRF       _i+0
	CLRF       _i+1
L_Interrupt7:
L_Interrupt3:
;interrupt.c,48 :: 		}
L_Interrupt1:
;interrupt.c,50 :: 		}
L_end_Interrupt:
L__Interrupt12:
	MOVF       ___savePCLATH+0, 0
	MOVWF      PCLATH+0
	SWAPF      ___saveSTATUS+0, 0
	MOVWF      STATUS+0
	SWAPF      R15+0, 1
	SWAPF      R15+0, 0
	RETFIE
; end of _Interrupt

interrupt____?ag:

L_end_interrupt___?ag:
	RETURN
; end of interrupt____?ag
