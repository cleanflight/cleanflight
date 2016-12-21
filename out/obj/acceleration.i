# 1 "src/main/sensors/acceleration.c"
# 1 "/home/aravind/git/cleanflight//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/main/sensors/acceleration.c"
# 18 "src/main/sensors/acceleration.c"
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 19 "src/main/sensors/acceleration.c" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 25 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/features.h" 1 3 4
# 367 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 1 3 4
# 410 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 411 "/usr/include/x86_64-linux-gnu/sys/cdefs.h" 2 3 4
# 368 "/usr/include/features.h" 2 3 4
# 391 "/usr/include/features.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 1 3 4
# 10 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/gnu/stubs-64.h" 1 3 4
# 11 "/usr/include/x86_64-linux-gnu/gnu/stubs.h" 2 3 4
# 392 "/usr/include/features.h" 2 3 4
# 26 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
# 36 "/usr/include/stdint.h" 3 4

# 36 "/usr/include/stdint.h" 3 4
typedef signed char int8_t;
typedef short int int16_t;
typedef int int32_t;

typedef long int int64_t;







typedef unsigned char uint8_t;
typedef unsigned short int uint16_t;

typedef unsigned int uint32_t;



typedef unsigned long int uint64_t;
# 65 "/usr/include/stdint.h" 3 4
typedef signed char int_least8_t;
typedef short int int_least16_t;
typedef int int_least32_t;

typedef long int int_least64_t;






typedef unsigned char uint_least8_t;
typedef unsigned short int uint_least16_t;
typedef unsigned int uint_least32_t;

typedef unsigned long int uint_least64_t;
# 90 "/usr/include/stdint.h" 3 4
typedef signed char int_fast8_t;

typedef long int int_fast16_t;
typedef long int int_fast32_t;
typedef long int int_fast64_t;
# 103 "/usr/include/stdint.h" 3 4
typedef unsigned char uint_fast8_t;

typedef unsigned long int uint_fast16_t;
typedef unsigned long int uint_fast32_t;
typedef unsigned long int uint_fast64_t;
# 119 "/usr/include/stdint.h" 3 4
typedef long int intptr_t;


typedef unsigned long int uintptr_t;
# 134 "/usr/include/stdint.h" 3 4
typedef long int intmax_t;
typedef unsigned long int uintmax_t;
# 10 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 2 3 4
# 20 "src/main/sensors/acceleration.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 328 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef int wchar_t;
# 33 "/usr/include/stdlib.h" 2 3 4








# 1 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 1 3 4
# 50 "/usr/include/x86_64-linux-gnu/bits/waitflags.h" 3 4
typedef enum
{
  P_ALL,
  P_PID,
  P_PGID
} idtype_t;
# 42 "/usr/include/stdlib.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 1 3 4
# 64 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 3 4
# 1 "/usr/include/endian.h" 1 3 4
# 36 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/endian.h" 1 3 4
# 37 "/usr/include/endian.h" 2 3 4
# 60 "/usr/include/endian.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned char __u_char;
typedef unsigned short int __u_short;
typedef unsigned int __u_int;
typedef unsigned long int __u_long;


typedef signed char __int8_t;
typedef unsigned char __uint8_t;
typedef signed short int __int16_t;
typedef unsigned short int __uint16_t;
typedef signed int __int32_t;
typedef unsigned int __uint32_t;

typedef signed long int __int64_t;
typedef unsigned long int __uint64_t;







typedef long int __quad_t;
typedef unsigned long int __u_quad_t;
# 121 "/usr/include/x86_64-linux-gnu/bits/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/typesizes.h" 1 3 4
# 122 "/usr/include/x86_64-linux-gnu/bits/types.h" 2 3 4


typedef unsigned long int __dev_t;
typedef unsigned int __uid_t;
typedef unsigned int __gid_t;
typedef unsigned long int __ino_t;
typedef unsigned long int __ino64_t;
typedef unsigned int __mode_t;
typedef unsigned long int __nlink_t;
typedef long int __off_t;
typedef long int __off64_t;
typedef int __pid_t;
typedef struct { int __val[2]; } __fsid_t;
typedef long int __clock_t;
typedef unsigned long int __rlim_t;
typedef unsigned long int __rlim64_t;
typedef unsigned int __id_t;
typedef long int __time_t;
typedef unsigned int __useconds_t;
typedef long int __suseconds_t;

typedef int __daddr_t;
typedef int __key_t;


typedef int __clockid_t;


typedef void * __timer_t;


typedef long int __blksize_t;




typedef long int __blkcnt_t;
typedef long int __blkcnt64_t;


typedef unsigned long int __fsblkcnt_t;
typedef unsigned long int __fsblkcnt64_t;


typedef unsigned long int __fsfilcnt_t;
typedef unsigned long int __fsfilcnt64_t;


typedef long int __fsword_t;

typedef long int __ssize_t;


typedef long int __syscall_slong_t;

typedef unsigned long int __syscall_ulong_t;



typedef __off64_t __loff_t;
typedef __quad_t *__qaddr_t;
typedef char *__caddr_t;


typedef long int __intptr_t;


typedef unsigned int __socklen_t;
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 29 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4






# 1 "/usr/include/x86_64-linux-gnu/bits/byteswap-16.h" 1 3 4
# 36 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 2 3 4
# 44 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline unsigned int
__bswap_32 (unsigned int __bsx)
{
  return __builtin_bswap32 (__bsx);
}
# 108 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
static __inline __uint64_t
__bswap_64 (__uint64_t __bsx)
{
  return __builtin_bswap64 (__bsx);
}
# 61 "/usr/include/endian.h" 2 3 4
# 65 "/usr/include/x86_64-linux-gnu/bits/waitstatus.h" 2 3 4

union wait
  {
    int w_status;
    struct
      {

 unsigned int __w_termsig:7;
 unsigned int __w_coredump:1;
 unsigned int __w_retcode:8;
 unsigned int:16;







      } __wait_terminated;
    struct
      {

 unsigned int __w_stopval:8;
 unsigned int __w_stopsig:8;
 unsigned int:16;






      } __wait_stopped;
  };
# 43 "/usr/include/stdlib.h" 2 3 4
# 67 "/usr/include/stdlib.h" 3 4
typedef union
  {
    union wait *__uptr;
    int *__iptr;
  } __WAIT_STATUS __attribute__ ((__transparent_union__));
# 95 "/usr/include/stdlib.h" 3 4


typedef struct
  {
    int quot;
    int rem;
  } div_t;



typedef struct
  {
    long int quot;
    long int rem;
  } ldiv_t;







__extension__ typedef struct
  {
    long long int quot;
    long long int rem;
  } lldiv_t;


# 139 "/usr/include/stdlib.h" 3 4
extern size_t __ctype_get_mb_cur_max (void) __attribute__ ((__nothrow__ , __leaf__)) ;




extern double atof (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern int atoi (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;

extern long int atol (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





__extension__ extern long long int atoll (const char *__nptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;





extern double strtod (const char *__restrict __nptr,
        char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern float strtof (const char *__restrict __nptr,
       char **__restrict __endptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern long double strtold (const char *__restrict __nptr,
       char **__restrict __endptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern long int strtol (const char *__restrict __nptr,
   char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

extern unsigned long int strtoul (const char *__restrict __nptr,
      char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));




__extension__
extern long long int strtoq (const char *__restrict __nptr,
        char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtouq (const char *__restrict __nptr,
           char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





__extension__
extern long long int strtoll (const char *__restrict __nptr,
         char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

__extension__
extern unsigned long long int strtoull (const char *__restrict __nptr,
     char **__restrict __endptr, int __base)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));

# 305 "/usr/include/stdlib.h" 3 4
extern char *l64a (long int __n) __attribute__ ((__nothrow__ , __leaf__)) ;


extern long int a64l (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1))) ;




# 1 "/usr/include/x86_64-linux-gnu/sys/types.h" 1 3 4
# 27 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4






typedef __u_char u_char;
typedef __u_short u_short;
typedef __u_int u_int;
typedef __u_long u_long;
typedef __quad_t quad_t;
typedef __u_quad_t u_quad_t;
typedef __fsid_t fsid_t;




typedef __loff_t loff_t;



typedef __ino_t ino_t;
# 60 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __dev_t dev_t;




typedef __gid_t gid_t;




typedef __mode_t mode_t;




typedef __nlink_t nlink_t;




typedef __uid_t uid_t;





typedef __off_t off_t;
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;




typedef __ssize_t ssize_t;





typedef __daddr_t daddr_t;
typedef __caddr_t caddr_t;





typedef __key_t key_t;
# 132 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/time.h" 1 3 4
# 57 "/usr/include/time.h" 3 4


typedef __clock_t clock_t;



# 73 "/usr/include/time.h" 3 4


typedef __time_t time_t;



# 91 "/usr/include/time.h" 3 4
typedef __clockid_t clockid_t;
# 103 "/usr/include/time.h" 3 4
typedef __timer_t timer_t;
# 133 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4
# 146 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 147 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



typedef unsigned long int ulong;
typedef unsigned short int ushort;
typedef unsigned int uint;
# 200 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef unsigned int u_int8_t __attribute__ ((__mode__ (__QI__)));
typedef unsigned int u_int16_t __attribute__ ((__mode__ (__HI__)));
typedef unsigned int u_int32_t __attribute__ ((__mode__ (__SI__)));
typedef unsigned int u_int64_t __attribute__ ((__mode__ (__DI__)));

typedef int register_t __attribute__ ((__mode__ (__word__)));
# 219 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/sys/select.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/select.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/select.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 23 "/usr/include/x86_64-linux-gnu/bits/select.h" 2 3 4
# 31 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/sigset.h" 3 4
typedef int __sig_atomic_t;




typedef struct
  {
    unsigned long int __val[(1024 / (8 * sizeof (unsigned long int)))];
  } __sigset_t;
# 34 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4



typedef __sigset_t sigset_t;





# 1 "/usr/include/time.h" 1 3 4
# 120 "/usr/include/time.h" 3 4
struct timespec
  {
    __time_t tv_sec;
    __syscall_slong_t tv_nsec;
  };
# 44 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/time.h" 1 3 4
# 30 "/usr/include/x86_64-linux-gnu/bits/time.h" 3 4
struct timeval
  {
    __time_t tv_sec;
    __suseconds_t tv_usec;
  };
# 46 "/usr/include/x86_64-linux-gnu/sys/select.h" 2 3 4


typedef __suseconds_t suseconds_t;





typedef long int __fd_mask;
# 64 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
typedef struct
  {






    __fd_mask __fds_bits[1024 / (8 * (int) sizeof (__fd_mask))];


  } fd_set;






typedef __fd_mask fd_mask;
# 96 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 106 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int select (int __nfds, fd_set *__restrict __readfds,
     fd_set *__restrict __writefds,
     fd_set *__restrict __exceptfds,
     struct timeval *__restrict __timeout);
# 118 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4
extern int pselect (int __nfds, fd_set *__restrict __readfds,
      fd_set *__restrict __writefds,
      fd_set *__restrict __exceptfds,
      const struct timespec *__restrict __timeout,
      const __sigset_t *__restrict __sigmask);
# 131 "/usr/include/x86_64-linux-gnu/sys/select.h" 3 4

# 220 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 1 3 4
# 24 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4


__extension__
extern unsigned int gnu_dev_major (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned int gnu_dev_minor (unsigned long long int __dev)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
__extension__
extern unsigned long long int gnu_dev_makedev (unsigned int __major,
            unsigned int __minor)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 58 "/usr/include/x86_64-linux-gnu/sys/sysmacros.h" 3 4

# 223 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4





typedef __blksize_t blksize_t;






typedef __blkcnt_t blkcnt_t;



typedef __fsblkcnt_t fsblkcnt_t;



typedef __fsfilcnt_t fsfilcnt_t;
# 270 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 1 3 4
# 21 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 22 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 2 3 4
# 60 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef unsigned long int pthread_t;


union pthread_attr_t
{
  char __size[56];
  long int __align;
};

typedef union pthread_attr_t pthread_attr_t;





typedef struct __pthread_internal_list
{
  struct __pthread_internal_list *__prev;
  struct __pthread_internal_list *__next;
} __pthread_list_t;
# 90 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
typedef union
{
  struct __pthread_mutex_s
  {
    int __lock;
    unsigned int __count;
    int __owner;

    unsigned int __nusers;



    int __kind;

    short __spins;
    short __elision;
    __pthread_list_t __list;
# 125 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  } __data;
  char __size[40];
  long int __align;
} pthread_mutex_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_mutexattr_t;




typedef union
{
  struct
  {
    int __lock;
    unsigned int __futex;
    __extension__ unsigned long long int __total_seq;
    __extension__ unsigned long long int __wakeup_seq;
    __extension__ unsigned long long int __woken_seq;
    void *__mutex;
    unsigned int __nwaiters;
    unsigned int __broadcast_seq;
  } __data;
  char __size[48];
  __extension__ long long int __align;
} pthread_cond_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_condattr_t;



typedef unsigned int pthread_key_t;



typedef int pthread_once_t;





typedef union
{

  struct
  {
    int __lock;
    unsigned int __nr_readers;
    unsigned int __readers_wakeup;
    unsigned int __writer_wakeup;
    unsigned int __nr_readers_queued;
    unsigned int __nr_writers_queued;
    int __writer;
    int __shared;
    signed char __rwelision;




    unsigned char __pad1[7];


    unsigned long int __pad2;


    unsigned int __flags;

  } __data;
# 220 "/usr/include/x86_64-linux-gnu/bits/pthreadtypes.h" 3 4
  char __size[56];
  long int __align;
} pthread_rwlock_t;

typedef union
{
  char __size[8];
  long int __align;
} pthread_rwlockattr_t;





typedef volatile int pthread_spinlock_t;




typedef union
{
  char __size[32];
  long int __align;
} pthread_barrier_t;

typedef union
{
  char __size[4];
  int __align;
} pthread_barrierattr_t;
# 271 "/usr/include/x86_64-linux-gnu/sys/types.h" 2 3 4



# 315 "/usr/include/stdlib.h" 2 3 4






extern long int random (void) __attribute__ ((__nothrow__ , __leaf__));


extern void srandom (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));





extern char *initstate (unsigned int __seed, char *__statebuf,
   size_t __statelen) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));



extern char *setstate (char *__statebuf) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));







struct random_data
  {
    int32_t *fptr;
    int32_t *rptr;
    int32_t *state;
    int rand_type;
    int rand_deg;
    int rand_sep;
    int32_t *end_ptr;
  };

extern int random_r (struct random_data *__restrict __buf,
       int32_t *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int srandom_r (unsigned int __seed, struct random_data *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int initstate_r (unsigned int __seed, char *__restrict __statebuf,
   size_t __statelen,
   struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));

extern int setstate_r (char *__restrict __statebuf,
         struct random_data *__restrict __buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern int rand (void) __attribute__ ((__nothrow__ , __leaf__));

extern void srand (unsigned int __seed) __attribute__ ((__nothrow__ , __leaf__));




extern int rand_r (unsigned int *__seed) __attribute__ ((__nothrow__ , __leaf__));







extern double drand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern double erand48 (unsigned short int __xsubi[3]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int lrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int nrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern long int mrand48 (void) __attribute__ ((__nothrow__ , __leaf__));
extern long int jrand48 (unsigned short int __xsubi[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern void srand48 (long int __seedval) __attribute__ ((__nothrow__ , __leaf__));
extern unsigned short int *seed48 (unsigned short int __seed16v[3])
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
extern void lcong48 (unsigned short int __param[7]) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





struct drand48_data
  {
    unsigned short int __x[3];
    unsigned short int __old_x[3];
    unsigned short int __c;
    unsigned short int __init;
    __extension__ unsigned long long int __a;

  };


extern int drand48_r (struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int erand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        double *__restrict __result) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int lrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int nrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int mrand48_r (struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern int jrand48_r (unsigned short int __xsubi[3],
        struct drand48_data *__restrict __buffer,
        long int *__restrict __result)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int srand48_r (long int __seedval, struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

extern int seed48_r (unsigned short int __seed16v[3],
       struct drand48_data *__buffer) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern int lcong48_r (unsigned short int __param[7],
        struct drand48_data *__buffer)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));









extern void *malloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;

extern void *calloc (size_t __nmemb, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;










extern void *realloc (void *__ptr, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__warn_unused_result__));

extern void free (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));




extern void cfree (void *__ptr) __attribute__ ((__nothrow__ , __leaf__));



# 1 "/usr/include/alloca.h" 1 3 4
# 24 "/usr/include/alloca.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 25 "/usr/include/alloca.h" 2 3 4







extern void *alloca (size_t __size) __attribute__ ((__nothrow__ , __leaf__));






# 493 "/usr/include/stdlib.h" 2 3 4





extern void *valloc (size_t __size) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;




extern int posix_memalign (void **__memptr, size_t __alignment, size_t __size)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 513 "/usr/include/stdlib.h" 3 4


extern void abort (void) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));



extern int atexit (void (*__func) (void)) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 530 "/usr/include/stdlib.h" 3 4





extern int on_exit (void (*__func) (int __status, void *__arg), void *__arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern void exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));













extern void _Exit (int __status) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__noreturn__));






extern char *getenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;

# 578 "/usr/include/stdlib.h" 3 4
extern int putenv (char *__string) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));





extern int setenv (const char *__name, const char *__value, int __replace)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));


extern int unsetenv (const char *__name) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));






extern int clearenv (void) __attribute__ ((__nothrow__ , __leaf__));
# 606 "/usr/include/stdlib.h" 3 4
extern char *mktemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));
# 619 "/usr/include/stdlib.h" 3 4
extern int mkstemp (char *__template) __attribute__ ((__nonnull__ (1))) ;
# 641 "/usr/include/stdlib.h" 3 4
extern int mkstemps (char *__template, int __suffixlen) __attribute__ ((__nonnull__ (1))) ;
# 662 "/usr/include/stdlib.h" 3 4
extern char *mkdtemp (char *__template) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 711 "/usr/include/stdlib.h" 3 4





extern int system (const char *__command) ;

# 733 "/usr/include/stdlib.h" 3 4
extern char *realpath (const char *__restrict __name,
         char *__restrict __resolved) __attribute__ ((__nothrow__ , __leaf__)) ;






typedef int (*__compar_fn_t) (const void *, const void *);
# 751 "/usr/include/stdlib.h" 3 4



extern void *bsearch (const void *__key, const void *__base,
        size_t __nmemb, size_t __size, __compar_fn_t __compar)
     __attribute__ ((__nonnull__ (1, 2, 5))) ;







extern void qsort (void *__base, size_t __nmemb, size_t __size,
     __compar_fn_t __compar) __attribute__ ((__nonnull__ (1, 4)));
# 774 "/usr/include/stdlib.h" 3 4
extern int abs (int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern long int labs (long int __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;



__extension__ extern long long int llabs (long long int __x)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;







extern div_t div (int __numer, int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;
extern ldiv_t ldiv (long int __numer, long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;




__extension__ extern lldiv_t lldiv (long long int __numer,
        long long int __denom)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)) ;

# 811 "/usr/include/stdlib.h" 3 4
extern char *ecvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *fcvt (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;




extern char *gcvt (double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern char *qecvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qfcvt (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4))) ;
extern char *qgcvt (long double __value, int __ndigit, char *__buf)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3))) ;




extern int ecvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int fcvt_r (double __value, int __ndigit, int *__restrict __decpt,
     int *__restrict __sign, char *__restrict __buf,
     size_t __len) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));

extern int qecvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));
extern int qfcvt_r (long double __value, int __ndigit,
      int *__restrict __decpt, int *__restrict __sign,
      char *__restrict __buf, size_t __len)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (3, 4, 5)));






extern int mblen (const char *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int mbtowc (wchar_t *__restrict __pwc,
     const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));


extern int wctomb (char *__s, wchar_t __wchar) __attribute__ ((__nothrow__ , __leaf__));



extern size_t mbstowcs (wchar_t *__restrict __pwcs,
   const char *__restrict __s, size_t __n) __attribute__ ((__nothrow__ , __leaf__));

extern size_t wcstombs (char *__restrict __s,
   const wchar_t *__restrict __pwcs, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__));








extern int rpmatch (const char *__response) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1))) ;
# 898 "/usr/include/stdlib.h" 3 4
extern int getsubopt (char **__restrict __optionp,
        char *const *__restrict __tokens,
        char **__restrict __valuep)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2, 3))) ;
# 950 "/usr/include/stdlib.h" 3 4
extern int getloadavg (double __loadavg[], int __nelem)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


# 1 "/usr/include/x86_64-linux-gnu/bits/stdlib-float.h" 1 3 4
# 955 "/usr/include/stdlib.h" 2 3 4
# 967 "/usr/include/stdlib.h" 3 4

# 21 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/platform.h" 1
# 18 "./src/main/platform.h"
       

# 1 "./src/main/target/edison/target.h" 1
# 17 "./src/main/target/edison/target.h"
       
# 200 "./src/main/target/edison/target.h"

# 200 "./src/main/target/edison/target.h"
uint32_t U_ID_0;
uint32_t U_ID_1;
uint32_t U_ID_2;
# 21 "./src/main/platform.h" 2
# 23 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/build/build_config.h" 1
# 18 "./src/main/build/build_config.h"
       
# 25 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/common/axis.h" 1
# 18 "./src/main/common/axis.h"
       

typedef enum {
    X = 0,
    Y,
    Z
} axis_e;




typedef enum {
    FD_ROLL = 0,
    FD_PITCH,
    FD_YAW,
    FD_INDEX_COUNT
} flight_dynamics_index_t;


typedef enum {
    AI_ROLL = 0,
    AI_PITCH,
    ANGLE_INDEX_COUNT
} angle_index_t;
# 27 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/config/parameter_group.h" 1
# 18 "./src/main/config/parameter_group.h"
       


typedef uint16_t pgn_t;


typedef enum {
    PGRF_NONE = 0,
    PGRF_CLASSIFICATON_BIT = (1 << 0),
} pgRegistryFlags_e;

typedef enum {
    PGR_PGN_MASK = 0x0fff,
    PGR_PGN_VERSION_MASK = 0xf000,
    PGR_SIZE_MASK = 0x0fff,
    PGR_SIZE_SYSTEM_FLAG = 0x0000,
    PGR_SIZE_PROFILE_FLAG = 0x8000,
} pgRegistryInternal_e;


typedef void (pgResetFunc)(void * , int );

typedef struct pgRegistry_s {
    pgn_t pgn;
    uint16_t size;
    uint8_t *address;
    uint8_t **ptr;
    union {
        void *ptr;
        pgResetFunc *fn;
    } reset;
} pgRegistry_t;

static inline uint16_t pgN(const pgRegistry_t* reg) {return reg->pgn & PGR_PGN_MASK;}
static inline uint8_t pgVersion(const pgRegistry_t* reg) {return reg->pgn >> 12;}
static inline uint16_t pgSize(const pgRegistry_t* reg) {return reg->size & PGR_SIZE_MASK;}
static inline uint16_t pgIsSystem(const pgRegistry_t* reg) {return (reg->size & PGR_SIZE_PROFILE_FLAG) == 0;}
# 67 "./src/main/config/parameter_group.h"
    pgRegistry_t* __pg_registry_start;
    pgRegistry_t* __pg_registry_end;


    uint8_t* __pg_resetdata_start;
    uint8_t* __pg_resetdata_end;
# 227 "./src/main/config/parameter_group.h"
const pgRegistry_t* pgFind(pgn_t pgn);

void pgLoad(const pgRegistry_t* reg, int profileIndex, const void *from, int size, int version);
int pgStore(const pgRegistry_t* reg, void *to, int size, uint8_t profileIndex);
void pgResetAll(int profileCount);
void pgResetCurrent(const pgRegistry_t *reg);
void pgReset(const pgRegistry_t* reg, int profileIndex);
void pgActivateProfile(int profileIndex);
# 29 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/config/parameter_group_ids.h" 1
# 30 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/config/profile.h" 1
# 18 "./src/main/config/profile.h"
       



typedef struct profileSelection_s {
    uint8_t current_profile_index;
} profileSelection_t;

profileSelection_t profileSelection_System; static inline profileSelection_t* profileSelection(void) { return &profileSelection_System; } struct _dummy;

uint8_t getCurrentProfile(void);
void setProfile(uint8_t profileIndex);
# 31 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/drivers/sensor.h" 1
# 18 "./src/main/drivers/sensor.h"
       

typedef 
# 20 "./src/main/drivers/sensor.h" 3 4
       _Bool 
# 20 "./src/main/drivers/sensor.h"
            (*sensorInitFuncPtr)(void);
typedef 
# 21 "./src/main/drivers/sensor.h" 3 4
       _Bool 
# 21 "./src/main/drivers/sensor.h"
            (*sensorReadFuncPtr)(int16_t *data);

struct acc_s;
typedef void (*sensorAccInitFuncPtr)(void);
typedef void (*sensorGyroInitFuncPtr)(uint8_t lpf);
typedef 
# 26 "./src/main/drivers/sensor.h" 3 4
       _Bool 
# 26 "./src/main/drivers/sensor.h"
            (*sensorIsDataReadyFuncPtr)(void);
# 33 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/drivers/accgyro.h" 1
# 18 "./src/main/drivers/accgyro.h"
       
# 30 "./src/main/drivers/accgyro.h"
typedef struct gyro_s {
    sensorGyroInitFuncPtr init;
    sensorReadFuncPtr read;
    sensorReadFuncPtr temperature;
    sensorIsDataReadyFuncPtr isDataReady;
    float scale;
} gyro_t;

typedef struct acc_s {
    sensorAccInitFuncPtr init;
    sensorReadFuncPtr read;
    uint16_t acc_1G;
    char revisionCode;
} acc_t;


# 45 "./src/main/drivers/accgyro.h" 3 4
_Bool 
# 45 "./src/main/drivers/accgyro.h"
    sparkfun_acc_Detect(acc_t *acc);

# 46 "./src/main/drivers/accgyro.h" 3 4
_Bool 
# 46 "./src/main/drivers/accgyro.h"
    sparkfun_gyro_detect(gyro_t *gyro);
# 34 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/fc/config.h" 1
# 18 "./src/main/fc/config.h"
       




typedef enum {
    FEATURE_RX_PPM = 1 << 0,
    FEATURE_VBAT = 1 << 1,
    FEATURE_INFLIGHT_ACC_CAL = 1 << 2,
    FEATURE_RX_SERIAL = 1 << 3,
    FEATURE_MOTOR_STOP = 1 << 4,
    FEATURE_SERVO_TILT = 1 << 5,
    FEATURE_SOFTSERIAL = 1 << 6,
    FEATURE_GPS = 1 << 7,
    FEATURE_FAILSAFE = 1 << 8,
    FEATURE_SONAR = 1 << 9,
    FEATURE_TELEMETRY = 1 << 10,
    FEATURE_AMPERAGE_METER = 1 << 11,
    FEATURE_3D = 1 << 12,
    FEATURE_RX_PARALLEL_PWM = 1 << 13,
    FEATURE_RX_MSP = 1 << 14,
    FEATURE_RSSI_ADC = 1 << 15,
    FEATURE_LED_STRIP = 1 << 16,
    FEATURE_DISPLAY = 1 << 17,
    FEATURE_ONESHOT125 = 1 << 18,
    FEATURE_BLACKBOX = 1 << 19,
    FEATURE_CHANNEL_FORWARDING = 1 << 20,
    FEATURE_TRANSPONDER = 1 << 21,
} features_e;

void handleOneshotFeatureChangeOnRestart(void);

void initEEPROM(void);
void resetEEPROM(void);
void readEEPROM(void);
void writeEEPROM();
void ensureEEPROMContainsValidData(void);
void saveConfigAndNotify(void);

void changeProfile(uint8_t profileIndex);

uint8_t getCurrentControlRateProfile(void);
void changeControlRateProfile(uint8_t profileIndex);
# 36 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/io/beeper.h" 1
# 18 "./src/main/io/beeper.h"
       

typedef enum {

    BEEPER_SILENCE = 0,

    BEEPER_GYRO_CALIBRATED,
    BEEPER_RX_LOST_LANDING,
    BEEPER_RX_LOST,
    BEEPER_DISARMING,
    BEEPER_ARMING,
    BEEPER_ARMING_GPS_FIX,
    BEEPER_BAT_CRIT_LOW,
    BEEPER_BAT_LOW,
    BEEPER_GPS_STATUS,
    BEEPER_RX_SET,
    BEEPER_DISARM_REPEAT,
    BEEPER_ACC_CALIBRATION,
    BEEPER_ACC_CALIBRATION_FAIL,
    BEEPER_READY_BEEP,
    BEEPER_MULTI_BEEPS,
    BEEPER_ARMED,
} beeperMode_e;

void beeper(beeperMode_e mode);
void beeperSilence(void);
void beeperUpdate(void);
void beeperConfirmationBeeps(uint8_t beepCount);
uint32_t getArmingBeepTimeMicros(void);
beeperMode_e beeperModeForTableIndex(int idx);
const char *beeperNameForTableIndex(int idx);
int beeperTableEntryCount(void);
# 38 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/sensors/battery.h" 1
# 18 "./src/main/sensors/battery.h"
       

typedef struct batteryConfig_s {
    uint8_t vbatmaxcellvoltage;
    uint8_t vbatmincellvoltage;
    uint8_t vbatwarningcellvoltage;
    uint16_t batteryCapacity;
    uint8_t amperageMeterSource;
} batteryConfig_t;

batteryConfig_t batteryConfig_System; static inline batteryConfig_t* batteryConfig(void) { return &batteryConfig_System; } struct _dummy;

typedef enum {
    BATTERY_OK = 0,
    BATTERY_WARNING,
    BATTERY_CRITICAL,
    BATTERY_NOT_PRESENT
} batteryState_e;

extern uint16_t vbat;

extern uint8_t batteryCellCount;
extern uint16_t batteryWarningVoltage;

uint16_t batteryAdcToVoltage(uint16_t src);
batteryState_e getBatteryState(void);
const char * getBatteryStateString(void);
void batteryUpdate(void);
void batteryInit(void);


uint8_t batteryVoltagePercentage(void);
uint8_t batteryCapacityRemainingPercentage(void);
# 40 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/sensors/sensors.h" 1
# 18 "./src/main/sensors/sensors.h"
       


typedef enum {
    SENSOR_INDEX_GYRO = 0,
    SENSOR_INDEX_ACC,
    SENSOR_INDEX_BARO,
    SENSOR_INDEX_MAG
} sensorIndex_e;



extern uint8_t detectedSensors[(SENSOR_INDEX_MAG + 1)];

typedef struct int16_flightDynamicsTrims_s {
    int16_t roll;
    int16_t pitch;
    int16_t yaw;
} flightDynamicsTrims_def_t;

typedef union flightDynamicsTrims_u {
    int16_t raw[3];
    flightDynamicsTrims_def_t values;
} flightDynamicsTrims_t;





typedef enum {
    SENSOR_GYRO = 1 << 0,
    SENSOR_ACC = 1 << 1,
    SENSOR_BARO = 1 << 2,
    SENSOR_MAG = 1 << 3,
    SENSOR_SONAR = 1 << 4,
    SENSOR_GPS = 1 << 5,
    SENSOR_GPSMAG = 1 << 6,
} sensors_e;

typedef enum {
    ALIGN_DEFAULT = 0,
    CW0_DEG = 1,
    CW90_DEG = 2,
    CW180_DEG = 3,
    CW270_DEG = 4,
    CW0_DEG_FLIP = 5,
    CW90_DEG_FLIP = 6,
    CW180_DEG_FLIP = 7,
    CW270_DEG_FLIP = 8
} sensor_align_e;

typedef struct sensorAlignmentConfig_s {
    sensor_align_e gyro_align;
    sensor_align_e acc_align;
    sensor_align_e mag_align;
} sensorAlignmentConfig_t;

typedef struct sensorSelectionConfig_s {
    uint8_t acc_hardware;
    uint8_t mag_hardware;
    uint8_t baro_hardware;
} sensorSelectionConfig_t;

typedef struct sensorTrims_s {
    flightDynamicsTrims_t accZero;
    flightDynamicsTrims_t magZero;
} sensorTrims_t;

sensorSelectionConfig_t sensorSelectionConfig_System; static inline sensorSelectionConfig_t* sensorSelectionConfig(void) { return &sensorSelectionConfig_System; } struct _dummy;
sensorAlignmentConfig_t sensorAlignmentConfig_System; static inline sensorAlignmentConfig_t* sensorAlignmentConfig(void) { return &sensorAlignmentConfig_System; } struct _dummy;
sensorTrims_t sensorTrims_System; static inline sensorTrims_t* sensorTrims(void) { return &sensorTrims_System; } struct _dummy;
# 41 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/sensors/boardalignment.h" 1
# 18 "./src/main/sensors/boardalignment.h"
       

typedef struct boardAlignment_s {
    int16_t rollDegrees;
    int16_t pitchDegrees;
    int16_t yawDegrees;
} __attribute__((packed)) boardAlignment_t;

boardAlignment_t boardAlignment_System; static inline boardAlignment_t* boardAlignment(void) { return &boardAlignment_System; } struct _dummy;

void alignSensors(int32_t *src, int32_t *dest, uint8_t rotation);
void initBoardAlignment(void);
# 42 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/config/config_reset.h" 1
# 18 "./src/main/config/config_reset.h"
       
# 44 "src/main/sensors/acceleration.c" 2
# 1 "./src/main/config/feature.h" 1
# 18 "./src/main/config/feature.h"
       

typedef struct featureConfig_s {
    uint32_t enabledFeatures;
} featureConfig_t;

featureConfig_t featureConfig_System; static inline featureConfig_t* featureConfig(void) { return &featureConfig_System; } struct _dummy;

void latchActiveFeatures(void);

# 27 "./src/main/config/feature.h" 3 4
_Bool 
# 27 "./src/main/config/feature.h"
    featureConfigured(uint32_t mask);

# 28 "./src/main/config/feature.h" 3 4
_Bool 
# 28 "./src/main/config/feature.h"
    feature(uint32_t mask);
void featureSet(uint32_t mask);
void featureClear(uint32_t mask);
void featureClearAll(void);
uint32_t featureMask(void);
# 45 "src/main/sensors/acceleration.c" 2

# 1 "./src/main/sensors/acceleration.h" 1
# 18 "./src/main/sensors/acceleration.h"
       



typedef enum {
    ACC_DEFAULT = 0,
    ACC_NONE = 1,
    ACC_ADXL345 = 2,
    ACC_MPU6050 = 3,
    ACC_MMA8452 = 4,
    ACC_BMA280 = 5,
    ACC_LSM303DLHC = 6,
    ACC_MPU6000 = 7,
    ACC_MPU6500 = 8,
    ACC_FAKE = 9,
} accelerationSensor_e;



extern sensor_align_e accAlign;
extern acc_t acc;

extern int32_t accADC[3];

typedef struct rollAndPitchTrims_s {
    int16_t roll;
    int16_t pitch;
} rollAndPitchTrims_t_def;

typedef union rollAndPitchTrims_u {
    int16_t raw[2];
    rollAndPitchTrims_t_def values;
} rollAndPitchTrims_t;

typedef struct accDeadband_s {
    uint8_t xy;
    uint8_t z;
} accDeadband_t;

typedef struct accelerometerConfig_s {
    rollAndPitchTrims_t accelerometerTrims;


    uint8_t acc_cut_hz;
    float accz_lpf_cutoff;
    accDeadband_t accDeadband;
    uint8_t acc_unarmedcal;
} accelerometerConfig_t;

extern accelerometerConfig_t *accelerometerConfig_ProfileCurrent; static inline accelerometerConfig_t* accelerometerConfig(void) { return accelerometerConfig_ProfileCurrent; } struct _dummy;


# 69 "./src/main/sensors/acceleration.h" 3 4
_Bool 
# 69 "./src/main/sensors/acceleration.h"
    isAccelerationCalibrationComplete(void);
void accSetCalibrationCycles(uint16_t calibrationCyclesRequired);
void resetRollAndPitchTrims(rollAndPitchTrims_t *rollAndPitchTrims);
void updateAccelerationReadings(rollAndPitchTrims_t *rollAndPitchTrims);
void setAccelerationTrims(flightDynamicsTrims_t *accelerationTrimsToUse);
# 47 "src/main/sensors/acceleration.c" 2

extern void pgResetFn_accelerometerConfig(accelerometerConfig_t *); static accelerometerConfig_t accelerometerConfig_Storage[3]; accelerometerConfig_t *accelerometerConfig_ProfileCurrent; extern const pgRegistry_t accelerometerConfig_Registry; const pgRegistry_t accelerometerConfig_Registry __attribute__ ((section(".pg_registry"), used, aligned(4))) = { .pgn = 35 | (0 << 12), .size = sizeof(accelerometerConfig_t) | PGR_SIZE_PROFILE_FLAG, .address = (uint8_t*)&accelerometerConfig_Storage, .ptr = (uint8_t **)&accelerometerConfig_ProfileCurrent, .reset = {.fn = (pgResetFunc*)&pgResetFn_accelerometerConfig}, };

void resetRollAndPitchTrims(rollAndPitchTrims_t *rollAndPitchTrims)
{
    *(rollAndPitchTrims) = (rollAndPitchTrims_t) { .values.roll = 0, .values.pitch = 0, };


     ;
}

void pgResetFn_accelerometerConfig(accelerometerConfig_t *instance)
{
    *(instance) = (accelerometerConfig_t) { .acc_cut_hz = 15, .accz_lpf_cutoff = 5.0f, .accDeadband.z = 40, .accDeadband.xy = 40, .acc_unarmedcal = 1, };





     ;
    resetRollAndPitchTrims(&instance->accelerometerTrims);
}

int32_t accADC[3];

acc_t acc;
sensor_align_e accAlign = 0;

uint16_t calibratingA = 0;


# 77 "src/main/sensors/acceleration.c" 3 4
_Bool 
# 77 "src/main/sensors/acceleration.c"
    initialized = 
# 77 "src/main/sensors/acceleration.c" 3 4
                  0
# 77 "src/main/sensors/acceleration.c"
                       ;

extern uint16_t InflightcalibratingA;
extern 
# 80 "src/main/sensors/acceleration.c" 3 4
      _Bool 
# 80 "src/main/sensors/acceleration.c"
           AccInflightCalibrationArmed;
extern 
# 81 "src/main/sensors/acceleration.c" 3 4
      _Bool 
# 81 "src/main/sensors/acceleration.c"
           AccInflightCalibrationMeasurementDone;
extern 
# 82 "src/main/sensors/acceleration.c" 3 4
      _Bool 
# 82 "src/main/sensors/acceleration.c"
           AccInflightCalibrationSavetoEEProm;
extern 
# 83 "src/main/sensors/acceleration.c" 3 4
      _Bool 
# 83 "src/main/sensors/acceleration.c"
           AccInflightCalibrationActive;

static flightDynamicsTrims_t* accelerationTrims;

void accSetCalibrationCycles(uint16_t calibrationCyclesRequired)
{
    calibratingA = calibrationCyclesRequired;
}


# 92 "src/main/sensors/acceleration.c" 3 4
_Bool 
# 92 "src/main/sensors/acceleration.c"
    isAccelerationCalibrationComplete(void)
{
    return calibratingA == 0;
}


# 97 "src/main/sensors/acceleration.c" 3 4
_Bool 
# 97 "src/main/sensors/acceleration.c"
    isOnFinalAccelerationCalibrationCycle(void)
{
    return calibratingA == 1;
}


# 102 "src/main/sensors/acceleration.c" 3 4
_Bool 
# 102 "src/main/sensors/acceleration.c"
    isOnFirstAccelerationCalibrationCycle(void)
{
    return calibratingA == 400;
}

void performAcclerationCalibration(rollAndPitchTrims_t *rollAndPitchTrims)
{
    static int32_t a[3];
    uint8_t axis;

    for (axis = 0; axis < 3; axis++) {


        if (isOnFirstAccelerationCalibrationCycle())
            a[axis] = 0;


        a[axis] += accADC[axis];


        accADC[axis] = 0;
        accelerationTrims->raw[axis] = 0;
    }

    if (isOnFinalAccelerationCalibrationCycle()) {

        accelerationTrims->raw[X] = (a[X] + (400 / 2)) / 400;
        accelerationTrims->raw[Y] = (a[Y] + (400 / 2)) / 400;
        accelerationTrims->raw[Z] = (a[Z] + (400 / 2)) / 400 - acc.acc_1G;

        resetRollAndPitchTrims(rollAndPitchTrims);


    }

    calibratingA--;
}

void performInflightAccelerationCalibration(rollAndPitchTrims_t *rollAndPitchTrims)
{
    uint8_t axis;
    static int32_t b[3];
    static int16_t accZero_saved[3] = { 0, 0, 0 };
    static rollAndPitchTrims_t angleTrim_saved = { { 0, 0 } };


    if (InflightcalibratingA == 50) {
        accZero_saved[X] = accelerationTrims->raw[X];
        accZero_saved[Y] = accelerationTrims->raw[Y];
        accZero_saved[Z] = accelerationTrims->raw[Z];
        angleTrim_saved.values.roll = rollAndPitchTrims->values.roll;
        angleTrim_saved.values.pitch = rollAndPitchTrims->values.pitch;
    }
    if (InflightcalibratingA > 0) {
        for (axis = 0; axis < 3; axis++) {

            if (InflightcalibratingA == 50)
                b[axis] = 0;

            b[axis] += accADC[axis];

            accADC[axis] = 0;
            accelerationTrims->raw[axis] = 0;
        }

        if (InflightcalibratingA == 1) {
            AccInflightCalibrationActive = 
# 168 "src/main/sensors/acceleration.c" 3 4
                                          0
# 168 "src/main/sensors/acceleration.c"
                                               ;
            AccInflightCalibrationMeasurementDone = 
# 169 "src/main/sensors/acceleration.c" 3 4
                                                   1
# 169 "src/main/sensors/acceleration.c"
                                                       ;
            beeper(BEEPER_ACC_CALIBRATION);

            accelerationTrims->raw[X] = accZero_saved[X];
            accelerationTrims->raw[Y] = accZero_saved[Y];
            accelerationTrims->raw[Z] = accZero_saved[Z];
            rollAndPitchTrims->values.roll = angleTrim_saved.values.roll;
            rollAndPitchTrims->values.pitch = angleTrim_saved.values.pitch;
        }
        InflightcalibratingA--;
    }

    if (AccInflightCalibrationSavetoEEProm) {
        AccInflightCalibrationSavetoEEProm = 
# 182 "src/main/sensors/acceleration.c" 3 4
                                            0
# 182 "src/main/sensors/acceleration.c"
                                                 ;
        accelerationTrims->raw[X] = b[X] / 50;
        accelerationTrims->raw[Y] = b[Y] / 50;
        accelerationTrims->raw[Z] = b[Z] / 50 - acc.acc_1G;

        resetRollAndPitchTrims(rollAndPitchTrims);


    }
}

void applyAccelerationTrims(flightDynamicsTrims_t *accelerationTrims)
{
    accADC[X] -= accelerationTrims->raw[X];
    accADC[Y] -= accelerationTrims->raw[Y];
    accADC[Z] -= accelerationTrims->raw[Z];
}

static void convertRawACCADCReadingsToInternalType(int16_t *accADCRaw)
{
    int axis;

    for (axis = 0; axis < 3; axis++) {
        accADC[axis] = accADCRaw[axis];
    }
}

void updateAccelerationReadings(rollAndPitchTrims_t *rollAndPitchTrims)
{
    if(!initialized)
    {
        accelerationTrims = (flightDynamicsTrims_t *)malloc(sizeof(flightDynamicsTrims_t));
        initialized = 
# 214 "src/main/sensors/acceleration.c" 3 4
                     1
# 214 "src/main/sensors/acceleration.c"
                         ;
    }

    int16_t accADCRaw[3];

    if (!acc.read(accADCRaw)) {
        return;
    }

    convertRawACCADCReadingsToInternalType(accADCRaw);

    alignSensors(accADC, accADC, accAlign);

    if (!isAccelerationCalibrationComplete()) {
        performAcclerationCalibration(rollAndPitchTrims);
    }

    if (feature(FEATURE_INFLIGHT_ACC_CAL)) {
        performInflightAccelerationCalibration(rollAndPitchTrims);
    }

    applyAccelerationTrims(accelerationTrims);
}

void setAccelerationTrims(flightDynamicsTrims_t *accelerationTrimsToUse)
{
    accelerationTrims = accelerationTrimsToUse;
}
