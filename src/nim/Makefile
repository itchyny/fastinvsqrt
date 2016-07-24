NAME = fastinvsqrt
EXT = nim
EXEC = nim
FLAGS = compile --opt:speed
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
	@cp $< $(BUILD)/
	cd $(BUILD) && $(EXEC) $(FLAGS) $(NAME)

run: build
	@$(TARGET) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
