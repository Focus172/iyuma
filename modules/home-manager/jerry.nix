# Adpated from:
# https://raw.githubusercontent.com/justchokingaround/jerry/main/full.nix
{
  coreutils,
  curl,
  fetchFromGitHub,
  ffmpeg,
  fzf,
  gnugrep,
  gnupatch,
  gnused,
  html-xml-utils,
  lib,
  makeWrapper,
  mpv,
  openssl,
  stdenv,
  testers,
  # ueberzugpp,
  # rofi,
  # jq,
}:
stdenv.mkDerivation (finalAttrs: {
  pname = "jerry";
  version = "1.9.9";

  src = fetchFromGitHub {
    owner = "justchokingaround";
    repo = "jerry";
    rev = "a5e3bdae8ec49fa3fb0aa71f8f71cc0695612518";
    sha256 = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";
  };

  nativeBuildInputs = [
    coreutils # wc
    curl
    ffmpeg
    fzf
    gnugrep
    gnupatch
    gnused
    html-xml-utils
    makeWrapper
    mpv
    openssl
    # ueberzugpp
    # rofi
    # jq
  ];

  installPhase = ''
    mkdir -p $out/bin
    cp jerry.sh $out/bin/jerry
    wrapProgram $out/bin/jerry \
      --prefix PATH : ${lib.makeBinPath [
      coreutils
      curl
      ffmpeg
      fzf
      gnugrep
      gnupatch
      gnused
      html-xml-utils
      mpv
      openssl
      # ueberzugpp
      # rofi
      # jq
    ]}
  '';

  passthru.tests.version = testers.testVersion {
    package = finalAttrs.finalPackage;
  };

  meta = with lib; {
    description = "watch anime with automatic anilist syncing and other cool stuff";
    homepage = "https://github.com/justchokingaround/jerry";
    license = licenses.gpl3;
    maintainers = with maintainers; [justchokingaround];
    platforms = platforms.unix;
  };
})
