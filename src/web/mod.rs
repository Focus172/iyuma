use std::fs;
use yuma::prelude::*;

use yuma::YumaCtx;

pub fn install(ctx: &mut YumaCtx) -> anyhow::Result<()> {
    ctx.add(["firefox", "firefox-pwa"]);
    ctx.schedule(self::userjs);
    Ok(())
}

#[allow(unused)]
// fn userjs(ctx: &mut YumaCtx) -> YumaResult {
fn userjs() -> YumaResult {
    let userjs = include_str!("./user.js");

    let home = std::env::var("HOME").unwrap();
    let firefox_path = format!("{}/.mozilla/firefox/", home);

    dbg!(&firefox_path);

    for path in fs::read_dir(firefox_path)?
        .flatten()
        .filter(|d| d.file_type().is_ok_and(|f| f.is_dir()))
        .map(|d| d.path())
        .filter(|p| p.extension().is_some_and(|e| e == "profile"))
    {
        let userjs_path = path.join("user.js");

        println!(
            "Would have writen userjs to path: {}",
            userjs_path.display()
        );
        // fs::write(userjs_path, userjs)?;
    }
    Ok(())
}

