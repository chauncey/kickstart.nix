{pkgs, ...}: {
  # add home-manager user settings here
  # tmux, git, wezterm, fzf
  home.packages = with pkgs; [git neovim];
  home.stateVersion = "23.11";

  programs.tmux = {
    enable = true;
    extraConfig = builtins.readFile ../config/tmux/.tmux.conf;
  };

  programs.fzf = {
    enable = true;
    enableZshIntegration = true;
    colors = {
      bg = "#24273a";
      "bg+" = "#363a4f";
      spinner = "#f4dbd6";
      hl = "#ed8796";
      fg = "#cad3f5";
      header = "#ed8796";
      info = "#c6a0f6";
      pointer = "#f4dbd6";
      marker = "#f4dbd6";
      "fg+" = "#cad3f5";
      prompt = "#c6a0f6";
      "hl+" = "#ed8796";
    };
    defaultOptions = [
      "--bind ctrl-u:preview-half-page-up,ctrl-d:preview-half-page-down"
      "--preview 'cat {}'"
    ];
  };

  programs.starship = {
    enable = true;
    enableZshIntegration = true;
    settings = {
      aws = {
        disabled = true;
      };
      buf = {
        disabled = true;
      };
      character = {
        success_symbol = "[>](bold green)";
        error_symbol = "[>](bold red)";
      };
      directory = {
        truncate_to_repo = false;
      };
      dotnet = {
        detect_files = [
          "global.json"
          "Directory.Build.props"
          "Directory.Build.targets"
          "Packages.props"
        ];
      };
      git_branch = {
        symbol = " ";
        truncation_length = 18;
      };
      golang = {
        symbol = " ";
      };
      lua = {
        symbol = " ";
      };
      nix_shell = {
        symbol = " ";
      };
      package = {
        disabled = true;
      };
    };
  };
  programs.less = {
    enable = true;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    history = {
      extended = true;
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "z"];
    };
    shellAliases = {
      "dwc" = ''darwin-rebuild check --flake ".#aarch64"'';
      "dws" = ''darwin-rebuild check --flake ".#aarch64"'';
      "vi" = "nvim";
      "z" = "zoxide";
    };
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

}
