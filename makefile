CXX = clang++
TARGET = thread
SRC = threads.cpp
ASM = $(SRC:.cpp=.s)

.PHONY: al run clean

all: $(TARGET)

$(TARGET) : $(SRC)
	$(CXX) $(SRC) -o $(TARGET)

%.s: %.cpp
	$(CXX) -S $< -o $@

asm: $(ASM)

run: $(TARGET)
	./$(TARGET)


time: $(TARGET)
	/bin/bash -c "time ./$(TARGET)"

clean:
	rm -rf $(TARGET)