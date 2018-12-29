NAME = FastInvSqrt
EXT = groovy
EXEC = groovyc
RUN = groovy
FLAGS = -d $(BUILD)
BUILD = build
SOURCE = $(NAME).$(EXT)
TARGET = $(BUILD)/$(NAME).class
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
	@$(RUN) -classpath $(BUILD) $(NAME) < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
