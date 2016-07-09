NAME = fastinvsqrt
EXT = ijs
RUN = jconsole
SOURCE = $(NAME).$(EXT)
JCONSOLE_OF_JAVA := $(shell ls -al `which jconsole` | grep Java)
CHECK_EXEC = ../../script/check_exec.sh

all: build

build:
	@$(CHECK_EXEC) $(RUN)

run: build
	@$(CHECK_EXEC) $(RUN)
ifeq ($(JCONSOLE_OF_JAVA),)
	@$(RUN) $(SOURCE) < /dev/stdin
else
	@echo "Requires 'jconsole' of J language but Java SE Monitoring and Management software was found." >/dev/stderr
endif

clean:

.PHONY: build run clean
