#include "board.h"
void port_init(void)
{
 TRISC=0x00;
 TRISA=0x00;
 PORTC=0x00;
 ANSEL=0b00000000;    // use ansel to change
SET_BIT(ANSEL,7) ;   // setting a bit as analogue  // this pin will not act as GPIO and acts like a analogue pin
SET_BIT(TRISC,3) ;     // analogue pin is set to output before analog read
}