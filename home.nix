{ config, pkgs, ... }:

{
  home = {
    username = "beimao";
    homeDirectory = "/home/beimao";
    stateVersion = "25.11"; 
    sessionVariables = {
      GTK_THEME = "Orchis-Dark";
      XCURSOR_THEME = "Bibata-Modern-Ice";
      XCURSOR_SIZE = "24";
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
      cursor-theme = "Bibata-Modern-Ice";
      icon-theme = "Papirus-Dark";
    };
  };

  programs.noctalia = { 
    enable = true; 
    systemd.enable = true;
  };

  programs.swaylock = {
    enable = true;
    # Use the fork that supports background blurring
    package = pkgs.swaylock-effects;
    
    settings = {
      # --- Visual Effects ---
      # Takes a screenshot of your current Niri desktop and blurs it
      screenshots = true;
      effect-blur = "7x5";
      fade-in = 0.2;

      # --- Ring Layout ---
      indicator-radius = 120;
      indicator-thickness = 10;
      
      # --- Theme & Colors ---
      # The ring uses Hex colors without the '#' symbol. 
      # cba6f7 matches the Noctalia/Catppuccin purple accent we set earlier.
      
      # Transparent insides for a clean glass look
      inside-color = "00000000";
      inside-clear-color = "00000000";
      inside-ver-color = "00000000";
      inside-wrong-color = "00000000";
      
      # Ring slice outlines (set to transparent to remove the ugly pie-chart lines)
      line-color = "00000000";
      line-clear-color = "00000000";
      line-ver-color = "00000000";
      line-wrong-color = "00000000";
      
      # Ring colors for different states
      ring-color = "cba6f7";           # Idle color
      ring-clear-color = "f5e0dc";     # Color when clearing password (Backspace)
      ring-ver-color = "89b4fa";       # Color while verifying password (Blue)
      ring-wrong-color = "f38ba8";     # Color on wrong password (Red)
      
      # Highlight color when a key is pressed (Green)
      key-hl-color = "a6e3a1";
      
      # Text settings
      text-color = "ffffff";
      text-clear-color = "ffffff";
      text-ver-color = "ffffff";
      text-wrong-color = "ffffff";
      
      # Display failed attempts
      show-failed-attempts = true;
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
    "kitty".source = ./dotfiles/alacritty;
    "nvim".source = ./dotfiles/nvim;
  };
}
