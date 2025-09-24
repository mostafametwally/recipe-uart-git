

CXXFLAGS += -g -O0
TARGET = uart_led
SRC = main.cpp config_uart.cpp
OBJ= $(SRC:.cpp = .o)

all: $(TARGET)

#  uart.o config_uart.o
$(TARGET) : $(OBJ)
	${CXX} $(CXXFLAGS) ${LDFLAGS} -o $@ $^ 
# 	uart.o config_uart.o -o uart_led

main.o: main.cpp
	${CXX} ${CXXFLAGS} -c main.cpp -o main.o

# config_uart.o: config_uart.cpp
# 	${CXX} ${CXXFLAGS} -c config_uart.cpp -o config_uart.o

clean:
	rm -f *.o $(TARGET)
