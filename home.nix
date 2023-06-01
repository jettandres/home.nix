{ config, pkgs, ... }:

let
  pkgsUnstable = import <unstable> {};
in

{
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "jettandres";
  home.homeDirectory = "/home/jett";

  # Enable for non-NixOS Linux
  # targets.genericLinux.enable = true;

  # Packages that should be installed to the user profile
  home.packages = [
     pkgs.neovim
     pkgs.curl
     pkgs.xclip
  ];

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "22.11";

  # Let Home Manager install and manage itself.
  programs.home-manager = {
    enable = true;
  };

  programs.git = {
    enable = true;
    userName = "jettandres";
    userEmail = "jettrobin.andres@gmail.com";
    extraConfig = {
      init = {
        defaultBranch = "main";
      };
    };
  };

  programs.gh = {
    enable = true;
    package = pkgsUnstable.gh;
    settings = {
      editor = "nvim";
      protocol = "ssh";
    };
  };
}
