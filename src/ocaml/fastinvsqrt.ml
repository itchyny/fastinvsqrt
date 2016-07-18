let fast_inv_sqrt x =
  let i = Int32.bits_of_float x in
  let j = Int32.sub (Int32.of_int 0x5f3759df) (Int32.shift_right i 1) in
  let y = Int32.float_of_bits j in
  y *. (1.5 -. 0.5 *. x *. y *. y)

let () =
  try
    while true do
      let line = input_line stdin in
      try
        let x = float_of_string line in
        Printf.printf "%f\n%!" (fast_inv_sqrt x)
      with
        Failure _ -> ()
    done;
  with
    End_of_file -> ()
