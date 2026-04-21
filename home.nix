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
  		profileExtra = ''
    			# Autostart Hyprland via UWSM on TTY1 (Verified from your session!)
    			if [ -z "$WAYLAND_DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
      				exec uwsm start hyprland-uwsm.desktop
    			fi
  		'';
	};

  	services.hypridle = {
    		enable = true;
    		settings = {
      			general = {
        			lock_cmd = "pidof hyprlock || hyprlock";
        			before_sleep_cmd = "loginctl lock-session";
        			after_sleep_cmd = "niri msg action power-on-monitors"; 
      			};
      			listener = [
        			{
          				timeout = 600; # 5 minutes in seconds
          				on-timeout = "loginctl lock-session";
        			}
      			];
    		};
  	};

  programs.hyprlock = {
    enable = true;
    
    settings = {
      general = {
        no_fade_in = false;
        grace = 0;
        disable_loading = true;
      };

      background = [
        {
          monitor = "";
          # FORCE STRING: Use quotes!
          path = "/home/beimao/Pictures/wallpaper/1.jpg";
          
          # THE AESTHETIC BLUR
          blur_passes = 3;        # High quality blur
          blur_size = 7;          # Large radius
          noise = 0.0117;
          contrast = 0.8916;
          brightness = 0.8172;
          vignette = 0.1;
          vignette_intensity = 0.5;
        }
      ];

      input-field = [
        {
          monitor = "";
          size = "200, 50";
          outline_thickness = 2;
          dots_size = 0.33;
          dots_spacing = 0.15;
          dots_center = true;
          
          # Deep Sky Blue Outline & Dark Background
          outer_color = "rgb(82, 148, 226)";
          inner_color = "rgba(15, 15, 15, 0.8)";
          font_color = "rgb(255, 255, 255)";
          
          fade_on_empty = false;
          placeholder_text = ""; # Clean - no text hint
          hide_input = false;
          
          position = "0, -120";   # Lower down
          halign = "center";
          valign = "center";
          
          check_color = "rgb(82, 148, 226)";
          fail_color = "rgb(255, 100, 100)";
        }
      ];

      label = [
        # TIME (Giant & Minimal)
        {
          monitor = "";
          text = "$TIME";
          color = "rgba(255, 255, 255, 1.0)";
          font_size = 120;        # Massive text
          font_family = "JetBrainsMono Nerd Font Bold";
          position = "0, 80";
          halign = "center";
          valign = "center";
          
          # Subtle Glow
          shadow_passes = 2;
          shadow_size = 4;
          shadow_color = "rgba(82, 148, 226, 0.5)";
        }
        # DATE (Small & Clean below time)
        {
          monitor = "";
          text = "cmd[update:1000] echo \"$(date +\"%A, %d %B\")\"";
          color = "rgba(200, 200, 200, 1.0)";
          font_size = 18;
          font_family = "JetBrainsMono Nerd Font";
          position = "0, -20";
          halign = "center";
          valign = "center";
        }
      ];
    };
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
}
