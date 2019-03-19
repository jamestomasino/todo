PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man

install:
	@echo Installing the executable to $(BINDIR)
	@mkdir -p $(BINDIR)
	@cp -f todo $(BINDIR)/todo
	@chmod 755 $(BINDIR)/todo
	@echo Installing the manual page to $(MANDIR)/man1
	@mkdir -p $(MANDIR)/man1
	@cp -f todo.1 $(MANDIR)/man1/todo.1
	@chmod 644 $(MANDIR)/man1/todo.1

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/todo
	@echo Removing the manual page from $(MANDIR)/man1
	@rm -f $(BINDIR)/man1/todo.1

.PHONY: install uninstall
