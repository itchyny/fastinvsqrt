.PHONY: all
all:

.PHONY: build
build: script/build/validate
	@bash script/build.sh

script/build/validate: script/validate.c
	@mkdir -p script/build
	@gcc $< -o $@ -lm

# It's very weird but it does not work on Ubuntu?
# Try `bash script/test.sh` from your shell.
.PHONY: test
test: build
	@bash script/test.sh

.PHONY: clean
clean:
	@bash script/clean.sh
	@rm -rf script/build
