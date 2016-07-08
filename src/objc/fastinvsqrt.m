#import <Foundation/Foundation.h>

float fastInvSqrt(float x) {
  int i = *(int*)&x;
  i = 0x5f3759df - (i >> 1);
  float y = *(float*)&i;
  return y * (1.5F - 0.5F * x * y * y);
}

int main(void) {
  char *line = NULL, *endptr = NULL;
  size_t size;
  float x;
  while (getline(&line, &size, stdin) != -1) {
    x = strtof(line, &endptr);
    if (*endptr == '\n') {
      printf("%f\n", fastInvSqrt(x));
    }
  }
  return 0;
}
