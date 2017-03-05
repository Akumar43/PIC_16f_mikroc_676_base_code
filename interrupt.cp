#line 1 "E:/startup_codes/pic16f676/interrupt.c"
int i=0;
int pulse_width =75;


void InitTimer0(){
 OPTION_REG = 0x82;
 TMR0 = 6;
 INTCON = 0xA0;
}






void InitTimer1(){
 T1CON = 0x01;
 TMR1IF_bit = 0;
 TMR1H = 0xFC;
 TMR1L = 0x18;
 TMR1IE_bit = 1;
 INTCON = 0xC0;
 TMR1ON_bit =1;
}



void Interrupt(){
 if (TMR0IF_bit){
 TMR0IF_bit = 0;
 TMR0 = 6;
 PORTC=~PORTC;
 }

 if (TMR1IF_bit){
 TMR1IF_bit = 0;
 TMR1H = 0xFC;
 TMR1L = 0x18;
 i=i++;
 if(i<pulse_width)
 PORTA |= 1 << 2;

 else if((i>=pulse_width) && (i< 255))
 PORTA &= ~(1 << 2);

 else
 i=0;
 }

}
