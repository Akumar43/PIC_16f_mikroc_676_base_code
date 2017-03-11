#line 1 "E:/startup_codes/pic16f676/Github_upload/PIC_16f_mikroc_676_base_code/main.c"
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/lib_code.h"
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/interrupt.h"
extern void InitTimer0();
extern void InitTimer1();
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/board.h"



extern void port_init(void) ;
extern void protocol_init();
#line 13 "E:/startup_codes/pic16f676/Github_upload/PIC_16f_mikroc_676_base_code/main.c"
volatile int port_a =0x00;
void main()
{
extern int pulse_width;
protocol_init();
port_init();

while(1)
 {
 pulse_width =30;
  ((port_a) ^= 1 << 0) ;
 delay_ms(100);

 if( ( (((PORTA) & (1 << (3)) ) ? 1 : 0) ) )
 {
  { if ( 1 ) { (( port_a ) |= (1 << (1)) ) ; } else { (( port_a ) &= ~ (1 << (1)) ) ; } } ;
 }
 else
 {
  { if ( 0 ) { (( port_a ) |= (1 << (1)) ) ; } else { (( port_a ) &= ~ (1 << (1)) ) ; } } ;
 }

 if(  (ADC_Read( 7 )) * ( ( 5000f  / 1023f ) ) * ( 1f ) * ( ( ( 100f  + 100f ) / 100f  ) )  > 5000)
 {
  { if (1) { (( port_a ) |= (1 << (4)) ) ; } else { (( port_a ) &= ~ (1 << (4)) ) ; } }  ;
 }
 else
 {
  { if (0) { (( port_a ) |= (1 << (4)) ) ; } else { (( port_a ) &= ~ (1 << (4)) ) ; } }  ;
 }
 PORTA = port_a;
 }
}
