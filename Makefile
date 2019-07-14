# styx - simple terminal
# See LICENSE file for copyright and license details.
.POSIX:

include config.mk

SRC = styx.c x.c
OBJ = $(SRC:.c=.o)

all: options styx

options:
	@echo styx build options:
	@echo "CFLAGS  = $(STYXCFLAGS)"
	@echo "LDFLAGS = $(STYXLDFLAGS)"
	@echo "CC      = $(CC)"

config.h:
	cp config.def.h config.h

.c.o:
	$(CC) $(STYXCFLAGS) -c $<

styx.o: config.h styx.h win.h
x.o: arg.h config.h styx.h win.h

$(OBJ): config.h config.mk

styx: $(OBJ)
	$(CC) -o $@ $(OBJ) $(STYXLDFLAGS)

clean:
	rm -f styx $(OBJ) styx-$(VERSION).tar.gz

dist: clean
	mkdir -p styx-$(VERSION)
	cp -R FAQ LEGACY TODO LICENSE Makefile README config.mk\
		config.def.h styx.info styx.1 arg.h styx.h win.h $(SRC)\
		styx-$(VERSION)
	tar -cf - styx-$(VERSION) | gzip > styx-$(VERSION).tar.gz
	rm -rf styx-$(VERSION)

install: styx
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f styx $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/styx
	mkdir -p $(DESTDIR)$(MANPREFIX)/man1
	sed "s/VERSION/$(VERSION)/g" < styx.1 > $(DESTDIR)$(MANPREFIX)/man1/styx.1
	chmod 644 $(DESTDIR)$(MANPREFIX)/man1/styx.1
	tic -sx styx.info
	@echo Please see the README file regarding the terminfo entry of styx.

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/styx
	rm -f $(DESTDIR)$(MANPREFIX)/man1/styx.1

.PHONY: all options clean dist install uninstall
