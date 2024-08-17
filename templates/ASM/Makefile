ASM = nasm
ASM_FLAGS = -f elf32

LD = ld
LD_FLAGS = -m elf_i386

SRC_DIR = src
BUILD_DIR = build
TARGET = $(BUILD_DIR)/main

all: $(TARGET)

$(TARGET): $(BUILD_DIR)/main.o
	$(LD) $(LD_FLAGS) -o $(TARGET) $(BUILD_DIR)/main.o

$(BUILD_DIR)/main.o: $(SRC_DIR)/main.asm
	$(ASM) $(ASM_FLAGS) -o $(BUILD_DIR)/main.o $(SRC_DIR)/main.asm

clean:
	rm -f $(BUILD_DIR)/*.o $(TARGET)
