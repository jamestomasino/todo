PREFIX ?= /usr/local
BINDIR ?= $(PREFIX)/bin
MANDIR ?= $(PREFIX)/share/man/man1

install: ${BINDIR}/todo ${MANDIR}/todo.1
install-man: ${MANDIR}/todo.1

${BINDIR}/todo:
	@echo Installing the executable to $(BINDIR)
	@mkdir -p $(BINDIR)
	@cp -f todo $(BINDIR)/todo
	@chmod 755 $(BINDIR)/todo

${MANDIR}/todo.1:
	@echo Installing the manual page to $(MANDIR)
	@mkdir -p $(MANDIR)
	@cp -f todo.1 $(MANDIR)/todo.1
	@chmod 644 $(MANDIR)/todo.1

uninstall:
	@echo Removing the executable from $(BINDIR)
	@rm -f $(BINDIR)/todo
	@echo Removing the manual page from $(MANDIR)
	@rm -f $(BINDIR)/todo.1

.PHONY: install install-man uninstall
