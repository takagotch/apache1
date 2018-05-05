CFLAGS=-g Wall
CC=gcc
AR=ar
LIBS=-L./ -lcgic

libcgic.a: cgic.o cgic.h
	rm -f libcgic.a
	$(AR) rc libcgic.a cgic.o
example.cgi: example.o libgic.a
	gcc example.o -o example.cgi $(LIBS)


