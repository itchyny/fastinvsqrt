NAME = FastInvSqrt
EXT = java
EXEC = javac
RUN = java
FLAGS = -d $(BUILD)
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME).class
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
	@$(RUN) -cp $(BUILD) $(NAME) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
