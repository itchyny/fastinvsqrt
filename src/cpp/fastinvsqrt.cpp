#include <iostream>
#include <string>

float fastInvSqrt(float x) {
  int i = *reinterpret_cast<int*>(&x);
  i = 0x5f3759df - (i >> 1);
  float y = *reinterpret_cast<float*>(&i);
  return y * (1.5F - 0.5F * x * y * y);
}

int main() {
  std::string line;
  while (std::getline(std::cin, line)) {
    try {
      std::cout << fastInvSqrt(std::stof(line, NULL)) << std::endl;
    } catch (...) {}
  }
  return 0;
}
