func fastInvSqrt(x: Float) -> Float {
    var i: Int = Int(bitPattern: UInt(x.bitPattern))
    i = 0x5f3759df - (i >> 1)
    let y: Float = Float(bitPattern: UInt32(i))
    return y * (1.5 - 0.5 * x * y * y)
}

while let line = readLine() {
    if let x = Float(line) {
        print(fastInvSqrt(x: x))
    }
}
