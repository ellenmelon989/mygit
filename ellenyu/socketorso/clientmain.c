#include "networking.h"

int main() {

  int to_server;
  int from_server;

  from_server = client_tcp_handshake( &to_server );

  printf("Client: attempting to read from server\n");
  int data;
  read (from_server, &data, 4);
  printf("Client: reads (100 expected): %i \n", data);
  data = 200;
  printf("Client: attempting to write 200 \n");
  write(to_server, &data, 4);
  printf("server sees: %i\n", data);
}
