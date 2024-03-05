{pkgs, ...}: {
  # add home-manager user settings here
  # tmux, git, wezterm, fzf
  home.packages = with pkgs; [git neovim];
  home.stateVersion = "23.11";

  programs.tmux = {
    enable = true;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
  };


}
