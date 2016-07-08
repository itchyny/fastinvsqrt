NAME = FastInvSqrt
EXT = cs
EXEC = mcs
RUN = mono
FLAGS = -unsafe
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME).exe
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $< -out:$(TARGET)

run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) $(TARGET) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
