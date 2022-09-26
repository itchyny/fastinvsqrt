NAME = fastinvsqrt
EXT = pony
EXEC = ponyc
FLAGS =
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(DIR)/$(NAME)
DIR = $(BUILD)/$(NAME)
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

.PHONY: all
all: build

.PHONY: build
build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(DIR)
	@cp $< $(DIR)
	$(EXEC) $(FLAGS) $(DIR) -o $(DIR)

.PHONY: run
run: build
	@$(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
