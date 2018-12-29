NAME = FastInvSqrt
EXT = fs
EXEC = fsharpc
RUN = mono
FLAGS =
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME).exe
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

.PHONY: all
all: build

.PHONY: build
build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $< --out:$(TARGET)

.PHONY: run
run: build
	@$(CHECK_EXEC) $(RUN)
	@$(RUN) $(TARGET) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
