export ZSH=$HOME/.config/zsh

#zmodload zsh/zprof

export GOPATH=$PROJECTS/go
export PATH="$HOME/bin:$HOME/.local/bin:/usr/local/man$GOPATH/bin:/usr/local/bin:/usr/local/sbin:$PATH"

if [[ -a ~/.localrc ]]
then
  source ~/.localrc
fi

# initialize autocomplete here, otherwise functions won't be loaded
autoload -U compinit

setopt EXTENDEDGLOB
for dump in $HOME/.zcompdump(#qN.m1); do
  compinit
  if [[ -s "$dump" && (! -s "$dump.zwc" || "$dump" -nt "$dump.zwc") ]]; then
    zcompile "$dump"
  fi
done
unsetopt EXTENDEDGLOB
compinit -C

source $ZSH/aliases.zsh
source $ZSH/completion.zsh
source $ZSH/aliases.zsh
source $ZSH/config.zsh
source $ZSH/git.zsh
source $ZSH/window.zsh

export VISUAL="vi"
export EDITOR="vi"

if type "virtualenvwrapper.sh" > /dev/null; then
  source $HOME/bin/virtualenvwrapper.sh
fi


__git_files () {
  _wanted files expl 'local files' _files
}
eval "$(starship init zsh)"

case `uname` in
  Darwin)
    export PATH="/opt/homebrew/opt/node@14/bin:$PATH"

    if [ -d "/usr/libexec/java_home" ]
	then
      xport JAVA_HOME=$(/usr/libexec/java_home)
    fi
    export ANDROID_SDK_ROOT="$HOME/Library/Android/sdk"
    export PATH=$PATH:$ANDROID_SDK_ROOT/tools/bin
    export PATH=$PATH:$ANDROID_SDK_ROOT/platform-tools
    export PATH=$PATH:$ANDROID_SDK_ROOT/emulator
    PAGER='less'
  ;;
esac

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).
eval "$(atuin init zsh)"
