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

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $<

run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) -jar $(TARGET) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
