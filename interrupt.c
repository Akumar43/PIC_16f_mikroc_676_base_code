int i=0;
int pulse_width =75;
//Timer0
//Prescaler 1:8; TMR0 Preload = 6; Actual Interrupt Time : 1 ms
void InitTimer0(){
  OPTION_REG         = 0x82;
  TMR0                 = 6;
  INTCON         = 0xA0;
}

//Timer1      ------------------ 2000 Hz----------------------------
//Prescaler 1:1; TMR1 Preload = 64536; Actual Interrupt Time : 500 us
//---------------------PWM Generation-------------------------------

//Place/Copy this part in declaration section
void InitTimer1(){
  T1CON         = 0x01;
  TMR1IF_bit         = 0;
  TMR1H         = 0xFC;
  TMR1L         = 0x18;
  TMR1IE_bit         = 1;
  INTCON         = 0xC0;
  TMR1ON_bit =1;                             // need to be added in extra... doesnt generate from timer generator
}

//---------------------Interrupt Routines------------------------------

void Interrupt(){
  if (TMR0IF_bit){
    TMR0IF_bit         = 0;
    TMR0                 = 6;
    PORTC.f0=~PORTC.f0;
  }

    if (TMR1IF_bit){
    TMR1IF_bit = 0;
    TMR1H         = 0xFC;
    TMR1L         = 0x18;
    i=i++;
    if(i<pulse_width)
        PORTC |= 1 << 5;  //setting a bit
        
    else if((i>=pulse_width) && (i< 255))
       PORTC &= ~(1 << 5);
        
    else
        i=0;
  }

}