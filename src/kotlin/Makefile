NAME = fastinvsqrt
EXT = kt
EXEC = kotlinc
RUN = java
FLAGS = -d $(TARGET) -include-runtime
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME).jar
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
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) -jar $(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
