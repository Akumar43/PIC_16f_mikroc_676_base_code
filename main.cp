#line 1 "E:/startup_codes/pic16f676/PIC_16f_mikroc_676_base_code_0.0/main.c"
#line 1 "e:/startup_codes/pic16f676/pic_16f_mikroc_676_base_code_0.0/interrupt.h"
extern void InitTimer0();
extern void InitTimer1();
#line 1 "e:/startup_codes/pic16f676/pic_16f_mikroc_676_base_code_0.0/board.h"
void port_init(void) ;
#line 14 "E:/startup_codes/pic16f676/PIC_16f_mikroc_676_base_code_0.0/main.c"
volatile int port_a =0x00;

void main()
{
extern int pulse_width;
InitTimer0();
InitTimer1();
Adc_init();
port_init();

while(1)
 {
 pulse_width =30;
  ((port_a) ^= 1 << 0) ;
 delay_ms(100);

 if( (((PORTA) & (1 << (3)) ) ? 1 : 0) )
 {
  ((port_a) |= (1 << (1)) )  ;
 }
 else
 {
  ((port_a) &= ~ (1 << (1)) )  ;
 }

 if(ADC_Read(7) > 512)
 {
  ((port_a) |= (1 << (4)) )  ;
 }
 else
 {
  ((port_a) &= ~ (1 << (4)) )  ;
 }
 PORTA = port_a;
 }
}
