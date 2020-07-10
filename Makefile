# Install to /usr/local unless otherwise specified, such as `make PREFIX=/app`
PREFIX?=/usr/local

# What to run to install various files
INSTALL?=install
# Run to install the actual binary
INSTALL_PROGRAM=$(INSTALL) -Dm 755
# Run to install application data, with differing permissions
INSTALL_DATA=$(INSTALL) -Dm 644

# Directories into which to install the various files
bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share

help:
	@echo "targets:"
	@grep -E '^[a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) \
	| sed -n 's/^\(.*\): \(.*\)##\(.*\)/  \1|\3/p' \
	| column -t  -s '|'

install: todo todo.1 ## system install
	$(INSTALL_PROGRAM) todo $(bindir)/todo
	$(INSTALL_DATA) todo.1 $(sharedir)/man/man1/todo.1

uninstall: ## system uninstall
	rm -f $(bindir)/todo
	rm -f $(sharedir)/man/man1/todo.1

README.txt: todo.1 ## generate readme file
	man ./todo.1 | col -bx > README.txt

.PHONY: help install uninstall
