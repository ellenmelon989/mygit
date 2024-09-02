#include <stdio.h>
#include <stdlib.h>
#include <signal.h>
#include <unistd.h>
#include <fcntl.h>
#include <sys/wait.h>
#include <sys/socket.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <netdb.h>
#include <string.h>
#include <errno.h>

#ifndef NETWORKING_H
#define NETWORKING_H
int halfhandshake(int *to_client, int from_client);
int server_handshake(int *to_client);
int client_handshake(int *to_server);

//for basic & persistent servers
int server_connect(int from_client);

//for forking server
int server_setup();

//multi_server
// int multi_server_setup();
// int multi_server_connect(int from_client, struct message m);

#endif