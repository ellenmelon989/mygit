#include <unistd.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <fcntl.h>
#include <sys/types.h>
#include <sys/stat.h>
#include <sys/wait.h>
#include <errno.h>

#define READ 0
#define WRITE 1
int err(){
    printf("errno %d\n",errno);
    printf("%s\n",strerror(errno));
    exit(1);
}

int main() {
  int fds[2];
  pipe( fds );
  char line[100];
  char lineto[100];
  int status;

  pid_t f = fork();
  if (f == 0) {
    printf("pid %d: enter text: ", getpid());
    fgets(line, sizeof(line), stdin);
    close( fds[READ] ); //it is a good idea to close the end of the pipe your are not using.
    write(fds[WRITE], line, sizeof(line));
  }
  else {
    pid_t w = wait(&status);
    if (w==-1) err();
    close( fds[WRITE] );
    printf("pid %d: received: ", getpid());
    read( fds[READ], line, sizeof(line) );
    printf("%s\n", line);
  }
}