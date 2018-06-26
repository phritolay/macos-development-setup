if [[ $- == *i* ]]
  then
  # Path to your oh-my-zsh configuration.
  ZSH=$HOME/.oh-my-zsh

  # Set name of the theme to load.
  # Look in ~/.oh-my-zsh/themes/
  # -----------------------------------------------------------
  ZSH_THEME="robbyrussell"

  # Uncomment following line if you want red dots to be displayed while waiting for completion
  # -----------------------------------------------------------
  COMPLETION_WAITING_DOTS="true"

  # Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
  # ----------------------------------------------------------- 
  plugins=(atom bower bundler gem git git-extras heroku node npm nvm osx rails rake yarn zsh_reload)
  plugins+=(zsh-completions)

  # rbenv
  autoload -U compinit && compinit

  # nvm
  # -----------------------------------------------------------
  export NVM_NO_USE=true
  export NVM_LAZY_LOAD=true
  export NVM_AUTO_USE=true # Automatically load or install node version in .nvmrc
  plugins+=(zsh-nvm) # add Oh my ZSH! plugin for nvm

  # Load Oh My ZSH!
  # -----------------------------------------------------------
  source $ZSH/oh-my-zsh.sh

  # ZSH Aliases
  # -----------------------------------------------------------
  alias ohmyzsh="atom ~/.oh-my-zsh"
  alias zsh-reload="source $HOME/.zshrc"
  alias zshconfig="atom ~/.zshrc"

  # Local Directory Aliases
  # -----------------------------------------------------------
  alias reinstall-all-bundled-gems-and-node-packages="rm -rf .bundle node_modules && bi && yarn"
  alias reinstall-bundled-gems="rm -rf .bundle && bi"
  alias reinstall-node-packages="rm -rf node_modules && yarn"

  # Middleman Alias
  # -----------------------------------------------------------
  alias kill-middleman='ps aux | grep middleman | grep -v grep | awk '\''{print }'\'' | xargs kill -9'

  # Project Aliases
  # -----------------------------------------------------------
  # alias design-system="cd ~/Projects/ct-atomic-design-system"
  # alias next-gen="cd ~/Projects/next-gen"

  # Random Aliases
  # -----------------------------------------------------------
  alias path="echo $PATH"

  # Default editor
  # -----------------------------------------------------------
  export EDITOR="atom -w"
fi

# Disable HomeBrew Analytics
# -----------------------------------------------------------
export HOMEBREW_NO_ANALYTICS=1

# Activate zsh-completions
# -----------------------------------------------------------
fpath=(/usr/local/share/zsh-completions $fpath)

# Add Yarn to PATH
# -----------------------------------------------------------
export PATH="$PATH:`yarn global bin`"

# bundler-exec takes care of automatically pre-pending "bundle exec" to the beginning of common Ruby commands.
# https://github.com/gma/bundler-exec
# -----------------------------------------------------------
# [ -f ~/.bundler-exec.sh ] && source ~/.bundler-exec.sh

# rbenv
# -----------------------------------------------------------
eval "$(rbenv init -)"

check_for_rbenv_ruby_version() {
  if [ -f .ruby-version ]
  then
    ruby_version=$(<.ruby-version)
    echo "Found '$PWD/.ruby-version' with version <$ruby_version>"

    if rbenv versions | grep -q $ruby_version
    then
      echo "Now using ruby $ruby_version"
    else
      echo "Now installing ruby $ruby_version"
      brew update && brew upgrade ruby-build; rbenv install `cat .ruby-version`
      echo "Now using ruby $ruby_version"
    fi
  fi
}

chpwd_functions+=(check_for_rbenv_ruby_version)
check_for_rbenv_ruby_version
