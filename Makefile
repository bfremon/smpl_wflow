sudo = /usr/bin/sudo
apt_install = $(sudo) /usr/bin/apt-get install 
dot = /usr/bin/dot
rm = /bin/rm
packages = graphviz
files = *.dot

all: $(files)

$(wildcard *.dot):
	$(dot) -Tpng -o$(subst dot,png,$@) $@
	$(dot) -Tsvg -o$(subst dot,svg,$@) $@

install:
	$(apt_install) $(packages)

.PHONY: $(files) clean

clean:
	$(rm) *.png
	$(rm) *.svg
