use yuma::prelude::*;

pub fn install(ctx: &mut YumaCtx) {
    ctx.add([
        "firefox",
        #[cfg(target_os = "linux")]
        "firefox-pwa",
    ]);

    #[cfg(target_os = "linux")]
    ctx.schedule("firefox userjs", self::userjs);
}

#[cfg(target_os = "linux")]
fn userjs() -> Result<()> {
    let userjs = include_str!("./user.js");

    let home = std::env::var("HOME").unwrap();
    let firefox_path = format!("{}/.mozilla/firefox/", home);

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
