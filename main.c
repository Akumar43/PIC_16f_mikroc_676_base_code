///---------------project settings------------------------------------
// NOTE: DOnt forget to disable MCLR pin
// dont forget to put internal oscillator or two pins cannot be used
// internal oscillator is 4MHz remember
///---------------project settings------------------------------------
#include "interrupt.h"
#include "board.h"
#define BLINK_CHK_PIN                   PORTA.f0 // f0 used for blick check in main loop
#define PWM_PIN                         PORTA.f2 // f0 used for pwm
#define BUTTON_PUSH                    PORTA.f3  //button pin
#define ANALOG_INDIC                   PORTA.f4  //ADC indication
#define ADC_PIN                        PORTC.f3   /// ADC sense PIN

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
   pulse_width =30;                                                // setting the pusle width here
   TOGGLE_BIT(port_a,0);                                          // blink check
   delay_ms(100);

   if(TEST_BIT(PORTA,3))       // using PORTA.f3 MCLR latched pin / this PIn cannot be used for output
   {
    SET_BIT(port_a,1) ;
   }
   else
   {
      CLEAR_BIT(port_a,1) ;
   }

   if(ADC_Read(7) > 512)        // ADC cheeck
   {
     SET_BIT(port_a,4) ;
   }
   else
   {
     CLEAR_BIT(port_a,4) ;
   }
   PORTA = port_a;
 }
}