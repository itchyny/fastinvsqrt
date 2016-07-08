use std::io::BufRead;

fn fast_inv_sqrt(x: f32) -> f32 {
    let mut i = unsafe { *std::mem::transmute::<&f32, &i32>(&x) };
    i = 0x5f3759df - (i >> 1);
    let y = unsafe { *std::mem::transmute::<&i32, &f32>(&i) };
    return y * (1.5 - 0.5 * x * y * y);
}

fn main() {
    let stdin = std::io::stdin();
    for line in stdin.lock().lines().filter_map(|x| x.ok()) {
        match line.parse::<f32>() {
            Ok(x) => println!("{}", fast_inv_sqrt(x)),
            Err(_) => {},
        }
    }
}
