NAME = FastInvSqrt
EXT = scala
EXEC = scalac
RUN = scala
FLAGS = -d $(BUILD)
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/main.class
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
	@$(RUN) -classpath $(BUILD) main < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
