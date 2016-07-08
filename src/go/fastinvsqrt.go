package main

import (
	"bufio"
	"fmt"
	"os"
	"strconv"
	"unsafe"
)

func fastInvSqrt(x float32) float32 {
	i := *(*int32)(unsafe.Pointer(&x))
	i = 0x5f3759df - i>>1
	y := *(*float32)(unsafe.Pointer(&i))
	return y * (1.5 - 0.5*x*y*y)
}

func main() {
	scanner := bufio.NewScanner(os.Stdin)
	for scanner.Scan() {
		if x, err := strconv.ParseFloat(scanner.Text(), 32); err == nil {
			fmt.Println(fastInvSqrt(float32(x)))
		}
	}
}
