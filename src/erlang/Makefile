NAME = fastinvsqrt
EXT = erl
EXEC = erlc
RUN = erl
FLAGS = -o $(BUILD)
BUILD = build
SOURCE = $(NAME).$(EXT)
RUNFLAGS = -noshell -pa $(BUILD) -s $(NAME) main -s init stop
TARGET = $(BUILD)/$(NAME).beam
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
