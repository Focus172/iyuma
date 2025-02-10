{ config, pkgs, ... }: {
  environment.systemPackages = [
    (pkgs.texlive.combine {
      inherit (pkgs.texlive)
        scheme-tetex
        tcolorbox
        pdfcol
        listingsutf8

        # Emacs
        scheme-basic
        dvisvgm dvipng
        wrapfig amsmath ulem hyperref capt-of
      ;
    })
  ];
}
