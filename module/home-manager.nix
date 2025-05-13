{
  homeDirectory,
  username,
}: {pkgs, config, ...}: {
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

  # xdg.configFile = {
  #   "ghostty/config".text = builtins.readFile  ../config/ghostty/config;
  # };
  xdg.configFile."ghostty/config".text = ''
    theme = catppuccin-macchiato

    font-family = Monofur Nerd Font Mono
    font-size = 14
    #font-family = Fairfax Hax HD
    #font-size = 8
    # font-family = Hasklug Nerd Font Med
    # font-size = 16


    clipboard-read = allow
    #copy-on-select = clipboard
    copy-on-select = true

    #background = #110f18
    background = #110f18
    background-opacity = 0.80
    unfocused-split-opacity = 0.92

    gtk-adwaita = false
    gtk-titlebar = false

    window-new-tab-position = end
    window-padding-color = background

    quit-after-last-window-closed = true

    keybind = f4=new_tab
    keybind = f3=next_tab
  '';

  # xdg.configFile = {
  #   nvim = {
  #     source = config.lib.file.mkOutOfStoreSymlink /home/cc/Code/kickstart.nix/config/nvim;
  #     recursive = true;
  #   };
  # };
  #
  # programs.neovim = {
  #   enable = true;
  #   defaultEditor = true;
  #   extraPackages = [
  #     pkgs.cmake
  #     pkgs.cargo
  #   ];
  #   withPython3 = true;
  # };
  #
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

  programs.wezterm = {
    enable = true;
    enableZshIntegration = true;
    extraConfig = ''
      local wezterm = require 'wezterm'
      local config = {}

      -- In newer versions of wezterm, use the config_builder which will
      -- help provide clearer error messages
      if wezterm.config_builder then
        config = wezterm.config_builder()
      end

      -- This is where you actually apply your config choices

      -- For example, changing the color scheme:
      config.color_scheme = 'Catppuccin Mocha'
      config.hide_tab_bar_if_only_one_tab = true
      config.font_size = 20.0

      config.font = wezterm.font_with_fallback {
        'Fairfax Hax HD',
        --'Monofur Nerd Font Mono',
        'Font Awesome 6 Free Regular',
        'Font Awesome 6 Free Solid',
        'Font Awesome 6 Free Brands Regular',
        'Font Awesome 5 Free Regular',
        'Font Awesome 5 Free Solid',
        'Font Awesome 5 Free Brands Regular',
        'FiraCode Nerd Font Mono',
        'nonicons',
      }

      config.warn_about_missing_glyphs = true

      config.window_background_opacity = 0.8

      config.enable_tab_bar = false

      config.keys = {
        {
          key="F3",
          mods="",
          action = wezterm.action.ActivateTabRelative(1),
        },
        # {
        #   key="F4",
        #   mods="",
        #   action = wezterm.action.SpawnTab('CurrentPaneDomain'),
        # }
      }

      -- and finally, return the configuration to wezterm
      return config
    '';
  };

}
