# This makefile is based on Pop OS wallpaper repo
# Yes I yoinked it and adapted it for this repo,
# Shut the fuck up

# PREFIX is environment variable, but if it is not set, then set default value
ifeq ($(PREFIX),)
    PREFIX := /usr/local
endif

datarootdir = $(PREFIX)/share
CURRENT = $(shell pwd)

.PHONY: install uninstall

install: all
	for file in $(CURRENT) ; do \	
		install -D -m 0644 "$$file" "$(DESTDIR)$(datadir)/wallpapers/$$(basename "$$file")"; \ \
	done

uninstall:
	for file in $(CURRENT) ; do \
		rm -f "$(DESTDIR)$(datadir)/wallpapers/$$(basename "$$file")"; \
	done
