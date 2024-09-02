#include "pipe_networking.h"

static void sighandler(int signo) {
    if (signo == SIGINT) {
        remove(WKP);
        printf("\nWKP removed\n");
        exit(0);
    }
}

int main() {
    int to_client;
    int from_client;
    
    signal(SIGINT, sighandler);

    while (1) {
        printf("new client\n");
        from_client = server_handshake(&to_client);
        printf("Completed handshake (server) \n");

        printf("Server attempting to write 999 to client \n");
        int data = 100;
        write(to_client, &data, 4);
        printf("Server wrote 999 to client \n");
        printf("Server attempting to read from client \n");
        read(from_client, &data, 4);
        printf("Server sees (should be 200): %i \n", data);

        close(to_client);
        close(from_client);
    }
}