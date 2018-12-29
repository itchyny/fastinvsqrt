NAME = fastinvsqrt
EXT = cpp
EXEC = g++
FLAGS = -g -O2 -std=c++11
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME)
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

.PHONY: all
all: build

.PHONY: build
build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(MKDIR) $(BUILD)
	@$(CHECK_EXEC) $(EXEC)
	$(EXEC) $(FLAGS) $< -o $@

.PHONY: run
run: build
	@$(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
