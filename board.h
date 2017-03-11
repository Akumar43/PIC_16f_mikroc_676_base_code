//
// FYI---to save code space floats can be removed with hardcode int values
//
extern void port_init(void) ;
extern void protocol_init();
#ifndef BOARD_H
#define BOARD_H


//-------------------Hardware Mappings-------------------//

//-------------------MCU PIN Mappings-------MCU_DEPENDENT------------//
#define MCU_OPER_VOLT			5000f			// voltage in millivolt
#define MCU_ADC_RANGE			1023f

#define BUTTON()            		        (TEST_BIT(PORTA,3))

#define VOLT_DIV_CH1            		7	//ADC_PIN
#define VOLT_OPAMP_CH1            		6	//ADC_PIN

#define BUT_LED_TEST_PIN            		1	//ADC_PIN
#define BUT_LED_TEST_PORT            		port_a	//ADC_PIN

#define ADC_LED_TEST_PIN            		4	//ADC_PIN
#define ADC_LED_TEST_PORT            		port_a	//ADC_PIN

//----------------HARDWARE_CONNECTION-------ELECTRICAL DEPENDENT------------

#define R1_CH1				100f				// resistance must be in ohm
#define R_SENSE_CH1			100f				// resistance must be in ohm
#define CORRECTION_X_CH1		1f

#define RF_CH1				1000f			// resistance must be in ohm
#define R1_OPM_CH1			1000f			// resistance must be in ohm

//----------------PORT_UPDATES----------MCU INDEPENDENT---------
#define BUT_LED_TEST(BUT_FLAG)            \
                                         	{\
							if (BUT_FLAG)\
							{\
							 SET_BIT(BUT_LED_TEST_PORT,BUT_LED_TEST_PIN);\
							}\
							else\
							{\
							CLEAR_BIT(BUT_LED_TEST_PORT,BUT_LED_TEST_PIN);\
							}	\
						}

#define ADC_LED_TEST(ADC_FLAG)            \
						{\
							if (ADC_FLAG)\
							{\
                                                            SET_BIT(ADC_LED_TEST_PORT,ADC_LED_TEST_PIN);\
							}\
							else\
							{\
                                                            CLEAR_BIT(ADC_LED_TEST_PORT,ADC_LED_TEST_PIN);\
							}	\
						}

//----------------ELECTRICAL_CALCULATION---------mcU INDEPENDENT---------
#define ELEC_FACTOR_CH1				( (R_SENSE_CH1 + R1_CH1) / R_SENSE_CH1 )
#define MCU_FACTOR				( MCU_OPER_VOLT / MCU_ADC_RANGE)

#define	OP_AMP_FACTOR_CH1				(1+(RF_CH1/R1_OPM_CH1)

#define VOLT_DIV_MEASURE_CH1()		(ADC_Read(VOLT_DIV_CH1))  *  (MCU_FACTOR) * (CORRECTION_X_CH1) * (ELEC_FACTOR_CH1)
#define VOLT_OPAMP_MEASURE_CH1()	(ADC_Read(VOLT_OPAMP_CH1)) * (OP_AMP_FACTOR_CH1) * (MCU_FACTOR) * 	(CORRECTION_X_OPAMP)

//---------------------------------------------------------


#endif