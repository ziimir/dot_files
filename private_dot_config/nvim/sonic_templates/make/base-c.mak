# Компилятор и флаги компиляции.
CC := gcc
CFLAGS := -Wall -Wextra -Wpedantic -std=c11

# Имя итоговой программы и списки исходных и объектных файлов.
TARGET := main
SRCS := $(wildcard *.c)
OBJS := $(SRCS:.c=.o)

# Цель по умолчанию: собрать итоговую программу.
.PHONY: all
all: $(TARGET)

# Линкует объектные файлы в исполняемый файл.
$(TARGET): $(OBJS)
	$(CC) $^ -o $@

# Компилирует каждый .c файл в соответствующий .o файл.
%.o: %.c
	$(CC) $(CFLAGS) -c $< -o $@

# Удаляет все файлы, созданные во время сборки.
.PHONY: clean
clean:
	rm -f $(TARGET) $(OBJS)

.PHONY: run
run:
	./$(TARGET)
