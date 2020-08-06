CC = gcc
PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin

all: leftbar rightbar 

leftbar:
	$(CC) -o leftbar_panel leftbar_panel.c

rightbar:
	$(CC) -o rightbar_panel rightbar_panel.c

install: all
	@echo installing to $(DESTDIR)$(BINDIR)
	@mkdir -p $(DESTDIR)$(BINDIR)
	@cp -f leftbar_panel $(DESTDIR)$(BINDIR)
	@chmod 755 $(DESTDIR)$(BINDIR)/leftbar_panel
	@cp -f rightbar_panel $(DESTDIR)$(BINDIR)
	@chmod 755 $(DESTDIR)$(BINDIR)/rightbar_panel

uninstall:
	rm $(DESTDIR)$(BINDIR)/rightbar_panel
	rm $(DESTDIR)$(BINDIR)/leftbar_panel

.PHONY: all install uninstall
