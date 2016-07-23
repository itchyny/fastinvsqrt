NAME = FastInvSqrt
EXT = purs
EXEC = pulp
SOURCE = $(NAME).$(EXT)
BUILD = build
TARGET = $(BUILD)/src/Main.purs
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

all: build

build: $(BUILD)/bower_components $(TARGET)

$(BUILD)/bower_components: bower.json
	@$(CHECK_EXEC) bower
	@$(MKDIR) $(BUILD)
	-rm -rf $(BUILD)/bower_components
	@cp bower.json $(BUILD)/
	cd $(BUILD) && bower install

$(TARGET): $(SOURCE)
	@$(CHECK_EXEC) $(EXEC)
	@$(MKDIR) $(BUILD)/src
	@cp $< $@

run: build
	@$(CHECK_EXEC) $(EXEC)
	@cd $(BUILD) && $(EXEC) run < /dev/stdin

clean:
	-rm -rf $(BUILD)

.PHONY: build run clean
