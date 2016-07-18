NAME = fastinvsqrt
EXT = cr
EXEC = crystal
FLAGS = build --release
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME)
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $< -o $@

run: build
	@$(TARGET) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
