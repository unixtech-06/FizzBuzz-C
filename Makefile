CC=cc

CFLAGS=-Wall -O2 -pipe -march=native

TARGET=bin/FizzBuzz

SRC=src/main.c

all: $(TARGET)

$(TARGET): $(SRC)
	mkdir -p bin
	$(CC) $(CFLAGS) -o $(TARGET) $(SRC)

clean:
	rm -f $(TARGET)
