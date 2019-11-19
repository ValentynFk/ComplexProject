# Core project makefile
SHELL = /bin/sh

$(shell mkdir -p obj)
$(shell mkdir -p obj/inc)
ODIR = obj
INCDIR = $(ODIR)/inc

SUBDIRS = kernel/ onewire-adapter/ ui-module/

#IDIRS := . $(SUBDIRS) $(INCDIR)
#CFLAGS := $(foreach dir,$(IDIRS),-I$(dir))
CFLAGS := -I$(INCDIR)
CC = gcc

SOURCES = main

#_DEPS = headers.h
#DEPS = $(patsubst %,$(IDIR)/%,$(_DEPS))

#_OBJ = main.o
#OBJ := $(patsubst %,$(ODIR)/%,$(_OBJ))

#$(ODIR)/%.o: %.c $(DEPS)
#	$(CC) -c -o $@ $< $(CFLAGS)

.PHONY: clean all

export ODIR
export INCDIR

app: setup
	$(CC) -o $(ODIR)/$@ $(shell find $(ODIR)/ -type f -name \*.o) $(LIBS)

all: setup
	$(CC) -o $(ODIR)/app $(shell find $(ODIR)/ -type f -name \*.o) $(LIBS)

setup:
	for dir in $(SUBDIRS) ; do \
		$(MAKE) -C $$dir ; \
	done
	for SOURCE in $(SOURCES) ; do \
		$(CC) -c $$SOURCE.c $(CFLAGS) -o $(ODIR)/$$SOURCE.o ; \
	done

clean:
	rm -f $(ODIR)/*.o $(ODIR)/app core $(INCDIR)/*.h
