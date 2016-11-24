#pragma once 

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <time.h>
#include <stdint.h>
#include <drivers/gpio.h>

#define CLOCKID CLOCK_REALTIME
#define SIG SIGRTMIN
#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                       } while (0)

/**************************************Declarations for compatibility*******************************/

typedef struct {} TIM_TypeDef;


typedef struct {
	uint8_t channel;
	TIM_TypeDef *tim;                   //If using edison, redundant
	GPIO_TypeDef* gpio;
} timerHardware_t;


typedef uint16_t captureCompare_t;        // 16 bit on both 103 and 303, just register access must be 32bit sometimes (use timCCR_t)

struct timerCCHandlerRec_s;
struct timerOvrHandlerRec_s;

typedef void timerCCHandlerCallback(struct timerCCHandlerRec_s* self, uint16_t capture);
typedef void timerOvrHandlerCallback(struct timerOvrHandlerRec_s* self, uint16_t capture);

typedef struct timerCCHandlerRec_s {
    timerCCHandlerCallback* fn;
} timerCCHandlerRec_t;

typedef struct timerOvrHandlerRec_s {
    timerOvrHandlerCallback* fn;
    struct timerOvrHandlerRec_s* next;
} timerOvrHandlerRec_t;
/*typedef struct 
{
} TIM_ICInitTypeDef;
*/
/**************************************End of Declarations*******************************/

typedef struct timer_info_s									//struct to hold timer specific data
{
  timer_t* timerID;						
  int timer_enabled;  					
  timerCCHandlerRec_t* callback;  							//This is where the callback function is stored
  uint16_t period;
}timer_info_t;

typedef enum                    //Defining enum for mode for edison
{
    ONE_SHOT,
    PERIODIC
} TIMER_MODE;

//configure callback
void timerChCCHandlerInit(timerCCHandlerRec_t *self, timerCCHandlerCallback *fn);       

//internal functions
static void handler(int sig, siginfo_t *si, void *uc);
void setup_sigaction(struct sigaction* sa, sigset_t* mask);
void timercreate(timer_t* timerid, struct sigevent* sev, void (* handler)(int, siginfo_t*, void*), timer_info_t* timer_info);
void timer_start(struct itimerspec* its, timer_t* timerid, float freq, int mode);
void timer_info_init(timer_info_t* timer_info, void (* timer_handler)(timerCCHandlerRec_t* cbRec, captureCompare_t capture));

//callback, freq, mode
//mode = 0 => one shot
//mode = 1 => periodic timer
void start_timer(void (*timerspecific_handler)(timerCCHandlerRec_t* cbRec, captureCompare_t capture), float freq, uint16_t period, int mode);