#line 1 "E:/startup_codes/pic16f676/board.c"
#line 1 "e:/startup_codes/pic16f676/board.h"
void port_init(void) ;
#line 2 "E:/startup_codes/pic16f676/board.c"
void port_init(void)
{
 TRISC=0x00;
 TRISA=0x00;
 PORTA=0x00;
 PORTC=0x00;

 ANSEL=0b00000000;
 ((ANSEL) |= (1 << (7)) )  ;
 ((TRISC) |= (1 << (3)) )  ;
}