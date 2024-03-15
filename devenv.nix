{ pkgs, ... }: {
  # https://devenv.sh/reference/options/
  packages = [ pkgs.figlet pkgs.lolcat ];

  enterShell = ''
    figlet -f small -k "Nix shellified!" | lolcat -F 0.5 -ad 1 -s 30
  '';

  #processes.run.exec = "hello";
}
