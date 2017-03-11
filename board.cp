#line 1 "E:/startup_codes/pic16f676/Github_upload/PIC_16f_mikroc_676_base_code/board.c"
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/board.h"



extern void port_init(void) ;
extern void protocol_init();
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/lib_code.h"
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/interrupt.h"
extern void InitTimer0();
extern void InitTimer1();
#line 1 "e:/startup_codes/pic16f676/github_upload/pic_16f_mikroc_676_base_code/board.h"



extern void port_init(void) ;
extern void protocol_init();
#line 5 "E:/startup_codes/pic16f676/Github_upload/PIC_16f_mikroc_676_base_code/board.c"
void port_init(void)
{
 TRISC=0x00;
 TRISA=0x00;
 PORTC=0x00;
 ANSEL=0b00000000;
 ((ANSEL) |= (1 << (7)) )  ;
 ((TRISC) |= (1 << (3)) )  ;
}

void protocol_init()
{
 InitTimer0();
 InitTimer1();
 Port_init();
 Adc_init();
}
