all: build

build: pyopus/copus.so pycelt/celt_0_11.so

pyopus/copus.so:
	$(MAKE) -C pyopus $(MFLAGS)

pycelt/celt_0_11.so:
	$(MAKE) -C pycelt $(MFLAGS)

install:
	mkdir -p $D
	cp -a * $D/
	cd $D && rm -rf pycelt/celt_0_{11,7} pyopus/copus LICENSE README.md API.md TODO Makefile */Makefile

