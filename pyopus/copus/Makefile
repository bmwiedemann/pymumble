
ifeq ($(PLATFORM), MINGW32)
	MOD_EXT = pyd
	ADD_FLAGS = -c mingw32
endif
ifeq ($(PLATFORM), UNIX)
	MOD_EXT = so
	ADD_FLAGS = 
endif

VERSION := 1.1
OPUS := opus-$(VERSION)
MOD_NAME = copus

#-------------------------

$(MOD_NAME).$(MOD_EXT) : $(MOD_NAME).pyx c$(MOD_NAME).pxd
	python setup.py build_ext --inplace $(ADD_FLAGS)

$(OPUS)/.libs/libopus.a : $(OPUS)/Makefile
	cd $(OPUS) && make

$(OPUS)/Makefile : | $(OPUS)
	cd $(OPUS) && ./configure --disable-shared --enable-static $(CONFIGURE_OPTS)

$(OPUS) : $(OPUS).tar.gz
	tar zxf $(OPUS).tar.gz

$(OPUS).tar.gz :
	echo "You must download and put here $(OPUS).tar.gz file"

all : $(MOD_NAME).$(MOD_EXT)
.PHONY : all

clean :
	rm -r $(OPUS) build $(MOD_NAME).c $(MOD_NAME).pyd
