NAME = fastinvsqrt
EXT = st
RUN = gst
FLAGS = -g
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
	@$(RUN) $(FLAGS) $(SOURCE) < /dev/stdin

.PHONY: clean
clean:
