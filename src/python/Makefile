NAME = fastinvsqrt
EXT = py
RUN = python
SOURCE = $(NAME).$(EXT)
CHECK_EXEC = ../../script/check_exec.sh

all: build

build:
	@$(CHECK_EXEC) $(RUN)

run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) $(SOURCE) < /dev/stdin

clean:

.PHONY: build run clean
