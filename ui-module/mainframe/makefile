#Makefile for the kernel directory
IDIR=.
CC=gcc
CFLAGS=-I$(IDIR)

SOURCES = mainframe

.PHONY: all

export ODIR := ../$(ODIR)
export INCDIR := ../$(INCDIR)

$(shell cp -p $(IDIR)/*.h $(INCDIR))


all:
	for SOURCE in $(SOURCES) ; do \
		$(CC) -c $$SOURCE.c $(CFLAGS) -o $(ODIR)/$$SOURCE.o; \
	done
