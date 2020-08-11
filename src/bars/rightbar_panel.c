#include <stdio.h>
#include <string.h>
#include <time.h>
#include <unistd.h>

#define FORMAT "%d/%m at %H:%M"
/* #define FORMAT "%H:%M" */
char fmt[sizeof(FORMAT)], prev[sizeof(FORMAT)];

int main() {
  for (;;) {
    time_t now;

    now = time(0);
    strftime(fmt, sizeof(FORMAT), FORMAT, localtime(&now));

    if(strcmp(fmt, prev) != 0) {
      strcpy(prev, fmt);
      printf("%%{c}%s\n", fmt);
      fflush(stdout);
    }

    sleep(1);
  }
}
