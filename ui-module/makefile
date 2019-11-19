#Makefile for the kernel directory

SUBDIRS := button/ dropdown-menu/ mainframe/

IDIR := .
IDIRS := . $(SUBDIRS)
CFLAGS := $(foreach dir,$(IDIRS),-I$(dir))

CC=gcc
SOURCES = ui_module

.PHONY: all

export ODIR := ../$(ODIR)
export INCDIR := ../$(INCDIR)

$(shell cp -p $(IDIR)/*.h $(INCDIR))

all:
	for dir in $(SUBDIRS) ; do \
		$(MAKE) -C $$dir ; \
	done
	for SOURCE in $(SOURCES) ; do \
		$(CC) -c $$SOURCE.c $(CFLAGS) -o $(ODIR)/$$SOURCE.o; \
	done
