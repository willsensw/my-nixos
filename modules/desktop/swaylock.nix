{ config, pkgs, ... }:

{
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
}
