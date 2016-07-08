NAME = fastinvsqrt
EXT = hs
EXEC = ghc
FLAGS = -outputdir $(BUILD) -O2
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
