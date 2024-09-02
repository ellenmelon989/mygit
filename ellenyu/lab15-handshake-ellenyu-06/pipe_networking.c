#include <stdio.h>
#include <stdlib.h>
#include "pipe_networking.h"


/*=========================
  server_setup
  args:

  creates the WKP (upstream) and opens it, waiting for a  connection.
  removes the WKP once a connection has been made

  returns the file descriptor for the upstream pipe.
  =========================*/
int server_setup() {
 
    mkfifo(WKP, 0644);

    // block
    printf("Server: Waiting for client to connect...\n");
    int from_client = open(WKP, O_RDONLY);
    printf("Server: Connection established with client.\n");

    remove(WKP);
    printf("Server: Removed well-known pipe.\n");

    return from_client;
}

int halfhandshake(int *to_client, int from_client) {
    //client's private fifo
    char privateFifoName[HANDSHAKE_BUFFER_SIZE];
    read(from_client, privateFifoName, sizeof(privateFifoName));
    printf("Server: Received client's private FIFO name: %s\n", privateFifoName);
    *to_client = open(privateFifoName, O_WRONLY);
    printf("Server: Connected to client's private FIFO.\n");

    // initial acknowledgement
    write(*to_client, ACK, sizeof(ACK));
    printf("Server: Sent initial acknowledgement to client.\n");

    //response
    char response[HANDSHAKE_BUFFER_SIZE];
    read(from_client, response, sizeof(response));
    printf("Server: Received response from client: %s\n", response);

    return from_client;
}


/*=========================
  server_handshake
  args: int * to_client

  Performs the server side pipe 3 way handshake.
  Sets *to_client to the file descriptor to the downstream pipe.

  returns the file descriptor for the upstream pipe.
  =========================*/
int server_handshake(int *to_client) {

  int from_client;

  from_client = server_setup();

  //client's private fifo
  char privateFifoName[HANDSHAKE_BUFFER_SIZE];
  read(from_client, privateFifoName, sizeof(privateFifoName));
  printf("Server: Received client's private FIFO name: %s\n", privateFifoName);
  *to_client = open(privateFifoName, O_WRONLY);
  printf("Server: Connected to client's private FIFO.\n");

  write(*to_client, ACK, sizeof(ACK));
  printf("Server: Sent initial acknowledgement to client.\n");

  // response
  char response[HANDSHAKE_BUFFER_SIZE];
  read(from_client, response, sizeof(response));
  printf("Server: Received response from client: %s\n", response);
  if (strcmp(response, MESSAGE) == 0) {
      printf("Server: Handshake completed successfully.\n");
  } else {
      printf("Server: Handshake failed.\n");
      close(*to_client);
      return -1;
    }

  return from_client;
}


/*=========================
  client_handshake
  args: int * to_server

  Performs the client side pipe 3 way handshake.
  Sets *to_server to the file descriptor for the upstream pipe.

  returns the file descriptor for the downstream pipe.
  =========================*/
int client_handshake(int *to_server) {
 
    //create private fifo
    char privateFifoName[HANDSHAKE_BUFFER_SIZE];
    sprintf(privateFifoName, "%d", getpid());

    mkfifo(privateFifoName, 0644);

    //connect to server and send privatefifo
    *to_server = open(WKP, O_WRONLY);
    printf("Client: Connected to server. Sending private FIFO name: %s\n", privateFifoName);
    write(*to_server, privateFifoName, sizeof(privateFifoName));

    int from_server = open(privateFifoName, O_RDONLY);
    printf("Client: Received initial acknowledgement from server.\n");
    remove(privateFifoName);
    printf("Client: Removed private FIFO.\n");

    //send response
    write(*to_server, MESSAGE, sizeof(MESSAGE));
    printf("Client: Sent response to server.\n");

    printf("Client: Handshake completed successfully.\n");
   

    return from_server;
}

/*=========================
  server_connect
  args: int from_client

  handles the subserver portion of the 3 way handshake

  returns the file descriptor for the downstream pipe.
  =========================*/
// int server_connect(int from_client) {
//   int to_client  = 0;
//   return to_client;
// }