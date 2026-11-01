use std::{env, fs::File, io::Read};
fn main() -> Result<(), Box<dyn std::error::Error>> {
    let arg = env::args()
        .nth(1)
        .ok_or("Usage: lexicon-inspect REQUEST.json | --examples")?;
    if arg == "--examples" {
        println!("{}", lexicon_inspector::examples());
        return Ok(());
    }
    let mut text = String::new();
    File::open(arg)?
        .take((lexicon_inspector::MAX_REQUEST + 1) as u64)
        .read_to_string(&mut text)?;
    println!("{}", lexicon_inspector::inspect(&text));
    Ok(())
}
