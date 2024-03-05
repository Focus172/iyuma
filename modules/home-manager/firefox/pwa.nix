# <https://aur.archlinux.org/cgit/aur.git/tree/PKGBUILD?h=firefox-pwa>
{
  stdenv,
  rustPlatform,
  fetchFromGitHub,
  openssl,
  pkg-config,
  # maintainers,
}: let
  version = "2.1.2";
  source = fetchFromGitHub {
    owner = "filips123";
    repo = "PWAsForFirefox";
    rev = "v${version}";
    sha256 = "sha256-zJSrZOLHyvvu+HoHrPkDDISuY9GqpKtwGn/7jKzg5pI=";
  };
in
  rustPlatform.buildRustPackage {
    cargoLock = {
      lockFile = "${source}/native/Cargo.lock";
      outputHashes = {
        "data-url-0.1.0" = "sha256-rESQz5jjNpVfIuTaRCAV2TLeUs09lOaLZVACsb/3Adg=";
        "mime-0.4.0-a.0" = "sha256-LjM7LH6rL3moCKxVsA+RUL9lfnvY31IrqHa9pDIAZNE=";
        "web_app_manifest-0.0.0" = "sha256-4tPeJkxphp7Bxn4GKOMZrGQyF6xIIGCNKJ4VGFbHGFk=";
      };
    };

    pname = "firefox-pwa";
    inherit version;

    src = "${source}/native";
    cargoSha256 = "sha256-zLl7WvGzN/ltc7hT5cAsp3ByrlThQmRXrGM5rKbntdY=";

    doCheck = false;

    nativeBuildInputs = [pkg-config];
    buildInputs = [openssl.dev openssl];

    preConfigure = ''
      # replace the version number in the manifest
      sed -i 's;version = "0.0.0";version = "${version}";' Cargo.toml
      # replace the version in the lockfile, otherwise Nix complains
      sed -zi 's;name = "firefoxpwa"\nversion = "0.0.0";name = "firefoxpwa"\nversion = "2.1.2";' Cargo.lock
      # replace the version number in the profile template files
      sed -i $'s;DISTRIBUTION_VERSION = \'0.0.0\';DISTRIBUTION_VERSION = \'${version}\';' userchrome/profile/chrome/pwa/chrome.jsm

    '';

    installPhase = let
      target = "target/${stdenv.targetPlatform.config}/release";
    in ''
      # Executables
      install -Dm755 ${target}/firefoxpwa $out/bin/firefoxpwa
      install -Dm755 ${target}/firefoxpwa-connector $out/lib/firefoxpwa/firefoxpwa-connector

      # Manifest
      # Replace the path to the one we install the connector to
      sed -i "s;/usr/libexec/firefoxpwa-connector;$out/lib/firefoxpwa/firefoxpwa-connector;" manifests/linux.json
      install -Dm644 manifests/linux.json $out/lib/mozilla/native-messaging-hosts/firefoxpwa.json

      # Completions
      install -Dm755 ${target}/completions/firefoxpwa.bash $out/share/bash-completion/completions/firefoxpwa
      install -Dm755 ${target}/completions/firefoxpwa.fish $out/share/fish/vendor_completions.d/firefoxpwa.fish
      install -Dm755 ${target}/completions/_firefoxpwa $out/share/zsh/vendor-completions/_firefoxpwa

      # Documentation
      install -Dm644 ${source}/README.md $out/share/doc/firefoxpwa/README.md
      install -Dm644 README.md $out/share/doc/firefoxpwa/README-NATIVE.md
      install -Dm644 ${source}/extension/README.md $out/share/doc/firefoxpwa/README-EXTENSION.md
      install -Dm644 packages/deb/copyright $out/share/doc/firefoxpwa/copyright

      # UserChrome
      mkdir -p $out/share/firefoxpwa/userchrome/
      cp -r userchrome/* $out/share/firefoxpwa/userchrome/
    '';
  }
