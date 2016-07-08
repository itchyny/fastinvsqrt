all:

build: script/build/validate
	@bash script/build.sh

script/build/validate: script/validate.c
	@mkdir -p script/build
	@gcc $< -o $@ -lm

# It's very weird but it does not work on Ubuntu?
# Try `bash script/test.sh` from your shell.
test: build
	@bash script/test.sh

clean:
	@bash script/clean.sh
	@rm -rf script/build

.PHONY: deps build test clean
