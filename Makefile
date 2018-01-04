PREFIX ?= /usr
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

install:
	@echo Installing the executable to $(DESTDIR)$(BINDIR)
	@mkdir -p     $(DESTDIR)$(BINDIR)
	@cp -f todo   $(DESTDIR)$(BINDIR)/todo
	@chmod 755    $(DESTDIR)$(BINDIR)/todo
	@echo Installing the manual page to $(DESTDIR)$(MANDIR)/man1
	@mkdir -p     $(DESTDIR)$(MANDIR)
	@cp -f todo.1 $(DESTDIR)$(MANDIR)/man1/todo.1
	@chmod 644    $(DESTDIR)$(MANDIR)/man1/todo.1

uninstall:
	@echo Removing the executable from $(DESTDIR)$(BINDIR)
	@rm -f $(DESTDIR)$(BINDIR)/todo
	@echo Removing the manual page from $(DESTDIR)$(MANDIR)/man1
	@rm -f $(DESTDIR)$(BINDIR)/man1/todo.1

.PHONY: install uninstall
