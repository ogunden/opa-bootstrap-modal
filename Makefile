.PHONY: clean

SRC = modal_test.opa

all: modal_test.exe

modal.opp: modal.js
	opa-plugin-builder $^ -o $@

modal_test.exe: modal.opp $(SRC)
	opa --parser classic $^

clean:
	rm -rf _build _tracks access.log error.log modal.opp modal_test.exe
