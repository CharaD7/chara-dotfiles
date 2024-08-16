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

alias fp "fzf-tmux -p"
alias bat "batcat"
alias bubbly "~/.local/share/bubbly/start.sh"

alias g git
command -qv nvim &&
# alias vim nvim
alias fishprofile='nohup neovide ~/.config/fish/config.fish &'
alias nvimprofile='nohup neovide ~/.config/nvim/init.lua &'
alias tmuxprofile='nohup neovide ~/.tmux.conf &'
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
set -gx PATH '~/.npm-global' $PATH
set -gx PATH "$NODE_JS/bin:$PATH"

# ANDROID_SDK
set -gx ANDROID_SDK_ROOT "$HOME/Android/Sdk"
set -gx PATH "$ANDROID_SDK_ROOT/cmdline-tools/bin:$PATH"
set -gx PATH "$ANDROID_SDK_ROOT/platform-tools:$PATH"
set -gx PATH "$ANDROID_SDK_ROOT/emulator:$PATH"

# JAVA_HOME
set -g JAVA_HOME "/usr/lib/jvm/java-17-openjdk-amd64/"
set -gx PATH "$JAVA_HOME/bin:$PATH"

# Global path
set -gx DOCKER_HOST "unix:///run/user/1000/docker.sock"
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

if test -d ~/.fzf
    source ~/.fzf/shell/completion.fish
    source ~/.fzf/shell/key-bindings.fish
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

function fish_greeting
  set_color $fish_color_autosuggestion
  echo -e "\033[1;32m🌟 Welcome to your terminal! 🌟\n\033[1;34m✨ Embrace the challenges ahead and let your creativity flow! ✨\n\033[1;33m🚀 Remember: Every command is a step towards your goals! 🚀\n"
  set_color normal
end
