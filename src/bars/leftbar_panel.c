#include <ctype.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

int main() {
  char *line = NULL, *part;
  size_t len;

  while (getline(&line, &len, stdin) >= 0) {
    int i = 0;

    while ((part = strsep(&line, ":"))) {
      ++i;
      if (strlen(part) > 2 || !isalpha((unsigned char)part[0]) ||
          !isdigit((unsigned char)part[1]))
        continue; // this is not a workspace info. ignore it

      // this is the focused workspace
      if (isupper((unsigned char)part[0])) {
        printf("%{c}%c\n", part[1]);
        fflush(stdout);
        break;
      }
    }
  }

  free(line);
}
