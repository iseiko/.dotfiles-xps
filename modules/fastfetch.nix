{
  programs.fastfetch = {
    enable = true;
    settings = {
      logo = {
        type = "auto";
        source = "nixos";
      };
      display = {
        separator = " : ";
        color = {
          keys = "cyan";
          title = "green";
        };
      };
      modules = [
        "title"
        "separator"
        "os"
        "host"
        "kernel"
        "uptime"
        "packages"
        "shell"
        "display"
        "de"
        "wm"
        "terminal"
        "cpu"
        "gpu"
        "memory"
        "swap"
        "disk"
        "battery"
        "break"
        "colors"
      ];
    };
  };
}

