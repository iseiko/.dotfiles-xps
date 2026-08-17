{ config, pkgs, ... }:

{
	programs.zsh = {
		enable = true;
		autocd = true;
		enableCompletion = true;
		completionInit = ''
		zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'
		autoload -Uz compinit && compinit
		'';
		autosuggestion.enable = true;
		syntaxHighlighting.enable = true;
		shellAliases = {
			ls = "eza --icons --group-directories-last --all";
			tree = "eza --icons --group-directories-last --tree";
			cdtemp = "cd `mktemp -d`";
      softr = "sudo systemctl soft-reboot";
		};

		history = {
			expireDuplicatesFirst = true;
			ignoreDups = true;
			ignoreSpace= true;
			extended = true;
			path = "${config.xdg.dataHome}/zsh/history";
			share = false;
			size = 100000;
			save = 100000;
		};
	};
		programs.zoxide.enableZshIntegration = true;
		programs.fzf.enableZshIntegration = true;
}
