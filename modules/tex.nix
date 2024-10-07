{ config, pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-tetex
        tcolorbox
        pdfcol
        listingsutf8;
    })
  ];
}
