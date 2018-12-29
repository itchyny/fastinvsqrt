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
