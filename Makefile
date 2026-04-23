# Install to /usr/local unless otherwise specified, such as `make PREFIX=/app`
PREFIX?=/usr/local

# What to run to install various files
INSTALL?=install
# Run to install the actual binary
INSTALL_PROGRAM=$(INSTALL) -m 755
# Run to install application data, with differing permissions
INSTALL_DATA=$(INSTALL) -m 644

# Directories into which to install the various files
bindir=$(DESTDIR)$(PREFIX)/bin
sharedir=$(DESTDIR)$(PREFIX)/share

help:
	@echo "targets:"
	@awk -F '#' '/^[a-zA-Z0-9_.-]+:.*?#/ { print $0 }' Makefile \
	| sed -n 's/^\(.*\): \(.*\)#\(.*\)/  \1|-\3/p' \
	| { if command -v column >/dev/null 2>&1; then column -t -s '|'; else cat; fi; }

install: todo todo.1 # system install
	$(INSTALL) -d $(bindir)
	$(INSTALL) -d $(sharedir)/man/man1
	$(INSTALL_PROGRAM) todo $(bindir)/todo
	$(INSTALL_DATA) todo.1 $(sharedir)/man/man1/todo.1

uninstall: # system uninstall
	rm -f $(bindir)/todo
	rm -f $(sharedir)/man/man1/todo.1 \
	      $(sharedir)/man/man1/todo.1.gz \
	      $(sharedir)/man/man1/todo.1.bz2 \
	      $(sharedir)/man/man1/todo.1.xz

README.txt: todo.1 # generate readme file
	MANWIDTH=80 man ./todo.1 | col -bx > README.txt

test: test-shellcheck test-manpage test-spec # run local quality checks

test-shellcheck: # run shellcheck for the todo script
	@if command -v shellcheck >/dev/null 2>&1; then \
		shellcheck todo && echo "ok: shellcheck"; \
	else \
		echo "skip: shellcheck (tool not found)"; \
	fi

test-manpage: # validate manpage formatting and warnings
	@if command -v groff >/dev/null 2>&1; then \
		groff -man -ww -z todo.1 && echo "ok: manpage (groff)"; \
	elif command -v mandoc >/dev/null 2>&1; then \
		mandoc -Tlint todo.1 && echo "ok: manpage (mandoc)"; \
	else \
		echo "skip: manpage (groff/mandoc not found)"; \
	fi

test-spec: # validate RPM spec syntax and lint when available
	@if command -v rpmspec >/dev/null 2>&1; then \
		rpmspec -P todo.spec > /dev/null && echo "ok: rpmspec"; \
	else \
		echo "skip: rpmspec (tool not found)"; \
	fi
	@if command -v rpmlint >/dev/null 2>&1; then \
		rpmlint todo.spec && echo "ok: rpmlint"; \
	else \
		echo "skip: rpmlint (tool not found)"; \
	fi

.PHONY: help install uninstall test test-shellcheck test-manpage test-spec
