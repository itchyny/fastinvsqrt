func fastInvSqrt(x: Float) -> Float {
    var z: Float = x
    var i: Int = UnsafeMutablePointer<Int>(withUnsafeMutablePointer(to: &z, { $0 })).memory
    i = 0x5f3759df - (i >> 1)
    let y: Float = UnsafeMutablePointer<Float>(withUnsafeMutablePointer(to: &i, { $0 })).memory
    return y * (1.5 - 0.5 * x * y * y)
}

while let line = readLine() {
    if let x = Float(line) {
        print(fastInvSqrt(x: x))
    }
}
