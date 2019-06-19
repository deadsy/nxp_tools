
TOOLS = tools
TOOLS_TGZ = ./original/tools.tar.gz

PATCHFILES := $(sort $(wildcard patches/*.patch))

PATCH_CMD = \
  for f in $(PATCHFILES); do\
      echo $$f ":"; \
      patch -d $(SRC) --backup -p1 < $$f || exit 1; \
  done

ELFTOSB_SRC = tools/tools/elftosb
ELFTOSB = $(ELFTOSB_SRC)/bld/linux/elftosb

BLHOST_SRC = tools/tools/blhost/gcc
BLHOST = $(BLHOST_SRC)/Release/blhost

SDPHOST_SRC = tools/tools/sdphost/gcc
SDPHOST = $(SDPHOST_SRC)/Release/sdphost

.PHONY: all
all: .stamp_src elftosb blhost sdphost

.PHONY: clean
clean:
	-rm -rf $(TOOLS)
	-rm .stamp*
	-rm test.bin

.PHONY: test
test:
	#$(ELFTOSB) -f imx -c ./test/test.bd -o test.bin does_not_exist.elf
	$(ELFTOSB) -f imx -c ./test/test.bd -o test.bin ./test/test.elf
	#$(BLHOST) -v
	#$(SDPHOST) -v

.PHONY: install
install:

.stamp_src:
	tar -xzf $(TOOLS_TGZ)
	touch $@

elftosb: .stamp_src
	make -C $(ELFTOSB_SRC)

blhost: .stamp_src
	make -C $(BLHOST_SRC)

sdphost: .stamp_src
	make -C $(SDPHOST_SRC)
