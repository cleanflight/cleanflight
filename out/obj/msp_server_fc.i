# 1 "src/main/fc/msp_server_fc.c"
# 1 "/home/aravind/git/cleanflight//"
# 1 "<built-in>"
# 1 "<command-line>"
# 1 "/usr/include/stdc-predef.h" 1 3 4
# 1 "<command-line>" 2
# 1 "src/main/fc/msp_server_fc.c"
# 18 "src/main/fc/msp_server_fc.c"
# 1 "/usr/include/stdio.h" 1 3 4
# 27 "/usr/include/stdio.h" 3 4
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
# 28 "/usr/include/stdio.h" 2 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4

# 216 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long unsigned int size_t;
# 34 "/usr/include/stdio.h" 2 3 4

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
# 36 "/usr/include/stdio.h" 2 3 4
# 44 "/usr/include/stdio.h" 3 4
struct _IO_FILE;



typedef struct _IO_FILE FILE;





# 64 "/usr/include/stdio.h" 3 4
typedef struct _IO_FILE __FILE;
# 74 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/libio.h" 1 3 4
# 31 "/usr/include/libio.h" 3 4
# 1 "/usr/include/_G_config.h" 1 3 4
# 15 "/usr/include/_G_config.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 16 "/usr/include/_G_config.h" 2 3 4




# 1 "/usr/include/wchar.h" 1 3 4
# 82 "/usr/include/wchar.h" 3 4
typedef struct
{
  int __count;
  union
  {

    unsigned int __wch;



    char __wchb[4];
  } __value;
} __mbstate_t;
# 21 "/usr/include/_G_config.h" 2 3 4
typedef struct
{
  __off_t __pos;
  __mbstate_t __state;
} _G_fpos_t;
typedef struct
{
  __off64_t __pos;
  __mbstate_t __state;
} _G_fpos64_t;
# 32 "/usr/include/libio.h" 2 3 4
# 49 "/usr/include/libio.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 1 3 4
# 40 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdarg.h" 3 4
typedef __builtin_va_list __gnuc_va_list;
# 50 "/usr/include/libio.h" 2 3 4
# 144 "/usr/include/libio.h" 3 4
struct _IO_jump_t; struct _IO_FILE;





typedef void _IO_lock_t;





struct _IO_marker {
  struct _IO_marker *_next;
  struct _IO_FILE *_sbuf;



  int _pos;
# 173 "/usr/include/libio.h" 3 4
};


enum __codecvt_result
{
  __codecvt_ok,
  __codecvt_partial,
  __codecvt_error,
  __codecvt_noconv
};
# 241 "/usr/include/libio.h" 3 4
struct _IO_FILE {
  int _flags;




  char* _IO_read_ptr;
  char* _IO_read_end;
  char* _IO_read_base;
  char* _IO_write_base;
  char* _IO_write_ptr;
  char* _IO_write_end;
  char* _IO_buf_base;
  char* _IO_buf_end;

  char *_IO_save_base;
  char *_IO_backup_base;
  char *_IO_save_end;

  struct _IO_marker *_markers;

  struct _IO_FILE *_chain;

  int _fileno;



  int _flags2;

  __off_t _old_offset;



  unsigned short _cur_column;
  signed char _vtable_offset;
  char _shortbuf[1];



  _IO_lock_t *_lock;
# 289 "/usr/include/libio.h" 3 4
  __off64_t _offset;







  void *__pad1;
  void *__pad2;
  void *__pad3;
  void *__pad4;

  size_t __pad5;
  int _mode;

  char _unused2[15 * sizeof (int) - 4 * sizeof (void *) - sizeof (size_t)];

};


typedef struct _IO_FILE _IO_FILE;


struct _IO_FILE_plus;

extern struct _IO_FILE_plus _IO_2_1_stdin_;
extern struct _IO_FILE_plus _IO_2_1_stdout_;
extern struct _IO_FILE_plus _IO_2_1_stderr_;
# 333 "/usr/include/libio.h" 3 4
typedef __ssize_t __io_read_fn (void *__cookie, char *__buf, size_t __nbytes);







typedef __ssize_t __io_write_fn (void *__cookie, const char *__buf,
     size_t __n);







typedef int __io_seek_fn (void *__cookie, __off64_t *__pos, int __w);


typedef int __io_close_fn (void *__cookie);
# 385 "/usr/include/libio.h" 3 4
extern int __underflow (_IO_FILE *);
extern int __uflow (_IO_FILE *);
extern int __overflow (_IO_FILE *, int);
# 429 "/usr/include/libio.h" 3 4
extern int _IO_getc (_IO_FILE *__fp);
extern int _IO_putc (int __c, _IO_FILE *__fp);
extern int _IO_feof (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ferror (_IO_FILE *__fp) __attribute__ ((__nothrow__ , __leaf__));

extern int _IO_peekc_locked (_IO_FILE *__fp);





extern void _IO_flockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern void _IO_funlockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
extern int _IO_ftrylockfile (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 459 "/usr/include/libio.h" 3 4
extern int _IO_vfscanf (_IO_FILE * __restrict, const char * __restrict,
   __gnuc_va_list, int *__restrict);
extern int _IO_vfprintf (_IO_FILE *__restrict, const char *__restrict,
    __gnuc_va_list);
extern __ssize_t _IO_padn (_IO_FILE *, int, __ssize_t);
extern size_t _IO_sgetn (_IO_FILE *, void *, size_t);

extern __off64_t _IO_seekoff (_IO_FILE *, __off64_t, int, int);
extern __off64_t _IO_seekpos (_IO_FILE *, __off64_t, int);

extern void _IO_free_backup_area (_IO_FILE *) __attribute__ ((__nothrow__ , __leaf__));
# 75 "/usr/include/stdio.h" 2 3 4




typedef __gnuc_va_list va_list;
# 90 "/usr/include/stdio.h" 3 4
typedef __off_t off_t;
# 102 "/usr/include/stdio.h" 3 4
typedef __ssize_t ssize_t;







typedef _G_fpos_t fpos_t;




# 164 "/usr/include/stdio.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/stdio_lim.h" 1 3 4
# 165 "/usr/include/stdio.h" 2 3 4



extern struct _IO_FILE *stdin;
extern struct _IO_FILE *stdout;
extern struct _IO_FILE *stderr;







extern int remove (const char *__filename) __attribute__ ((__nothrow__ , __leaf__));

extern int rename (const char *__old, const char *__new) __attribute__ ((__nothrow__ , __leaf__));




extern int renameat (int __oldfd, const char *__old, int __newfd,
       const char *__new) __attribute__ ((__nothrow__ , __leaf__));








extern FILE *tmpfile (void) ;
# 209 "/usr/include/stdio.h" 3 4
extern char *tmpnam (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;





extern char *tmpnam_r (char *__s) __attribute__ ((__nothrow__ , __leaf__)) ;
# 227 "/usr/include/stdio.h" 3 4
extern char *tempnam (const char *__dir, const char *__pfx)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) ;








extern int fclose (FILE *__stream);




extern int fflush (FILE *__stream);

# 252 "/usr/include/stdio.h" 3 4
extern int fflush_unlocked (FILE *__stream);
# 266 "/usr/include/stdio.h" 3 4






extern FILE *fopen (const char *__restrict __filename,
      const char *__restrict __modes) ;




extern FILE *freopen (const char *__restrict __filename,
        const char *__restrict __modes,
        FILE *__restrict __stream) ;
# 295 "/usr/include/stdio.h" 3 4

# 306 "/usr/include/stdio.h" 3 4
extern FILE *fdopen (int __fd, const char *__modes) __attribute__ ((__nothrow__ , __leaf__)) ;
# 319 "/usr/include/stdio.h" 3 4
extern FILE *fmemopen (void *__s, size_t __len, const char *__modes)
  __attribute__ ((__nothrow__ , __leaf__)) ;




extern FILE *open_memstream (char **__bufloc, size_t *__sizeloc) __attribute__ ((__nothrow__ , __leaf__)) ;






extern void setbuf (FILE *__restrict __stream, char *__restrict __buf) __attribute__ ((__nothrow__ , __leaf__));



extern int setvbuf (FILE *__restrict __stream, char *__restrict __buf,
      int __modes, size_t __n) __attribute__ ((__nothrow__ , __leaf__));





extern void setbuffer (FILE *__restrict __stream, char *__restrict __buf,
         size_t __size) __attribute__ ((__nothrow__ , __leaf__));


extern void setlinebuf (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));








extern int fprintf (FILE *__restrict __stream,
      const char *__restrict __format, ...);




extern int printf (const char *__restrict __format, ...);

extern int sprintf (char *__restrict __s,
      const char *__restrict __format, ...) __attribute__ ((__nothrow__));





extern int vfprintf (FILE *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg);




extern int vprintf (const char *__restrict __format, __gnuc_va_list __arg);

extern int vsprintf (char *__restrict __s, const char *__restrict __format,
       __gnuc_va_list __arg) __attribute__ ((__nothrow__));





extern int snprintf (char *__restrict __s, size_t __maxlen,
       const char *__restrict __format, ...)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 4)));

extern int vsnprintf (char *__restrict __s, size_t __maxlen,
        const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__)) __attribute__ ((__format__ (__printf__, 3, 0)));

# 412 "/usr/include/stdio.h" 3 4
extern int vdprintf (int __fd, const char *__restrict __fmt,
       __gnuc_va_list __arg)
     __attribute__ ((__format__ (__printf__, 2, 0)));
extern int dprintf (int __fd, const char *__restrict __fmt, ...)
     __attribute__ ((__format__ (__printf__, 2, 3)));








extern int fscanf (FILE *__restrict __stream,
     const char *__restrict __format, ...) ;




extern int scanf (const char *__restrict __format, ...) ;

extern int sscanf (const char *__restrict __s,
     const char *__restrict __format, ...) __attribute__ ((__nothrow__ , __leaf__));
# 443 "/usr/include/stdio.h" 3 4
extern int fscanf (FILE *__restrict __stream, const char *__restrict __format, ...) __asm__ ("" "__isoc99_fscanf")

                               ;
extern int scanf (const char *__restrict __format, ...) __asm__ ("" "__isoc99_scanf")
                              ;
extern int sscanf (const char *__restrict __s, const char *__restrict __format, ...) __asm__ ("" "__isoc99_sscanf") __attribute__ ((__nothrow__ , __leaf__))

                      ;
# 463 "/usr/include/stdio.h" 3 4








extern int vfscanf (FILE *__restrict __s, const char *__restrict __format,
      __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 2, 0))) ;





extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__format__ (__scanf__, 1, 0))) ;


extern int vsscanf (const char *__restrict __s,
      const char *__restrict __format, __gnuc_va_list __arg)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__format__ (__scanf__, 2, 0)));
# 494 "/usr/include/stdio.h" 3 4
extern int vfscanf (FILE *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vfscanf")



     __attribute__ ((__format__ (__scanf__, 2, 0))) ;
extern int vscanf (const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vscanf")

     __attribute__ ((__format__ (__scanf__, 1, 0))) ;
extern int vsscanf (const char *__restrict __s, const char *__restrict __format, __gnuc_va_list __arg) __asm__ ("" "__isoc99_vsscanf") __attribute__ ((__nothrow__ , __leaf__))



     __attribute__ ((__format__ (__scanf__, 2, 0)));
# 522 "/usr/include/stdio.h" 3 4









extern int fgetc (FILE *__stream);
extern int getc (FILE *__stream);





extern int getchar (void);

# 550 "/usr/include/stdio.h" 3 4
extern int getc_unlocked (FILE *__stream);
extern int getchar_unlocked (void);
# 561 "/usr/include/stdio.h" 3 4
extern int fgetc_unlocked (FILE *__stream);











extern int fputc (int __c, FILE *__stream);
extern int putc (int __c, FILE *__stream);





extern int putchar (int __c);

# 594 "/usr/include/stdio.h" 3 4
extern int fputc_unlocked (int __c, FILE *__stream);







extern int putc_unlocked (int __c, FILE *__stream);
extern int putchar_unlocked (int __c);






extern int getw (FILE *__stream);


extern int putw (int __w, FILE *__stream);








extern char *fgets (char *__restrict __s, int __n, FILE *__restrict __stream)
     ;
# 638 "/usr/include/stdio.h" 3 4
extern char *gets (char *__s) __attribute__ ((__deprecated__));


# 665 "/usr/include/stdio.h" 3 4
extern __ssize_t __getdelim (char **__restrict __lineptr,
          size_t *__restrict __n, int __delimiter,
          FILE *__restrict __stream) ;
extern __ssize_t getdelim (char **__restrict __lineptr,
        size_t *__restrict __n, int __delimiter,
        FILE *__restrict __stream) ;







extern __ssize_t getline (char **__restrict __lineptr,
       size_t *__restrict __n,
       FILE *__restrict __stream) ;








extern int fputs (const char *__restrict __s, FILE *__restrict __stream);





extern int puts (const char *__s);






extern int ungetc (int __c, FILE *__stream);






extern size_t fread (void *__restrict __ptr, size_t __size,
       size_t __n, FILE *__restrict __stream) ;




extern size_t fwrite (const void *__restrict __ptr, size_t __size,
        size_t __n, FILE *__restrict __s);

# 737 "/usr/include/stdio.h" 3 4
extern size_t fread_unlocked (void *__restrict __ptr, size_t __size,
         size_t __n, FILE *__restrict __stream) ;
extern size_t fwrite_unlocked (const void *__restrict __ptr, size_t __size,
          size_t __n, FILE *__restrict __stream);








extern int fseek (FILE *__stream, long int __off, int __whence);




extern long int ftell (FILE *__stream) ;




extern void rewind (FILE *__stream);

# 773 "/usr/include/stdio.h" 3 4
extern int fseeko (FILE *__stream, __off_t __off, int __whence);




extern __off_t ftello (FILE *__stream) ;
# 792 "/usr/include/stdio.h" 3 4






extern int fgetpos (FILE *__restrict __stream, fpos_t *__restrict __pos);




extern int fsetpos (FILE *__stream, const fpos_t *__pos);
# 815 "/usr/include/stdio.h" 3 4

# 824 "/usr/include/stdio.h" 3 4


extern void clearerr (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));

extern int feof (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;

extern int ferror (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern void clearerr_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
extern int feof_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
extern int ferror_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;








extern void perror (const char *__s);






# 1 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/sys_errlist.h" 3 4
extern int sys_nerr;
extern const char *const sys_errlist[];
# 854 "/usr/include/stdio.h" 2 3 4




extern int fileno (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;




extern int fileno_unlocked (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;
# 872 "/usr/include/stdio.h" 3 4
extern FILE *popen (const char *__command, const char *__modes) ;





extern int pclose (FILE *__stream);





extern char *ctermid (char *__s) __attribute__ ((__nothrow__ , __leaf__));
# 912 "/usr/include/stdio.h" 3 4
extern void flockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));



extern int ftrylockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__)) ;


extern void funlockfile (FILE *__stream) __attribute__ ((__nothrow__ , __leaf__));
# 942 "/usr/include/stdio.h" 3 4

# 19 "src/main/fc/msp_server_fc.c" 2

# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdbool.h" 1 3 4
# 21 "src/main/fc/msp_server_fc.c" 2
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 1 3 4
# 9 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stdint.h" 3 4
# 1 "/usr/include/stdint.h" 1 3 4
# 26 "/usr/include/stdint.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wchar.h" 1 3 4
# 27 "/usr/include/stdint.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/wordsize.h" 1 3 4
# 28 "/usr/include/stdint.h" 2 3 4
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
# 22 "src/main/fc/msp_server_fc.c" 2
# 1 "/usr/include/stdlib.h" 1 3 4
# 32 "/usr/include/stdlib.h" 3 4
# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
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
# 28 "/usr/include/x86_64-linux-gnu/bits/byteswap.h" 3 4
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
# 98 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
typedef __pid_t pid_t;





typedef __id_t id_t;
# 115 "/usr/include/x86_64-linux-gnu/sys/types.h" 3 4
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

# 23 "src/main/fc/msp_server_fc.c" 2
# 1 "/usr/include/string.h" 1 3 4
# 27 "/usr/include/string.h" 3 4





# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 33 "/usr/include/string.h" 2 3 4









extern void *memcpy (void *__restrict __dest, const void *__restrict __src,
       size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void *memmove (void *__dest, const void *__src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));






extern void *memccpy (void *__restrict __dest, const void *__restrict __src,
        int __c, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));





extern void *memset (void *__s, int __c, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int memcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 92 "/usr/include/string.h" 3 4
extern void *memchr (const void *__s, int __c, size_t __n)
      __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 123 "/usr/include/string.h" 3 4


extern char *strcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern char *strcat (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));

extern char *strncat (char *__restrict __dest, const char *__restrict __src,
        size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern int strncmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strcoll (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));

extern size_t strxfrm (char *__restrict __dest,
         const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));






# 1 "/usr/include/xlocale.h" 1 3 4
# 27 "/usr/include/xlocale.h" 3 4
typedef struct __locale_struct
{

  struct __locale_data *__locales[13];


  const unsigned short int *__ctype_b;
  const int *__ctype_tolower;
  const int *__ctype_toupper;


  const char *__names[13];
} *__locale_t;


typedef __locale_t locale_t;
# 160 "/usr/include/string.h" 2 3 4


extern int strcoll_l (const char *__s1, const char *__s2, __locale_t __l)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2, 3)));

extern size_t strxfrm_l (char *__dest, const char *__src, size_t __n,
    __locale_t __l) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 4)));




extern char *strdup (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));






extern char *strndup (const char *__string, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__malloc__)) __attribute__ ((__nonnull__ (1)));
# 206 "/usr/include/string.h" 3 4

# 231 "/usr/include/string.h" 3 4
extern char *strchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 258 "/usr/include/string.h" 3 4
extern char *strrchr (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));


# 277 "/usr/include/string.h" 3 4



extern size_t strcspn (const char *__s, const char *__reject)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern size_t strspn (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 310 "/usr/include/string.h" 3 4
extern char *strpbrk (const char *__s, const char *__accept)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 337 "/usr/include/string.h" 3 4
extern char *strstr (const char *__haystack, const char *__needle)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strtok (char *__restrict __s, const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));




extern char *__strtok_r (char *__restrict __s,
    const char *__restrict __delim,
    char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));

extern char *strtok_r (char *__restrict __s, const char *__restrict __delim,
         char **__restrict __save_ptr)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2, 3)));
# 392 "/usr/include/string.h" 3 4


extern size_t strlen (const char *__s)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern size_t strnlen (const char *__string, size_t __maxlen)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));





extern char *strerror (int __errnum) __attribute__ ((__nothrow__ , __leaf__));

# 422 "/usr/include/string.h" 3 4
extern int strerror_r (int __errnum, char *__buf, size_t __buflen) __asm__ ("" "__xpg_strerror_r") __attribute__ ((__nothrow__ , __leaf__))

                        __attribute__ ((__nonnull__ (2)));
# 440 "/usr/include/string.h" 3 4
extern char *strerror_l (int __errnum, __locale_t __l) __attribute__ ((__nothrow__ , __leaf__));





extern void __bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));



extern void bcopy (const void *__src, void *__dest, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));


extern void bzero (void *__s, size_t __n) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1)));


extern int bcmp (const void *__s1, const void *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 484 "/usr/include/string.h" 3 4
extern char *index (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));
# 512 "/usr/include/string.h" 3 4
extern char *rindex (const char *__s, int __c)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1)));




extern int ffs (int __i) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));
# 529 "/usr/include/string.h" 3 4
extern int strcasecmp (const char *__s1, const char *__s2)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));


extern int strncasecmp (const char *__s1, const char *__s2, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__pure__)) __attribute__ ((__nonnull__ (1, 2)));
# 552 "/usr/include/string.h" 3 4
extern char *strsep (char **__restrict __stringp,
       const char *__restrict __delim)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));




extern char *strsignal (int __sig) __attribute__ ((__nothrow__ , __leaf__));


extern char *__stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpcpy (char *__restrict __dest, const char *__restrict __src)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));



extern char *__stpncpy (char *__restrict __dest,
   const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
extern char *stpncpy (char *__restrict __dest,
        const char *__restrict __src, size_t __n)
     __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (1, 2)));
# 658 "/usr/include/string.h" 3 4

# 24 "src/main/fc/msp_server_fc.c" 2
# 1 "/usr/include/math.h" 1 3 4
# 28 "/usr/include/math.h" 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 1 3 4
# 25 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/libm-simd-decl-stubs.h" 1 3 4
# 26 "/usr/include/x86_64-linux-gnu/bits/math-vector.h" 2 3 4
# 32 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/huge_val.h" 1 3 4
# 36 "/usr/include/math.h" 2 3 4

# 1 "/usr/include/x86_64-linux-gnu/bits/huge_valf.h" 1 3 4
# 38 "/usr/include/math.h" 2 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/huge_vall.h" 1 3 4
# 39 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/inf.h" 1 3 4
# 42 "/usr/include/math.h" 2 3 4


# 1 "/usr/include/x86_64-linux-gnu/bits/nan.h" 1 3 4
# 45 "/usr/include/math.h" 2 3 4



# 1 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 1 3 4
# 28 "/usr/include/x86_64-linux-gnu/bits/mathdef.h" 3 4
typedef float float_t;
typedef double double_t;
# 49 "/usr/include/math.h" 2 3 4
# 83 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double acos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acos (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atan2 (double __y, double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern double cos (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cos (double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern double sin (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sin (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tan (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tan (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double cosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double sinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double tanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __tanh (double __x) __attribute__ ((__nothrow__ , __leaf__));

# 86 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double acosh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __acosh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double asinh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __asinh (double __x) __attribute__ ((__nothrow__ , __leaf__));

extern double atanh (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __atanh (double __x) __attribute__ ((__nothrow__ , __leaf__));







 extern double exp (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __frexp (double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern double ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern double __ldexp (double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern double log (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log10 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log10 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern double __modf (double __x, double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 126 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern double expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __expm1 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log1p (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log1p (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double logb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __logb (double __x) __attribute__ ((__nothrow__ , __leaf__));






extern double exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __exp2 (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double log2 (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __log2 (double __x) __attribute__ ((__nothrow__ , __leaf__));








 extern double pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __pow (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __sqrt (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __hypot (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));






extern double cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __cbrt (double __x) __attribute__ ((__nothrow__ , __leaf__));








extern double ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __ceil (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fabs (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __floor (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fmod (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








extern int isinf (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int finite (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __drem (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double significand (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __significand (double __x) __attribute__ ((__nothrow__ , __leaf__));





extern double copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __copysign (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern double nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nan (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern int isnan (double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern double j0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double j1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __j1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double jn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __jn (int, double) __attribute__ ((__nothrow__ , __leaf__));
extern double y0 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y0 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double y1 (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __y1 (double) __attribute__ ((__nothrow__ , __leaf__));
extern double yn (int, double) __attribute__ ((__nothrow__ , __leaf__)); extern double __yn (int, double) __attribute__ ((__nothrow__ , __leaf__));






extern double erf (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erf (double) __attribute__ ((__nothrow__ , __leaf__));
extern double erfc (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __erfc (double) __attribute__ ((__nothrow__ , __leaf__));
extern double lgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double tgamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __tgamma (double) __attribute__ ((__nothrow__ , __leaf__));





extern double gamma (double) __attribute__ ((__nothrow__ , __leaf__)); extern double __gamma (double) __attribute__ ((__nothrow__ , __leaf__));






extern double lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern double __lgamma_r (double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern double rint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __rint (double __x) __attribute__ ((__nothrow__ , __leaf__));


extern double nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nextafter (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern double nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __nexttoward (double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __remainder (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));



extern double scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbn (double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogb (double __x) __attribute__ ((__nothrow__ , __leaf__));




extern double scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalbln (double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern double nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern double __nearbyint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __round (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern double trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __trunc (double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern double remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern double __remquo (double __x, double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrint (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrint (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrint (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lround (double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llround (double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llround (double __x) __attribute__ ((__nothrow__ , __leaf__));



extern double fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)); extern double __fdim (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__));


extern double fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmax (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern double fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern double __fmin (double __x, double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassify (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbit (double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern double fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__)); extern double __fma (double __x, double __y, double __z) __attribute__ ((__nothrow__ , __leaf__));




# 383 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern double scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__)); extern double __scalb (double __x, double __n) __attribute__ ((__nothrow__ , __leaf__));
# 84 "/usr/include/math.h" 2 3 4
# 104 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float acosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atan2f (float __y, float __x) __attribute__ ((__nothrow__ , __leaf__));


 extern float cosf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cosf (float __x) __attribute__ ((__nothrow__ , __leaf__));

 extern float sinf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float coshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __coshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __tanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

# 86 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __acoshf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __asinhf (float __x) __attribute__ ((__nothrow__ , __leaf__));

extern float atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __atanhf (float __x) __attribute__ ((__nothrow__ , __leaf__));







 extern float expf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __frexpf (float __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern float ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern float __ldexpf (float __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern float logf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log10f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log10f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern float __modff (float __x, float *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 126 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern float expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __expm1f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log1pf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float logbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __logbf (float __x) __attribute__ ((__nothrow__ , __leaf__));






extern float exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __exp2f (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float log2f (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __log2f (float __x) __attribute__ ((__nothrow__ , __leaf__));








 extern float powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __powf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __sqrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __hypotf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));






extern float cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __cbrtf (float __x) __attribute__ ((__nothrow__ , __leaf__));








extern float ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __ceilf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fabsf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __floorf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmodf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








extern int isinff (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int finitef (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __dremf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float significandf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __significandf (float __x) __attribute__ ((__nothrow__ , __leaf__));





extern float copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __copysignf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern float nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nanf (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern int isnanf (float __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern float j0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float j1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __j1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float jnf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __jnf (int, float) __attribute__ ((__nothrow__ , __leaf__));
extern float y0f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y0f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float y1f (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __y1f (float) __attribute__ ((__nothrow__ , __leaf__));
extern float ynf (int, float) __attribute__ ((__nothrow__ , __leaf__)); extern float __ynf (int, float) __attribute__ ((__nothrow__ , __leaf__));






extern float erff (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erff (float) __attribute__ ((__nothrow__ , __leaf__));
extern float erfcf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __erfcf (float) __attribute__ ((__nothrow__ , __leaf__));
extern float lgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float tgammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __tgammaf (float) __attribute__ ((__nothrow__ , __leaf__));





extern float gammaf (float) __attribute__ ((__nothrow__ , __leaf__)); extern float __gammaf (float) __attribute__ ((__nothrow__ , __leaf__));






extern float lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern float __lgammaf_r (float, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern float rintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __rintf (float __x) __attribute__ ((__nothrow__ , __leaf__));


extern float nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nextafterf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern float nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __nexttowardf (float __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __remainderf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));



extern float scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbnf (float __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbf (float __x) __attribute__ ((__nothrow__ , __leaf__));




extern float scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalblnf (float __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern float nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern float __nearbyintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __roundf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern float truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __truncf (float __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern float remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern float __remquof (float __x, float __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundf (float __x) __attribute__ ((__nothrow__ , __leaf__));



extern float fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)); extern float __fdimf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__));


extern float fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fmaxf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern float fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern float __fminf (float __x, float __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassifyf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitf (float __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern float fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__)); extern float __fmaf (float __x, float __y, float __z) __attribute__ ((__nothrow__ , __leaf__));




# 383 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern float scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__)); extern float __scalbf (float __x, float __n) __attribute__ ((__nothrow__ , __leaf__));
# 105 "/usr/include/math.h" 2 3 4
# 151 "/usr/include/math.h" 3 4
# 1 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 1 3 4
# 52 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atan2l (long double __y, long double __x) __attribute__ ((__nothrow__ , __leaf__));


 extern long double cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cosl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

 extern long double sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __coshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

# 86 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __acoshl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __asinhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));

extern long double atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __atanhl (long double __x) __attribute__ ((__nothrow__ , __leaf__));







 extern long double expl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __frexpl (long double __x, int *__exponent) __attribute__ ((__nothrow__ , __leaf__));


extern long double ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ldexpl (long double __x, int __exponent) __attribute__ ((__nothrow__ , __leaf__));


 extern long double logl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log10l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)); extern long double __modfl (long double __x, long double *__iptr) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__nonnull__ (2)));

# 126 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4


extern long double expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __expm1l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log1pl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __logbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));






extern long double exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __exp2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __log2l (long double __x) __attribute__ ((__nothrow__ , __leaf__));








 extern long double powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __powl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __sqrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __hypotl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));






extern long double cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __cbrtl (long double __x) __attribute__ ((__nothrow__ , __leaf__));








extern long double ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __ceill (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fabsl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __floorl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmodl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));




extern int __isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern int __finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));








extern int isinfl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int finitel (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __dreml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __significandl (long double __x) __attribute__ ((__nothrow__ , __leaf__));





extern long double copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __copysignl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern long double nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nanl (const char *__tagb) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern int __isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));






extern int isnanl (long double __value) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));





extern long double j0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double j1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __j1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __jnl (int, long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y0l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y0l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double y1l (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __y1l (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __ynl (int, long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double erfl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double erfcl (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __erfcl (long double) __attribute__ ((__nothrow__ , __leaf__));
extern long double lgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double tgammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __tgammal (long double) __attribute__ ((__nothrow__ , __leaf__));





extern long double gammal (long double) __attribute__ ((__nothrow__ , __leaf__)); extern long double __gammal (long double) __attribute__ ((__nothrow__ , __leaf__));






extern long double lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__)); extern long double __lgammal_r (long double, int *__signgamp) __attribute__ ((__nothrow__ , __leaf__));







extern long double rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __rintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));


extern long double nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nextafterl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));

extern long double nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __nexttowardl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remainderl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));



extern long double scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbnl (long double __x, int __n) __attribute__ ((__nothrow__ , __leaf__));



extern int ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern int __ilogbl (long double __x) __attribute__ ((__nothrow__ , __leaf__));




extern long double scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalblnl (long double __x, long int __n) __attribute__ ((__nothrow__ , __leaf__));



extern long double nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long double __nearbyintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __roundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern long double truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __truncl (long double __x) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));




extern long double remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__)); extern long double __remquol (long double __x, long double __y, int *__quo) __attribute__ ((__nothrow__ , __leaf__));






extern long int lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llrintl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long int lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long int __lroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));
__extension__
extern long long int llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__)); extern long long int __llroundl (long double __x) __attribute__ ((__nothrow__ , __leaf__));



extern long double fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fdiml (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__));


extern long double fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fmaxl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));


extern long double fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__)); extern long double __fminl (long double __x, long double __y) __attribute__ ((__nothrow__ , __leaf__)) __attribute__ ((__const__));



extern int __fpclassifyl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));


extern int __signbitl (long double __value) __attribute__ ((__nothrow__ , __leaf__))
     __attribute__ ((__const__));



extern long double fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__)); extern long double __fmal (long double __x, long double __y, long double __z) __attribute__ ((__nothrow__ , __leaf__));




# 383 "/usr/include/x86_64-linux-gnu/bits/mathcalls.h" 3 4
extern long double scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__)); extern long double __scalbl (long double __x, long double __n) __attribute__ ((__nothrow__ , __leaf__));
# 152 "/usr/include/math.h" 2 3 4
# 168 "/usr/include/math.h" 3 4
extern int signgam;
# 209 "/usr/include/math.h" 3 4
enum
  {
    FP_NAN =

      0,
    FP_INFINITE =

      1,
    FP_ZERO =

      2,
    FP_SUBNORMAL =

      3,
    FP_NORMAL =

      4
  };
# 347 "/usr/include/math.h" 3 4
typedef enum
{
  _IEEE_ = -1,
  _SVID_,
  _XOPEN_,
  _POSIX_,
  _ISOC_
} _LIB_VERSION_TYPE;




extern _LIB_VERSION_TYPE _LIB_VERSION;
# 372 "/usr/include/math.h" 3 4
struct exception

  {
    int type;
    char *name;
    double arg1;
    double arg2;
    double retval;
  };




extern int matherr (struct exception *__exc);
# 534 "/usr/include/math.h" 3 4

# 25 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/build/build_config.h" 1
# 18 "./src/main/build/build_config.h"
       
# 27 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/build/debug.h" 1
# 19 "./src/main/build/debug.h"

# 19 "./src/main/build/debug.h"
extern int16_t debug[4];




extern uint32_t sectionTimes[2][4];
# 28 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/platform.h" 1
# 18 "./src/main/platform.h"
       

# 1 "./src/main/target/edison/target.h" 1
# 17 "./src/main/target/edison/target.h"
       
# 200 "./src/main/target/edison/target.h"
uint32_t U_ID_0;
uint32_t U_ID_1;
uint32_t U_ID_2;
# 21 "./src/main/platform.h" 2
# 29 "src/main/fc/msp_server_fc.c" 2

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
# 31 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/common/utils.h" 1
# 18 "./src/main/common/utils.h"
       

# 1 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 1 3 4
# 149 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4

# 149 "/usr/lib/gcc/x86_64-linux-gnu/5/include/stddef.h" 3 4
typedef long int ptrdiff_t;
# 21 "./src/main/common/utils.h" 2
# 72 "./src/main/common/utils.h"

# 72 "./src/main/common/utils.h"
static inline int16_t cmp16(uint16_t a, uint16_t b) { return a-b; }
static inline int32_t cmp32(uint32_t a, uint32_t b) { return a-b; }
# 82 "./src/main/common/utils.h"
void * memcpy_fn ( void * destination, const void * source, size_t num ) asm("memcpy");
# 32 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/common/color.h" 1
# 18 "./src/main/common/color.h"
       


typedef enum {
    RGB_RED = 0,
    RGB_GREEN,
    RGB_BLUE
} colorComponent_e;



typedef union {
    struct {
        uint8_t r;
        uint8_t g;
        uint8_t b;
    } rgb;
    uint8_t raw[(RGB_BLUE + 1)];
} rgbColor24bpp_t;





typedef enum {
    HSV_HUE = 0,
    HSV_SATURATION,
    HSV_VALUE
} hsvColorComponent_e;



typedef struct hsvColor_s {
    uint16_t h;
    uint8_t s;
    uint8_t v;
} hsvColor_t;
# 33 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/common/maths.h" 1
# 18 "./src/main/common/maths.h"
       
# 37 "./src/main/common/maths.h"
typedef struct stdev_s
{
    float m_oldM, m_newM, m_oldS, m_newS;
    int m_n;
} stdev_t;


typedef struct fp_vector {
    float X;
    float Y;
    float Z;
} t_fp_vector_def;

typedef union {
    float A[3];
    t_fp_vector_def V;
} t_fp_vector;



typedef struct fp_angles {
    float roll;
    float pitch;
    float yaw;
} fp_angles_def;

typedef union {
    float raw[3];
    fp_angles_def angles;
} fp_angles_t;

int32_t applyDeadband(int32_t value, int32_t deadband);

int constrain(int amt, int low, int high);
float constrainf(float amt, float low, float high);

void devClear(stdev_t *dev);
void devPush(stdev_t *dev, float x);
float devVariance(stdev_t *dev);
float devStandardDeviation(stdev_t *dev);
float degreesToRadians(int16_t degrees);

int scaleRange(int x, int srcMin, int srcMax, int destMin, int destMax);

void normalizeV(struct fp_vector *src, struct fp_vector *dest);

void rotateV(struct fp_vector *v, fp_angles_t *delta);
void buildRotationMatrix(fp_angles_t *delta, float matrix[3][3]);

int32_t quickMedianFilter3(int32_t * v);
int32_t quickMedianFilter5(int32_t * v);
int32_t quickMedianFilter7(int32_t * v);
int32_t quickMedianFilter9(int32_t * v);
# 105 "./src/main/common/maths.h"
void arraySubInt32(int32_t *dest, int32_t *array1, int32_t *array2, int count);
# 34 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/common/streambuf.h" 1
# 18 "./src/main/common/streambuf.h"
       






typedef struct sbuf_s {
    uint8_t *ptr;
    uint8_t *end;
} sbuf_t;

void sbufWriteU8(sbuf_t *dst, uint8_t val);
void sbufWriteU16(sbuf_t *dst, uint16_t val);
void sbufWriteU32(sbuf_t *dst, uint32_t val);
void sbufWriteData(sbuf_t *dst, const void *data, int len);
void sbufWriteString(sbuf_t *dst, const char *string);

uint8_t sbufReadU8(sbuf_t *src);
uint16_t sbufReadU16(sbuf_t *src);
uint32_t sbufReadU32(sbuf_t *src);
void sbufReadData(sbuf_t *dst, void *data, int len);

int sbufBytesRemaining(sbuf_t *buf);
uint8_t* sbufPtr(sbuf_t *buf);
void sbufAdvance(sbuf_t *buf, int size);

void sbufSwitchToReader(sbuf_t *buf, uint8_t * base);
# 35 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/common/filter.h" 1
# 18 "./src/main/common/filter.h"
       

typedef struct pt1Filter_s {
    float state;
    float RC;
    float dT;
} pt1Filter_t;


typedef struct biquad_s {
    float b0, b1, b2, a1, a2;
    float x1, x2, y1, y2;
} biquad_t;

float applyBiQuadFilter(float sample, biquad_t *state);
void BiQuadNewLpf(float filterCutFreq, biquad_t *newState, uint32_t refreshRate);

void pt1FilterInit(pt1Filter_t *filter, uint8_t f_cut, float dT);
float pt1FilterApply(pt1Filter_t *filter, float input);
float pt1FilterApply4(pt1Filter_t *filter, float input, uint8_t f_cut, float dT);

int32_t filterApplyAverage(int32_t input, uint8_t count, int32_t averageState[]);
float filterApplyAveragef(float input, uint8_t count, float averageState[]);
# 36 "src/main/fc/msp_server_fc.c" 2


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
# 39 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/config/parameter_group_ids.h" 1
# 40 "src/main/fc/msp_server_fc.c" 2
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
# 41 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/config/profile.h" 1
# 18 "./src/main/config/profile.h"
       



typedef struct profileSelection_s {
    uint8_t current_profile_index;
} profileSelection_t;

profileSelection_t profileSelection_System; static inline profileSelection_t* profileSelection(void) { return &profileSelection_System; } struct _dummy;

uint8_t getCurrentProfile(void);
void setProfile(uint8_t profileIndex);
# 42 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/drivers/system.h" 1
# 18 "./src/main/drivers/system.h"
       

void systemInit(void);

void delayMicroseconds(uint32_t us);
void delay(uint32_t ms);
uint64_t micros(void);
uint64_t millis(void);
void delay(uint32_t ms);


void failureMode(uint8_t mode);


void systemReset(void);
void systemResetToBootloader(void);

# 34 "./src/main/drivers/system.h" 3 4
_Bool 
# 34 "./src/main/drivers/system.h"
    isMPUSoftReset(void);

void enableGPIOPowerUsageAndNoiseReductions(void);

extern uint32_t hse_value;

extern uint32_t cachedRccCsrValue;

typedef enum {
    FAILURE_DEVELOPER = 0,
    FAILURE_MISSING_ACC,
    FAILURE_ACC_INIT,
    FAILURE_ACC_INCOMPATIBLE,
    FAILURE_INVALID_EEPROM_CONTENTS,
    FAILURE_FLASH_WRITE_FAILED,
    FAILURE_GYRO_INIT_FAILED
} failureMode_e;
# 44 "src/main/fc/msp_server_fc.c" 2
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
# 45 "src/main/fc/msp_server_fc.c" 2
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
# 46 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/drivers/drivers_compass.h" 1
# 18 "./src/main/drivers/drivers_compass.h"
       


typedef struct mag_s {
    sensorInitFuncPtr init;
    sensorReadFuncPtr read;
} mag_t;


# 26 "./src/main/drivers/drivers_compass.h" 3 4
_Bool 
# 26 "./src/main/drivers/drivers_compass.h"
    sparkfun_compass_Detect(mag_t *mag);
# 47 "src/main/fc/msp_server_fc.c" 2


# 1 "./src/main/drivers/serial.h" 1
# 18 "./src/main/drivers/serial.h"
       

typedef enum portMode_t {
    MODE_RX = 1 << 0,
    MODE_TX = 1 << 1,
    MODE_RXTX = MODE_RX | MODE_TX
} portMode_t;

typedef enum portOptions_t {
    SERIAL_NOT_INVERTED = 0 << 0,
    SERIAL_INVERTED = 1 << 0,
    SERIAL_STOPBITS_1 = 0 << 1,
    SERIAL_STOPBITS_2 = 1 << 1,
    SERIAL_PARITY_NO = 0 << 2,
    SERIAL_PARITY_EVEN = 1 << 2,
    SERIAL_UNIDIR = 0 << 3,
    SERIAL_BIDIR = 1 << 3
} portOptions_t;

typedef void (*serialReceiveCallbackPtr)(uint16_t data);

typedef struct serialPort_s {

    const struct serialPortVTable *vTable;

    uint8_t identifier;
    portMode_t mode;
    portOptions_t options;

    uint32_t baudRate;

    uint32_t rxBufferSize;
    uint32_t txBufferSize;
    volatile uint8_t *rxBuffer;
    volatile uint8_t *txBuffer;
    uint32_t rxBufferHead;
    uint32_t rxBufferTail;
    uint32_t txBufferHead;
    uint32_t txBufferTail;


    serialReceiveCallbackPtr callback;
} serialPort_t;

struct serialPortVTable {
    void (*serialWrite)(serialPort_t *instance, uint8_t ch);

    uint8_t (*serialTotalRxWaiting)(serialPort_t *instance);
    uint8_t (*serialTotalTxFree)(serialPort_t *instance);

    uint8_t (*serialRead)(serialPort_t *instance);


    void (*serialSetBaudRate)(serialPort_t *instance, uint32_t baudRate);

    
# 73 "./src/main/drivers/serial.h" 3 4
   _Bool 
# 73 "./src/main/drivers/serial.h"
        (*isSerialTransmitBufferEmpty)(serialPort_t *instance);

    void (*setMode)(serialPort_t *instance, portMode_t mode);

    void (*writeBuf)(serialPort_t *instance, void *data, int count);

    void (*beginWrite)(serialPort_t *instance);
    void (*endWrite)(serialPort_t *instance);
};

void serialWrite(serialPort_t *instance, uint8_t ch);
void serialWriteBuf(serialPort_t *instance, uint8_t *data, int count);
uint8_t serialRead(serialPort_t *instance);

void serialSetBaudRate(serialPort_t *instance, uint32_t baudRate);
void serialSetMode(serialPort_t *instance, portMode_t mode);


# 90 "./src/main/drivers/serial.h" 3 4
_Bool 
# 90 "./src/main/drivers/serial.h"
    isSerialTransmitBufferEmpty(serialPort_t *instance);
void serialPrint(serialPort_t *instance, const char *str);
uint32_t serialGetBaudRate(serialPort_t *instance);
uint8_t serialRxBytesWaiting(serialPort_t *instance);
uint8_t serialTxBytesFree(serialPort_t *instance);


void serialWriteBufShim(void *instance, uint8_t *data, int count);
void serialBeginWrite(serialPort_t *instance);
void serialEndWrite(serialPort_t *instance);
# 50 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/drivers/bus_i2c.h" 1
# 18 "./src/main/drivers/bus_i2c.h"
       





typedef enum I2CDevice {
    I2CDEV_1,
    I2CDEV_2,
    I2CDEV_6 = 6,
    I2CDEV_MAX = I2CDEV_6,
} I2CDevice;

void i2cInit(I2CDevice index);
# 51 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/drivers/sdcard.h" 1
# 18 "./src/main/drivers/sdcard.h"
       




typedef struct sdcardMetadata_t {
    uint8_t manufacturerID;
    uint16_t oemID;

    char productName[5];

    uint8_t productRevisionMajor;
    uint8_t productRevisionMinor;
    uint32_t productSerial;

    uint16_t productionYear;
    uint8_t productionMonth;

    uint32_t numBlocks;
} sdcardMetadata_t;

typedef enum {
    SDCARD_BLOCK_OPERATION_READ,
    SDCARD_BLOCK_OPERATION_WRITE,
    SDCARD_BLOCK_OPERATION_ERASE,
} sdcardBlockOperation_e;

typedef enum {
    SDCARD_OPERATION_IN_PROGRESS,
    SDCARD_OPERATION_BUSY,
    SDCARD_OPERATION_SUCCESS,
    SDCARD_OPERATION_FAILURE
} sdcardOperationStatus_e;

typedef void(*sdcard_operationCompleteCallback_c)(sdcardBlockOperation_e operation, uint32_t blockIndex, uint8_t *buffer, uint32_t callbackData);

typedef void(*sdcard_profilerCallback_c)(sdcardBlockOperation_e operation, uint32_t blockIndex, uint32_t duration);

void sdcard_init(
# 56 "./src/main/drivers/sdcard.h" 3 4
                _Bool 
# 56 "./src/main/drivers/sdcard.h"
                     useDMA);


# 58 "./src/main/drivers/sdcard.h" 3 4
_Bool 
# 58 "./src/main/drivers/sdcard.h"
    sdcard_readBlock(uint32_t blockIndex, uint8_t *buffer, sdcard_operationCompleteCallback_c callback, uint32_t callbackData);

sdcardOperationStatus_e sdcard_beginWriteBlocks(uint32_t blockIndex, uint32_t blockCount);
sdcardOperationStatus_e sdcard_writeBlock(uint32_t blockIndex, uint8_t *buffer, sdcard_operationCompleteCallback_c callback, uint32_t callbackData);

void sdcardInsertionDetectDeinit(void);
void sdcardInsertionDetectInit(void);


# 66 "./src/main/drivers/sdcard.h" 3 4
_Bool 
# 66 "./src/main/drivers/sdcard.h"
    sdcard_isInserted();

# 67 "./src/main/drivers/sdcard.h" 3 4
_Bool 
# 67 "./src/main/drivers/sdcard.h"
    sdcard_isInitialized();

# 68 "./src/main/drivers/sdcard.h" 3 4
_Bool 
# 68 "./src/main/drivers/sdcard.h"
    sdcard_isFunctional();


# 70 "./src/main/drivers/sdcard.h" 3 4
_Bool 
# 70 "./src/main/drivers/sdcard.h"
    sdcard_poll();
const sdcardMetadata_t* sdcard_getMetadata();

void sdcard_setProfilerCallback(sdcard_profilerCallback_c callback);
# 52 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/drivers/buf_writer.h" 1
# 18 "./src/main/drivers/buf_writer.h"
       


typedef void (*bufWrite_t)(void *arg, void *data, int count);

typedef struct bufWriter_s {
    bufWrite_t writer;
    void *arg;
    uint8_t capacity;
    uint8_t at;
    uint8_t data[];
} bufWriter_t;






bufWriter_t *bufWriterInit(uint8_t *b, int total_size, bufWrite_t writer, void *p);
void bufWriterAppend(bufWriter_t *b, uint8_t ch);
void bufWriterFlush(bufWriter_t *b);
# 53 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/rx/rx.h" 1
# 18 "./src/main/rx/rx.h"
       
# 40 "./src/main/rx/rx.h"
typedef enum {
    SERIAL_RX_FRAME_PENDING = 0,
    SERIAL_RX_FRAME_COMPLETE = (1 << 0),
    SERIAL_RX_FRAME_FAILSAFE = (1 << 1)
} serialrxFrameState_t;

typedef enum {
    SERIALRX_SPEKTRUM1024 = 0,
    SERIALRX_SPEKTRUM2048 = 1,
    SERIALRX_SBUS = 2,
    SERIALRX_SUMD = 3,
    SERIALRX_SUMH = 4,
    SERIALRX_SRXL = 5,
    SERIALRX_XBUS_MODE_B_RJ01 = 6,
    SERIALRX_IBUS = 7,
    SERIALRX_PROVIDER_MAX = SERIALRX_IBUS
} SerialRXType;
# 75 "./src/main/rx/rx.h"
extern const char rcChannelLetters[];

extern int16_t rcData[(18)];







typedef enum {
    RX_FAILSAFE_MODE_AUTO = 0,
    RX_FAILSAFE_MODE_HOLD,
    RX_FAILSAFE_MODE_SET,
    RX_FAILSAFE_MODE_INVALID,
} rxFailsafeChannelMode_e;



typedef enum {
    RX_FAILSAFE_TYPE_FLIGHT = 0,
    RX_FAILSAFE_TYPE_AUX,
} rxFailsafeChannelType_e;



typedef struct rxFailsafeChannelConfiguration_s {
    uint8_t mode;
    uint8_t step;
} rxFailsafeChannelConfig_t;

typedef struct rxChannelRangeConfiguration_s {
    uint16_t min;
    uint16_t max;
} rxChannelRangeConfiguration_t;

typedef struct rxConfig_s {
    uint8_t rcmap[8];
    uint8_t serialrx_provider;
    uint8_t sbus_inversion;
    uint8_t spektrum_sat_bind;
    uint8_t rssi_channel;
    uint8_t rssi_scale;
    uint8_t rssi_ppm_invert;
    uint8_t rcSmoothing;
    uint16_t midrc;
    uint16_t mincheck;
    uint16_t maxcheck;

    uint16_t rx_min_usec;
    uint16_t rx_max_usec;
} rxConfig_t;

rxConfig_t rxConfig_System; static inline rxConfig_t* rxConfig(void) { return &rxConfig_System; } struct _dummy;

extern rxFailsafeChannelConfig_t failsafeChannelConfigs_SystemArray[(18)]; static inline rxFailsafeChannelConfig_t* failsafeChannelConfigs(int _index) { return &failsafeChannelConfigs_SystemArray[_index]; } static inline rxFailsafeChannelConfig_t (* failsafeChannelConfigs_arr(void))[(18)] { return &failsafeChannelConfigs_SystemArray; } struct _dummy;
extern rxChannelRangeConfiguration_t channelRanges_SystemArray[4]; static inline rxChannelRangeConfiguration_t* channelRanges(int _index) { return &channelRanges_SystemArray[_index]; } static inline rxChannelRangeConfiguration_t (* channelRanges_arr(void))[4] { return &channelRanges_SystemArray; } struct _dummy;

typedef struct rxRuntimeConfig_s {
    uint8_t channelCount;
} rxRuntimeConfig_t;

extern rxRuntimeConfig_t rxRuntimeConfig;

typedef uint16_t (*rcReadRawDataPtr)(rxRuntimeConfig_t *rxRuntimeConfig, uint8_t chan);

void updateRx(uint32_t currentTime);

# 142 "./src/main/rx/rx.h" 3 4
_Bool 
# 142 "./src/main/rx/rx.h"
    rxIsReceivingSignal(void);

# 143 "./src/main/rx/rx.h" 3 4
_Bool 
# 143 "./src/main/rx/rx.h"
    rxAreFlightChannelsValid(void);

# 144 "./src/main/rx/rx.h" 3 4
_Bool 
# 144 "./src/main/rx/rx.h"
    shouldProcessRx(uint32_t currentTime);
void calculateRxChannelsAndUpdateFailsafe(uint32_t currentTime);

void parseRcChannels(const char *input, rxConfig_t *rxConfig);
uint8_t serialRxFrameStatus();

void updateRSSI(uint32_t currentTime);
void resetAllRxChannelRangeConfigurations(rxChannelRangeConfiguration_t *rxChannelRangeConfiguration);

void suspendRxSignal(void);
void resumeRxSignal(void);

void initRxRefreshRate(uint16_t *rxRefreshRatePtr);

extern uint16_t rssi;
# 55 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/rx/msp.h" 1
# 18 "./src/main/rx/msp.h"
       


# 20 "./src/main/rx/msp.h" 3 4
_Bool 
# 20 "./src/main/rx/msp.h"
    rxMspFrameComplete(void);
void rxMspFrameReceive(uint16_t *frame, int channelCount);
void rxMspInit(rxRuntimeConfig_t *rxRuntimeConfig, rcReadRawDataPtr *callback);
# 56 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/msp/msp.h" 1
# 18 "./src/main/msp/msp.h"
       



typedef struct mspPacket_s {
    sbuf_t buf;
    int16_t cmd;
    int16_t result;
} mspPacket_t;

void mspInit(void);




int mspProcessCommand(mspPacket_t *command, mspPacket_t *reply);


int mspServerCommandHandler(mspPacket_t *cmd, mspPacket_t *reply);




void mspProcessReply(mspPacket_t *reply);


int mspClientReplyHandler(mspPacket_t *reply);
# 58 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/msp/msp_protocol.h" 1
# 53 "./src/main/msp/msp_protocol.h"
       
# 59 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/msp/msp_serial.h" 1
# 18 "./src/main/msp/msp_serial.h"
       
# 60 "./src/main/msp/msp_serial.h"
typedef enum {
    IDLE,
    HEADER_M,
    HEADER_ARROW,
    HEADER_SIZE,
    HEADER_CMD,
    HEADER_DATA,
    MESSAGE_RECEIVED
} mspState_e;

typedef 
# 70 "./src/main/msp/msp_serial.h" 3 4
       _Bool 
# 70 "./src/main/msp/msp_serial.h"
            (*mspCommandSenderFuncPtr)();




typedef enum {
    MSP_MODE_SERVER,
    MSP_MODE_CLIENT
} mspPortMode_e;

typedef struct mspPort_s {
    serialPort_t *port;
    mspPortMode_e mode;

    mspCommandSenderFuncPtr commandSenderFn;

    mspState_e c_state;
    uint8_t offset;
    uint8_t dataSize;
    uint8_t cmdMSP;
    uint8_t inBuf[64];

} mspPort_t;

extern mspPort_t mspPorts[2];

typedef void (*mspPostProcessFuncPtr)(mspPort_t *);

extern mspPostProcessFuncPtr mspPostProcessFn;

void mspSerialInit(void);
void mspSerialProcess();
void mspSerialAllocatePorts(void);
void mspSerialReleasePortIfAllocated(serialPort_t *serialPort);
# 60 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/fc/rate_profile.h" 1
# 18 "./src/main/fc/rate_profile.h"
       

typedef struct controlRateConfig_s {
    uint8_t rcRate8;
    uint8_t rcExpo8;
    uint8_t thrMid8;
    uint8_t thrExpo8;
    uint8_t rates[3];
    uint8_t dynThrPID;
    uint8_t rcYawExpo8;
    uint16_t tpa_breakpoint;
} controlRateConfig_t;


extern controlRateConfig_t controlRateProfiles_SystemArray[3]; static inline controlRateConfig_t* controlRateProfiles(int _index) { return &controlRateProfiles_SystemArray[_index]; } static inline controlRateConfig_t (* controlRateProfiles_arr(void))[3] { return &controlRateProfiles_SystemArray; } struct _dummy;

extern controlRateConfig_t *currentControlRateProfile;

typedef struct rateProfileSelection_s {
    uint8_t defaultRateProfileIndex;
} rateProfileSelection_t;

extern rateProfileSelection_t *rateProfileSelection_ProfileCurrent; static inline rateProfileSelection_t* rateProfileSelection(void) { return rateProfileSelection_ProfileCurrent; } struct _dummy;

void setControlRateProfile(uint8_t profileIndex);
uint8_t getCurrentControlRateProfile(void);
controlRateConfig_t *getControlRateConfig(uint8_t profileIndex);
void configureRateProfileSelection(uint8_t profileIndex, uint8_t rateProfileIndex);
void resetControlRateConfig(controlRateConfig_t *controlRateConfig);

void activateControlRateConfig(void);
# 62 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/fc/rc_controls.h" 1
# 18 "./src/main/fc/rc_controls.h"
       



typedef enum {
    BOXARM = 0,
    BOXANGLE,
    BOXHORIZON,
    BOXBARO,

    BOXMAG,
    BOXHEADFREE,
    BOXHEADADJ,
    BOXCAMSTAB,
    BOXCAMTRIG,
    BOXGPSHOME,
    BOXGPSHOLD,
    BOXPASSTHRU,
    BOXBEEPERON,
    BOXLEDMAX,
    BOXLEDLOW,
    BOXLLIGHTS,
    BOXCALIB,
    BOXGOV,
    BOXOSD,
    BOXTELEMETRY,
    BOXGTUNE,
    BOXSONAR,
    BOXSERVO1,
    BOXSERVO2,
    BOXSERVO3,
    BOXBLACKBOX,
    BOXFAILSAFE,
    BOXAIRMODE,
    CHECKBOX_ITEM_COUNT
} boxId_e;

typedef enum rc_alias {
    ROLL = 0,
    PITCH,
    YAW,
    THROTTLE,
    AUX1,
    AUX2,
    AUX3,
    AUX4,
    AUX5,
    AUX6,
    AUX7,
    AUX8
} rc_alias_e;

typedef enum {
    THROTTLE_LOW = 0,
    THROTTLE_HIGH
} throttleStatus_e;

typedef enum {
    NOT_CENTERED = 0,
    CENTERED
} rollPitchStatus_e;
# 116 "./src/main/fc/rc_controls.h"
typedef struct channelRange_s {
    uint8_t startStep;
    uint8_t endStep;
} channelRange_t;

typedef struct modeActivationCondition_s {
    boxId_e modeId;
    uint8_t auxChannelIndex;
    channelRange_t range;
} modeActivationCondition_t;



typedef struct modeActivationProfile_s {
    modeActivationCondition_t modeActivationConditions[20];
} modeActivationProfile_t;

extern modeActivationProfile_t *modeActivationProfile_ProfileCurrent; static inline modeActivationProfile_t* modeActivationProfile(void) { return modeActivationProfile_ProfileCurrent; } struct _dummy;

extern int16_t rcCommand[4];

typedef struct rcControlsConfig_s {
    uint8_t deadband;
    uint8_t yaw_deadband;
    uint8_t alt_hold_deadband;
    uint8_t alt_hold_fast_change;
    int8_t yaw_control_direction;
    uint16_t deadband3d_throttle;
} rcControlsConfig_t;

extern rcControlsConfig_t *rcControlsConfig_ProfileCurrent; static inline rcControlsConfig_t* rcControlsConfig(void) { return rcControlsConfig_ProfileCurrent; } struct _dummy;

typedef struct armingConfig_s {

    uint8_t retarded_arm;
    uint8_t disarm_kill_switch;
    uint8_t auto_disarm_delay;
    uint8_t max_arm_angle;
} armingConfig_t;

armingConfig_t armingConfig_System; static inline armingConfig_t* armingConfig(void) { return &armingConfig_System; } struct _dummy;


# 158 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 158 "./src/main/fc/rc_controls.h"
    areUsingSticksToArm(void);


# 160 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 160 "./src/main/fc/rc_controls.h"
    areSticksInApModePosition(uint16_t ap_mode);
throttleStatus_e calculateThrottleStatus(rxConfig_t *rxConfig, uint16_t deadband3d_throttle);
rollPitchStatus_e calculateRollPitchCenterStatus(rxConfig_t *rxConfig);
void processRcStickPositions(rxConfig_t *rxConfig, throttleStatus_e throttleStatus, 
# 163 "./src/main/fc/rc_controls.h" 3 4
                                                                                   _Bool 
# 163 "./src/main/fc/rc_controls.h"
                                                                                        retarded_arm, 
# 163 "./src/main/fc/rc_controls.h" 3 4
                                                                                                      _Bool 
# 163 "./src/main/fc/rc_controls.h"
                                                                                                           disarm_kill_switch);


# 165 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 165 "./src/main/fc/rc_controls.h"
    rcModeIsActive(boxId_e modeId);
void rcModeUpdateActivated(modeActivationCondition_t *modeActivationConditions);

# 167 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 167 "./src/main/fc/rc_controls.h"
    rcModeIsActivationConditionPresent(modeActivationCondition_t *modeActivationConditions, boxId_e modeId);



# 170 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 170 "./src/main/fc/rc_controls.h"
    isUsingSticksForArming(void);

int32_t getRcStickDeflection(int32_t axis, uint16_t midrc);

void useRcControlsConfig(modeActivationCondition_t *modeActivationConditions);


# 176 "./src/main/fc/rc_controls.h" 3 4
_Bool 
# 176 "./src/main/fc/rc_controls.h"
    isRangeActive(uint8_t auxChannelIndex, channelRange_t *range);
# 63 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/fc/rc_adjustments.h" 1
# 18 "./src/main/fc/rc_adjustments.h"
       
# 29 "./src/main/fc/rc_adjustments.h"
typedef enum {
    ADJUSTMENT_NONE = 0,
    ADJUSTMENT_RC_RATE,
    ADJUSTMENT_RC_EXPO,
    ADJUSTMENT_THROTTLE_EXPO,
    ADJUSTMENT_PITCH_ROLL_RATE,
    ADJUSTMENT_YAW_RATE,
    ADJUSTMENT_PITCH_ROLL_P,
    ADJUSTMENT_PITCH_ROLL_I,
    ADJUSTMENT_PITCH_ROLL_D,
    ADJUSTMENT_YAW_P,
    ADJUSTMENT_YAW_I,
    ADJUSTMENT_YAW_D,
    ADJUSTMENT_RATE_PROFILE,
    ADJUSTMENT_PITCH_RATE,
    ADJUSTMENT_ROLL_RATE,
    ADJUSTMENT_PITCH_P,
    ADJUSTMENT_PITCH_I,
    ADJUSTMENT_PITCH_D,
    ADJUSTMENT_ROLL_P,
    ADJUSTMENT_ROLL_I,
    ADJUSTMENT_ROLL_D,
    ADJUSTMENT_ALT_P,
    ADJUSTMENT_ALT_I,
    ADJUSTMENT_ALT_D,
    ADJUSTMENT_VEL_P,
    ADJUSTMENT_VEL_I,
    ADJUSTMENT_VEL_D,
    ADJUSTMENT_MAG_P,
    ADJUSTMENT_POS_P,
    ADJUSTMENT_POS_I,
    ADJUSTMENT_POSR_P,
    ADJUSTMENT_POSR_I,
    ADJUSTMENT_POSR_D,
    ADJUSTMENT_NAVR_P,
    ADJUSTMENT_NAVR_I,
    ADJUSTMENT_NAVR_D,
    ADJUSTMENT_LEVEL_P,
    ADJUSTMENT_LEVEL_I,
    ADJUSTMENT_LEVEL_D,

} adjustmentFunction_e;



typedef enum {
    ADJUSTMENT_MODE_STEP,
    ADJUSTMENT_MODE_SELECT
} adjustmentMode_e;

typedef struct adjustmentStepConfig_s {
    uint8_t step;
} adjustmentStepConfig_t;

typedef struct adjustmentSelectConfig_s {
    uint8_t switchPositions;
} adjustmentSelectConfig_t;

typedef union adjustmentConfig_u {
    adjustmentStepConfig_t stepConfig;
    adjustmentSelectConfig_t selectConfig;
} adjustmentData_t;

typedef struct adjustmentConfig_s {
    uint8_t adjustmentFunction;
    uint8_t mode;
    adjustmentData_t data;
} adjustmentConfig_t;

typedef struct adjustmentRange_s {

    uint8_t auxChannelIndex;
    channelRange_t range;


    uint8_t adjustmentFunction;
    uint8_t auxSwitchChannelIndex;


    uint8_t adjustmentIndex;
} adjustmentRange_t;



typedef struct adjustmentState_s {
    uint8_t auxChannelIndex;
    adjustmentConfig_t config;
    uint32_t timeoutAt;
    adjustmentRange_t *range;
} adjustmentState_t;



typedef struct adjustmentProfile_s {
    adjustmentRange_t adjustmentRanges[12];
} adjustmentProfile_t;

extern adjustmentProfile_t *adjustmentProfile_ProfileCurrent; static inline adjustmentProfile_t* adjustmentProfile(void) { return adjustmentProfile_ProfileCurrent; } struct _dummy;






void resetAdjustmentStates(void);
void configureAdjustmentState(adjustmentRange_t *adjustmentRange);
void updateAdjustmentStates(adjustmentRange_t *adjustmentRanges);
void processRcAdjustments(controlRateConfig_t *controlRateConfig, rxConfig_t *rxConfig);
# 64 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/fc/fc_tasks.h" 1
# 18 "./src/main/fc/fc_tasks.h"
       




typedef enum {

    TASK_SYSTEM = 0,
    TASK_SERIAL,

    TASK_COMPASS,

    TEST,
    TASK_ACCEL,
    TASK_GYROPID,



    TASK_BATTERY,
    TASK_RX,
# 63 "./src/main/fc/fc_tasks.h"
    TASK_COUNT
} cfTaskId_e;

void taskMainPidLoopChecker(void);
void taskUpdateAccelerometer(void);
void taskHandleSerial(void);
void taskUpdateBeeper(void);
void taskUpdateBattery(void);

# 71 "./src/main/fc/fc_tasks.h" 3 4
_Bool 
# 71 "./src/main/fc/fc_tasks.h"
    taskUpdateRxCheck(uint32_t currentDeltaTime);
void taskUpdateRxMain(void);
void taskProcessGPS(void);
void taskUpdateCompass(void);
void taskUpdateBaro(void);
void taskUpdateSonar(void);
void taskCalculateAltitude(void);
void taskUpdateDisplay(void);
void taskTelemetry(void);
void taskLedStrip(void);
void taskTransponder(void);
void taskSystem(void);
void print(void);
# 65 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/fc/runtime_config.h" 1
# 18 "./src/main/fc/runtime_config.h"
       


typedef enum {
    OK_TO_ARM = (1 << 0),
    PREVENT_ARMING = (1 << 1),
    ARMED = (1 << 2)
} armingFlag_e;

extern uint8_t armingFlags;





typedef enum {
    ANGLE_MODE = (1 << 0),
    HORIZON_MODE = (1 << 1),
    MAG_MODE = (1 << 2),
    BARO_MODE = (1 << 3),
    GPS_HOME_MODE = (1 << 4),
    GPS_HOLD_MODE = (1 << 5),
    HEADFREE_MODE = (1 << 6),
    UNUSED_MODE = (1 << 7),
    PASSTHRU_MODE = (1 << 8),
    SONAR_MODE = (1 << 9),
    FAILSAFE_MODE = (1 << 10),
    GTUNE_MODE = (1 << 11),
} flightModeFlags_e;

extern uint16_t flightModeFlags;
# 62 "./src/main/fc/runtime_config.h"
typedef enum {
    GPS_FIX_HOME = (1 << 0),
    GPS_FIX = (1 << 1),
    CALIBRATE_MAG = (1 << 2),
    SMALL_ANGLE = (1 << 3),
    FIXED_WING = (1 << 4),
    ANTI_WINDUP = (1 << 5),
} stateFlags_t;





extern uint8_t stateFlags;

uint16_t enableFlightMode(flightModeFlags_e mask);
uint16_t disableFlightMode(flightModeFlags_e mask);


# 80 "./src/main/fc/runtime_config.h" 3 4
_Bool 
# 80 "./src/main/fc/runtime_config.h"
    sensors(uint32_t mask);
void sensorsSet(uint32_t mask);
void sensorsClear(uint32_t mask);
uint32_t sensorsMask(void);

void mwDisarm(void);
# 66 "src/main/fc/msp_server_fc.c" 2
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
# 67 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/scheduler/scheduler.h" 1
# 18 "./src/main/scheduler/scheduler.h"
       







typedef enum {
    TASK_PRIORITY_IDLE = 0,
    TASK_PRIORITY_LOW = 1,
    TASK_PRIORITY_MEDIUM = 3,
    TASK_PRIORITY_HIGH = 5,
    TASK_PRIORITY_REALTIME = 6,
    TASK_PRIORITY_MAX = 255
} cfTaskPriority_e;



typedef struct {
    const char * taskName;
    
# 39 "./src/main/scheduler/scheduler.h" 3 4
   _Bool 
# 39 "./src/main/scheduler/scheduler.h"
                isEnabled;
    uint32_t desiredPeriod;
    uint8_t staticPriority;
    uint32_t maxExecutionTime;
    uint32_t totalExecutionTime;
    uint32_t averageExecutionTime;
    uint32_t latestDeltaTime;
} cfTaskInfo_t;

typedef struct {

    const char * taskName;
    
# 51 "./src/main/scheduler/scheduler.h" 3 4
   _Bool 
# 51 "./src/main/scheduler/scheduler.h"
        (*checkFunc)(uint32_t currentDeltaTime);
    void (*taskFunc)(void);
    uint32_t desiredPeriod;
    const uint8_t staticPriority;


    uint16_t dynamicPriority;
    uint16_t taskAgeCycles;
    uint32_t lastExecutedAt;
    uint32_t lastSignaledAt;


    uint32_t averageExecutionTime;
    uint32_t taskLatestDeltaTime;

    uint32_t maxExecutionTime;
    uint32_t totalExecutionTime;

} cfTask_t;

extern uint16_t cpuLoad;
extern uint16_t averageSystemLoadPercent;

extern cfTask_t* taskQueueArray[];
extern const uint32_t taskQueueArraySize;
extern const uint32_t taskCount;
extern cfTask_t cfTasks[];

void getTaskInfo(const int taskId, cfTaskInfo_t *taskInfo);
void rescheduleTask(const int taskId, uint32_t newPeriodMicros);
void setTaskEnabled(const int taskId, 
# 81 "./src/main/scheduler/scheduler.h" 3 4
                                     _Bool 
# 81 "./src/main/scheduler/scheduler.h"
                                          newEnabledState);
uint32_t getTaskDeltaTime(const int taskId);

void schedulerInit(void);
void scheduler(void);
# 69 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/io/motor_and_servo.h" 1
# 18 "./src/main/io/motor_and_servo.h"
       

typedef struct motorAndServoConfig_s {


    uint16_t minthrottle;
    uint16_t maxthrottle;
    uint16_t mincommand;
    uint16_t servoCenterPulse;

    uint16_t motor_pwm_rate;
    uint16_t servo_pwm_rate;
} motorAndServoConfig_t;

motorAndServoConfig_t motorAndServoConfig_System; static inline motorAndServoConfig_t* motorAndServoConfig(void) { return &motorAndServoConfig_System; } struct _dummy;
# 71 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/gps.h" 1
# 18 "./src/main/io/gps.h"
       






typedef enum {
    GPS_NMEA = 0,
    GPS_UBLOX
} gpsProvider_e;



typedef enum {
    SBAS_AUTO = 0,
    SBAS_EGNOS,
    SBAS_WAAS,
    SBAS_MSAS,
    SBAS_GAGAN
} sbasMode_e;



typedef enum {
    GPS_BAUDRATE_115200 = 0,
    GPS_BAUDRATE_57600,
    GPS_BAUDRATE_38400,
    GPS_BAUDRATE_19200,
    GPS_BAUDRATE_9600
} gpsBaudRate_e;

typedef enum {
    GPS_AUTOCONFIG_OFF = 0,
    GPS_AUTOCONFIG_ON,
} gpsAutoConfig_e;

typedef enum {
    GPS_AUTOBAUD_OFF = 0,
    GPS_AUTOBAUD_ON
} gpsAutoBaud_e;



typedef struct gpsConfig_s {
    gpsProvider_e provider;
    sbasMode_e sbasMode;
    gpsAutoConfig_e autoConfig;
    gpsAutoBaud_e autoBaud;
} gpsConfig_t;

gpsConfig_t gpsConfig_System; static inline gpsConfig_t* gpsConfig(void) { return &gpsConfig_System; } struct _dummy;

typedef struct gpsCoordinateDDDMMmmmm_s {
    int16_t dddmm;
    int16_t mmmm;
} gpsCoordinateDDDMMmmmm_t;


typedef enum {
    GPS_MESSAGE_STATE_IDLE = 0,
    GPS_MESSAGE_STATE_INIT,
    GPS_MESSAGE_STATE_SBAS,
    GPS_MESSAGE_STATE_MAX = GPS_MESSAGE_STATE_SBAS
} gpsMessageState_e;



typedef struct gpsData_s {
    uint8_t state;
    uint8_t baudrateIndex;
    uint32_t errors;
    uint32_t timeouts;
    uint32_t lastMessage;
    uint32_t lastLastMessage;

    uint32_t state_position;
    uint32_t state_ts;
    gpsMessageState_e messageState;
} gpsData_t;


extern char gpsPacketLog[21];

extern gpsData_t gpsData;
extern int32_t GPS_coord[2];

extern uint8_t GPS_numSat;
extern uint16_t GPS_hdop;
extern uint8_t GPS_update;
extern uint32_t GPS_packetCount;
extern uint32_t GPS_svInfoReceivedCount;
extern uint16_t GPS_altitude;
extern uint16_t GPS_speed;
extern uint16_t GPS_ground_course;
extern uint8_t GPS_numCh;
extern uint8_t GPS_svinfo_chn[16];
extern uint8_t GPS_svinfo_svid[16];
extern uint8_t GPS_svinfo_quality[16];
extern uint8_t GPS_svinfo_cno[16];

extern uint32_t GPS_garbageByteCount;




void gpsInit(void);

void gpsThread(void);

# 127 "./src/main/io/gps.h" 3 4
_Bool 
# 127 "./src/main/io/gps.h"
    gpsNewFrame(uint8_t c);
void updateGpsIndicator(uint32_t currentTime);
# 72 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/gimbal.h" 1
# 18 "./src/main/io/gimbal.h"
       

typedef enum {
    GIMBAL_MODE_NORMAL = 0,
    GIMBAL_MODE_MIXTILT = 1
} gimbalMode_e;



typedef struct gimbalConfig_s {
    uint8_t mode;
} gimbalConfig_t;

extern gimbalConfig_t *gimbalConfig_ProfileCurrent; static inline gimbalConfig_t* gimbalConfig(void) { return gimbalConfig_ProfileCurrent; } struct _dummy;
# 73 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/io_serial.h" 1
# 18 "./src/main/io/io_serial.h"
       

typedef enum {
    PORTSHARING_UNUSED = 0,
    PORTSHARING_NOT_SHARED,
    PORTSHARING_SHARED
} portSharing_e;

typedef enum {
    FUNCTION_NONE = 0,
    FUNCTION_MSP_SERVER = (1 << 0),
    FUNCTION_GPS = (1 << 1),
    FUNCTION_TELEMETRY_FRSKY = (1 << 2),
    FUNCTION_TELEMETRY_HOTT = (1 << 3),
    FUNCTION_TELEMETRY_LTM = (1 << 4),
    FUNCTION_TELEMETRY_SMARTPORT = (1 << 5),
    FUNCTION_RX_SERIAL = (1 << 6),
    FUNCTION_BLACKBOX = (1 << 7),
    FUNCTION_TELEMETRY_MAVLINK = (1 << 8),
    FUNCTION_MSP_CLIENT = (1 << 9)
} serialPortFunction_e;

typedef enum {
    BAUD_AUTO = 0,
    BAUD_9600,
    BAUD_19200,
    BAUD_38400,
    BAUD_57600,
    BAUD_115200,
    BAUD_230400,
    BAUD_250000,
} baudRate_e;

extern const uint32_t baudRates[];


typedef enum {
    SERIAL_PORT_NONE = -1,
    SERIAL_PORT_UART1 = 0,
    SERIAL_PORT_UART2,
    SERIAL_PORT_UART3,
    SERIAL_PORT_UART4,
    SERIAL_PORT_UART5,
    SERIAL_PORT_USB_VCP = 20,
    SERIAL_PORT_SOFTSERIAL1 = 30,
    SERIAL_PORT_SOFTSERIAL2,
    SERIAL_PORT_IDENTIFIER_MAX = SERIAL_PORT_SOFTSERIAL2
} serialPortIdentifier_e;

extern const serialPortIdentifier_e serialPortIdentifiers[2];

void serialInit(
# 69 "./src/main/io/io_serial.h" 3 4
               _Bool 
# 69 "./src/main/io/io_serial.h"
                    softserialEnabled);





typedef struct serialPortUsage_s {
    serialPortIdentifier_e identifier;
    serialPort_t *serialPort;
    serialPortFunction_e function;
} serialPortUsage_t;

serialPort_t *findSharedSerialPort(uint16_t functionMask, serialPortFunction_e sharedWithFunction);
serialPort_t *findNextSharedSerialPort(uint16_t functionMask, serialPortFunction_e sharedWithFunction);







typedef struct serialPortConfig_s {
    serialPortIdentifier_e identifier;
    uint16_t functionMask;
    uint8_t baudRates[4];
} serialPortConfig_t;

typedef struct serialConfig_s {
    uint8_t reboot_character;
    serialPortConfig_t portConfigs[2];
} serialConfig_t;

serialConfig_t serialConfig_System; static inline serialConfig_t* serialConfig(void) { return &serialConfig_System; } struct _dummy;




void serialRemovePort(serialPortIdentifier_e identifier);
uint8_t serialGetAvailablePortCount(void);

# 108 "./src/main/io/io_serial.h" 3 4
_Bool 
# 108 "./src/main/io/io_serial.h"
    serialIsPortAvailable(serialPortIdentifier_e identifier);

# 109 "./src/main/io/io_serial.h" 3 4
_Bool 
# 109 "./src/main/io/io_serial.h"
    isSerialConfigValid(serialConfig_t *serialConfig);
serialPortConfig_t *serialFindPortConfiguration(serialPortIdentifier_e identifier);

# 111 "./src/main/io/io_serial.h" 3 4
_Bool 
# 111 "./src/main/io/io_serial.h"
    doesConfigurationUsePort(serialPortIdentifier_e portIdentifier);
serialPortConfig_t *findSerialPortConfig(uint16_t mask);
serialPortConfig_t *findNextSerialPortConfig(uint16_t mask);

portSharing_e determinePortSharing(serialPortConfig_t *portConfig, serialPortFunction_e function);

# 116 "./src/main/io/io_serial.h" 3 4
_Bool 
# 116 "./src/main/io/io_serial.h"
    isSerialPortShared(serialPortConfig_t *portConfig, uint16_t functionMask, serialPortFunction_e sharedWithFunction);

# 117 "./src/main/io/io_serial.h" 3 4
_Bool 
# 117 "./src/main/io/io_serial.h"
    isSerialPortOpen(serialPortConfig_t *portConfig);





serialPort_t *openSerialPort(
    serialPortIdentifier_e identifier,
    serialPortFunction_e function,
    serialReceiveCallbackPtr callback,
    uint32_t baudrate,
    portMode_t mode,
    portOptions_t options
);
void closeSerialPort(serialPort_t *serialPort);

void waitForSerialPortToFinishTransmitting(serialPort_t *serialPort);

baudRate_e lookupBaudRateIndex(uint32_t baudRate);





void evaluateOtherData(serialPort_t *serialPort, uint8_t receivedChar);
void handleSerial(void);
# 74 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/ledstrip.h" 1
# 18 "./src/main/io/ledstrip.h"
       
# 69 "./src/main/io/ledstrip.h"
typedef enum {
    LED_MODE_ORIENTATION = 0,
    LED_MODE_HEADFREE,
    LED_MODE_HORIZON,
    LED_MODE_ANGLE,
    LED_MODE_MAG,
    LED_MODE_BARO,
    LED_SPECIAL
} ledModeIndex_e;

typedef enum {
    LED_SCOLOR_DISARMED = 0,
    LED_SCOLOR_ARMED,
    LED_SCOLOR_ANIMATION,
    LED_SCOLOR_BACKGROUND,
    LED_SCOLOR_BLINKBACKGROUND,
    LED_SCOLOR_GPSNOSATS,
    LED_SCOLOR_GPSNOLOCK,
    LED_SCOLOR_GPSLOCKED
} ledSpecialColorIds_e;

typedef enum {
    LED_DIRECTION_NORTH = 0,
    LED_DIRECTION_EAST,
    LED_DIRECTION_SOUTH,
    LED_DIRECTION_WEST,
    LED_DIRECTION_UP,
    LED_DIRECTION_DOWN
} ledDirectionId_e;

typedef enum {
    LED_FUNCTION_COLOR,
    LED_FUNCTION_FLIGHT_MODE,
    LED_FUNCTION_ARM_STATE,
    LED_FUNCTION_BATTERY,
    LED_FUNCTION_RSSI,
    LED_FUNCTION_GPS,
    LED_FUNCTION_THRUST_RING,
} ledBaseFunctionId_e;

typedef enum {
    LED_OVERLAY_THROTTLE,
    LED_OVERLAY_LARSON_SCANNER,
    LED_OVERLAY_BLINK,
    LED_OVERLAY_LANDING_FLASH,
    LED_OVERLAY_INDICATOR,
    LED_OVERLAY_WARNING,
} ledOverlayId_e;

typedef struct modeColorIndexes_s {
    uint8_t color[6];
} modeColorIndexes_t;

typedef struct specialColorIndexes_s {
    uint8_t color[11];
} specialColorIndexes_t;

typedef uint32_t ledConfig_t;

typedef struct ledCounts_s {
    uint8_t count;
    uint8_t ring;
    uint8_t larson;
    uint8_t ringSeqLen;
} ledCounts_t;



static inline uint8_t ledGetXY(const ledConfig_t *lcfg) { return ((*lcfg >> 0) & ((1 << (8)) - 1)); }
static inline uint8_t ledGetX(const ledConfig_t *lcfg) { return ((*lcfg >> (0 + 4)) & 0x0F); }
static inline uint8_t ledGetY(const ledConfig_t *lcfg) { return ((*lcfg >> (0 + 0)) & 0x0F); }
static inline uint8_t ledGetFunction(const ledConfig_t *lcfg) { return ((*lcfg >> 8) & ((1 << (4)) - 1)); }
static inline uint8_t ledGetOverlay(const ledConfig_t *lcfg) { return ((*lcfg >> 12) & ((1 << (6)) - 1)); }
static inline uint8_t ledGetColor(const ledConfig_t *lcfg) { return ((*lcfg >> 18) & ((1 << (4)) - 1)); }
static inline uint8_t ledGetDirection(const ledConfig_t *lcfg) { return ((*lcfg >> 22) & ((1 << (6)) - 1)); }
static inline uint8_t ledGetParams(const ledConfig_t *lcfg) { return ((*lcfg >> 28) & ((1 << (4)) - 1)); }

static inline 
# 146 "./src/main/io/ledstrip.h" 3 4
             _Bool 
# 146 "./src/main/io/ledstrip.h"
                  ledGetOverlayBit(const ledConfig_t *lcfg, int id) { return ((ledGetOverlay(lcfg) >> id) & 1); }
static inline 
# 147 "./src/main/io/ledstrip.h" 3 4
             _Bool 
# 147 "./src/main/io/ledstrip.h"
                  ledGetDirectionBit(const ledConfig_t *lcfg, int id) { return ((ledGetDirection(lcfg) >> id) & 1); }

extern ledConfig_t ledConfigs_SystemArray[32]; static inline ledConfig_t* ledConfigs(int _index) { return &ledConfigs_SystemArray[_index]; } static inline ledConfig_t (* ledConfigs_arr(void))[32] { return &ledConfigs_SystemArray; } struct _dummy;
extern hsvColor_t colors_SystemArray[16]; static inline hsvColor_t* colors(int _index) { return &colors_SystemArray[_index]; } static inline hsvColor_t (* colors_arr(void))[16] { return &colors_SystemArray; } struct _dummy;
extern modeColorIndexes_t modeColors_SystemArray[6]; static inline modeColorIndexes_t* modeColors(int _index) { return &modeColors_SystemArray[_index]; } static inline modeColorIndexes_t (* modeColors_arr(void))[6] { return &modeColors_SystemArray; } struct _dummy;
specialColorIndexes_t specialColors_System; static inline specialColorIndexes_t* specialColors(void) { return &specialColors_System; } struct _dummy;


# 154 "./src/main/io/ledstrip.h" 3 4
_Bool 
# 154 "./src/main/io/ledstrip.h"
    parseColor(int index, const char *colorConfig);


# 156 "./src/main/io/ledstrip.h" 3 4
_Bool 
# 156 "./src/main/io/ledstrip.h"
    parseLedStripConfig(int ledIndex, const char *config);
void generateLedConfig(int ledIndex, char *ledConfigBuffer, size_t bufferSize);
void reevaluateLedConfig(void);

void ledStripInit(void);
void ledStripEnable(void);
void updateLedStrip(void);


# 164 "./src/main/io/ledstrip.h" 3 4
_Bool 
# 164 "./src/main/io/ledstrip.h"
    setModeColor(ledModeIndex_e modeIndex, int modeColorIndex, int colorIndex);

extern uint16_t rssi;
# 75 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/flashfs.h" 1
# 18 "./src/main/io/flashfs.h"
       



# 1 "./src/main/drivers/flash.h" 1
# 18 "./src/main/drivers/flash.h"
       



typedef struct flashGeometry_s {
    uint16_t sectors;

    uint16_t pagesPerSector;
    const uint16_t pageSize;

    uint32_t sectorSize;

    uint32_t totalSize;
} flashGeometry_t;
# 23 "./src/main/io/flashfs.h" 2







void flashfsEraseCompletely();
void flashfsEraseRange(uint32_t start, uint32_t end);

uint32_t flashfsGetSize();
uint32_t flashfsGetOffset();
uint32_t flashfsGetWriteBufferFreeSpace();
uint32_t flashfsGetWriteBufferSize();
int flashfsIdentifyStartOfFreeSpace();
const flashGeometry_t* flashfsGetGeometry();

void flashfsSeekAbs(uint32_t offset);
void flashfsSeekRel(int32_t offset);

void flashfsWriteByte(uint8_t byte);
void flashfsWrite(const uint8_t *data, unsigned int len, 
# 44 "./src/main/io/flashfs.h" 3 4
                                                        _Bool 
# 44 "./src/main/io/flashfs.h"
                                                             sync);

int flashfsReadAbs(uint32_t offset, uint8_t *data, unsigned int len);


# 48 "./src/main/io/flashfs.h" 3 4
_Bool 
# 48 "./src/main/io/flashfs.h"
    flashfsFlushAsync();
void flashfsFlushSync();

void flashfsInit();


# 53 "./src/main/io/flashfs.h" 3 4
_Bool 
# 53 "./src/main/io/flashfs.h"
    flashfsIsReady();

# 54 "./src/main/io/flashfs.h" 3 4
_Bool 
# 54 "./src/main/io/flashfs.h"
    flashfsIsEOF();
# 76 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/transponder_ir.h" 1
# 18 "./src/main/io/transponder_ir.h"
       

typedef struct transponderConfig_s {
    uint8_t data[6];
} transponderConfig_t;

transponderConfig_t transponderConfig_System; static inline transponderConfig_t* transponderConfig(void) { return &transponderConfig_System; } struct _dummy;

void transponderInit(uint8_t* transponderCode);

void transponderEnable(void);
void transponderDisable(void);
void updateTransponder(void);
void transponderUpdateData(uint8_t* transponderData);
void transponderTransmitOnce(void);
void transponderStartRepeating(void);
void transponderStopRepeating(void);
# 77 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/asyncfatfs/asyncfatfs.h" 1
# 18 "./src/main/io/asyncfatfs/asyncfatfs.h"
       




# 1 "./src/main/io/asyncfatfs/fat_standard.h" 1
# 18 "./src/main/io/asyncfatfs/fat_standard.h"
       
# 53 "./src/main/io/asyncfatfs/fat_standard.h"
typedef enum {
    FAT_FILESYSTEM_TYPE_INVALID,
    FAT_FILESYSTEM_TYPE_FAT12,
    FAT_FILESYSTEM_TYPE_FAT16,
    FAT_FILESYSTEM_TYPE_FAT32,
} fatFilesystemType_e;

typedef struct mbrPartitionEntry_t {
    uint8_t bootFlag;
    uint8_t chsBegin[3];
    uint8_t type;
    uint8_t chsEnd[3];
    uint32_t lbaBegin;
    uint32_t numSectors;
} __attribute__((packed)) mbrPartitionEntry_t;

typedef struct fat16Descriptor_t {
    uint8_t driveNumber;
    uint8_t reserved1;
    uint8_t bootSignature;
    uint32_t volumeID;
    char volumeLabel[11];
    char fileSystemType[8];
} __attribute__((packed)) fat16Descriptor_t;

typedef struct fat32Descriptor_t {
    uint32_t FATSize32;
    uint16_t extFlags;
    uint16_t fsVer;
    uint32_t rootCluster;
    uint16_t fsInfo;
    uint16_t backupBootSector;
    uint8_t reserved[12];
    uint8_t driveNumber;
    uint8_t reserved1;
    uint8_t bootSignature;
    uint32_t volumeID;
    char volumeLabel[11];
    char fileSystemType[8];
} __attribute__((packed)) fat32Descriptor_t;

typedef struct fatVolumeID_t {
    uint8_t jmpBoot[3];
    char oemName[8];
    uint16_t bytesPerSector;
    uint8_t sectorsPerCluster;
    uint16_t reservedSectorCount;
    uint8_t numFATs;
    uint16_t rootEntryCount;
    uint16_t totalSectors16;
    uint8_t media;
    uint16_t FATSize16;
    uint16_t sectorsPerTrack;
    uint16_t numHeads;
    uint32_t hiddenSectors;
    uint32_t totalSectors32;
    union {
        fat16Descriptor_t fat16;
        fat32Descriptor_t fat32;
    } fatDescriptor;
} __attribute__((packed)) fatVolumeID_t;

typedef struct fatDirectoryEntry_t {
    char filename[11];
    uint8_t attrib;
    uint8_t ntReserved;
    uint8_t creationTimeTenths;
    uint16_t creationTime;
    uint16_t creationDate;
    uint16_t lastAccessDate;
    uint16_t firstClusterHigh;
    uint16_t lastWriteTime;
    uint16_t lastWriteDate;
    uint16_t firstClusterLow;
    uint32_t fileSize;
} __attribute__((packed)) fatDirectoryEntry_t;

uint32_t fat32_decodeClusterNumber(uint32_t clusterNumber);


# 132 "./src/main/io/asyncfatfs/fat_standard.h" 3 4
_Bool 
# 132 "./src/main/io/asyncfatfs/fat_standard.h"
    fat32_isEndOfChainMarker(uint32_t clusterNumber);

# 133 "./src/main/io/asyncfatfs/fat_standard.h" 3 4
_Bool 
# 133 "./src/main/io/asyncfatfs/fat_standard.h"
    fat16_isEndOfChainMarker(uint16_t clusterNumber);


# 135 "./src/main/io/asyncfatfs/fat_standard.h" 3 4
_Bool 
# 135 "./src/main/io/asyncfatfs/fat_standard.h"
    fat_isFreeSpace(uint32_t clusterNumber);


# 137 "./src/main/io/asyncfatfs/fat_standard.h" 3 4
_Bool 
# 137 "./src/main/io/asyncfatfs/fat_standard.h"
    fat_isDirectoryEntryTerminator(fatDirectoryEntry_t *entry);

# 138 "./src/main/io/asyncfatfs/fat_standard.h" 3 4
_Bool 
# 138 "./src/main/io/asyncfatfs/fat_standard.h"
    fat_isDirectoryEntryEmpty(fatDirectoryEntry_t *entry);

void fat_convertFilenameToFATStyle(const char *filename, uint8_t *fatFilename);
# 24 "./src/main/io/asyncfatfs/asyncfatfs.h" 2

typedef struct afatfsFile_t *afatfsFilePtr_t;

typedef enum {
    AFATFS_FILESYSTEM_STATE_UNKNOWN,
    AFATFS_FILESYSTEM_STATE_FATAL,
    AFATFS_FILESYSTEM_STATE_INITIALIZATION,
    AFATFS_FILESYSTEM_STATE_READY,
} afatfsFilesystemState_e;

typedef enum {
    AFATFS_OPERATION_IN_PROGRESS,
    AFATFS_OPERATION_SUCCESS,
    AFATFS_OPERATION_FAILURE,
} afatfsOperationStatus_e;

typedef enum {
    AFATFS_ERROR_NONE = 0,
    AFATFS_ERROR_GENERIC = 1,
    AFATFS_ERROR_BAD_MBR = 2,
    AFATFS_ERROR_BAD_FILESYSTEM_HEADER = 3
} afatfsError_e;

typedef struct afatfsDirEntryPointer_t {
    uint32_t sectorNumberPhysical;
    int16_t entryIndex;
} afatfsDirEntryPointer_t;

typedef afatfsDirEntryPointer_t afatfsFinder_t;

typedef enum {
    AFATFS_SEEK_SET,
    AFATFS_SEEK_CUR,
    AFATFS_SEEK_END,
} afatfsSeek_e;

typedef void (*afatfsFileCallback_t)(afatfsFilePtr_t file);
typedef void (*afatfsCallback_t)();


# 63 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 63 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_fopen(const char *filename, const char *mode, afatfsFileCallback_t complete);

# 64 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 64 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_ftruncate(afatfsFilePtr_t file, afatfsFileCallback_t callback);

# 65 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 65 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_fclose(afatfsFilePtr_t file, afatfsCallback_t callback);

# 66 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 66 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_funlink(afatfsFilePtr_t file, afatfsCallback_t callback);


# 68 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 68 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_feof(afatfsFilePtr_t file);
void afatfs_fputc(afatfsFilePtr_t file, uint8_t c);
uint32_t afatfs_fwrite(afatfsFilePtr_t file, const uint8_t *buffer, uint32_t len);
uint32_t afatfs_fread(afatfsFilePtr_t file, uint8_t *buffer, uint32_t len);
afatfsOperationStatus_e afatfs_fseek(afatfsFilePtr_t file, int32_t offset, afatfsSeek_e whence);

# 73 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 73 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_ftell(afatfsFilePtr_t file, uint32_t *position);


# 75 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 75 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_mkdir(const char *filename, afatfsFileCallback_t complete);

# 76 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 76 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_chdir(afatfsFilePtr_t dirHandle);

void afatfs_findFirst(afatfsFilePtr_t directory, afatfsFinder_t *finder);
afatfsOperationStatus_e afatfs_findNext(afatfsFilePtr_t directory, afatfsFinder_t *finder, fatDirectoryEntry_t **dirEntry);
void afatfs_findLast(afatfsFilePtr_t directory);


# 82 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 82 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_flush();
void afatfs_init();

# 84 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 84 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_destroy(
# 84 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
                   _Bool 
# 84 "./src/main/io/asyncfatfs/asyncfatfs.h"
                        dirty);
void afatfs_poll();

uint32_t afatfs_getFreeBufferSpace();
uint32_t afatfs_getContiguousFreeSpace();

# 89 "./src/main/io/asyncfatfs/asyncfatfs.h" 3 4
_Bool 
# 89 "./src/main/io/asyncfatfs/asyncfatfs.h"
    afatfs_isFull();

afatfsFilesystemState_e afatfs_getFilesystemState();
afatfsError_e afatfs_getLastError();
# 78 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/io/serial_4way.h" 1
# 19 "./src/main/io/serial_4way.h"
       
# 79 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/telemetry/telemetry.h" 1
# 18 "./src/main/telemetry/telemetry.h"
       

typedef enum {
    FRSKY_FORMAT_DMS = 0,
    FRSKY_FORMAT_NMEA
} frskyGpsCoordFormat_e;

typedef enum {
    FRSKY_UNIT_METRICS = 0,
    FRSKY_UNIT_IMPERIALS
} frskyUnit_e;

typedef struct telemetryConfig_s {
    uint8_t telemetry_switch;
    uint8_t telemetry_inversion;
    uint8_t telemetry_send_cells;
} telemetryConfig_t;

telemetryConfig_t telemetryConfig_System; static inline telemetryConfig_t* telemetryConfig(void) { return &telemetryConfig_System; } struct _dummy;

void telemetryInit(void);

uint8_t telemetryCheckState(void);
void telemetryProcess(uint16_t deadband3d_throttle);


# 43 "./src/main/telemetry/telemetry.h" 3 4
_Bool 
# 43 "./src/main/telemetry/telemetry.h"
    telemetryDetermineEnabledState(portSharing_e portSharing);

void telemetryUseConfig(telemetryConfig_t *telemetryConfig);
# 81 "src/main/fc/msp_server_fc.c" 2

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
# 83 "src/main/fc/msp_server_fc.c" 2
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
# 84 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/amperage.h" 1
# 18 "./src/main/sensors/amperage.h"
       





typedef struct amperageMeterConfig_s {
    int16_t scale;
    uint16_t offset;
} amperageMeterConfig_t;

extern amperageMeterConfig_t amperageMeterConfig_SystemArray[2]; static inline amperageMeterConfig_t* amperageMeterConfig(int _index) { return &amperageMeterConfig_SystemArray[_index]; } static inline amperageMeterConfig_t (* amperageMeterConfig_arr(void))[2] { return &amperageMeterConfig_SystemArray; } struct _dummy;

typedef struct amperageMeter_s {
    int32_t amperage;
    int32_t mAhDrawn;
} amperageMeter_t;

typedef enum {
    AMPERAGE_METER_VIRTUAL = 0,
    AMPERAGE_METER_ADC,
} amperageMeter_e;

extern amperageMeter_t amperageMeters[2];

void amperageMeterInit(void);
void amperageUpdateMeter(int32_t lastUpdateAt);
void amperageUpdateVirtualMeter(int32_t lastUpdateAt, 
# 45 "./src/main/sensors/amperage.h" 3 4
                                                     _Bool 
# 45 "./src/main/sensors/amperage.h"
                                                          armed, 
# 45 "./src/main/sensors/amperage.h" 3 4
                                                                 _Bool 
# 45 "./src/main/sensors/amperage.h"
                                                                      throttleLowAndMotorStop, int32_t throttleOffset);

int32_t amperageSensorToCentiamps(const uint16_t src, amperageMeterConfig_t *config);

amperageMeter_t *getAmperageMeter(amperageMeter_e index);

void amperageMeterInit(void);
# 85 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/voltage.h" 1
# 18 "./src/main/sensors/voltage.h"
       
# 32 "./src/main/sensors/voltage.h"
typedef struct voltageMeterConfig_s {
    uint8_t vbatscale;
    uint8_t vbatresdivval;
    uint8_t vbatresdivmultiplier;
} voltageMeterConfig_t;

extern voltageMeterConfig_t voltageMeterConfig_SystemArray[1]; static inline voltageMeterConfig_t* voltageMeterConfig(int _index) { return &voltageMeterConfig_SystemArray[_index]; } static inline voltageMeterConfig_t (* voltageMeterConfig_arr(void))[1] { return &voltageMeterConfig_SystemArray; } struct _dummy;

typedef struct voltageMeterState_s {
    uint16_t vbat;
    uint16_t vbatRaw;
    uint16_t vbatLatestADC;
    biquad_t vbatFilterState;
} voltageMeterState_t;

extern voltageMeterState_t voltageMeterStates[1];


void voltageMeterInit(void);
void voltageMeterUpdate(void);

voltageMeterState_t *getVoltageMeter(uint8_t index);
uint16_t getVoltageForADCChannel(uint8_t channel);
uint16_t getLatestVoltageForADCChannel(uint8_t channel);

voltageMeterConfig_t *getVoltageMeterConfig(const uint8_t channel);
# 86 "src/main/fc/msp_server_fc.c" 2
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
# 87 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/sonar.h" 1
# 18 "./src/main/sensors/sonar.h"
       



extern int16_t sonarMaxRangeCm;
extern int16_t sonarCfAltCm;
extern int16_t sonarMaxAltWithTiltCm;

void sonarUpdate(void);
int32_t sonarRead(void);
int32_t sonarCalculateAltitude(int32_t sonarDistance, float cosTiltAngle);
int32_t sonarGetLatestAltitude(void);
# 88 "src/main/fc/msp_server_fc.c" 2
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
# 89 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/barometer.h" 1
# 18 "./src/main/sensors/barometer.h"
       

typedef enum {
    BARO_DEFAULT = 0,
    BARO_NONE = 1,
    BARO_BMP085 = 2,
    BARO_MS5611 = 3,
    BARO_BMP280 = 4
} baroSensor_e;




extern int32_t BaroAlt;
extern int32_t baroTemperature;
# 90 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/compass.h" 1
# 18 "./src/main/sensors/compass.h"
       


typedef enum {
    MAG_DEFAULT = 0,
    MAG_NONE = 1,
    MAG_HMC5883 = 2,
    MAG_AK8975 = 3,
    MAG_AK8963 = 4 ,
    EDISON_IMU = 5
} magSensor_e;



typedef struct compassConfig_s {
    int16_t mag_declination;

} compassConfig_t;

extern compassConfig_t *compassConfig_ProfileCurrent; static inline compassConfig_t* compassConfig(void) { return compassConfig_ProfileCurrent; } struct _dummy;



# 40 "./src/main/sensors/compass.h" 3 4
_Bool 
# 40 "./src/main/sensors/compass.h"
    compassInit(void);
union flightDynamicsTrims_u;
void updateCompass(union flightDynamicsTrims_u *magZero);

void recalculateMagneticDeclination(void);

extern int32_t magADC[3];

extern sensor_align_e magAlign;
extern mag_t mag;
extern float magneticDeclination;
# 91 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/sensors/gyro.h" 1
# 18 "./src/main/sensors/gyro.h"
       

typedef enum {
    GYRO_NONE = 0,
    GYRO_DEFAULT,
    GYRO_MPU6050,
    GYRO_L3G4200D,
    GYRO_MPU3050,
    GYRO_L3GD20,
    GYRO_MPU6000,
    GYRO_MPU6500,
    GYRO_FAKE
} gyroSensor_e;

extern gyro_t gyro;
extern sensor_align_e gyroAlign;

extern int32_t gyroADC[3];

typedef struct gyroConfig_s {
    uint8_t gyroMovementCalibrationThreshold;
    uint8_t gyro_lpf;
    uint16_t soft_gyro_lpf_hz;
} gyroConfig_t;

gyroConfig_t gyroConfig_System; static inline gyroConfig_t* gyroConfig(void) { return &gyroConfig_System; } struct _dummy;

void gyroSetCalibrationCycles(uint16_t calibrationCyclesRequired);
void gyroUpdate(void);

# 47 "./src/main/sensors/gyro.h" 3 4
_Bool 
# 47 "./src/main/sensors/gyro.h"
    isGyroCalibrationComplete(void);
# 92 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/flight/mixer.h" 1
# 18 "./src/main/flight/mixer.h"
       
# 34 "./src/main/flight/mixer.h"
typedef enum mixerMode
{
    MIXER_TRI = 1,
    MIXER_QUADP = 2,
    MIXER_QUADX = 3,
    MIXER_BICOPTER = 4,
    MIXER_GIMBAL = 5,
    MIXER_Y6 = 6,
    MIXER_HEX6 = 7,
    MIXER_FLYING_WING = 8,
    MIXER_Y4 = 9,
    MIXER_HEX6X = 10,
    MIXER_OCTOX8 = 11,
    MIXER_OCTOFLATP = 12,
    MIXER_OCTOFLATX = 13,
    MIXER_AIRPLANE = 14,
    MIXER_HELI_120_CCPM = 15,
    MIXER_HELI_90_DEG = 16,
    MIXER_VTAIL4 = 17,
    MIXER_HEX6H = 18,
    MIXER_PPM_TO_SERVO = 19,
    MIXER_DUALCOPTER = 20,
    MIXER_SINGLECOPTER = 21,
    MIXER_ATAIL4 = 22,
    MIXER_CUSTOM = 23,
    MIXER_CUSTOM_AIRPLANE = 24,
    MIXER_CUSTOM_TRI = 25
} mixerMode_e;


typedef struct motorMixer_s {
    float throttle;
    float roll;
    float pitch;
    float yaw;
} motorMixer_t;

extern motorMixer_t customMotorMixer_SystemArray[4]; static inline motorMixer_t* customMotorMixer(int _index) { return &customMotorMixer_SystemArray[_index]; } static inline motorMixer_t (* customMotorMixer_arr(void))[4] { return &customMotorMixer_SystemArray; } struct _dummy;


typedef struct mixer_s {
    uint8_t motorCount;
    uint8_t useServo;
    const motorMixer_t *motor;
} mixer_t;

typedef struct mixerConfig_s {
    uint8_t mixerMode;
    uint8_t pid_at_min_throttle;
    int8_t yaw_motor_direction;
    uint16_t yaw_jump_prevention_limit;





} mixerConfig_t;

mixerConfig_t mixerConfig_System; static inline mixerConfig_t* mixerConfig(void) { return &mixerConfig_System; } struct _dummy;

typedef struct motor3DConfig_s {
    uint16_t deadband3d_low;
    uint16_t deadband3d_high;
    uint16_t neutral3d;
} motor3DConfig_t;

motor3DConfig_t motor3DConfig_System; static inline motor3DConfig_t* motor3DConfig(void) { return &motor3DConfig_System; } struct _dummy;



extern int16_t motor[4];
extern int16_t motor_disarmed[4];

extern 
# 107 "./src/main/flight/mixer.h" 3 4
      _Bool 
# 107 "./src/main/flight/mixer.h"
           motorLimitReached;

void mixerInit(motorMixer_t *customMotorMixers);
void writeAllMotors(int16_t mc);
void mixerLoadMix(int index, motorMixer_t *customMixers);
void mixerResetDisarmedMotors(void);
void mixTable(void);
void servoMixTable(void);
void writeMotors(void);
void stopMotors(void);
void StopPwmAllMotors(void);
void mixerInitialiseServoFiltering(uint32_t targetLooptime);
# 94 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/servos.h" 1
# 18 "./src/main/flight/servos.h"
       
# 28 "./src/main/flight/servos.h"
enum {
    INPUT_STABILIZED_ROLL = 0,
    INPUT_STABILIZED_PITCH,
    INPUT_STABILIZED_YAW,
    INPUT_STABILIZED_THROTTLE,
    INPUT_RC_ROLL,
    INPUT_RC_PITCH,
    INPUT_RC_YAW,
    INPUT_RC_THROTTLE,
    INPUT_RC_AUX1,
    INPUT_RC_AUX2,
    INPUT_RC_AUX3,
    INPUT_RC_AUX4,
    INPUT_GIMBAL_PITCH,
    INPUT_GIMBAL_ROLL,

    INPUT_SOURCE_COUNT
} inputSource_e;


typedef enum {
    SERVO_GIMBAL_PITCH = 0,
    SERVO_GIMBAL_ROLL = 1,
    SERVO_ELEVATOR = 2,
    SERVO_FLAPPERON_1 = 3,
    SERVO_FLAPPERON_2 = 4,
    SERVO_RUDDER = 5,
    SERVO_THROTTLE = 6,
    SERVO_FLAPS = 7,

    SERVO_BICOPTER_LEFT = 4,
    SERVO_BICOPTER_RIGHT = 5,

    SERVO_DUALCOPTER_LEFT = 4,
    SERVO_DUALCOPTER_RIGHT = 5,

    SERVO_SINGLECOPTER_1 = 3,
    SERVO_SINGLECOPTER_2 = 4,
    SERVO_SINGLECOPTER_3 = 5,
    SERVO_SINGLECOPTER_4 = 6,

} servoIndex_e;
# 83 "./src/main/flight/servos.h"
typedef struct servoMixer_s {
    uint8_t targetChannel;
    uint8_t inputSource;
    int8_t rate;
    uint8_t speed;
    int8_t min;
    int8_t max;
    uint8_t box;
} servoMixer_t;





extern servoMixer_t customServoMixer_SystemArray[(2 * 1)]; static inline servoMixer_t* customServoMixer(int _index) { return &customServoMixer_SystemArray[_index]; } static inline servoMixer_t (* customServoMixer_arr(void))[(2 * 1)] { return &customServoMixer_SystemArray; } struct _dummy;


typedef struct mixerRules_s {
    uint8_t servoRuleCount;
    const servoMixer_t *rule;
} mixerRules_t;

typedef struct servoParam_s {
    int16_t min;
    int16_t max;
    int16_t middle;
    int8_t rate;
    uint8_t angleAtMin;
    uint8_t angleAtMax;
    int8_t forwardFromChannel;
    uint32_t reversedSources;
} __attribute__ ((__packed__)) servoParam_t;

typedef struct servoProfile_s {
    servoParam_t servoConf[1];
} servoProfile_t;

extern servoProfile_t *servoProfile_ProfileCurrent; static inline servoProfile_t* servoProfile(void) { return servoProfile_ProfileCurrent; } struct _dummy;

struct gimbalConfig_s;
struct motorAndServoConfig_s;
struct rxConfig_s;

extern int16_t servo[1];

# 127 "./src/main/flight/servos.h" 3 4
_Bool 
# 127 "./src/main/flight/servos.h"
    isMixerUsingServos(void);
void writeServos(void);
void filterServos(void);
void mixerInitServos(servoMixer_t *customServoMixers);
void mixerUseConfigs(servoParam_t *servoConfToUse);
void servoMixerLoadMix(int index, servoMixer_t *customServoMixers);
void loadCustomServoMixer(void);
int servoDirection(int servoIndex, int fromChannel);
# 95 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/pid.h" 1
# 18 "./src/main/flight/pid.h"
       
# 28 "./src/main/flight/pid.h"
typedef enum {
    PIDROLL,
    PIDPITCH,
    PIDYAW,
    PIDALT,
    PIDPOS,
    PIDPOSR,
    PIDNAVR,
    PIDLEVEL,
    PIDMAG,
    PIDVEL,
    PID_ITEM_COUNT
} pidIndex_e;

typedef enum {
    PID_CONTROLLER_MW23 = 0,
    PID_CONTROLLER_MWREWRITE,
    PID_CONTROLLER_LUX_FLOAT,
    PID_COUNT
} pidControllerType_e;



typedef enum {
    PID_DELTA_FROM_MEASUREMENT = 0,
    PID_DELTA_FROM_ERROR
} pidDeltaMethod_e;

typedef enum {
    HORIZON_TILT_MODE_SAFE = 0,
    HORIZON_TILT_MODE_EXPERT
} horizonTiltMode_e;

typedef struct pidProfile_s {
    uint8_t P8[PID_ITEM_COUNT];
    uint8_t I8[PID_ITEM_COUNT];
    uint8_t D8[PID_ITEM_COUNT];
    uint8_t pidController;
    uint16_t yaw_p_limit;
    uint16_t dterm_lpf;
    uint16_t yaw_lpf;
    uint8_t deltaMethod;
    uint8_t horizon_tilt_effect;
    uint8_t horizon_tilt_mode;
} pidProfile_t;

extern pidProfile_t *pidProfile_ProfileCurrent; static inline pidProfile_t* pidProfile(void) { return pidProfile_ProfileCurrent; } struct _dummy;

struct controlRateConfig_s;
union rollAndPitchTrims_u;
struct rxConfig_s;
typedef void (*pidControllerFuncPtr)(const pidProfile_t *pidProfile, const struct controlRateConfig_s *controlRateConfig,
        uint16_t max_angle_inclination, const union rollAndPitchTrims_u *angleTrim, const struct rxConfig_s *rxConfig);

extern int16_t axisPID[FD_INDEX_COUNT];
extern int32_t axisPID_P[FD_INDEX_COUNT], axisPID_I[FD_INDEX_COUNT], axisPID_D[FD_INDEX_COUNT];

float pidScaleITermToRcInput(int axis);
void pidFilterIsSetCheck(const pidProfile_t *pidProfile);

void pidSetController(pidControllerType_e type);
void pidResetITermAngle(void);
void pidResetITerm(void);

int calcHorizonLevelStrength(uint16_t rxConfigMidrc, int horizonTiltEffect,
        uint8_t horizonTiltMode, int horizonSensitivity);
# 96 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/imu.h" 1
# 18 "./src/main/flight/imu.h"
       

extern int16_t throttleAngleCorrection;
extern uint32_t accTimeSum;
extern int accSumCount;
extern float accVelScale;
extern int16_t accSmooth[3];
extern int32_t accSum[3];






typedef union {
    int16_t raw[3];
    struct {

        int16_t roll;
        int16_t pitch;
        int16_t yaw;
    } values;
} attitudeEulerAngles_t;

extern attitudeEulerAngles_t attitude;

typedef struct imuConfig_s {

    uint16_t looptime;
    uint8_t gyroSync;
    uint8_t gyroSyncDenominator;
    uint16_t dcm_kp;
    uint16_t dcm_ki;
    uint8_t small_angle;
    uint16_t max_angle_inclination;
} imuConfig_t;

imuConfig_t imuConfig_System; static inline imuConfig_t* imuConfig(void) { return &imuConfig_System; } struct _dummy;

typedef struct throttleCorrectionConfig_s {
    uint16_t throttle_correction_angle;
    uint8_t throttle_correction_value;
} throttleCorrectionConfig_t;

extern throttleCorrectionConfig_t *throttleCorrectionConfig_ProfileCurrent; static inline throttleCorrectionConfig_t* throttleCorrectionConfig(void) { return throttleCorrectionConfig_ProfileCurrent; } struct _dummy;

typedef struct imuRuntimeConfig_s {
    uint8_t acc_cut_hz;
    uint8_t acc_unarmedcal;
    float dcm_ki;
    float dcm_kp;
    uint8_t small_angle;
} imuRuntimeConfig_t;

void imuInit(void);

void imuConfigure(
    imuRuntimeConfig_t *initialImuRuntimeConfig,
    accDeadband_t *initialAccDeadband,
    float accz_lpf_cutoff,
    uint16_t throttle_correction_angle
);

void imuUpdateAccelerometer(rollAndPitchTrims_t *accelerometerTrims);
void imuUpdateGyroAndAttitude(void);
float calculateThrottleAngleScale(uint16_t throttle_correction_angle);
int16_t calculateThrottleAngleCorrection(uint8_t throttle_correction_value);
float calculateAccZLowPassFilterRCTimeConstant(float accz_lpf_cutoff);

int16_t imuCalculateHeading(t_fp_vector *vec);

float getCosTiltAngle(void);

void imuResetAccelerationSum(void);


# 93 "./src/main/flight/imu.h" 3 4
_Bool 
# 93 "./src/main/flight/imu.h"
    imuIsAircraftArmable(uint8_t arming_angle);
# 97 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/failsafe.h" 1
# 18 "./src/main/flight/failsafe.h"
       
# 30 "./src/main/flight/failsafe.h"
typedef struct failsafeConfig_s {
    uint8_t failsafe_delay;
    uint8_t failsafe_off_delay;
    uint16_t failsafe_throttle;
    uint8_t failsafe_kill_switch;
    uint16_t failsafe_throttle_low_delay;
    uint8_t failsafe_procedure;
} __attribute__((packed)) failsafeConfig_t;

typedef enum {
    FAILSAFE_IDLE = 0,
    FAILSAFE_RX_LOSS_DETECTED,
    FAILSAFE_LANDING,
    FAILSAFE_LANDED,
    FAILSAFE_RX_LOSS_MONITORING,
    FAILSAFE_RX_LOSS_RECOVERED
} failsafePhase_e;

typedef enum {
    FAILSAFE_RXLINK_DOWN = 0,
    FAILSAFE_RXLINK_UP
} failsafeRxLinkState_e;

typedef enum {
    FAILSAFE_PROCEDURE_AUTO_LANDING = 0,
    FAILSAFE_PROCEDURE_DROP_IT
} failsafeProcedure_e;

typedef struct failsafeState_s {
    int16_t events;
    
# 60 "./src/main/flight/failsafe.h" 3 4
   _Bool 
# 60 "./src/main/flight/failsafe.h"
        monitoring;
    
# 61 "./src/main/flight/failsafe.h" 3 4
   _Bool 
# 61 "./src/main/flight/failsafe.h"
        active;
    uint32_t rxDataFailurePeriod;
    uint32_t validRxDataReceivedAt;
    uint32_t validRxDataFailedAt;
    uint32_t throttleLowPeriod;
    uint32_t landingShouldBeFinishedAt;
    uint32_t receivingRxDataPeriod;
    uint32_t receivingRxDataPeriodPreset;
    failsafePhase_e phase;
    failsafeRxLinkState_e rxLinkState;
} failsafeState_t;

failsafeConfig_t failsafeConfig_System; static inline failsafeConfig_t* failsafeConfig(void) { return &failsafeConfig_System; } struct _dummy;

void failsafeInit(void);

void useFailsafeConfig();

void failsafeStartMonitoring(void);
void failsafeUpdateState(void);

failsafePhase_e failsafePhase();

# 83 "./src/main/flight/failsafe.h" 3 4
_Bool 
# 83 "./src/main/flight/failsafe.h"
    failsafeIsMonitoring(void);

# 84 "./src/main/flight/failsafe.h" 3 4
_Bool 
# 84 "./src/main/flight/failsafe.h"
    failsafeIsActive(void);

# 85 "./src/main/flight/failsafe.h" 3 4
_Bool 
# 85 "./src/main/flight/failsafe.h"
    failsafeIsReceivingRxData(void);
void failsafeOnRxSuspend(uint32_t suspendPeriod);
void failsafeOnRxResume(void);

void failsafeOnValidDataReceived(void);
void failsafeOnValidDataFailed(void);
# 98 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/navigation.h" 1
# 18 "./src/main/flight/navigation.h"
       


typedef enum {
    NAV_MODE_NONE = 0,
    NAV_MODE_POSHOLD,
    NAV_MODE_WP
} navigationMode_e;



typedef struct gpsProfile_s {
    uint16_t gps_wp_radius;
    uint8_t gps_lpf;
    uint8_t nav_slew_rate;
    uint8_t nav_controls_heading;
    uint16_t nav_speed_min;
    uint16_t nav_speed_max;
    uint16_t ap_mode;
} gpsProfile_t;

extern gpsProfile_t *gpsProfile_ProfileCurrent; static inline gpsProfile_t* gpsProfile(void) { return gpsProfile_ProfileCurrent; } struct _dummy;

extern int16_t GPS_angle[ANGLE_INDEX_COUNT];

extern int32_t GPS_home[2];
extern int32_t GPS_hold[2];

extern uint16_t GPS_distanceToHome;
extern int16_t GPS_directionToHome;

extern navigationMode_e nav_mode;

void GPS_reset_home_position(void);
void GPS_reset_nav(void);
void GPS_set_next_wp(int32_t* lat, int32_t* lon);
void gpsUsePIDs(pidProfile_t *pidProfile);
void updateGpsStateForHomeAndHoldMode(void);
void updateGpsWaypointsAndMode(void);

void onGpsNewData(void);
# 99 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/flight/altitudehold.h" 1
# 26 "./src/main/flight/altitudehold.h"
extern int32_t AltHold;
extern int32_t vario;

typedef struct airplaneConfig_s {
    int8_t fixedwing_althold_dir;
} airplaneConfig_t;

airplaneConfig_t airplaneConfig_System; static inline airplaneConfig_t* airplaneConfig(void) { return &airplaneConfig_System; } struct _dummy;

void calculateEstimatedAltitude(uint32_t currentTime);

void applyAltHold(void);
void updateAltHoldState(void);
void updateSonarAltHoldState(void);

int32_t altitudeHoldGetEstimatedAltitude(void);
# 100 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/blackbox/blackbox.h" 1
# 18 "./src/main/blackbox/blackbox.h"
       

# 1 "./src/main/blackbox/blackbox_fielddefs.h" 1
# 18 "./src/main/blackbox/blackbox_fielddefs.h"
       



typedef enum FlightLogFieldCondition {
    FLIGHT_LOG_FIELD_CONDITION_ALWAYS = 0,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_1,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_2,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_3,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_4,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_5,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_6,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_7,
    FLIGHT_LOG_FIELD_CONDITION_AT_LEAST_MOTORS_8,
    FLIGHT_LOG_FIELD_CONDITION_TRICOPTER,

    FLIGHT_LOG_FIELD_CONDITION_MAG,
    FLIGHT_LOG_FIELD_CONDITION_BARO,
    FLIGHT_LOG_FIELD_CONDITION_VBAT,
    FLIGHT_LOG_FIELD_CONDITION_AMPERAGE,
    FLIGHT_LOG_FIELD_CONDITION_SONAR,
    FLIGHT_LOG_FIELD_CONDITION_RSSI,

    FLIGHT_LOG_FIELD_CONDITION_NONZERO_PID_D_0,
    FLIGHT_LOG_FIELD_CONDITION_NONZERO_PID_D_1,
    FLIGHT_LOG_FIELD_CONDITION_NONZERO_PID_D_2,

    FLIGHT_LOG_FIELD_CONDITION_NOT_LOGGING_EVERY_FRAME,

    FLIGHT_LOG_FIELD_CONDITION_NEVER,

    FLIGHT_LOG_FIELD_CONDITION_FIRST = FLIGHT_LOG_FIELD_CONDITION_ALWAYS,
    FLIGHT_LOG_FIELD_CONDITION_LAST = FLIGHT_LOG_FIELD_CONDITION_NEVER
} FlightLogFieldCondition;

typedef enum FlightLogFieldPredictor {

    FLIGHT_LOG_FIELD_PREDICTOR_0 = 0,


    FLIGHT_LOG_FIELD_PREDICTOR_PREVIOUS = 1,


    FLIGHT_LOG_FIELD_PREDICTOR_STRAIGHT_LINE = 2,


    FLIGHT_LOG_FIELD_PREDICTOR_AVERAGE_2 = 3,


    FLIGHT_LOG_FIELD_PREDICTOR_MINTHROTTLE = 4,


    FLIGHT_LOG_FIELD_PREDICTOR_MOTOR_0 = 5,


    FLIGHT_LOG_FIELD_PREDICTOR_INC = 6,


    FLIGHT_LOG_FIELD_PREDICTOR_HOME_COORD = 7,


    FLIGHT_LOG_FIELD_PREDICTOR_1500 = 8,


    FLIGHT_LOG_FIELD_PREDICTOR_VBATREF = 9,


    FLIGHT_LOG_FIELD_PREDICTOR_LAST_MAIN_FRAME_TIME = 10

} FlightLogFieldPredictor;

typedef enum FlightLogFieldEncoding {
    FLIGHT_LOG_FIELD_ENCODING_SIGNED_VB = 0,
    FLIGHT_LOG_FIELD_ENCODING_UNSIGNED_VB = 1,
    FLIGHT_LOG_FIELD_ENCODING_NEG_14BIT = 3,
    FLIGHT_LOG_FIELD_ENCODING_TAG8_8SVB = 6,
    FLIGHT_LOG_FIELD_ENCODING_TAG2_3S32 = 7,
    FLIGHT_LOG_FIELD_ENCODING_TAG8_4S16 = 8,
    FLIGHT_LOG_FIELD_ENCODING_NULL = 9
} FlightLogFieldEncoding;

typedef enum FlightLogFieldSign {
    FLIGHT_LOG_FIELD_UNSIGNED = 0,
    FLIGHT_LOG_FIELD_SIGNED = 1
} FlightLogFieldSign;

typedef enum FlightLogEvent {
    FLIGHT_LOG_EVENT_SYNC_BEEP = 0,
    FLIGHT_LOG_EVENT_INFLIGHT_ADJUSTMENT = 13,
    FLIGHT_LOG_EVENT_LOGGING_RESUME = 14,
    FLIGHT_LOG_EVENT_GTUNE_RESULT = 20,
    FLIGHT_LOG_EVENT_LOG_END = 255
} FlightLogEvent;

typedef struct flightLogEvent_syncBeep_s {
    uint32_t time;
} flightLogEvent_syncBeep_t;

typedef struct flightLogEvent_inflightAdjustment_s {
    uint8_t adjustmentFunction;
    
# 118 "./src/main/blackbox/blackbox_fielddefs.h" 3 4
   _Bool 
# 118 "./src/main/blackbox/blackbox_fielddefs.h"
        floatFlag;
    int32_t newValue;
    float newFloatValue;
} flightLogEvent_inflightAdjustment_t;

typedef struct flightLogEvent_loggingResume_s {
    uint32_t logIteration;
    uint32_t currentTime;
} flightLogEvent_loggingResume_t;



typedef struct flightLogEvent_gtuneCycleResult_s {
    uint8_t gtuneAxis;
    int32_t gtuneGyroAVG;
    int16_t gtuneNewP;
} flightLogEvent_gtuneCycleResult_t;

typedef union flightLogEventData_u {
    flightLogEvent_syncBeep_t syncBeep;
    flightLogEvent_inflightAdjustment_t inflightAdjustment;
    flightLogEvent_loggingResume_t loggingResume;
    flightLogEvent_gtuneCycleResult_t gtuneCycleResult;
} flightLogEventData_t;

typedef struct flightLogEvent_s {
    FlightLogEvent event;
    flightLogEventData_t data;
} flightLogEvent_t;
# 21 "./src/main/blackbox/blackbox.h" 2

typedef struct blackboxConfig_s {
    uint8_t rate_num;
    uint8_t rate_denom;
    uint8_t device;
} blackboxConfig_t;

blackboxConfig_t blackboxConfig_System; static inline blackboxConfig_t* blackboxConfig(void) { return &blackboxConfig_System; } struct _dummy;

void blackboxLogEvent(FlightLogEvent event, flightLogEventData_t *data);

void initBlackbox(void);
void handleBlackbox(void);
void startBlackbox(void);
void finishBlackbox(void);


# 37 "./src/main/blackbox/blackbox.h" 3 4
_Bool 
# 37 "./src/main/blackbox/blackbox.h"
    blackboxMayEditConfig();
# 102 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/fc/cleanflight_fc.h" 1
# 18 "./src/main/fc/cleanflight_fc.h"
       

extern int16_t magHold;

void applyAndSaveAccelerometerTrimsDelta(rollAndPitchTrims_t *rollAndPitchTrimsDelta);
void handleInflightCalibrationStickPosition();

void mwDisarm(void);
void mwArm(void);


# 28 "./src/main/fc/cleanflight_fc.h" 3 4
_Bool 
# 28 "./src/main/fc/cleanflight_fc.h"
    isCalibrating(void);
# 104 "src/main/fc/msp_server_fc.c" 2

# 1 "./src/main/build/version.h" 1
# 28 "./src/main/build/version.h"
extern const char* const targetName;


extern const char* const shortGitRevision;


extern const char* const buildDate;


extern const char* const buildTime;
# 106 "src/main/fc/msp_server_fc.c" 2




# 1 "./src/main/msp/msp_server.h" 1
# 18 "./src/main/msp/msp_server.h"
typedef struct mspServerConfig_s {
    uint8_t multiwiiCurrentMeterOutput;
} mspServerConfig_t;

mspServerConfig_t mspServerConfig_System; static inline mspServerConfig_t* mspServerConfig(void) { return &mspServerConfig_System; } struct _dummy;
# 111 "src/main/fc/msp_server_fc.c" 2
# 1 "./src/main/fc/msp_server_fc.h" 1
# 18 "./src/main/fc/msp_server_fc.h"
       

static uint32_t enabledSensors = 0;


# 22 "./src/main/fc/msp_server_fc.h" 3 4
_Bool 
# 22 "./src/main/fc/msp_server_fc.h"
    rcModeIsActive(boxId_e modeId)
{
    return 0 & (1 << modeId);
}
# 112 "src/main/fc/msp_server_fc.c" 2





extern uint16_t cycleTime;
extern uint16_t rssi;
extern void resetPidProfile(pidProfile_t *pidProfile);

static const char * const flightControllerIdentifier = "CLFL";
static const char * const boardIdentifier = "EDISON";

typedef struct box_e {
    const char *boxName;
    const uint8_t boxId;
    const uint8_t permanentId;
} box_t;

static const box_t boxes[CHECKBOX_ITEM_COUNT] = {
    { "ARM", BOXARM, 0 },
    { "ANGLE", BOXANGLE, 1 },
    { "HORIZON", BOXHORIZON, 2 },
    { "BARO", BOXBARO, 3 },

    { "MAG", BOXMAG, 5 },
    { "HEADFREE", BOXHEADFREE, 6 },
    { "HEADADJ", BOXHEADADJ, 7 },
    { "CAMSTAB", BOXCAMSTAB, 8 },
    { "CAMTRIG", BOXCAMTRIG, 9 },
    { "GPS HOME", BOXGPSHOME, 10 },
    { "GPS HOLD", BOXGPSHOLD, 11 },
    { "PASSTHRU", BOXPASSTHRU, 12 },
    { "BEEPER", BOXBEEPERON, 13 },
    { "LEDMAX", BOXLEDMAX, 14 },
    { "LEDLOW", BOXLEDLOW, 15 },
    { "LLIGHTS", BOXLLIGHTS, 16 },
    { "CALIB", BOXCALIB, 17 },
    { "GOVERNOR", BOXGOV, 18 },
    { "OSD SW", BOXOSD, 19 },
    { "TELEMETRY", BOXTELEMETRY, 20 },
    { "GTUNE", BOXGTUNE, 21 },
    { "SONAR", BOXSONAR, 22 },
    { "SERVO1", BOXSERVO1, 23 },
    { "SERVO2", BOXSERVO2, 24 },
    { "SERVO3", BOXSERVO3, 25 },
    { "BLACKBOX", BOXBLACKBOX, 26 },
    { "FAILSAFE", BOXFAILSAFE, 27 },
    { "AIR MODE", BOXAIRMODE, 28 },
};


static uint32_t activeBoxIds;


extern int16_t motor_disarmed[4];

static const char pidnames[] =
    "ROLL;"
    "PITCH;"
    "YAW;"
    "ALT;"
    "Pos;"
    "PosR;"
    "NavR;"
    "LEVEL;"
    "MAG;"
    "VEL;";

typedef enum {
    MSP_SDCARD_STATE_NOT_PRESENT = 0,
    MSP_SDCARD_STATE_FATAL = 1,
    MSP_SDCARD_STATE_CARD_INIT = 2,
    MSP_SDCARD_STATE_FS_INIT = 3,
    MSP_SDCARD_STATE_READY = 4,
} mspSDCardState_e;

typedef enum {
    MSP_SDCARD_FLAG_SUPPORTTED = 1,
} mspSDCardFlags_e;

typedef enum {
    MSP_FLASHFS_BIT_READY = 1,
    MSP_FLASHFS_BIT_SUPPORTED = 2,
} mspFlashfsFlags_e;
# 221 "src/main/fc/msp_server_fc.c"
static const box_t *findBoxByBoxId(uint8_t boxId)
{
    for (unsigned i = 0; i < (sizeof(boxes) / sizeof((boxes)[0])); i++) {
        const box_t *candidate = &boxes[i];
        if (candidate->boxId == boxId) {
            return candidate;
        }
    }
    return 
# 229 "src/main/fc/msp_server_fc.c" 3 4
          ((void *)0)
# 229 "src/main/fc/msp_server_fc.c"
              ;
}

static const box_t *findBoxByPermenantId(uint8_t permanentId)
{
    for (unsigned i = 0; i < (sizeof(boxes) / sizeof((boxes)[0])); i++) {
        const box_t *candidate = &boxes[i];
        if (candidate->permanentId == permanentId) {
            return candidate;
        }
    }
    return 
# 240 "src/main/fc/msp_server_fc.c" 3 4
          ((void *)0)
# 240 "src/main/fc/msp_server_fc.c"
              ;
}

static void serializeBoxNamesReply(mspPacket_t *reply)
{
    sbuf_t *dst = &reply->buf;
    for (int i = 0; i < CHECKBOX_ITEM_COUNT; i++) {
        if(!(activeBoxIds & (1 << i)))
            continue;
        const box_t *box = findBoxByBoxId(i);
        sbufWriteString(dst, box->boxName);
        sbufWriteU8(dst, ';');
    }
}

static void serializeBoxIdsReply(mspPacket_t *reply)
{
    sbuf_t *dst = &reply->buf;
    for (int i = 0; i < CHECKBOX_ITEM_COUNT; i++) {
        if(!(activeBoxIds & (1 << i)))
            continue;
        const box_t *box = findBoxByBoxId(i);
        sbufWriteU8(dst, box->permanentId);
    }
}

static void initActiveBoxIds(void)
{
    uint32_t ena = 0;

    ena |= 1 << BOXARM;


    if (sensors(SENSOR_ACC)) {
        ena |= 1 << BOXANGLE;
        ena |= 1 << BOXHORIZON;
    }







    ena |= 1 << BOXAIRMODE;

    if (sensors(SENSOR_ACC) || sensors(SENSOR_MAG)) {
        ena |= 1 << BOXMAG;
        ena |= 1 << BOXHEADFREE;
        ena |= 1 << BOXHEADADJ;
    }


    if (feature(FEATURE_SERVO_TILT))
        ena |= 1 << BOXCAMSTAB;
# 303 "src/main/fc/msp_server_fc.c"
    if (mixerConfig()->mixerMode == MIXER_FLYING_WING
        || mixerConfig()->mixerMode == MIXER_AIRPLANE
        || mixerConfig()->mixerMode == MIXER_CUSTOM_AIRPLANE)
        ena |= 1 << BOXPASSTHRU;

    ena |= 1 << BOXBEEPERON;
# 317 "src/main/fc/msp_server_fc.c"
    if (feature(FEATURE_INFLIGHT_ACC_CAL))
        ena |= 1 << BOXCALIB;

    ena |= 1 << BOXOSD;







    if (feature(FEATURE_SONAR)){
        ena |= 1 << BOXSONAR;
    }
# 347 "src/main/fc/msp_server_fc.c"
    if (feature(FEATURE_FAILSAFE)){
        ena |= 1 << BOXFAILSAFE;
    }


    ena |= 1 << BOXGTUNE;



    for(boxId_e boxId = 0; boxId < CHECKBOX_ITEM_COUNT; boxId++)
        if((ena & (1 << boxId))
           && findBoxByBoxId(boxId) == 
# 358 "src/main/fc/msp_server_fc.c" 3 4
                                      ((void *)0)
# 358 "src/main/fc/msp_server_fc.c"
                                          )
            ena &= ~ (1 << boxId);
    activeBoxIds = ena;
}



static uint32_t packFlightModeFlags(void)
{




    uint32_t boxEnabledMask = 0;


    static const int8_t flightMode_boxId_map[] = { BOXANGLE, BOXHORIZON, BOXMAG, BOXBARO, BOXGPSHOME, BOXGPSHOLD, BOXHEADFREE, -1, BOXPASSTHRU, BOXSONAR, BOXFAILSAFE, BOXGTUNE};
    flightModeFlags_e flightModeCopyMask = ~(GTUNE_MODE);
    for(unsigned i = 0; i < (sizeof(flightMode_boxId_map) / sizeof((flightMode_boxId_map)[0])); i++) {
        if(flightMode_boxId_map[i] == -1)
            continue;
        if((flightModeCopyMask & (1 << i)) == 0)
            continue;
        if((flightModeFlags & (1 << i)))
            boxEnabledMask |= 1 << flightMode_boxId_map[i];
    }




    const uint32_t rcModeCopyMask = (1 << (BOXHEADADJ)) | (1 << (BOXCAMSTAB)) | (1 << (BOXCAMTRIG)) | (1 << (BOXBEEPERON))
        | (1 << (BOXLEDMAX)) | (1 << (BOXLEDLOW)) | (1 << (BOXLLIGHTS)) | (1 << (BOXCALIB)) | (1 << (BOXGOV)) | (1 << (BOXOSD))
        | (1 << (BOXTELEMETRY)) | (1 << (BOXGTUNE)) | (1 << (BOXBLACKBOX)) | (1 << (BOXAIRMODE)) ;
    for(unsigned i = 0; i < sizeof(rcModeCopyMask) * 8; i++) {
        if((rcModeCopyMask & (1 << (i))) == 0)
            continue;
        if(rcModeIsActive(i))
            boxEnabledMask |= 1 << i;
    }


    if((armingFlags & (ARMED)))
        boxEnabledMask |= 1 << BOXARM;



    uint32_t mspBoxEnabledMask = 0;
    unsigned mspBoxIdx = 0;
    for (boxId_e boxId = 0; boxId < CHECKBOX_ITEM_COUNT; boxId++) {
        if((activeBoxIds & (1 << boxId)) == 0)
            continue;
        if (boxEnabledMask & (1 << boxId))
            mspBoxEnabledMask |= 1 << mspBoxIdx;
        mspBoxIdx++;
    }
    return mspBoxEnabledMask;
}

static void serializeSDCardSummaryReply(mspPacket_t *reply)
{
    sbuf_t *dst = &reply->buf;
# 456 "src/main/fc/msp_server_fc.c"
    sbufWriteU8(dst, 0);
    sbufWriteU8(dst, 0);
    sbufWriteU8(dst, 0);
    sbufWriteU32(dst, 0);
    sbufWriteU32(dst, 0);

}

static void serializeDataflashSummaryReply(mspPacket_t *reply)
{
    sbuf_t *dst = &reply->buf;
# 476 "src/main/fc/msp_server_fc.c"
    sbufWriteU8(dst, 0);
    sbufWriteU32(dst, 0);
    sbufWriteU32(dst, 0);
    sbufWriteU32(dst, 0);

}
# 496 "src/main/fc/msp_server_fc.c"
int mspServerCommandHandler(mspPacket_t *cmd, mspPacket_t *reply)
{

    sbuf_t *dst = &reply->buf;
    sbuf_t *src = &cmd->buf;

    int len = sbufBytesRemaining(src);

    printf("command code: %d\n",cmd->cmd);
    switch (cmd->cmd) {
        case 1:

            sbufWriteU8(dst, 0);
            sbufWriteU8(dst, 1);
            sbufWriteU8(dst, 22);
            break;

        case 2:
            sbufWriteData(dst, flightControllerIdentifier, 4);
            break;

        case 3:
            sbufWriteU8(dst, 1);
            sbufWriteU8(dst, 14);
            sbufWriteU8(dst, 0);
            break;

        case 4:
            sbufWriteData(dst, boardIdentifier, 4);



            sbufWriteU16(dst, 0);

            sbufWriteU8(dst, 0);
            break;

        case 5:
            sbufWriteData(dst, buildDate, 11);
            sbufWriteData(dst, buildTime, 8);
            sbufWriteData(dst, shortGitRevision, 7);
            break;


        case 100:
            sbufWriteU8(dst, 231);
            sbufWriteU8(dst, mixerConfig()->mixerMode);
            sbufWriteU8(dst, 0);
            sbufWriteU32(dst, ((uint32_t)1 << 2));
            break;

        case 101:
            printf("MSP_STATUS\n");
            sbufWriteU16(dst, cycleTime);



            sbufWriteU16(dst, 0);

            sbufWriteU16(dst, sensors(SENSOR_ACC) | sensors(SENSOR_BARO) << 1 | sensors(SENSOR_MAG) << 2 | sensors(SENSOR_GPS) << 3 | sensors(SENSOR_SONAR) << 4);
            sbufWriteU32(dst, packFlightModeFlags());
            sbufWriteU8(dst, getCurrentProfile());
            sbufWriteU16(dst, constrain(averageSystemLoadPercent, 0, 100));
            break;

        case 102: {

            unsigned scale_shift = (acc.acc_1G > 1024) ? 3 : 0;

            for (unsigned i = 0; i < 3; i++)
                sbufWriteU16(dst, accSmooth[i] >> scale_shift);
            for (unsigned i = 0; i < 3; i++)
                sbufWriteU16(dst, gyroADC[i]);
            for (unsigned i = 0; i < 3; i++)
                sbufWriteU16(dst, magADC[i]);
            break;
        }

        case 70:
            printf("MSP_DATAFLASH_SUMMARY\n");
            serializeDataflashSummaryReply(reply);
            break;

        default:
            printf("Unknown\n");
            break;
# 1538 "src/main/fc/msp_server_fc.c"
    }
    return 1;
}

void mspInit(void)
{
    initActiveBoxIds();
}
