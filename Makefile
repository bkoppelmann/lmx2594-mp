ROOT = $(abspath .)
.PHONY: tools all upload
tools:
	git submodule update --init --recursive
	cd freedom-e-sdk && $(MAKE) tools

firmware:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(ROOT)/freedom-e-sdk $(MAKE)

clean:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(ROOT)/freedom-e-sdk $(MAKE) clean

upload:
	cd micropython/ports/arty/ && FREEDOM_E_SDK=$(ROOT)/freedom-e-sdk $(MAKE) upload

mrpropper: clean
	cd freedom-e-sdk && $(MAKE) toolchain-clean
