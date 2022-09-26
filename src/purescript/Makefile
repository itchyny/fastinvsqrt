NAME = FastInvSqrt
EXT = purs
EXEC = npm run pulp
SOURCE = $(NAME).$(EXT)
BUILD = build
TARGET = $(BUILD)/output/Main/index.js
MKDIR = mkdir -p
CHECK_EXEC = ../../script/check_exec.sh

.PHONY: all
all: build

.PHONY: build
build: $(BUILD)/node_modules $(TARGET)

$(BUILD)/node_modules: package.json psc-package.json
	@$(MKDIR) $(BUILD)/src
	@cp package.json psc-package.json $(BUILD)/
	cd $(BUILD) && npm install && npm run psc-package install

$(TARGET): $(SOURCE)
	@$(MKDIR) $(BUILD)/src
	@cp $< $(BUILD)/src
	cd $(BUILD) && $(EXEC) build

.PHONY: run
run:
	@cd $(BUILD) && $(EXEC) run --silent < /dev/stdin

.PHONY: clean
clean:
	-rm -rf $(BUILD)
