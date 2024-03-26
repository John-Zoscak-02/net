PREFIX = /usr/local

net: net.sh net.awk net.tsv
	cat net.sh > $@
	echo 'exit 0' >> $@
	echo '#EOF' >> $@
	tar czf - net.awk net.tsv >> $@
	chmod +x $@

test: net.sh
	shellcheck -s sh net.sh

clean:
	rm -f net

install: net
	mkdir -p $(DESTDIR)$(PREFIX)/bin
	cp -f net $(DESTDIR)$(PREFIX)/bin
	chmod 755 $(DESTDIR)$(PREFIX)/bin/net

uninstall:
	rm -f $(DESTDIR)$(PREFIX)/bin/net

.PHONY: test clean install uninstall
