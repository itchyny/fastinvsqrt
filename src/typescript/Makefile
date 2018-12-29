NAME = fastinvsqrt
EXT = ts
RUN = ts-node
SOURCE = $(NAME).$(EXT)
CHECK_EXEC = ../../script/check_exec.sh

.PHONY: all
all: build

.PHONY: build
build:
	@$(CHECK_EXEC) $(RUN)

.PHONY: run
run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) $(SOURCE) < /dev/stdin

.PHONY: clean
clean:
