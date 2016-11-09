#ifndef TIMER_SETUP_H
#define TIMER_SETUP_H
#endif

#include <stdlib.h>
#include <unistd.h>
#include <stdio.h>
#include <signal.h>
#include <time.h>

#define CLOCKID CLOCK_REALTIME
#define SIG SIGRTMIN
#define errExit(msg)    do { perror(msg); exit(EXIT_FAILURE); \
                       } while (0)

typedef struct timer_info_s									//struct to hold timer specific data
{
  timer_t* timerID;						
  int timer_enabled;  					
  void (*timerspecific_handler)();							//This is where the callback function is stored
}timer_info_t;

static void handler(int sig, siginfo_t *si, void *uc);
void setup_sigaction(struct sigaction* sa, sigset_t* mask);
void timercreate(timer_t* timerid, struct sigevent* sev, void (* handler)(int, siginfo_t*, void*), timer_info_t* timer_info);
void timer_start(struct itimerspec* its, timer_t* timerid, float freq, int mode);
void timer_info_init(timer_info_t* timer_info, void (* timer_handler)());
void start_timer(void (*timerspecific_handler)(void), float freq, int mode);			//callback, freq, mode
																						//mode = 0 => one shot
																						//mode = 1 => periodic timer