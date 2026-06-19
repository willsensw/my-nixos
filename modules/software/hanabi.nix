{ pkgs, stdenv, fetchFromGitHub }:

stdenv.mkDerivation rec {
  pname = "gnome-ext-hanabi";
  version = "gnome-50";

  src = fetchFromGitHub {
    owner = "jeffshee";
    repo = "gnome-ext-hanabi";
    rev = "typescript"; # The dedicated GNOME 50 branch
    hash = "sha256-GPkmnmwCahP9tm3MeMhE06efel1RmQBM3Sf2ay0hhMI=";
  };

  npmDepsHash = "sha256-AAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAA=";

  nativeBuildInputs = with pkgs; [ 
    meson 
    ninja 
    glib  
  ];

  buildInputs = with pkgs; [ 
    gtk4 
    libadwaita 
  ];

  postInstall = ''
    # NixOS requirement: extensions must contain their own schemas
    mkdir -p "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io"
    mv "$out/share/glib-2.0/schemas" "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/schemas"
    glib-compile-schemas "$out/share/gnome-shell/extensions/hanabi-extension@jeffshee.github.io/schemas"
  '';
}
