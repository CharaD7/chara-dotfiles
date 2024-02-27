# set -g fish_greeting "The Quieter You Are, The More You Are Able To Listen"

# set -gx TERM xterm-256color
set -gx TERM screen-256color

# theme
set -g theme_color_scheme dracula
set -g fish_prompt_pwd_dir_length 1 # change to 1 to not see full directory length
set -g theme_display_user yes
set -g theme_hide_hostname no
set -g theme_display_user ssh
set -g theme_display_hg yes
set -g theme_display_virtualenv yes
set -g theme_hostname always
set -g fish_key_bindings fish_vi_key_bindings
set -g theme_display_git yes
set -g theme_display_git_dirty yes
set -g theme_display_git_untracked yes
set -g theme_display_git_ahead_verbose yes
set -g theme_display_git_dirty_verbose yes
set -g theme_display_git_stashed_verbose yes
set -g theme_display_git_default_branch yes
set -g theme_nerd_fonts yes


# aliases
alias ll "exa --long --header --all --git --classify --modified --created --git --icons"
alias lla "exa --long --header --all --git --classify--accessed --modified --created --git --icons"
alias llt "exa --long --header --all --git --classify --accessed --modified --created --tree --level=2 --git --icons"

alias g git
alias bat batcat
command -qv nvim &&
# alias vim nvim
alias fishprofile='neovide ~/.config/fish/config.fish'
alias nvimprofile='neovide ~/.config/nvim/init.lua'
alias tmuxprofile='neovide ~/.tmux.conf'
alias restart='source ~/.config/fish/config.fish'
alias bee='/usr/bin/Beekeeper-Studio-4.0.0.AppImage'
alias unset='set --erase'

# aliases for tmuxifier
alias tns='tmuxifier new-session'
alias tes='tmuxifier edit-session'
alias tnw='tmuxifier new-window'
alias tew='tmuxifier edit-window'
alias tls='tmuxifier load-session'
alias tlw='tmuxifier load-window'
alias tlss='tmuxifier list-sessions'
alias tlww='tmuxifier list-windows'
alias tll='tmuxifier list'

alias tda='tmux detach-client -a'


set -gx PATH '~/.tmuxifier/bin' $PATH
eval (tmuxifier init -)

set -gx EDITOR nvim

set -gx PATH bin "$PATH"
set -gx PATH ~/bin "$PATH"
set -gx PATH "~/.local/bin:$PATH"

# NodeJS
# set -gx PATH "node_modules/.bin:$PATH"
set -g NODE_JS ".npm-packages/"
set -gx PATH "$NODE_JS/bin:$PATH"

# ANDROID_SDK
set -g ANDROID_HOME "$HOME/Android/Sdk"
set -gx PATH "$ANDROID_HOME:$PATH"

set -g ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set -gx PATH "$ANDROID_SDK_ROOT:$PATH"

# ANDROID_EMULATOR
set -g ANDROID_EMULATOR "$ANDROID_HOME/emulator"
set -gx PATH "$ANDROID_EMULATOR:$PATH"

# ANDROID_PLATFORM_TOOLS
set -g ANDROID_PLATFORM_TOOLS "$ANDROID_HOME/platform-tools"
set -gx PATH "$ANDROID_PLATFORM_TOOLS:$PATH"

# JAVA_HOME
set -g JAVA_HOME "/usr/lib/jvm/java-21-openjdk-amd64/"
set -gx PATH "$JAVA_HOME:$PATH"

# sdkman
set -g SDKMAN_DIR "$HOME/.sdkman"
set -g SDKMAN_PLATFORM "$SDKMAN_DIR/var/platform"
set -gx PATH "$SDKMAN_DIR/bin:$PATH"

# Go
set -g GOPATH "$HOME/go"
set -gx PATH "$GOPATH/bin:$PATH"

# Global path
set PATH "$HOME/bin:$PATH"

# dotnet
complete -f -c dotnet -a "(dotnet complete (commandline -cp))"

# NVM
function __check_rvm --on-variable PWD --description 'Do nvm stuff'
  status --is-command-substitution; and return

  if test -f .nvmrc; and test -r .nvmrc;
    nvm use
  else
  end
end

switch (uname)
  case Darwin
    source (dirname (status --current-filename))/config-osx.fish
  case Linux
    # Do nothing
  case '*'
    source (dirname (status --current-filename))/config-windows.fish
end

set LOCAL_CONFIG (dirname (status --current-filename))/config-local.fish
if test -f "$LOCAL_CONFIG"
  source "$LOCAL_CONFIG"
end
