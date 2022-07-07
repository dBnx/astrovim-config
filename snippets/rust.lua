return {
  parse(
    "clippy",
    [===[
#![deny(unsafe_code)]
#![deny(clippy::clone_on_ref_ptr)]
#![deny(rust_2018_idioms)]
#![warn(clippy::pedantic)]
#![warn(clippy::all, rust_2021_compatibility)]
  ]===]
  ),
  parse("cfg", "#![cfg_attr(test, deny(rust_2018_idioms))]"),
  parse(
    "maintokio",
    [===[
use anyhow::Result;

#[tokio::main]
async fn main() -> Result<()> {
    console_subscriber::init();
    let res = tokio::select!(
        r0 = tokio::signal::ctrl_c() => {
            println!("");
            r0.map_err(std::convert::Into::into)
        },
        r1 = run() => {r1}
    );
    res
}

async fn run() -> Result<()> {
    loop {
        println!("Test");
        tokio::time::sleep(std::time::Duration::from_millis(1000)).await;
    }
}
  ]===]
  ),
  --parse("ctrig", "also loaded!!")
},
  {}
