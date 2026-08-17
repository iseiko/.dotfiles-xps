{ config, pkgs, ... }:

{
 	programs.hyprlock = {
		enable = true;
		settings = {
			general = {
				hide_cursor = true;
				ignore_empty_input = true;
				disable_loading_bar = true;
			};

			animations.enable = false;

			background = [
			{
				path = "screenshot";
				blur_passes = 3;
				blur_size = 8;
			}
			];

			# --- INPUT FIELD --- #

			input-field = [
			{	
				rounding = "6";
				size = "390, 80";
				outline_thickness = "3";
				dots_size = "0.25";
				dots_spacing = "0.8";
				dots_center = true;
				outer_color = "rgb(251,241,199)";
				inner_color = "rgb(60,56,54)";
				font_color = "rgb(251,241,199)";
				fade_on_empty = true;
				placeholder_text = "";
				hide_input = false;
				position = "0, 100";
				halign = "center";
				valign = "bottom";
				fail_color = "rgb(204, 34, 34)";
				shadow_passes = "2";
				shadow_size = "8";
				shadow_color = "rgb(60, 56, 54)";
			}
			];
			
			label = [
			{
			# --- LABELS (date/clock) CONFIG --- #

				text = "cmd[update:1000] echo \"$(date +\"%A, %B %d\")\"";
				color = "rgb(251, 241, 199)";
				font_size = "55";
				font_family = "Fira Code Nerd Font Bold";
				position = "0, 450";
				halign = "center";
				valign = "center";
				shadow_passes = "2";
				shadow_size = "8";
				shadow_color = "rgb(60, 56, 54)";
			}
			{
				text = "cmd[update:1000] echo \"$(date +\"%k:%M\")\"";
				color = "rgb(251, 241, 199)";
				font_size = "250";
				font_family = "Fira Code Nerd Font Bold";
				position = "0, 250";
				halign = "center";
				valign = "center";		
				shadow_passes = "2";
				shadow_size = "8";
				shadow_color = "rgb(60, 56, 54)";
			}

			# --- USERNAME CONFIG --- #

			{
				text = "$USER";
				color = "rgb(251, 241, 199)";
				font_size = "30";
				font_family = "Fira Code Nerd Font Bold";
				position = "0, 230";
				halign = "center";
				valign = "bottom";
				shadow_passes = "2";
				shadow_size = "8";
				shadow_color = "rgb(60, 56, 54)";
			}
			];

			# --- PROFILE PICTURE CONFIG --- #

			image = [
			{
				path = "~/Pictures/pfp/spike_02.jpg";
				border_color = "rgb(251, 241, 199)";
				border_size = "0";
				size = "200";
				rounding = "-1";
				rotate = "0";
				reload_time = "-1";
				position = "0, 300";
				halign = "center";
				valign = "bottom";
				shadow_passes = "2";
				shadow_size = "8";
				shadow_color = "rgb(60, 56, 54)";
			}
			];
		};
	};
}
