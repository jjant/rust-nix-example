use rand::Rng;

fn main() {
    println!("Hello, world!");
    println!(
        "Here's a random number: {}",
        rand::thread_rng().gen_range(1..100)
    );
}
