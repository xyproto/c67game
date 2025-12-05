.PHONY: test clean all

all: test

test: test_basic

test_basic: test_basic.c67 game.c67
	@echo "Building basic test..."
	c67 test_basic.c67 -o test_basic
	@echo "Running basic test..."
	./test_basic

test_bounce: test_bounce.c67 game.c67
	@echo "Building bounce test..."
	c67 test_bounce.c67 -o test_bounce
	@echo "Run './test_bounce' to see the bouncing ball demo"

clean:
	rm -f test_basic test_bounce *.o

help:
	@echo "Available targets:"
	@echo "  make test        - Build and run basic visual test"
	@echo "  make test_bounce - Build bouncing ball demo"
	@echo "  make clean       - Remove built files"
