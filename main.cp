#line 1 "E:/startup_codes/pic16f676/main.c"
#line 1 "e:/startup_codes/pic16f676/interrupt.h"
extern void InitTimer0();
extern void InitTimer1();
#line 1 "e:/startup_codes/pic16f676/board.h"
void port_init(void) ;
#line 10 "E:/startup_codes/pic16f676/main.c"
void main()
{
extern int pulse_width;
InitTimer0();
InitTimer1();
Port_init();
Adc_init();
 while(1)
 {
 pulse_width =30;
  PORTA.f0 =~ PORTA.f0 ;
 delay_ms(100);


 if( (((PORTA) & (1 << (3)) ) ? 1 : 0) )
 {
  ((PORTA) |= (1 << (1)) )  ;
 }
 else
 {
  ((PORTA) &= ~ (1 << (1)) )  ;
 }

 if(ADC_Read(7) > 512)
 {
  ((PORTA) |= (1 << (4)) )  ;
 }
 else
 {
  ((PORTA) &= ~ (1 << (4)) )  ;
 }



 }
}
