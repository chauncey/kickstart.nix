{
  homeDirectory,
  username,
}: {pkgs, config, ...}: {
  # add home-manager user settings here
  home.homeDirectory = homeDirectory;
  home.username = username;
  home.packages = with pkgs; [git];
  home.stateVersion = "23.11";

  programs.direnv = {
    enable = true;
    enableZshIntegration = true;
    nix-direnv.enable = true;
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

  xdg.configFile = {
    ghostty = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/ghostty;
      recursive = true;
    };
  };

  xdg.configFile = {
    nvim = {
      source = config.lib.file.mkOutOfStoreSymlink ../config/nvim;
      recursive = true;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    extraConfig = ''
      require('user')
    '';
    extraPackages = [
      pkgs.cmake
      pkgs.cargo
    ];
    withPython3 = true;
  };

  programs.zoxide = {
    enable = true;
    enableZshIntegration = true;
  };

  programs.git = {
    enable = true;
    userName = "chauncey";
    userEmail = "cchauncey@gmail.com";
    aliases = {
      st = "status -sb";
      co = "checkout";
      cob = "checkout -b";
      cot = "checkout --track";
      can = "commit --amend --no-edit";
      unadd = "reset HEAD";
      br = "branch";
      ci = "commit";
    };
    lfs = {
      enable = true;
    };
    extraConfig = {
      core = {
        editor = "nvim";
        excludesfile = "~/.gitignore";
        autocrlf = "input";
      };
      color = {
        diff = "auto";
        status = "auto";
        branch = "auto";
        interative = "auto";
        ui = true;
        pager = true;
      };
      pull = {
        rebase = true;
      };
      push = {
        default = "current";
      };
    };
  };

}
