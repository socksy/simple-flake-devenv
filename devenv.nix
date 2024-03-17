{ pkgs, ... }: {
  # https://devenv.sh/reference/options/
  packages = [ pkgs.figlet pkgs.lolcat ];

  enterShell = ''
    figlet -f small -k "Nix shellified!" | lolcat -F 0.5 -ad 1 -s 30
  '';

  # Run an arbitrary program on start
  #processes.run.exec = "hello";

  # Enable programming languages and tooling
  #languages.python.enable = true;
  #languages.python.poetry.enable = true;
  #languages.python.poetry.activate.enable = true;
  #languages.python.poetry.install.enable = true;

  services.postgres = {
    enable = true;
    initialDatabases = [{ name = "foos"; }];
    listen_addresses = "127.0.0.1";
    port = 5432;
    initialScript = ''
      CREATE USER foo WITH SUPERUSER PASSWORD 'bar';
      '';
  };
  env.PGPASSWORD = "bar";
}
