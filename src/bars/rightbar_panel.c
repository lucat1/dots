#include <stdio.h>
#include <time.h>
#include <unistd.h>

/* #define FORMAT "%d/%m at %H:%M" */
#define FORMAT "%H:%M"

int main() {
  for (;;) {
    time_t now;
    char fmt[sizeof(FORMAT)]; // look at the format above

    now = time(0);
    strftime(fmt, sizeof(FORMAT), FORMAT, localtime(&now));

    printf("%{c}%s\n", fmt);
    fflush(stdout);
    sleep(1);
  }
}
