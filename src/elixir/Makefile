NAME = fastinvsqrt
EXT = exs
EXEC = elixirc
RUN = elixir
FLAGS = -o $(BUILD)
BUILD = build
SOURCE = $(NAME).$(EXT)
RUNFLAGS = -e Main.main -pa $(BUILD)
TARGET = $(BUILD)/Elixir.Main.beam
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
	@$(RUN) $(RUNFLAGS) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
