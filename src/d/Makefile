NAME = fastinvsqrt
EXT = d
EXEC = dmd
FLAGS = -of$(TARGET) -O
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
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $<

.PHONY: run
run: build
	@$(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
