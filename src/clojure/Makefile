NAME = fastinvsqrt
EXT = clj
RUN = java
FLAGS = -cp clojure-1.8.0.jar clojure.main
SOURCE = $(NAME).$(EXT)
CHECK_EXEC = ../../script/check_exec.sh

all: build

build:
	@$(CHECK_EXEC) $(RUN)

run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) $(FLAGS) $(SOURCE) /dev/stdin

clean:

.PHONY: build run clean
