{ config, pkgs, ... }: {
  imports = [
    ./fonts.nix
    ./hyprland.nix
    ./wayland.nix
    ./wofi.nix
    ./hypridle.nix
    ./hyprlock.nix
    ./hyprpaper.nix
    ./mochacss.nix
  ];

  programs.firefox.enable = true;

  home.packages = with pkgs; [
    vscode
    jetbrains.idea-ultimate
    neovide
    vesktop # Discord
    kdePackages.okular # PDF viewer
    filezilla
    heroic # Epic Games Launcher ish

    brightnessctl # For managing screen brightness from the command line

    unrar
    unzip
    xdg-utils
    zip
    celluloid # Video player

    # kdePackages.dolphin
    kdePackages.qtwayland
    kdePackages.qtsvg

    xdg-desktop-portal
    xdg-desktop-portal-gtk
    xdg-desktop-portal-hyprland

  ];

  home.sessionVariables = {
    WEBKIT_DISABLE_COMPOSITING_MODE = "1";
    NIXOS_OZONE_WL = "1";
    TERMINAL = "kitty";
    QT_QPA_PLATFORM = "wayland";
    EDITOR = "neovide";
    BROWSER = "firefox";
    GTK_THEME = config.gtk.theme.name;
    GTK_USE_PORTAL = "1";
    XDG_CURRENT_DEKSTOP = "Hyprland";
    XDG_SESSION_DEKSTOP = "Hyprland";
    GDK_BACKEND = "wayland";
  };

  fonts.fontconfig.enable = true;

  programs.kitty = {
    enable = true;
    shellIntegration = {
      enableZshIntegration = true;
    };
    font = { name = "Fira Code"; };
    themeFile = "spaceduck";
    settings = {
      copy_on_select = "yes";
      enable_audio_bell = false;
    };
  };
}
