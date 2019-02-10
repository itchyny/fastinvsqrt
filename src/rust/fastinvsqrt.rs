use std::io::BufRead;

fn fast_inv_sqrt(x: f32) -> f32 {
    let i = x.to_bits();
    let j = 0x5f3759df - (i >> 1);
    let y = f32::from_bits(j);
    y * (1.5 - 0.5 * x * y * y)
}

fn main() {
    let stdin = std::io::stdin();
    for line in stdin.lock().lines().filter_map(|x| x.ok()) {
        if let Ok(x) = line.parse() {
            println!("{}", fast_inv_sqrt(x));
        }
    }
}
