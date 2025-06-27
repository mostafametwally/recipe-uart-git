#include <iostream>
#include <fcntl.h>      // open
#include <termios.h>    // termios
#include <unistd.h>     // write, close
#include <string.h>     // memset

#include "config_uart.hpp"

using namespace std;


int main() {
    int uart_fd = configure_uart("/dev/ttyS0", B9600);
    if (uart_fd < 0) return 1;

    // Send data
    const char* msg = "Hello UART\n";
    cout << "Hello from UART" << endl;
    for(int i=0; i< 10; ++i)
    {
        write(uart_fd, msg, strlen(msg));
        cout << "the message sent successfully" << endl;
        // Receive (blocking read)
        char buf[100];
        int n = read(uart_fd, buf, sizeof(buf) - 1);
        if (n > 0) {
            cout << "the message received successfully" << endl;
            buf[n] = '\0';
            std::cout << "Received: " << buf << std::endl;
    }
    else cout << "the message wasn't received from uart" << endl;
}
    close(uart_fd);
    return 0;
}
