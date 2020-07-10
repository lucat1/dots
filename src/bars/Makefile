CC = gcc

all: leftbar

leftbar:
	$(CC) -o leftbar_panel leftbar_panel.c

rightbar:
	$(CC) -o rightbar_panel rightbar_panel.c

install:
	cp leftbar_panel ~/.bin
	cp rightbar_panel ~/.bin

uninstall:
	rm ~/.bin/leftbar_panel 
	rm ~/.bin/rightbar_panel 

.PHONY: all install uninstall
