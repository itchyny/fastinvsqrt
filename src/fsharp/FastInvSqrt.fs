let fastinvsqrt(x: float32): float32 =
    let i = System.BitConverter.ToInt32(System.BitConverter.GetBytes(x), 0)
    let j = 0x5f3759df - (i >>> 1)
    let y = System.BitConverter.ToSingle(System.BitConverter.GetBytes(j), 0)
    y * (1.5F - 0.5F * x * y * y)

seq { while true do yield stdin.ReadLine () }
    |> Seq.takeWhile ((<>) null)
    |> Seq.iter (fun x -> try float32 x |> fastinvsqrt |> printfn "%f"
                          with :? System.FormatException -> ())
