#include "networking.h"

int main() {
  int to_client;
  int from_client;

  from_client = server_tcp_handshake( &to_client );

  printf("server attempting to write 100 to client\n");
  int data = 100;
  write (to_client, &data, 4);
  printf("server attempting to read\n");
  read(from_client, &data, 4);
  printf("server sees (should be 200): %i\n", data);
}