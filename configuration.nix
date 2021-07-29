# Edit this configuration file to define what should be installed on 
# your system.  Help is available in the configuration.nix(5) man page 
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:


{ imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix ];

  # Use the systemd-boot EFI boot loader.
  boot.loader.systemd-boot.enable = true; 
  boot.loader.efi.canTouchEfiVariables = true;
  networking.hostName = "solo"; # Define your hostname. 
  # networking.wireless.enable = true; # Enables wireless support via 
  # wpa_supplicant.

  # Set your time zone.  time.timeZone = "Europe/Amsterdam";

  # The global useDHCP flag is deprecated, therefore explicitly set to 
  # false here. Per-interface useDHCP will be mandatory in the future, 
  # so this generated config replicates the default behaviour.
  networking.useDHCP = false; networking.interfaces.enp6s0.useDHCP = 
  true; networking.interfaces.wlp12s0f3u3.useDHCP = true; 
  networking.interfaces.wlp5s0.useDHCP = true;

  # Configure network proxy if necessary networking.proxy.default = 
  # "http://user:password@proxy:port/"; networking.proxy.noProxy = 
  # "127.0.0.1,localhost,internal.domain";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  console = {
     # font = "Lat2-Terminus16"; keyMap = "us";
     font = "RobotoMono"; keyMap = "us";
  };

  fonts.fonts = with pkgs; [
    (nerdfonts.override { fonts = [ "RobotoMono" ]; })
  ];

  # Enable the X11 windowing system.
  services.xserver.enable = true;
  services.xserver.xkbOptions = "caps:escape";

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true; 
  services.xserver.desktopManager.gnome.enable = true;
  

  # Configure keymap in X11 services.xserver.layout = "us"; 
  # services.xserver.xkbOptions = "eurosign:e";

  # Enable CUPS to print documents. services.printing.enable = true;

  # Enable sound.
  # sound.enable = true; 
  # hardware.pulseaudio.enable = true;

  hardware.opengl.driSupport32Bit = true;
  hardware.pulseaudio.support32Bit = true;

  virtualisation.docker.enable = true;

  # Enable touchpad support (enabled default in most desktopManager). 
  # services.xserver.libinput.enable = true;

  # Define a user account. Don't forget to set a password with ‘passwd’. 
  users.users.liamederzeel = {
    isNormalUser = true;
    extraGroups = [ "wheel" "docker" ]; # Enable ‘sudo’ for the user.
  };

  users.defaultUserShell = pkgs.zsh;

  nixpkgs.config.allowUnfree = true;

  nixpkgs.overlays = [
    (import (builtins.fetchTarball {
      url = https://github.com/nix-community/neovim-nightly-overlay/archive/master.tar.gz;
    }))
  ];


  # List packages installed in system profile. To search, run: $ nix 
  # search wget
  environment.systemPackages = with pkgs; [
    docker
    docker-compose
    git
    htop
    neovim
    alacritty
    fish
    wget 
    firefox
    neofetch
    spotify
    tdesktop
    steam
    lazygit
    lazydocker
    nodejs
    gnome3.gnome-tweaks
    zsh
    zsh-syntax-highlighting
    oh-my-zsh
  ];

  environment.variables.EDITOR = "nvim";
#  programs.git = {
#    enable = true;
#    userName = "Liam Ederzeel";
#    userEmail = "liamederzeel@gmail.com";
#    aliases = {
#      plog = "log --graph --abbrev-commit --decorate --format=format:'%C(bold blue)%h%C(reset) - %C(bold green)(%ar)%C(reset) %C(white)%s%C(reset) %C(dim white)- %an%C(reset)%C(bold yellow)%d%C(reset)' --all";
#    };
#
#    # BEGING diff-so-fancy config
#    extraConfig = {
#      core = {
#        pager = "diff-so-fancy | less --tabs=4 -RFX";
#      };
#      color = {
#        ui = "true";
#      };
#      "color \"diff-highlight\"" = {
#        oldnormal = "red bold";
#	oldHighlight = "red bold 52";
#	newNormal = "green bold";
#	newHighlight = "green bold 22";
#      };
#      "color \"diff\"" = {
#        meta = "yellow";
#	frag = "magenta bold";
#	commit = "yellow bold";
#	old = "red bold";
#	new = "green bold";
#	whitespace = "red reverse";
#      };
#    };
#  };
#
  programs.zsh = {
    enable = true;
    shellAliases = {
      ld = "lazydocker";
      lg = "lazygit";
      d = "docker";
      v = "nvim";
      c = "vscode";
      docs = "man configuration.nix";
    };
    enableCompletion = true;
    autosuggestions.enable = true;
    syntaxHighlighting.enable = true;
    ohMyZsh.enable = true;
    interactiveShellInit = ''
    #   # z - jump around
    #   source ${pkgs.fetchurl {url = "https://github.com/rupa/z/raw/2ebe419ae18316c5597dd5fb84b5d8595ff1dde9/z.sh"; sha256 = "0ywpgk3ksjq7g30bqbhl9znz3jh6jfg8lxnbdbaiipzgsy41vi10";}}
      export ZSH=${pkgs.oh-my-zsh}/share/oh-my-zsh
    #   export ZSH_THEME="lambda"
    #   plugins=(git)
    #   source $ZSH/oh-my-zsh.sh
      source $ZSH/plugins/git/git.plugin.zsh 
    '';
    promptInit = ''
CURRENT_BG='NONE'

# Special Powerline characters

() {
  local LC_ALL="" LC_CTYPE="en_US.UTF-8"
}

# Begin a segment
# Takes two arguments, background and foreground. Both can be omitted,
# rendering default background/foreground.
prompt_segment() {
  local bg fg
  [[ -n $1 ]] && bg="%K{''$1}" || bg="%k"
  [[ -n $2 ]] && fg="%F{''$2}" || fg="%f"
  if [[ $CURRENT_BG != 'NONE' && $1 != $CURRENT_BG ]]; then
    echo -n " %{$bg%F{''$CURRENT_BG}%}''$SEGMENT_SEPARATOR%{$fg%} "
    CURRENT_BG=$1
  else
    echo -n "%{''$bg%}%{$fg%}"
  fi
  [[ -n $3 ]] && echo -n "$3 "
}

# End the prompt, closing any open segments
prompt_end() {
  if [[ -n $CURRENT_BG ]]; then
    echo -n " %{%k%F{''$CURRENT_BG}%}''$SEGMENT_SEPARATOR"
  else
    echo -n "%{%k%}"
  fi
  echo -n "%{%f%}"
  CURRENT_BG=""
}

### Prompt components
# Each component will draw itself, and hide itself if no information needs to be shown

# Context: user@hostname (who am I and where am I)
prompt_context() {
  if [[ "''$USER" != "''$DEFAULT_USER" || -n "''$SSH_CLIENT" ]]; then
    prompt_segment NONE NONE "%(!.%{%F{yellow}%}.)''$USER@%m"
  fi
}

# Git: branch/detached head, dirty status
prompt_git() {
  (( $+commands[git] )) || return
  local PL_BRANCH_CHAR
  () {
    local LC_ALL="" LC_CTYPE="en_US.UTF-8"
    PL_BRANCH_CHAR=$''         #  
  }
  local ref dirty mode repo_path
  repo_path=$(git rev-parse --git-dir 2>/dev/null)

  if $(git rev-parse --is-inside-work-tree >/dev/null 2>&1); then
    dirty=$(parse_git_dirty)
    ref=$(git symbolic-ref HEAD 2> /dev/null) || ref="➦ $(git rev-parse --short HEAD 2> /dev/null)"
    if [[ -n $dirty ]]; then
      prompt_segment NONE yellow
    else
      prompt_segment NONE green
    fi

    if [[ -e "''${repo_path}/BISECT_LOG" ]]; then
      mode=" <B>"
    elif [[ -e "''${repo_path}/MERGE_HEAD" ]]; then
      mode=" >M<"
    elif [[ -e "''${repo_path}/rebase" || -e "''${repo_path}/rebase-apply" || -e "''${repo_path}/rebase-merge" || -e "''${repo_path}/../.dotest" ]]; then
      mode=" >R>"
    fi

    setopt promptsubst
    autoload -Uz vcs_info

    zstyle ':vcs_info:*' enable git
    zstyle ':vcs_info:*' get-revision true
    zstyle ':vcs_info:*' check-for-changes true
    zstyle ':vcs_info:*' stagedstr '✚'
    zstyle ':vcs_info:*' unstagedstr '●'
    zstyle ':vcs_info:*' formats ' %u%c'
    zstyle ':vcs_info:*' actionformats ' %u%c'
    vcs_info
    echo -n "''${ref/refs\/heads\//''$PL_BRANCH_CHAR }''${vcs_info_msg_0_%% }''${mode}"
  fi
}

prompt_bzr() {
    (( $+commands[bzr] )) || return
    if (bzr status >/dev/null 2>&1); then
        status_mod=`bzr status | head -n1 | grep "modified" | wc -m`
        status_all=`bzr status | head -n1 | wc -m`
        revision=`bzr log | head -n2 | tail -n1 | sed 's/^revno: //'`
        if [[ $status_mod -gt 0 ]] ; then
            prompt_segment yellow black
            echo -n "bzr@"$revision "✚ "
        else
            if [[ $status_all -gt 0 ]] ; then
                prompt_segment yellow black
                echo -n "bzr@"$revision

            else
                prompt_segment green black
                echo -n "bzr@"$revision
            fi
        fi
    fi
}

prompt_hg() {
  (( $+commands[hg] )) || return
  local rev status
  if $(hg id >/dev/null 2>&1); then
    if $(hg prompt >/dev/null 2>&1); then
      if [[ $(hg prompt "{status|unknown}") = "?" ]]; then
        # if files are not added
        prompt_segment red white
        st='±'
      elif [[ -n $(hg prompt "{status|modified}") ]]; then
        # if any modification
        prompt_segment yellow black
        st='±'
      else
        # if working copy is clean
        prompt_segment green black
      fi
      echo -n $(hg prompt "☿ {rev}@{branch}") $st
    else
      st=""
      rev=$(hg id -n 2>/dev/null | sed 's/[^-0-9]//g')
      branch=$(hg id -b 2>/dev/null)
      if `hg st | grep -q "^\?"`; then
        prompt_segment red black
        st='±'
      elif `hg st | grep -q "^[MA]"`; then
        prompt_segment yellow black
        st='±'
      else
        prompt_segment green black
      fi
      echo -n "☿ $rev@$branh" $st
    fi
  fi
}

# Dir: current working directory
prompt_dir() {
  prompt_segment NONE blue '%c'
}

# Virtualenv: current working virtualenv
prompt_virtualenv() {
  local virtualenv_path="$VIRTUAL_ENV"
  if [[ -n $virtualenv_path && -n $VIRTUAL_ENV_DISABLE_PROMPT ]]; then
    prompt_segment blue black "(`basename $virtualenv_path`)"
  fi
}

# Status:
# - was there an error
# - am I root
# - are there background jobs?
prompt_status() {
  local symbols
  symbols=()
  [[ $RETVAL -ne 0 ]] && symbols+="%{%F{red}%}✘"
  [[ $UID -eq 0 ]] && symbols+="%{%F{yellow}%}⚡"
  [[ $(jobs -l | wc -l) -gt 0 ]] && symbols+="%{%F{cyan}%}⚙"

  [[ -n "''$symbols" ]] && prompt_segment NONE NONE "''$symbols"
}

## Main prompt
build_prompt() {
  RETVAL=$?
  prompt_status
  prompt_virtualenv
  prompt_context
  prompt_dir
  prompt_git
  prompt_bzr
  prompt_hg
  prompt_end
}

PROMPT='%{%f%b%k%}$(build_prompt)
 '
    '';
  };


  # Some programs need SUID wrappers, can be configured further or are 
  # started in user sessions. programs.mtr.enable = true; 
  # programs.gnupg.agent = {
  #   enable = true; enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon. services.openssh.enable = true;

  # Enable the OPpenSSH server.
  services.sshd.enable = true;

  # Open ports in the firewall. networking.firewall.allowedTCPPorts = [ 
  # ... ]; networking.firewall.allowedUDPPorts = [ ... ]; Or disable the 
  # firewall altogether. networking.firewall.enable = false;

  # This value determines the NixOS release from which the default 
  # settings for stateful data, like file locations and database 
  # versions on your system were taken. It‘s perfectly fine and 
  # recommended to leave this value at the release version of the first 
  # install of this system. Before changing this value read the 
  # documentation for this option (e.g. man configuration.nix or on 
  # https://nixos.org/nixos/options.html).
  system.stateVersion = "21.05"; # Did you read the comment?
}

