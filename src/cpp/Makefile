NAME = fastinvsqrt
EXT = cpp
EXEC = g++
FLAGS = -g -O2 -std=c++11
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME)
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(MKDIR) $(BUILD)
	@$(CHECK_EXEC) $(EXEC)
	$(EXEC) $(FLAGS) $< -o $@

run: build
	@$(TARGET) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
