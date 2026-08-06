# dwm version
VERSION = 6.5

# Customize below to fit your system

# paths
PREFIX = /usr/local
MANPREFIX = ${PREFIX}/share/man

# FreeBSD keeps everything from ports under /usr/local; there is no
# /usr/X11R6 any more, so both the X headers and the libraries live here.
X11INC = /usr/local/include
X11LIB = /usr/local/lib

# Xinerama, comment if you don't want it
XINERAMALIBS  = -lXinerama
XINERAMAFLAGS = -DXINERAMA

# freetype
FREETYPELIBS = -lfontconfig -lXft
FREETYPEINC = /usr/local/include/freetype2

# includes and libs
# -lutil provides kinfo_getproc(3), which the swallow patch uses to walk the
# process tree in place of Linux's /proc.
INCS = -I${X11INC} -I${FREETYPEINC}
LIBS = -L${X11LIB} -lX11 ${XINERAMALIBS} ${FREETYPELIBS} -lX11-xcb -lxcb -lxcb-res -lXext -lXrender -lm -lutil

# Optional compiler optimisations may create smaller binaries and
# faster code, but increases compile time.
# See https://gcc.gnu.org/onlinedocs/gcc/Optimize-Options.html
#OPTIMISATIONS = -march=native -flto=auto -O3

# flags
# _XOPEN_SOURCE is deliberately not set here: on FreeBSD, asking for a strict
# standards namespace switches __BSD_VISIBLE off, and <sys/user.h> (needed for
# struct kinfo_proc) does not compile without it. The default namespace is a
# superset of XSI anyway.
CPPFLAGS = -D_DEFAULT_SOURCE -D_BSD_SOURCE -DVERSION=\"${VERSION}\" ${XINERAMAFLAGS}
#CFLAGS   = -g -std=c99 -pedantic -Wall -O0 ${INCS} ${CPPFLAGS}
CFLAGS   = ${OPTIMISATIONS} -std=c99 -pedantic -Wall -Wno-unused-function -Wno-deprecated-declarations ${INCS} ${CPPFLAGS}
LDFLAGS  = ${LIBS}

# Solaris
#CFLAGS = -fast ${INCS} -DVERSION=\"${VERSION}\"
#LDFLAGS = ${LIBS}

# compiler and linker
CC = cc
