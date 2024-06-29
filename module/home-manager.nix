{ inputs }: {
  pkgs,
  config,
  ...
}: {
  # add home-manager user settings here
  home.packages = with pkgs; [
    git
    ripgrep
    wget
  ];
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
	#ssh_symbol = "⛺︎ ";
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
      hostname = {
        ssh_symbol = "⛺️ ";
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
    withNodeJs = true;
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
      wtf = "!$ZSH/bin/git-wtf";
      clean-merged = "!git branch -r --merged | xargs -n 1 git branch -d";
      show-files = "!git show --pretty='' --name-only";
    };
    lfs = {
      enable = true;
    };
    extraConfig = {
      core = {
        editor = "nvim";
        excludesfile = "./config/.gitignore";
        autocrlf = "input";
        init.defaultBranch = "main";
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

  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";
  };

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = builtins.readFile ../config/wezterm/wezterm.lua;
  };

  programs.zsh = {
    enable = true;
    enableAutosuggestions = true;
    enableCompletion = true;
    initExtra = ''
      ${builtins.readFile ../config/zsh/config.zsh}
      ${builtins.readFile ../config/zsh/aliases.zsh}
      ${builtins.readFile ../config/zsh/completion.zsh}
      ${builtins.readFile ../config/zsh/git.zsh}
      ${builtins.readFile ../config/zsh/window.zsh}
    '';
    shellAliases = {
      "c" = "clear";
      "vi" = "nvim";
      "dwc" = ''darwin-rebuild check --flake ".#aarch64"'';
      "dwb" = ''darwin-rebuild switch --flake ".#aarch64"'';
      "ks" = "tmux kill-server";
    };
    oh-my-zsh = {
      enable = true;
      plugins = ["git" "z"];
      theme = "robbyrussell";
    };
  };

}
