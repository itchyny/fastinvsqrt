NAME = fastinvsqrt
EXT = m
ifeq ($(UNAME),Darwin)
	EXEC = clang
	FLAGS = -g -O2 -framework Foundation
else
	EXEC = gcc
	FLAGS = -g -O2 -I/usr/include/GNUstep -lobjc
endif 
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
	$(EXEC) $(FLAGS) $< -o $@

.PHONY: run
run: build
	@$(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
