fn gtk(ctx: &mut YumaCtx) {
    ctx.pointer_cursor = CursorConfig {
        gtk: CursorGtkConfig {
            enable: true,
            ..default()
        },
        name: "Catppuccin-Mocha-Dark-Cursors",
        package: yuma::pkgs()["catppuccin-cursors"]["mochaDark"],
        size: 36,
        ..default(),
    };

    ctx.gtk = GtkConfig {
        enable: true,
        theme: GtkTheme {
            name: "Catppuccin-Mocha-Compact-Mauve-Dark",
            package: yuma::pkgs()["catppuccin-gtk"]
                .set("accents", ["mauve"])
                .set("size", "compact")
                .set("variant", "mocha"),
            iconTheme: GtkIconTheme {
                name: "Papirus-Dark",
                package: yuma::pkgs()["papirus-icon-theme"],
                ..
            },
            font: GtkFont {
                name: "Hack Nerd Font Medium",
                ..
            },
            ..default()
        },
        ..default()
    };
}
