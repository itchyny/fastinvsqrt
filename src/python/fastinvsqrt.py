import struct
import sys


def fastInvSqrt(x):
    i = struct.unpack('>i', struct.pack('>f', x))[0]
    i = 0x5f3759df - (i >> 1)
    y = struct.unpack('>f', struct.pack('>i', i))[0]
    return y * (1.5 - 0.5 * x * y * y)


if __name__ == '__main__':
    for line in iter(sys.stdin.readline, ""):
        print(fastInvSqrt(float(line)))
