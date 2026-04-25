{ config, pkgs, ... }:

{
	home = {
		username = "beimao";
		homeDirectory = "/home/beimao";
		stateVersion = "25.11";
		sessionVariables = {
    			GTK_THEME = "Orchis-Red-Dark";
  		};
		pointerCursor = {
    			name = "Bibata-Modern-Ice";
    			package = pkgs.bibata-cursors;
    			size = 24;
    			gtk.enable = true;
    			x11.enable = true;
 	 	};
	};

	gtk = {
   		enable = true;
    		theme = {
      			name = "Orchis-Dark";
            		package = pkgs.orchis-theme;	
    		};
		gtk4.theme = config.gtk.theme;
    		iconTheme = {
      			name = "Papirus-Dark";
      			package = pkgs.papirus-icon-theme;
    		};	
  	};

	dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
      gtk-theme = "Orchis-Dark";
    };
  };

	programs.zsh = {
  	enable = true;
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    
    settings = {
      # Adds a blank line between commands for readability
      add_newline = true;
      
      # The layout of the prompt
      format = "$directory$git_branch$git_status$character";
      
      # Put the time it took a command to run on the far right
      right_format = "$cmd_duration";

      # The actual input arrow (Blue on success, Red on typo/error)
      character = {
        success_symbol = "[❯](#5294e2)";
        error_symbol = "[❯](#ff3131)";
      };

      # Directory module (Deep Sky Blue)
      directory = {
        style = "bold #5294e2";
        read_only = " 󰌾";
        truncation_length = 3;
        truncate_to_repo = true;
      };

      # Git branch module (Subtle Gray)
      git_branch = {
        symbol = " ";
        style = "#a0a0a0";
        format = "[$symbol$branch]($style) ";
      };

      # Git status (Shows changes, unstaged, etc.)
      git_status = {
        style = "#a0a0a0";
        format = "([$all_status$ahead_behind]($style) )";
      };

      # Command duration (Only shows if a command takes longer than 500ms)
      cmd_duration = {
        min_time = 500;
        format = "[$duration](dimmed white)";
      };
    };
  };

  xdg.configFile = {
    "fastfetch".source = ./dotfiles/fastfetch;
    "ranger".source = ./dotfiles/ranger;
    "kitty".source = ./dotfiles/kitty;
    "nvim".source = ./dotfiles/nvim;
  };
}
