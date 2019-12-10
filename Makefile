ROOT = $(abspath .)
FREEDOM_E ?= $(ROOT)/freedom-e-sdk
.PHONY: tools all upload
tools:
	git submodule update --init --recursive
	cd freedom-e-sdk && $(MAKE) tools

firmware:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(FREEDOM_E) $(MAKE)

clean:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(FREEDOM_E) $(MAKE) clean

upload:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(FREEDOM_E) $(MAKE) upload

mrpropper: clean
	cd freedom-e-sdk && $(MAKE) toolchain-clean
