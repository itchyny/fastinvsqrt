#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <sys/time.h>

int main(int argc, char const* argv[]) {

  if (argc <= 1) {
    printf("Specify a command.\n");
    return 1;
  }
  if (argc > 2) {
    printf("Too many arguments.\n");
    return 1;
  }

  struct timeval start, end;
  gettimeofday(&start, NULL);

  FILE *fp, *ptr;
  if ((fp = tmpfile()) == NULL){
    perror("tmpfile");
    return 1;
  }

  char buf[BUFSIZ];
  if ((ptr = popen(argv[1], "r")) == NULL) {
    perror("popen");
    return 1;
  }
  while (fgets(buf, BUFSIZ, ptr) != NULL) {
    fprintf(fp, "%s", buf);
  }
  pclose(ptr);

  gettimeofday(&end, NULL);
  long duration = (end.tv_sec - start.tv_sec) * 1000
    + (end.tv_usec - start.tv_usec) / 1000;

  float x = 0, result, expected, err, delta = 0.005;
  long ok = 0, fail = 0;
  rewind(fp);
  while (fscanf(fp, "%f", &result) == 1) {
    x += 1;
    expected = sqrt(1 / x);
    err = (result - expected) / expected;
    if (fabs(err) < delta) {
      ok += 1;
    } else {
      fail += 1;
    }
  }
  fclose(fp);

  if (ok + fail > 0) {
    printf("%ld %ld %ld %ld\n", duration, ok, fail, ok + fail);
  }

  if (fail > 0 || ok + fail == 0) {
    return 1;
  }

  return 0;
}
