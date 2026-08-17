{ config, pkgs, ... }:

{
	imports = 
	  [
	     ./modules/lockscreen.nix
	     ./modules/zsh.nix
	     ./modules/omp.nix
	     ./modules/nvim/init.nix
       ./modules/fastfetch.nix
       ./modules/gnome.nix
	  ];

	home.username = "iseiko";
	home.homeDirectory = "/home/iseiko";
	home.stateVersion = "26.11";
	home.enableNixpkgsReleaseCheck = false;
  
  programs.git = {
    enable = true;
    userName = "iseiko";
    userEmail = "spam.kvncs@gmail.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };
}
