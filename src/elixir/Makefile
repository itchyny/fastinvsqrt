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

all: build

build: $(TARGET)

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)
	$(EXEC) $(FLAGS) $<

run: build
	@$(RUN) $(RUNFLAGS) < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
