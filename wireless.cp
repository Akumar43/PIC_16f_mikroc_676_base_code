#line 1 "E:/startup_codes/pic16f676/wireless.c"
#line 1 "e:/startup_codes/pic16f676/interrupt.h"
extern void InitTimer0();
#line 1 "e:/startup_codes/pic16f676/board.h"
#line 6 "E:/startup_codes/pic16f676/wireless.c"
void main()
{
InitTimer0();
ANSEL=0b00000000;
 ((ANSEL) |= (1 << (7)) )  ;


 TRISC=0x00;
 TRISA=0x00;
 PORTA=0x00;
 PORTC=0x00;
 while(1)
 {
 PORTA.f0=~PORTA.f0;
 delay_ms(100);

 if( (((PORTA) & (1 << (3)) ) ? 1 : 0) )
 {
  ((PORTA) |= (1 << (1)) )  ;
 }
 else
 {
  ((PORTA) &= ~ (1 << (1)) )  ;
 }
 }
}
