

CXXFLAGS += -g -O0
TARGET = uart_led
SRC = main.cpp config_uart.cpp
OBJ= $(SRC:.cpp = .o)

all: $(TARGET)

#  uart.o config_uart.o
$(TARGET) : $(OBJ)
	${CXX} $(CXXFLAGS) ${LDFLAGS} -o $@ $^ 
# 	uart.o config_uart.o -o uart_led

# uart.o: uart.cpp
# 	${CXX} ${CXXFLAGS} -c uart.cpp -o uart.o

# config_uart.o: config_uart.cpp
# 	${CXX} ${CXXFLAGS} -c config_uart.cpp -o config_uart.o

clean:
	rm -f *.o $(TARGET)
